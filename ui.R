ui <- fluidPage(
  
  theme = shinytheme("slate"),
  
  titlePanel("Cocktail Recipes"),
  
  useShinydashboard(),
  
  # Choose a Cocktail ----
  column(
    width = 2,
    selectInput(
      inputId = "cocktails",
      label = "Choose a Cocktail",
      choices = cocktails %>% format_for_select_box("cocktail"),
      multiple = FALSE
    )
  ),
  
  column(
    width = 1,
    h4("OR")
  ),
  
  # Choose a Description ----
  column(
    width = 2,
    selectInput(
      inputId = "cocktail_descriptions",
      label = "Choose a Description",
      choices = names(description_map) %>% format_for_select_box("description"),
      multiple = FALSE
    ),
    
    # Cocktail Options ----
    conditionalPanel(
      "input.cocktail_descriptions != '(Select One)'",
      uiOutput(outputId = "cocktail_options_ui")
    )
  ),
  
  # Recipe ----
  column(
    width = 12,
    htmlOutput("recipe") 
  )
)
