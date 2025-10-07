## My websites
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of websites owned by or accessible to the authenticated user.
Provides complete website information including domain details and sharing settings.

**Latest status:** <!--status-->🚨 [#29](https://github.com/ceviixx/umami-api-docs/issues/29)<!--status-end-->

```
GET /api/me/websites
```
---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/me/websites \
  -H "x-umami-api-key: YOUR_API_KEY"
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
{
    "data": [
        {
            "id": "string",
            "name": "string",
            "domain": "string",
            "shareId": "string|null",
            "resetAt": "date|null",
            "userId": "string",
            "teamId": "string|null",
            "createdBy": "string",
            "createdAt": "date",
            "updatedAt": "date",
            "deletedAt": "date|null",
            "user": {
                "username": "string",
                "id": "string"
            }
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number",
    "orderBy": "string"
}
```