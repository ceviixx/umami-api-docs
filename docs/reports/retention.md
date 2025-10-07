## Retention
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Analyze user retention patterns by tracking how often visitors return.
Shows percentage of returning users broken down by days since first visit.

**Latest status:** <!--status-->🚨 [#34](https://github.com/ceviixx/umami-api-docs/issues/34)<!--status-end-->

```
POST /reports/retention
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the retention analysis        | -                   | yes      |
| dateRange.startDate| string            | Start date of the analysis period in ISO 8601 format       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date of the analysis period in ISO 8601 format         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units for relative date calculations         | 1                   | yes      |
| dateRange.offset   | number            | Time offset for date calculations (0 = current period)     | 0                   | yes      |
| dateRange.unit     | string            | Time unit for date calculations (day, week, month, year)   | day                 | yes      |
| dateRange.value    | string            | Formatted date range string for internal processing        | 0week               | yes      |
| timezone           | string            | Timezone identifier for date/time calculations             | Europe/Berlin       | yes      |
| websiteId          | string            | Unique identifier of the website to analyze                 | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes      |

---

### 📨 Request Body
```json
{
    "dateRange":{
        "startDate":"2025-04-30T22:00:00.000Z",
        "endDate":"2025-05-31T21:59:59.999Z",
        "value":"range:1746050400000:1748728799999",
        "offset":0,
        "unit":"day"
    },
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "timezone":"Europe/Berlin"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports/retention \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "dateRange": {
      "startDate": "2025-04-30T22:00:00.000Z",
      "endDate": "2025-05-31T21:59:59.999Z",
      "value": "range:1746050400000:1748728799999",
      "offset": 0,
      "unit": "day"
    },
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "timezone": "Europe/Berlin"
  }'
```

---

### 📦 Example Response
```json
[
    {
        "date": "2025-05-18T22:00:00Z",
        "day": 0,
        "visitors": 1,
        "returnVisitors": 1,
        "percentage": 100
    }, 
    {
        "date": "2025-05-19T22:00:00Z",
        "day": 0,
        "visitors": 1,
        "returnVisitors": 1,
        "percentage": 100
    }
]
```

---

### 📘 Response Structure
```json
[
    {
        "date": "date:yyyy-mm-ddThh:mm:ssZ",
        "day": "number",
        "visitors": "number",
        "returnVisitors": "number",
        "percentage": "number"
    }
]
```
