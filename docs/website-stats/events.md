## Events
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets events within a given time range.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/events/series
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | number            | (in ms) of starting date                                    | 1234567890000       | yes      |
| endAt              | number            | (in ms) of end date                                         | 1234567890000       | yes      |
| unit               | string            | Time unit (year | month | hour | day).                      | day                 | yes      |
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
GET /api/websites/:websiteId/events/series?startAt=0000000000000&endAt=0000000000000&unit=hour&timezone=America%2FLos_Angeles HTTP/1.1
x-umami-api-key: {api-key}
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
