## Run query
**Description:**

**Latest status:**

```
POST /api/reports/funnel
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | funnel | yes |
| filters | dict | |  | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
| steps | array | | | yes |
| window | number | | 60 | yes |

---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "funnel",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "steps": [
            {
                "type": "path",
                "value": "/"
            },
            {
                "type": "path",
                "value": "/home"
            }
        ],
        "window": 60
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
        "type": "****",
        "value": "*",
        "visitors": **,
        "previous": **,
        "dropped": **,
        "dropoff": null,
        "remaining": null
    },
    {
        "type": "****",
        "value": "*****",
        "visitors": **,
        "previous": **,
        "dropped": **,
        "dropoff": null,
        "remaining": null
    }
]
```

---

### Response Structure
```json
[
    {
        "type": "string",
        "value": "string",
        "visitors": "number",
        "previous": "number",
        "dropped": "number",
        "dropoff": "number|null",
        "remaining": "number|null"
    }
]
```