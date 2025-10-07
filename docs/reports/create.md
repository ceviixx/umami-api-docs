## Save Report
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Save a configured analytical report with specific parameters for future access.
Persists report configurations created through Umami interface for reuse and sharing.

**Latest status:** <!--status-->🚨 [#24](https://github.com/ceviixx/umami-api-docs/issues/24)<!--status-end-->

```
POST /api/reports
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name               | string            | Display name for the saved report (max 200 characters)     | Monthly Traffic Report | yes      |
| description        | string            | Description of the report's purpose and content (max 500 characters) | Detailed analysis of monthly traffic patterns | yes      |
| type               | string            | Type of report being saved (funnel, insights, retention, utm, goals, journey, revenue, attribution) | insights            | yes      |
| websiteId          | string            | UUID of the website this report configuration belongs to    | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes      |
| parameters         | object            | Complete configuration object containing all report-specific settings, filters, and parameters | {} | yes      |

---

### 📨 Request Body
```json
{
    "name": "Monthly Traffic Insights",
    "description": "Comprehensive monthly traffic analysis with device and location breakdowns",
    "type": "insights",
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "parameters": {
        "dateRange": {
            "startDate": "2025-09-01T00:00:00.000Z",
            "endDate": "2025-09-30T23:59:59.999Z",
            "unit": "day"
        },
        "filters": [
            {"property": "device", "operator": "eq", "value": "desktop"}
        ],
        "groupBy": ["country", "device"]
    }
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/reports \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Monthly Traffic Insights",
    "description": "Comprehensive monthly traffic analysis with device and location breakdowns",
    "type": "insights",
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "parameters": {
      "dateRange": {
        "startDate": "2025-09-01T00:00:00.000Z",
        "endDate": "2025-09-30T23:59:59.999Z",
        "unit": "day"
      },
      "filters": [
        {"property": "device", "operator": "eq", "value": "desktop"}
      ],
      "groupBy": ["country", "device"]
    }
  }'
```

---

### 📦 Example Response
```json
{
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "websiteId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "type": "insights",
    "name": "Monthly Traffic Insights",
    "description": "Comprehensive monthly traffic analysis with device and location breakdowns",
    "parameters": {
        "dateRange": {
            "startDate": "2025-09-01T00:00:00.000Z",
            "endDate": "2025-09-30T23:59:59.999Z",
            "unit": "day"
        },
        "filters": [
            {"property": "device", "operator": "eq", "value": "desktop"}
        ],
        "groupBy": ["country", "device"]
    },
    "createdAt": "2025-09-23T10:30:00.000Z",
    "updatedAt": "2025-09-23T10:30:00.000Z"
}
```

---

### 📘 Response Structure
```json
{
    "id": "string",
    "userId": "string",
    "websiteId": "string",
    "type": "string",
    "name": "string",
    "description": "string",
    "parameters": "object",
    "createdAt": "date",
    "updatedAt": "date"
}
```
