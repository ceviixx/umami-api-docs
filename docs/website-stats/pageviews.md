## Pageviews
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get time-series data for pageviews and unique sessions within specified date range.
Provides detailed visitor traffic analytics with temporal breakdown and filtering options.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/pageviews
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | Start timestamp in milliseconds (Unix epoch time)          | 1234567890000       | yes      |
| endAt              | number            | End timestamp in milliseconds (Unix epoch time)            | 1234567890000       | yes      |
| unit               | string            | Time grouping unit for data aggregation (year, month, day, hour) | month               | yes      |
| timezone           | string            | IANA timezone identifier for date/time calculations        | America/Los_Angeles | yes      |
| url                | string            | Name of URL.                                                |                     | no       |
| referrer           | string            | Name of referrer.                                           |                     | no       |
| title              | string            | Name of page title.                                         |                     | no       |
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
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/pageviews \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=0000000000000" \
  --data-urlencode "endAt=0000000000000" \
  --data-urlencode "unit=month" \
  --data-urlencode "timezone=America/Los_Angeles"
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
