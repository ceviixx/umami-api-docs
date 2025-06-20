
## Gets session data counts by property name
**GET /api/websites/:websiteId/session-data/properties**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/session-data/properties?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
  {
    "propertyName": "id",
    "total": 1039
  },
  {
    "propertyName": "region",
    "total": 1039
  },
  {
    "propertyName": "name",
    "total": 1039
  },
  {
    "propertyName": "email",
    "total": 1039
  }
]
```