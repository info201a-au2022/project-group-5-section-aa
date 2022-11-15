# P2: Scatterplot (Chart 2)
library(tidyverse)
library(dplyr)
wastate_deaths <- read.csv("../data/wastate_fetaldeaths.csv")
View(wastate_deaths)
str(wastate_deaths)

# Renaming columns 
wastate_deaths <- wastate_deaths %>% rename(year = StatOverview_Full_Data_data)
wastate_deaths <- wastate_deaths %>% rename(fd_annotate = X)
wastate_deaths <- wastate_deaths %>% rename(fd_suppress = X.1)
wastate_deaths <- wastate_deaths %>% rename(location = X.2)
wastate_deaths <- wastate_deaths %>% rename(id_annotate = X.3)
wastate_deaths <- wastate_deaths %>% rename(id_ratelower = X.4)
wastate_deaths <- wastate_deaths %>% rename(id_rateupper = X.5)
wastate_deaths <- wastate_deaths %>% rename(id_suppress = X.6)
wastate_deaths <- wastate_deaths %>% rename(num_of_records = X.7)
wastate_deaths <- wastate_deaths %>% rename(fetal_deathrate = X.8)
wastate_deaths <- wastate_deaths %>% rename(fetaldeath_staterate = X.9)
wastate_deaths <- wastate_deaths %>% rename(fetal_deaths = X.10)
wastate_deaths <- wastate_deaths %>% rename(infant_deathrate = X.11)
wastate_deaths <- wastate_deaths %>% rename(infantdeath_staterate = X.12)
wastate_deaths <- wastate_deaths %>% rename(infant_deaths = X.13)
wastate_deaths <- wastate_deaths %>% rename(live_births = X.14)

# Removing unwanted columns 
wastate_deaths <- wastate_deaths[, -c(2, 3, 5, 6, 7, 8)] # removes fd_annotate, 
# fd_suppress, id_annotate, id_ratelower, id_rateupper, and
# id_suppress
# link: https://sparkbyexamples.com/r-programming/remove-column-in-r/#:~:text=2.1%20Remove%20Column%20by%20Index&text=This%20notation%20takes%20syntax%20df,the%20%E2%80%93%20(negative)%20operator.

# Removing unwanted rows
wastate_deaths <- wastate_deaths %>% filter(!row_number() %in% c(1, 2)) # removes incorrect year and 1990 rows 
# link: https://www.r-bloggers.com/2022/06/remove-rows-from-the-data-frame-in-r/ 

# Getting rid of all empty cells and replacing them with NA
wastate_deaths[wastate_deaths == "" | wastate_deaths == " "] <- NA  # Replace blank & space by NA
View(wastate_deaths) 
# link: https://statisticsglobe.com/replace-blank-by-na-in-r 


# what type of things should we include in our summary information? 

# Checking value types 
typeof(wastate_deaths$year)
typeof(wastate_deaths$location)
typeof(wastate_deaths$num_of_records)
typeof(wastate_deaths$fetal_deathrate)
typeof(wastate_deaths$fetaldeath_staterate)
typeof(wastate_deaths$fetal_deaths)
typeof(wastate_deaths$infant_deathrate)
typeof(wastate_deaths$infantdeath_staterate)
typeof(wastate_deaths$infant_deaths)
typeof(wastate_deaths$live_births)
# all output as characters 

# Changing value types from character to integer 
wastate_deaths$year <- as.integer(wastate_deaths$year)
typeof(wastate_deaths$year) # integer 

wastate_deaths$num_of_records <- as.integer(wastate_deaths$num_of_records)
typeof(wastate_deaths$num_of_records) # integer 

wastate_deaths$fetal_deathrate <- as.integer(wastate_deaths$fetal_deathrate)
typeof(wastate_deaths$fetal_deathrate) # integer 

wastate_deaths$fetaldeath_staterate <- as.integer(wastate_deaths$fetaldeath_staterate)
typeof(wastate_deaths$fetaldeath_staterate) # integer 

wastate_deaths$fetal_deaths <- as.integer(wastate_deaths$fetal_deaths)
typeof(wastate_deaths$fetal_deaths) # integer 

wastate_deaths$infant_deathrate <- as.integer(wastate_deaths$infant_deathrate)
typeof(wastate_deaths$infant_deathrate) # integer 

wastate_deaths$infantdeath_staterate <- as.integer(wastate_deaths$infantdeath_staterate)
typeof(wastate_deaths$infantdeath_staterate) # integer 

wastate_deaths$infant_deaths <- as.integer(wastate_deaths$infant_deaths)
typeof(wastate_deaths$infant_deaths) # integer 

wastate_deaths$live_births <- as.integer(wastate_deaths$live_births)
typeof(wastate_deaths$live_births) # integer 

# Grouping total fetal deaths per year 
fetaldeaths_by_year <- wastate_deaths %>%
  group_by(year) %>%
  summarize(fetal_deathstotal = sum(fetal_deaths, na.rm = TRUE))
View(fetaldeaths_by_year) 


# with linear trend
fetaldeaths_scatterplot <- ggplot(fetaldeaths_by_year, aes(x=year, y=fetal_deathstotal)) +
  geom_point() +
  geom_smooth(method=lm , color="blue", se=FALSE) +
  scale_y_continuous(labels = scales:: comma) +
  labs(
    x = "Year",
    y = "Total Fetal Deaths",
    title = "Annual Fetal Deaths from 1990 to 2020",
    alt = "Total Fetal Deaths Per Year from 1990 to 2020"
  )
fetaldeaths_scatterplot








