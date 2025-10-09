## Toggle share
**Description:**

**Latest status:**

```
/api/websites/:id
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| shareId | string | Random string (9 chars lenght) | e93kdalkd9 | yes |

---

### Request Body
```json
{
    "shareId": "e93kdalkd9"
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
    "name": "************",
    "domain": "************",
    "shareId": "*********",
    "resetAt": "****-**-**T**:**:**.***Z",
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
    "shareId": "string",
    "resetAt": "date",
    "userId": "strig",
    "teamId": "string|null",
    "createdBy": "string",
    "createdAt": "date",
    "updatedAt": "date",
    "deletedAt": "date|null"
}
```