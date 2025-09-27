## Remove user from team.
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Remove a user from a team, revoking their access to team-shared websites.
Immediately terminates user's team membership and cannot be undone.

**Latest status:** <!--status-->⏳<!--status-end-->

```
DELETE /api/teams/:teamId/users/:userId
```

---

### 🔁 Example Request
```bash
curl -X DELETE https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/users/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy \
  -H "x-umami-api-key: YOUR_API_KEY"
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
