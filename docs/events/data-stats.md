## Event data stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get high-level summary statistics for event data within specified time range.
Provides aggregate counts for total records, unique properties, and distinct events.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/event-data/stats
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for statistics range | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for statistics range   | 1234567899999   | yes      |

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
