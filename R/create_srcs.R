#' Create the matrix of species' (rows) resource (columns) content
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_srcs <- function(
  n_species,
  n_resources
) {
  create_hsrs(n_species = n_species, n_resources = n_resources)
}
