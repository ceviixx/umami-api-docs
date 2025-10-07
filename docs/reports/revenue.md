## Revenue
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Analyze revenue data and user spending patterns on your website.
Provides comprehensive revenue analytics including transaction counts and time-series data.

**Latest status:** <!--status-->🚨 [#35](https://github.com/ceviixx/umami-api-docs/issues/35)<!--status-end-->

```
POST /reports/revenue
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the revenue analysis          | -                   | yes      |
| dateRange.startDate| string            | Start date of the analysis period in ISO 8601 format       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date of the analysis period in ISO 8601 format         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units for relative date calculations         | 1                   | yes      |
| dateRange.offset   | number            | Time offset for date calculations (0 = current period)     | 0                   | yes      |
| dateRange.unit     | string            | Time unit for date calculations (day, week, month, year)   | day                 | yes      |
| dateRange.value    | string            | Formatted date range string for internal processing        | 0week               | yes      |
| timezone           | string            | Timezone identifier for date/time calculations             | Europe/Berlin       | yes      |
| websiteId          | string            | Unique identifier of the website to analyze                 | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes      |
| currency           | string            | Currency code for revenue calculations (ISO 4217 format)   | EUR                 | yes      |

---

### 📨 Request Body
```json
{
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-19T14:00:00.000Z",
        "endDate":"2025-05-20T13:59:59.999Z",
        "offset":0,
        "num":24,
        "unit":"hour",
        "value":"24hour"
    },
    "currency":"USD",
    "timezone":"Europe/Berlin"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports/revenue \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange": {
      "startDate": "2025-05-19T14:00:00.000Z",
      "endDate": "2025-05-20T13:59:59.999Z",
      "offset": 0,
      "num": 24,
      "unit": "hour",
      "value": "24hour"
    },
    "currency": "USD",
    "timezone": "Europe/Berlin"
  }'
```

---

### 📦 Example Response
```json
{
    "chart": [
        {
            "x": "",
            "t": "2025-05-19T15:00:00Z",
            "y": 289.94
        }
    ],
    "country": [
        {
            "name": "DE",
            "value": 289.94
        }
    ],
    "total": {
        "sum": 289.94,
        "count": 6,
        "unique_count": 1
    },
    "table": [
        {
            "currency": "USD",
            "sum": 289.94,
            "count": 6,
            "unique_count": 1
        }
    ]
}
```

---

### 📘 Response Structure
```json
{
    "chart": [
        {
            "x": "string",
            "t": "date:yyyy-mm-ddThh:mm:ssZ",
            "y": "number"
        }
    ],
    "country": [
        {
            "name": "string",
            "value": "number"
        }
    ],
    "total": {
        "sum": "number",
        "count": "number",
        "unique_count": "number"
    },
    "table": [
        {
            "currency": "string",
            "sum": "number",
            "count": "number",
            "unique_count": "number"
        }
    ]
}
```
