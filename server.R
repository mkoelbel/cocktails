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
  
  # Conditionally display Number of Servings input
  
  # Display cocktail recipe
  
  # Update recipe for selected number of servings
  
  observeEvent(input$debug, browser())
}

