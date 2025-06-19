## Join a team.
**POST /api/teams/join**

**Parameters**
- accessCode: (string) The team's access code.

---

**Sample request body**
```json
{
  "accessCode": "xxwtoY8pzKjDIUQi"
}
```

**Sample response**
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