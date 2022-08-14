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

football_tweets%>%write_csv("14_08_2022.csv")