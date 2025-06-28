## Event data values
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets event data counts for a given event and property

**Latest status:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/event-data/values
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |
| eventName | string            | Event name.            | survey          | yes      |
| propertyName | string       | Property name.           | gender          | no       |

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
