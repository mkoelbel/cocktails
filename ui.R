ui <- dashboardPage(
    
    dashboardHeader(title = "Cocktail Recipes"),
    
    dashboardSidebar(
        selectInput(
            inputId = "selected_tags",
            label = "Choose",
            choices = names(cocktail_map),
            multiple = FALSE
        )
    ),
    
    dashboardBody(
        uiOutput(outputId = "options_output"),
        box(
            uiOutput(outputId = "recipe")
        )
    )
    
)
