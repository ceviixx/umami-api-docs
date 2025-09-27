## Reset data for website
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Reset all analytics data for a website while preserving the website configuration.
Removes all collected data but keeps website entry and tracking settings intact.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST /api/websites/:websiteId/reset
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/reset \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
    "ok": true
}
```

---

### 📘 Response Structure
```json
{
    "ok": "boolean"
}
```
