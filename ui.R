library(shiny)
library(stringr)

shinyUI(pageWithSidebar(
    h3("Linear Relationship Between Ozone and Solar Radiation, Wind and Temperature"),
    sidebarPanel(
        h4("Select the regressors for your linear regression model"),
        checkboxGroupInput("variables", "Variables", 
                           c("Solar.R", "Wind", "Temp"), selected = "Solar.R"),
        checkboxGroupInput("interaction", "Interaction Terms", 
                           c("Solar.R & Wind", "Solar.R & Temp", "Wind & Temp")),
        h4("Instructions for users"),
        p("This is a simple application using the airquality dataset within R to build a linear model
          between ozone as the outcome and other three variables as predictors. On the left side, you
          can choose the terms you want to include in your model and the reults will be shown on the
          the right side with the mean squared error of your model. It may take a little while to get 
          the results when you access it online. :) ")
    ),
    mainPanel(
        h4("The generated linear model"),
        tableOutput("variables"),
        h4("The mean squared error of your linear model"),
        textOutput("mse")
    )
))