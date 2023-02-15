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

# Functions ----
source("functions.R")

# Variables ----
recipes_html <- read_html("recipes_html/recipes.html")

load(file = "setup/cocktail_map.rda")
load(file = "setup/description_map.rda")

cocktails <- names(cocktail_map) %>% sort_cocktails()
