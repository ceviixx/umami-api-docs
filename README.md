# umami API docs
Docs from [uamami Analytics](https://github.com/umami-software/umami) with daily status update to detect not documented changes. \
Used for creating the client on iOS [umami](https://github.com/ceviixx/umami-Analytics-App).

[![Umami API Tests](https://github.com/ceviixx/umami-api-docs/actions/workflows/main.yml/badge.svg)](https://github.com/ceviixx/umami-api-docs/actions/workflows/main.yml)

<!--last-updated:start-->
**Last updated: 2025-06-20 15:06:53 UTC**
<!--last-updated:end-->

**Status Legend** \
The API status table uses the following symbols:
- ✅ tested with expected body
- ⚠️ tested with status code only
- 🚨 failed (issue linked)
- ⏳ test not implemented yet

These statuses are updated daily via GitHub Actions based on actual test runs and endpoint definitions.


## Sending stats
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Stats/SendingStats-->⏳<!--status-end-->            | 🟢 **POST** [`/send`](Docs/SendingStats/SendingStats.md)                                           | To register an event                                                               |


## Websites
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Websites/Create.md-->⏳<!--status-end-->            | 🟢 **POST** [`/websites`](Docs/Websites/Create.md)                                                 | Creates a website.                                                                 |
| <!--status:Websites/GetAll-->✅<!--status-end-->               | 🔵 **GET** [`/websites`](Docs/Websites/GetAll.md)                                                  | Returns all tracked websites.                                                      |
| <!--status:Websites/GetByID-->✅<!--status-end-->              | 🔵 **GET** [`/websites/:websiteId`](Docs/Websites/GetByID.md)                                      | Gets a website by ID.                                                              |
| <!--status:Websites/Update-->⏳<!--status-end-->               | 🟢 **POST** [`/websites/:websiteId`](Docs/Websites/Update.md)                                      | Updates a website.                                                                 |
| <!--status:Websites/Delete-->⏳<!--status-end-->               | 🔴 **DELETE** [`/websites/:websiteId`](Docs/Websites/Delete.md)                                    | Deletes a website.                                                                 |
| <!--status:Websites/Reset-->⏳<!--status-end-->                | 🟢 **POST** [`/websites/:websiteId/reset`](Docs/Websites/Reset.md)                                 | Resets a website by removing all data related to the website.                      |

## Stats
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:WebsiteStats/Active-->⏳<!--status-end-->           | 🔵 **GET** [`/websites/:websiteId/active`](Docs/WebsiteStats/Active.md)                            | Gets the number of active users on a website.                                      |
| <!--status:WebsiteStats/Events-->⏳<!--status-end-->           | 🔵 **GET** [`/websites/:websiteId/events/series`](Docs/WebsiteStats/Events.md)                     | Gets events within a given time range.                                             |
| <!--status:WebsiteStats/Pageviews-->⏳<!--status-end-->        | 🔵 **GET** [`/websites/:websiteId/pageviews`](Docs/WebsiteStats/Pageviews.md)                      | Gets pageviews within a given time range.                                          |
| <!--status:WebsiteStats/Metrics-->⏳<!--status-end-->          | 🔵 **GET** [`/websites/:websiteId/metrics`](Docs/WebsiteStats/Metrics.md)                          | Gets metrics for a given time range.                                               |
| <!--status:WebsiteStats/Stats-->⏳<!--status-end-->            | 🔵 **GET** [`/websites/:websiteId/stats`](Docs/WebsiteStats/Stats.md)                              | Gets summarized website statistics.                                                |

## Events
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Events/Events-->⚠️<!--status-end-->                 | 🔵 **GET** [`/websites/:websiteId/events`](Docs/Events/Events.md)                                  | Gets website event details within a given time range.                              |
| <!--status:Events/EventDataEvents-->⚠️<!--status-end-->        | 🔵 **GET** [`/websites/:websiteId/event-data/events`](Docs/Events/EventDataEvents.md)              | Gets event data names, properties, and counts                                      |
| <!--status:Events/EventDataFields-->⚠️<!--status-end-->        | 🔵 **GET** [`/websites/:websiteId/event-data/fields`](Docs/Events/EventDataFields.md)              | Gets event data property and value counts within a given time range.               |
| <!--status:Events/EventDataValues-->⚠️<!--status-end-->        | 🔵 **GET** [`/websites/:websiteId/event-data/values`](Docs/Events/EventDataValues.md)              | Gets event data counts for a given event and property                              |
| <!--status:Events/EventDataStats-->⚠️<!--status-end-->         | 🔵 **GET** [`/websites/:websiteId/event-data/stats`](Docs/Events/EventDataStats.md)                | Gets summarized website events, fields, and records within a given time range.     |

## Sessions
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Sessions/Sessions-->✅<!--status-end-->             | 🔵 **GET** [`/websites/:websiteId/sessions`](Docs/Sessions/Sessions.md)                            | Gets website session details within a given time range.                            |
| <!--status:Sessions/Stats-->✅<!--status-end-->                | 🔵 **GET** [`/websites/:websiteId/sessions/stats`](Docs/Sessions/Stats.md)                         | Gets summarized website session statistics.                                        |
| <!--status:Sessions/GetByID-->✅<!--status-end-->              | 🔵 **GET** [`/websites/:websiteId/sessions/:sessionId`](Docs/Sessions/GetByID.md)                  | Gets session details for a individual session                                      |
| <!--status:Sessions/Activity-->✅<!--status-end-->             | 🔵 **GET** [`/websites/:websiteId/sessions/:sessionId/activity`](Docs/Sessions/Activity.md)        | Gets session activity for a individual session                                     |
| <!--status:Sessions/Property-->✅<!--status-end-->             | 🔵 **GET** [`/websites/:websiteId/sessions/:sessionId/properties`](Docs/Sessions/Property.md)      | Gets session properties for a individual session                                   |
| <!--status:Sessions/SessionDataProperties-->✅<!--status-end-->| 🔵 **GET** [`/websites/:websiteId/session-data/properties`](Docs/Sessions/SessionDataProperties.md)| Gets session data counts by property name                                          |
| <!--status:Sessions/SessionDataValues-->✅<!--status-end-->    | 🔵 **GET** [`/websites/:websiteId/session-data/values`](Docs/Sessions/SessionDataValues.md)        | Gets session data counts for a given property                                      |
| <!--status:Sessions/Weekly-->✅<!--status-end-->               | 🔵 **GET** [`/websites/:websiteId/sessions/stats`](Docs/Sessions/Weekly.md)                        | Returns the number of sessions per hour for each day of a given week.              |

## Reports
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Reports/Insights-->✅<!--status-end-->              | 🟢 **POST** [`/reports/insights`](Docs/Reports/Insights.md)                                        | Dive deeper into your data by using segments and filters.                          |
| <!--status:Reports/Funnel-->✅<!--status-end-->                | 🟢 **POST** [`/reports/funnel`](Docs/Reports/Funnel.md)                                            | Understand the conversion and drop-off rate of users.                              |
| <!--status:Reports/Retention-->✅<!--status-end-->             | 🟢 **POST** [`/reports/retention`](Docs/Reports/Retention.md)                                      | Measure your website stickiness by tracking how often users return.                |
| <!--status:Reports/UTM-->✅<!--status-end-->                   | 🟢 **POST** [`/reports/utm`](Docs/Reports/UTM.md)                                                  | Track your campaigns through UTM parameters.                                       |
| <!--status:Reports/Goals-->✅<!--status-end-->                 | 🟢 **POST** [`/reports/goals`](Docs/Reports/Goals.md)                                              | Track your goals for pageviews and events.                                         |
| <!--status:Reports/Journey-->✅<!--status-end-->               | 🟢 **POST** [`/reports/journey`](Docs/Reports/Journey.md)                                          | Understand how users nagivate through your website.                                |
| <!--status:Reports/Revenue-->✅<!--status-end-->               | 🟢 **POST** [`/reports/revenue`](Docs/Reports/Revenue.md)                                          | Look into your revenue data and how users are spending.                            |
| <!--status:Reports/Attribution-->✅<!--status-end-->           | 🟢 **POST** [`/reports/attribution`](Docs/Reports/Attribution.md)                                  | See how users engage with your marketing and what drives conversions.              |

## Users
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Users/Create-->⏳<!--status-end-->                  | 🟢 **POST** [`/users`](Docs/Users/Create.md)                                                       | Creates a user.                                                                    |
| <!--status:Users/GetAll-->⏳<!--status-end-->                  | 🔵 **GET** [`/admin/users`](Docs/Users/GetAll.md)                                                  | Returns all users. Admin access is required.                                       |
| <!--status:Users/GetByID-->⏳<!--status-end-->                 | 🔵 **GET** [`/users/:userId`](Docs/Users/GetByID.md)                                               | Gets a user by ID.                                                                 |
| <!--status:Users/Update-->⏳<!--status-end-->                  | 🟢 **POST** [`/users/:userId`](Docs/Users/Update.md)                                               | Updates a user.                                                                    |
| <!--status:Users/Delete-->⏳<!--status-end-->                  | 🔴 **DELETE** [`/users/:userId`](Docs/Users/Delete.md)                                             | Deletes a user.                                                                    |
| <!--status:Users/WebsitesForUserId-->⏳<!--status-end-->       | 🔵 **GET** [`/users/:userId/websites`](Docs/Users/WebsitesForUserId.md)                            | Gets all websites that belong to a user.                                           |
| <!--status:Users/TeamsForUserId-->⏳<!--status-end-->          | 🔵 **GET** [`/users/:userId/teams`](Docs/Users/TeamsForUserId.md)                                  | Gets all teams that belong to a user.                                              |

## Teams
|                            Status                            | Route                                                                                          | Description                                                                         |
| :----------------------------------------------------------: | :-------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| <!--status:Teams/Create-->⏳<!--status-end-->                  | 🟢 **POST** [`/teams`](Docs/Teams/Create.md)                                                       | Creates a team.                                                                    |
| <!--status:Teams/Join-->⏳<!--status-end-->                    | 🟢 **POST** [`/teams/join`](Docs/Teams/Join.md)                                                    | Join a team.                                                                       |
| <!--status:Teams/GetByID-->⏳<!--status-end-->                 | 🔵 **GET** [`/teams/:teamId`](Docs/Teams/GetByID.md)                                               | Get a team by ID.                                                                  |
| <!--status:Teams/Update-->⏳<!--status-end-->                  | 🟢 **POST** [`/teams/:teamId`](Docs/Teams/Update.md)                                               | Update a team.                                                                     |
| <!--status:Teams/Delete-->⏳<!--status-end-->                  | 🔴 **DELETE** [`/teams/:teamId`](Docs/Teams/Delete.md)                                             | Delete a team.                                                                     |
| <!--status:Teams/UsersForTeamId-->⏳<!--status-end-->          | 🔵 **GET** [`/teams/:teamId/users`](Docs/Teams/UsersForTeamId.md)                                  | Get all users that belong to a team.                                               |
| <!--status:Teams/AddUserTo-->⏳<!--status-end-->               | 🟢 **POST** [`/teams/:teamId/users`](Docs/Teams/AddUserTo.md)                                      | Add a user to a team.                                                              |
| <!--status:Teams/UserForTeamId-->⏳<!--status-end-->           | 🔵 **GET** [`/teams/:teamId/users/:userId`](Docs/Teams/UserForTeamId.md)                           | Get a user belonging to a team.                                                    |
| <!--status:Teams/UpdateUserRoleForTeamId-->⏳<!--status-end--> | **POST** [`/teams/:teamId/users/:userId`](Docs/Teams/UpdateUserRoleForTeamId.md)                   | Update a user's role on a team.                                                     |
| <!--status:Teams/RemoveUserForTeamId-->⏳<!--status-end-->     | 🔴 **DELETE** [`/teams/:teamId/users/:userId`](Docs/Teams/RemoveUserForTeamId.md)                  | Remove a user from a team.                                                          |
| <!--status:Teams/WebsitesForTeamId-->⏳<!--status-end-->       | 🔵 **GET** [`/teams/:teamId/websites`](Docs/Teams/WebsitesForTeamId.md)                            | Get all websites that belong to a team.                                             |
