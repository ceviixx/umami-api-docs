## Get user teams by UserId
**GET /api/users/:userId/teams**

**Parameters**
- query (optional string) Search text.
- page (optional number, default 1) Determines page.
- pageSize (optional string) Determines how many results to return.
- orderBy (optional string, default name) Order by column name.

---

**Sample response**
```json
[
  {
    "id": "02d89813-7a72-41e1-87f0-8d668f85008b",
    "name": "My Team",
    "createdAt": "2023-04-10T23:06:44.250Z",
    "deletedAt": null,
    "updatedAt": null
  }
]
```