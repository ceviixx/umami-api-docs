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
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "Umami",
    "domain": "umami.is",
    "shareId": null,
    "resetAt": null,
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
    "createdAt": "0000-00-00T00:00:00.000Z",
    "updatedAt": null,
    "deletedAt": null
  }
]
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
      "deletedAt": "string|null"
    }
  ]
}
```
