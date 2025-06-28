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
```http
GET /api/share/:shareId HTTP/1.1
x-umami-api-key: {api-key}
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
