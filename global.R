rm(list = ls())

# Libraries ----
library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinydashboard)
library(rsconnect)
library(dplyr)
library(rvest)
library(xml2)
library(janitor)

# Variables ----
recipes_html <- read_html("recipes.html")

# __Defaults ----
default_cocktail_pretty <- "(Select One)"
default_cocktail <- make_clean_names(default_cocktail_pretty)

# __Cocktails ----
cocktails <- c(
  default_cocktail,
  "old_fashioned",
  "manhattan",
  "boulevardier",
  "whiskey_sour",
  "amaretto_sour",
  "bees_knees",
  "gin_and_tonic",
  "negroni",
  "mojito",
  "margarita",
  "godfather",
  "pina_colada",
  "baileys_white_russian",
  "jameson_old_fashioned"
)

# __Map ----
cocktail_map <- list(
  "select_one" = c(default_cocktail),
  "hors_doeuvres" = c(default_cocktail, "old_fashioned", "manhattan", "boulevardier", "jameson_old_fashioned", "whiskey_sour", "amaretto_sour", "bees_knees", "gin_and_tonic", "negroni", "mojito", "margarita"),
  "dessert" = c(default_cocktail, "amaretto_sour", "godfather", "pina_colada", "baileys_white_russian"),
  "refreshing" = c(default_cocktail, "bees_knees", "gin_and_tonic", "mojito", "negroni"),
  "summer" = c(default_cocktail, "bees_knees", "gin_and_tonic", "mojito", "margarita", "negroni", "pina_colada"),
  "winter" = c(default_cocktail, "old_fashioned", "manhattan", "boulevardier", "jameson_old_fashioned", "godfather", "baileys_white_russian"),
  "whiskey" = c(default_cocktail, "old_fashioned", "manhattan", "boulevardier", "jameson_old_fashioned", "whiskey_sour", "amaretto_sour", "godfather"),
  "gin" = c(default_cocktail, "bees_knees", "gin_and_tonic", "negroni"),
  "rum" = c(default_cocktail, "mojito", "pina_colada"),
  "tequila" = c(default_cocktail, "margarita"),
  "vodka" = c(default_cocktail, "baileys_white_russian"),
  "amaretto" = c(default_cocktail, "amaretto_sour", "godfather"),
  "campari" = c(default_cocktail, "boulevardier", "negroni")
)

# __Pretty Names ----
pretty_names <- c(
  "select_one" = default_cocktail_pretty,
  "old_fashioned" = "Old Fashioned",
  "manhattan" = "Manhattan",
  "boulevardier" = "Boulevardier",
  "jameson_old_fashioned" = "Jameson Old Fashioned",
  "whiskey_sour" = "Whiskey Sour",
  "amaretto_sour" = "Amaretto Sour",
  "bees_knees" = "Bee's Knees",
  "gin_and_tonic" = "Gin and Tonic",
  "negroni" = "Negroni",
  "mojito" = "Mojito",
  "margarita" = 'Margarita',
  "godfather" = "Godfather",
  "pina_colada" = "Pina Colada",
  "baileys_white_russian" = "Baileys White Russian",
  "hors_doeuvres" = "Hors d'oeuvres",
  "dessert" = "Dessert",
  "refreshing" = "Refreshing",
  "summer" = "Summer",
  "winter" = "Winter",
  "whiskey" = "Whiskey",
  "gin" = "Gin",
  "rum" = "Rum",
  "tequila" = "Tequila",
  "vodka" = "Vodka",
  "amaretto" = "Amaretto",
  "campari" = "Campari"
)
