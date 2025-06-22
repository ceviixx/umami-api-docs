## Revenue
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Look into your revenue data and how users are spending.

**Latest check:** <!--status-->✅<!--status-end-->

```
POST /reports/revenue
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
| currency           | string            | Root dateRange object                                       | EUR                 | yes      |

---

### 📨 Request Body
```json
{
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-19T14:00:00.000Z",
        "endDate":"2025-05-20T13:59:59.999Z",
        "offset":0,
        "num":24,
        "unit":"hour",
        "value":"24hour"
    },
    "currency":"USD",
    "timezone":"Europe/Berlin"
}
```

---

### 🔁 Example Request
```http
POST /reports/revenue HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
```json
{
    "chart": [
        {
            "x": "",
            "t": "2025-05-19T15:00:00Z",
            "y": 289.94
        }
    ],
    "country": [
        {
            "name": "DE",
            "value": 289.94
        }
    ],
    "total": {
        "sum": 289.94,
        "count": 6,
        "unique_count": 1
    },
    "table": [
        {
            "currency": "USD",
            "sum": 289.94,
            "count": 6,
            "unique_count": 1
        }
    ]
}
```

---

### 📘 Response Structure
```json
{
    "chart": [
        {
            "x": "string",
            "t": "date:yyyy-mm-ddThh:mm:ssZ",
            "y": "number"
        }
    ],
    "country": [
        {
            "name": "string",
            "value": "number"
        }
    ],
    "total": {
        "sum": "number",
        "count": "number",
        "unique_count": "number"
    },
    "table": [
        {
            "currency": "string",
            "sum": "number",
            "count": "number",
            "unique_count": "number"
        }
    ]
}
```
