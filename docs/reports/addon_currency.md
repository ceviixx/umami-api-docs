## Currency
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get list of available currencies used in revenue tracking within date range.
Essential for Revenue reports and can filter Attribution reports by specific currencies.
**Note:** This endpoint works on eu.umami.is but not on api.umami.is

**Latest status:** <!--status-->🚨 [#21](https://github.com/ceviixx/umami-api-docs/issues/21)<!--status-end-->

```
GET /api/reports/revenue
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| websiteId          | string            | Unique identifier of the website to get currencies for     | b27f2893-2747-4ec5-8c4f-463eb80d44af | yes      |
| startDate          | string            | Start date and time for the currency query in full date format | Thu Mar 27 2025 00:00:00 GMT+0100 (Central European Standard Time)       | yes      |
| endDate            | string            | End date and time for the currency query in full date format   | Tue Jun 24 2025 23:59:59 GMT+0200 (Central European Summer Time)       | yes      |

---

### 🔁 Example Request
```bash
curl -G https://eu.umami.is/api/reports/revenue \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "websiteId=b27f2893-2747-4ec5-8c4f-463eb80d44af" \
  --data-urlencode "startDate=Thu Mar 27 2025 00:00:00 GMT+0100 (Central European Standard Time)" \
  --data-urlencode "endDate=Tue Jun 24 2025 23:59:59 GMT+0200 (Central European Summer Time)"
```

---

### 📦 Example Response
```json
[
    {
        "currency": "USD"
    }
]
```

---

### 📘 Response Structure
```json
[
    {
        "currency": "string"
    }
]
```
