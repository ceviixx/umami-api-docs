## Data values
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get value distribution for specific session data property within time range.
Shows collected values for a property name with occurrence counts across sessions.

**Latest status:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/session-data/values
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | Start timestamp in milliseconds (Unix epoch time)          | 1234567890000       | yes      |
| endAt              | number            | End timestamp in milliseconds (Unix epoch time)            | 1234567890000       | yes      |
| propertyName       | string            | Specific property name to analyze value distribution for    | region              | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/session-data/values \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999" \
  --data-urlencode "propertyName=region"
```

---

### 📦 Example Response
```json

```

---

### 📘 Response Structure
```json

```
