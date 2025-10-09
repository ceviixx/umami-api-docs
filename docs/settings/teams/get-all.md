## Get all
**Description:**

**Latest status:**

```
GET /api/teams
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
                    "updatedAt": "****-**-**T**:**:**.***Z",
                    "user": {
                        "id": "********-****-****-****-************",
                        "username": "********************"
                    }
                }
            ],
            "_count": {
                "websites": *,
                "members": *
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
                    "updatedAt": "date",
                    "user": {
                        "id": "string",
                        "username": "string"
                    }
                }
            ],
            "_count": {
                "websites": "number",
                "members": "number"
            }
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```