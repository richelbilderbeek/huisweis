#' Create the initial species densities for the species present at time zero
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_init_spec_densities <- function(n_species) {
  0.1 + seq(from = 0.01, by = 0.01, length.out = n_species)
}