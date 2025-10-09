## Get detail
**Description:**

**Latest status:**

```
GET /api/reports/:id
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