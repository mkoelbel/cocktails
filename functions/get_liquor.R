get_liquor <- function(ingredients, liquors_list = LIQUORS_LIST) {
  liquors_found_in_ingredients <- character()
  
  sapply(liquors_list, function(liquor) {
    if (any(grepl(liquor, ingredients, ignore.case = TRUE))) {
      liquors_found_in_ingredients <<- append(liquors_found_in_ingredients, liquor)
    }
  })
  
  liquors_found_in_ingredients
}