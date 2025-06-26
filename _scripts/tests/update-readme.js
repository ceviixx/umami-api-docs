const fs = require("fs");
const path = require("path");

const workspace = process.env.GITHUB_WORKSPACE || ".";
const readmePath = path.join(workspace, "README.md");
const issuesPath = path.join(workspace, "scripts", "issues.json");
const docsRoot = path.join(workspace, "docs");

// Load README and issues
let readme = fs.readFileSync(readmePath, "utf8");

let openIssues = [];
if (fs.existsSync(issuesPath)) {
  try {
    openIssues = JSON.parse(fs.readFileSync(issuesPath, "utf8"));
  } catch {
    console.warn("⚠️ Invalid issues.json – using empty list.");
  }
}

const normalize = str => str.toLowerCase().replace(/[^a-z0-9]/g, "");

const findMatchingIssue = (group, title) => {
  const normalizedName = normalize(`${group}/${title}`);
  return openIssues.find(issue =>
    normalize(issue.title.replace("🚨 API Failure: ", "")) === normalizedName
  );
};


const determineStatus = ({ hasValidation, isDisabled, issue }) => {
  if (isDisabled) return "⏳";

  const isOpen = issue?.state === "open";

  // 🚨 Failed with structure validation and open issue
  if (hasValidation && isOpen)
    return `🚨 [#${issue.number}](https://github.com/${process.env.GITHUB_REPOSITORY}/issues/${issue.number})`;

  // ⚠️ Status code failed without structure validation and open issue
  if (!hasValidation && isOpen)
    return `⚠️ [#${issue.number}](https://github.com/${process.env.GITHUB_REPOSITORY}/issues/${issue.number})`;

  // ✅ Passed with structure validation and no open issue
  if (hasValidation && !isOpen) return "✅";

  // ✔️ Passed without structure validation
  return "✔️";
};

const extractFromMarkdown = (content) => {
  const title = content.match(/^## (.+)$/m)?.[1]?.trim();
  const methodLine = content.match(/```http\n(\w+)/)?.[1]?.toUpperCase() || "GET";
  const routePath = content.match(/```http\n\w+\s+(\/[^\s`]+)/)?.[1] || "/";
  const description = content.match(/\*\*Description:\*\*\s*\n(.+)/)?.[1]?.trim() || "-";

  const testable = !/<!--\s*testable:\s*false\s*-->/.test(content);

  // Match the JSON block inside "📘 Response Structure"
  const validationMatch = content.match(/### 📘 Response Structure[\s\S]*?```json\s*\n([\s\S]*?)```/);
  const validationContent = validationMatch?.[1]?.trim();

  // Only consider it a valid validation block if it's non-empty and not "{}"
  const hasValidation = !!validationContent && validationContent !== "{}" && validationContent !== "";

  return {
    title,
    method: methodLine,
    route: routePath,
    description,
    testable,
    hasValidation
  };
};

// 🧩 Update tables
readme = readme.replace(/<!--table:(.*?)-->(.*?)<!--table-end-->/gs, (_, group) => {
  const groupDir = path.join(docsRoot, group);
  if (!fs.existsSync(groupDir)) return `<!--table:${group}-->\n*(directory not found)*\n<!--table-end-->`;

  const files = fs.readdirSync(groupDir)
    .filter(f => f.endsWith(".md") && f.toLowerCase() !== "index.md")
    .sort((a, b) => a.localeCompare(b));

  const rows = [];
  for (const file of files) {
    const fullPath = path.join(groupDir, file);
    const content = fs.readFileSync(fullPath, "utf8");
    const { title, route, description, testable, hasValidation } = extractFromMarkdown(content);
    if (!title || !route) continue;

    const issue = findMatchingIssue(group, title.replace(/\s+/g, ""));
    const status = determineStatus({ hasValidation, isDisabled: !testable, issue });

    const fullName = `${group}/${title.replace(/\s+/g, "")}`;
    const relPath = `docs/${group}/${file}`;

    rows.push(
      `| <!--status:${fullName}-->${status}<!--status-end--> | [${title}](${relPath}) | ${description} |`
    );
  }

  if (rows.length === 0) return `<!--table:${group}-->\n*(no endpoints)*\n<!--table-end-->`;

  const header = `| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |`;
  return `<!--table:${group}-->\n${header}\n${rows.join("\n")}\n<!--table-end-->`;
});

// 🧩 Einzelne Dateien updaten
for (const group of fs.readdirSync(docsRoot)) {
  if (group === "_parameters_") continue;

  const groupDir = path.join(docsRoot, group);
  if (!fs.lstatSync(groupDir).isDirectory()) continue;

  const files = fs.readdirSync(groupDir)
    .filter(f => f.endsWith(".md") && f.toLowerCase() !== "index.md");

  for (const file of files) {
    const fullPath = path.join(groupDir, file);
    let content = fs.readFileSync(fullPath, "utf8");

    const { title, testable, hasValidation } = extractFromMarkdown(content);
    if (!title) continue;

    const issue = findMatchingIssue(group, title.replace(/\s+/g, ""));
    const status = determineStatus({ hasValidation, isDisabled: !testable, issue });

    const statusLine = `<!--status-->${status}<!--status-end-->`;

    if (content.includes("<!--status-->")) {
      content = content.replace(/<!--status-->.*?<!--status-end-->/, statusLine);
    } else {
      content = content.replace(/^## .+$/m, match => `${match}\n${statusLine}`);
    }

    fs.writeFileSync(fullPath, content, "utf8");
  }
}

// ⏱️ Last updated
const now = new Date();
const dateTimeUtc = now.toISOString().replace("T", " ").replace(/\.\d+Z$/, " UTC");
readme = readme.replace(
  /<!--last-updated:start-->.*?<!--last-updated:end-->/s,
  `<!--last-updated:start-->\n**Last updated: ${dateTimeUtc}**\n<!--last-updated:end-->`
);

// ✅ Save updated README
fs.writeFileSync(readmePath, readme);
console.log("✅ README.md updated.");
