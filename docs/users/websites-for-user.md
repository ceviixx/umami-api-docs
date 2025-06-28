## 
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get user websites by user id.

**Latest status:** <!--status--><!--status-end-->

```
GET /api/users/:userId/websites
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
GET /api/users/:userId/websites HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
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

---

📘 Response Structure
```json

```
