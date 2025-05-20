## Funnel
**POST /reports/funnel**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- steps (Array)
  - type (String) [ url | event ]
  - value (String)
- timezone (String)
- websiteId (String)
- window (Int)

**Sample response**

```json
[
  {
        "type": "url",
    "value": "/",
    "visitors": 1,
    "previous": 0,
    "dropped": 0,
    "dropoff": null,
    "remaining": 1
    }
]
```
