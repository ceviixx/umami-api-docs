## Creates website
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Create a new website entry in Umami for tracking analytics data.
Registers website and generates unique tracking ID for visitor data collection.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /api/websites
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| domain             | string            | The primary domain name of the website to be tracked (without protocol) | example.com         | yes      |
| name               | string            | Display name for the website in the Umami dashboard        | Example             | yes      |
| shareId            | string            | Optional public share identifier for creating shareable dashboard links |                     | no       |
| teamId             | string            | Team identifier to assign website ownership for collaborative access |                     | no       |

---

### 📨 Request Body
```json
{
  "name": "Umami",
  "domain": "umami.is"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/websites \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Umami",
    "domain": "umami.is"
  }'
```

---

### 📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Umami",
  "domain": "umami.is",
  "shareId": null,
  "resetAt": null,
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "teamId": null,
  "createdBy": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z",
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
