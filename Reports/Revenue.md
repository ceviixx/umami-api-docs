## Revenue
**POST /reports/revenue**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- currency (String) [ USD | EUR | ... ]
- timezone (String)
- websiteId (String)

---

<details>
<summary>Sample request body</summary>

```json
{
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "dateRange":{
        "startDate":"2025-05-19T14:00:00.000Z",
        "endDate":"2025-05-20T13:59:59.999Z",
        "offset":0,
        "num":24,
        "unit":"hour",
        "value":"24hour"
    },
    "currency":"USD",
    "timezone":"Europe/Berlin"
}
```

</details>

<details>
<summary>Sample response</summary>

```json
{
    "chart": [
        {
            "x": "",
            "t": "2025-05-19T15:00:00Z",
            "y": 289.94
        }
    ],
    "country": [
        {
            "name": "DE",
            "value": 289.94
        }
    ],
    "total": {
        "sum": 289.94,
        "count": 6,
        "unique_count": 1
    },
    "table": [
        {
            "currency": "USD",
            "sum": 289.94,
            "count": 6,
            "unique_count": 1
        }
    ]
}
```

<details>
