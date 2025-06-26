## Currency
<!-- testable: true -->
**Description:**  
Get currency for given range. Needed for Revenue and optional in Attribution reports.

**Latest check:** <!--status-->✅<!--status-end-->

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
```http
GET /api/reports/revenue?websiteId=:websiteId&startDate=Thu+Mar+27+2025+00%3A00%3A00+GMT%2B0100+%28Central+European+Standard+Time%29&endDate=Tue+Jun+24+2025+23%3A59%3A59+GMT%2B0200+%28Central+European+Summer+Time%29
 HTTP/1.1
x-umami-api-key: {api-key}
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
