const fs = require("fs");
const path = require("path");

const workspace = process.env.GITHUB_WORKSPACE || ".";
const readmePath = path.join(workspace, "README.md");
const issuesPath = path.join(workspace, "scripts", "issues.json");
const docsRoot = path.join(workspace, "docs");
const failuresDir = path.join(workspace, "failures"); // Direct failures from enhanced script
const allFailuresDir = path.join(workspace, "all-failures"); // Legacy failures from original workflow

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

// Load CRUD configuration to know which endpoints are orchestrated
const crudConfigPath = path.join(workspace, ".github/_scripts/api-test-suite/crud-mapping.json");
let crudConfig = { crud_groups: {}, standalone_endpoints: [] };
if (fs.existsSync(crudConfigPath)) {
  try {
    crudConfig = JSON.parse(fs.readFileSync(crudConfigPath, "utf8"));
  } catch {
    console.warn("⚠️ Invalid crud-mapping.json – using empty config.");
  }
}

const normalize = str => str.toLowerCase().replace(/[^a-z0-9]/g, "");

const findMatchingIssue = (group, title) => {
  const normalizedName = normalize(`${group}/${title}`);
  
  return openIssues.find(issue => {
    // Try all API failure formats
    const apiFailureFormat = normalize(issue.title.replace("🚨 API Failure: ", ""));
    const apiFailureNewFormat = normalize(issue.title.replace("API Failure: ", ""));
    const apiTestFailedFormat = normalize(issue.title.replace("API Test Failed: ", ""));
    
    // Also try with capitalized group name for legacy compatibility
    const groupCapitalized = group.charAt(0).toUpperCase() + group.slice(1);
    const normalizedCapitalized = normalize(`${groupCapitalized}/${title}`);
    
    return apiFailureFormat === normalizedName || 
           apiFailureFormat === normalizedCapitalized ||
           apiFailureNewFormat === normalizedName || 
           apiFailureNewFormat === normalizedCapitalized ||
           apiTestFailedFormat === normalizedName || 
           apiTestFailedFormat === normalizedCapitalized;
  });
};

// Check if a specific endpoint failed in orchestrated tests
const checkOrchestratedFailure = (group, fileName) => {
  // Check for direct failure files from enhanced test script
  const expectedFailureName = `${group}__${fileName}.txt`;
  const directFailurePath = path.join(failuresDir, expectedFailureName);
  
  // Debug output for failure detection
  console.log(`🔍 Checking failure for ${group}/${fileName}:`);
  console.log(`   Expected failure file: ${expectedFailureName}`);
  console.log(`   Direct path: ${directFailurePath} (exists: ${fs.existsSync(directFailurePath)})`);
  console.log(`   All failures dir: ${allFailuresDir} (exists: ${fs.existsSync(allFailuresDir)})`);
  
  if (fs.existsSync(directFailurePath)) {
    console.log(`   ✅ Found direct failure file`);
    return "orchestrated";
  }
  
  // Legacy support: Look for orchestrated failure files in subdirs
  if (!fs.existsSync(allFailuresDir)) return null;
  
  const orchestratedFailureDirs = fs.readdirSync(allFailuresDir)
    .filter(dir => dir.startsWith("orchestrated-failures-") || dir.startsWith("crud-failures-"));
  
  console.log(`   📁 Found ${orchestratedFailureDirs.length} orchestrated failure directories:`, orchestratedFailureDirs);
  
  for (const failureDir of orchestratedFailureDirs) {
    const failureDirPath = path.join(allFailuresDir, failureDir);
    if (!fs.existsSync(failureDirPath)) continue;
    
    const failureFiles = fs.readdirSync(failureDirPath)
      .filter(f => f.endsWith(".txt"));
    
    console.log(`   📄 ${failureDir} contains ${failureFiles.length} files:`, failureFiles);
    
    if (failureFiles.includes(expectedFailureName)) {
      console.log(`   ✅ Found failure file in ${failureDir}`);
      return "orchestrated";
    }
  }
  
  // Check for original test failures
  const originalFailureDirs = fs.readdirSync(allFailuresDir)
    .filter(dir => dir.startsWith("original-failures-") || dir.startsWith("compat-failures-"));
  
  console.log(`   📁 Found ${originalFailureDirs.length} compatibility failure directories:`, originalFailureDirs);
  
  for (const failureDir of originalFailureDirs) {
    const failureDirPath = path.join(allFailuresDir, failureDir);
    if (!fs.existsSync(failureDirPath)) continue;
    
    const failureFiles = fs.readdirSync(failureDirPath)
      .filter(f => f.endsWith(".txt"));
    
    console.log(`   📄 ${failureDir} contains ${failureFiles.length} files:`, failureFiles);
    
    if (failureFiles.includes(expectedFailureName)) {
      console.log(`   ✅ Found failure file in ${failureDir}`);
      return "original";
    }
  }
  
  console.log(`   ❌ No failure file found for ${expectedFailureName}`);
  return null;
};

// Check if an endpoint is part of CRUD orchestration
const isOrchestratedEndpoint = (group, fileName) => {
  const endpointPath = `docs/${group}/${fileName}`;
  
  // Check if it's in a CRUD group
  for (const [crudGroup, config] of Object.entries(crudConfig.crud_groups)) {
    for (const [operation, filePath] of Object.entries(config)) {
      if (operation === 'id_field' || operation === 'id_extraction_path' || operation === 'use_static_website_id' || operation === 'id_dependencies') continue;
      if (filePath === endpointPath) {
        return { type: 'crud', group: crudGroup, operation };
      }
    }
  }
  
  // Check if it's a standalone endpoint
  if (crudConfig.standalone_endpoints.includes(endpointPath)) {
    return { type: 'standalone' };
  }
  
  return null;
};

const determineStatus = ({ hasValidation, isDisabled, isRemoved, issue, group, fileName }) => {
  // Highest priority: if endpoint is marked as removed
  if (isRemoved) return "🛑";
  
  // Second priority: if endpoint is disabled/not testable
  if (isDisabled) return "⏳";

  const isOpen = issue?.state === "open";
  // Remove .md extension for failure check
  const baseFileName = fileName.replace('.md', '');
  const failureType = checkOrchestratedFailure(group, baseFileName);
  
  console.log(`   🔍 [${group}/${baseFileName}] Failure check result: ${failureType}`);
  
  // Check if any test failed (orchestrated or original)
  const hasFailed = failureType === 'orchestrated' || failureType === 'original';
  
  if (hasFailed) {
    // Test failed - link to issue if available (open or closed)
    const repo = process.env.GITHUB_REPOSITORY || "ceviixx/umami-api-tests-v2";
    if (issue) {
      if (hasValidation) {
        return `🚨 [#${issue.number}](https://github.com/${repo}/issues/${issue.number})`;
      } else {
        return `⚠️ [#${issue.number}](https://github.com/${repo}/issues/${issue.number})`;
      }
    }
    // Failed but no issue found
    return hasValidation ? "🚨" : "⚠️";
  }

  // Test passed
  if (hasValidation) {
    return "✅"; // Test passed – valid response and structure
  } else {
    return "✔️"; // Test passed – valid response, no structure check available
  }
};

const extractFromMarkdown = (content) => {
  const title = content.match(/^## (.+)$/m)?.[1]?.trim();
  const methodLine = content.match(/```http\n(\w+)/)?.[1]?.toUpperCase() || 
                     content.match(/^(GET|POST|PUT|DELETE|PATCH)\s+/m)?.[1]?.toUpperCase() || "GET";
  const routePath = content.match(/```http\n\w+\s+(\/[^\s`]+)/)?.[1] || 
                    content.match(/^(?:GET|POST|PUT|DELETE|PATCH)\s+(\/[^\s]+)/m)?.[1] || "/";
  const description = content.match(/\*\*Description:\*\*\s*\n(.+)/)?.[1]?.trim() || "-";

  const testable = !/<!--\s*testable:\s*false\s*-->/.test(content);
  const removed = /<!--\s*removed:\s*true\s*-->/.test(content) || /<!--\s*removed\s*-->/.test(content);

  // Match the JSON block inside "📘 Response Structure"
  const validationMatch = content.match(/(?:###\s*)?📘 Response Structure[\s\S]*?```json\s*\n([\s\S]*?)```/);
  const validationContent = validationMatch?.[1]?.trim();

  // Only consider it a valid validation block if it's non-empty and not "{}"
  const hasValidation = !!validationContent && validationContent !== "{}" && validationContent !== "";

  return {
    title,
    method: methodLine,
    route: routePath,
    description,
    testable,
    removed,
    hasValidation
  };
};

// 🧩 Update tables
readme = readme.replace(/<!--table:(.*?)-->(.*?)<!--table-end-->/gs, (_, group) => {
  const groupDir = path.join(docsRoot, group);
  if (!fs.existsSync(groupDir)) return `<!--table:${group}-->\n*(There are currently no requests available.)*\n<!--table-end-->`;

  const files = fs.readdirSync(groupDir)
    .filter(f => f.endsWith(".md") && f.toLowerCase() !== "index.md")
    .sort((a, b) => a.localeCompare(b));

  const rows = [];
  for (const file of files) {
    const fullPath = path.join(groupDir, file);
    const content = fs.readFileSync(fullPath, "utf8");
    const { title, route, description, testable, removed, hasValidation } = extractFromMarkdown(content);
    if (!title || !route) continue;

    const issue = findMatchingIssue(group, file.replace('.md', ''));
    const status = determineStatus({ hasValidation, isDisabled: !testable, isRemoved: removed, issue, group, fileName: file });

    const fullName = `${group}/${title.replace(/\s+/g, "")}`;
    const relPath = `docs/${group}/${file}`;
    


    rows.push(
      `| <!--status:${fullName}-->${status}<!--status-end--> | [${title}](${relPath}) | ${description} |`
    );
  }

  if (rows.length === 0) return `<!--table:${group}-->\n*(no endpoints)*\n<!--table-end-->`;

  const header = `| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |`;
  return `<!--table:${group}-->\n${header}\n${rows.join("\n")}\n<!--table-end-->`;
});

// 🧩 Update single files
for (const group of fs.readdirSync(docsRoot)) {
  if (group === "_parameters_") continue;

  const groupDir = path.join(docsRoot, group);
  if (!fs.lstatSync(groupDir).isDirectory()) continue;

  const files = fs.readdirSync(groupDir)
    .filter(f => f.endsWith(".md") && f.toLowerCase() !== "index.md");

  for (const file of files) {
    const fullPath = path.join(groupDir, file);
    let content = fs.readFileSync(fullPath, "utf8");

    const { title, testable, removed, hasValidation } = extractFromMarkdown(content);
    if (!title) {
      console.log(`⚠️  Skipping ${group}/${file} - no title found`);
      continue;
    }

    console.log(`📄 Processing ${group}/${file}:`);
    console.log(`   Title: "${title}"`);
    console.log(`   Testable: ${testable}`);
    console.log(`   Removed: ${removed}`);
    console.log(`   HasValidation: ${hasValidation}`);

    const issue = findMatchingIssue(group, file.replace('.md', ''));
    console.log(`   Issue found: ${issue ? `#${issue.number} (${issue.state})` : 'none'}`);
    
    const status = determineStatus({ hasValidation, isDisabled: !testable, isRemoved: removed, issue, group, fileName: file });
    console.log(`   Final status: "${status}"`);

    const statusLine = `<!--status-->${status}<!--status-end-->`;
    console.log(`   Status line: "${statusLine}"`);

    if (content.includes("<!--status-->")) {
      console.log(`   ✏️  Replacing existing status marker`);
      content = content.replace(/<!--status-->.*?<!--status-end-->/, statusLine);
    } else {
      console.log(`   ➕ Adding new status marker after title`);
      content = content.replace(/^## .+$/m, match => `${match}\n${statusLine}`);
    }

    try {
      fs.writeFileSync(fullPath, content, "utf8");
      
      // Verify the status was written
      const verifyContent = fs.readFileSync(fullPath, "utf8");
      if (verifyContent.includes(statusLine)) {
        console.log(`   ✅ Updated ${group}/${file} (verified)`);
      } else {
        console.error(`   ❌ Status marker not found after writing to ${group}/${file}`);
        process.exit(1);
      }
    } catch (error) {
      console.error(`   ❌ Failed to update ${group}/${file}: ${error.message}`);
      process.exit(1);
    }
  }
}

// ✅ Save updated README
fs.writeFileSync(readmePath, readme);
console.log("✅ README.md updated with test status.");

// 📊 Summary with dynamic endpoint counting
const calculateEndpointCount = () => {
  let crudCount = 0;
  let standaloneCount = crudConfig.standalone_endpoints.length;

  // Count CRUD endpoints (exclude metadata fields)
  for (const [groupName, config] of Object.entries(crudConfig.crud_groups)) {
    for (const [operation, filePath] of Object.entries(config)) {
      if (operation !== 'id_field' && operation !== 'id_extraction_path' && operation !== 'use_static_website_id' && operation !== 'id_dependencies') {
        crudCount++;
      }
    }
  }

  return {
    crud: crudCount,
    standalone: standaloneCount,
    total: crudCount + standaloneCount
  };
};

const endpointStats = calculateEndpointCount();
console.log("\n📊 Summary:");
console.log(`- README.md: ✅ Updated`);
console.log(`- Individual markdown files: ✅ All processed and verified`);
console.log(`- CRUD endpoints: ${endpointStats.crud}`);
console.log(`- Standalone endpoints: ${endpointStats.standalone}`);
console.log(`- Total endpoints: ${endpointStats.total}`);

// Force flush output
process.stdout.write('');