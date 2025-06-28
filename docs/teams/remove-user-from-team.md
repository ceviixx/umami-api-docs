## Remove user from team.
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Removes the user from the team.

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
