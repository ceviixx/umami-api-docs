## Event values
**Description:**

**Latest status:**

```
GET /api/websites/:id/values
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| type | string | | event | yes |
| startAt | number | | 1744063199999 | yes |
| endAt | number | | 1759874399999 | yes |

---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "value": "*********",
        "count": ***
    },
    {
        "value": "",
        "count": ***
    }
]
```

---

### Response Structure
```json
[
    {
        "value": "string",
        "count": "number"
    }
]
```