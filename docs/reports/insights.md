## Insights
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Dive deeper into your data by using segments and filters.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/insights
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
| fields             | array             | -                                                           | {name: "url", type: "string", label: "URL"} | yes     |
| filters            | array             | operator  ( eq / neq / c / dnc )                            |                     | yes      |
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |

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
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",,
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
