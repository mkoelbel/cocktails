# sort cocktails alphabetically, but put "(Select One)" at the front
sort_cocktails <- function(cocktails) {
  
  sorted_list <- sort(cocktails)
  
  sorted_list_final <- 
    if ("(Select One)" %in% sorted_list) {
      c("(Select One)", sorted_list) %>% unique()
    } else sorted_list
  
  sorted_list_final
}

sort_descriptions <- function(descriptions) {
  
  description_order <- c(
    "Hors d'oeuvres",
    "Dessert",
    "Refreshing",
    "Summer",
    "Winter",
    "Gin",
    "Rum",
    "Tequila",
    "Vodka",
    "Whiskey",
    "Amaretto",
    "Aperol",
    "Baileys",
    "Campari",
    "Elderflower Liqueur",
    "Kahlua",
    "Prosecco"
  )
  
  sorted_list <- descriptions[order(match(descriptions, description_order))]
  
  sorted_list_final <- 
    if ("(Select One)" %in% sorted_list) {
      c("(Select One)", sorted_list) %>% unique()
    } else sorted_list
  
  sorted_list_final
}

# add "(Select One)" to the front of a list
add_select_one <- function(list) {
  result <- c("(Select One)", list) %>% unique()
  result
}

format_for_select_box <- function(list,
                                  cocktail_or_description) {
  formatted_list <- list %>% 
    {
      if (cocktail_or_description == "cocktail") {
        sort_cocktails(.)
      } else if (cocktail_or_description == "description") {
        sort_descriptions(.)
      }
    } %>% 
    add_select_one()
  
  formatted_list
}
