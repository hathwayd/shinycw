library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Fertility Predictor (Swiss Data)"),
  
  sidebarLayout(
    sidebarPanel(style="background-color:yellow", 
      
      helpText("Predicting likely Fertility rate for a population with the following 4 characteristics."),            
      numericInput("Ag",label = h5("Agriculture [0:40]"),min = 0, max = 40,55), 
      numericInput("Ed",label = h5("Education [0:55]"),min = 0, max = 55,10), #,value = 10
      numericInput("Ca",label = h5("Catholic [0:100]"),min = 0, max = 100,40), #,value = 40
      numericInput("In",label = h5("Infant Mortality [10:30]"),min = 10, max = 30,20), #,value = 20
      actionButton("Fert", label = "Fertility Rate"),
      helpText("The data set is from Swiss Fertility and Socioeconomics Indicators (1888) Data, available from the R datasets library. Several regression models were run, and the best one chosen using adjr2,cp and bic outputs from regsubsets (leaps)")
      
    ),
    mainPanel
    (
      tabsetPanel
      (
        tabPanel("Calculations",
                 p(h4("Predicted Fertility")),
                 textOutput("F_result")
                 
                 
        ),
        tabPanel(
          "Documentation",
          p(h3("Swiss Fertility Prediction")),
          br(),
          helpText("Multiple regressions were ran to find the best linear model for predicting Fertility."),
          helpText("The best model used 4 of the 5 variables available in the 47-observation dataset."),
          helpText("The formula used is:"),
          helpText("68.55 - input$Ag*.1389 - input$Ed*1.0989 + input$Ca*0.095 + input$In*0.8132"),
          p(h4("Individual regressor plots")),
          plotOutput("plot1")
          
        )
        
        
      )
    )
  )
))