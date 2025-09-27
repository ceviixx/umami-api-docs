## Sending with currency
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Submit event data with revenue tracking information for e-commerce analytics.
Includes monetary values and currency data for tracking conversions and purchases.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST https://cloud.umami.is/api/send
```

---

### 📩 Request Body Parameters
| Name               | Type     | Description                  | Example        | Required |
|--------------------|----------|------------------------------|----------------|----------|
| payload            | object   | Root container for all revenue event tracking data      | —              | yes      |
| payload.hostname   | string   | Hostname of the request      | example.com    | yes      |
| payload.language   | string   | Language code                | en-US          | yes      |
| payload.referrer   | string   | Referrer URL                 | https://...    | yes      |
| payload.screen     | string   | Screen size                  | 1920x1080      | yes      |
| payload.title      | string   | Page title                   | Home           | yes      |
| payload.url        | string   | Page URL                     | /home          | yes      |
| payload.website    | string   | Unique identifier of the website for revenue tracking   | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx     | yes      |
| payload.name       | string   | Custom name identifier for the revenue event (e.g., purchase, checkout) | click_button   | yes      |
| payload.data       | object   | Revenue data including amount and currency (e.g., {"revenue": 19.99, "currency": "EUR"}) | {"revenue": 19.99, "currency": "EUR"} | no       |
| type               | string   | Type of tracking data being sent (always "event" for revenue events) | event          | yes      |

---

### 📨 Request Body
```json
{
    "payload": {
        "hostname": "your-hostname",
        "language": "en-US",
        "referrer": "",
        "screen": "1920x1080",
        "title": "dashboard",
        "url": "/",
        "website": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
        "name": "event-name",
        "data": {
            "revenue": 19.99,
            "currency": "FR"
        }
    },
    "type": "event"
}
```

---

### 🔁 Example Request
```bash
curl -X POST https://cloud.umami.is/api/send \
  -H "Content-Type: application/json" \
  -H "x-umami-api-key: YOUR_API_KEY" \
  -H "User-Agent: MyUserAgent/1.0" \
  -d '{
    "payload": {
      "hostname": "your-hostname",
      "language": "en-US",
      "referrer": "",
      "screen": "1920x1080",
      "title": "dashboard",
      "url": "/",
      "website": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
      "name": "event-name",
      "data": {
        "revenue": 19.99,
        "currency": "FR"
      }
    },
    "type": "event"
  }'
```

---

### 📦 Example Response
```json
{
    "cache" : "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxx.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.xxxxxxxxxxxxxxxxxxx",
    "sessionId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
    "visitId" : "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

---

### 📘 Response Structure
```json
{
  "cache": "string",
  "sessionId": "string",
  "visitId": "string"
}
```