## Teams from user
<!-- testable: false -->
<!-- expectedStatus: false -->
**Description:**  
Get user teams by user id.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/users/:userId/teams
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
GET /api/users/:userId/teams HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
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

---

📘 Response Structure
```json

```
