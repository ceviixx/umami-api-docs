## Update a team.
**POST /api/teams/:teamId**

**Parameters**
- name: (optional string) The team's name.
- accessCode: (optional string) The team's access code.

---

**Sample request body**
```json
{
  "name": "marketing",
  "accessCode": "zY8pQwIUKjxDIot"
}
```

**Sample response**
```json
{
  "accessCode": "zY8pQwIUKjxDIot",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "marketing",
  "updatedAt": null
}
```