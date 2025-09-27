## Stats for sessions
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get aggregated statistics for user sessions within specified time period.
Provides key metrics including pageviews, unique visitors, and event interactions.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/stats
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for statistics range | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for statistics range   | 1234567899999   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/stats \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999"
```

---

### 📦 Example Response
```json
{
  "pageviews" : {
    "value" : 0
  },
  "visitors" : {
    "value" : 11
  },
  "visits" : {
    "value" : 12
  },
  "countries" : {
    "value" : 2
  },
  "events" : {
    "value" : 12
  }
}
```

---

### 📘 Response Structure
```json
{
  "pageviews" : {
    "value" : "number"
  },
  "visitors" : {
    "value" : "number"
  },
  "visits" : {
    "value" : "number"
  },
  "countries" : {
    "value" : "number"
  },
  "events" : {
    "value" : "number"
  }
}
```
