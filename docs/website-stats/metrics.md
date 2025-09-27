## Metrics
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get aggregated metrics data for a website within specified time range.
Provides detailed analytics breakdowns by URLs, referrers, browsers, and countries.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/metrics
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | Start timestamp in milliseconds (Unix epoch time)          | 1234567890000       | yes      |
| endAt              | number            | End timestamp in milliseconds (Unix epoch time)            | 1234567890000       | yes      |
| type               | string            | Metric dimension for data breakdown (url, referrer, browser, os, device, country, event) | url     | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
| query              | string            | Name of query.                                              |                     | no       |
| host               | string            | Name of hostname.                                           |                     | no       |
| os                 | string            | Name of operating system.                                   |                     | no       |
| browser            | string            | Name of browser.                                            |                     | no       |
| device             | string            | Name of device (ex. mobile)                                 |                     | no       |
| country            | string            | Name of country.                                            |                     | no       |
| region             | string            | Name of region/state/province.                              |                     | no       |
| city               | string            | Name of city.                                               |                     | no       |
| language           | string            | Name of language.                                           |                     | no       |
| event              | string            | Name of event.                                              |                     | no       |
| limit              | string            | Maximum number of metric results to return                  |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/metrics \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=0000000000000" \
  --data-urlencode "endAt=0000000000000" \
  --data-urlencode "type=url"
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
