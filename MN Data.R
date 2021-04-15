#Load PAckages

library(tidyverse)


library(readxl)

#Read Data

download_data <- read_excel("Data/2020 County Health Rankings Minnesota Data - v1_0 (1).xlsx",
    sheet= "Ranked Measure Data", skip=1)

download_data
glimpse(download_data)
transmute(
  download_data,
  FIPS,
  State,
  County,
  Deaths,
  
)