## Create
**Description:**

**Latest status:**

```
POST /api/websites/:id/segments
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | | Test | yes |
| type | string | | segment | yes |
| parameters.filters | array | | | yes |

---

### Request Body
```json
{
    "parameters": {
        "filters": [
            {
                "name": "path",
                "operator": "eq",
                "value": "/home"
            }
        ]
    },
    "name": "Test",
    "type": "segment"
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
    "websiteId": "********-****-****-****-************",
    "type": "*******",
    "name": "****",
    "parameters": {
        "filters": [
            {
                "name": "****",
                "value": "****",
                "operator": "**"
            }
        ]
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
    "websiteId": "string",
    "type": "string",
    "name": "string",
    "parameters": {
        "filters": [
            {
                "name": "string",
                "value": "string",
                "operator": "string"
            }
        ]
    },
    "createdAt": "date",
    "updatedAt": "date"
}
```