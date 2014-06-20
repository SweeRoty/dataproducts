library(shiny)
library(ggplot2)

data(airquality)
na <- sapply(1:nrow(airquality), function(i) {any(is.na(airquality[i, ])) } )
data <- airquality[!na, ]
myFit <- function(variable) {
    formula <- as.formula(paste("Ozone ~", variable))
    fit <- lm(formula, data = data)
}

myPlot <- function(variable) {
    x <- data[[variable]]
    y <- data[["Ozone"]]
    myData <- data.frame(X = x, Y = y)
    plot <- ggplot(data = myData, aes(X, Y)) + geom_point() + geom_smooth(method = "lm") + labs(x = variable, y = "Ozone")
    print(plot)
}

shinyServer(
    function(input, output) {
        fit <- reactive({ myFit(as.character(input$radio)) })
        output$plot <- renderPlot({  myPlot(as.character(input$radio))  })
        output$table <- renderTable({fit()})
    }
)