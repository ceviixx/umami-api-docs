## Gets event data property and value counts
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets event data property and value counts within a given time range.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/event-data/fields
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| websiteId | string          | Website key identifier   | :websiteId      | yes      |
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/event-data/fields?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
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
