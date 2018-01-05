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
library(shinyjs)
library(tidyverse)

# Define UI for application that draws a histogram
shinyUI(semanticPage(
  
  # Application title
  title ="Prophet (rb-mjn)",
  shinyjs::useShinyjs(),
  suppressDependencies('bootstrap'),
  div(class = 'wrapper', style ='min-height: 100%',
      div(class = 'ui four item stackable container menu',
          #div(class = 'item', img(src='../img/rb_logo_220.png', style = 'height: 30px;')),
          a(class = 'item', id="forecast_actions", uiicon('hourglass end icon'), 'Forecast'),
          a(class = 'item', id="history_actions", uiicon('archive icon'), 'Historic data'),
          a(class = 'item', id="doi_actions", uiicon('cube icon'), 'Days of Inventory'),
          a(class = 'item', id="logout_action", 'Logout')
          )
      )
))
