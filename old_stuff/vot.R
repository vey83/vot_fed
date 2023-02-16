#library
library(tidyverse)
library(readxl)
#import
vot_raw <- read_excel("votations_cantons.xls", 
                                col_types = c("text", "text", "numeric", 
                                              "text", "numeric", "numeric", "numeric", 
                                              "numeric", "numeric", "numeric", 
                                              "numeric"))

vot <- vot_raw %>%
  separate(texte, into = c("date","texte"), sep = 10) %>%
  fill(canton_abr,canton)
vot$date <- as.Date(vot$date)

#complete