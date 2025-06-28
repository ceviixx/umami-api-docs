## Currency
<!-- testable: true -->
**Description:**  
Get currency for given range. Needed for Revenue and optional in Attribution reports.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/reports/revenue
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| startAt            | string            | Date time start          | Thu Mar 27 2025 00:00:00 GMT+0100 (Central European Standard Time)       | yes      |
| endAt              | string            | Date time end            | Tue Jun 24 2025 23:59:59 GMT+0200 (Central European Summer Time)       | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/reports/revenue \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=Thu Mar 27 2025 00:00:00 GMT+0100 (Central European Standard Time)" \
  --data-urlencode "endAt=Tue Jun 24 2025 23:59:59 GMT+0200 (Central European Summer Time)"
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
