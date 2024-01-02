server <- function(input, output) {
  
  # Variables ----
  values <- reactiveValues()
  values$cocktail_list_to_display <- cocktail_names # this isn't working, returns empty list
    
  # Filter cocktail list based on Liquor
  observeEvent(input$liquor, {
    values$cocktail_list_to_display <- filter_cocktail_list(
      cocktail_list = cocktail_names,
      tag = input$liquor,
      dictionary = cocktail_dictionary
    )

    updateSelectInput(
      inputId = "cocktail",
      choices = values$cocktail_list_to_display
    )
  })

  # Filter cocktail list based on Time
  
  # Filter cocktail list based on Mood
  
  # Conditionally display Number of Servings input
  
  # Display cocktail recipe
  
  # Update recipe for selected number of servings
  
  observeEvent(input$debug, browser())
}

