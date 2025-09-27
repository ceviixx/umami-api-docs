## Sending stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Submit page view data to Umami for tracking website traffic and visitor behavior.
Registers standard page views without custom event data for basic analytics.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST https://cloud.umami.is/api/send
```

---

### 📩 Request Body Parameters
| Name               | Type     | Description                  | Example        | Required |
|--------------------|----------|------------------------------|----------------|----------|
| payload            | object   | Root container for all page view tracking data          | —              | yes      |
| payload.hostname   | string   | Hostname of the request      | example.com    | yes      |
| payload.language   | string   | Language code                | en-US          | yes      |
| payload.referrer   | string   | Referrer URL                 | https://...    | yes      |
| payload.screen     | string   | Screen size                  | 1920x1080      | yes      |
| payload.title      | string   | Page title                   | Home           | yes      |
| payload.url        | string   | Page URL                     | /home          | yes      |
| payload.website    | string   | Unique identifier of the website for page view tracking | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx     | yes      |
| type               | string   | Type of tracking data being sent ("event" for page views) | event          | yes      |

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
        "website": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
      "website": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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