library(tidyverse)

df <- read_csv('data/data_302.csv')
head(df)

# WHAT IS GOING ON?
df %>%
  group_by(INCARCERATED_BEFORE) %>%
  summarize(mean(all_death))

# OH WAIT MAYBE IT'S AGE
df %>%
  group_by(AGE_BUCKET, INCARCERATED_BEFORE) %>%
  summarize(mean(all_death), n()) %>%
  arrange(AGE_BUCKET, INCARCERATED_BEFORE)
