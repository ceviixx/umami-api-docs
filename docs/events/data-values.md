## Event data values
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get specific value counts for given event and property combination.
Shows value distribution for specific event-property pairs within time range.

**Latest status:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/event-data/values
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | Start timestamp in milliseconds (Unix epoch time) for value analysis | 1234567890000   | yes      |
| endAt   | number            | End timestamp in milliseconds (Unix epoch time) for value analysis   | 1234567899999   | yes      |
| eventName | string            | Specific event name to analyze value distribution for            | survey          | yes      |
| propertyName | string       | Specific property name within the event to analyze values for           | gender          | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/values \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999" \
  --data-urlencode "eventName=survey" \
  --data-urlencode "propertyName=gender"
```

---

### 📦 Example Response
```json

```

---

### 📘 Response Structure
```json

```
