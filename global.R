# rsconnect::setAccountInfo(name='lnishihira',
#                           token='DF3D83C33008A6358B3525B318E95249',
#                           secret='Ti35CMZjSj9ilZ38lqWaIgonBbn2313XJ62yd7tz')

library(dplyr)
library(shiny)
library(ggplot2)
library(shinyjs)
library(tidyr)


artsy_df_0 <- read.csv("data/artsy_api_2.csv")
moma_df_0 <- read.csv("data/moma_cleaned.csv")
#names_choices = c(sapply(list(artsy$name), levels))
#colnames(artsy_df)
artsy_df = as_tibble(artsy_df_0)
moma_df = as_tibble(moma_df_0)
moma_df$aqui_date = as.Date(moma_df$aqui_date)
#colnames(artsy_df2)
#artsy_df2

