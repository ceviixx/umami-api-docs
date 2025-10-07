## Admin all websites
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all websites across the entire Umami system with admin privileges.
Returns comprehensive list including user ownership and team associations.

**Latest status:** <!--status-->🚨 [#25](https://github.com/ceviixx/umami-api-docs/issues/25)<!--status-end-->

```
GET /api/admin/websites
```
---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| userId             | string            | Filter websites by specific user ID (shows only websites owned by this user) |                     | no       |
| includeOwnedTeams  | string            | Include websites from teams that the specified user owns (boolean: true/false) |                     | no       |
| includeAllTeams    | string            | Include websites from all teams regardless of user membership (boolean: true/false) |                     | no       |

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/admin/websites \
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