# Load libraries
library(plotly)
library(readr)
library(dplyr)

# Assign data
data_set <- read.csv("~/INFO201/a3-spl-checkouts-nnguyen2513/2017-2023-10-Checkouts-SPL-Data.csv")

# Setting up y_axis variable
top_10_books <- data_set %>%
  group_by(Title) %>%
  summarise(
    total3 = sum(Checkouts))
top_10_books <- top_n(top_10_books, 10)

#Graph trend
Chart3 <- plot_ly(
  data = top_10_books,
  x = ~Title, 
  y = ~total3, 
  type = "bar"
) %>%
  layout(
    title = "Top 10 Titles (2017-2023)",
    xaxis = list(title = "Title"),
    yaxis = list(title = "Checkouts")
  ) %>%
  layout(autosize = T, margin=list( l = 50, r = 50, b = 100, t = 100,  pad = 4))
Chart3