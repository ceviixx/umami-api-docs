## Get all websites
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Returns all tracked websites.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites
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
GET /api/websites HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
    "data": [
        {
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "name": "Example",
            "domain": "example.com",
            "shareId": null,
            "resetAt": null,
            "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "teamId": null,
            "createdBy": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "createdAt": "0000-00-00T00:00:00.000Z",
            "updatedAt": "0000-00-00T00:00:00.000Z",
            "deletedAt": null,
            "user": {
                "username": "xxxxxxx@xxxx.xxxx",
                "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            }
        },
        {
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "name": "Example",
            "domain": "example.com",
            "shareId": null,
            "resetAt": null,
            "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "teamId": null,
            "createdBy": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "createdAt": "0000-00-00T00:00:00.000Z",
            "updatedAt": "0000-00-00T00:00:00.000Z",
            "deletedAt": null,
            "user": {
                "username": "xxxxxxx@xxxx.xxxx",
                "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
            }
        },
    ],
    "count": 2,
    "page": 1,
    "pageSize": 10,
    "orderBy": "name"
}


```

---

### 📘 Response Structure
```json
{
  "data": [
    {
      "id": "string",
      "name": "string",
      "domain": "string",
      "shareId": "string|null",
      "resetAt": "string|null",
      "userId": "string",
      "createdAt": "string",
      "updatedAt": "string|null",
      "deletedAt": "string|null",
      "user": {
        "username": "string",
        "id": "string"
      }
    }
  ]
}
```
