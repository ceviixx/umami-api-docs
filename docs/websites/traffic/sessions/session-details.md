## Session details
**Description:**

**Latest status:**

```
GET /api/websites/:id/sessions/:session_id
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
    "websiteId": "********-****-****-****-************",
    "distinctId": "",
    "browser": "*****",
    "os": "******",
    "device": "*******",
    "screen": "*********",
    "language": "*****",
    "country": "**",
    "region": "*****",
    "city": "********",
    "firstAt": "****-**-**T**:**:**Z",
    "lastAt": "****-**-**T**:**:**Z",
    "visits": 1,
    "views": 1,
    "events": 2,
    "totaltime": 2
}
```

---

### Response Structure
```json
{
    "id": "string",
    "websiteId": "string",
    "distinctId": "string",
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
    "events": "number",
    "totaltime": "number"
}
```