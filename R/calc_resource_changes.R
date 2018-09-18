#' Calculate the change in resource, equation 2
#' @author Richel J.C. Bilderbeek
#' @export
calc_resource_changes <- function(
    max_growth_rates,
    resource_densities,
    hsrs,
    srcs,
    species_densities,
    supply_rates,
    turnover_rate,
    mortality_rates
  ) {
  n_species <- length(species_densities)
  n_resources <- length(resource_densities)
  testit::assert(ncol(hsrs) == n_species)
  testit::assert(nrow(hsrs) == n_resources)
  testit::assert(ncol(srcs) == n_species)
  testit::assert(nrow(srcs) == n_resources)
  testit::assert(length(max_growth_rates) == n_species)
  testit::assert(length(supply_rates) == n_resources)
  testit::assert(length(turnover_rate) == 1)
  testit::assert(length(mortality_rates) == n_species)

  uptakes <- create_uptake_matrix(
    srcs = srcs,
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    hsrs = hsrs,
    mortality_rates = mortality_rates
  )

  resource_changes <- rep(NA, n_resources)

  for (j in seq_along(resource_densities)) {

    resource_density <- resource_densities[j]
    supply_rate <- supply_rates[j]
    flux <- turnover_rate * (supply_rate - resource_density)
    uptake <- sum(uptakes[j, ])
    resource_change <- flux - uptake
    resource_changes[j] <- resource_change
  }

  resource_changes
}