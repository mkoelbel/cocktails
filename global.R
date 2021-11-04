rm(list = ls())

library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinydashboard)
library(rsconnect)
library(dplyr)
library(rvest)
library(xml2)
library(janitor)

recipes_html <- read_html("recipes.html")

cocktail_map = list(
    "old_fashioned" = c("old_fashioned"),
    "manhattan" = c("manhattan"),
    "mojito" = c("mojito"),
    "margarita" = c("margarita"),
    "whiskey_sour" = c("whiskey_sour"),
    "bees_knees" = c("bees_knees"),
    "amaretto_sour" = c("amaretto_sour"),
    "whiskey_and_amaretto" = c("whiskey_and_amaretto"),
    "pina_colada" = c("pina_colada"),
    "refreshing" = c("mojito", "bees_knees"),
    "summer" = c("mojito", "bees_knees", "margarita", "pina_colada"),
    "dessert" = c("amaretto_sour", "whiskey_and_amaretto"),
    "hors_doeuvres" = c("old_fashioned", "manhattan", "mojito", "margarita", "whiskey_sour", "bees_knees", "pina_colada"),
    "whiskey" = c("old_fashioned", "manhattan", "whiskey_sour", "amaretto_sour", "whiskey_and_amaretto"),
    "gin" = c("bees_knees"),
    "rum" = c("mojito", "pina_colada"),
    "tequila" = c("margarita"),
    "amaretto" = c("amaretto_sour", "whiskey_and_amaretto")
)

pretty_names = c(
    "old_fashioned" = "Old Fashioned",
    "manhattan" = "Manhattan",
    "mojito" = "Mojito",
    "margarita" = 'Margarita',
    "whiskey_sour" = "Whiskey Sour",
    "bees_knees" = "Bee's Knees",
    "amaretto_sour" = "Amaretto Sour",
    "whiskey_and_amaretto" = "Whiskey and Amaretto",
    "pina_colada" = "Pina Colada",
    "refreshing" = "Refreshing",
    "summer" = "Summer",
    "dessert" = "Dessert",
    "hors_doeuvres" = "Hors d'oeuvres",
    "whiskey" = "Whiskey",
    "gin" = "Gin",
    "rum" = "Rum",
    "tequila" = "Tequila",
    "amaretto" = "Amaretto"
)
