# Given a particular cocktail list and a tag, filter the cocktail list and return it

filter_cocktail_list <- function(cocktail_list, 
                                 tag,
                                 dictionary) {
  
  filtered_cocktail_list <- character()
  
  lapply(cocktail_list, function(cocktail) {
    if (tag %in% dictionary[[cocktail]]) {
      filtered_cocktail_list <<- append(filtered_cocktail_list, cocktail)
    }
  })
  
  filtered_cocktail_list
}
