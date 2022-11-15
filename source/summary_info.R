# Summary Information Script B.2
library(dplyr)
library(tidyverse)

# summary_info.R 

#Top five states with the most infant deaths in 2005 
top_states_2005 <-state_infant_mortality %>% 
  filter(YEAR == 2005) %>% 
  arrange(desc(DEATHS)) %>% 
  slice(1:5)

View(top_states_2005)

#Top five states with the most deaths in 2005
top_states_2020 <- state_infant_mortality %>% 
  filter(YEAR == 2020) %>% 
  arrange(desc(DEATHS)) %>% 
  slice(1:5)

View(top_states_2020)

#Total Number of Infant Mortalities in 2020
total_infant_mortalities_2020 <- state_infant_mortality %>% 
  filter(YEAR == 2020) %>% 
  summarize(state_total_deaths = sum(DEATHS))

View(total_infant_mortalities_2020)

