## Run query
**Description:**

**Latest status:**

```
POST /api/reports/utm
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | utm | yes |
| filters | dict | | | yes |
| parameters.startDate | string | | 2024-12-31T23:00:00.000Z | yes |
| parameters.endDate | string | | 2025-12-31T22:59:59.999Z | yes |
| parameters.timezone | string | | Europe/Berlin | yes |
---

### Request Body
```json
{
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "utm",
    "filters": {},
    "parameters": {
        "startDate": "2024-12-31T23:00:00.000Z",
        "endDate": "2025-12-31T22:59:59.999Z",
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
{
    "utm_source": [
        {
            "utm": "******",
            "views": **
        },
        {
            "utm": "********",
            "views": *
        },
        {
            "utm": "*****",
            "views": *
        }
    ],
    "utm_medium": [
        {
            "utm": "**********",
            "views": *
        }
    ],
    "utm_campaign": [],
    "utm_term": [],
    "utm_content": [
        {
            "utm": "******",
            "views": **
        },
        {
            "utm": "***",
            "views": **
        },
        {
            "utm": "****",
            "views": *
        }
    ]
}
```

---

### Response Structure
```json
{
    "utm_source": [
        {
            "utm": "string",
            "views": "number"
        }
    ],
    "utm_medium": [
        {
            "utm": "string",
            "views": "number"
        }
    ],
    "utm_campaign": [
        {
            "utm": "string",
            "views": "number"
        }
    ],
    "utm_term": [
        {
            "utm": "string",
            "views": "number"
        }
    ],
    "utm_content": [
        {
            "utm": "string",
            "views": "number"
        }
    ]
}
```