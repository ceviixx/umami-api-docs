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
    "type": "goal",
    "name": "****",
    "description": "",
    "parameters": {
        "type": "****",
        "value": "*****"
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
        "type": "string",
        "value": "string"
    },
    "createdAt": "date",
    "updatedAt": "date"
}
```