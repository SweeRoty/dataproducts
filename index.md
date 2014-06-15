---
title       : Linear Relationship Between Ozone and Solar Radiation, Wind and Temperature
subtitle    : A Slidify Presentation
author      : Marvin Han
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction to my shiny application

1. It is a simple application using linear regression model to show the relationship between ozone as the outcome and solar radiation, wind and temperature as the predictors in the R built-in airquality dataset. 
2. You can choose which variables (also interaction terms) to include in your model. 
3. The application will give you your model and its associated mean squared error.
4. It may take a little while to get the results when you access it online in the beginning. Just be a little patient! :)

--- .class #id 

## User Interface

1. The UI has two main parts: a sidebar panel and a main panel. 
2. On the sidebar panel on the left side, you can choose the terms to be included in your model. 
3. On the main panel on the right side, the results will be shown. 

## Server End

1. The server application uses reactive expression to recieve the regressor information and transforms it into a corresponding formula. 
2. It calculates the model and its mean squared error to be shown on the main panel.

--- .class #id

## A Example
- For example, if you choose solar radiation, wind and their interaction term as the regressors, the follwing things will be computed. 


```r
data(airquality)
# Exclude the missing values
na <- sapply(1:nrow(airquality), function(i) {
    any(is.na(airquality[i, ]))
})
data <- airquality[!na, ]
# Get the linear model
fit <- lm(Ozone ~ Solar.R + Wind + Solar.R:Wind, data = data)
# Calculate the mean squared error
mse <- format(sum(fit$resid^2)/nrow(data), digits = 5)
```


--- .class #id

## The Example Continued

- The following outputs will be shown on the main panel


```r
summary(fit)$coef
```

```
##              Estimate Std. Error t value  Pr(>|t|)
## (Intercept)  34.46769  17.634602   1.955 0.0532456
## Solar.R       0.32414   0.083928   3.862 0.0001928
## Wind         -1.59455   1.508979  -1.057 0.2930260
## Solar.R:Wind -0.02028   0.007246  -2.799 0.0060892
```

```r
mse
```

```
## [1] "562.88"
```

