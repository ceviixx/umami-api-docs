## Gets summarized website events, fields, and records within a given time range.
**GET /api/websites/:websiteId/event-data/stats**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.


---

**Sample route**
```
https://umami.mydomain.com/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/event-data/stats?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
    { 
        "events": 16, 
        "fields": 13, 
        "records": 26 
    }
]
```