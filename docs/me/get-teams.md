## My teams
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all your teams.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/me/teams
```
---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/me/teams \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
    "data": [
        
    ],
    "count": 0,
    "page": 1,
    "pageSize": 10
}
```

---

### 📘 Response Structure
```json
{
    "data": [
        
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```