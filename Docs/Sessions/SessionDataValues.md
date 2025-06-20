## Gets session data counts for a given property
**GET /api/websites/:websiteId/session-data/values**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- propertyName: Property name.

---

**Sample route**
```
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/session-data/values?startAt=0000000000000&endAt=0000000000000&propertyName=region
```

**Sample response**
```json
[
  { 
    "value": "EU", 
    "total": 609 
  },
  { 
    "value": "US", 
    "total": 431 
  }
]
```