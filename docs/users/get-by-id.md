## Get user by id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get detailed information for a specific user by their unique identifier.
Returns user metadata including username, role, and account creation timestamp.

**Latest status:** <!--status-->🚨 [#42](https://github.com/ceviixx/umami-api-docs/issues/42)<!--status-end-->

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
