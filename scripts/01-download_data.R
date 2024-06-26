#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
# Date: 6 April 2024
# Contact: hechen.zhang@mail.utoronto.ca

# Workplace Setup
library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(gridExtra)
library(psych)
library(broom)
library(tidyverse)
library(patchwork)
library(arrow)
library(kableExtra)
library(opendatatoronto)
library(grid)


# get package
package <- show_package("64a26694-01dc-4ec3-aa87-ad8509604f50")

# get all resources for this package
resources <- list_package_resources("64a26694-01dc-4ec3-aa87-ad8509604f50")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
Data <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(
  x = Data,
  file = "data/raw_data/raw_fire_incident_data.csv"
)

glimpse(Data)
