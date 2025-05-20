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

---

<details>
<summary>Sample request body</summary>

```json
{
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-17T22:00:00.000Z",
        "endDate":"2025-05-24T21:59:59.999Z",
        "unit":"day",
        "offset":0,
        "num":1,
        "value":"0week"
    },
    "timezone":"Europe/Berlin"
}
```

</details>

<details>
<summary>Sample response</summary>

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

</details>
