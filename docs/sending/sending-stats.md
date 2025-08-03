## Sending stats
<!-- testable: true -->
<!-- expectedStatus: 200 -->
**Description:**  
To register an pageview, you need to send a POST to /api/send.
You need to set an valid User-Agent in the header to get an success. Otherwise the reponse is like `{"beep": "boop"}`.

**Latest status:** <!--status-->✅<!--status-end-->

```
POST https://cloud.umami.is/api/send
```

---

### 📩 Request Body Parameters
| Name               | Type     | Description                  | Example        | Required |
|--------------------|----------|------------------------------|----------------|----------|
| payload            | object   | Root payload object          | —              | yes      |
| payload.hostname   | string   | Hostname of the request      | example.com    | yes      |
| payload.language   | string   | Language code                | en-US          | yes      |
| payload.referrer   | string   | Referrer URL                 | https://...    | yes      |
| payload.screen     | string   | Screen size                  | 1920x1080      | yes      |
| payload.title      | string   | Page title                   | Home           | yes      |
| payload.url        | string   | Page URL                     | /home          | yes      |
| payload.website    | string   | Website ID                   | :websiteId     | yes      |
| type               | string   | Event type                   | event          | yes      |

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