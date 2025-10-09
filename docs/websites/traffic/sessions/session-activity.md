## Session activity
**Description:**

**Latest status:**

```
GET /api/websites/:id/sessions/:session_id/activity
```

---

### Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt | number | | 1759863029000 | yes |
| endAt | number | | 1759863031000 | yes |
---

### Example Request
```bash

```

---

### Example Response
```json
[
    {
        "createdAt": "****-**-**T**:**:**Z",
        "urlPath": "*****",
        "urlQuery": "",
        "referrerDomain": "",
        "eventId": "********-****-****-****-************",
        "eventType": *,
        "eventName": "********",
        "visitId": "********-****-****-****-************",
        "hasData": *
    },
    {
        "createdAt": "****-**-**T**:**:**Z",
        "urlPath": "********",
        "urlQuery": "",
        "referrerDomain": "",
        "eventId": "********-****-****-****-************",
        "eventType": *,
        "eventName": "",
        "visitId": "********-****-****-****-************",
        "hasData": *
    }
]
```

---

### Response Structure
```json
[
    {
        "createdAt": "date",
        "urlPath": "string",
        "urlQuery": "string",
        "referrerDomain": "string",
        "eventId": "string",
        "eventType": "number",
        "eventName": "string",
        "visitId": "string",
        "hasData": "number"
    }
]
```