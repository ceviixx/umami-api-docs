## Properties
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get custom data properties associated with a specific user session.
Returns session-level data including user identifiers and custom attributes.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId/properties
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy/properties \
  -H "x-umami-api-key: YOUR_API_KEY"
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
