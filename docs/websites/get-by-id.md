
## Website by id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get detailed information for a specific website by its unique identifier.
Returns complete website metadata including configuration settings and sharing status.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId
```

---

### 🔁 Example Request
```bash
curl https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY"
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
