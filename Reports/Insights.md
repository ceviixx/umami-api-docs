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

---

<details>
<summary>Sample request body</summary>

```json
{
    "fields":[
        {
            "name":"url",
            "type":"string",
            "label":"URL"
        }
    ],
    "filters":[
    ],
    "websiteId":"xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",,
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
        "views": 8,
        "visitors": 3,
        "visits": 3,
        "bounces": 1,
        "totaltime": 242,
        "country": "US"
    }
]
```

</details>
