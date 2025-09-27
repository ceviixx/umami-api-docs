## Join team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Join an existing team using a valid access code.
Allows users to become team members through invitation links with default permissions.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/teams/join
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| accessCode         | string            | Valid team access code for joining (provided by team admin) | xxwtoY8pzKjDIUQi    | yes      |

---

### 📨 Request Body
```json
{
  "accessCode": "xxwtoY8pzKjDIUQi"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://api.umami.is/v1/teams/join \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -d '{
    "accessCode": "xxwtoY8pzKjDIUQi"
  }'
```

---

📦 Example Response
```json
[
  {
    "accessCode": "xxwtoY8pzKjDIUQi",
    "createdAt": "0000-00-00T00:00:00.000Z",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "marketing",
    "teamUser": [
      {
        "createdAt": "0000-00-00T00:00:00.000Z",
        "id": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy",
        "role": "team-owner",
        "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "updatedAt": null,
        "user": { 
          "id": "zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz", "username": "admin"
        },
        "userId": "zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz"
      }
    ]
  }
]
```

---

📘 Response Structure
```json

```
