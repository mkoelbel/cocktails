get_cocktail_names <- function(recipes_data_list) {
  recipe_name_list <- sapply(recipes_data_list, function(recipe) {
    recipe[["name"]]
  })
  recipe_name_list
}