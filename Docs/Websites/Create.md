## Creates a website.
**POST /api/websites**

**Parameters**
- domain: (string) The full domain of the tracked website.
- name: (string) The name of the website in Umami.
- shareId: (optional string) A unique string to enable a share url. Set null to unshare.
- teamId: (optional string) The ID of the team the website will be created under.


---

**Sample request body**
```json
{
  "name": "Umami",
  "domain": "umami.is",
}
```

**Sample response**
```json
{
  "id": 1,
  "websiteUuid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "websiteId": 2,
  "name": "Umami",
  "domain": "umami.is",
  "shareId": "xxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z"
}
```