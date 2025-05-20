## UTM
**POST /reports/utm**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- timezone (String)
- websiteId (String)

**Sample response**

```json
{
  "utm_source" : {
    "test" : 1
  },
  "utm_content" : {
    "email-newsletter-1" : 1124
  },
  "utm_term" : {
    "software" : 4
  },
  "utm_medium" : {
    "test" : 1
  },
  "utm_campaign" : {
    "test" : 1
  },
  "utm_agid" : {
    "12345" : 5
  },
  "utm_banner" : {
    "12345" : 1
  }
}
```
