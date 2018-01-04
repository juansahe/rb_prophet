#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shiny.semantic)

# Define UI for application that draws a histogram
shinyUI(semanticPage(
  
  # Application title
  title ="Prophet (rb-mjn)",
  suppressDependencies('bootstrap'),
  
  # Sidebar with a slider input for number of bins 
  div(class = 'ui button', uiicon('user'), "Icon button")
))
