get_recipe <- function(cocktail_name, recipes_list_ = recipes_list) {
  
  # Technically we should be able to simply use cocktail_names global variable here, 
  # but we're re-deriving this list because order matters here, and it's possible 
  # (though unlikely) that the order of recipes_list has changed
  cocktail_index <- match(cocktail_name, get_cocktail_names(recipes_list_))
  recipe <- recipes_list_[[cocktail_index]]
}