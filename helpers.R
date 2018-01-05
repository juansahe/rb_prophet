# helpers.
# menu header 
library(shiny)
library(shiny.semantic)
library(shinyjs)
library(tidyverse)
library(shiny.router)

jscode <- "
// Define a JavaScript function to navigate the page to where the file is served
shinyjs.navigate = function(url) {
window.location.href = url;
}
"

headerMenu <- (
  div(class = 'ui five item stackable container menu',
      div(class = 'item', 
          a(href="/index", img(src='../img/rb_mjn_logo.png', style = 'width: 95px;'))
          ),
      a(class = 'item', href="/forecast", uiicon('hourglass end icon'), 'Forecast'),
      a(class = 'item', href="/history", uiicon('archive icon'), 'Historic data'),
      a(class = 'item', href="/doi", uiicon('cube icon'), 'Days of Inventory'),
      a(class = 'item', href="https://theprophet.co/logout", uiicon('logout icon'), 'Logout')
  )
)

renderedPage <- function(title, content) {
  div(class = 'wrapper', style ='min-height: 100%',
      headerMenu,
      div(class = "twelve wide column",
          div(class = "ui segment",
              h1(title),
              p(content)
          )
      )
  )
}

root_page <- renderedPage("Home", "LoremIpsum 11")
other_page <- renderedPage("Other", "Loremipsum 2")

router <- make_router(
  route("/index", root_page),
  route("/forecast", other_page)
)
