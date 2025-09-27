## Add a user to a team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Add a specific user to a team with defined role permissions.
Allows direct user invitation by ID, bypassing access code process.


**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/:teamId/users
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| userId             | string            | Unique identifier of the user to add to the team           | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes      |
| role               | string            | Team role for the new member (team-member, team-view-only, team-manager) | team-member         | yes      |

---

### 📨 Request Body
```json
{
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/users \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "userId": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy",
    "role": "team-member"
  }'
```

---

📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z"
}
```

---

📘 Response Structure
```json

```
