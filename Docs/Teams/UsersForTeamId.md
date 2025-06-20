## Get all users that belong to a team.
**GET /api/teams/:teamId/users**

**Parameters**
- query: (optional string) Search text.
- page: (optional number, default 1) Determines page.
- pageSize: (optional string) Determines how many results to return.
- orderBy: (optional string, default name) Order by column name.

---

**Sample response**
```json
{
  "data": [
    {
      "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "teamId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "role": "team-owner",
      "createdAt": "0000-00-00T00:00:00.000Z",
      "updatedAt": "0000-00-00T00:00:00.000Z",
      "user": { 
        "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", "username": "umami" 
      }
    }
  ],
  "count": 1,
  "page": 1,
  "pageSize": 10
}
```