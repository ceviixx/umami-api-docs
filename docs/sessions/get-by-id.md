## Details for id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get comprehensive details for a specific user session by its unique identifier.
Provides complete session metadata including device information and interaction statistics.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "distinctId": "",
    "browser": "safari",
    "os": "Mac OS",
    "device": "desktop",
    "screen": "1920x1080",
    "language": "en-US",
    "country": "US",
    "region": "US-IL",
    "city": "Chicago",
    "firstAt": "0000-00-00T00:00:00Z",
    "lastAt": "0000-00-00T00:00:00Z",
    "visits": 1,
    "views": 1,
    "events": 2,
    "totaltime": 2
}
```

---

### 📘 Response Structure
```json
{
  "id": "string",
  "websiteId": "string",
  "distinctId": "string",
  "browser": "string",
  "os": "string",
  "device": "string",
  "screen": "string",
  "language": "string",
  "country": "string",
  "region": "string|null",
  "city": "string",
  "firstAt": "date",
  "lastAt": "date",
  "visits": "number",
  "views": "number",
  "events": "number",
  "totaltime": "number"
}
```
