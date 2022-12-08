# app for P3

library(shiny)
library(plotly)
library(ggplot2)
library(tidyverse)
library(markdown)

source("app_server.R")
source("app_ui.R")

# Run the application 
shinyApp(ui = ui, server = server)

