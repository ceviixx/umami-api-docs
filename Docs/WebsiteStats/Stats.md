## Gets summarized website statistics.
**GET /api/websites/:websiteId/stats**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- url: (optional) Name of URL.
- referrer: (optional) Name of referrer.
- title: (optional) Name of page title.
- query: (optional) Name of query.
- event: (optional) Name of event.
- host: (optional) Name of hostname.
- os: (optional) Name of operating system.
- browser: (optional) Name of browser.
- device: (optional) Name of device (ex. Mobile)
- country: (optional) Name of country.
- region: (optional) Name of region/state/province.
- city: (optional) Name of city.

---

**Sample route**
```
/api/websites/86d4095c-a2a8-4fc8-9521-103e858e2b41/stats?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
{
  "pageviews": { 
    "value": 3018, 
    "prev": 3508 
  },
  "visitors": {
    "value": 847, 
    "prev": 910 
  },
  "visits": { 
    "value": 984, 
    "prev": 1080 
  },
  "bounces": {
    "value": 537, 
    "prev": 628 
  },
  "totaltime": { 
    "value": 150492, 
    "prev": 164713 
  }
}
```
pageviews: Pages hits \
visitors: Number of unique visitors \
visits: Number of sessions \
bounces: Number of visitors who only visit a single page \
totaltime: Time spent on the website