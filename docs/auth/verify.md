## Verify
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Verify the token is valid.

**Latest status:** <!--status--><!--status-end-->

```
POST /api/auth/verify
```
---

### 🔁 Example Request
```bash
curl -X POST https://your-umami-instance.com/api/auth/verify \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer your-token"
```

---

### 📦 Example Response
```json
{
  "username" : "admin",
  "id" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "isAdmin" : true,
  "role" : "admin",
  "createdAt" : "0000-00-00T00:4300:00.000Z"
}
```

---

### 📘 Response Structure
```json

```