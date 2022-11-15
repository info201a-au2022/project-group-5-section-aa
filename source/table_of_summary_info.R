library(tidyverse)
library(dplyr)
# Table of Summary Information
state_infant_deaths <- read.csv("../data/im_state_table.csv")

group_states <- state_infant_deaths %>% 
  select('YEAR', 'STATE', 'RATE', 'DEATHS') %>% 
  filter(YEAR > '2015') %>% 
  group_by(YEAR)
