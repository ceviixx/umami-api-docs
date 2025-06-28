## User from team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get a user belonging to a team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/users/:userId
```

---

### 🔁 Example Request
```http
GET /api/teams/:teamId/users/:userId HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-owner",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": null
}
```

---

📘 Response Structure
```json

```
