## Returns all tracked websites.
**GET /api/websites**

**Parameters**
- query: (optional string) Search text.
- page: (optional number, default 1) Determines page.
- pageSize: (optional string) Determines how many results to return.
- orderBy: (optional string, default name) Order by column name.

---

**Sample response**
```json
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Umami",
    "domain": "umami.is",
    "shareId": null,
    "resetAt": null,
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "createdAt": "0000-00-00T00:00:00.000Z",
    "updatedAt": null,
    "deletedAt": null
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Example",
    "domain": "example.com",
    "shareId": null,
    "resetAt": null,
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "createdAt": "0000-00-00T00:00:00.000Z",
    "updatedAt": null,
    "deletedAt": null
  }
]
```