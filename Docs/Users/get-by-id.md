## Get user by id
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get details about the user.

**Latest check:** <!--status-->⏳<!--status-end-->

```
GET /api/users/:userId
```

---

### 🔁 Example Request
```http
GET /api/users/:userId HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "id": "1a457e1a-121a-11ee-be56-0242ac120002",
  "username": "umami",
  "role": "admin"
}
```

---

📘 Response Structure
```json

```
