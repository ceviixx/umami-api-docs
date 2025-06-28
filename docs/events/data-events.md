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
```bash
curl -X GET https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/events \
  -H "x-umami-api-key: YOUR_API_KEY"
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
