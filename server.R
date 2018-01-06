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
  shinyjs::onclick("logout_action", js$navigate('http://theprophet.co/logout'))
  router(input, output)
  
  # headers
  output$headers <- renderUI({
    selectInput("header", "Header:", ls(env=session$request))
  })
  
  output$value <- renderText({
    if (nchar(input$header) < 1 || !exists(input$header, envir=session$request)){
      return("NULL");
    }
    return (get(input$header, envir=session$request));
  })
})
