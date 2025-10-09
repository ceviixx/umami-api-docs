## Sessions
**Description:**

**Latest status:**

```
GET /api/websites/:id/sessions
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt | number | | 1759777200000 | yes |
| endAt | number | | 1759867199999 | yes |
| startDate | string | | 2025-10-06T19%3A00%3A00.000Z | yes |
| endDate | string | | 2025-10-07T19%3A59%3A59.999Z | yes |
| unit | string | | hour | yes |
| timezone | string | | Europe/Berlin | yes |
| pageSize | number | | 20 | no |
---

### Example Request
```bash

```
---

### Example Response
```json
{
    "data": [
        {
            "id": "********-****-****-****-************",
            "websiteId": "********-****-****-****-************",
            "hostname": [
                "********",
                "********"
            ],
            "browser": "****",
            "os": "*******",
            "device": "********",
            "screen": "*********",
            "language": "*****",
            "country": "**",
            "region": "*****",
            "city": "********",
            "firstAt": "****-**-**T**:**:**Z",
            "lastAt": "****-**-**T**:**:**Z",
            "visits": *,
            "views": *,
            "createdAt": "****-**-**T**:**:**Z",
        }
    ],
    "count": *,
    "page": *,
    "pageSize": *
}
```

---

### Response Structure
```json
{
    "data": [
        {
            "id": "string",
            "websiteId": "string",
            "hostname": [
                "string"
            ],
            "browser": "string",
            "os": "string",
            "device": "string",
            "screen": "string",
            "language": "string",
            "country": "string",
            "region": "string",
            "city": "string",
            "firstAt": "date",
            "lastAt": "date",
            "visits": "number",
            "views": "number",
            "createdAt": "date"
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```