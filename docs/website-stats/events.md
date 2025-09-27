## Events
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get event data as a time series within specified date range.
Provides detailed event analytics including event names, timestamps, and occurrence counts.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/events/series
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | Start timestamp in milliseconds (Unix epoch time)          | 1234567890000       | yes      |
| endAt              | number            | End timestamp in milliseconds (Unix epoch time)            | 1234567890000       | yes      |
| unit               | string            | Time grouping unit for data aggregation (year, month, day, hour) | day                 | yes      |
| timezone           | string            | IANA timezone identifier for date/time calculations        | America/Los_Angeles | yes      |
| url                | string            | Filter events by specific page URL path                     |                     | no       |
| referrer           | string            | Filter events by referring website or source               |                     | no       |
| title              | string            | Filter events by specific page title                       |                     | no       |
| host               | string            | Name of hostname.                                           |                     | no       |
| os                 | string            | Name of operating system.                                   |                     | no       |
| browser            | string            | Name of browser.                                            |                     | no       |
| device             | string            | Filter events by device type (mobile, desktop, tablet)     |                     | no       |
| country            | string            | Name of country.                                            |                     | no       |
| region             | string            | Name of region/state/province.                              |                     | no       |
| city               | string            | Name of city.                                               |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/events/series \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=0000000000000" \
  --data-urlencode "endAt=0000000000000" \
  --data-urlencode "unit=hour" \
  --data-urlencode "timezone=America/Los_Angeles"
```

---

### 📦 Example Response
```json
[
  { 
    "x": "live-demo-button", 
    "t": "2023-04-12T22:00:00Z", 
    "y": 1 
  },
  {
    "x": "get-started-button", 
    "t": "2023-04-12T22:00:00Z", 
    "y": 5 
  },
  { 
    "x": "get-started-button", 
    "t": "2023-04-12T23:00:00Z",
    "y": 4 
  },
  {
    "x": "live-demo-button", 
    "t": "2023-04-12T23:00:00Z", 
    "y": 4 
  },
  { 
    "x": "social-Discord", 
    "t": "2023-04-13T00:00:00Z", 
    "y": 1 
  }
]
```
x: Event name. \
t: Timestamp. \
y: Number of events.

---

### 📘 Response Structure
```json
[
  { 
    "x": "string", 
    "t": "date:yyyy-mm-ddThh:mm:ssZ", 
    "y": "number"
  }
]
```
