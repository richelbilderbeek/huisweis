#' Create the matrix of half-saturation constants
#'   of species (rows) on resources (columns)
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs <- function(
  n_species,
  n_resources
) {
  m <- matrix(ncol = n_resources, nrow = n_species, data = 0.0)
  colnames(m) <- paste0("R", seq(1, n_resources))
  rownames(m) <- paste0("N", seq(1, n_species))
  m
}
