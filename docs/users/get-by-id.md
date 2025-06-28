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
  "username" : "xxxxxxxxxxx",
  "id" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role" : "user",
  "createdAt" : "0000-00-00T00:00:00.000Z"
}
```

---

📘 Response Structure
```json
{
  "username" : "string",
  "id" : "string",
  "role" : "string",
  "createdAt" : "date"
}
```
