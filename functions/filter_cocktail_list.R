# Given a set of tags, filter the cocktail list on those tags and return it

filter_cocktail_list <- function(tags,
                                 cocktail_list = sort(cocktail_names), 
                                 dictionary = cocktail_dictionary) {
  
    filtered_cocktail_list <- character()
    tags_to_use <- remove_wildcard_from_tags(tags)
    
    lapply(cocktail_list, function(cocktail) {
      if (all(tags_to_use %in% dictionary[[cocktail]])) {
        filtered_cocktail_list <<- append(filtered_cocktail_list, cocktail)
      }
    }) 
  
  filtered_cocktail_list
}
