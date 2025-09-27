## UTM Campaign Tracking
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Generate detailed UTM campaign tracking reports to analyze marketing performance.
Provides insights into traffic sources and campaign effectiveness through UTM parameters.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/utm
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId          | string            | UUID of the website to analyze UTM campaign data for       | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes      |
| dateRange          | object            | Time period configuration for UTM data analysis            | -                   | yes      |
| dateRange.startDate| string            | Start date for UTM report analysis in ISO 8601 format     | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for UTM report analysis in ISO 8601 format       | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.unit     | string            | Time unit for data aggregation (day, week, month, year)    | day                 | yes      |
| dateRange.offset   | number            | Offset value for relative date calculations                 | 0                   | yes      |
| dateRange.num      | number            | Number of time units for relative date range               | 1                   | yes      |
| dateRange.value    | string            | Relative date range identifier (e.g., current week)        | 0week               | yes      |
| timezone           | string            | Timezone identifier for accurate date range interpretation  | Europe/Berlin       | yes      |

---

### 📨 Request Body
```json
{
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-17T22:00:00.000Z",
        "endDate":"2025-05-24T21:59:59.999Z",
        "unit":"day",
        "offset":0,
        "num":1,
        "value":"0week"
    },
    "timezone":"Europe/Berlin"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports/utm \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange": {
      "startDate": "2025-05-17T22:00:00.000Z",
      "endDate": "2025-05-24T21:59:59.999Z",
      "unit": "day",
      "offset": 0,
      "num": 1,
      "value": "0week"
    },
    "timezone": "Europe/Berlin"
  }'
```

---

### 📦 Example Response
```json
[
    {
        "url_query": "utm_campaign=summer_sale&utm_medium=email&utm_source=newsletter",
        "num": 1
    },
    {
        "url_query": "utm_campaign=social_media&utm_medium=social&utm_source=facebook",
        "num": 4
    }
]
```

---

### 📘 Response Structure
```json
[
    {
        "url_query": "string - Complete UTM query string with all campaign parameters",
        "num": "number - Number of visits/sessions for this specific UTM combination"
    }
]
```
