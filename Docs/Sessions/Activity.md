## Activity
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session activity for a individual session

**Latest check:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId/activity
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date                                    | 1234567890000       | yes      |
| endAt              | number            | (in ms) of starting date                                    | 1234567890000       | yes      |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/sessions/:sessionId/activity?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
  {
    "createdAt": "2024-09-09T18:12:08Z",
    "urlPath": "/websites/fd4bdd56-2135-4c42-9518-55e72669f23c",
    "urlQuery": "",
    "referrerDomain": "",
    "eventId": "a154aebc-10cf-4a26-8187-c541ef0d2929",
    "eventType": 1,
    "eventName": "",
    "visitId": "609a5116-b139-5c6d-9293-fbea9b8a3b61"
  },
  {
    "createdAt": "2024-09-09T18:12:01Z",
    "urlPath": "/settings/websites",
    "urlQuery": "",
    "referrerDomain": "",
    "eventId": "92246b7b-e3e2-4c9d-b61e-fab69d993ad7",
    "eventType": 1,
    "eventName": "",
    "visitId": "609a5116-b139-5c6d-9293-fbea9b8a3b61"
  }
]
```

---

### 📘 Response Structure
```json

```
