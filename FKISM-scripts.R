# ?strptime - Date/Time converstion to and from characters

library(tidyverse)
library(purrr)
library(lubridate)

data <- read_csv("data/FKISM-2.csv")

view(data)

##################
# Plot by location 2011-present

data <-
  select(data, Location, Day, Month, year, Enviro1, Quality) 

data_sel <- data[ , c("Location",  "Day", "year", "Month", "Enviro1", "Quality")] %>% 
  unite(Date, year, Month, Day, sep = "/", remove = TRUE, na.rm = FALSE) %>% 
  arrange(Date) 

data_sel$Date <- as.Date(data_sel$Date,format="%Y/%m/%d")

view(data_sel)

ggplot(
  data = data_sel,
  mapping = aes(x = Date, y = Location, colour = Enviro1, size = Quality)
) +
  geom_point(alpha = 0.5)

view(data_sel)

################
# Plot by region 2011-present

new_data_reg <-
  select(data, Region, Day, Month, year, Enviro1, Quality) 

new_data_reg <- new_data_reg[ , c("Region",  "Day", "year", "Month", "Enviro1", "Quality")] %>% 
  unite(Date, year, Month, Day, sep = "/", remove = TRUE, na.rm = FALSE) %>% 
  arrange(Date) 

new_data_reg$Date <- as.Date(new_data_reg$Date,format="%Y/%m/%d")

ggplot(
  data = new_data_reg,
  mapping = aes(y = Date, x = Region, colour = Enviro1, size = Quality)
) +
  geom_point(alpha = 0.5)

view(new_data_reg)



