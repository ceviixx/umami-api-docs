## Invite
**Description:**

**Latest status:**

```
POST /api/invite
```

---

### Request Body Parameters
| Name               | Type              | Description                                                 | Example             | Required |
| :----------------- | :---------------- | :---------------------------------------------------------- | :------------------ | :------: |
| email | string | Email of the user | john@example.com | yes |
| role | string | Role (team-manager / team-member / team-view-only) | team-member | yes |
| teamId | string | ID of the team to invite | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | yes |
---

### Request Body
```json
{
    "email": "john@example.com",
    "role": "team-manager",
    "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

---

### Example Request
```bash

```

---

### Example Response
```json

```

---

### Response Structure
```json

```