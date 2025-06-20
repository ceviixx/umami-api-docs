## Attribution
**POST /reports/attribution**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- model (String) [ firstClick | lastClick ]
- steps (Array)
  - type String [ event | url ]
  - value String
- timezone: String
- websiteId: String

--- 

**Sample request body**
```json
{
    "model":"firstClick",
    "steps":[
        {
            "type":"event",
            "value":"/"
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
{
    "paidAds" : [
        {
            "name" : "Google",
            "value" : 129
        }
    ],
    "referrer" : [
        {
            "name" : "google.com",
            "value" : 21273
        }
    ],
    "utm_source" : [
        {
            "name" : "yahoo.de",
            "value" : 671
        }
    ],
    "utm_content" : [
        {
            "name" : "info-email-3",
            "value" : 24
        }
    ],
    "utm_medium" : [
        {
            "name" : "outbound-email",
            "value" : 150
        }
    ],
    "utm_campaign" : [
        {
            "name" : "analytics",
            "value" : 69
        }
    ],
    "utm_term" : [
        {
            "name" : "software",
            "value" : 2
        }
    ],
    "total" : {
        "visitors" : 79106,
        "visits" : 105066,
        "pageviews" : 136971
    }
}
```