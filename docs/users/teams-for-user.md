## Teams from user
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get user teams by user id.

**Latest status:** <!--status-->✔️<!--status-end-->

```
GET /api/users/:userId/teams
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| query              | string            | Search text.                                                |                     | no       |
| page               | number            | Determines page.                                            |                     | no       |
| pageSize           | string            | Determines how many results to return.                      |                     | no       |
| orderBy            | string            | Order by column name.                                       |                     | no       |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/users/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/teams \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "query=" \
  --data-urlencode "page=1" \
  --data-urlencode "pageSize=25" \
  --data-urlencode "orderBy=name"
```

---

📦 Example Response
```json
{
  "data": [
    {
      "_count": {
        "website": 0,
        "teamUser": 1
      },
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "logoUrl": null,
      "deletedAt": null,
      "teamUser": [
        {
          "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
          "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
          "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
          "role": "team-owner",
          "updatedAt": "0000-00-00T00:00:00.00Z",
          "createdAt": "0000-00-00T00:00:00.00Z",
          "user": {
            "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
            "username": "xxxxx"
          }
        }
      ],
      "accessCode": "team_xxxxxxxxxxx",
      "createdAt": "0000-00-00T00:00:00.00Z",
      "updatedAt": "0000-00-00T00:00:00.00Z",
      "name": "xxxxxx"
    }
  ],
  "count": 8,
  "pageSize": 10,
  "page": 1
}
```

---

📘 Response Structure
```json
{
  "data": [
    {
      "_count": {
        "website": "number",
        "teamUser": "number"
      },
      "id": "string",
      "logoUrl": "string|null",
      "deletedAt": "string|null",
      "teamUser": [
        {
          "teamId": "string",
          "userId": "string",
          "id": "string",
          "role": "string",
          "updatedAt": "date",
          "createdAt": "date",
          "user": {
            "id": "string",
            "username": "string"
          }
        }
      ],
      "accessCode": "string",
      "createdAt": "date",
      "updatedAt": "date",
      "name": "string"
    }
  ],
  "count": "number",
  "pageSize": "number",
  "page": "number"
}
```
