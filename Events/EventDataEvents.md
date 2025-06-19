## Get events from data
**GET /api/websites/:websiteId/event-data/events**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- event: (optional) Event name filter.


---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/events?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
  {
    "eventName": "button-click",
    "propertyName": "id",
    "dataType": 1,
    "total": 4
  },
  {
    "eventName": "button-click",
    "propertyName": "name",
    "dataType": 1,
    "total": 4
  },
  {
    "eventName": "track-product",
    "propertyName": "price",
    "dataType": 2,
    "total": 2
  }
]
```