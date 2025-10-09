## Series (Chart)
**Description:**

**Latest status:**

```
GET https://api.umami.is/v1/websites/:id/events/series
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt | number | | 1759777200000 | yes |
| endAt | number | | 1759867199999 | yes |
| unit | string | | hour | yes |
| timezone | string | | Europe/Berlin | yes |

---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "x": "******",
        "t": "****-**-**T**:**:**Z",
        "y": *
    },
    {
        "x": "**********",
        "t": "****-**-**T**:**:**Z",
        "y": *
    }
]
```

---

### Response Structure
```json
[
    {
        "x": "string",
        "t": "date",
        "y": "number"
    },
    {
        "x": "string",
        "t": "date",
        "y": "number"
    }
]
```