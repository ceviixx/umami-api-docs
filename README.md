# umami API docs
Docs from [uamami Analytics](https://github.com/umami-software/umami) with daily status update to detect not documented changes. \
Used for creating the client on iOS [umami](https://github.com/ceviixx/umami-Analytics-App).

[![Umami API Tests](https://github.com/ceviixx/umami-api-tests/actions/workflows/main.yml/badge.svg)](https://github.com/ceviixx/umami-api-tests/actions/workflows/main.yml)

<!--last-updated:start-->
**Last updated: 2025-06-22 15:32:57 UTC**
<!--last-updated:end-->

### 📊 API Test Status Legend
|   Symbol   | Meaning                                   |
| :-----:| :---------------------------------------------------------------------- |
| ✅     | Test passed – valid response and structure.                             |
| ✔️     | Test passed – valid response, no structure check available.             |
| ⚠️     | Test failed (status code mismatch) – issue linked.                      |
| 🚨     | Test failed – response status or structure mismatched; issue linked.    |
| ⏳     | Test not implemented – endpoint is currently excluded or disabled.      |

These statuses are updated daily via GitHub Actions based on actual test runs and endpoint definitions.

## Sending stats
<!--table:sending-stats-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:sending-stats/Sendingstats-->✅<!--status-end--> | [Sending stats](docs/sending-stats/sending-stats.md) | To register an event, you need to send a POST to /api/send. |
<!--table-end-->

## Websites
<!--table:websites-->
*(directory not found)*
<!--table-end-->

## Website stats
<!--table:website-stats-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:website-stats/Active-->✅<!--status-end--> | [Active](docs/website-stats/active.md) | Gets the number of active users on a website. |
| <!--status:website-stats/Events-->✅<!--status-end--> | [Events](docs/website-stats/events.md) | Gets events within a given time range. |
| <!--status:website-stats/Metrics-->✅<!--status-end--> | [Metrics](docs/website-stats/metrics.md) | Gets metrics for a given time range. |
| <!--status:website-stats/Pageviews-->✅<!--status-end--> | [Pageviews](docs/website-stats/pageviews.md) | Gets pageviews and sessions within a given time range. |
| <!--status:website-stats/Stats-->✅<!--status-end--> | [Stats](docs/website-stats/stats.md) | Gets summarized website statistics. |
<!--table-end-->

## Events
<!--table:events-->
*(directory not found)*
<!--table-end-->

## Session
<!--table:sessions-->
*(directory not found)*
<!--table-end-->

## Reports
<!--table:reports-->
*(directory not found)*
<!--table-end-->

## Users
<!--table:users-->
*(directory not found)*
<!--table-end-->

## Teams
<!--table:teams-->
*(directory not found)*
<!--table-end-->
