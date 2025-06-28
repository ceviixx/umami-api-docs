## Data properties
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session data counts by property name

**Latest status:** <!--status-->✅<!--status-end-->

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
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/session-data/properties \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999"
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
[
  {
    "propertyName": "string",
    "total": "number"
  }
]
```
