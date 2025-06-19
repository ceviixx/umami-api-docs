## Gets session activity for a individual session
**GET /api/websites/:websiteId/sessions/:sessionId/activity**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/activity?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
  {
    "createdAt": "2024-09-09T18:12:08Z",
    "urlPath": "/websites/fd4bdd56-2135-4c42-9518-55e72669f23c",
    "urlQuery": "",
    "referrerDomain": "",
    "eventId": "a154aebc-10cf-4a26-8187-c541ef0d2929",
    "eventType": 1,
    "eventName": "",
    "visitId": "609a5116-b139-5c6d-9293-fbea9b8a3b61"
  },
  {
    "createdAt": "2024-09-09T18:12:01Z",
    "urlPath": "/settings/websites",
    "urlQuery": "",
    "referrerDomain": "",
    "eventId": "92246b7b-e3e2-4c9d-b61e-fab69d993ad7",
    "eventType": 1,
    "eventName": "",
    "visitId": "609a5116-b139-5c6d-9293-fbea9b8a3b61"
  }
]
```