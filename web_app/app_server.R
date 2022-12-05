# Server for P3

# Loading libraries 
library(shiny)
library(tidyverse)
library(ggplot2)

# Loading data
wastate_deaths <- read.csv("./wastate_cleaned.csv") # set session to source file location 
maternalMortalityRatio <- read.csv("../data/maternalMortalityRatio_cleaned.csv")

# Writing server code
server <- (function(input, output) {
  # Roni's section
  # Widgets for Page 2
  output$infantwidget <- renderUI({
    selectInput("location", "Choose a county:", choices = unique(wastate_deaths$location), multiple = TRUE,
                selected = c("King", "Pierce", "Snohomish"))
  })
  
  output$newinfantwidget <- renderUI({
    numericInput("year", "Choose a year:", value = 2010, min = 1990, max = 2020, step = 2.5)
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
      scale_x_continuous(breaks = c(1990, 1995, 2000, 2005, 2010, 2015, 2020)) +
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
  # Year widget for map
  output$value <- renderPrint({ input$yearSlider })
  
  # Map creation
  output$maternalRatioMap <- renderPlot({
    # Using the year widget
    mapMaternalMortalityRatio <- maternalMortalityRatio %>% 
      filter(Year == input$yearSlider)
    
    # Creating the world map
    world_shape <- map_data("world") %>% # load county shapefile
      rename(Country = region) %>% 
      left_join(maternalMortalityRatio, by = "Country") # join jail population data
    
    # Creating the map with the data
    ggplot(world_shape) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group, fill = Ratio),
        color = "white", # show state outlines
        size = 0.1 # thinly stroked
      ) +
      coord_map() + # use a map-based coordinate system
      scale_fill_continuous(low="blue", high="red") +
      labs(fill = "Ratio",
           x = "Longitude",
           y = "Latitude",
           title = "Maternal Mortality Ratio Across the Globe",
           caption = "The graph shows the differences in jail population rate
          across all of the US in 2018.")
  })
  
  # Country widget for line graph 
  output$value <- renderPrint({ input$countrySelecter })
  
  # Line graph creation
  output$maternalRatioGraph <- renderPlot({
    # Using the country widget
    graphMaternalMortalityRatio <- maternalMortalityRatio %>% 
      filter(Country == input$countrySelecter)
    
    # Creating the line graph with the data
    ggplot(data = graphMaternalMortalityRatio,
           aes(x = Year, y = Ratio, group = Country)) +
      geom_line() +
      geom_point() +
      scale_y_continuous(labels = scales:: comma) +
      labs(
        x = "Year",
        y = "Maternal Mortality Ratio",
        title = "Maternal Mortality Ratio Through the Years",
        alt = "Shows the maternal mortality ratio through the years of whatever 
        country is chosen",
        caption = "The graph shows what the maternal mortality ratio is through the 
        years, highlighting the differences."
      )
  })
  
  #JP's section
  
})
