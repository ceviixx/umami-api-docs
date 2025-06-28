## Admin all websites
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all websites as admin.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/admin/websites
```
---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| userId             | string            |                                                             |                     | no       |
| includeOwnedTeams  | string            |                                                             |                     | no       |
| includeAllTeams    | string            |                                                             |                     | no       |

---

### 🔁 Example Request
```
GET /api/admin/websites
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
    "count": 1,
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
            "shareId": "string",
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