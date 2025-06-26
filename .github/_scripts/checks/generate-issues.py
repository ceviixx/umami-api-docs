import os
import json
import sys
import requests

filename = sys.argv[1] if len(sys.argv) > 1 else "tmp/docs_missing.json"

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]
REPO = os.environ["REPO"]
API_URL = f"https://api.github.com/repos/{REPO}"

HEADERS = {
    "Authorization": f"Bearer {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}

def get_all_issue_titles():
    titles = set()
    page = 1
    while True:
        r = requests.get(
            f"{API_URL}/issues",
            headers=HEADERS,
            params={"state": "all", "per_page": 100, "page": page}
        )
        r.raise_for_status()
        issues = r.json()
        if not issues:
            break
        for issue in issues:
            titles.add(issue["title"])
        page += 1
    return titles

def format_table(title, items):
    if not items:
        return ""
    table = f"\n### {title}\n| key | type | required |\n|------|------|----------|\n"
    for item in items:
        table += f"| {item.get('name', '')} | {item.get('type', '')} | {item.get('required', '')} |\n"
    return table

def format_list(title, items):
    if not items:
        return ""
    section = f"\n### {title}\n"
    for item in items:
        section += f"- `{item}`\n"
    return section

def create_issue(title, body):
    data = {
        "title": title,
        "body": body,
        "labels": ["api-endpoint"]
    }
    r = requests.post(f"{API_URL}/issues", headers=HEADERS, json=data)
    if r.status_code == 201:
        print(f"Issue created: {title}")
    else:
        print(f"Failed to create issue: {title} — {r.text}")

def main():
    with open(filename, "r") as f:
        endpoints = json.load(f)

    existing_titles = get_all_issue_titles()

    for endpoint in endpoints:
        method = endpoint["method"]
        route = endpoint["route"]
        title = f"{method} - {route}"

        if title in existing_titles:
            print(f"Skipping existing issue (open or closed): {title}")
            continue

        body = f"""**API Endpoint**

- Method: `{method}`
- Route: `{route}`
- Auth Required: {'✅' if endpoint.get('authRequired') else '❌'}
"""

        body += format_table("Request Body", endpoint.get("requestBody", []))
        body += format_table("Query Parameters", endpoint.get("queryParameters", []))
        body += format_list("Route Parameters", endpoint.get("routeParameters", []))

        create_issue(title, body)

if __name__ == "__main__":
    main()