## Shared 
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get auth data for shared website.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/share/:shareId
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/share/xxxxxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
  "token" : "xxxxxxxxxxxxxxx",
  "websiteId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

---

### 📘 Response Structure
```json
{
  "token" : "string",
  "websiteId" : "string"
}
```
