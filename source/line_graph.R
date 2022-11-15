# P2: Chart B.6 
# Designs and builds a chart that is intentionally designed to answer a 
# particular question. Chart meets standards described above, and insights are 
# clearly described in the index.Rmd file.

# Descriptive paragraph
# Includes purpose (why it's included)
# Includes insights (what information is revealed)

library(dplyr)
library(tidyverse)
library(ggplot2)
library(hrbrthemes)
library(kableExtra)
library(babynames)
library(viridis)
library(DT)
library(plotly)

state_infant_mortality <- read.csv("../data/im_state_table.csv")
View(state_infant_mortality)

state_infant_mortality$URL <- NULL
state_infant_mortality$RATE <- NULL

# Grouping total infant mortality per state 
by_state <- state_infant_mortality %>% 
  group_by(STATE) %>% 
  summarize(state_deaths_total = sum(DEATHS, na.rm = TRUE))
View(by_state)

by_year <- state_infant_mortality %>% 
  group_by(YEAR) %>% 
  summarize(state_deaths_total = sum(DEATHS, na.rm = TRUE))
View(by_year)

# Line graph depicting total(all states) infant mortality trends
ggplot(by_year, aes(x = YEAR, y = state_deaths_total)) +
  geom_line(color = "#69b3a2", size = 2, alpha = 0.9, linetype = 2) +
  scale_y_continuous(labels = scales:: comma) +
  labs(
    x = "Year",
    y = "Total Infant Deaths",
    title = "U.S. Infant Mortality From 2005 to 2020"
  )

# Infant mortality trends by state
data <- state_infant_mortality %>%
  filter(STATE %in% c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA",
                     "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                     "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                     "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                     "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"))

View(data)

infant_mortality_line_graph <- data %>% 
  ggplot(aes(x=YEAR, y=DEATHS, group=STATE, color=STATE)) +
  geom_line() +
  scale_color_viridis(discrete = TRUE) +
  theme(
    legend.position = "left",
    plot.title = element_text(size=14)
  ) +
  ggtitle("Infant Mortality by State from 2005 to 2020")
  