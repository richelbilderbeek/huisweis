calc_resource_changes <- function(
    max_growth_rates,
    resource_densities,
    hsrs,
    srcs,
    species_densities,
    supply_rates,
    turnover_rate
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

  resource_changes <- rep(NA, n_resources)
  for (j in seq_along(resource_densities)) {

    resource_density <- resource_densities[j]
    supply_rate <- supply_rates[j]
    flux <- turnover_rate * (supply_rate - resource_density)

    uptake <- 0

    for (i in seq_along(species_densities)) {
      species_density <- species_densities[i]

      HIERO
      resource_change <-

      resource_changes[j] <- resource_change
    }
  }


  srcs <- create_srcs(n_species = 1, n_resources = 1)
  srcs[1, 1] <- 0.04
  species_densities <- create_init_spec_densities(n_species = n_species)
  supply_rates <- 6
  turnover_rate <- get_turnover_rate()

  resource_uptake <- srcs[ ,1] * growth_rate * species_densities

  resource_flux <- turnover_rate * (supply_rates[1] - resource_densities[1])

  resource_flux - resource_uptake
}