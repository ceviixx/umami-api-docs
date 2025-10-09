## Pageviews
**Description:**

**Latest status:**

```
GET /api/websites/:id/pageviews
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| compare | string | prev (previous period) / yoy (previous year) | prev | yes |
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
    "pageviews": [
        {
            "x": "****-**-**T**:**:**Z",
            "y": **
        },
        {
            "x": "****-**-**T**:**:**Z",
            "y": **
        }
    ],
    "sessions": [
        {
            "x": "****-**-**T**:**:**Z",
            "y": **
        },
        {
            "x": "****-**-**T**:**:**Z",
            "y": **
        }
    ],
    "startDate": "****-**-**T**:**:**.***Z",
    "endDate": "****-**-**T**:**:**.***Z",
    "compare": {
        "pageviews": [
            {
                "x": "****-**-**T**:**:**Z",
                "y": **
            },
            {
                "x": "****-**-**T**:**:**Z",
                "y": **
            }
        ],
        "sessions": [
            {
                "x": "****-**-**T**:**:**Z",
                "y": **
            },
            {
                "x": "****-**-**T**:**:**Z",
                "y": **
            }
        ],
        "startDate": "****-**-**T**:**:**.***Z",
        "endDate": "****-**-**T**:**:**.***Z"
    }
}
```

---

### Response Structure
```json
{
    "pageviews": [
        {
            "x": "date",
            "y": "number"
        }
    ],
    "sessions": [
        {
            "x": "date",
            "y": "number"
        }
    ],
    "startDate": "date",
    "endDate": "date",
    "compare": {
        "pageviews": [
            {
                "x": "date",
                "y": "number"
            }
        ],
        "sessions": [
            {
                "x": "date",
                "y": "number"
            }
        ],
        "startDate": "date",
        "endDate": "date"
    }
}
```