#Load PAckages

library(tidyverse)

library(readxl)

install.packages("corrplot")

library(corrplot)
library(ggplot2)
#Read Data

download_data <- read_excel("Data/2020 County Health Rankings Minnesota Data - v1_0 (1).xlsx",
                            sheet= "Ranked Measure Data", skip=1)

download_data

glimpse(download_data)


Ranked_meas_data <- select(
  download_data,
  FIPS,
  State,
  County,
  Deaths,
  violent_crime = `Violent Crime Rate` ,
  FP_health = `% Fair or Poor Health` ,
  Unemployment = `% Unemployed` ,
  Income = `Income Ratio` 
)

Ranked_meas_data

# plot------------------------------------------------------------------------


Ranked_meas_data %>%
  filter(!is.na(County)) %>%  
  select(-FIPS,-State,-County) %>%
  cor(use = "na.or.complete") %>% 
  corrplot(
    method = "color",
    type = "upper",
    order = "hclust",
    tl.col ="black" ,
    tl.srt = 45 ,
    addCoef.col = "black"
  )  

ggplot(Ranked_meas_data, aes(x = violent_crime, y= FP_health )) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE)

ggplot( Ranked_meas_data, aes(x = Unemployment, y = Income)) +
  geom_point() +
  geom_smooth(method = lm, se = TRUE)

