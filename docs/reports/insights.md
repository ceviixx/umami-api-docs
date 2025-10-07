## Insights
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Generate custom analytical insights by combining multiple data fields with filtering.
Allows deep-dive analysis through segments and advanced filtering to uncover trends.

**Latest status:** <!--status-->🚨 [#32](https://github.com/ceviixx/umami-api-docs/issues/32)<!--status-end-->

```
POST /reports/insights
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the insights analysis         | -                   | yes      |
| dateRange.startDate| string            | Start date for the analysis period (ISO 8601 format)       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for the analysis period (ISO 8601 format)         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units in the date range                     | 1                   | yes      |
| dateRange.offset   | number            | Offset from current date (0 = current period)              | 0                   | yes      |
| dateRange.unit     | string            | Time unit for the date range (day, week, month, year)      | day                 | yes      |
| dateRange.value    | string            | Shorthand representation of the date range                  | 0week               | yes      |
| fields             | array             | Array of field objects to include in analysis (minimum 1 required) | {name: "url", type: "string", label: "URL"} | yes     |
| filters            | array             | Array of filter objects with operators (eq, neq, c, dnc) for data filtering |  | yes      |
| timezone           | string            | Timezone for date calculations (IANA timezone identifier)  | Europe/Berlin       | yes      |
| websiteId          | string            | UUID of the website to generate insights for               | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx          | yes      |

---

### 📨 Request Body
```json
{
    "fields":[
        {
            "name":"url",
            "type":"string",
            "label":"URL"
        }
    ],
    "filters":[
    ],
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
curl -X POST https://api.umami.is/v1/reports/insights \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "fields": [
      {
        "name": "url",
        "type": "string",
        "label": "URL"
      }
    ],
    "filters": [],
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
        "views": 8,
        "visitors": 3,
        "visits": 3,
        "bounces": 1,
        "totaltime": 242,
        "country": "US"
    }
]
```

---

### 📘 Response Structure
```json
[
    {
        "views": "number",
        "visitors": "number",
        "visits": "number",
        "bounces": "number",
        "totaltime": "number",
        "country": "string"
    }
]
```
