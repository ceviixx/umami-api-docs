## All websites for team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all websites that belong to a team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/websites
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| query              | string            | Search text.                                                |                     | no       |
| page               | number            | Determines page.                                            |                     | no       |
| pageSize           | string            | Determines how many results to return.                      |                     | no       |
| orderBy            | string            | Order by column name.                                       |                     | no       |

---

### 🔁 Example Request
```http
GET /api/teams/:teamId/websites HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
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

---

📘 Response Structure
```json

```
