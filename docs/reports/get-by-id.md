## Details for id
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Gets session details for a individual session

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/reports/:reportId
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/reports/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
  "userId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "parameters" : {
    "fields" : [
      {
        "name" : "url",
        "type" : "string",
        "label" : "URL"
      }
    ],
    "dateRange" : {
      "num" : 90,
      "value" : "90day",
      "startDate" : "0000-00-00T00:00:00.000Z",
      "endDate" : "0000-00-00T00:00:00.000Z",
      "unit" : "day",
      "offset" : 0
    },
    "filters" : [

    ],
    "websiteId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  },
  "createdAt" : "0000-00-00T00:00:00.000Z",
  "id" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "updatedAt" : "0000-00-00T00:00:00.000Z",
  "type" : "insights",
  "websiteId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name" : "Insights",
  "description" : ""
}
```

---

### 📘 Response Structure
```json
{
  "userId" : "string",
  "parameters" : {
    "fields" : [
      {
        "name" : "string",
        "type" : "string",
        "label" : "string"
      }
    ],
    "dateRange" : {
      "num" : "number",
      "value" : "string",
      "startDate" : "date",
      "endDate" : "date",
      "unit" : "string",
      "offset" : "number"
    },
    "filters" : [
      {
        "value" : "string",
        "name" : "string",
        "type" : "string",
        "operator" : "string"
      }
    ],
    "websiteId" : "string"
  },
  "createdAt" : "date",
  "id" : "string",
  "updatedAt" : "date",
  "type" : "string",
  "websiteId" : "string",
  "name" : "string",
  "description" : "string"
}
```
