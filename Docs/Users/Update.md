## Update user
**POST /api/users/:userId**

**Parameters**
- username (string) The user's username.
- password (string) The user's password.
- role (string) [ admin | user | view-only ]

---

**Sample request body**
```json
{
  "username": "admin",
  "password": "umami",
  "role": "admin"
}
```

**Sample response**
```json
{
  "id": "1a457e1a-121a-11ee-be56-0242ac120002",
  "username": "umami",
  "role": "admin",
  "createdAt": "2023-04-13T20:22:55.756Z"
}
```