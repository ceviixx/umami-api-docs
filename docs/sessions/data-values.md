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
```http
GET /api/websites/:websiteId/session-data/values?startAt=0000000000000&endAt=0000000000000&propertyName=region HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json

```

---

### 📘 Response Structure
```json

```
