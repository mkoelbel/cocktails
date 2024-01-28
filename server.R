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
  
  observeEvent(input$cocktail, {
    values$current_cocktail <- input$cocktail
    values$current_recipe <- get_recipe(values$current_cocktail)
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
  
  # Display cocktail recipe
  output$recipe_ui <- renderUI({
    fluidRow(
      h4("Ingredients"),
      HTML(values$current_recipe$ingredients %>% paste(collapse = "<br/>")),
      br(),
      h4("Instructions"),
      HTML(values$current_recipe$instructions %>% paste(collapse = "<br/>"))
    )
  })
  
  # Update recipe for selected number of servings
  
  observeEvent(input$debug, browser())
}

