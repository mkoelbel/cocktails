library(shiny)
library(rsconnect)
library(shinydashboard)
library(dplyr)
library(stringi)
library(stringr)
library(rvest)

recipes_html <- read_html("recipes.html")

cocktail_map = list(
    "old_fashioned" = c("old_fashioned"),
    "manhattan" = c("manhattan"),
    "mojito" = c("mojito"),
    "margarita" = c("margarita"),
    "whiskey_sour" = c("whiskey_sour"),
    "bees_knees" = c("bees_knees"),
    "amaretto_sour" = c("amaretto_sour"),
    "pina_colada" = c("pina_colada"),
    "refreshing" = c("mojito", "bees_knees"),
    "summer" = c("mojito", "bees_knees", "margarita", "pina_colada"),
    "dessert" = c("amaretto_sour", "whiskey_and_amaretto"),
    "hors_doeuvres" = c("old_fashioned", "manhattan", "mojito", "margarita", "whiskey_sour", "bees_knees", "pina_colada"),
    "whiskey" = c("old_fashioned", "manhattan", "whiskey_sour", "amaretto_sour"),
    "gin" = c("bees_knees"),
    "amaretto" = c("amaretto_sour", "whiskey_and_amaretto")
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
