# Server for P3

# Loading libraries 
library(shiny)
library(tidyverse)
library(ggplot2)

# Loading data
wastate_deaths <- read.csv("./wastate_cleaned.csv") # set session to source file location 

# Writing server code
# Roni's section
server <- (function(input, output) {
  # Widgets for Page 2
  output$infantwidget <- renderUI({
    selectInput("location", "Choose a county:", choices = unique(wastate_deaths$location), multiple = TRUE,
                selected = c("King", "Pierce", "Snohomish"))
  })
  
  output$newinfantwidget <- renderUI({
    numericInput("year", "Choose a year:", value = 2010, min = 1990, max = 2020, step = 5)
  })
  # Plot for Page 2
  output$infantPlot <- renderPlotly({
    #Making the scatter plot
    
    infantplotData <- wastate_deaths %>%
      filter(year >= input$year) %>% 
      filter(location %in% input$location)
    
    #adding aesthetics 
    ggplot(infantplotData) +
      geom_point(mapping = aes(x = year, y = infant_deaths, color = location)) +
      labs(x = "year",
           y = "infant deaths",
           title = paste("infant deaths in", input$location,"county"))
  })
  output$fetalPlot <- renderPlotly({
    # Making the scatter plot
    
    fetalplotData <- wastate_deaths %>%
      filter(year >= input$year) %>% 
      filter(location %in% input$location)
    
    # adding aesthetics 
    ggplot(fetalplotData) +
      geom_point(mapping = aes(x = year, y = fetal_deaths, color = location)) +
      labs(x = "year",
           y = "fetal deaths",
           title = paste("fetal deaths in", input$location,"county"))
  })
  # Jonathan's section
  
  #JP's section
  
})
