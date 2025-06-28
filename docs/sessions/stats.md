## Stats for sessions
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Calculated list of stats

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/stats
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/sessions/stats HTTP/1.1
x-umami-api-key: {api-key}
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
