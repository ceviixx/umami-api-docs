## Insights
**POST /reports/insights**

> [!NOTE]  
> Currently only working on self hosted but not on cloud

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- fields (Array) **1 required** 
  - label (String)
  - name (String)
  - type (String)
- filters (Array)
  - name (String)
  - operator (String) [ eq | neq | c | dnc ]
  - type (String)
- timezone (String)
- websiteId (String)

**Sample response**

```json
[
  {
        "views": 8,
    "visitors": 3,
    "visits": 3,
    "bounces": 1,
    "totaltime": 242,
    "country": "US"
    },
]
```
