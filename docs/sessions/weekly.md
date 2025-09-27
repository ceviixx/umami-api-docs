## Weekly session data
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get session count data organized by weekday and hour for activity patterns.
Returns 7x24 matrix showing session distribution across days and hours.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/sessions/weekly
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for weekly analysis | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for weekly analysis   | 1234567899999   | yes      |
| timezone| string            | IANA timezone identifier for hour-based calculations       | Europe/Berlin   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/weekly \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999" \
  --data-urlencode "timezone=Europe/Berlin"
```

---

### 📦 Example Response
```json
[
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
]
```

---

### 📘 Response Structure
```json
[
  [
    "number"
  ]
]
```
