library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
    h4("Linear Relationship Between Ozone and Solar Radiation, Wind and Temperature in the Air Quality Dataset"),
    sidebarPanel(
        h5("The outcome variable is Ozone"),
        h5("Please select the regressor for your single variable linear regression model"),
        radioButtons("radio", "", choices = c("Solar.R", "Wind", "Temp")),
        h5("Notice"),
        p("It may take a little while to generate the results when you access it online. Please
          be a little patient! :) ")
    ),
    mainPanel(
        h5("The plot of your fitted simple linear regression line"),
        plotOutput("plot"),
        h5("The coefficients of your simple linear regression model"),
        tableOutput("table")
    )
))