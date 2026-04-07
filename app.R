library(shiny)
library(forecast)
library(randomForest)
library(ggplot2)

# 1. LOAD THE BRAIN 
load("app_data.RData")

# 2. UI: How the App Looks
ui <- fluidPage(
  theme = shinythemes::shinytheme("flatly"), 
  titlePanel("USD/KES Forecasting Engine"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a forecasting model to compare performance."),
      selectInput("modelType", "Choose Model:", 
                  choices = c("ARIMA (Statistical)", "Random Forest (Machine Learning)")),
      hr(),
      p(strong("Analyst:"), "Faith Wavinya"),
      p(strong("Status:"), "Live Prediction Engine"),
      p(em("Quantitative Finance & Data Analytics"))
    ),
    
    mainPanel(
      plotOutput("forecastPlot"),
      hr(),
      h4("Model Performance Comparison (MAPE)"),
      tableOutput("accuracyTable")
    )
  )
)

# 3. SERVER: How the App Thinks
server <- function(input, output) {
  
  output$forecastPlot <- renderPlot({
    if (input$modelType == "ARIMA (Statistical)") {
      # Plotting the ARIMA forecast with clean labels
      autoplot(future_forecast) + 
        theme_minimal() + 
        labs(title="ARIMA 30-Day Outlook",
             y="Exchange Rate (USD/KES)",
             x="Time Period")
      
    } else {
      # Plotting the Random Forest validation with professional labels
      plot(test_rf$Target, type="l", lwd=2, 
           main="Random Forest: Test Set Performance",
           ylab="Exchange Rate (USD/KES)",
           xlab="Days in Test Period",
           col="black")
      
      lines(rf_forecast, col="#2ecc71", lwd=2)
      
      legend("topright", 
             legend=c("Actual Market Rate", "RF Predictive Engine"), 
             col=c("black", "#2ecc71"), 
             lty=1, 
             lwd=2,
             bty="n")
    }
  })
  
  output$accuracyTable <- renderTable({
    data.frame(
      Model = c("ARIMA (Classical Statistics)", "Random Forest (Machine Learning)"),
      MAPE_Error = c("0.3814%", "0.2147%"),
      Status = c("Baseline", "Champion Model")
    )
  })
}

# 4. RUN THE APP
shinyApp(ui = ui, server = server)