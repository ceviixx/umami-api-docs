## Creates website
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Create an new website entry for tracking.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/websites
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| domain             | string            | The full domain of the tracked website.                     | example.com         | yes      |
| name               | string            | The name of the website in Umami.                           | Example             | yes      |
| shareId            | string            | A unique string to enable a share url. Set null to unshare. |                     | no       |
| teamId             | string            | The ID of the team the website will be created under.       |                     | no       |

---

### 📨 Request Body
```json
{
  "name": "Umami",
  "domain": "umami.is",
}
```

---

### 🔁 Example Request
```http
POST /api/websites HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "id": 1,
  "websiteUuid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "websiteId": 2,
  "name": "Umami",
  "domain": "umami.is",
  "shareId": "xxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z"
}
```

---

📘 Response Structure
```json

```
