## Delete report
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Permanently delete a custom report by its unique identifier.
Removes all saved configurations and metadata associated with the report.

**Latest status:** <!--status-->✅<!--status-end-->

```
DELETE /api/reports/:reportId
```

### 🔁 Example Request
```bash
curl -X DELETE https://api.umami.is/v1/reports/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
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