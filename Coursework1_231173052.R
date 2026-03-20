#' ---
#' title: Time Series Coursework 1 231173052
#' author: Elliott Stoute
#' student number: 231173052
#' date: Today
#' ---

# 1. R Scratchpad ------------------------------------------------------------

#Import, read and manipulate csv file data ----
#reading data file, and creates data frame
AusBeerProdRawData <- read.csv("monthly-beer-production-in-austr.csv",stringsAsFactors = FALSE)



#appending ds column in csv file to first of each month in form YYYY-MM-DD to work with prophet format
#assumed all dates in data occur on the first of each month for ease
AusBeerProd <- data.frame(
    ds = as.Date(paste0(AusBeerProdRawData$ds, "-01")),
    y = as.numeric(AusBeerProdRawData$y)
)

#Fit Prophet Model ----
AusBeerProdModel <- prophet::prophet(AusBeerProd, yearly.seasonality = TRUE,weekly.seasonality = FALSE, daily.seasonality = FALSE, seasonality.mode = "additive", changepoint.prior.scale = 0.05)
#future dates creation
Future_Dates <- prophet::make_future_dataframe(AusBeerProdModel, periods = 36, freq = "month")
#make_future_dataframe() extends the ds column further
#periods = 36 extends ds column to 36 months in future to 1998-01-01
#Futuredates contains original data with additonal 36 data points

#Forecast ----
AusBeerProdForecast <- predict(AusBeerProdModel, Future_Dates)

#Plot forecast ----
plot(AusBeerProdModel, AusBeerProdForecast)
# plots ds against y
#Black dots are observations of concrete data
#Solid line is the fitted line to data
#Shaded area is the uncertainty band


#Plot of components ----
prophet::prophet_plot_components(AusBeerProdModel, AusBeerProdForecast)
#Plots the trend and seasonality data
#overall decline over period

#Plot of raw data
plot(AusBeerProd,type = "l", xlab ="Date", ylab="Beer Production in ML", main = "Australian Beer Production 1990-1995 (Monthly)")

# 2. Use Sectioning ----------------------------------------------------------
#   Comment lines start with #, they are not read by R
#   If you end comment lines with space and four minus signs -
#   they will be interpreted as section headings.
#   You can add more - to visually separate sections.
#   CTRL+SHIFT+R / ⌘+SHIFT+R creates a new section and adds the hyphens.
#
#   These sections are accessible in
#     - the drop-down list on the bottom left of the scripting area,
#       ALT+SHIFT+J / ⌘+SHIFT+J brings it up
#   and
#     - the outline section on the top-right corner of the scripting area
#       CTRL+SHIFT+O / ⌘+SHIFT+O brings it up

## 2.1 Subsection -----------------------------------
#   You can also have subsections
#   RStudio does not treat them differently from sections
#   but if you add a extra #, number or spaces they will look
#   different in the outline section.
#   This makes it easier to navigate your R file
#   I use less hyphens for subsections to help visually

### 2.1.1 Subsection -------------------
#   And sub-subsections,...

# 3. Folding sections -----------------------------------------------------
#   You can fold sections by clicking on the little grey down-arrow on the left
#   of the section heading. Or hitting ALT+L/⌘+ALT+L
#   This is useful to hide sections you are not working on
#   SHIFT+ALT+L / ⌘+SHIFT+⌥+L unfolds the section
#   ALT+O / ⌘+⌥+O folds all sections
#   SHIFT+ALT+O / ⌘+SHIFT+⌥+O unfolds all sections

# 4. Etiquette ------------------------------------------------------------
#   It is a good idea (valued in any business environment) to have a certain
#   etiquette when writing code (or anything else really).
#   For instance, I write a blank line before a section heading and not after
#   You can choose your own style, but be consistent, and have the least
#   amount of random variations in your style as possible.

