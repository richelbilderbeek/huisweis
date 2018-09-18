#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param dt delta timestep
#' @param initial_resource_densities the resource densities at time zero
#' @param initial_species_densities the species densities at time zero
#' @param t_max simulation will run in steps of \code{dt}
#'   until (not inclusive) this time point is reached
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
#' @param supply_rates the rate at which resources are pumped into the system
#' @param srcs a matrix of species' resource content
#'   of species (rows) of resources (columns). Can be created by
#'   \link{create_srcs}
#' @param turnover_rate the turnover rate of the whole system
#' @author Richel J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  dt,
  hsr,
  hsrs,
  initial_resource_densities,
  initial_species_densities,
  max_growth_rate,
  max_growth_rates,
  mortality_rates,
  n_species,
  n_resources,
  resource_densities,
  species_densities,
  srcs,
  supply_rates,
  t_max,
  turnover_rate
) {
  # Nothing
}


