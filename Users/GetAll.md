## Get all users
**GET /api/admin/users**

> [!NOTE]  
> Admin access is required.

**Parameters** \
None

---

**Sample response**
```json
[
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "admin",
    "role": "admin",
    "createdAt": "0000-00-00T00:00:00.000Z"
  },
  {
    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "username": "guest",
    "role": "view-only",
    "createdAt": "0000-00-00T00:00:00.000Z"
  }
]
```