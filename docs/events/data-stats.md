## Event data stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets summarized website events, fields, and records within a given time range.

**Latest check:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/event-data/stats
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |

---

### 📨 Request Body
```json

```

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/event-data/stats?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
    { 
        "events": 16, 
        "fields": 13, 
        "records": 26 
    }
]
```

---

### 📘 Response Structure
```json
[
    { 
        "events": "number", 
        "fields": "number", 
        "records": "number" 
    }
]
```
