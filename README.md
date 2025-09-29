# umami API docs

Docs from [uamami Analytics](https://github.com/umami-software/umami) with daily status update to detect not documented changes. \
Used for creating the client on iOS [umami](https://github.com/ceviixx/umami-Analytics-App).


<div align="leading">

[![Umami API Tests](https://github.com/ceviixx/umami-api-docs/actions/workflows/api-test-suite.yml/badge.svg)](https://github.com/ceviixx/umami-api-docs/actions/workflows/api-test-suite.yml)
[![umami version](https://img.shields.io/github/v/release/umami-software/umami?style=flat-square&label=umami)](https://github.com/umami-software/umami/releases)

</div>

![Last validation](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fapi.github.com%2Frepos%2Fceviixx%2Fumami-api-docs%2Factions%2Fworkflows%2Fapi-test-suite.yml%2Fruns%3Fper_page%3D1&query=$.workflow_runs[0].updated_at&label=last%20validation&color=6f42c1&style=flat-square&cacheSeconds=300)



### 📊 API Test Status Legend
| Symbol   | Meaning                                   |
| :-----:| :---------------------------------------------------------------------- |
| ✅     | Test passed – valid response and structure.                             |
| ✔️     | Test passed – valid response, no structure check available.             |
| ⚠️     | Test failed (status code mismatch) – issue linked.                      |
| 🚨     | Test failed – response status or structure mismatched; issue linked.    |
| ⏳     | Test not implemented – endpoint is currently excluded or disabled.      |

These statuses are updated daily via GitHub Actions based on actual test runs and endpoint definitions.


## Table of Contents

- [Auth](#auth)
- [Me](#me)
- [Admin](#admin)
- [Realtime](#realtime)
- [Scripts](#scripts)
- [Share](#share)
- [Sending stats / events](#sending-stats--events)
- [Websites](#websites)
- [Website stats](#website-stats)
- [Events](#events)
- [Session](#session)
- [Reports](#reports)
- [Users](#users)
- [Teams](#teams)



## Auth
<!--table:auth-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:auth/Login-->⏳<!--status-end--> | [Login](docs/auth/login.md) | Authenticate user with username and password to obtain access token. |
| <!--status:auth/Verify-->⏳<!--status-end--> | [Verify](docs/auth/verify.md) | Verify JWT token validity and retrieve current user information. |
<!--table-end-->

## Me
<!--table:me-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:me/Accountdetails-->✅<!--status-end--> | [Account details](docs/me/get-me.md) | Get comprehensive account information for the authenticated user. |
| <!--status:me/Myteams-->✅<!--status-end--> | [My teams](docs/me/get-teams.md) | Get paginated list of teams where the authenticated user has membership. |
| <!--status:me/Mywebsites-->✅<!--status-end--> | [My websites](docs/me/get-websites.md) | Get paginated list of websites owned by or accessible to the authenticated user. |
<!--table-end-->

## Admin
<!--table:admin-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:admin/Adminallwebsites-->✅<!--status-end--> | [Admin all websites](docs/admin/websites.md) | Get all websites across the entire Umami system with admin privileges. |
<!--table-end-->

## Realtime
<!--table:realtime-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:realtime/RealtimeStatistics-->✅<!--status-end--> | [Realtime Statistics](docs/realtime/realtime-stats.md) | Get real-time analytics data providing live insights into current visitor activity. |
<!--table-end-->

## Scripts
<!--table:scripts-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:scripts/Telemetry-->⏳<!--status-end--> | [Telemetry](docs/scripts/telemetry.md) | Get telemetry and diagnostic information about your Umami server instance. |
<!--table-end-->

## Share
<!--table:share-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:share/Shared-->⏳<!--status-end--> | [Shared](docs/share/share.md) | Get authentication data for accessing a shared website dashboard. |
<!--table-end-->

## Sending stats / events
<!--table:sending-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:sending/Sendingevent-->✅<!--status-end--> | [Sending event](docs/sending/sending-event.md) | Submit custom event data to Umami for tracking user interactions and behaviors. |
| <!--status:sending/Sendingstats-->✅<!--status-end--> | [Sending stats](docs/sending/sending-stats.md) | Submit page view data to Umami for tracking website traffic and visitor behavior. |
| <!--status:sending/Sendingwithcurrency-->✅<!--status-end--> | [Sending with currency](docs/sending/sending-with-currency.md) | Submit event data with revenue tracking information for e-commerce analytics. |
<!--table-end-->

## Websites
<!--table:websites-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:websites/Createswebsite-->✅<!--status-end--> | [Creates website](docs/websites/create.md) | Create a new website entry in Umami for tracking analytics data. |
| <!--status:websites/Deletewebsiteentry-->✅<!--status-end--> | [Delete website entry](docs/websites/delete.md) | Permanently delete a website entry and all associated analytics data. |
| <!--status:websites/Getallwebsites-->✅<!--status-end--> | [Get all websites](docs/websites/get-all.md) | Get all tracked websites accessible to the authenticated user. |
| <!--status:websites/Websitebyid-->✅<!--status-end--> | [Website by id](docs/websites/get-by-id.md) | Get detailed information for a specific website by its unique identifier. |
| <!--status:websites/Resetdataforwebsite-->✅<!--status-end--> | [Reset data for website](docs/websites/reset.md) | Reset all analytics data for a website while preserving the website configuration. |
| <!--status:websites/Updateswebsite-->✅<!--status-end--> | [Updates website](docs/websites/update.md) | Update the configuration settings of an existing website entry. |
<!--table-end-->

## Website stats
<!--table:website-stats-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:website-stats/Active-->✅<!--status-end--> | [Active](docs/website-stats/active.md) | Get the number of currently active users on a website in real-time. |
| <!--status:website-stats/Events-->✅<!--status-end--> | [Events](docs/website-stats/events.md) | Get event data as a time series within specified date range. |
| <!--status:website-stats/Metrics-->✅<!--status-end--> | [Metrics](docs/website-stats/metrics.md) | Get aggregated metrics data for a website within specified time range. |
| <!--status:website-stats/Pageviews-->✅<!--status-end--> | [Pageviews](docs/website-stats/pageviews.md) | Get time-series data for pageviews and unique sessions within specified date range. |
| <!--status:website-stats/Stats-->✅<!--status-end--> | [Stats](docs/website-stats/stats.md) | Get comprehensive summarized website statistics including pageviews and unique visitors. |
<!--table-end-->

## Events
<!--table:events-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:events/Eventdataevents-->✅<!--status-end--> | [Event data events](docs/events/data-events.md) | Get aggregated statistics for event data properties and occurrence counts. |
| <!--status:events/Getseventdatapropertyandvaluecounts-->✅<!--status-end--> | [Gets event data property and value counts](docs/events/data-fields.md) | Get detailed value distribution for event data properties within time range. |
| <!--status:events/Eventdatastats-->✅<!--status-end--> | [Event data stats](docs/events/data-stats.md) | Get high-level summary statistics for event data within specified time range. |
| <!--status:events/Eventdatavalues-->✔️<!--status-end--> | [Event data values](docs/events/data-values.md) | Get specific value counts for given event and property combination. |
| <!--status:events/Events-->✅<!--status-end--> | [Events](docs/events/events.md) | Get paginated list of website events within specified time range. |
<!--table-end-->

## Session
<!--table:sessions-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:sessions/Sessionactivity-->✅<!--status-end--> | [Session activity](docs/sessions/activity.md) | Get detailed activity data for a specific user session within given time range. |
| <!--status:sessions/Dataproperties-->✅<!--status-end--> | [Data properties](docs/sessions/data-properties.md) | Get aggregated counts of session data properties within specified time range. |
| <!--status:sessions/Datavalues-->✔️<!--status-end--> | [Data values](docs/sessions/data-values.md) | Get value distribution for specific session data property within time range. |
| <!--status:sessions/Detailsforid-->✅<!--status-end--> | [Details for id](docs/sessions/get-by-id.md) | Get comprehensive details for a specific user session by its unique identifier. |
| <!--status:sessions/Properties-->✅<!--status-end--> | [Properties](docs/sessions/properties.md) | Get custom data properties associated with a specific user session. |
| <!--status:sessions/Getsessions-->✅<!--status-end--> | [Get sessions](docs/sessions/sessions.md) | Get paginated list of user sessions for a website within specified date range. |
| <!--status:sessions/Statsforsessions-->✅<!--status-end--> | [Stats for sessions](docs/sessions/stats.md) | Get aggregated statistics for user sessions within specified time period. |
| <!--status:sessions/Weeklysessiondata-->✅<!--status-end--> | [Weekly session data](docs/sessions/weekly.md) | Get session count data organized by weekday and hour for activity patterns. |
<!--table-end-->

## Reports
<!--table:reports-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:reports/Currency-->🚨 [#21](https://github.com/ceviixx/umami-api-docs/issues/21)<!--status-end--> | [Currency](docs/reports/addon_currency.md) | Get list of available currencies used in revenue tracking within date range. |
| <!--status:reports/Attribution-->🚨 [#22](https://github.com/ceviixx/umami-api-docs/issues/22)<!--status-end--> | [Attribution](docs/reports/attribution.md) | Analyze attribution paths to understand user marketing touchpoint interactions. |
| <!--status:reports/SaveReport-->✅<!--status-end--> | [Save Report](docs/reports/create.md) | Save a configured analytical report with specific parameters for future access. |
| <!--status:reports/Deletereport-->✅<!--status-end--> | [Delete report](docs/reports/delete.md) | Permanently delete a custom report by its unique identifier. |
| <!--status:reports/Funnel-->✅<!--status-end--> | [Funnel](docs/reports/funnel.md) | Analyze user conversion funnels by tracking visitor progression through defined steps. |
| <!--status:reports/Detailsforid-->✅<!--status-end--> | [Details for id](docs/reports/get-by-id.md) | Get detailed information for a specific report by its unique identifier. |
| <!--status:reports/Goals-->✅<!--status-end--> | [Goals](docs/reports/goals.md) | Track goal completion metrics by comparing actual performance against defined targets. |
| <!--status:reports/Insights-->✅<!--status-end--> | [Insights](docs/reports/insights.md) | Generate custom analytical insights by combining multiple data fields with filtering. |
| <!--status:reports/Journey-->🚨 [#23](https://github.com/ceviixx/umami-api-docs/issues/23)<!--status-end--> | [Journey](docs/reports/journey.md) | Analyze user navigation paths through your website by tracking sequential visits. |
| <!--status:reports/Listreports-->✅<!--status-end--> | [List reports](docs/reports/reports.md) | Get paginated list of all custom reports created by the authenticated user. |
| <!--status:reports/Retention-->✅<!--status-end--> | [Retention](docs/reports/retention.md) | Analyze user retention patterns by tracking how often visitors return. |
| <!--status:reports/Revenue-->✅<!--status-end--> | [Revenue](docs/reports/revenue.md) | Analyze revenue data and user spending patterns on your website. |
| <!--status:reports/UTMCampaignTracking-->✅<!--status-end--> | [UTM Campaign Tracking](docs/reports/utm.md) | Generate detailed UTM campaign tracking reports to analyze marketing performance. |
<!--table-end-->

## Users
<!--table:users-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:users/Createuser-->⏳<!--status-end--> | [Create user](docs/users/create.md) | Create a new user account in the Umami system. |
| <!--status:users/Deleteuser-->⏳<!--status-end--> | [Delete user](docs/users/delete.md) | Permanently delete a user account from the system. |
| <!--status:users/Getallusers-->⏳<!--status-end--> | [Get all users](docs/users/get-all.md) | Get complete list of all user accounts in the system. |
| <!--status:users/Getuserbyid-->✅<!--status-end--> | [Get user by id](docs/users/get-by-id.md) | Get detailed information for a specific user by their unique identifier. |
| <!--status:users/Teamsfromuser-->✅<!--status-end--> | [Teams from user](docs/users/teams-for-user.md) | Get paginated list of teams associated with a specific user. |
| <!--status:users/Updateuser-->✅<!--status-end--> | [Update user](docs/users/update.md) | Update an existing user's account details including username, password, and role. |
| <!--status:users/Websitesfromuser-->✅<!--status-end--> | [Websites from user](docs/users/websites-for-user.md) | Get paginated list of websites associated with a specific user. |
<!--table-end-->

## Teams
<!--table:teams-->
| Status  | Name            | Description                         |
| :-------: | :-------- | :---------------- |
| <!--status:teams/Addausertoateam-->⏳<!--status-end--> | [Add a user to a team](docs/teams/add-user-to-team.md) | Add a specific user to a team with defined role permissions. |
| <!--status:teams/Createsteam-->⏳<!--status-end--> | [Creates team](docs/teams/create.md) | Create a new team for collaborative website management. |
| <!--status:teams/Deleteteam-->⏳<!--status-end--> | [Delete team](docs/teams/delete.md) | Permanently delete a team and remove all associated memberships. |
| <!--status:teams/Getteam-->⏳<!--status-end--> | [Get team](docs/teams/get-by-id.md) | Get detailed information for a specific team including member list and access code. |
| <!--status:teams/Jointeam-->⏳<!--status-end--> | [Join team](docs/teams/join.md) | Join an existing team using a valid access code. |
| <!--status:teams/Removeuserfromteam.-->⏳<!--status-end--> | [Remove user from team.](docs/teams/remove-user-from-team.md) | Remove a user from a team, revoking their access to team-shared websites. |
| <!--status:teams/Updateuserteamrole-->⏳<!--status-end--> | [Update user team role](docs/teams/update-user-role-for-team.md) | Update a team member's role permissions within the team. |
| <!--status:teams/Updateteam-->⏳<!--status-end--> | [Update team](docs/teams/update.md) | Update team configuration including name and access code. |
| <!--status:teams/Userfromteam-->⏳<!--status-end--> | [User from team](docs/teams/user-for-team.md) | Get detailed information about a specific user's membership within a team. |
| <!--status:teams/Allusersforteam-->⏳<!--status-end--> | [All users for team](docs/teams/users-for-team.md) | Get paginated list of all users belonging to a specific team. |
| <!--status:teams/Allwebsitesforteam-->⏳<!--status-end--> | [All websites for team](docs/teams/websites-for-team.md) | Get paginated list of all websites associated with a specific team. |
<!--table-end-->
