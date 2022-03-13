server <- function(input, output) {
  
  # Variables ----
  values <- reactiveValues()
  values$filtered_cocktails <- NULL
  values$selected_cocktails <- NULL
  
  # Choose Description ----
  # get list of potential cocktails based on the selected description
  observeEvent(input$cocktail_descriptions, {
    values$filtered_cocktails <- unname(pretty_names[cocktail_map[[make_clean_names(input$cocktail_descriptions)]]])
    values$selected_cocktail <- default_cocktail_pretty
  })
  
  # show list of potential cocktails
  output$cocktail_options_ui <- renderUI({
    req(input$cocktail_descriptions)
    
    selectInput(
      inputId = "cocktail_options",
      label = "Potential Cocktail(s)",
      choices = values$filtered_cocktails
    )
  })
  
  # Choose Cocktail ----
  # update selected cocktail
  observeEvent(input$cocktails, {
    values$selected_cocktail <- input$cocktails
  })
  
  observeEvent(input$cocktail_options, {
    values$selected_cocktail <- input$cocktail_options
  })
  
  # Recipe ----
  # pull selected recipe from HTML
  output$recipe <- renderUI({
    parsed <- recipes_html %>% html_nodes(paste0('#',make_clean_names(values$selected_cocktail)))
    write_html(parsed, "temp.html")
    includeHTML("temp.html")
  })
  
}

