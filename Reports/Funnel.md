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

---

**Sample request body**
```json
{
    "window":60,
    "steps":[
        {
            "type":"url",
            "value":"/"
        },
        {
            "type":"url",
            "value":"/contact"
        }
    ],
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-13T22:00:00.000Z",
        "endDate":"2025-05-20T21:59:59.999Z",
        "unit":"day",
        "offset":0,
        "num":7,
        "value":"7day"
    },
    "timezone":"Europe/Berlin"
}
```

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