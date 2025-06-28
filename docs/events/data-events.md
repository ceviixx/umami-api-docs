## Event data events
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets event data names, properties, and counts

**Latest status:** <!--status-->✅<!--status-end-->


```
GET /api/websites/:websiteId/event-data/events
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |
| event   | string (optional) | Event name               | click_button    | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/event-data/events HTTP/1.1
Authorization: Bearer {token}
```

---

### 📦 Example Response
```json
[
  {
    "eventName": "button-click",
    "propertyName": "id",
    "dataType": 1,
    "total": 4
  },
  {
    "eventName": "button-click",
    "propertyName": "name",
    "dataType": 1,
    "total": 4
  },
  {
    "eventName": "track-product",
    "propertyName": "price",
    "dataType": 2,
    "total": 2
  }
]
```

---

### 📘 Response Structure
```json
[
  {
    "eventName": "string",
    "propertyName": "string",
    "dataType": "number",
    "total": "number"
  }
]
```
