# helpers.
# menu header 
library(shiny)
library(shiny.semantic)
library(shinyjs)
library(tidyverse)
library(shiny.router)
library(RCurl)
library(RJSONIO)
library(jose)
library(dotenv)
library(httr)
load_dot_env('.env')

jscode <- "
// Define a JavaScript function to navigate the page to where the file is served
shinyjs.navigate = function(url) {
  window.location.href = url;
}
"
auth0_tenant=Sys.getenv('AUTH0_TENANT')
jwk_auth0 =  fromJSON(getURL(paste0("https://",auth0_tenant,".auth0.com/.well-known/jwks.json")))$keys[[1]]
jwk_key <- read_jwk(jwk_auth0)

headerMenu <- (
  div(class = 'ui five item stackable container menu',
      div(class = 'item', 
          a(href="/", img(src='/images/rb_mjn_logo.png', style = 'width: 95px;'))
          ),
      a(class = 'item', href="/forecast", uiicon('hourglass end icon'), 'Forecast'),
      a(class = 'item', href="/history", uiicon('archive icon'), 'Historic data'),
      a(class = 'item', href="/doi", uiicon('cube icon'), 'Days of Inventory'),
      a(class = 'item', id='logout_action', href="#", uiicon('logout icon'), 'Logout')
  )
)

renderedPage <- function(title, content) {
  div(class = 'wrapper', style ='min-height: 100%',
      headerMenu,
      div(class = "twelve wide column",
          div(class = "ui segment",
              h1(title),
              p(content),
              pre(textOutput("value"))
          )
      )
  )
}

# db_connection

# call to pages
root_page <- renderedPage("Home", "LoremIpsum 11")
forecast_page <- renderedPage("Forecast", "Loremipsum 2")
history_page <- renderedPage("History", "Loremipsum 2")
doi_page <- renderedPage("Days of Inventory", "Loremipsum 2")

router <- make_router(
  route("/", root_page),
  route("/forecast", forecast_page),
  route("/history", history_page),
  route("/doi", doi_page)
)
