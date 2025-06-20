## Add a user to a team.
**POST /api/teams/:teamId/users**

**Parameters**
- userId: ID of user to be added.
- role: Role user will be added as [ team-member | team-view-only | team-manager ].

---

**Sample request body**
```json
{
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member"
}
```

**Sample response**
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "role": "team-member",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z"
}
```