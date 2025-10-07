## Account details
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get comprehensive account information for the authenticated user.
Returns user profile details, role permissions, and administrative status.

**Latest status:** <!--status-->🚨 [#27](https://github.com/ceviixx/umami-api-docs/issues/27)<!--status-end-->

```
GET /api/me
```
---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/me \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
    "user": {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "username": "xxxxxxxxxx@xxxxxx.xxxx",
        "role": "xxxx",
        "createdAt": "0000-00-00T00:00:00.000Z",
        "isAdmin": false
    },
    "grant": [],
    "token": "xxxxxxxxxxxxxxx",
    "shareToken": null
}
```

---

### 📘 Response Structure
```json
{
    "user": {
        "id": "string",
        "username": "string",
        "role": "string",
        "createdAt": "date",
        "isAdmin": "boolean"
    },
    "grant": ["string"],
    "token": "string",
    "shareToken": "string|null"
}
```