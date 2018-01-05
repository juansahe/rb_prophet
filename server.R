#
# Prophet 2.0 (semantic UI implementation and Rb data integratin)
# run over EC2 AWS server (t2.large)
# January 5 2018 -- jds --
# Server segment code
# 
#    http://theprophet.co
#
#

source('helpers.R')

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  router(input, output)
  output$logout_call <- renderUI({
    onclick("logout_action", js$navigate('https://theprophet.co/logout'))
  })
})
