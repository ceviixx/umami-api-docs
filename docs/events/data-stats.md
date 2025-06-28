## Event data stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets summarized website events, fields, and records within a given time range.

**Latest status:** <!--status-->✅<!--status-end-->

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

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/stats \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999"
```

---

### 📦 Example Response
```json
{
  "records" : 118,
  "properties" : 4,
  "events" : 112
}
```

---

### 📘 Response Structure
```json
{
  "records" : "number",
  "properties" : "number",
  "events" : "number"
}
```
