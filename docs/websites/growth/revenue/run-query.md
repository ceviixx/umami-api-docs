## Run query
**Description:**

**Latest status:**

```
POST /api/reports/revenue
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | revenue | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
| parameters.currency | string | | USD | yes |

---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "revenue",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "currency": "USD"
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
    "chart": [],
    "country": [],
    "total": {
        "sum": *,
        "count": *,
        "unique_count": *,
        "average": *
    }
}
```

---

### Response Structure
```json
{
    "chart": [],
    "country": [],
    "total": {
        "sum": "number",
        "count": "number",
        "unique_count": "number",
        "average": "number"
    }
}
```