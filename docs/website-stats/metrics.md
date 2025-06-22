## Metrics
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets metrics for a given time range.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/metrics
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date.                                   | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date.                                        | 1234567890000       | yes      |
| type               | string            | Metrics type (url | referrer | browser | os | device | country | event).| url     | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
| query              | string            | Name of query.                                              |                     | no       |
| host               | string            | Name of hostname.                                           |                     | no       |
| os                 | string            | Name of operating system.                                   |                     | no       |
| browser            | string            | Name of browser.                                            |                     | no       |
| device             | string            | Name of device (ex. Mobile)                                 |                     | no       |
| country            | string            | Name of country.                                            |                     | no       |
| region             | string            | Name of region/state/province.                              |                     | no       |
| city               | string            | Name of city.                                               |                     | no       |
| language           | string            | Name of language.                                           |                     | no       |
| event              | string            | Name of event.                                              |                     | no       |
| limit              | string            | Number of events returned.                                  |                     | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/metrics?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
  { 
    "x": "/", 
    "y": 46 
  },
  { 
    "x": "/docs", 
    "y": 17 
  },
  { 
    "x": "/download", 
    "y": 14 
  }
]
```
x: Unique value, depending on metric type (url | referrer | browser | os | device | country | event). \
y: Number of visitors.

---

### 📘 Response Structure
```json
[
  { 
    "x": "string", 
    "y": "number"
  }
]
```
