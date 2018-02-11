library(shiny)
library(shinythemes)
library(shinydashboard)
library(lubridate)
library(ggplot2)
library(dygraphs)
library(xts)
library(data.table)
library(DT)
library(quanteda)
library(LDAvis)
library(stringr)
library(stringi)
library(gdata)
library(plyr)
library(dplyr)
library(topicmodels)
library(tm)
library(wordcloud)
library(memoise)
library(RColorBrewer)
library(metricsgraphics)
library(htmlwidgets)
library(bit64)
library(shinyBS)
library(tidytext)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel(.libPaths()),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot", height=250)
  )
))
