# Dash On-Premise is configured with either "Path based routing"
# or "Domain based routing"
# Ask your server administrator which version was set up.
# If a separate subdomain was created,
# then set this to `False`. If it was not, set this to 'True'.
# Path based routing is the default option and most On-Premise
# users use this option.
Sys.setenv("PATH_BASED_ROUTING" = "TRUE")

# Fill in with your Plotly On-Premise username
Sys.setenv("PLOTLY_USERNAME" = "your-plotly-username")

# Fill in with your Plotly on-premise API key
# See <your-plotly-server>/settings/api to generate a key
# If you have already created a key and saved it on your own machine
# (from the Plotly-Python library instructions at https://plot.ly/python/getting-started)
# then you can view that key in your ~/.plotly/.config file or by running:
# `python -c import plotly; print(plotly.tools.get_config_file())`
Sys.setenv("PLOTLY_API_KEY" = "your-plotly-api-key")

# Fill in with your Plotly On-Premise domain
Sys.setenv("PLOTLY_DOMAIN" = "https://your-plotly-domain.com")
Sys.setenv("PLOTLY_API_DOMAIN" = Sys.getenv("PLOTLY_API_DOMAIN", NA))

# Fill in with the domain of your Dash subdomain.
# This matches the domain of the Dash App Manager
Sys.setenv("PLOTLY_DASH_DOMAIN" = "https://your-dash-manager-plotly-domain.com")

# Set to `private` if you want to add a login screen to your app
# You can provision who can view the app in your list of files at <your-plotly-server>/organize
# Set to `public` if you want your app to be accessible to anyone who has access to your network
Sys.setenv("DASH_APP_PRIVACY" = "public")

# Keep as TRUE if your SSL certificates are valid.
# If you are just trialing Plotly On-Premise with self signed certificates,
# then you can set this to FALSE. Note that self-signed certificates are not
# safe for production.
Sys.setenv("PLOTLY_SSL_VERIFICATION" = "TRUE")