# Load on-premise config
source("config.R")

# R package dependencies (system dependencies go in Aptfile)
install.packages("remotes")
remotes::install_github("plotly/dasher")
