## Get a team.
**GET /api/teams/:teamId**

**Parameters** \
None

---

**Sample response**
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "marketing",
  "accessCode": "team_cVQf0mYPriZlPAgK",
  "logoUrl": null,
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": "0000-00-00T00:00:00.000Z",
  "deletedAt": null,
  "teamUser": [
    {
      "id": "yyyyyyyy-yyyy-yyyy-yyyy-yyyyyyyyyyyy",
      "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "userId": "zzzzzzzz-zzzz-zzzz-zzzz-zzzzzzzzzzzz",
      "role": "team-owner",
      "createdAt": "0000-00-00T00:00:00.000Z",
      "updatedAt": "0000-00-00T00:00:00.000Z"
    }
  ]
}
```