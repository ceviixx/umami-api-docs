## List reports
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of all custom reports created by the authenticated user.
Returns saved report configurations for data analysis with reusable settings.

**Latest status:** <!--status-->🚨 [#33](https://github.com/ceviixx/umami-api-docs/issues/33)<!--status-end-->

```
GET /api/reports
```

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/reports \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
  "data" : [
    {
      "userId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "parameters" : "{\"fields\":[{\"name\":\"url\",\"type\":\"string\",\"label\":\"URL\"}],\"filters\":[],\"websiteId\":\"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\",\"dateRange\":{\"startDate\":\"0000-00-00T00:00:00.000Z\",\"endDate\":\"0000-00-00T00:00:00.000Z\",\"unit\":\"day\",\"offset\":0,\"num\":90,\"value\":\"90day\"}}",
      "createdAt" : "0000-00-00T00:00:00.000Z",
      "id" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "website" : {
        "domain" : "example.com"
      },
      "updatedAt" : "0000-00-00T00:00:00.000Z",
      "type" : "insights",
      "websiteId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name" : "Insights",
      "description" : ""
    }
  ],
  "count" : 1,
  "pageSize" : 10,
  "page" : 1
}
```

---

### 📘 Response Structure
```json
{
  "data" : [
    {
      "userId" : "string",
      "parameters" : "object",
      "createdAt" : "date",
      "id" : "string",
      "website" : {
        "domain" : "string"
      },
      "updatedAt" : "date",
      "type" : "string",
      "websiteId" : "string",
      "name" : "string",
      "description" : "string"
    }
  ],
  "count" : "number",
  "pageSize" : "number",
  "page" : "number"
}
```