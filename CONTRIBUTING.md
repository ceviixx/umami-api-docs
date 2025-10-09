# Contributing to Umami API Documentation

Thank you for your interest in contributing to the Umami Analytics API documentation! This guide will help you understand how to contribute effectively.

## Overview

The **README.md file is automatically generated** from the `/docs` folder structure and updates whenever you add or modify documentation files. This contributing guide helps you understand how to add new endpoints effectively.

## Quick Start

1. **Navigate to `/docs`** - All API documentation lives here
2. **Edit or create `.md` files** - Follow the template structure
3. **Use the template** - Always base new endpoints on `template.md`
4. **Auto-update** - README.md regenerates automatically via GitHub Actions

## Documentation Template

### For New Endpoints

When creating documentation for new API endpoints, **always use** the template provided in:

```
template.md
```

This template includes all required sections:

- **Description** - Clear explanation of the endpoint's purpose
- **Latest Status** - Current implementation status
- **Query Parameters** - URL parameters with types and examples  
- **Request Body** - POST/PUT data structure
- **Example Request** - Working curl/HTTP examples
- **Example Response** - Real response data
- **Response Structure** - Detailed response schema

### Template Usage

1. **Copy the template**:
   ```bash
   cp template.md docs/your-section/your-endpoint.md
   ```

2. **Fill out all sections** - Don't leave empty placeholders

3. **Use real examples** - Provide working code and actual response data

4. **Follow naming conventions**:
   - Files: `kebab-case.md` (e.g., `get-all.md`, `create-user.md`)
   - Endpoints: Use descriptive names matching the API

## Folder Structure

Organize documentation following this pattern:

```
docs/
├── websites/
│   ├── traffic/
│   │   ├── active.md
│   │   ├── daterange.md
│   │   └── breakdown/
│   │       └── breakdown.md
│   └── audience/
│       ├── cohorts/
│       └── segments/
├── settings/
│   ├── teams/
│   └── website/
├── links/
└── pixels/
```

## Quality Standards

### Complete Documentation Criteria

The automated system marks documentation as "complete" when it contains:

- ✅ **Real API endpoints** (`GET /`, `POST /`, etc.)
- ✅ **JSON examples** (multiple ````json` blocks)
- ✅ **Parameter documentation** (query params, request body)
- ✅ **Substantial content** (> 500 characters)

### Incomplete Documentation Indicators

Documentation is marked as "incomplete" if it contains:

- ❌ Empty or template placeholders
- ❌ Only boilerplate text
- ❌ Missing examples or API endpoints
- ❌ Generic parameter tables without real data

## Automatic Updates

### README Generation

The README.md file is automatically generated and includes:

- **Documentation Status Legend** explaining completion indicators
- **Table of Contents** with hierarchical structure
- **API Sections** with direct links to all documentation files

### GitHub Actions

Documentation updates trigger automatic README regeneration via:
- `.github/workflows/documentation-update.yml`

## 📝 Writing Guidelines

### 1. Be Specific and Accurate
- Use actual API URLs and endpoints
- Provide real authentication examples
- Include working curl commands

### 2. Complete Examples
```bash
# Good ✅
curl -H "x-umami-api-key: xxxxxxx" \
     -H "Content-Type: application/json" \
     -d '{"name": "My Website", "domain": "example.com"}' \
     https://umami.example.com/api/websites

# Bad ❌
curl [endpoint] [parameters]
```

### 3. Real Response Data
```json
// Good ✅
{
  "data": {
    "id": "cm2a1234567890",
    "name": "My Website",
    "domain": "example.com",
    "shareId": "abc123def456"
  }
}

// Bad ❌
{
  "data": { ... }
}
```

### 4. Parameter Documentation
| Name | Type | Description | Example | Required |
|:-----|:-----|:------------|:--------|:--------:|
| `websiteId` | string | Unique website identifier | `"cm2a1234567890"` | ✅ |
| `startAt` | number | Unix timestamp start | `1633024800000` | ❌ |

## Common Issues

### Documentation Not Marked as Complete?

Check if your documentation includes:
- [ ] Real API endpoint paths (`/api/websites`, not just `/endpoint`)
- [ ] Multiple JSON code blocks with actual data
- [ ] Parameter tables with real examples
- [ ] Sufficient content length (avoid minimal templates)

### Links Not Working?

- Ensure file paths match the actual file structure
- Use relative paths: `/docs/section/endpoint.md`
- Follow kebab-case naming for files

## Automated System

### How It Works

1. **Scanning** - Script analyzes all `.md` files in `/docs`
2. **Content Analysis** - Checks for completion indicators
3. **README Generation** - Creates comprehensive overview
4. **GitHub Actions** - Automatically commits updates

### Manual README Update

If needed, regenerate the README manually:

```bash
python3 .github/generate_readme.py
```

## Getting Help

- **Check existing documentation** in `/docs` for examples
- **Review the template** at `template.md`
- **Open an issue** for questions or suggestions
- **Contact maintainers** for major changes

## Current Status

The documentation system automatically tracks:
- Total API endpoints documented
- Completion percentage by section
- Progress indicators for each area
- Direct links to incomplete documentation

---

<div align="center">

**Goal: Complete, accurate, and helpful API documentation**

*Together we can build the best Umami Analytics API documentation!*

</div>