## Gets event data property and value counts
**GET /api/websites/:websiteId/event-data/fields**

**Parameters**
- websiteId: (uuid) Website key identifier.
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.

---

**Sample route**
```
/api/websites/86d4095c-a2a8-4fc8-9521-103e858e2b41/event-data/fields?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
  {
    "propertyName": "age",
    "dataType": 2,
    "value": "33",
    "total": 1
  },
  {
    "propertyName": "age",
    "dataType": 2,
    "value": "31",
    "total": 4
  },
  {
    "propertyName": "gender",
    "dataType": 1,
    "value": "female",
    "total": 4
  },
  {
    "propertyName": "gender",
    "dataType": 1,
    "value": "male",
    "total": 1
  }
]
```
