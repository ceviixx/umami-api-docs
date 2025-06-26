## Session activity
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get activity from session 

**Latest check:** <!--status--><!--status-end-->

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
```http
GET /api/websites/:websiteId/sessions/:sessionId/activity HTTP/1.1
x-umami-api-key: {api-key}
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
