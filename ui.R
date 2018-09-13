library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Data Products - Final Project - Shiny App"),
  sidebarPanel(
      h4('Choose any of the variables below as predictors:'),
      tags$hr(),
      checkboxInput(inputId="cyl", label = "Number of cylinders (cyl)", value= TRUE),
      checkboxInput(inputId="disp", label = "Engine displacement (disp)", value=FALSE),
      checkboxInput(inputId="hp", label = "Gross horsepower (hp)", value=FALSE),
      checkboxInput(inputId="drat", label = "Rear axle ratio (drat)", value=FALSE),
      checkboxInput(inputId="wt", label = "Weight (1000 lbs) (wt)", value=FALSE),
      checkboxInput(inputId="qsec", label = "1/4 mile time (qsec)", value=FALSE),
      checkboxInput(inputId="vs", label = "Engine (0 = V-shaped, 1 = straight) (vs)", value=FALSE),
      checkboxInput(inputId="am", label = "Include automatic transmission (am)", value=FALSE),
      checkboxInput(inputId="gear", label = "Number of forward gears (gear)", value=FALSE),
      checkboxInput(inputId="carb", label = "Number of carburetors (carb)", value=FALSE)
  ),
  mainPanel(
      h4('Results of Linear Model Fit'),
      p('A linear model has been fit to the mtcars data set using the variables chosen on the left to predict miles per gallon (mpg). The results of the linear model fit can be found below including several goodness-of-fit measures'),
      tags$hr(),
      textOutput('oModel'),
      verbatimTextOutput('oCoef'),
      textOutput('oRSq'),
      textOutput('oARSq'),
      textOutput('oFStat'),
      plotOutput('oResids')
  )
))
