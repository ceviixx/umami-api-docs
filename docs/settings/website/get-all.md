## Get all
**Description:**

**Latest status:**

```
GET /api/websites
```

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
            "name": "************",
            "domain": "************",
            "shareId": null,
            "resetAt": null,
            "userId": "********-****-****-****-************",
            "teamId": null,
            "createdBy": "********-****-****-****-************",
            "createdAt": "****-**-**T**:**:**.***Z",
            "updatedAt": "****-**-**T**:**:**.***Z",
            "deletedAt": null,
            "user": {
                "username": "****************",
                "id": "********-****-****-****-************"
            }
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
            "name": "string",
            "domain": "string",
            "shareId": "string|null",
            "resetAt": "string|null",
            "userId": "string",
            "teamId": "string|null",
            "createdBy": "string",
            "createdAt": "date",
            "updatedAt": "date",
            "deletedAt": "date|null",
            "user": {
                "username": "string",
                "id": "string"
            }
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```