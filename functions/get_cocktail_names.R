get_cocktail_names <- function(recipes_list) {
  recipe_name_list <- sapply(recipes_list, function(recipe) {
    recipe[["name"]]
  })
  recipe_name_list
}