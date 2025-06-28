## Data values
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session data counts for a given property

**Latest status:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/session-data/values
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date                                    | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date.                                        | 1234567890000       | yes      |
| propertyName       | string            | Property name.                                              | region              | no       |

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
