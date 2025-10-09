## Get all
**Description:**

**Latest status:**

```
GET /api/pixels
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
            "slug": "*********",
            "userId": "********-****-****-****-************",
            "teamId": null,
            "createdAt": "****-**-**T**:**:**.***Z",
            "updatedAt": "****-**-**T**:**:**.***Z",
            "deletedAt": null
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
            "slug": "string",
            "userId": "string",
            "teamId": "string|null",
            "createdAt": "date",
            "updatedAt": "date",
            "deletedAt": "date|null"
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```