##  Websites from user
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get paginated list of websites associated with a specific user.
Provides website ownership and access information including domains and sharing settings.

**Latest status:** <!--status-->🚨 [#38](https://github.com/ceviixx/umami-api-docs/issues/38)<!--status-end-->

```
GET /api/users/:userId/websites
```

---

### 🔍 Query Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| query              | string            | Search filter to find websites by name or domain           |                     | no       |
| page               | number            | Page number for pagination (starts from 1)                 |                     | no       |
| pageSize           | string            | Number of websites to return per page (pagination limit)   |                     | no       |
| orderBy            | string            | Column name for sorting results (e.g., name, domain, createdAt) |                     | no       |

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
