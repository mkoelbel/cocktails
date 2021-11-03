ui <- fluidPage(
    
    theme = shinytheme("slate"),
    
    titlePanel("Cocktail Recipes"),
    
    useShinydashboard(),
    
    selectInput(
        inputId = "selected_tags",
        label = "Choose One",
        choices = unname(pretty_names[names(cocktail_map)]),
        multiple = FALSE
    ),
    
    uiOutput(outputId = "options_output"),
    
    htmlOutput("recipe")
    
)
