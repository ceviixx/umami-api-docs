# Contributing Guide

Thanks for helping improve the **Umami API Docs**! Every contribution that cleans up and completes the OpenAPI spec is welcome. This project aims to provide a clean, community-maintained API reference.

> **Scope:** Please change **only the API spec** (the `openapi/` files). Do **not** modify badges, workflows, website configs, or unrelated files.

---

## What to work on

- **Complete missing or incomplete endpoints.**
- **Add or improve operation/field descriptions.**  
  Many places are intentionally left with a placeholder like `description: TBD`. Replace these with clear, complete English descriptions. Avoid empty values and placeholders such as `null`, or `-`.
  
  See the **“Endpoints not complete”** section in the root `README.md` — it links directly to the lines that need work.
- **Extend responses** where applicable, especially **`400`** and **`405`** use cases (validation errors, method not allowed), with schemas and examples.

---

## Local setup & validation

1. Install dependencies:
   ```bash
   npm install
   ```
2. Lint the spec before committing:
   ```bash
   npm run test
   ```
   This runs Redocly lint. The PR will also run this check automatically as a fallback; PRs with lint errors cannot be merged.

> Tip: Keep runs fast by focusing on the files you changed and committing incrementally.


---

## Descriptions (how to write and where to add)

- **Replace placeholders:** Search for `description: x` and replace them with meaningful text. Do not leave `description:` empty and do not use `null` or `TBD`.
- **Level of detail:** One or two short sentences are usually enough. Explain *what* the operation/field is for and any constraints that are not obvious from the schema.
- **Tone & language:** English, concise, and consistent with the rest of the document.
- **Where to add:**
  - **Operations:** Under each HTTP method (e.g., `paths./resource.get.description`).
  - **Parameters:** Each parameter (`name`, `in`, `required`) should have a `description` explaining format, examples, and semantics.
  - **Schemas & properties:** Add `description` to component schemas and their properties where helpful.
- **Validation:** The linter requires descriptions to be strings. Empty or `null` values (e.g., `description:` with nothing after it) will fail the lint check.


---

## Style & structure guidelines

Please follow these conventions to keep the spec consistent:

- **Descriptions:** Must be non-empty, short, and precise. Avoid “TBD” or `null`.
- **Operation IDs:** Use lowerCamelCase and make them unique per operation (e.g., `getWebsiteById`, `listEvents`).
- **Tags:** Prefer existing tags; only add new ones if absolutely necessary.
- **Parameters:** Document `in`, `name`, `required`, and a clear `description`. Provide `schema` with `type/format` and examples.
- **Request bodies:** Include `content: application/json` with a proper `schema` and a minimal `example`.
- **Responses:** Always include `content` with `schema` and at least one example.
  - **200 / 201:** Add realistic examples.
  - **400 (Bad Request):** Use this for validation errors or bad input.
  - **405 (Method Not Allowed):** Add when an HTTP verb is unsupported.
- **Schemas:** Reuse components in `components/schemas` where possible. Prefer `object` with explicit `properties`, `required`, and types.
- **Examples:** Favor small but realistic, redacted data. Avoid secrets or PII.

---

## How to contribute (workflow)

1. **Create a branch** from `main` (e.g., `feat/complete-sessions-properties`).
2. Make focused changes **only in `openapi/`**.
3. Run:
   ```bash
   npm run test
   ```
   Fix any linting errors.
4. **Commit** with a clear message (e.g., `docs(api): add 400/405 and examples for /websites/{id}/active`).
5. **Open a Pull Request**:
   - Title: short & descriptive.
   - Description: list what you completed (endpoints, responses, examples).
   - Link to the items from **“Endpoints not complete”** you addressed.
6. The PR will:
   - Run the lint job and annotate problems inline.
   - Post a compact lint report comment if issues are found.
   - **Block merging** until the lint check passes.

---

## Review checklist (before you submit)

- [ ] Only `openapi/` files changed.
- [ ] All operations/parameters/schemas have non-empty `description` where applicable (placeholders like `description: x` replaced).
- [ ] `200/201` responses include `schema` **and** example(s).
- [ ] Added/validated **`400`** and **`405`** where relevant.
- [ ] No unused components/schemas.
- [ ] `npm run test` passes locally.

---

## Questions

If you’re unsure about structure, examples, or where to add 400/405, open a draft PR or start a discussion. We’d rather help early than request large reworks later. Thanks for contributing!
