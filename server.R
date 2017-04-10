library(shiny)
library(datasets)


shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$Fert
    values$f <- isolate({
      
      68.55 - input$Ag*.1389 - input$Ed*1.0989 + input$Ca*0.095 + input$In*0.8132
      
    })
  })
  
  # Display Fertility prediction
  
  output$F_result <- renderText({
    paste(round(values$f))
  })
  # Show reference plots
  output$plot1 <-renderPlot({
  par(mfrow=c(2,2))
      plot(swiss$Fertility,swiss$Education,ylab="Factor1: Education",xlab="Fertility")
      abline(lm(swiss$Fertility~swiss$Education),col=2)
      plot(swiss$Fertility,swiss$Infant.Mortality,ylab="Factor2: Infant Mortality",xlab="Fertility")
      abline(lm(swiss$Fertility~swiss$Infant.Mortality),col=6)
      plot(swiss$Fertility,swiss$Agriculture,ylab="Factor3: Agriculture",xlab="Fertility")
      abline(lm(swiss$Fertility~swiss$Agriculture),col=4)
      plot(swiss$Fertility,swiss$Catholic,ylab="Factor4: Catholicism",xlab="Fertility")
      abline(lm(swiss$Fertility~swiss$Catholic),col=5)
  })
  
})