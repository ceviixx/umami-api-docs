## Create
**Description:**

**Latest status:**

```
POST /api/reports
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name | string | | Test | yes |
| description | string | | | no |
| type | string | | goal | yes |
| websiteId | string | | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
| parameters.type | string | | path | yes |
| parameters.value | string | | / | yes |

---

### Request Body
```json
{
    "name": "Test",
    "parameters": {
        "type": "path",
        "value": "****"
    },
    "type": "goaö",
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
    "userId": "********-****-****-****-************",
    "websiteId": "********-****-****-****-************",
    "type": "goal",
    "name": "****",
    "description": "",
    "parameters": {
        "type": "path",
        "value": "****"
    },
    "createdAt": "****-**-**T**:**:**.***Z",
    "updatedAt": "****-**-**T**:**:**.***Z"
}
```

---

### Response Structure
```json
{
    "id": "string",
    "userId": "string",
    "websiteId": "string",
    "type": "sting",
    "name": "string",
    "description": "string",
    "parameters": {
        "type": "string",
        "value": "string"
    },
    "createdAt": "date",
    "updatedAt": "date"
}
```