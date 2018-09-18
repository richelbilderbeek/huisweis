#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param hsr half-saturation constants for
#'   a focal species for each of the resources
#' @param hsrs a matrix of half-saturation constants
#'   of species (rows) on resources (columns). Can be created by
#'   \link{create_hsrs}
#' @param max_growth_rate max growth rate of the focal species
#' @param max_growth_rates max growth rate of all species
#' @param mortality_rates mortality rates of all species
#' @param n_species number of species
#' @param n_resources number of resources
#' @param resource_densities resource densities
#' @param species_densities density of all species
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  hsr,
  hsrs,
  max_growth_rate,
  max_growth_rates,
  mortality_rates,
  n_species,
  n_resources,
  resource_densities,
  species_densities
) {
  # Nothing
}
