## Event data values
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets event data counts for a given event and property

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/event-data/values
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |
| eventName | string            | Event name.            | survey          | yes      |
| propertyName | string       | Property name.           | gender          | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/event-data/values?startAt=0000000000000&endAt=0000000000000&eventName=survey&propertyName=gender HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
  {
    "value": "female",
    "total": 4
  },
  {
    "value": "male",
    "total": 1
  }
]
```

---

### 📘 Response Structure
```json
[
  {
    "value": "string",
    "total": "number"
  }
]
```
