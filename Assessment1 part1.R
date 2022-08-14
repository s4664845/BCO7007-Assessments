library(tidyverse)
library(rtweet)

auth_setup_default()

football_tweets<-search_tweets(
  q="football",
  n=15000,
  include_rts = FALSE,
  lang="en",
  retryonratelimit = TRUE)

football_tweets<-football_tweets%>%flatten()

football_tweets%>%write_csv("12_08_2022.csv")

football_tweets%>%write_csv("13_08_2022.csv")

football_tweets%>%write_csv("14_08_2022.csv")

#merging and opening all csv files

files<-list.files(pattern="\\.csv$",full.names = TRUE) 
all_data<-map_df(files, ~read_csv(.x))

#remove duplicate entries

final_data<-all_data%>%distinct()