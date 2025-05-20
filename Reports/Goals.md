## Goals
**POST /reports/goals**

**Parameters**

- [dateRange](./Parameter/dateRange.md) (Object)
  - startDate (String) e.g. 2025-05-13T22:00:00.000Z
  - endDate (String) e.g. 2025-05-20T21:59:59.999Z
  - num: (Int) [ 1 | 24 | ... ]
  - offset (Int) [ 0 | 0 |  ... ]
  - unit (String) [ hour | hour | ... ]
  - value (String) [ 0day | 24hour | .... ] 
- goals (Array)
  - type (String) [ url | event | event-data ]
    if **event-data** is type you need to add 
    - operator (String) [ count | average | sum ]
    - property (String) 
  - value (String)
  - goal (Int)
- timezone (String)
- websiteId (String)

---

<details>
<summary>Sample request body</summary>

```json
{
    "goals":[
        {
            "type":"url",
            "value":"/",
            "goal":10
        }
    ],
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
        "type": "url",
        "value": "/",
        "goal": 10,
        "result": 10
    }
]
```

</details>
