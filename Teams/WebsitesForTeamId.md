## Get all websites that belong to a team.
**GET /api/teams/:teamId/websites**

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
    "name": "umami",
    "domain": "umami.is",
    "shareId": "C36MKJqBlRT9UQgq",
    "resetAt": "0000-00-00T00:00:00.000Z",
    "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "createdAt": "0000-00-00T00:00:00.000Z",
    "updatedAt": "0000-00-00T00:00:00.000Z",
    "deletedAt": null,
    "teamWebsite": [
      {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "createdAt": "0000-00-00T00:00:00.000Z",
        "team": {
          "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
          "name": "marketing",
          "accessCode": "4bwY3JoHUXcKUiMP",
          "createdAt": "0000-00-00T00:00:00.000Z",
          "updatedAt": "0000-00-00T00:00:00.000Z",
          "teamUser": [
            {
              "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
              "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
              "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
              "role": "team-owner",
              "createdAt": "0000-00-00T00:00:00.000Z",
              "updatedAt": null
            }
          ]
        }
      }
    ],
    "user": { 
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "username": "admin@me.com"
    }
  }
]
```