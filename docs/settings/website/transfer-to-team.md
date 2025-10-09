## Transfer to team
**Description:**

**Latest status:**

```
/api/websites/:id
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| teamId | string | ID of the destination team | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
---

### Request Body
```json
{
    "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
    "resetAt": "date|null",
    "userId": "string",
    "teamId": "string|null",
    "createdBy": "string",
    "createdAt": "date",
    "updatedAt": "date",
    "deletedAt": "date|null"
}
```