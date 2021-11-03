ui <- dashboardPage(
    
    dashboardHeader(title = "Cocktail Recipes"),
    
    dashboardSidebar(
        selectInput(
            inputId = "selected_tags",
            label = "Choose One",
            choices = unname(pretty_names[names(cocktail_map)]),
            multiple = FALSE
        )
    ),
    
    dashboardBody(
        uiOutput(outputId = "options_output"),
        box(
            htmlOutput("recipe")
        )
    )
    
)
