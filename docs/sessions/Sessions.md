## Sessions
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets website session details within a given time range.

**Latest check:** <!--status-->✔️<!--status-end-->

```
GET /api/websites/:websiteId/sessions
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date                                    | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date                                         | 1234567890000       | yes      |
| query              | string            | Search text.                                                |                     | no       |
| page               | number            | Determines page                                             |                     | no       |
| pageSize           | string            | Determines how many results to return.                      |                     | no       |
| orderBy            | string            | Order by column name.                                       |                     | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/sessions?page=1&startAt=0000000000000&endAt=0000000000000&pageSize=20 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "data": [
    {
      "id": "5a45d799-e6f5-56ac-9893-fde6f769c36a",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "hostname": "umami.is",
      "browser": "chrome",
      "os": "Windows 10",
      "device": "laptop",
      "screen": "1536x960",
      "language": "en-US",
      "country": "US",
      "subdivision1": "US-CA",
      "city": "Roseville",
      "firstAt": "2024-09-09T17:44:35Z",
      "lastAt": "2024-09-09T17:44:35Z",
      "visits": 1,
      "views": 1,
      "createdAt": "2024-09-09T17:44:35Z"
    },
    {
      "id": "753ce23b-0dab-5a33-badc-4d2239528dd9",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "hostname": "umami.is",
      "browser": "chrome",
      "os": "Windows 10",
      "device": "desktop",
      "screen": "2560x1440",
      "language": "de-DE",
      "country": "DE",
      "subdivision1": "DE-BY",
      "city": "Munich",
      "firstAt": "2024-09-09T08:54:18Z",
      "lastAt": "2024-09-09T17:44:29Z",
      "visits": 5,
      "views": 66,
      "createdAt": "2024-09-09T17:44:29Z"
    }
  ],
  "count": 1000,
  "page": 1,
  "pageSize": 20
}
```

---

### 📘 Response Structure
```json

```
