library(shiny)
shinyServer(
  function(input, output) {
    getlist<- reactive({c(input$cyl,input$disp,input$hp,input$drat,input$wt,input$qsec,input$vs,input$am,input$gear,input$carb)})
    list<-c('cyl', 'disp', "hp", "drat", "wt", "qsec", "vs", "am", "gear", "carb")
    buildModel<- reactive({paste('mpg ~ ',paste(list[getlist()],collapse="+"))})
    fit<-reactive({lm(buildModel(),mtcars)})
    
    #pcall<-paste('LM Call: ', summary(fit)$call)
    #paste('R Squared: ', summary(fit)$r.squared)
    output$oModel <- renderText({paste('Model chosen: ',buildModel())})
    output$oCoef <- renderPrint({summary(fit())$coef})
    output$oRSq <- renderText({paste('R Squared: ', summary(fit())$r.squared)})
    output$oARSq <- renderText({paste('Adjusted R Squared: ', summary(fit())$adj.r.squared)})
    output$oFStat <- renderText({paste('Fstat: ',summary(fit())$fstatistic[1])})
    output$oResids <- renderPlot({
         plot(fit(),which=1)
    })
  }
)

