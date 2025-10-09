## Run query
**Description:**

**Latest status:**

```
POST /api/reports/attribution
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | attribution | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
| parameters.model | string | | first-click | yes |
| parameters.type | string | | path | yes |
| parameters.step | string | | / | yes |

---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "attribution",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
        "timezone": "Europe/Berlin",
        "model": "first-click",
        "type": "path",
        "step": "/"
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
    "referrer": [],
    "paidAds": [],
    "utm_source": [],
    "utm_medium": [],
    "utm_campaign": [],
    "utm_content": [],
    "utm_term": [],
    "total": {
        "pageviews": *,
        "visitors": *,
        "visits": *
    }
}
```

---

### Response Structure
```json
{
    "referrer": [],
    "paidAds": [],
    "utm_source": [],
    "utm_medium": [],
    "utm_campaign": [],
    "utm_content": [],
    "utm_term": [],
    "total": {
        "pageviews": "number",
        "visitors": "number",
        "visits": "number"
    }
}
```