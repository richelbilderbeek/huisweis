#' Get the mortality rates for any number of species
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
get_mortality_rates <- function(n_species) {
  rep(0.25, n_species)
}