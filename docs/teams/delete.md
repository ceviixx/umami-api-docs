## Delete team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Permanently delete a team and remove all associated memberships.
Revokes team access to all shared websites and cannot be undone.

**Latest status:** <!--status-->⏳<!--status-end-->

```
DELETE /api/teams/:teamId
```

---

### 🔁 Example Request
```bash
curl -X DELETE https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
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
