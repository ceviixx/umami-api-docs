## Update user team role
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Update a team member's role permissions within the team.
Allows modification of user access levels with immediate effect.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/:teamId/users/:userId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| role               | string            | New team role for the user (team-member, team-view-only, team-manager) | member              | yes      |

---

### 📨 Request Body
```json
{
    "role": "member"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/users/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "role": "member"
  }'
```

---

📦 Example Response
```json
ok
```

---

📘 Response Structure
```json

```
