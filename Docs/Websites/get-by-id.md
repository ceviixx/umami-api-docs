
## Website by id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets a website by ID.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId
```

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "My Website",
  "domain": "mywebsite.com",
  "shareId": null,
  "resetAt": null,
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": null,
  "deletedAt": null
}
```

---

### 📘 Response Structure
```json
{
  "id": "string",
  "name": "string",
  "domain": "string",
  "shareId": "string|null",
  "resetAt": "string|null",
  "userId": "string",
  "createdAt": "string",
  "updatedAt": "string|null",
  "deletedAt": "string|null"
}
```
