## Login
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Authenticate user with username and password to obtain access token.
Returns JWT token for subsequent API requests requiring authentication.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/auth/login
```
---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| username           | string            | User's unique username or email address for authentication | your-username       | yes      |
| password           | string            | User's password for authentication (transmitted securely over HTTPS) | your-password       | yes      |

---

### 📨 Request Body
```json
{
  "username": "your-username",
  "password": "your-password"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://your-umami-instance.com/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "your-username",
    "password": "your-password"
  }'
```

---

### 📦 Example Response
```json
{
  "token": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  "user": {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "your-username",
    "createdAt": "0000-00-00 00:00:00"
  }
}
```

---

### 📘 Response Structure
```json

```