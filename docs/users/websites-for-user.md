##  Websites from user
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get user websites by user id.

**Latest status:** <!--status--><!--status-end-->

```
GET /api/users/:userId/websites
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
curl -G https://api.umami.is/v1/users/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/websites \
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
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "updatedAt": "0000-00-00T00:00:00.00Z",
      "user": {
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "username": "xxxxx"
      },
      "domain": "xxxxxxx",
      "teamId": null,
      "resetAt": null,
      "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "createdBy": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "shareId": "xxxxxxxxxxxxx",
      "createdAt": "0000-00-00T00:00:00.00Z",
      "name": "xxxxx",
      "deletedAt": null
    }
  ],
  "orderBy": "name",
  "count": 3,
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
      "id": "string",
      "updatedAt": "date",
      "user": {
        "id": "string",
        "username": "string"
      },
      "domain": "string",
      "teamId": "string|null",
      "resetAt": "date|null",
      "userId": "string",
      "createdBy": "string",
      "shareId": "string",
      "createdAt": "date",
      "name": "string",
      "deletedAt": "date|null"
    }
  ],
  "orderBy": "string",
  "count": "number",
  "pageSize": "number",
  "page": "number"
}
```
