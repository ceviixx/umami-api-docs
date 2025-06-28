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
```bash
curl -X GET https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/active \
  -H "x-umami-api-key: YOUR_API_KEY"
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
