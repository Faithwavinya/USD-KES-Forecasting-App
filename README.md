# USD-KES-Forecasting-App
An R Shiny application using ARIMA and Random Forest to forecast USD/KES exchange rates.
#📈 USD/KES Exchange Rate Forecasting Engine
Statistical ARIMA vs. Machine Learning (Random Forest)
#📝 Project Overview
This project addresses the volatility of the Kenyan Shilling (KES) against the US Dollar (USD). Using historical exchange rate data, I developed and compared two distinct forecasting methodologies to determine which provides more reliable insights for financial decision-making in the Kenyan market.

#🚩 Problem Statement
The USD/KES exchange rate is a critical economic indicator for Kenya’s import-dependent economy.
The Challenge: Traditional linear models often fail to capture the complex, non-linear "shocks" and structural breaks in currency markets.
The Goal: Build a robust predictive engine that minimizes error (MAPE) and provides a 30-day outlook for stakeholders.

#🧹 Data Cleaning & Preprocessing
Before modeling, the raw historical data underwent a strict preparation pipeline to ensure mathematical integrity:
Handling Missingness: Imputed gaps in weekend/holiday trading data to ensure a continuous time series.
Stationarity Testing: Conducted Augmented Dickey-Fuller (ADF) tests.
Feature Engineering: Transformed the time series into a supervised learning format for the Random Forest model using lagged variables and rolling averages.
Data Partitioning: Split the dataset into a Training set (80%) and a Test set (20%) to validate the models on completely unseen market conditions.

#🛠️ Methodology & Technical StackData Source
 Historical Daily USD/KES Rates.
 Models Used:
 ARIMA (Auto-Regressive Integrated Moving Average): A classical statistical model focused on trend and seasonality.
 Random Forest (Machine Learning): An ensemble method used to capture non-linear volatility and "jagged" market movements.
 Deployment: Interactive R Shiny dashboard hosted on the cloud.
 
 #📊 Model Performance Results
 Model        MAPE (Mean Absolute Percentage Error)          Status                                   
 ARIMA              0.3814%                                  Baseline
 Random Forest      0.2147%                                  ChampionModel


The "Winning" Margin: The Random Forest model reduced the forecast error rate by 43.7% compared to the ARIMA baseline. This significant reduction demonstrates that machine learning is better equipped to handle the specific volatility of the Kenyan Shilling.

💡 Findings & Recommendations
1.Model Selection: For high-stakes financial planning, the Random Forest engine should be the primary tool due to its superior precision.
2.Risk Management: The 44% improvement in accuracy means significantly less "currency surprise" for businesses handling large USD transactions.
3.Strategic Use: This tool allows importers to time their dollar acquisitions with higher confidence, potentially saving thousands of KES on large-scale transfers.

🚀 How to Use This Project
📊 **[View the Live Interactive App Here](https://faith-wavinya.shinyapps.io/kes_forecast_app/)
This project compares a statistical ARIMA model with a Random Forest machine learning model to predict Kenyan Shilling exchange rates.
Review the Code: See app.R for the server-side logic and UI design.
Reproduce: Download app_data.RData and run the script in RStudio.
Analyst: Faith Wavinya
Specialization: Quantitative Finance & Data Analytics
