import os
import re
import json
import shutil
import zipfile
import tempfile
import requests

def debug(*args): print("🛠", *args)

def download_and_extract_latest_release(repo_url):
    api_url = f"https://api.github.com/repos/{repo_url}/releases/latest"
    debug("🔽 Lade Release-Metadaten...")
    resp = requests.get(api_url)
    data = resp.json()
    zip_url = next((a["browser_download_url"] for a in data.get("assets", []) if a["name"].endswith(".zip")), None) \
              or data.get("zipball_url")
    temp_zip = tempfile.mktemp(suffix=".zip")
    temp_dir = tempfile.mkdtemp()
    debug("⬇️ Herunterladen...")
    with requests.get(zip_url, stream=True) as r, open(temp_zip, "wb") as f:
        for chunk in r.iter_content(8192): f.write(chunk)
    debug("📂 Entpacken...")
    with zipfile.ZipFile(temp_zip, "r") as z: z.extractall(temp_dir)
    os.remove(temp_zip)
    root = next(os.scandir(temp_dir)).path
    debug("✅ Verzeichnis:", root)
    return root

def extract_zod_fields(text):
    fields, required = [], set()
    for m in re.finditer(r'(\w+)\s*:\s*z\..+?\.optional\(', text):
        required.add(m.group(1))
    for name, typ, param, regex in re.findall(r'(\w+):\s*z\.(\w+)(?:\(([^)]*)\))?(?:\.regex\(/([^/]+)/[a-z]*\))?', text):
        entry = {"name": name, "type": typ, "required": "no" if name in required else "yes"}
        if regex: entry["options"] = regex.split("|")
        elif param and "uuid" in param: entry["format"] = "uuid"
        fields.append(entry)
    return fields

def extract_example_from_queries(query_files_dir, fn_name):
    for root, _, files in os.walk(query_files_dir):
        for f in files:
            path = os.path.join(root, f)
            text = open(path, encoding="utf-8").read()
            if re.search(rf'export\s+async\s+function\s+{fn_name}\b', text):
                if "Promise<" in text:
                    m = re.search(r'Promise<([^>]+)>', text)
                    if m:
                        t = m.group(1)
                        return {} if t.strip().endswith("[]") else {}
                return {}
    return None

repo = "umami-software/umami"
docs = "./docs"
qd = download_and_extract_latest_release(repo)
api_dir = os.path.join(qd, "src", "app", "api")

docs_exist, docs_missing = [], []
seen, documented = set(), set()

for r, _, fs in os.walk(docs):
    for f in fs:
        if f.endswith(".md"):
            for m, rt in re.findall(r"(GET|POST|PUT|DELETE|PATCH)\s+(/api[^\s`]+)", open(os.path.join(r,f)).read()):
                documented.add((m, rt))

query_root = os.path.join(qd, "src", "queries")

for r, _, fs in os.walk(api_dir):
    for f in fs:
        if not f.endswith(".ts"): continue
        path = os.path.join(r, f)
        rel = os.path.relpath(r, api_dir).replace("\\","/")
        route = "/api/" + re.sub(r"\[(\w+)\]", r":\1", (rel if f in ("index.ts","route.ts") else rel + "/" + f[:-3]))
        code = open(path, encoding="utf-8").read()
        auth = bool(re.search(r'\bcan[A-Z]\w+\(', code))
        body = extract_zod_fields(code) if "schema" in code else []
        qps = [{"name": qp, "type":"string","required":"yes"} for qp in {
            *re.findall(r'searchParams\.get\(["\'](\w+)["\']', code)}]
        for method in re.findall(r"export\s+async\s+function\s+(\w+)\(", code):
            mtd = method.upper()
            key = (mtd, route)
            if key in seen: continue
            seen.add(key)
            example = None
            for fun in re.findall(r'import\s*{\s*([^}]+)\s*}\s*from\s*[\'"]@/queries', code):
                for fn in [x.strip() for x in fun.split(",")]:
                    ex = extract_example_from_queries(query_root, fn)
                    if ex is not None:
                        example = ex
                        break
            entry = {"method":mtd,"route":route,"routeParameters":re.findall(r":(\w+)",route),
                     "queryParameters": qps, "requestBody":body,
                     "authRequired":auth}
            if example is not None:
                entry["exampleResponse"] = example
            (docs_exist if key in documented else docs_missing).append(entry)

os.makedirs("tmp", exist_ok=True)
open("tmp/docs_exists.json","w", encoding="utf-8").write(json.dumps(docs_exist,indent=2))
open("tmp/docs_missing.json","w", encoding="utf-8").write(json.dumps(docs_missing,indent=2))
shutil.rmtree(qd)
debug("✅ Fertig!")
