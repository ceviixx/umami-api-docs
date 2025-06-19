## Creates a team.
**POST /api/teams**

**Parameters**
- name: (string) The team's name.

---

**Sample request body**
```json
{
  "name": "marketing"
}
```

**Sample response**
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