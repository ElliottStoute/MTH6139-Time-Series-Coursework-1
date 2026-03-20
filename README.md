# MTH6139-Time-Series-Coursework-1

## Summary
MTH6139 Time Series Coursework 1 based on the Australian Beer Production between 1990-1995.Using Meta's Time Series Prophet package in R to perform forecasts on the data. Predicting the following 36 months of data. The model demonmstrates seasonal cyle with production peaking during Australian summer in the October to December period and June to July being a seasonal low point. Overall yearly decline is seen in Beer production.

## Data Source
https://www.kaggle.com/code/mpwolke/australian-monthly-beer-production/input?select=dataset

## Code Structure
1)Import, read and manipulate csv file data
2)Fit Prophet Model
3)Forecast 
4)Plot forecast
5)Plot of components

## Decisons Made in Code
- Appended data to assume 1st of the month to make YYYY-MM-DD format for prophet use
- Only Yearly Seasonality enabled 
- Additive Mode as trend across data is consistent
