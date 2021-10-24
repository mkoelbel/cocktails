server <- function(input, output) {
    
    values <- reactiveValues()
    values$filtered_cocktails <- NULL
    
    observeEvent(input$selected_words, {
        values$filtered_cocktails <- cocktail_map[[input$selected_words]]
    })
    
    output$options_output <- renderUI({
        req(input$selected_words)
        
        selectInput(
            inputId = "selected_cocktail",
            label = "Possibilities",
            choices = values$filtered_cocktails
        )
    })
    
    output$recipe <- renderUI({
        raw_text <- readLines("recipes.txt")
        split_text <- stringi::stri_split(str = raw_text, regex = "\\n")
        replaced_text <- lapply(split_text, p)
        return(replaced_text)
    })
    
}
