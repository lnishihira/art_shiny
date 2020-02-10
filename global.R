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
dim(moma_df)
summary(moma_df)


moma_df %>% ggplot(aes(x=class_)) + geom_bar(aes(fill=gender)) + 
  theme(axis.text.x = element_text(angle = 90)) + 
  scale_x_discrete(labels=c("Mies van der Rohe Archive" = 'Rohe Archive'))

class(moma_df$aqui_date)
