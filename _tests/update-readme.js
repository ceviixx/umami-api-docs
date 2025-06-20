const fs = require("fs");
const path = require("path");

const workspace = process.env.GITHUB_WORKSPACE || ".";
const readmePath = path.join(workspace, "README.md");
const issuesPath = path.join(workspace, "scripts", "issues.json");
const endpointsPath = path.join(workspace, "_tests", "endpoints.json");

// Load the current README
let readme = fs.readFileSync(readmePath, "utf8");

// Load open issues
let openIssues = [];
if (fs.existsSync(issuesPath)) {
  const issuesRaw = fs.readFileSync(issuesPath, "utf8");
  try {
    openIssues = JSON.parse(issuesRaw);
  } catch (err) {
    console.warn("⚠️ issues.json exists but is not valid JSON. Using empty issue list.");
    openIssues = [];
  }
} else {
  console.warn("⚠️ No issues.json found or empty – treating as no open issues.");
}

// Load endpoints.json
const endpointData = JSON.parse(fs.readFileSync(endpointsPath, "utf8"));

// Extract and format all endpoint names and test info
const allEndpoints = [];
for (const [group, endpoints] of Object.entries(endpointData)) {
  for (const endpoint of endpoints) {
    const name = `${group.charAt(0).toUpperCase() + group.slice(1)}/${endpoint.name}`;
    const testPlanned = endpoint.testing !== false;
    const hasExpectedBody = endpoint.expectedBody !== undefined;
    allEndpoints.push({ name, testPlanned, hasExpectedBody });
  }
}

// Build status map
const statusMap = new Map();

// 1. Assign 🚨 to endpoints with open issues
for (const issue of openIssues) {
  const match = issue.title.match(/API Failure: (.+)/);
  if (!match) continue;
  const name = match[1].trim();
  const label = `🚨 [#${issue.number}](https://github.com/${process.env.GITHUB_REPOSITORY}/issues/${issue.number})`;
  statusMap.set(name, label);
}

// 2. Assign ✅, ⚠️, or ⏳ to remaining endpoints
for (const { name, testPlanned, hasExpectedBody } of allEndpoints) {
  if (!statusMap.has(name)) {
    if (testPlanned) {
      statusMap.set(name, hasExpectedBody ? "✅" : "⚠️"); // ⚠️ = Status code only
    } else {
      statusMap.set(name, "⏳"); // Not yet planned
    }
  }
}

// Replace status comments in README
readme = readme.replace(/<!--status:(.*?)-->(.*?)<!--status-end-->/gs, (_, mdPath) => {
  const title = mdPath.replace(".md", "").trim();
  const status = statusMap.get(title) || "⏳";
  return `<!--status:${mdPath}-->${status}<!--status-end-->`;
});

// Update last-updated timestamp
const now = new Date();
const isoDate = now.toISOString();
const dateTimeUtc = isoDate.replace("T", " ").replace(/\.\d+Z$/, " UTC");

readme = readme.replace(
  /<!--last-updated:start-->.*?<!--last-updated:end-->/s,
  `<!--last-updated:start-->\n**Last updated: ${dateTimeUtc}**\n<!--last-updated:end-->`
);

// Save updated README
fs.writeFileSync(readmePath, readme);