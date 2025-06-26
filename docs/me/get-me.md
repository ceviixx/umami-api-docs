## My websites
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get data about your account basaed on authentification.

**Latest check:** <!--status-->✅<!--status-end-->

```
GET /api/me
```
---

### 🔁 Example Request
```
GET "https://api.umami.is/v1/me"
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
    "grant": [],
    "token": "string",
    "shareToken": "string|null"
}
```