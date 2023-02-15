# create the necessary data structure for the app: a list of descriptions, where 
# each description has a list of cocktails

# variables ----
# list of cocktails with the appropriate descriptions. 
# (this has the opposite structure that we ultimately want, but it's more intuitive
# to add cocktails to this structure)
cocktail_map <- list(
  "Old Fashioned" = c("Hors d'oeuvres",
                      "Winter",
                      "Whiskey"),
  "Manhattan" = c("Hors d'oeuvres",
                  "Winter",
                  "Whiskey"),
  "Boulevardier" = c("Hors d'oeuvres",
                     "Winter",
                     "Whiskey",
                     "Campari"),
  "Jameson Old Fashioned" = c("Hors d'oeuvres",
                              "Winter",
                              "Whiskey"),
  "Whiskey Sour" = c("Hors d'oeuvres",
                     "Whiskey"),
  "Amaretto Sour" = c("Hors d'oeuvres",
                      "Dessert",
                      "Whiskey",
                      "Amaretto"),
  "Bees Knees" = c("Hors d'oeuvres",
                   "Refreshing",
                   "Summer",
                   "Gin"),
  "Gin and Tonic" = c("Hors d'oeuvres",
                      "Refreshing",
                      "Summer",
                      "Gin"),
  "Aviation" = c("Hors d'oeuvres",
                 "Refreshing",
                 "Summer",
                 "Gin"),
  "Negroni" = c("Hors d'oeuvres",
                "Refreshing",
                "Summer",
                "Gin",
                "Campari"),
  "Mojito" = c("Hors d'oeuvres",
               "Refreshing",
               "Summer",
               "Rum"),
  "Margarita" = c("Hors d'oeuvres",
                  "Summer",
                  "Tequila"),
  "Aperol Spritz" = c("Hors d'oeuvres",
                      "Refreshing",
                      "Summer",
                      "Aperol",
                      "Prosecco"),
  "Hugo Spritz" = c("Hors d'oeuvres",
                    "Refreshing",
                    "Summer",
                    "Elderflower Liqueur",
                    "Prosecco"),
  "French 75" = c("Hors d'oeuvres",
                  "Refreshing",
                  "Summer",
                  "Gin",
                  "Prosecco"),
  "Godfather" = c("Dessert",
                  "Winter",
                  "Whiskey",
                  "Amaretto"),
  "Pina Colada" = c("Dessert",
                    "Summer",
                    "Rum"),
  "Baileys White Russian" = c("Dessert",
                              "Winter",
                              "Vodka",
                              "Baileys",
                              "Kahlua"),
  "Espresso Martini" = c("Dessert",
                         "Winter",
                         "Vodka",
                         "Kahlua"),
  "Gin Fizz" = c("Hors d'oeuvres",
                 "Refreshing",
                 "Summer",
                 "Gin")
)

# functions ----
source("functions.R")

# steps ----

# 1. determine how long this inverted list will be (how many descriptors), 
# since R prefers to know this in advance
descriptors <- list()
lapply(seq_along(cocktail_map), function(c) {
  descriptors <<- c(descriptors, cocktail_map[[c]]) %>% unlist() %>% unique()
})

# 2. create inverted list, set names as the descriptors
description_map <- vector(mode = "list", length = length(descriptors))
names(description_map) <- descriptors

# 3. populate the inverted list. for each descriptor, add the applicable cocktails
lapply(seq_along(description_map), function(d) {
  lapply(seq_along(cocktail_map), function(c) {
    descriptor <- names(description_map[d])
    cocktail <- names(cocktail_map[c])
    if (descriptor %in% cocktail_map[[c]]) {
      description_map[[d]] <<- c(description_map[[d]], cocktail) %>% unique()
    }
  })
})

# 4. save description map for use in cocktail app
save(cocktail_map, file = "setup/cocktail_map.rda")
save(description_map, file = "setup/description_map.rda")
