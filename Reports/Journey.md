## Journey
**POST /reports/journey**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- steps (Int)
- timezone (String)
- websiteId (String)
- startStep (optional String)
- endStep (optional String)

---

<details>
<summary>Sample request body</summary>

```json
{
    "steps":5,
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
[
    {
        "items": ["index.html", "outbound-link-click", null, null],
        "count": 1
    },
    {
        "items": ["/", null],
        "count": 1
    },
    {
        "items": ["index.html", "open-app-store", null],
        "count": 1
    }
]
```

</details>
