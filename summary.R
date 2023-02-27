# Load libraries
library(plotly)
library(readr)
library(ggplot2)

# Assign data
data_set <- read.csv("~/INFO201/a3-spl-checkouts-nnguyen2513/2017-2023-10-Checkouts-SPL-Data.csv")


# Which was the main form of checkout mediums, had the most usage in 2018?

top_medium <- data_set %>% 
  filter(CheckoutYear == 2018) %>% 
  group_by(CheckoutType) %>% 
  summarise(total = sum(Checkouts)) %>% 
  arrange(desc(total)) %>% 
  top_n(1) %>% 
  pull(CheckoutType)

# Which was the main form of checkout mediums, had the least usage in 2018?

bot_medium <- data_set %>% 
  filter(CheckoutYear == 2018) %>% 
  group_by(CheckoutType) %>% 
  summarise(total = sum(Checkouts)) %>% 
  arrange(total) %>% 
  top_n(-1) %>% 
  pull(CheckoutType)

# Which month did Horizon have the most amount of check outs in total for the past 5 years? 

horizon_monthly_avg <- data_set %>%
  filter(CheckoutType == "Horizon") %>%
  group_by(CheckoutMonth) %>%
  summarise(total = sum(Checkouts)) %>% 
  arrange(total) %>% 
  top_n(1) %>% 
  pull(CheckoutMonth)

# Which months did OverDrive have the most amount of check outs in total for the past 5 years?

OD_monthly_avg <- data_set %>%
  filter(CheckoutType == "OverDrive") %>%
  group_by(CheckoutMonth) %>%
  summarise(total = sum(Checkouts)) %>% 
  arrange(total) %>% 
  top_n(1) %>% 
  pull(CheckoutMonth)

# What are the top 10 most checked out 'Titles' of within the last 5 year?
top_10_most_checked_out <- data_set %>% 
  group_by(Title) %>% 
  summarise(total = sum(Checkouts)) %>% 
  arrange(desc(total)) %>% 
  top_n(10) %>% 
  pull(Title)