## Active
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets the number of active users on a website.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/active
```

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/active HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "visitors": 5
}
```
x: Number of unique visitors within the last 5 minutes

---

### 📘 Response Structure
```json
{
  "visitors": "number"
}
```
