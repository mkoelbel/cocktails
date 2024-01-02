# Given list with cocktail recipe data, return a dictionary (named list) with 
# tags for each cocktail

get_cocktail_dictionary <- function(recipe_data_list) {
  
  dictionary <- vector("list", length = length(recipe_data_list))
  
  lapply(seq(recipe_data_list), function(r) {
    recipe <<- recipe_data_list[[r]]
    dictionary[[r]] <<- recipe$tags
    names(dictionary)[r] <<- recipe$name
  })
  
  dictionary
}