## Journey
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Understand how users nagivate through your website.

**Latest status:** <!--status-->✔️<!--status-end-->

```
POST /reports/journey
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
| steps              | number            | Number of steps from 3 to 7                                 | 3                   | yes      |
| timezone           | string            | Root dateRange object                                       | Europe/Berlin       | yes      |
| websiteId          | string            | Root dateRange object                                       | :websiteId          | yes      |
| startStep          | string            |                                                             |                     | no       |
| endStep            | string            |                                                             |                     | no       |

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
