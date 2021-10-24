ui <- dashboardPage(
    
    dashboardHeader(title = "Cocktail Recipes"),
    
    dashboardSidebar(
        selectInput(
            inputId = "selected_words",
            label = "Choose",
            choices = cocktail_tags,
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
