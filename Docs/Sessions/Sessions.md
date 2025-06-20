## Gets website session details within a given time range.
**GET /api/websites/:websiteId/sessions**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- query: (optional string) Search text.
- page: (optional number, default 1) Determines page.
- pageSize: (optional string) Determines how many results to return.
- orderBy: (optional string) Order by column name.

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/sessions?page=1&startAt=0000000000000&endAt=0000000000000&pageSize=20
```

**Sample response**
```json
{
  "data": [
    {
      "id": "5a45d799-e6f5-56ac-9893-fde6f769c36a",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "hostname": "umami.is",
      "browser": "chrome",
      "os": "Windows 10",
      "device": "laptop",
      "screen": "1536x960",
      "language": "en-US",
      "country": "US",
      "subdivision1": "US-CA",
      "city": "Roseville",
      "firstAt": "2024-09-09T17:44:35Z",
      "lastAt": "2024-09-09T17:44:35Z",
      "visits": 1,
      "views": 1,
      "createdAt": "2024-09-09T17:44:35Z"
    },
    {
      "id": "753ce23b-0dab-5a33-badc-4d2239528dd9",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "hostname": "umami.is",
      "browser": "chrome",
      "os": "Windows 10",
      "device": "desktop",
      "screen": "2560x1440",
      "language": "de-DE",
      "country": "DE",
      "subdivision1": "DE-BY",
      "city": "Munich",
      "firstAt": "2024-09-09T08:54:18Z",
      "lastAt": "2024-09-09T17:44:29Z",
      "visits": 5,
      "views": 66,
      "createdAt": "2024-09-09T17:44:29Z"
    }
  ],
  "count": 1000,
  "page": 1,
  "pageSize": 20
}
```