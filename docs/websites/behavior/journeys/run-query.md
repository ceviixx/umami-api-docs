## Run query
**Description:**

**Latest status:**

```
POST /api/reports/journey
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | journey | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezonge | string | | Europe/Berlin | yes |
| parameters.steps | number | | 3 | yes |
| parameters.startStep | string | | | no |
| parameters.endStep | string | | | no |

---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "journey",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "steps": 3,
        "startStep": "",
        "endStep": ""
    }
}
```

---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "items": [
            "********",
            "****",
            "*****",
            null
        ],
        "count": ***
    },
    {
        "items": [
            "***",
            "*******",
            null
        ],
        "count": **
    },
    {
        "items": [
            "***",
            "*******",
            null
        ],
        "count": *
    }
]
```

---

### Response Structure
```json
[
    {
        "items": [
            "string|null"
        ],
        "count": "number"
    }
]
```