# Summary Information Script B.2
library(dplyr)
library(tidyverse)

state_infant_mortality <- read.csv("../data/im_state_table.csv")
global_maternal_mortality <- read.csv("../data/maternalMortalityRatio.csv")

summary_info <- list()

#Top US state with the most infant deaths in 2005 
summary_info$top_state_2005 <- state_infant_mortality %>% 
  filter(YEAR == 2005) %>% 
  filter(DEATHS == max(DEATHS)) %>% 
  pull(STATE)

#Top US state with the most deaths in 2020
summary_info$top_state_2020 <- state_infant_mortality %>% 
  filter(YEAR == 2020) %>% 
  filter(DEATHS == max(DEATHS)) %>% 
  pull(STATE)

#Total Number of Infant Mortalities in 2020 across the US
summary_info$total_infant_mortalities_2020 <- state_infant_mortality %>% 
  filter(YEAR == 2020) %>% 
  summarize(state_total_deaths = sum(DEATHS))

#Clean up global_maternal_mortality
num <- global_maternal_mortality$First.Tooltip
get_num <- function() {
  temp_num <- str_replace(num, " \\[.*\\]", "")
  return(temp_num)
}
exact_num <- get_num()

correct_deaths <- as.numeric(exact_num)

global_maternal_mortality$First.Tooltip <- correct_deaths

#The highest amount of maternal mortalities around the world
summary_info$highest_yearly_deaths <- global_maternal_mortality %>% 
  filter(First.Tooltip == max(First.Tooltip)) %>% 
  pull(First.Tooltip)

#Country with the highest amount of maternal mortalities
summary_info$highest_country <- global_maternal_mortality %>% 
  filter(First.Tooltip == max(First.Tooltip)) %>% 
  pull(Location)

#Year with the highest amount of maternal mortalities
summary_info$highest_year <- global_maternal_mortality %>% 
  filter(First.Tooltip == max(First.Tooltip)) %>% 
  pull(Period)

