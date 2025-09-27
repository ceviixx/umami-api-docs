## Update user
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Update an existing user's account details including username, password, and role.
All parameters are optional, allowing partial updates of user information.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /api/users/:userId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| username           | string            | New username for the user account (must be unique if provided) | max_muster                    | yes       |
| password           | string            | New password for the user account (security requirements apply) |                     | no       |
| role               | string            | Updated user role defining access permissions (admin, user, view-only) |                     | no       |

---

### 📨 Request Body
```json
{
  "username": "admin",
  "password": "umami",
  "role": "admin"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/users/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "username": "admin",
    "password": "umami",
    "role": "admin"
  }'
```

---

📦 Example Response
```json
{
  "id": "1a457e1a-121a-11ee-be56-0242ac120002",
  "username": "admin",
  "role": "admin",
  "createdAt": "2023-04-13T20:22:55.756Z"
}
```

---

📘 Response Structure
```json
{
  "id": "string",
  "username": "string",
  "role": "string",
  "createdAt": "date"
}
```

