## Data properties
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session data counts by property name

**Latest check:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/session-data/properties
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date                                    | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date.                                        | 1234567890000       | yes      |


---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/session-data/properties?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
  {
    "propertyName": "id",
    "total": 1039
  },
  {
    "propertyName": "region",
    "total": 1039
  },
  {
    "propertyName": "name",
    "total": 1039
  },
  {
    "propertyName": "email",
    "total": 1039
  }
]
```

---

### 📘 Response Structure
```json

```
