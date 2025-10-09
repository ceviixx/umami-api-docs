## Breakdown
**Description:**

**Latest status:**

```
POST /api/reports/breakdown
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | breakdown | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
| parameters.fields | array | | | yes |

---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "xxxxxxxx",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "fields": [
            "path",
            "title",
            "referrer"
        ]
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
        "views": *,
        "visitors": *,
        "visits": *,
        "bounces": *,
        "totaltime": *,
        "path": "*****",
        "title": "*********",
        "referrer": "**"
    }
]
```

---

### Response Structure
```json
[
    {
        "views": "number",
        "visitors": "number",
        "visits": "number",
        "bounces": "number",
        "totaltime": "number",
        "path": "string",
        "title": "string",
        "referrer": "string"
    }
]
```