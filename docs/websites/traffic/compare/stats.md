## Stats
**Description:**

**Latest status:**

```
GET /api/websites/:id/stats
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt | number | | 1759777200000 | yes |
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
{
    "pageviews": **,
    "visitors": **,
    "visits": **,
    "bounces": **,
    "totaltime": **,
    "comparison": {
        "pageviews": **,
        "visitors": **,
        "visits": **,
        "bounces": **,
        "totaltime": **
    }
}
```

---

### Response Structure
```json
{
    "pageviews": "number",
    "visitors": "number",
    "visits": "number",
    "bounces": "number",
    "totaltime": "number",
    "comparison": {
        "pageviews": "number",
        "visitors": "number",
        "visits": "number",
        "bounces": "number",
        "totaltime": "number"
    }
}
```