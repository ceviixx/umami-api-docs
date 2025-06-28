## Funnel
<!-- testable: true -->
**Description:**  
Understand the conversion and drop-off rate of users.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /reports/funnel
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
| steps              | array             | Root dateRange object                                       | {type: "url", value: "/"}, {type: "url", value: "/contact"}| yes |
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |
| window             | number            | Root dateRange object                                       | 60                  | yes      |

---

### 📨 Request Body
```json
{
    "window":60,
    "steps":[
        {
            "type":"url",
            "value":"/"
        },
        {
            "type":"url",
            "value":"/contact"
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
POST /api/reports/funnel HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
[
    {
        "type": "url",
        "value": "/",
        "visitors": 1,
        "previous": 0,
        "dropped": 0,
        "dropoff": null,
        "remaining": 1
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
    "visitors": "number",
    "previous": "number",
    "dropped": "number",
    "dropoff": "number|null",
    "remaining": "number"
  }
]
```
