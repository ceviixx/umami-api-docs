## me websites
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all your websites.

**Latest check:** <!--status--><!--status-end-->

```
GET /api/me/websites
```
---

### 🔁 Example Request
```
GET "https://api.umami.is/v1/me/websites"
```
---

### 📦 Example Response
```json
{
    "data": [
        {
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "name": "xxxx",
            "domain": "xxxx.xxxx",
            "shareId": "adfa90w3rlasdf",
            "resetAt": null,
            "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "teamId": null,
            "createdBy": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "createdAt": "0000-00-00T00:00:00.000Z",
            "updatedAt": "0000-00-00T00:00:00.000Z",
            "deletedAt": null,
            "user": {
                "username": "xxxxx@xxxxx.xxx",
                "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"
            }
        }
    ],
    "count": 3,
    "page": 1,
    "pageSize": 10,
    "orderBy": "name"
}
```

---

### 📘 Response Structure
```json
```