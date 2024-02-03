ui <- fluidPage(
  
  theme = shinytheme("slate"),
  
  titlePanel("Cocktail Recipes"),
  
  useShinydashboard(),
  
  column(
    width = 6,
    
    selectInput(
      inputId = "liquor",
      label = "Liquor",
      choices = c(WILDCARD, LIQUORS_LIST),
      multiple = FALSE
    ),
    
    radioButtons(
      inputId = "time",
      label = "Time",
      choices = c(WILDCARD, TIME_LIST)
    ),
    
    radioButtons(
      inputId = "mood",
      label = "Mood",
      choices = c(WILDCARD, MOOD_LIST)
    )
    
    ,actionBttn("debug", "Browser")
  ),
  
  column(
    width = 6,
    
    selectInput(
      inputId = "cocktail",
      label = "Cocktail",
      choices = sort(cocktail_names),
      multiple = FALSE
    ),
    
    uiOutput("number_of_servings_ui")
  ),
  
  column(
    width = 12,
    uiOutput("recipe_ui")
  )
)
