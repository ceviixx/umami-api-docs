## Get team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get all details for the team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId
```

---

### 🔁 Example Request
```http
GET /api/teams/:teamId HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "marketing",
  "accessCode": "team_cVQf0mYPriZlPAgK",
  "logoUrl": null,
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z",
  "deletedAt": null,
  "teamUser": [
    {
      "id": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy",
      "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "userId": "zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz",
      "role": "team-owner",
      "createdAt": "0000-00-00T00:00:00.000Z",
      "updatedAt": "0000-00-00T00:00:00.000Z"
    }
  ]
}
```

---

📘 Response Structure
```json

```
