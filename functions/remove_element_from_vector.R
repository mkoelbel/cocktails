remove_element_from_vector <- function(vector, element_to_remove) {
  vector_without_element <- vector[vector != element_to_remove]
  vector_without_element
}

remove_blanks_from_vector <- function(vector) {
  remove_element_from_vector(vector, "")
}

remove_wildcard_from_tags <- function(tags, wildcard = WILDCARD) {
  remove_element_from_vector(tags, wildcard)
}