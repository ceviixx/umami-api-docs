## Events (Activity)
**Description:**

**Latest status:**

```
GET /api/websites/:id/events
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
    "data": [
        {
            "id": "********-****-****-****-************",
            "websiteId": "********-****-****-****-************",
            "sessionId": "********-****-****-****-************",
            "createdAt": "****-**-**T**:**:**Z",
            "hostname": "************",
            "urlPath": "********",
            "urlQuery": "",
            "referrerPath": "*",
            "referrerQuery": "",
            "referrerDomain": "***",
            "country": "**",
            "city": "********",
            "device": "********",
            "os": "*****",
            "browser": "****",
            "pageTitle": "*****",
            "eventType": *,
            "eventName": "********",
            "hasData": *
        }
    ],
    "count": *,
    "page": *,
    "pageSize": **
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
            "sessionId": "string",
            "createdAt": "date",
            "hostname": "string",
            "urlPath": "string",
            "urlQuery": "string",
            "referrerPath": "string",
            "referrerQuery": "string",
            "referrerDomain": "string",
            "country": "string",
            "city": "string",
            "device": "string",
            "os": "string",
            "browser": "string",
            "pageTitle": "string",
            "eventType": "number",
            "eventName": "string",
            "hasData": "number"
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```