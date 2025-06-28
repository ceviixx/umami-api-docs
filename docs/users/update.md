## Update user
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Update user details.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/users/:userId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| username           | string            | The user's username.                                        |                     | no       |
| password           | string            | The user's password.                                        |                     | no       |
| role               | string            | ( admin / user / view-only )                                |                     | no       |

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
  "username": "umami",
  "role": "admin",
  "createdAt": "2023-04-13T20:22:55.756Z"
}
```

---

📘 Response Structure
```json

```

