## Gets session details for a individual session
**GET /api/websites/:websiteId/sessions/:sessionId**

**Parameters** \
None

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

**Sample response**
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "hostname": "umami.is",
  "browser": "ios",
  "os": "iOS",
  "device": "mobile",
  "screen": "390x844",
  "language": "en-US",
  "country": "US",
  "subdivision1": "US-IN",
  "city": "Bloomington",
  "firstAt": "2024-09-09T18:12:01Z",
  "lastAt": "2024-09-09T18:12:08Z",
  "visits": 1,
  "views": 3,
  "events": 0,
  "totaltime": 7
}
```