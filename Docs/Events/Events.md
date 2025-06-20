## Gets website event details within a given time range.
**GET /api/websites/:websiteId/events**

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
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/events?startAt=0000000000000&endAt=0000000000000&query=&page=1&pageSize=20
```

**Sample response**
```json
{
  "data": [
    {
      "id": "dbcfe5ef-99f4-44e1-ad3f-c157eb102a13",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "sessionId": "970c97c5-2071-540a-be88-098eb730ccac",
      "createdAt": "2024-09-06T23:36:44Z",
      "urlPath": "/docs/api/authentication",
      "urlQuery": "",
      "referrerPath": "/docs/api",
      "referrerQuery": "",
      "referrerDomain": "",
      "pageTitle": "Overview – Umami",
      "eventType": 1,
      "eventName": ""
    },
    {
      "id": "9ba0da36-136b-4fef-afae-a5cdba78017b",
      "websiteId": "86d4095c-a2a8-4fc8-9521-103e858e2b41",
      "sessionId": "466cb31d-8cda-5dc3-9dd2-b259f29551a5",
      "createdAt": "2024-09-06T23:36:33Z",
      "urlPath": "/",
      "urlQuery": "utm_source=apollo&utm_medium=outbound-email&utm_campaign=founders",
      "referrerPath": "",
      "referrerQuery": "",
      "referrerDomain": "",
      "pageTitle": "Umami",
      "eventType": 1,
      "eventName": ""
    }
  ],
  "count": 1000,
  "page": 1,
  "pageSize": 20
}
```