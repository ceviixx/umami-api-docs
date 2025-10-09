## Get detail
**Description:**

**Latest status:**

```
GET /api/pixels/:id
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
    "slug": "*********",
    "userId": "********-****-****-****-************",
    "teamId": null,
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
    "slug": "string",
    "userId": "string",
    "teamId": "string|null",
    "createdAt": "date",
    "updatedAt": "date",
    "deletedAt": "date|null"
}
```