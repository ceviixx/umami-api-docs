## Create
**Description:**

**Latest status:**

```
POST /api/reports
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | | Test | yes |
| type | string | | funnel | yes |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| paramters.window | number | | 60 | yes |
| parameters.steps | array | | | yes |

---

### Request Body
```json
{
    "name": "Test",
    "type": "funnel",
    "websiteId": "********-****-****-****-************",
    "parameters": {
        "window": 60,
        "steps": [
            {
                "type": "path",
                "value": "/"
            },
            {
                "type": "path",
                "value": "/home"
            }
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
{
    "id": "********-****-****-****-************",
    "userId": "********-****-****-****-************",
    "websiteId": "********-****-****-****-************",
    "type": "funnel",
    "name": "****",
    "description": "****",
    "parameters": {
        "steps": [
            {
                "type": "******",
                "value": "*"
            },
            {
                "type": "******",
                "value": "****"
            }
        ],
        "window": 60
    },
    "createdAt": "****-**-**T**:**:**.***Z",
    "updatedAt": "****-**-**T**:**:**.***Z"
}
```

---

### Response Structure
```json
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
```