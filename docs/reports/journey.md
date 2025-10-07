## Journey
<!-- testable: t| startStep          | string            | Optional filter to start journey analysis from a specific page/event |                     | no       |ue -->
<!-- expectedStatus: 200 -->
**Description:**  
Analyze user navigation paths through your website by tracking sequential visits.
Maps user journeys to understand navigation patterns and optimization opportunities.

**Latest status:** <!--status-->🚨 [#23](https://github.com/ceviixx/umami-api-docs/issues/23)<!--status-end-->

```
POST /reports/journey
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the journey analysis          | -                   | yes      |
| dateRange.startDate| string            | Start date for the analysis period (ISO 8601 format)       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for the analysis period (ISO 8601 format)         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units in the date range                     | 1                   | yes      |
| dateRange.offset   | number            | Offset from current date (0 = current period)              | 0                   | yes      |
| dateRange.unit     | string            | Time unit for the date range (day, week, month, year)      | day                 | yes      |
| dateRange.value    | string            | Shorthand representation of the date range                  | 0week               | yes      |
| steps              | number            | Number of journey steps to analyze (minimum 3, maximum 7)  | 3                   | yes      |
| timezone           | string            | Timezone for date calculations (IANA timezone identifier)  | Europe/Berlin       | yes      |
| websiteId          | string            | UUID of the website to analyze user journeys for           | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx          | yes      |
| startStep          | string            |                                                             |                     | no       |
| endStep            | string            | Optional filter to end journey analysis at a specific page/event |                     | no       |

---

### 📨 Request Body
```json
{
    "steps": 5,
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
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports/journey \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "steps": 5,
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
        "items": ["index.html", "outbound-link-click", null, null],
        "count": 1
    },
    {
        "items": ["/", null],
        "count": 1
    },
    {
        "items": ["index.html", "open-app-store", null],
        "count": 1
    }
]
```

---

### 📘 Response Structure
```json
[
    {
        "items": ["string|null"],
        "count": "number"
    }
]
```
