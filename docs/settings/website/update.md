## Update
**Description:**

**Latest status:**

```
POST /api/websites/:id
```
---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | Name to identify | Demo | no |
| domain | string | Domain of your website | example.com | no |
| shareId | string | Random string (16 chars lenght) | | no |

---

### Request Body
```json
{
    "name": "Demo",
    "domain": "example.com"
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
    "deletedAt": "string|null"
}
```