server <- function(input, output) {
  
  # Variables ----
  values <- reactiveValues()
  values$filtered_cocktails <- NULL
  values$selected_cocktail <- NULL
  
  # Choose Cocktail ----
  observeEvent(input$cocktails, {
    values$selected_cocktail <- input$cocktails
  })
  
  # Choose Description ----
  # get list of potential cocktails based on the selected description
  observeEvent(input$cocktail_descriptions, {
    values$filtered_cocktails <- description_map[[input$cocktail_descriptions]]
  })
  
  # show list of potential cocktails
  output$cocktail_options_ui <- renderUI({
    req(values$filtered_cocktails)
    
    selectInput(
      inputId = "cocktail_options",
      label = "Potential Cocktail(s)",
      choices = values$filtered_cocktails %>% format_for_select_box("cocktail")
    )
  })
  
  observeEvent(input$cocktail_options, {
    values$selected_cocktail <- input$cocktail_options
  })
  
  # Recipe ----
  # pull selected recipe from HTML
  output$recipe <- renderUI({
    parsed <- recipes_html %>% html_nodes(paste0('#',make_clean_names(values$selected_cocktail)))
    write_html(parsed, "recipes_html/temp.html")
    includeHTML("recipes_html/temp.html")
  })
}

