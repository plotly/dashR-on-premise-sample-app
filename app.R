library(dash)
library(dashCoreComponents)
library(dashHtmlComponents)

appName <- Sys.getenv("DASH_APP_NAME")
if (appName != "") {
  pathPrefix <- sprintf("/%s/", appName)

  Sys.setenv(DASH_ROUTES_PATHNAME_PREFIX = pathPrefix,
             DASH_REQUESTS_PATHNAME_PREFIX = pathPrefix)
}

app <- Dash$new()

app$layout(
  htmlDiv(
    list(
      dccInput(id='input-1-state', type='text', value='Montreal'),
      dccInput(id='input-2-state', type='text', value='Canada'),
      htmlButton(id='submit-button', n_clicks=0, children='Submit'),
      htmlDiv(id='output-state')
    )
  )
)


app$callback(output(id = 'output-state', property = 'children'),
             list(input(id = 'submit-button', property = 'n_clicks'),
                  state(id = 'input-1-state', property = 'value'),
                  state(id = 'input-2-state', property = 'value')),
             function(n_clicks, input1, input2) {
               sprintf("The Button has been pressed \"%s\" times, Input 1 is \"%s\", and Input 2 is \"%s\"", n_clicks, input1, input2)
             })

if (appName != "") {
  app$run_server(host = "0.0.0.0", port = Sys.getenv('PORT', 8050))
} else {
  app$run_server()
}
