## Attribution
<!-- testable: true -->
**Description:**  
Analyze attribution paths to understand user marketing touchpoint interactions.
Supports first-click and last-click attribution models for customer journey tracking.

**Latest status:** <!--status-->🚨 [#22](https://github.com/ceviixx/umami-api-docs/issues/22)<!--status-end-->

```
POST /api/reports/attribution
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Date range configuration for the attribution analysis       | -                   | yes      |
| dateRange.startDate| string            | Start date for the analysis period (ISO 8601 format)       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | End date for the analysis period (ISO 8601 format)         | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Number of time units in the date range                     | 1                   | yes      |
| dateRange.offset   | number            | Offset from current date (0 = current period)              | 0                   | yes      |
| dateRange.unit     | string            | Time unit for the date range (day, week, month, year)      | day                 | yes      |
| dateRange.value    | string            | Shorthand representation of the date range                  | 0week               | yes      |
| model              | string            | Attribution model: "firstClick" or "lastClick"             | firstClick          | yes      |
| steps              | array             | Array of step objects defining the conversion path          | {type: "url", value: "/"}| yes |
| timezone           | string            | Timezone for date calculations (IANA timezone identifier)  | Europe/Berlin       | yes      |
| websiteId          | string            | UUID of the website to analyze attribution for             | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx          | yes      |

---

### 📨 Request Body
```json
{
    "model":"firstClick",
    "steps":[
        {
            "type":"event",
            "value":"/"
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
curl -X POST https://api.umami.is/v1/attribution \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "model": "firstClick",
    "steps": [
      {
        "type": "event",
        "value": "/"
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
{
    "paidAds" : [
        {
            "name" : "Google",
            "value" : 129
        }
    ],
    "referrer" : [
        {
            "name" : "google.com",
            "value" : 21273
        }
    ],
    "utm_source" : [
        {
            "name" : "yahoo.de",
            "value" : 671
        }
    ],
    "utm_content" : [
        {
            "name" : "info-email-3",
            "value" : 24
        }
    ],
    "utm_medium" : [
        {
            "name" : "outbound-email",
            "value" : 150
        }
    ],
    "utm_campaign" : [
        {
            "name" : "analytics",
            "value" : 69
        }
    ],
    "utm_term" : [
        {
            "name" : "software",
            "value" : 2
        }
    ],
    "total" : {
        "visitors" : 79106,
        "visits" : 105066,
        "pageviews" : 136971
    }
}
```

---

### 📘 Response Structure
```json
{
    "paidAds" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "referrer" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "utm_source" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "utm_content" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "utm_medium" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "utm_campaign" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "utm_term" : [
        {
            "name" : "string",
            "value" : "number"
        }
    ],
    "total" : {
        "visitors" : "number",
        "visits" : "number",
        "pageviews" : "number"
    }
}
```
