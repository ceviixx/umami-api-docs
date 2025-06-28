## Stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets summarized website statistics.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/stats
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date.                                   | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date.                                        | 1234567890000       | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
| query              | string            | Name of query.                                              |                     | no       |
| event              | string            | Name of event.                                              |                     | no       |
| host               | string            | Name of hostname.                                           |                     | no       |
| os                 | string            | Name of operating system.                                   |                     | no       |
| browser            | string            | Name of browser.                                            |                     | no       |
| device             | string            | Name of device (ex. Mobile)                                 |                     | no       |
| country            | string            | Name of country.                                            |                     | no       |
| region             | string            | Name of region/state/province.                              |                     | no       |
| city               | string            | Name of city.                                               |                     | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/stats?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "pageviews": { 
    "value": 3018, 
    "prev": 3508 
  },
  "visitors": {
    "value": 847, 
    "prev": 910 
  },
  "visits": { 
    "value": 984, 
    "prev": 1080 
  },
  "bounces": {
    "value": 537, 
    "prev": 628 
  },
  "totaltime": { 
    "value": 150492, 
    "prev": 164713 
  }
}
```
pageviews: Pages hits \
visitors: Number of unique visitors \
visits: Number of sessions \
bounces: Number of visitors who only visit a single page \
totaltime: Time spent on the website

---

### 📘 Response Structure
```json
{
  "pageviews": { 
    "value": "number", 
    "prev": "number" 
  },
  "visitors": {
    "value": "number", 
    "prev": "number" 
  },
  "visits": { 
    "value": "number", 
    "prev": "number" 
  },
  "bounces": {
    "value": "number", 
    "prev": "number" 
  },
  "totaltime": { 
    "value": "number", 
    "prev": "number" 
  }
}
```
