library(dasher)

# configure the underlying R server
server <- fiery::Fire$new(
  host = '0.0.0.0', 
  port = as.integer(Sys.getenv('PORT'))
)

# Name your dasher app.
# 
# This name determines the URL of your deployed app,
# so it can't contain any spaces, capitalizations, or special characters
#
# This name MUST match the name that you specified in the App Manager
Sys.setenv("DASH_APP_NAME" = "name-of-your-dash-app")

app <- Dash$new(
  name = Sys.getenv("DASH_APP_NAME"),
  server = server
)

# ---------------------------------------------------------------------------
# If on-premise, modify the app's config and add authentication 
# ---------------------------------------------------------------------------

isOnPremise <- "DYNO" %in% names(Sys.getenv())
isPathBased <- toupper(Sys.getenv("PATH_BASED_ROUTING")) == "TRUE"

if (isOnPremise) {
  domain <- Sys.getenv("PLOTY_DASH_DOMAIN")
  
  app_url <- if (isPathBased) {
    if (identical(app$name, 'name-of-your-dash-app')) stop('Please enter the name of your dash app inside config.R')
    app$config_set(requests_pathname_prefix = sprintf("/%s/", app$name))
    sprint("%s/%s", sub("/+$", "", domain), app$name)
  } else {
    domainParts <- strsplit(domain, "://")[[1]]
    sprintf("%s://%s.%s", domainParts[1], app$name, domainParts[2])
  }
  
  # TODO: implment dasher::auth_plotly() and dasher::auth_basic()!
  # - should these be methods (i.e., app$auth_plotly())?
  app <- auth_plotly(
    app,
    Sys.getenv("DASH_APP_NAME", app$name),
    Sys.getenv("DASH_APP_PRIVACY", "public"),
    app_url
  )
}


# ---------------------------------------------------------------
# The actual dasher app logic goes here
# ---------------------------------------------------------------

app$layout_set(
    htmlH2('Hello World'),
    coreDropdown(
        id = 'dropdown',
        options = c('LA', 'NYC', 'MTL'),
        value = 'LA'
    ),
    htmlDiv(id = 'display-value')
)

app$callback(
  function(value = input('dropdown')) paste("You have selected", value),
  output('display-value')
)

app$run_server()