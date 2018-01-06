#
# Prophet 2.0 (semantic UI implementation and Rb data integratin)
# run over EC2 AWS server (t2.large)
# January 5 2018 -- jds --
# UI segment code
# 
#    http://theprophet.co
#
#

source('helpers.R')

shinyUI(semanticPage(
  
  # Application title
  title ="Prophet 2.0",
  shinyjs::useShinyjs(),
  suppressDependencies('bootstrap'),
  extendShinyjs(text = jscode, functions = c("navigate", "localStorageInfo")),
  HTML(' <input type="text" id="accTok" name="accTok" style="display: none;"> '),
  singleton(js$localStorageInfo),
  router_ui()
))



