## User from team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Get detailed information about a specific user's membership within a team.
Returns the user's role, membership dates, and relationship details.

**Latest status:** <!--status-->⏳<!--status-end-->

```
GET /api/teams/:teamId/users/:userId
```

---

### 🔁 Example Request
```bash
curl -X GET https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/users/yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy \
  -H "x-umami-api-key: YOUR_API_KEY"
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
