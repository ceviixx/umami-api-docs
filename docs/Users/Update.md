## Update user
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Update user details.

**Latest check:** <!--status-->⏳<!--status-end-->

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
```http
POST /api/users/:userId HTTP/1.1
x-umami-api-key: {api-key}
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

