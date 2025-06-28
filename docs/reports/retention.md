## Retention
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Measure your website stickiness by tracking how often users return.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/retention
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
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |

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
