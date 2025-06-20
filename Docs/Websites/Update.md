## Updates a website.
**POST /api/websites/:websiteId**

**Parameters**
- name: (optional string) The name of the website in Umami.
- domain: (optional string) The full domain of the tracked website.
- shareId: (optional string) A unique string to enable a share url. Set null to unshare.


---

**Sample request body**
```json

```

**Sample response**
```json
{
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "name": "Umami",
  "domain": "umami.is",
  "shareId": null,
  "resetAt": null,
  "userId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "createdAt": "0000-00-00T00:00:00.000Z",
  "updatedAt": null,
  "deletedAt": null
}
```