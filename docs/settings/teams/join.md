## Join
**Description:**

**Latest status:**

```
POST /api/teams/join
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| accessCode | string | Invation token | team_xxxxxxxxxxxxxxxx | yes |

---

### Request Body
```json
{
    "accessCode": "team_xxxxxxxxxxxxxxxx"
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
    "teamId": "********-****-****-****-************",
    "userId": "********-****-****-****-************",
    "role": "********",
    "createdAt": "****-**-**T**:**:**.***Z",
    "updatedAt": "****-**-**T**:**:**.***Z"
}
```

---

### Response Structure
```json
{
    "id": "string",
    "teamId": "string",
    "userId": "string",
    "role": "string",
    "createdAt": "date",
    "updatedAt": "date"
}
```