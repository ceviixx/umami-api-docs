## Gets session properties for a individual session
**GET /api/websites/:websiteId/sessions/:sessionId/properties**

**Parameters** \
None

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/properties
```

**Sample response**
```json
[
  {
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "sessionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dataKey": "email",
    "dataType": 1,
    "stringValue": "johndoe@mail.com",
    "numberValue": null,
    "dateValue": null,
    "createdAt": "2024-09-09T18:12:01Z"
  },
  {
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "sessionId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dataKey": "name",
    "dataType": 1,
    "stringValue": "John Doe",
    "numberValue": null,
    "dateValue": null,
    "createdAt": "2024-09-09T18:12:01Z"
  }
]
```