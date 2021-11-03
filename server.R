server <- function(input, output) {
    
    values <- reactiveValues()
    values$filtered_cocktails <- NULL
    
    observeEvent(input$selected_tags, {
        values$filtered_cocktails <- cocktail_map[[input$selected_tags]]
    })
    
    output$options_output <- renderUI({
        req(input$selected_tags)
        
        selectInput(
            inputId = "selected_cocktail",
            label = "Possibilities",
            choices = values$filtered_cocktails
        )
    })
    
    output$recipe <- renderUI({
        raw_text <- recipes_html %>% html_nodes(paste0('#',input$selected_cocktail)) %>% html_text()
        split_text <- raw_text %>% stringi::stri_split(regex = "\r\n") %>% unlist %>% str_trim
        replaced_text <- lapply(split_text, p)
        return(replaced_text)
    })
    
}
