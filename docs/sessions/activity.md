## Session activity
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get activity from session 

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/:sessionId/activity
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1750964008000   | yes      |
| endAt   | number            | (in ms) of starting date | 1750964016000   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy/activity \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1750964008000" \
  --data-urlencode "endAt=1750964016000"
```

---

### 📦 Example Response
```json
[
  {
    "eventType" : 1,
    "urlQuery" : "",
    "urlPath" : "/",
    "eventName" : "",
    "createdAt" : "0000-00-00T00:00:00Z",
    "referrerDomain" : "",
    "eventId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "visitId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
  {
    "eventType" : 1,
    "urlQuery" : "",
    "urlPath" : "/",
    "eventName" : "",
    "createdAt" : "0000-00-00T00:00:00Z",
    "referrerDomain" : "",
    "eventId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "visitId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  }
]
```

---

### 📘 Response Structure
```json
[
  {
    "eventType" : "number",
    "urlQuery" : "string",
    "urlPath" : "string",
    "eventName" : "string",
    "createdAt" : "date",
    "referrerDomain" : "string",
    "eventId" : "string",
    "visitId" : "string"
  }
]
```
