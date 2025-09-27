## Sending event
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
Submit custom event data to Umami for tracking user interactions and behaviors.
Requires valid User-Agent header for successful event registration.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST https://cloud.umami.is/api/send
```

---

### 📩 Request Body Parameters
| Name               | Type     | Description                  | Example        | Required |
|--------------------|----------|------------------------------|----------------|----------|
| payload            | object   | Root container for all event tracking data              | —              | yes      |
| payload.hostname   | string   | Domain name where the event occurred (without protocol) | example.com    | yes      |
| payload.language   | string   | User's language preference in ISO 639-1 format          | en-US          | yes      |
| payload.referrer   | string   | URL of the page that referred the user (empty if direct) | https://...    | yes      |
| payload.screen     | string   | User's screen resolution in format widthxheight         | 1920x1080      | yes      |
| payload.title      | string   | Title of the page where the event occurred              | Home           | yes      |
| payload.url        | string   | Path of the page where the event occurred (without domain) | /home          | yes      |
| payload.website    | string   | Unique identifier of the website for event tracking     | xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx     | yes      |
| payload.name       | string   | Custom name identifier for the event being tracked      | click_button   | yes      |
| payload.data       | object   | Custom properties and metadata associated with the event | {"foo": "bar"} | no       |
| type               | string   | Type of tracking data being sent (always "event" for custom events) | event          | yes      |

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
            "foo": "bar"
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
        "foo": "bar"
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