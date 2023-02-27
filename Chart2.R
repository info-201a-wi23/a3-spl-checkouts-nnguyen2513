# Load libraries
library(plotly)
library(readr)
library(dplyr)

# Assign data
data_set <- read.csv("~/INFO201/a3-spl-checkouts-nnguyen2513/2017-2023-10-Checkouts-SPL-Data.csv")

# Setting up y_axis variable
checkout_type_month <- data_set %>%
  group_by(CheckoutMonth, CheckoutType) %>%
  summarise(
    total2 = sum(Checkouts))

#Graph trend
Chart2 <- plot_ly(
  data = checkout_type_month, 
  x = ~CheckoutMonth, 
  y = ~total2, 
  type = "scatter", 
  name = ~CheckoutType, 
  linetype= ~CheckoutType
) %>%
  layout(
    title = "Checkout type trend per month (2017-2023)",
    xaxis = list(title = "Month"),
    yaxis = list(title = "Checkout Type")
  )
Chart2