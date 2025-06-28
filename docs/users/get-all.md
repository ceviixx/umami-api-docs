## Get all users
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all users on your account.

**Latest status:** <!--status-->⏳<!--status-end-->

> [!NOTE]  
> Admin access is required.

```
GET /api/admin/users
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/admin/users \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

📦 Example Response
```json
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "admin",
    "role": "admin",
    "createdAt": "0000-00-00T00:00:00.000Z"
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "guest",
    "role": "view-only",
    "createdAt": "0000-00-00T00:00:00.000Z"
  }
]
```

---

📘 Response Structure
```json

```
