## All users for team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of all users belonging to a specific team.
Provides comprehensive team membership information including user details and roles.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/users
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| query              | string            | Search filter to find users by username or other attributes |                     | no       |
| page               | number            | Page number for pagination (starts from 1)                 |                     | no       |
| pageSize           | string            | Number of users to return per page (pagination limit)      |                     | no       |
| orderBy            | string            | Column name for sorting results (e.g., username, role, createdAt) |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/users \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "query=" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=25" \
  --data-urlencode "orderBy=name"
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
