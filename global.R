rm(list = ls())

# Libraries ----
library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinydashboard)
library(rsconnect)
library(readr)
library(dplyr)
library(stringr)
library(glue)

# Functions ----
function_folders <- "functions"
function_files <- sapply(function_folders, function(folder) {
  paste(folder, list.files(folder), sep = "/")
}) %>% 
  unlist()
sapply(function_files, source)

# Variables ----
LIQUORS_LIST <- c("Whiskey", "Gin", "Tequila", "Rum", "Vodka", "Cognac")
TIME_LIST <- c("Brunch", "Before dinner", "After dinner")
MOOD_LIST <- c("Cozy", "Refreshing")
WILDCARD <- "(Any)"

RECIPES_TEXT_FILE <- "text_files/recipes.txt"
RECIPE_STARTER <- "COCKTAIL:\n"
# RECIPE_STRUCTURE <- c(
#   "name",
#   "ingredients",
#   "instructions",
#   "tags",
#   "scalable"
# )

recipes_list <- get_recipes_list()
cocktail_names <- get_cocktail_names(recipes_list)
cocktail_dictionary <- get_cocktail_dictionary(recipes_list)
