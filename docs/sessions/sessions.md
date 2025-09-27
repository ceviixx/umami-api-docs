## Get sessions
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of user sessions for a website within specified date range.
Provides comprehensive session data including device information and geographic location.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for session range | 1758524400000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for session range   | 1758610799999   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999"
```

---

### 📦 Example Response
```json
{
  "data": [
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "createdAt": "0000-00-00T00:00:00Z",
      "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "lastAt": "0000-00-00T00:00:00Z",
      "screen": "1920x1080",
      "hostname": "example.com",
      "visits": 1,
      "os": "xxxxx",
      "browser": "xxxxxx",
      "language": "xx-xx",
      "region": "xx-xx",
      "city": "xxxx",
      "firstAt": "0000-00-00T00:00:00Z",
      "device": "desktop",
      "country": "US",
      "views": 0
    }
  ],
  "count": 11,
  "pageSize": 10,
  "page": 1
}
```

---

### 📘 Response Structure
```json
{
  "data": [
    {
      "id": "string",
      "createdAt": "date",
      "websiteId": "string",
      "lastAt": "date",
      "screen": "string",
      "hostname": "string",
      "visits": "number",
      "os": "string",
      "browser": "string",
      "language": "string",
      "region": "string",
      "city": "string",
      "firstAt": "date",
      "device": "string",
      "country": "string",
      "views": "number",
    }
  ],
  "count": "number",
  "pageSize": "number",
  "page": "number",
}
```
