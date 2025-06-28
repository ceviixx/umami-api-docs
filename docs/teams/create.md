## Creates team
<!-- testable: false -->
<!-- expectedStatus: 200 -->
**Description:**  
Create an new team.

**Latest status:** <!--status-->⏳<!--status-end-->

```
POST /api/teams
```

---

### 📩 Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| name               | string            | The team's name.                                            | demo-team           | yes      |

---

### 📨 Request Body
```json
{
  "name": "marketing"
}
```

---

### 🔁 Example Request
```http
POST /api/teams HTTP/1.1
x-umami-api-key: {api-key}
```

---

📦 Example Response
```json
[
  {
    "accessCode": "xxwtoY2pzKjDIUQi",
    "createdAt": "0000-00-00T00:00:00.000Z",
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "name": "marketing",
    "updatedAt": null
  },
  {
    "createdAt": "0000-00-00T00:00:00.000Z",
    "id": "a9b1fbbc-ac22-4422-aa74-b2a2751ad87d",
    "role": "team-owner",
    "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "updatedAt": null,
    "userId": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy"
  }
]
```

---

📘 Response Structure
```json

```
