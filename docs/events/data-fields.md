## Gets event data property and value counts
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get detailed value distribution for event data properties within time range.
Shows specific values for each property with data types and occurrence counts.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/event-data/fields
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for field analysis | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for field analysis   | 1234567899999   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/fields \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999"
```

---

### 📦 Example Response
```json
[
  {
    "propertyName": "age",
    "dataType": 2,
    "value": "33",
    "total": 1
  },
  {
    "propertyName": "age",
    "dataType": 2,
    "value": "31",
    "total": 4
  },
  {
    "propertyName": "gender",
    "dataType": 1,
    "value": "female",
    "total": 4
  },
  {
    "propertyName": "gender",
    "dataType": 1,
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
    "propertyName": "string",
    "dataType": "number",
    "value": "string",
    "total": "number"
  }
]
```
