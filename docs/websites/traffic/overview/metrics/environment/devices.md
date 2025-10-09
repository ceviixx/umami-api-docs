## Devices
**Description:**

**Latest status:**

```
GET /api/websites/:id/metrics
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt | number | | 1759777200000 | yes |
| endAt | number | | 1759867199999 | yes |
| unit | string | | hour | yes |
| timezone | string | | Europe/Berlin | yes |
| type | string | | device | yes |
---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "x": "desktop",
        "y": 3
    }
]
```

---

### Response Structure
```json
[
    {
        "x": "string",
        "y": "number"
    }
]
```