## Delete user
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Permanently delete a user account from the system.
Removes user and permissions but preserves analytics data.

**Latest status:** <!--status-->⏳<!--status-end-->

```
DELETE /api/users/:userId
```

---

### 🔁 Example Request
```bash
curl -X DELETE https://api.umami.is/v1/users/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
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
