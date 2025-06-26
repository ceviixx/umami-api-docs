# umami API docs
Docs from [uamami Analytics](https://github.com/umami-software/umami) with daily status update to detect not documented changes. \
Used for creating the client on iOS [umami](https://github.com/ceviixx/umami-Analytics-App).

[![Umami API Tests](https://github.com/ceviixx/umami-api-docs/actions/workflows/main.yml/badge.svg)](https://github.com/ceviixx/umami-api-docs/actions/workflows/main.yml)

<!--last-updated:start-->
**Last updated: 2025-06-26 19:37:57 UTC**
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

## Auth
<!--table:auth-->
*(There are currently no requests available.)*
<!--table-end-->

## Me
<!--table:me-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:me/Mywebsites-->✅<!--status-end--> | [My websites](docs/me/get-me.md) | Get data about your account basaed on authentification. |
| <!--status:me/Myteams-->✅<!--status-end--> | [My teams](docs/me/get-teams.md) | Get all your teams. |
| <!--status:me/Mywebsites-->✅<!--status-end--> | [My websites](docs/me/get-websites.md) | Get all your websites. |
<!--table-end-->

## Admin
<!--table:admin-->
*(There are currently no requests available.)*
<!--table-end-->

## Realtime
<!--table:realtime-->
*(There are currently no requests available.)*
<!--table-end-->

## Scripts
<!--table:scripts-->
*(There are currently no requests available.)*
<!--table-end-->

## Share
<!--table:share-->
*(There are currently no requests available.)*
<!--table-end-->

## Sending stats
<!--table:sending-stats-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:sending-stats/Sendingstats-->✅<!--status-end--> | [Sending stats](docs/sending-stats/sending-stats.md) | To register an event, you need to send a POST to /api/send. |
<!--table-end-->

## Websites
<!--table:websites-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:websites/Createswebsite-->⏳<!--status-end--> | [Creates website](docs/websites/create.md) | Create an new website entry for tracking. |
| <!--status:websites/Deletewebsiteentry-->⏳<!--status-end--> | [Delete website entry](docs/websites/delete.md) | Delete website including all statistics. |
| <!--status:websites/Getallwebsites-->✅<!--status-end--> | [Get all websites](docs/websites/get-all.md) | Returns all tracked websites. |
| <!--status:websites/Websitebyid-->✅<!--status-end--> | [Website by id](docs/websites/get-by-id.md) | Gets a website by ID. |
| <!--status:websites/Resetdataforwebsite-->⏳<!--status-end--> | [Reset data for website](docs/websites/reset.md) | Resets a website by removing all data related to the website. |
| <!--status:websites/Updateswebsite-->⏳<!--status-end--> | [Updates website](docs/websites/update.md) | Updating website data. |
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
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:events/Eventdataevents-->✅<!--status-end--> | [Event data events](docs/events/event-data-events.md) | Gets event data names, properties, and counts |
| <!--status:events/Getseventdatapropertyandvaluecounts-->✅<!--status-end--> | [Gets event data property and value counts](docs/events/event-data-fields.md) | Gets event data property and value counts within a given time range. |
| <!--status:events/Eventdatastats-->✔️<!--status-end--> | [Event data stats](docs/events/event-data-stats.md) | Gets summarized website events, fields, and records within a given time range. |
| <!--status:events/Eventdatavalues-->✔️<!--status-end--> | [Event data values](docs/events/event-data-values.md) | Gets event data counts for a given event and property |
| <!--status:events/Events-->✅<!--status-end--> | [Events](docs/events/events.md) | Gets website event details within a given time range. |
<!--table-end-->

## Session
<!--table:sessions-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:sessions/Detailsforid-->✔️<!--status-end--> | [Details for id](docs/sessions/get-by-id.md) | Gets session details for a individual session |
| <!--status:sessions/Properties-->✔️<!--status-end--> | [Properties](docs/sessions/properties.md) | Gets session properties for a individual session |
| <!--status:sessions/Dataproperties-->✔️<!--status-end--> | [Data properties](docs/sessions/session-data-properties.md) | Gets session data counts by property name |
| <!--status:sessions/Datavalues-->✔️<!--status-end--> | [Data values](docs/sessions/session-data-values.md) | Gets session data counts for a given property |
<!--table-end-->

## Reports
<!--table:reports-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:reports/Currency-->✔️<!--status-end--> | [Currency](docs/reports/addon_currency.md) | Get currency for given range. Needed for Revenue and optional in Attribution reports. |
| <!--status:reports/Attribution-->✅<!--status-end--> | [Attribution](docs/reports/attribution.md) | See how users engage with your marketing and what drives conversions. |
| <!--status:reports/Funnel-->✅<!--status-end--> | [Funnel](docs/reports/funnel.md) | Understand the conversion and drop-off rate of users. |
| <!--status:reports/Goals-->✔️<!--status-end--> | [Goals](docs/reports/goals.md) | Track your goals for pageviews and events. |
| <!--status:reports/Insights-->✔️<!--status-end--> | [Insights](docs/reports/insights.md) | Dive deeper into your data by using segments and filters. |
| <!--status:reports/Journey-->✔️<!--status-end--> | [Journey](docs/reports/journey.md) | Understand how users nagivate through your website. |
| <!--status:reports/Retention-->✅<!--status-end--> | [Retention](docs/reports/retention.md) | Measure your website stickiness by tracking how often users return. |
| <!--status:reports/Revenue-->✅<!--status-end--> | [Revenue](docs/reports/revenue.md) | Look into your revenue data and how users are spending. |
| <!--status:reports/UTM-->✔️<!--status-end--> | [UTM](docs/reports/utm.md) | Track your campaigns through UTM parameters. |
<!--table-end-->

## Users
<!--table:users-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:users/Createuser-->⏳<!--status-end--> | [Create user](docs/users/create.md) | Create new user |
| <!--status:users/Deleteuser-->⏳<!--status-end--> | [Delete user](docs/users/delete.md) | Delete given user. |
| <!--status:users/Getallusers-->⏳<!--status-end--> | [Get all users](docs/users/get-all.md) | Get all users on your account. |
| <!--status:users/Getuserbyid-->⏳<!--status-end--> | [Get user by id](docs/users/get-by-id.md) | Get details about the user. |
| <!--status:users/Teamsfromuser-->⏳<!--status-end--> | [Teams from user](docs/users/teams-for-user.md) | Get user teams by user id. |
| <!--status:users/Updateuser-->⏳<!--status-end--> | [Update user](docs/users/update.md) | Update user details. |
<!--table-end-->

## Teams
<!--table:teams-->
| Status | Name           | Description                     |
| :-------: | :-------- | :---------------- |
| <!--status:teams/Addausertoateam-->⏳<!--status-end--> | [Add a user to a team](docs/teams/add-user-to-team.md) | Add a specific user to the team. |
| <!--status:teams/Createsteam-->⏳<!--status-end--> | [Creates team](docs/teams/create.md) | Create an new team. |
| <!--status:teams/Deleteteam-->⏳<!--status-end--> | [Delete team](docs/teams/delete.md) | Delete the team. |
| <!--status:teams/Getteam-->⏳<!--status-end--> | [Get team](docs/teams/get-by-id.md) | Get all details for the team. |
| <!--status:teams/Jointeam-->⏳<!--status-end--> | [Join team](docs/teams/join.md) | Join a theam with access code |
| <!--status:teams/Removeuserfromteam.-->⏳<!--status-end--> | [Remove user from team.](docs/teams/remove-user-from-team.md) | Removes the user from the team. |
| <!--status:teams/Updateuserteamrole-->⏳<!--status-end--> | [Update user team role](docs/teams/update-user-role-for-team.md) | Update a user's role on a team. |
| <!--status:teams/Updateteam-->⏳<!--status-end--> | [Update team](docs/teams/update.md) | Update data of the team. |
| <!--status:teams/Userfromteam-->⏳<!--status-end--> | [User from team](docs/teams/user-for-team.md) | Get a user belonging to a team. |
| <!--status:teams/Allusersforteam-->⏳<!--status-end--> | [All users for team](docs/teams/users-for-team.md) | Get all users that belong to a team. |
| <!--status:teams/Allwebsitesforteam-->⏳<!--status-end--> | [All websites for team](docs/teams/websites-for-team.md) | Get all websites that belong to a team. |
<!--table-end-->
