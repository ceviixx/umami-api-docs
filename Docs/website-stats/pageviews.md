## Pageviews
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets pageviews and sessions within a given time range.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/pageviews
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date.                                   | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date.                                        | 1234567890000       | yes      |
| unit               | string            | Time unit (year | month | hour | day).                      | month               | yes      |
| timezone           | string            | Timezone (ex. America/Los_Angeles).                         | America/Los_Angeles | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
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
GET /api/websites/:websiteId/pageviews?startAt=0000000000000&endAt=0000000000000 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
  "pageviews": [
    { 
      "x": "2020-04-20 01:00:00", 
      "y": 3 
    },
    { 
      "x": "2020-04-20 02:00:00", 
      "y": 7 
    }
  ],
  "sessions": [
    { 
      "x": "2020-04-20 01:00:00", 
      "y": 2
    },
    { 
      "x": "2020-04-20 02:00:00", 
      "y": 4 
    }
  ]
}
```
x: Timestamp. \
y: Number of visitors.

---

### 📘 Response Structure
```json
{
  "pageviews": [
    { 
      "x": "date:yyyy-mm-dd hh:mm:ss", 
      "y": "number" 
    }
  ],
  "sessions": [
    { 
      "x": "date:yyyy-mm-dd hh:mm:ss", 
      "y": "number"
    }
  ]
}
```
