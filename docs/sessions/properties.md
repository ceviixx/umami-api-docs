## Properties
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session properties for a individual session

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId/properties
```

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/sessions/:sessionId/properties HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
  {
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "sessionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dataKey": "email",
    "dataType": 1,
    "stringValue": "johndoe@mail.com",
    "numberValue": null,
    "dateValue": null,
    "createdAt": "2024-09-09T18:12:01Z"
  },
  {
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "sessionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dataKey": "name",
    "dataType": 1,
    "stringValue": "John Doe",
    "numberValue": null,
    "dateValue": null,
    "createdAt": "2024-09-09T18:12:01Z"
  }
]
```

---

### 📘 Response Structure
```json
[
  {
    "websiteId": "string",
    "sessionId": "string",
    "dataKey": "string",
    "dataType": "number",
    "stringValue": "string",
    "numberValue": "date|null",
    "dateValue": "date|null",
    "createdAt": "date"
  }
]
```
