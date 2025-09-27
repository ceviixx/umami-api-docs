## Delete website entry
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Permanently delete a website entry and all associated analytics data.
Removes all collected statistics, events, and historical data irreversibly.

**Latest status:** <!--status-->✅<!--status-end-->

```
DELETE /api/websites/:websiteId
```

---

### 🔁 Example Request
```bash
curl -X DELETE https://api.umami.is/v1/websites/WEBSITE_ID \
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
