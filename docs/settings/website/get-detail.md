## Get detail
**Description:**

**Latest status:**

```
GET /api/websites/:id
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
    "name": "************",
    "domain": "************",
    "shareId": null,
    "resetAt": null,
    "userId": "********-****-****-****-************",
    "teamId": null,
    "createdBy": "********-****-****-****-************",
    "createdAt": "****-**-**T**:**:**.***Z",
    "updatedAt": "****-**-**T**:**:**.***Z",
    "deletedAt": null
}
```

---

### Response Structure
```json
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
    "deletedAt": "date|null"
}
```