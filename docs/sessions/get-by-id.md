## Details for id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session details for a individual session

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId
```

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/sessions/:sessionId HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "hostname": "umami.is",
  "browser": "ios",
  "os": "iOS",
  "device": "mobile",
  "screen": "390x844",
  "language": "en-US",
  "country": "US",
  "subdivision1": "US-IN",
  "city": "Bloomington",
  "firstAt": "2024-09-09T18:12:01Z",
  "lastAt": "2024-09-09T18:12:08Z",
  "visits": 1,
  "views": 3,
  "events": 0,
  "totaltime": 7
}
```

---

### 📘 Response Structure
```json
{
  "id": "string",
  "websiteId": "string",
  "hostname": "string",
  "browser": "string",
  "os": "string",
  "device": "string",
  "screen": "string",
  "language": "string",
  "country": "string",
  "subdivision1": "string",
  "city": "string",
  "firstAt": "date",
  "lastAt": "date",
  "visits": "number",
  "views": "number",
  "events": "number",
  "totaltime": "number"
}
```
