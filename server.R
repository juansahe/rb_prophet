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
  auth0_tenant=Sys.getenv('AUTH0_TENANT')
  jwk_auth0 =  fromJSON(getURL(paste0("https://",auth0_tenant,".auth0.com/.well-known/jwks.json")))$keys[[1]]
  jwk_key <- read_jwk(jwk_auth0)
  
  user <- reactive({
    req(input$accTok)
    res = jwt_decode_sig(input$accTok, pubkey=jwk_key)
    res
  })
  
  output$value <- renderText({
    res = user()
    return(res$scope))
  })
})
