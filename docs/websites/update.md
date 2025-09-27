## Updates website
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Update the configuration settings of an existing website entry.
Allows modification of display name, domain, and sharing settings.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /api/websites/:websiteId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name               | string            | Display name for the website in the Umami dashboard        | Umami             | yes      |
| domain             | string            | The primary domain name of the website (without protocol)  | umami.is         | yes      |
| shareId            | string            | Public share identifier for dashboard links (set null to disable sharing) | 2774U38dj80            | no       |

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

### 📦 Example Response
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

### 📘 Response Structure
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
