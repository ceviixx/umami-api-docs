## Run query
**Description:**

**Latest status:**

```
POST /api/reports/retention
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | retention | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-01-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "retention",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-01-31T22:59:59.999Z",
        "timezone": "Europe/Berlin"
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

]
```

---

### Response Structure
```json
[
    
]
```