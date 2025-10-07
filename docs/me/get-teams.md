## My teams
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of teams where the authenticated user has membership.
Provides team information including member details, roles, and access codes.

**Latest status:** <!--status-->🚨 [#28](https://github.com/ceviixx/umami-api-docs/issues/28)<!--status-end-->

```
GET /api/me/teams
```
---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/me/teams \
  -H "x-umami-api-key: YOUR_API_KEY"
```

---

### 📦 Example Response
```json
{
    "data": [
        {
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "name": "Marketing",
            "accessCode": "team_dGKtGX56FbAcWb1i",
            "logoUrl": null,
            "createdAt": "0000-00-00T00:00:00.000Z",
            "updatedAt": "0000-00-00T00:00:00.000Z",
            "deletedAt": null,
            "teamUser": [
                {
                    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                    "role": "team-owner",
                    "createdAt": "0000-00-00T00:00:00.000Z",
                    "updatedAt": "0000-00-00T00:00:00.000Z",
                    "user": {
                        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
                        "username": "admin"
                    }
                }
            ],
            "_count": {
                "website": 5,
                "teamUser": 1
            }
        }
    ],
    "count": 8,
    "page": 1,
    "pageSize": 10
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
            "accessCode": "string",
            "logoUrl": "string|null",
            "createdAt": "date",
            "updatedAt": "date",
            "deletedAt": "string|null",
            "teamUser": [
                {
                    "id": "string",
                    "teamId": "string",
                    "userId": "string",
                    "role": "string",
                    "createdAt": "date",
                    "updatedAt": "date",
                    "user": {
                        "id": "string",
                        "username": "string"
                    }
                }
            ],
            "_count": {
                "website": "number",
                "teamUser": "number"
            }
        }
    ],
    "count": "number",
    "page": "number",
    "pageSize": "number"
}
```