library(shiny)
library(stringr)

data(airquality)
na <- sapply(1:nrow(airquality), function(i) {any(is.na(airquality[i, ])) } )
data <- airquality[!na, ]
fit <- function(variables, interactions) {
    formula <- "Ozone ~ "
    i <- 0
    for(variable in variables) {
        if(i == 0) {
            formula <- paste(formula, variable)    
        } else {
            formula <- paste(formula, " + ", variable)
        }
        i <- i + 1
    }
    for(interaction in interactions) {
        interaction <- str_replace(interaction, "&", ":")
        if(i == 0) {
            formula <- paste(formula, interaction)    
        } else {
            formula <- paste(formula, " + ", interaction)
        }
    }
    formula <- as.formula(formula)
    fit <- lm(formula, data = data)
    #summary(fit)$coef
}

error <- function(fit) {
    mse <- format(sum(fit$resid^2)/nrow(data), digits = 5)
}

shinyServer(
    function(input, output) {
        fit2 <- reactive({ fit(as.character(input$variables), as.character(input$interaction))  })
        output$variables <- renderTable({fit2()})
        output$mse <- renderText({error(fit2())})
    }
)