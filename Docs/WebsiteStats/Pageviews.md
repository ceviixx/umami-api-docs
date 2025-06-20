## Gets pageviews within a given time range.
**GET /api/websites/:websiteId/pageviews**

**Parameters**
- startAt: Timestamp (in ms) of starting date.
- endAt: Timestamp (in ms) of end date.
- unit: Time unit (year | month | hour | day).
- timezone: Timezone (ex. America/Los_Angeles).
- url: (optional) Name of URL.
- referrer: (optional) Name of referrer.
- title: (optional) Name of page title.
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
/api/websites/:websiteId/pageviews?startAt=0000000000000&endAt=0000000000000
```

**Sample response**
```json
{
  "pageviews": [
    { 
      "x": "2020-04-20 01:00:00", 
      "y": 3 
    },
    { 
      "x": "2020-04-20 02:00:00", 
      "y": 7 
    }
  ],
  "sessions": [
    { 
      "x": "2020-04-20 01:00:00", 
      "y": 2
    },
    { 
      "x": "2020-04-20 02:00:00", 
      "y": 4 
    }
  ]
}
```
x: Timestamp. \
y: Number of visitors.