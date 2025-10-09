## Run query
**Description:**

**Latest status:**

```
POST /api/reports/goal
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-2747xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | goal | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
| parameters.type | string | | path | yes |
| parameters.value | string | | /home | yes |
---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-2747xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "goal",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "type": "path",
        "value": "/home"
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
{
    "num": ***,
    "total": ***
}
```

---

### Response Structure
```json
{
    "num": "number",
    "total": "number"
}
```