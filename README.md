# umami API Docs

API documentation for [Umami Analytics](https://umami.is/).  
This repo maintains an OpenAPI spec that tracks changes in Umami and publishes documentation via GitHub Pages (Redocly).

[![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-0A0?style=flat-square)](https://ceviixx.github.io/umami-api-docs/)
\
\
[![Umami version](https://img.shields.io/badge/Umami-3.0.0-6f42c1?style=flat-square)](https://umami.is/)
![Pages deployed](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fceviixx%2Fumami-api-docs%2Factions%2Fworkflows%2Fdeploy-docs.yml%2Fruns%3Fper_page%3D1&query=$.workflow_runs[0].updated_at&label=Pages%20deployed&color=6f42c1&style=flat-square&cacheSeconds=300)
´

---

### Endpoints not complete

- POST [/auth/login:](openapi/openapi.yaml#L47):
  - response
    - example
    - schema

- POST [/auth/verify:](openapi/openapi.yaml#L71):
  - response
    - example
    - schema

- GET [/websites/{id}/session-data/properties:](openapi/openapi.yaml#L758):
  - response
    - example
    - schema

- GET [/websites/{id}/sessions/:session_id/properties:](openapi/openapi.yaml#L905):
  - response
    - example
    - schema

- GET [/websites/{id}/event-data/properties:](openapi/openapi.yaml#L1132):
  - response
    - example
    - schema

- POST [/reports/retention:](openapi/openapi.yaml#L1448):
  - response
    - example
    - schema

- POST [/reports/attribution:](openapi/openapi.yaml#L1504):
  - response
    - example
    - schema

- POST [/reports/revenue:](openapi/openapi.yaml#L1572):
  - response
    - example
    - schema

- POST [/reports/utm:](openapi/openapi.yaml#L1632):
  - response
    - example
    - schema

- POST [/pixels:](openapi/openapi.yaml#L1688):
  - response
    - example
    - schema

- POST [/pixels/{id}:](openapi/openapi.yaml#L1792):
  - response
    - example
    - schema

- POST [/links:](openapi/openapi.yaml#L1924):
  - response
    - example
    - schema

- POST [/links/{id}:](openapi/openapi.yaml#L2038):
  - response
    - example


--- 


### Only endpoint setup but config missing

- POST [/invite:](openapi/openapi.yaml#L2709):
- POST [/teams/{id}/users/{id}:](openapi/openapi.yaml#L2671):
- DELETE [/teams/{id}/users/{id}:](openapi/openapi.yaml#L2671):
- POST [/teams/join:](openapi/openapi.yaml#L2658):
- DELETE [/teams/{id}:](openapi/openapi.yaml#L2602):
- POST [/teams/{id}:](openapi/openapi.yaml#L2602):
- GET [/teams/{id}:](openapi/openapi.yaml#L2602):
- POST [/teams:](openapi/openapi.yaml#L2578):
- GET [/teams:](openapi/openapi.yaml#L2578):
- POST [/websites/{id}/reset:](openapi/openapi.yaml#L2558):
- DELETE [/websites/{id}:](openapi/openapi.yaml#L2502):
- POST [/websites/{id}:](openapi/openapi.yaml#L2502):
- GET [/websites/{id}:](openapi/openapi.yaml#L2502):
- POST [/websites:](openapi/openapi.yaml#L2394):
- DELETE [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2338):
- POST [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2338):
- GET [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2338):
