#' Create the uptake matrix, the right-hand part of equation 2
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_uptake_matrix <- function(
  srcs,
  species_densities,
  resource_densities,
  max_growth_rates,
  hsrs,
  mortality_rates
) {
  n_species <- length(species_densities)
  n_resources <- length(resource_densities)

  growth_rates <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  uptake <- create_srcs(n_species = n_species, n_resources = n_resources)
  for (j in seq_along(resource_densities)) {
    uptake[j, ] <- srcs[j, ] * growth_rates * species_densities
  }
  uptake
}