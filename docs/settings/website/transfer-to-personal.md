## Transfer to personal
**Description:**

**Latest status:**

```
/api/websites/:id
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| userId | string | ID of the destination user | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
---

### Request Body
```json
{
    "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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