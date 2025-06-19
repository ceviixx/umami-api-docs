## Get user websites by UserId
**GET /api/users/:userId/websites**

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
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "domain": "umami.is",
    "name": "umami",
    "shareId": null,
    "createdAt": "0000-00-00T00:00:00.000Z",
    "deletedAt": null,
    "resetAt": null,
    "updatedAt": null
  }
]
```