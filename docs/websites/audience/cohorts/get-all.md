## Get all
**Description:**

**Latest status:**

```
GET /api/websites/:id/segments
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| client | string | | [object Object] | yes |
| queryKey | string | | website:segments,[object Object] | yes |
| signal | string | | [object AbortSignal] | yes |
| type | string | | cohort | yes |

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
            "websiteId": "********-****-****-****-************",
            "type": "******",
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
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```