library(shiny)
library(rsconnect)
library(shinydashboard)
library(dplyr)
library(stringi)

cocktail_tags = c(
    "old_fashioned",
    "manhattan",
    "mojito",
    "margarita",
    "whiskey_sour",
    "bees_knees",
    "refreshing",
    "dessert",
    "hors_doeuvres",
    "whiskey",
    "gin"
)

# cocktail_list = c(
#     "old_fashioned",
#     "manhattan",
#     "mojito",
#     "margarita",
#     "whiskey_sour",
#     "bees_knees",
#     "whiskey_and_amaretto",
#     "amaretto_sour",
#     "pina_colada"
# )

cocktail_map = list(
    "old_fashioned" = c("old_fashioned"),
    "manhattan" = c("manhattan"),
    "mojito" = c("mojito"),
    "margarita" = c("margarita"),
    "whiskey_sour" = c("whiskey_sour"),
    "bees_knees" = c("bees_knees"),
    "refreshing" = c("mojito", "bees_knees"),
    "dessert" = c("whiskey_and_amaretto"),
    "hors_doeuvres" = c("old_fashioned", "manhattan", "mojito", "margarita", "whiskey_sour", "bees_knees"),
    "whiskey" = c("old_fashioned", "manhattan", "bees_knees"),
    "gin" = c("bees_knees")
)
