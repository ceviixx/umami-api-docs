## Get detail
**Description:**

**Latest status:**

```
GET /api/websites/:id/segments/:cohort_id
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
                "operator": "*"
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