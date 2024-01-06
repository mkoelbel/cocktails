# Given list with cocktail recipe data, return a dictionary (named list) with 
# tags, including liquor, for each cocktail

get_cocktail_dictionary <- function(recipes_list) {
  
  dictionary <- vector("list", length = length(recipes_list))
  
  lapply(seq(recipes_list), function(r) {
    recipe <- recipes_list[[r]]
    liquor <- get_liquor(recipe$ingredients)
    
    dictionary[[r]] <<- c(recipe$tags, liquor)
    names(dictionary)[r] <<- recipe$name
  })
  
  dictionary
}