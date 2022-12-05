# app for P3

library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)

source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)

