## Events
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets website event details within a given time range.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/websites/:websiteId/events
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |
| query   | string            | Search text              | 1234567890000   | no       |
| page    | number            | Determines page.         | 1               | no       |
| pageSize | number           | Determines how many results to return | 10 | no       |
| orderBy | string            | Order by column name.    | name            | no       |

---

### 🔁 Example Request
```http
GET /api/websites/:websiteId/events?startAt=0000000000000&endAt=0000000000000&query=&page=1&pageSize=20 HTTP/1.1
x-umami-api-key: {api-key}
```

---

### 📦 Example Response
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

---

### 📘 Response Structure
```json
{
  "data": [
    {
      "id": "string",
      "websiteId": "string",
      "sessionId": "string",
      "createdAt": "string",
      "urlPath": "string",
      "urlQuery": "string",
      "referrerPath": "string",
      "referrerQuery": "string",
      "referrerDomain": "string",
      "pageTitle": "string",
      "eventType": "number",
      "eventName": "string"
    }
  ],
  "count": "number",
  "page": "number",
  "pageSize": "number"
}
```
