## Update user team role
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Update a user's role on a team.

**Latest check:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/:teamId/users/:userId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| role               | string            | Role user will be added as (member or view-only)            | member              | yes      |

---

### 📨 Request Body
```json
{
    "role": "member"
}
```

---

### 🔁 Example Request
```http
POST /api/teams/:teamId/users/:userId HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
ok
```

---

📘 Response Structure
```json

```
