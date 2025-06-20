## Gets event data counts for a given event and property
**GET /api/websites/:websiteId/event-data/values**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- eventName: Event name.
- propertyName: Property name.


---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/values?startAt=0000000000000&endAt=0000000000000&eventName=survey&propertyName=gender
```

**Sample response**
```json
[
  {
    "value": "female",
    "total": 4
  },
  {
    "value": "male",
    "total": 1
  }
]
```