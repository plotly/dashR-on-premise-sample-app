## Dash On-Premise Sample App Versions 3.3.0+

This repository contains a simple Dash app that can be deployed as-is on your [Dash Deployment Server](https://plot.ly/dash/pricing/) server. This application is configured to deploy on Dash Deployment Server versions 3.3.0 and above. 

#### Deployment Instructions

To learn more about what each of these files does and how to start from scratch, see the [Dash App Deployment Docs](https://plot.ly/dash/deployment/on-premise).

#### Authentication Instructions
Check out the following documentation for information on [privacy](https://dash.plot.ly/dash-deployment-server/privacy) and [authentication](https://dash.plot.ly/dash-deployment-server/app-authentication) settings
available for Dash applications deployed on your Dash Deployment server. Note: the `dash-auth` package is
no longer necessary with DDS 3.0.0+ and users may notice a double login if deploying apps with
`dash-auth < 1.3.0` on DDS 3.0.0 and above.
