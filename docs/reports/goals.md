## Goals
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Track your goals for pageviews and events.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/goals
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
| goals              | array             | -                                                           | {type: "url", value: "/", goal: 10} | yes     |
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |

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
```http
POST /api/reports/goals HTTP/1.1
x-umami-api-key: {api-key}
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
