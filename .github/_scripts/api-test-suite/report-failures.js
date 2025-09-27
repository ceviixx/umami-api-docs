const fs = require('fs');
const path = require('path');

// Dynamic import for Octokit since it's ESM
const createOctokit = async () => {
  const { Octokit } = await import('@octokit/rest');
  return new Octokit({
    auth: process.env.GITHUB_TOKEN,
  });
};

const owner = process.env.GITHUB_REPOSITORY?.split('/')[0] || 'ceviixx';
const repo = process.env.GITHUB_REPOSITORY?.split('/')[1] || 'umami-api-docs';

// Function to find all removed endpoints from documentation
const findRemovedEndpoints = () => {
  const removedEndpoints = new Set();
  const docsRoot = './docs';
  
  if (!fs.existsSync(docsRoot)) {
    return removedEndpoints;
  }
  
  const scanDirectory = (dir) => {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    
    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      
      if (entry.isDirectory()) {
        scanDirectory(fullPath);
      } else if (entry.isFile() && entry.name.endsWith('.md')) {
        try {
          const content = fs.readFileSync(fullPath, 'utf8');
          
          // Check if endpoint is marked as removed
          if (/<!--\s*removed:\s*true\s*-->/.test(content) || /<!--\s*removed\s*-->/.test(content)) {
            const relativePath = path.relative(docsRoot, fullPath);
            const group = path.dirname(relativePath);
            const name = path.basename(relativePath, '.md');
            const failureKey = `${group}__${name}`;
            removedEndpoints.add(failureKey);
            console.log(`🛑 Found removed endpoint: ${group}/${name}`);
          }
        } catch (error) {
          console.warn(`⚠️ Could not read ${fullPath}: ${error.message}`);
        }
      }
    }
  };
  
  scanDirectory(docsRoot);
  return removedEndpoints;
};

// Helper functions for formatting from the original report-failures.js
const formatJsonBlock = (input) => {
  try {
    const parsed = JSON.parse(input);
    return JSON.stringify(parsed, null, 2);
  } catch {
    return input.trim();
  }
};

const extractSection = (lines, start, end) => {
  const startIndex = lines.findIndex(l => l.startsWith(start));
  const endIndex = lines.findIndex((l, i) => i > startIndex && l.startsWith(end));
  if (startIndex !== -1 && endIndex !== -1) {
    return lines.slice(startIndex + 1, endIndex).join('\n').trim();
  }
  if (startIndex !== -1) {
    return lines.slice(startIndex + 1).join('\n').trim();
  }
  return null;
};

const extractTypeMismatchTable = (lines) => {
  const start = lines.findIndex(l => l.trim() === 'Type mismatches:');
  if (start === -1) return null;

  const rows = [];

  for (let i = start + 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    // Split multiple errors that might be on the same line
    // Pattern: "Key 'root.hostname': Missing required key Key 'root.subdivision1': Missing required key"
    const errorPattern = /Key '[^']+': [^K]+(?=Key|$)/g;
    const matches = line.match(errorPattern);
    
    if (matches) {
      matches.forEach(match => {
        const errorText = match.trim();
        rows.push({
          error: errorText,
          value: '<empty>',
          expected: '<empty>',
        });
      });
    } else {
      // Fallback for other patterns
      const typeMismatchMatch = line.match(/^Key '(.+?)': Type mismatch\s+–\s+expected (.+?) but got(?: (.+))?$/);
      if (typeMismatchMatch) {
        rows.push({
          error: `Key '${typeMismatchMatch[1]}'`,
          value: (typeMismatchMatch[3] || '').trim() || '<empty>',
          expected: (typeMismatchMatch[2] || '').trim() || '<empty>',
        });
      } else if (line.includes('Key ')) {
        // Generic fallback for any Key-related error
        rows.push({ 
          error: line, 
          value: '<empty>', 
          expected: '<empty>' 
        });
      }
    }
  }

  if (rows.length === 0) return null;

  const header = `| Error | Response | Expected |\n|:------|:---------|:---------|`;
  const body = rows.map(r =>
    `| ${r.error.replace(/\|/g, '\\|')} | ${r.value || '<empty>'} | ${r.expected || '<empty>'} |`
  ).join('\n');

  return `${header}\n${body}`;
};

// Process a single failure file and extract structured information
const processFailureFile = (filePath) => {
  const content = fs.readFileSync(filePath, 'utf8');
  const fileName = path.basename(filePath, '.txt');
  const [group, name] = fileName.split('__');

  return {
    group,
    name,
    filePath,
    fileName,
    fullContent: content,
    // For compatibility with formatting function
    rawContent: content
  };
};

// Format issue using the enhanced formatting from original report-failures.js
const formatIssue = (failure) => {
  const lines = failure.fullContent.trim().split('\n');

  const get = (prefix) =>
    lines.find((line) => line.startsWith(prefix))?.replace(`${prefix}:`, '').trim() || '–';

  const group = failure.group;
  const name = failure.name;
  const method = get('Method');
  const route = get('Route');
  const url = get('URL');
  const expected = get('Expected Status');
  const actual = get('Actual Status');

  const requestBody = extractSection(lines, 'Request Body:', 'Response Body:');
  const responseBody = extractSection(lines, 'Response Body:', 'Expected Body (types):');
  const expectedBody = extractSection(lines, 'Expected Body (types):', 'Type mismatches:') || extractSection(lines, 'Expected Body (types):', '');
  const mismatchTable = extractTypeMismatchTable(lines);

  // Extract and format URL parameters
  let urlParamsSection = '';
  if (url && url.includes('?')) {
    const [baseUrl, paramsString] = url.split('?');
    const params = new URLSearchParams(paramsString);
    const relevantParams = [];
    
    // Show relevant parameters (use original values, including pre-masked sensitive data)
    for (const [key, value] of params) {
      if (['startDate', 'endDate', 'startAt', 'endAt', 'limit', 'offset', 'type', 'unit', 'timezone', 'websiteId'].includes(key)) {
        // Show as-is, including pre-masked websiteId (********-****-****-************)
        relevantParams.push({ param: key, value: value });
      } else {
        // Show other parameters but potentially redact sensitive-looking ones that aren't pre-masked
        const isLongId = value.length > 20 && /^[a-f0-9-]+$/i.test(value);
        relevantParams.push({ param: key, value: isLongId ? '[REDACTED]' : value });
      }
    }
    
    if (relevantParams.length > 0) {
      urlParamsSection = `<details>
<summary>URL Parameters</summary>

| Parameter | Value |
|-----------|-------|
${relevantParams.map(p => `| \`${p.param}\` | \`${p.value}\` |`).join('\n')}
</details>

`;
    }
  }

  let body = `**Group:** \`${group}\`  
**Name:** \`${name}\`  
**Method:** \`${method}\`  
**Route:** \`${route}\`  
**Expected Status:** \`${expected}\`  
**Actual Status:** \`${actual}\`

${urlParamsSection}`;

  if (requestBody) {
    body += `<details>
<summary>Request body</summary>

\`\`\`json
${formatJsonBlock(requestBody)}
\`\`\`
</details>\n\n`;
  }

  body += `<details>
<summary>Response Body</summary>

\`\`\`json
${formatJsonBlock(responseBody || '')}
\`\`\`
</details>\n\n`;

  if (expectedBody && expectedBody.trim() && expectedBody !== '{}') {
    body += `<details>
<summary>Expected Body (types)</summary>

\`\`\`json
${formatJsonBlock(expectedBody)}
\`\`\`
</details>\n\n`;
  }

  if (mismatchTable) {
    body += `<details>
<summary>Type mismatches</summary>

${mismatchTable}
</details>\n`;
  }

  return body.trim();
};

// Create or update a GitHub issue for a test failure
const createOrUpdateIssue = async (octokit, failure, testType) => {
  try {
    // Use simple format without emoji for cleaner issue titles
    const issueTitle = `API Failure: ${failure.group}/${failure.name}`;
    
    // Format issue body using enhanced formatting
    const formattedBody = formatIssue(failure);
    
    // Get all issues to find existing one
    const allIssues = await octokit.rest.issues.listForRepo({
      owner,
      repo,
      state: 'all'
    });

    const existingIssue = allIssues.data.find(issue => issue.title === issueTitle);
    const labels = ['api-test', failure.group.toLowerCase().replace(/[^a-z0-9\-]/g, '-')];

    if (existingIssue) {
      if (existingIssue.state === 'open') {
        // Add comment with latest test run details
        const currentDate = new Date().toISOString().split('T')[0]; // YYYY-MM-DD format
        const currentTime = new Date().toISOString().split('T')[1].split('.')[0]; // HH:MM:SS format
        
        await octokit.rest.issues.createComment({
          owner,
          repo,
          issue_number: existingIssue.number,
          body: `🔁 This issue is still failing in the latest test run (${currentDate} ${currentTime} UTC):\n\n${formattedBody}`
        });
        console.log(`🔄 Added comment to existing open issue #${existingIssue.number}: ${issueTitle}`);
      } else {
        // Reopen closed issue and add comment
        const currentDate = new Date().toISOString().split('T')[0]; // YYYY-MM-DD format
        const currentTime = new Date().toISOString().split('T')[1].split('.')[0]; // HH:MM:SS format
        
        await octokit.rest.issues.update({
          owner,
          repo,
          issue_number: existingIssue.number,
          state: 'open',
          labels
        });
        await octokit.rest.issues.createComment({
          owner,
          repo,
          issue_number: existingIssue.number,
          body: `♻️ Reopened – this issue is failing again in the latest test run (${currentDate} ${currentTime} UTC):\n\n${formattedBody}`
        });
        console.log(`� Reopened closed issue #${existingIssue.number}: ${issueTitle}`);
      }
      return existingIssue;
    } else {
      // Create new issue
      const newIssue = await octokit.rest.issues.create({
        owner,
        repo,
        title: issueTitle,
        body: formattedBody,
        labels
      });
      
      console.log(`✨ Created new issue #${newIssue.data.number}: ${issueTitle}`);
      return newIssue.data;
    }
  } catch (error) {
    console.error(`❌ Error managing issue for ${failure.group}/${failure.name}:`, error.message);
    return null;
  }
};

// Close issues for endpoints that have been marked as removed
const closeRemovedEndpointIssues = async (octokit, removedEndpoints) => {
  try {
    // Get all open issues with api-test label
    const allIssues = await octokit.rest.issues.listForRepo({
      owner,
      repo,
      state: 'open'
    });

    const apiTestIssues = allIssues.data.filter(issue => 
      issue.labels.some(label => label.name === 'api-test') || 
      issue.title.startsWith('🚨 API Failure:') ||
      issue.title.startsWith('API Failure:')
    );

    const issuesToClose = [];

    for (const issue of apiTestIssues) {
      let failureKey = null;
      let groupName = '';
      let endpointName = '';
      
      // Extract endpoint from different title formats
      if (issue.title.startsWith('🚨 API Failure:')) {
        const titleMatch = issue.title.match(/🚨 API Failure: (.+)\/(.+)$/);
        if (titleMatch) {
          groupName = titleMatch[1];
          endpointName = titleMatch[2];
          failureKey = `${groupName.toLowerCase()}__${endpointName}`;
        }
      } else if (issue.title.startsWith('API Failure:')) {
        const titleMatch = issue.title.match(/API Failure: (.+)\/(.+)$/);
        if (titleMatch) {
          groupName = titleMatch[1];
          endpointName = titleMatch[2];
          failureKey = `${groupName.toLowerCase()}__${endpointName}`;
        }
      }
      
      // If this endpoint is marked as removed, close the issue
      if (failureKey && removedEndpoints.has(failureKey)) {
        issuesToClose.push({
          number: issue.number,
          title: issue.title,
          failureKey,
          groupName,
          endpointName
        });
      }
    }

    // Close removed endpoint issues
    for (const issue of issuesToClose) {
      const lastSeen = new Date().toISOString().replace("T", " ").replace(/\.\d+Z$/, " UTC");
      
      const docLink = issue.groupName && issue.endpointName ? 
        `\n📖 **Documentation:** [${issue.groupName}/${issue.endpointName}](../blob/main/docs/${issue.groupName.toLowerCase()}/${issue.endpointName}.md)` : '';
      
      await octokit.rest.issues.createComment({
        owner,
        repo,
        issue_number: issue.number,
        body: `🛑 **This endpoint has been removed from the API**

The endpoint \`${issue.groupName}/${issue.endpointName}\` has been marked as removed in the documentation as of ${lastSeen}.

**What this means:**
- The endpoint is no longer available in the API
- This endpoint has been deprecated and should not be used
- The endpoint will no longer be tested in future test runs${docLink}

**Next steps:**
- This issue will be closed automatically
- The endpoint will be excluded from future API tests
- If you need this functionality, please check the documentation for alternative endpoints

*This is an automated message from the API testing system.*`
      });

      await octokit.rest.issues.update({
        owner,
        repo,
        issue_number: issue.number,
        state: 'closed'
      });
      
      console.log(`🛑 Closed issue for removed endpoint #${issue.number}: ${issue.failureKey}`);
    }

    if (issuesToClose.length > 0) {
      console.log(`🗑️  Auto-closed ${issuesToClose.length} issues for removed endpoints`);
    }

  } catch (error) {
    console.error('❌ Error closing removed endpoint issues:', error.message);
  }
};

// Close issues that are no longer failing
const closeResolvedIssues = async (octokit, currentFailures) => {
  try {
    // Get all open issues with api-test label or that start with "🚨 API Failure:"
    const allIssues = await octokit.rest.issues.listForRepo({
      owner,
      repo,
      state: 'open'
    });

    const apiTestIssues = allIssues.data.filter(issue => 
      issue.labels.some(label => label.name === 'api-test') || 
      issue.title.startsWith('🚨 API Failure:') ||
      issue.title.startsWith('API Failure:')
    );

    const issuesToClose = [];

    for (const issue of apiTestIssues) {
      let failureKey = null;
      
      // Extract endpoint from different title formats
      if (issue.title.startsWith('🚨 API Failure:')) {
        const titleMatch = issue.title.match(/🚨 API Failure: (.+)\/(.+)$/);
        if (titleMatch) {
          const group = titleMatch[1].toLowerCase();
          const name = titleMatch[2];
          failureKey = `${group}__${name}`;
        }
      } else if (issue.title.startsWith('API Failure:')) {
        const titleMatch = issue.title.match(/API Failure: (.+)\/(.+)$/);
        if (titleMatch) {
          const group = titleMatch[1].toLowerCase();
          const name = titleMatch[2];
          failureKey = `${group}__${name}`;
        }
      } else if (issue.title.startsWith('API Test Failed:')) {
        const titleMatch = issue.title.match(/API Test Failed: (.+)$/);
        if (titleMatch) {
          const endpoint = titleMatch[1];
          failureKey = endpoint.replace('/', '__');
        }
      }
      
      // If this endpoint is not in current failures, close the issue
      if (failureKey && !currentFailures.has(failureKey)) {
        issuesToClose.push({
          number: issue.number,
          title: issue.title,
          failureKey
        });
      }
    }

    // Close resolved issues
    for (const issue of issuesToClose) {
      const lastSeen = new Date().toISOString().replace("T", " ").replace(/\.\d+Z$/, " UTC");
      
      // Extract group and name from issue for documentation link
      let docLink = '';
      let groupName = '';
      let endpointName = '';
      
      if (issue.title.includes('/')) {
        const titleParts = issue.title.split(': ')[1]; // Get part after "API Failure: "
        if (titleParts && titleParts.includes('/')) {
          [groupName, endpointName] = titleParts.split('/');
          docLink = `\n📖 **Documentation:** [${groupName}/${endpointName}](../blob/main/docs/${groupName}/${endpointName}.md)`;
        }
      }
      
      await octokit.rest.issues.createComment({
        owner,
        repo,
        issue_number: issue.number,
        body: `✅ **This issue has been resolved!**

The test is now passing successfully as of ${lastSeen}.

**What this means:**
- The endpoint is responding correctly
- All expected response fields are present
- Response status codes match expectations
- Body structure validation passes${docLink}

**Next steps:**
- This issue will be closed automatically
- The endpoint will continue to be monitored in future test runs
- If the issue reoccurs, this issue will be automatically reopened

*This is an automated message from the API testing system.*`
      });

      await octokit.rest.issues.update({
        owner,
        repo,
        issue_number: issue.number,
        state: 'closed'
      });
      
      console.log(`✅ Closed resolved issue #${issue.number}: ${issue.failureKey}`);
    }

    if (issuesToClose.length > 0) {
      console.log(`🎯 Auto-closed ${issuesToClose.length} resolved issues`);
    } else {
      console.log(`ℹ️  No issues to auto-close`);
    }

  } catch (error) {
    console.error('❌ Error closing resolved issues:', error.message);
  }
};

const main = async () => {
  const octokit = await createOctokit();
  
  const allFailuresDir = './all-failures';
  
  const allFailures = new Set();
  const createdIssues = [];

  // In GitHub Actions, failures are always in artifacts under all-failures/
  if (fs.existsSync(allFailuresDir)) {
    console.log(`📁 Processing artifacts from all-failures directory`);
    
    // Process orchestrated test failures (now called crud-failures)
    const orchestratedDirs = fs.readdirSync(allFailuresDir)
      .filter(dir => dir.startsWith('orchestrated-failures-') || dir.startsWith('crud-failures-'))
      .map(dir => path.join(allFailuresDir, dir))
      .filter(dir => fs.existsSync(dir));

    console.log(`🔄 Found ${orchestratedDirs.length} CRUD failure artifact directories`);

    for (const failureDir of orchestratedDirs) {
      const failureFiles = fs.readdirSync(failureDir).filter(f => f.endsWith('.txt'));
      console.log(`📄 Processing ${failureFiles.length} failure files from ${path.basename(failureDir)}`);
      
      for (const file of failureFiles) {
        const filePath = path.join(failureDir, file);
        const failure = processFailureFile(filePath);
        const failureKey = `${failure.group}__${failure.name}`;
        
        if (!allFailures.has(failureKey)) {
          allFailures.add(failureKey);
          
          const issue = await createOrUpdateIssue(octokit, failure, 'orchestrated');
          if (issue) {
            createdIssues.push(issue);
          }
        }
      }
    }

    // Process compatible test failures (now called compat-failures)
    const compatibleDirs = fs.readdirSync(allFailuresDir)
      .filter(dir => dir.startsWith('original-failures-') || dir.startsWith('compat-failures-'))
      .map(dir => path.join(allFailuresDir, dir))
      .filter(dir => fs.existsSync(dir));

    console.log(`🔗 Found ${compatibleDirs.length} compatibility failure artifact directories`);

    for (const failureDir of compatibleDirs) {
      const failureFiles = fs.readdirSync(failureDir).filter(f => f.endsWith('.txt'));
      console.log(`📄 Processing ${failureFiles.length} failure files from ${path.basename(failureDir)}`);
      
      for (const file of failureFiles) {
        const filePath = path.join(failureDir, file);
        const failure = processFailureFile(filePath);
        const failureKey = `${failure.group}__${failure.name}`;
        
        if (!allFailures.has(failureKey)) {
          allFailures.add(failureKey);
          
          const issue = await createOrUpdateIssue(octokit, failure, 'compatible');
          if (issue) {
            createdIssues.push(issue);
          }
        }
      }
    }
  } else {
    console.log(`⚠️  No artifacts directory found at ${allFailuresDir}`);
    console.log(`🔍 This might indicate that no test failures occurred or artifacts weren't uploaded correctly`);
  }

  // Check for removed endpoints and close their issues
  console.log(`🛑 Checking for removed endpoints`);
  const removedEndpoints = findRemovedEndpoints();
  if (removedEndpoints.size > 0) {
    await closeRemovedEndpointIssues(octokit, removedEndpoints);
  }

  // ALWAYS close resolved issues (whether failures exist or not)
  console.log(`🔍 Checking for resolved issues (current failures: ${allFailures.size})`);
  await closeResolvedIssues(octokit, allFailures);

  // Save issues for README update (export all open issues, including newly created ones)
  const exportDir = path.join(process.cwd(), 'scripts');
  fs.mkdirSync(exportDir, { recursive: true });

  const openNow = await octokit.rest.issues.listForRepo({ 
    owner, 
    repo, 
    state: 'open' 
  });
  let openData = openNow.data || [];

  // Add newly created issues to the list if they're not already included
  // (to handle API lag where new issues might not immediately appear in listForRepo)
  for (const newIssue of createdIssues) {
    if (newIssue && !openData.find(issue => issue.number === newIssue.number)) {
      console.log(`📌 Adding newly created issue #${newIssue.number} to export (API lag mitigation)`);
      openData.push(newIssue);
    }
  }

  fs.writeFileSync(
    path.join(exportDir, 'issues.json'),
    JSON.stringify(openData, null, 2)
  );

  console.log(`\n📊 Summary:`);
  console.log(`💥 Total failures processed: ${allFailures.size}`);
  console.log(`📝 Issues created/updated: ${createdIssues.length}`);
  console.log(`💾 Exported ${openData.length} open issues to scripts/issues.json`);
  console.log(`🏷️  All issues use unified API failure format`);
  
  if (allFailures.size === 0) {
    console.log(`✅ No failures found - this could mean:`);
    console.log(`   • All tests passed successfully`);
    console.log(`   • Test failures weren't uploaded as artifacts`);
    console.log(`   • Artifact processing failed`);
  }
};

main().catch(console.error);