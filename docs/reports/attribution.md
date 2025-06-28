## Attribution
<!-- testable: true -->
**Description:**  
See how users engage with your marketing and what drives conversions.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/attribution
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| dateRange          | object            | Root dateRange object                                       | -                   | yes      |
| dateRange.startDate| string            | Root dateRange object                                       | 2025-05-13T22:00:00.000Z| yes  |
| dateRange.endDate  | string            | Root dateRange object                                       | 2025-05-20T21:59:59.999Z| yes  |
| dateRange.num      | number            | Root dateRange object                                       | 1                   | yes      |
| dateRange.offset   | number            | Root dateRange object                                       | 0                   | yes      |
| dateRange.unit     | string            | Root dateRange object                                       | day                 | yes      |
| dateRange.value    | string            | Root dateRange object                                       | 0week               | yes      |
| model              | string            | Root dateRange object                                       | firstClick          | yes      |
| steps              | array             | Root dateRange object                                       | {type: "url", value: "/"}| yes |
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |

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
```http
GET /api/websites/:websiteId/event-data/events HTTP/1.1
x-umami-api-key: {api-key}
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
