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
    "type": "*****",
    "name": "********",
    "parameters": {
        "action": {
            "type": "****",
            "value": "********"
        },
        "filters": [
            {
                "name": "********",
                "value": "",
                "operator": "**"
            }
        ],
        "dateRange": "*****"
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
        "action": {
            "type": "string",
            "value": "string"
        },
        "filters": [
            {
                "name": "string",
                "value": "string",
                "operator": "string"
            }
        ],
        "dateRange": "string"
    },
    "createdAt": "date",
    "updatedAt": "date"
}
```