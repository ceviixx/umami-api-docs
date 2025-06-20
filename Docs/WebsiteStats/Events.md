## Gets events within a given time range.
**GET /api/websites/:websiteId/events/series**

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
/api/websites/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/events/series?startAt=0000000000000&endAt=0000000000000&unit=hour&timezone=America%2FLos_Angeles
```

**Sample response**
```json
[
  { 
    "x": "live-demo-button", 
    "t": "2023-04-12T22:00:00Z", 
    "y": 1 
  },
  {
    "x": "get-started-button", 
    "t": "2023-04-12T22:00:00Z", 
    "y": 5 
  },
  { 
    "x": "get-started-button", 
    "t": "2023-04-12T23:00:00Z",
    "y": 4 
  },
  {
    "x": "live-demo-button", 
    "t": "2023-04-12T23:00:00Z", 
    "y": 4 
  },
  { 
    "x": "social-Discord", 
    "t": "2023-04-13T00:00:00Z", 
    "y": 1 
  }
]
```
x: Event name. \
t: Timestamp. \
y: Number of events.