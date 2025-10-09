## Update
**Description:**

**Latest status:**

```
POST /api/websites/:id/segments/:cohort_id
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | | Test | yes |
| type | string | | cohort | yes |
| parameters.dateRange | string | | 30day | yes |
| parameters.filters | array | | | yes |
| parameters.action | dict | | | yes |

---

### Request Body
```json
{
    "parameters": {
        "filters": [
            {
                "name": "referrer",
                "operator": "eq",
                "value": ""
            }
        ],
        "dateRange": "30day",
        "action": {
            "type": "path",
            "value": "/home"
        }
    },
    "name": "tets",
    "type": "cohort"
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
    "type": "******",
    "name": "*****",
    "parameters": {
        "action": {
            "type": "****",
            "value": "******"
        },
        "filters": [
            {
                "name": "**********",
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