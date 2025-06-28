## All users for team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all users that belong to a team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/users
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
GET /api/teams/:teamId/users HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "data": [
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "role": "team-owner",
      "createdAt": "0000-00-00T00:00:00.000Z",
      "updatedAt": "0000-00-00T00:00:00.000Z",
      "user": { 
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "username": "umami" 
      }
    }
  ],
  "count": 1,
  "page": 1,
  "pageSize": 10
}
```

---

📘 Response Structure
```json

```
