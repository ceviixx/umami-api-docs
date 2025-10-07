## Funnel
<!-- testable: true -->
**Description:**  
Analyze user conversion funnels by tracking visitor progression through defined steps.
Shows conversion rates and drop-off points to identify optimization opportunities.

**Latest status:** <!--status-->🚨 [#30](https://github.com/ceviixx/umami-api-docs/issues/30)<!--status-end-->

```
POST /reports/funnel
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the funnel analysis           | -                   | yes      |
| dateRange.startDate| string            | Start date for the analysis period (ISO 8601 format)       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for the analysis period (ISO 8601 format)         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units in the date range                     | 1                   | yes      |
| dateRange.offset   | number            | Offset from current date (0 = current period)              | 0                   | yes      |
| dateRange.unit     | string            | Time unit for the date range (day, week, month, year)      | day                 | yes      |
| dateRange.value    | string            | Shorthand representation of the date range                  | 0week               | yes      |
| steps              | array             | Array of funnel steps (minimum 2 required). Each step defines a conversion point | {type: "url", value: "/"}, {type: "url", value: "/contact"}| yes |
| timezone           | string            | Timezone for date calculations (IANA timezone identifier)  | Europe/Berlin       | yes      |
| websiteId          | string            | UUID of the website to analyze funnel data for             | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx          | yes      |
| window             | number            | Time window in minutes for step completion (positive number) | 60                  | yes      |

---

### 📨 Request Body
```json
{
    "window":60,
    "steps":[
        {
            "type":"url",
            "value":"/"
        },
        {
            "type":"url",
            "value":"/contact"
        }
    ],
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-13T22:00:00.000Z",
        "endDate":"2025-05-20T21:59:59.999Z",
        "unit":"day",
        "offset":0,
        "num":7,
        "value":"7day"
    },
    "timezone":"Europe/Berlin"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports/funnel \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "window": 60,
    "steps": [
      {
        "type": "url",
        "value": "/"
      },
      {
        "type": "url",
        "value": "/contact"
      }
    ],
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange": {
      "startDate": "2025-05-13T22:00:00.000Z",
      "endDate": "2025-05-20T21:59:59.999Z",
      "unit": "day",
      "offset": 0,
      "num": 7,
      "value": "7day"
    },
    "timezone": "Europe/Berlin"
  }'
```

---

### 📦 Example Response
```json
[
    {
        "type": "url",
        "value": "/",
        "visitors": 1,
        "previous": 0,
        "dropped": 0,
        "dropoff": null,
        "remaining": 1
    }
]
```

---

### 📘 Response Structure
```json
[
  {
    "type": "string",
    "value": "string",
    "visitors": "number",
    "previous": "number",
    "dropped": "number",
    "dropoff": "number|null",
    "remaining": "number|null"
  }
]
```
