const fs = require('fs');
const path = require('path');
const { Octokit } = require('@octokit/rest');

const token = process.env.GITHUB_TOKEN;
const [owner, repo] = process.env.GITHUB_REPOSITORY.split('/');
const octokit = new Octokit({ auth: token });

// Format JSON content into indented blocks or return raw if invalid
const formatJsonBlock = (input) => {
  try {
    const parsed = JSON.parse(input);
    return JSON.stringify(parsed, null, 2);
  } catch {
    return input.trim();
  }
};

// Extract a section of lines between given start and end markers
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

// Parse and format the "Type mismatches" section into a Markdown table
const extractTypeMismatchTable = (lines) => {
  const start = lines.findIndex(l => l.trim() === 'Type mismatches:');
  if (start === -1) return null;

  const rows = [];

  for (let i = start + 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    const match = line.match(/^Key '(.+?)': Type mismatch\s+–\s+expected (.+?) but got(?: (.+))?$/);
    if (match) {
      rows.push({
        error: `Key '${match[1]}'`,
        value: (match[3] || '').trim() || '<empty>',
        expected: (match[2] || '').trim() || '<empty>',
      });
    } else {
      rows.push({
        error: line,
        value: '',
        expected: '',
      });
    }
  }

  if (rows.length === 0) return null;

  const header = `| Error | Response | Expected |\n|:------|:---------|:---------|`;
  const body = rows.map(r =>
    `| ${r.error.replace(/\|/g, '\\|')} | ${r.value || '<empty>'} | ${r.expected || '<empty>'} |`
  ).join('\n');

  return `${header}\n${body}`;
};

// Format the issue body for GitHub
const formatIssue = (raw) => {
  const lines = raw.trim().split('\n');

  const get = (prefix) =>
    lines.find((line) => line.startsWith(prefix))?.replace(`${prefix}:`, '').trim() || '–';

  const group = get('Group');
  const name = get('Name');
  const method = get('Method');
  const route = get('Route');
  const expected = get('Expected Status');
  const actual = get('Actual Status');

  const requestBody = extractSection(lines, 'Request Body:', 'Response Body:');
  const responseBody = extractSection(lines, 'Response Body:', 'Expected Body (types):');
  const expectedBody = extractSection(lines, 'Expected Body (types):', 'Type mismatches:') || extractSection(lines, 'Expected Body (types):', '');
  const mismatchTable = extractTypeMismatchTable(lines);

  return `\
**Group:** \`${group}\`  
**Name:** \`${name}\`
**Method:** \`${method}\`  
**Route:** \`${route}\`  
**Expected Status:** \`${expected}\`  
**Actual Status:** \`${actual}\`

${requestBody ? `<details>
<summary>Request body</summary>

\`\`\`json
${formatJsonBlock(requestBody)}
\`\`\`
</details>

` : ''}<details>
<summary>Response Body (showing first item from 'data' array)</summary>

\`\`\`json
${formatJsonBlock(responseBody || '')}
\`\`\`
</details>

<details>
<summary>Expected Body (types)</summary>

\`\`\`json
${formatJsonBlock(expectedBody || '')}
\`\`\`
</details>

${mismatchTable ? `<details>
<summary>Type mismatches</summary>

${mismatchTable}
</details>` : ''}`;
};

(async () => {
  const failuresRoot = path.join(process.env.GITHUB_WORKSPACE, 'all-failures');
  const hasFailures = fs.existsSync(failuresRoot);

  // Fetch all issues (open + closed)
  const allIssues = await octokit.issues.listForRepo({ owner, repo, state: 'all' });
  const currentFailureTitles = new Set();

  // Process new failures and create/update issues
  if (hasFailures) {
    const getTitle = (content) => {
      const nameLine = content.split('\n').find(l => l.startsWith('Name:'));
      const groupLine = content.split('\n').find(l => l.startsWith('Group:'));
      if (!nameLine || !groupLine) return null;
      const name = nameLine.replace('Name: ', '').trim();
      const group = groupLine.replace('Group: ', '').trim();
      const groupFormatted = group.charAt(0).toUpperCase() + group.slice(1);
      return `🚨 API Failure: ${groupFormatted}/${name}`;
    };

    const groups = fs.readdirSync(failuresRoot);
    for (const group of groups) {
      const dir = path.join(failuresRoot, group);
      const files = fs.readdirSync(dir);
      for (const file of files) {
        const content = fs.readFileSync(path.join(dir, file), 'utf8');
        const title = getTitle(content);
        if (!title) continue;

        currentFailureTitles.add(title);
        const formattedBody = formatIssue(content);
        const existing = allIssues.data.find(issue => issue.title === title);
        const labels = ['api-failure', group.toLowerCase().replace(/[^a-z0-9\-]/g, '-')];

        if (existing) {
          if (existing.state === 'open') {
            await octokit.issues.createComment({
              owner, repo,
              issue_number: existing.number,
              body: `🔁 This issue is still failing in the latest test run:\n\n${formattedBody}`
            });
          } else {
            await octokit.issues.update({
              owner, repo,
              issue_number: existing.number,
              state: 'open'
            });
            await octokit.issues.createComment({
              owner, repo,
              issue_number: existing.number,
              body: `♻️ Reopened – this issue is failing again in the latest test run:\n\n${formattedBody}`
            });
          }
          continue;
        }

        await octokit.issues.create({
          owner, repo,
          title,
          body: formattedBody,
          labels
        });
      }
    }
  }

  // Close previously open issues that are no longer failing
  for (const issue of allIssues.data) {
    if (!issue.title.startsWith("🚨 API Failure:")) continue;
    if (issue.state !== 'open') continue;
    if (currentFailureTitles.has(issue.title)) continue;

    const lastSeen = new Date().toISOString().replace("T", " ").replace(/\.\d+Z$/, " UTC");

    await octokit.issues.createComment({
      owner, repo,
      issue_number: issue.number,
      body: `✅ This issue is no longer failing in the latest test run (${lastSeen}) and will be closed automatically.`
    });

    await octokit.issues.update({
      owner, repo,
      issue_number: issue.number,
      state: 'closed'
    });
  }

  // Export all currently open issues to issues.json
  const exportDir = path.join(process.env.GITHUB_WORKSPACE, 'scripts');
  fs.mkdirSync(exportDir, { recursive: true });

  const openNow = await octokit.issues.listForRepo({ owner, repo, state: 'open' });
  const openData = openNow.data || [];

  fs.writeFileSync(
    path.join(exportDir, 'issues.json'),
    JSON.stringify(openData, null, 2)
  );

  console.log(`✅ Exported ${openData.length} open issues to scripts/issues.json`);
})();