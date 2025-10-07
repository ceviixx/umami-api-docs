## Goals
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Track goal completion metrics by comparing actual performance against defined targets.
Supports count, sum, and average operators for different goal types.

**Latest status:** <!--status-->🚨 [#31](https://github.com/ceviixx/umami-api-docs/issues/31)<!--status-end-->

```
POST /reports/goals
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the goals analysis            | -                   | yes      |
| dateRange.startDate| string            | Start date for the analysis period (ISO 8601 format)       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for the analysis period (ISO 8601 format)         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units in the date range                     | 1                   | yes      |
| dateRange.offset   | number            | Offset from current date (0 = current period)              | 0                   | yes      |
| dateRange.unit     | string            | Time unit for the date range (day, week, month, year)      | day                 | yes      |
| dateRange.value    | string            | Shorthand representation of the date range                  | 0week               | yes      |
| goals              | array             | Array of goal objects (minimum 1 required). Types: url, event, event-data | {type: "url", value: "/", goal: 10} | yes     |
| timezone           | string            | Timezone for date calculations (IANA timezone identifier)  | Europe/Berlin       | yes      |
| websiteId          | string            | UUID of the website to analyze goal completion for         | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx          | yes      |

---

### 📨 Request Body
```json
{
    "goals":[
        {
            "type":"url",
            "value":"/",
            "goal":10
        }
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
curl -X POST https://api.umami.is/v1/reports/goals \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "goals": [
      {
        "type": "url",
        "value": "/",
        "goal": 10
      }
    ],
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
        "type": "url",
        "value": "/",
        "goal": 10,
        "result": 10
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
        "goal": "number",
        "result": "number"
    }
]
```
