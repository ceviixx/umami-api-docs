## Event data events
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get aggregated statistics for event data properties and occurrence counts.
Provides insights into custom event tracking with event names and frequency data.

**Latest status:** <!--status-->✅<!--status-end-->


```
GET /api/websites/:websiteId/event-data/events
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for data range | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for data range   | 1234567899999   | yes      |
| event   | string            | Filter results by specific event name               | click_button    | no       |

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
