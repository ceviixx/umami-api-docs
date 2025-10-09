## Create
**Description:**

**Latest status:**

```
POST /api/teams
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | Name for the team | Marketing | yes |
---

### Request Body
```json
{
    "name": "Marketing"
}
```

---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "id": "********-****-****-****-************",
        "name": "************",
        "accessCode": "team_****************",
        "logoUrl": null,
        "createdAt": "****-**-**T**:**:**.***Z",
        "updatedAt": "****-**-**T**:**:**.***Z",
        "deletedAt": null
    },
    {
        "id": "********-****-****-****-************",
        "teamId": "********-****-****-****-************",
        "userId": "********-****-****-****-************",
        "role": "********",
        "createdAt": "****-**-**T**:**:**.***Z",
        "updatedAt": "****-**-**T**:**:**.***Z"
    }
]
```

---

### Response Structure
```json
[
    {
        "id": "string",
        "name": "string",
        "accessCode": "string",
        "logoUrl": "string|null",
        "createdAt": "date",
        "updatedAt": "date",
        "deletedAt": "date|null"
    },
    {
        "id": "string",
        "teamId": "string",
        "userId": "string",
        "role": "string",
        "createdAt": "date",
        "updatedAt": "date"
    }
]
```