# Server for P3

# Loading libraries 
library(shiny)
library(tidyverse)
library(ggplot2)
library(markdown)

# JP Extra Libraries
library(dplyr)
library(plotly)
library(maps)
library(datasets)
library(usdata)
# Map library 
library(mapproj)

# Loading data
wastate_deaths <- read.csv("./wastate_cleaned.csv") # set session to source file location 
maternalMortalityRatio <- read.csv("./maternalmortalityratio_cleaned.csv")
states_data <- read.csv("./im_state_table.csv")

# Writing server code
server <- (function(input, output) {
  # Roni's section
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
  output$maternalRatioMap <- renderPlotly({
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
  output$maternalRatioGraph <- renderPlotly({
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
  #Widget creation
  output$value <- renderPrint({ input$num }) 
  
  output$states_map <- renderPlot({
    
    # Data Wrangling for Map
    states_data$URL <- NULL #Making URL column null
    
    states_data <- states_data %>% 
      filter(!row_number() %in% c(351:400)) #Remove 2005 data, dataset now 2014 - 2020
    
    state_shape <- map_data("state")
    state_abbrevs <- data.frame(state.abb, state.name)
    
    map_data <- left_join(states_data, state_abbrevs, by = c('STATE' = 'state.abb')) %>% 
      mutate(region = tolower(state.name))
    
    map_data <- left_join(state_shape, map_data)
    
    map_data <- map_data %>% distinct(long, lat, region, YEAR, STATE, RATE, DEATHS)
    
    #Creating Total Infant Mortality Map
    ggplot(map_data) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = STATE, fill = DEATHS),
        color = "black", # show state outlines
        linewidth = 0.1 # thinly stroked
      ) +
      coord_map() + # use a map-based coordinate system
      scale_fill_continuous(low="yellow", high="red") +
      labs(fill = "Total Infant Deaths",
           x = "Longitude",
           y = "Latitude",
           title = "U.S. Infant Death Rate by State from 2014 - 2020")
    
  })
  
  output$state_bargraph <- renderPlot({
    # ALL STATES INFANT DEATH BAR GRAPH
    
    states_data <- states_data %>% 
      filter(!row_number() %in% c(351:400)) #Remove 2005 data, dataset now 2014 - 2020
    
    by_year <- states_data %>% #Data Wrangling for bar graph
      group_by(YEAR) %>% 
      summarize(state_deaths_total = sum(DEATHS, na.rm = TRUE))
    
    ggplot(data = by_year) + 
      geom_col(mapping = aes(
        x = YEAR, 
        y = state_deaths_total
      ), 
      fill = "lightblue"
      ) + 
      scale_y_continuous(labels = scales:: comma) +
      labs(
        x = "Year",
        y = "Total U.S. States Infant Deaths",
        title = "Annual Infant Deaths from 2014 to 2020"
      ) + 
      geom_smooth(aes(x = YEAR, y = state_deaths_total), se = FALSE)
    
  })
  
  output$states_linegraph <- renderPlot({
    
    line_graph_data <- states_data %>%
      filter(STATE %in% c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
                          "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                          "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                          "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                          "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"))
    
    
    line_graph_data %>% 
      ggplot(aes(x=YEAR, y=DEATHS, group=STATE, color=STATE)) +
      geom_line() +
      theme(
        legend.position = "left",
        plot.title = element_text(size=14)
      ) +
      ggtitle("Infant Mortality by State from 2014 to 2020")
    
  })
})
