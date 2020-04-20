# ?strptime - Date/Time converstion to and from characters

library(tidyverse)
library(purrr)
library(lubridate)

data <- read_csv("data/FKISM.csv")

view(data)

##################
# Plot by location 2011-present

new_data_loc <-
  select(data, Location, Day, Month, year, Environment, Quality) 

new_data_loc <- new_data_loc[ , c("Location",  "Day", "year", "Month", "Environment", "Quality")] %>% 
  unite(Date, year, Month, Day, sep = "/", remove = TRUE, na.rm = FALSE) %>% 
  arrange(Date) 

new_data_loc$Date <- as.Date(new_data_loc$Date,format="%Y/%m/%d")

ggplot(
  data = new_data_loc,
  mapping = aes(x = Date, y = Location, colour = Environment, size = Quality)
) +
  geom_point(alpha = 0.5)

view(new_data_loc)

################
# Plot by region 2011-present

new_data_reg <-
  select(data, Region, Day, Month, year, Environment, Quality) 

new_data_reg <- new_data_reg[ , c("Region",  "Day", "year", "Month", "Environment", "Quality")] %>% 
  unite(Date, year, Month, Day, sep = "/", remove = TRUE, na.rm = FALSE) %>% 
  arrange(Date) 

new_data_reg$Date <- as.Date(new_data_reg$Date,format="%Y/%m/%d")

ggplot(
  data = new_data_reg,
  mapping = aes(x = Date, y = Region, colour = Environment, size = Quality)
) +
  geom_point(alpha = 0.5)

view(new_data_reg)



