## Get all
**Description:**

**Latest status:**

```
GET /api/reports
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| type | string | | funnel | yes |

---

### Example Request
```bash

```

---

### Example Response
```json
{
    "data": [
        {
            "id": "********-****-****-****-************",
            "userId": "********-****-****-****-************",
            "websiteId": "********-****-****-****-************",
            "type": "funnel",
            "name": "********",
            "description": "",
            "parameters": {
                "steps": [
                    {
                        "type": "****",
                        "value": "*"
                    },
                    {
                        "type": "****",
                        "value": "*****"
                    }
                ],
                "window": **
            },
            "createdAt": "****-**-**T**:**:**.***Z",
            "updatedAt": "****-**-**T**:**:**.***Z"
        }
    ],
    "count": *,
    "page": *,
    "pageSize": **
}
```

---

### Response Structure
```json
{
    "data": [
        {
            "id": "string",
            "userId": "string",
            "websiteId": "string",
            "type": "string",
            "name": "string",
            "description": "string",
            "parameters": {
                "steps": [
                    {
                        "type": "string",
                        "value": "string"
                    }
                ],
                "window": "number"
            },
            "createdAt": "date",
            "updatedAt": "date"
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```