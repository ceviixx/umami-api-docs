# umami API Docs

API documentation for [Umami Analytics](https://umami.is/).  
This repo maintains an OpenAPI spec that tracks changes in Umami and publishes documentation via GitHub Pages (Redocly).

[![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-0A0?style=flat-square)](https://ceviixx.github.io/umami-api-docs/)
\
\
[![Umami version](https://img.shields.io/badge/Umami-3.0.0-6f42c1?style=flat-square)](https://umami.is/)
![Pages deployed](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fceviixx%2Fumami-api-docs%2Factions%2Fworkflows%2Fdeploy-docs.yml%2Fruns%3Fper_page%3D1&query=$.workflow_runs[0].updated_at&label=Pages%20deployed&color=6f42c1&style=flat-square&cacheSeconds=300)



### Script usage
- `npm run start` 
  Start live server
- `npm run build`
  Build bundle.yaml in dist
- `npm run build:docs`
  Create the html page based on template
- `npm run test`
  Run lint test and check openapi
- `npm run arazzo:build`
  Generate arazzo test file
- `npm run arazzo:test -- --input api-key={YOUR_API_KEY}`
  Run the arazzo respect tests with your creadentials



---

### Endpoints not complete

- GET [/websites/{id}/session-data/properties:](openapi/openapi.yaml#L1178):
  - response
    - example
    - schema

- GET [/websites/{id}/sessions/:session_id/properties:](openapi/openapi.yaml#L1325):
  - response
    - example
    - schema

- GET [/websites/{id}/event-data/properties:](openapi/openapi.yaml#L1552):
  - response
    - example
    - schema

- POST [/reports/retention:](openapi/openapi.yaml#L1865):
  - response
    - example
    - schema

- POST [/reports/attribution:](openapi/openapi.yaml#L1920):
  - response
    - example
    - schema

- POST [/reports/revenue:](openapi/openapi.yaml#L1987):
  - response
    - example
    - schema

- POST [/reports/utm:](openapi/openapi.yaml#L2046):
  - response
    - example
    - schema

- POST [/pixels:](openapi/openapi.yaml#L2101):
  - response
    - example
    - schema

- POST [/pixels/{id}:](openapi/openapi.yaml#L2204):
  - response
    - example
    - schema

- POST [/links:](openapi/openapi.yaml#L2335):
  - response
    - example
    - schema

- POST [/links/{id}:](openapi/openapi.yaml#L2448):
  - response
    - example
    - schema


--- 


### Only endpoint setup but config missing

- POST [/teams/{id}/users/{id}:](openapi/openapi.yaml#L3687):
- DELETE [/teams/{id}/users/{id}:](openapi/openapi.yaml#L3687):
- POST [/teams/join:](openapi/openapi.yaml#L3674):
- DELETE [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2403):
- POST [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2403):
- GET [/websites/{id}/segments/:cohort_id:](openapi/openapi.yaml#L2403):
