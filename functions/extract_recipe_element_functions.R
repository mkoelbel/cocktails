extract_recipe_name <- function(recipe_text) {
  recipe_name <- strsplit(recipe, "\n")[[1]][1]
  recipe_name
}

extract_intermediate_recipe_section <- function(recipe_text, 
                                                start_string,
                                                end_string) {
  recipe_section <- recipe_text %>%
    strsplit(start_string) %>% 
    unlist() %>% 
    tail(1) %>% 
    strsplit(end_string) %>% 
    unlist() %>% 
    head(1) %>% 
    strsplit("\n") %>% 
    unlist() %>% 
    remove_blanks_from_vector()
  recipe_section
}

extract_recipe_ingredients <- function(recipe_text) {
  recipe_ingredients <- recipe %>% extract_intermediate_recipe_section("ingredients:\n", "instructions:\n")
  recipe_ingredients
}

extract_recipe_instructions <- function(recipe_text) {
  recipe_instructions <- recipe %>% extract_intermediate_recipe_section("instructions:\n", "tags:\n")
  recipe_instructions
}

extract_recipe_tags <- function(recipe_text) {
  recipe_tags <- recipe %>% extract_intermediate_recipe_section("tags:\n", "scalable:\n")
  recipe_tags
}

extract_recipe_scalability <- function(recipe_text) {
  recipe_scalability <- strsplit(recipe, "scalable:\n") %>% 
    unlist() %>% 
    tail(1) %>% 
    strsplit("\n") %>% 
    unlist() %>% 
    remove_blanks_from_vector()
  recipe_scalability
}
