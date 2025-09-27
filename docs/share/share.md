## Shared 
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get authentication data for accessing a shared website dashboard.
Validates share ID and returns necessary token for public analytics access.

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
