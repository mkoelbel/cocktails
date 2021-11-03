server <- function(input, output) {
    
    values <- reactiveValues()
    values$filtered_cocktails <- NULL
    
    observeEvent(input$selected_tags, {
        values$filtered_cocktails <- unname(pretty_names[cocktail_map[[make_clean_names(input$selected_tags)]]])
    })
    
    output$options_output <- renderUI({
        req(input$selected_tags)
        
        selectInput(
            inputId = "selected_cocktail",
            label = "Potential Cocktail(s)",
            choices = values$filtered_cocktails
        )
    })
    
    output$recipe <- renderUI({
        parsed <- recipes_html %>% html_nodes(paste0('#',make_clean_names(input$selected_cocktail)))
        write_html(parsed, "temp.html")
        includeHTML("temp.html")
    })
    
}

