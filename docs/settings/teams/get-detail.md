## Get detail
**Description:**

**Latest status:**

```
GET /api/teams/:id
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
    "accessCode": "team_****************",
    "logoUrl": null,
    "createdAt": "****-**-**T**:**:**.***Z",
    "updatedAt": "****-**-**T**:**:**.***Z",
    "deletedAt": null,
    "members": [
        {
            "id": "********-****-****-****-************",
            "teamId": "********-****-****-****-************",
            "userId": "********-****-****-****-************",
            "role": "********",
            "createdAt": "****-**-**T**:**:**.***Z",
            "updatedAt": "****-**-**T**:**:**.***Z"
        }
    ]
}
```

---

### Response Structure
```json
{
    "id": "string",
    "name": "string",
    "accessCode": "string",
    "logoUrl": "string|null",
    "createdAt": "date",
    "updatedAt": "date",
    "deletedAt": "date|null",
    "members": [
        {
            "id": "string",
            "teamId": "string",
            "userId": "string",
            "role": "string",
            "createdAt": "date",
            "updatedAt": "date"
        }
    ]
}
```