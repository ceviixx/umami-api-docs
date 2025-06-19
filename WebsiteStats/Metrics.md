## Gets metrics for a given time range.
**GET /api/websites/:websiteId/metrics**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- type: Metrics type (url | referrer | browser | os | device | country | event).
- url: (optional) Name of URL.
- referrer: (optional) Name of referrer.
- title: (optional) Name of page title.
- query: (optional) Name of query.
- host: (optional) Name of hostname.
- os: (optional) Name of operating system.
- browser: (optional) Name of browser.
- device: (optional) Name of device (ex. Mobile)
- country: (optional) Name of country.
- region: (optional) Name of region/state/province.
- city: (optional) Name of city.
- language: (optional) Name of language.
- event: (optional) Name of event.
- limit: (optional, default 500) Number of events returned.


---

**Sample route**
```
/api/websites/:websiteId/metrics?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
[
  { 
    "x": "/", 
    "y": 46 
  },
  { 
    "x": "/docs", 
    "y": 17 
  },
  { 
    "x": "/download", 
    "y": 14 
  }
]
```
x: Unique value, depending on metric type (url | referrer | browser | os | device | country | event). \
y: Number of visitors.