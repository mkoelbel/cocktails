scale_ingredients <- function(ingredients, num_servings) {
  
  # Loop through ingredients
  scaled_ingredients <- sapply(ingredients, function(ingredient) {
    # Get first ingredient component (that will be the ingredient amount, if there's an amount)
    ingredient_components <- unlist(str_split(ingredient, " ", n = 2))
    first_ingredient_component <- ingredient_components[1]
    remaining_ingredient_component <- ingredient_components[2]
    
    # Get the scaled ingredient amount
    scaled_first_ingredient_component <- if (!is.na(as.numeric(first_ingredient_component))) {
      as.numeric(first_ingredient_component) * as.numeric(num_servings)
    } else first_ingredient_component
    
    # Re-attach scaled ingredient amount to the rest of the ingredient string
    glue("{scaled_first_ingredient_component} {remaining_ingredient_component}")
  })
  
  scaled_ingredients
}