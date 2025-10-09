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
| type | string | | segment | yes |

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
            "createdAt": "****-**-**T**:**:**.***Z"
        }
    ],
    "count": +,
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
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```