## All websites for team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of all websites associated with a specific team.
Provides team website access information including domain details and sharing settings.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/websites
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| query              | string            | Search filter to find websites by name or domain           |                     | no       |
| page               | number            | Page number for pagination (starts from 1)                 |                     | no       |
| pageSize           | string            | Number of websites to return per page (pagination limit)   |                     | no       |
| orderBy            | string            | Column name for sorting results (e.g., name, domain, createdAt) |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/websites \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "query=" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=25" \
  --data-urlencode "orderBy=name"
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
