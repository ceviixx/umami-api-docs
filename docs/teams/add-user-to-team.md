## Add a user to a team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**
Add a specific user to the team.


**Latest check:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/:teamId/users
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
- userId: ID of user to be added.
- role: Role user will be added as [ team-member | team-view-only | team-manager ].

---

### 📨 Request Body
```json
{
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member"
}
```

---

### 🔁 Example Request
```http
POST /api/teams/:teamId/users HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z"
}
```

---

📘 Response Structure
```json

```
