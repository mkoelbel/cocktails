# Return a list with data on all cocktail recipes (name, ingredients, instructions, tags, etc)

get_recipes_list <- function(recipes_text_file = RECIPES_TEXT_FILE, 
                             recipe_starter = RECIPE_STARTER) {
  
  recipes_text <- read_file(recipes_text_file)
  recipes_text_list <- remove_blanks_from_vector(unlist(strsplit(recipes_text, recipe_starter)))
  recipes_data_list <- vector("list", length = length(recipes_text_list))
  
  lapply(seq(recipes_text_list), function(r) {
    recipe <<- recipes_text_list[r]
    recipes_data_list[[r]]$name <<- extract_recipe_name(recipe)
    recipes_data_list[[r]]$ingredients <<- extract_recipe_ingredients(recipe)
    recipes_data_list[[r]]$instructions <<- extract_recipe_instructions(recipe)
    recipes_data_list[[r]]$tags <<- extract_recipe_tags(recipe) #%>% replace("", NA)
    recipes_data_list[[r]]$scalable <<- extract_recipe_scalability(recipe)
  })
  
  recipes_data_list
}
