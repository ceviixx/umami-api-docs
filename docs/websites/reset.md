## Reset data for website
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Resets a website by removing all data related to the website.

**Latest status:** <!--status-->⏳<!--status-end-->

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

📦 Example Response
```json
ok
```

---

📘 Response Structure
```json

```
