## Weekly session data
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Get collected count of sessions by hour of weekday.

**Latest status:** <!--status-->✅<!--status-end-->

```
GET /api/realtime/:websiteId
```

---

### 🔍 Query Parameters
| Name    | Type              | Description              | Example         | Required |
|---------|-------------------|--------------------------|-----------------|----------|
| startAt | number            | (in ms) of starting date | 1234567890000   | yes      |
| endAt   | number            | (in ms) of starting date | 1234567899999   | yes      |
| timezone| number            | Timoezone                | Europe/Berlin   | yes      |

---

### 🔁 Example Request
```bash
curl -G https://api.umami.is/v1/realtime/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx \
  -H "x-umami-api-key: YOUR_API_KEY" \
  --data-urlencode "startAt=1234567890000" \
  --data-urlencode "endAt=1234567899999" \
  --data-urlencode "timezone=Europe/Berlin"
```

---

### 📦 Example Response
```json
{
  "urls" : {
    "/" : 1,
    "/contact" : 2,
  },
  "countries" : {
    "PL" : 2,
    "DE" : 5
  },
  "events" : [
    {
      "__type" : "event",
      "os" : "xxxx",
      "device" : "xxxx",
      "country" : "xx",
      "sessionId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "eventName" : "xxx-xxx-xxx-button",
      "browser" : "xxxxx",
      "createdAt" : "0000-00-00T00:00:00Z",
      "urlPath" : "x",
      "referrerDomain" : ""
    },
  ],
  "series" : {
    "views" : [
      {
        "x" : "0000-00-00T00:00:00Z",
        "y" : 3
      },
      {
        "x" : "20000-00-00T00:00:00Z",
        "y" : 4
      }
    ],
    "visitors" : [
      {
        "x" : "0000-00-00T00:00:00Z",
        "y" : 2
      },
      {
        "x" : "0000-00-00T00:00:00Z",
        "y" : 4
      }
    ]
  },
  "referrers" : {
    "umami.nuxt.dev" : 2,
    "umami.is" : 33,
  },
  "totals" : {
    "visitors" : 60,
    "views" : 79,
    "events" : 19,
    "countries" : 22
  },
  "timestamp" : 1750970573667
}
```

---

### 📘 Response Structure
```json
{
  "urls" : {
    "/" : "number",
    "/contact" : "number",
  },
  "countries" : {
    "PL" : "number",
    "DE" : "number"
  },
  "events" : [
    {
      "__type" : "string",
      "os" : "string",
      "device" : "string",
      "country" : "string",
      "sessionId" : "string",
      "eventName" : "string",
      "browser" : "string",
      "createdAt" : "date",
      "urlPath" : "string",
      "referrerDomain" : "string"
    },
  ],
  "series" : {
    "views" : [
      {
        "x" : "date",
        "y" : "number"
      },
      {
        "x" : "date",
        "y" : "number"
      }
    ],
    "visitors" : [
      {
        "x" : "date",
        "y" : "number"
      },
      {
        "x" : "date",
        "y" : "number"
      }
    ]
  },
  "referrers" : {
    "umami.nuxt.dev" : "number",
    "umami.is" : "number",
  },
  "totals" : {
    "visitors" : "number",
    "views" : "number",
    "events" : "number",
    "countries" : "number"
  },
  "timestamp" : "number"
}
```
