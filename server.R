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
  
  user_data <- reactive({
    req(input$accTok)
    res = jwt_decode_sig(input$accTok, pubkey=jwk_key)
    req <- httr::GET(res$aud[[2]], httr::add_headers(Authorization = paste("Bearer", input$accTok)))
    json <- httr::content(req, as="text")
    user_data <- fromJSON(json)
    user_data
  })
  
  output$value <- renderText({
    res = user_data()
    return(paste(names(unlist(res)), ": ", unlist(res), collapse='\n'))
  })
})
