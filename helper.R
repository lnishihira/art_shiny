

library(dplyr)
library(tidyr)
# This function creates a tibble that is spead for each artist
get_spread_data = function(artist_name, df=artsy_df2){
  df = 
    df %>% 
    filter(., name == artist_name) %>% 
    select(.,name, similar_names, similar_links, thumbnails)
  
  df = as_tibble(df) %>% 
    transform(similar_names = strsplit(as.character(similar_names), ","),
              similar_links = strsplit(as.character(similar_links), ","),
              thumbnails = strsplit(as.character(thumbnails), ",")) %>%
    unnest(similar_names, similar_links,thumbnails)
  df
}