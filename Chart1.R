# Load libraries
library(plotly)
library(readr)
library(ggplot2)
 
# Assign data
data_set <- read.csv("~/INFO201/a3-spl-checkouts-nnguyen2513/2017-2023-10-Checkouts-SPL-Data.csv")

# Setting up y_axis variable
checkout_type <- data_set %>%
  group_by(CheckoutYear, CheckoutType) %>%
  summarise(
    total = sum(Checkouts))

#Graph trend
Chart1 <- plot_ly(
  data = checkout_type, 
  x = ~CheckoutYear, 
  y = ~total, 
  type = "scatter", 
  name = ~CheckoutType, 
  linetype= ~CheckoutType
  ) %>%
  layout(
    title = "Checkout type over the past 5 years (2017-2023)",
    xaxis = list(title = "Year"),
    yaxis = list(title = "Checkout Type")
    )
Chart1