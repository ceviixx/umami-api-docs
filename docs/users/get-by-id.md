## Get user by id
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get details about the user.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/users/:userId
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/users/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY"
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
