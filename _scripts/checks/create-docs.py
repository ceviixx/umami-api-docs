import os
import json
import re

input_file = "_scripts/checks/docs_missing.json"
output_base = "docs"
base_url = "https://api.umami.is/v1"

def make_filename(method, route):
    clean_route = route.replace("/api/", "")
    parts = clean_route.strip("/").split("/")
    folder = os.path.join(output_base, *parts[:-1]) if len(parts) > 1 else output_base
    os.makedirs(folder, exist_ok=True)
    last = parts[-1].replace(":", "").lower()
    filename = f"{method.lower()}-{last}.md"
    return os.path.join(folder, filename)

def generate_custom_markdown(entry):
    parts = entry["route"].strip("/").split("/")
    title = " ".join([p for p in parts if not p.startswith(":")]).replace("-", " ").capitalize().replace("Api ", "")
    method = entry["method"].upper()
    route = entry["route"]

    markdown = []

    markdown.append(f"## {title}")
    markdown.append("<!-- testable: false -->")
    markdown.append("<!-- expectedStatus: 200 -->")
    markdown.append("**Description:**  \nPlease add an description.\n")
    markdown.append("**Latest check:** <!--status--><!--status-end-->\n")

    markdown.append("```")
    markdown.append(f"{method} {route}")
    markdown.append("```\n---\n")

    if entry.get("queryParameters"):
        markdown.append("### 🔍 Query Parameters")
        markdown.append("| Name | Type | Description | Example | Required |")
        markdown.append("|------|------|-------------|---------|----------|")
        for param in entry["queryParameters"]:
            markdown.append(f"| {param['name']} | {param['type']} |  | example | {'yes' if param['required'] == 'yes' else 'no'} |")
        markdown.append("\n---\n")

    if entry.get("requestBody"):
        markdown.append("### 📩 Request Body Parameters")
        markdown.append("| Name | Type | Description | Example | Required |")
        markdown.append("|------|------|-------------|---------|----------|")
        for param in entry["requestBody"]:
            name = param["name"]
            typ = param["type"]
            example = "1234567890000" if typ == "coerce" else "example"
            markdown.append(f"| {name} | {'number' if typ == 'coerce' else typ} |  | {example} | {'yes' if param['required'] == 'yes' else 'no'} |")
        markdown.append("\n---\n")

    markdown.append("### 🔁 Example Request")
    markdown.append("```bash")

    api_path = route.replace("/api", "")
    full_url = f"{base_url}{api_path}"

    if method == "GET" and entry.get("queryParameters"):
        required_query = [p for p in entry["queryParameters"] if p.get("required") == "yes"]
        if required_query:
            pairs = [f"{p['name']}=1234567890000" if p["type"] == "coerce" else f"{p['name']}=example" for p in required_query]
            full_url += "?" + "&".join(pairs)

    curl_lines = [f'curl -X {method} "{full_url}"']
    if entry.get("authRequired"):
        curl_lines.append('-H "x-umami-api-key: {YOUR_API_KEY}"')

    body = {}
    if method != "GET" and entry.get("requestBody"):
        for p in entry["requestBody"]:
            if p["required"] == "yes":
                value = 1234567890000 if p["type"] == "coerce" else "example"
                body[p["name"]] = value
        if body:
            curl_lines.append('-H "Content-Type: application/json"')
            curl_lines.append(f"-d '{json.dumps(body)}'")

    markdown.append(" \\\n  ".join(curl_lines))
    markdown.append("```\n---\n")

    example = entry.get("exampleResponse", {})
    markdown.append("### 📦 Example Response")
    markdown.append("```json")
    if example:
        markdown.append(json.dumps(example, indent=2))
    markdown.append("```\n\n---\n")

    markdown.append("### 📘 Response Structure")
    markdown.append("```json")
    if isinstance(example, list) and example:
        structure = [{k: "number" if isinstance(v, (int, float)) else type(v).__name__ for k, v in example[0].items()}]
        markdown.append(json.dumps(structure, indent=2))
    elif isinstance(example, dict) and example:
        structure = {k: "number" if isinstance(v, (int, float)) else type(v).__name__ for k, v in example.items()}
        markdown.append(json.dumps(structure, indent=2))
    markdown.append("```")

    return "\n".join(markdown)

with open(input_file, "r", encoding="utf-8") as f:
    json_data = json.load(f)

for entry in json_data:
    filepath = make_filename(entry["method"], entry["route"])
    markdown = generate_custom_markdown(entry)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(markdown)

print(f"✅ {len(json_data)} Markdown-Dateien wurden im Ordner '{output_base}/' erstellt.")
