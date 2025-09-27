## Stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get comprehensive summarized website statistics including pageviews and unique visitors.
Provides key performance indicators with comparison to previous period values.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/stats
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | Start timestamp in milliseconds (Unix epoch time)          | 1234567890000       | yes      |
| endAt              | number            | End timestamp in milliseconds (Unix epoch time)            | 1234567890000       | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
| query              | string            | Name of query.                                              |                     | no       |
| event              | string            | Name of event.                                              |                     | no       |
| host               | string            | Name of hostname.                                           |                     | no       |
| os                 | string            | Name of operating system.                                   |                     | no       |
| browser            | string            | Name of browser.                                            |                     | no       |
| device             | string            | Name of device (ex. mobile)                                 |                     | no       |
| country            | string            | Name of country.                                            |                     | no       |
| region             | string            | Name of region/state/province.                              |                     | no       |
| city               | string            | Name of city.                                               |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/stats \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=0000000000000" \
  --data-urlencode "endAt=0000000000000"
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
