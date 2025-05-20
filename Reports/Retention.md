## Retention
**POST /reports/retention**

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
    "dateRange":{
        "startDate":"2025-04-30T22:00:00.000Z",
        "endDate":"2025-05-31T21:59:59.999Z",
        "value":"range:1746050400000:1748728799999",
        "offset":0,
        "unit":"day"
    },
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "timezone":"Europe/Berlin"
}
```

</details>

<details>
<summary>Sample response</summary>

```json
[
    {
        "date": "2025-05-18T22:00:00Z",
        "day": 0,
        "visitors": 1,
        "returnVisitors": 1,
        "percentage": 100
    }, 
    {
        "date": "2025-05-19T22:00:00Z",
        "day": 0,
        "visitors": 1,
        "returnVisitors": 1,
        "percentage": 100
    }
]
```

</details>
