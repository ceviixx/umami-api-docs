## Update team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Update data of the team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/:teamId
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name               | string            | The team's name.                                            | marketing           | no       |
| accessCode         | string            | The team's access code.                                     | zY8pQwIUKjxDIot     | no       |

---

### 📨 Request Body
```json
{
  "name": "marketing",
  "accessCode": "zY8pQwIUKjxDIot"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/teams/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "name": "marketing",
    "accessCode": "zY8pQwIUKjxDIot"
  }'
```

---

📦 Example Response
```json
{
  "accessCode": "zY8pQwIUKjxDIot",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "marketing",
  "updatedAt": null
}
```

---

📘 Response Structure
```json

```
