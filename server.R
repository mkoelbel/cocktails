server <- function(input, output) {
  
  # Variables ----
  values <- reactiveValues()
  
  # Filter cocktail list
  filters_selected <- reactive(list(input$liquor, input$time, input$mood))
  
  observeEvent(filters_selected(), {
    updateSelectInput(
      inputId = "cocktail",
      choices = filter_cocktail_list(c(input$liquor, input$time, input$mood))
    )
  })
  
  # Get name and recipe for selected cocktail
  observeEvent(input$cocktail, {
    values$current_cocktail <- input$cocktail
    values$current_recipe <- get_recipe(values$current_cocktail)
    # Make separate variable for ingredients so that we can optionally scale them
    values$ingredients_to_display <- values$current_recipe$ingredients
  })
  
  # Conditionally display Number of Servings input
  output$number_of_servings_ui <- renderUI({
    if (as.logical(values$current_recipe$scalable)) {
      selectInput(
        inputId = "number_of_servings",
        label = "Servings",
        choices = 1:6,
        multiple = FALSE
      )
    }
  })
  
  # Scale ingredients for selected number of servings
  observeEvent(input$number_of_servings, {
    values$ingredients_to_display <- scale_ingredients(values$current_recipe$ingredients, input$number_of_servings)
  })
  
  # Display cocktail recipe
  output$recipe_ui <- renderUI({
    fluidRow(
      h3(values$current_cocktail),
      br(),
      h4("Ingredients"),
      HTML(values$ingredients_to_display %>% paste(collapse = "<br/>")),
      br(),br(),
      h4("Instructions"),
      HTML(values$current_recipe$instructions %>% paste(collapse = "<br/>"))
    )
  })
  
  observeEvent(input$debug, browser())
}
