library(tidyverse)

df <- read_csv('data/data_302.csv')
head(df)

df$AGE_BUCKET <- factor(df$AGE_BUCKET, levels=c("<18", "18-34", "34-49", "50-64", ">64"))
df$INCARCERATED_BEFORE <- factor(df$INCARCERATED_BEFORE)

# WHAT IS GOING ON?
df %>%
  group_by(INCARCERATED_BEFORE) %>%
  summarize(mean_death = mean(all_death), n=n())

# OH WAIT MAYBE IT'S AGE
df %>%
  group_by(AGE_BUCKET, INCARCERATED_BEFORE) %>%
  summarize(mean_death = mean(all_death), n=n()) %>%
  arrange(AGE_BUCKET, INCARCERATED_BEFORE) %>%
  ggplot() + geom_bar(aes(x=AGE_BUCKET, y=mean_death, fill=INCARCERATED_BEFORE),
                      position='dodge', stat='identity')


