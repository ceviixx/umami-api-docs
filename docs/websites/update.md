## Updates website
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Updating website data.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/websites/:websiteId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name               | string            | The name of the website in Umami.                           | Example             | yes      |
| domain             | string            | The full domain of the tracked website.                     | example.com         | yes      |
| shareId            | string            | A unique string to enable a share url. Set null to unshare. | dfna03ad            | no       |

---

### 📨 Request Body
```json
{
    "name": "Example",
    "domain": "example.com"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Example",
    "domain": "example.com"
  }'
```

---

📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Example",
  "domain": "example.com",
  "shareId": null,
  "resetAt": null,
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": null,
  "deletedAt": null
}
```

---

📘 Response Structure
```json
{
  "id": "string",
  "name": "string",
  "domain": "string",
  "shareId": "string|null",
  "resetAt": "string|null",
  "userId": "string",
  "createdAt": "date",
  "updatedAt": "date|null",
  "deletedAt": "date|null"
}
```
