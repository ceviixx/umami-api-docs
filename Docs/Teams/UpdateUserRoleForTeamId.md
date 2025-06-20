## Update a user's role on a team.
**POST /api/teams/:teamId/users/:userId**

**Parameters**
- role: Role user will be added as (member or view-only).

---

**Sample request body**
```json
{
    "role": "member"
}
```

**Sample response**
```json
ok
```