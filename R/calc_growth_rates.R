#' Calculate the growth rates of all species
#' @return a numeric vector with the growth rates of all species
#' @inheritParams default_params_doc
#' @export
calc_growth_rates <- function(
  species_densities,
  resource_densities,
  max_growth_rates,
  mortality_rates,
  hsrs
) {
  testit::assert(!is.list(species_densities))
  n_species <- length(species_densities)
  n_resources <- length(resource_densities)
  testit::assert(n_species == length(max_growth_rates))
  testit::assert(n_species == length(mortality_rates))
  testit::assert(n_resources == nrow(hsrs))
  testit::assert(n_species == ncol(hsrs))
  if (!all(rownames(hsrs) == paste0("R", seq(1, n_resources)))) {
    stop("Use 'create_hsrs' to create a tidy HSRs matrix")
  }
  if (!all(colnames(hsrs) ==  paste0("N", seq(1, n_species)))) {
    stop("Use 'create_hsrs' to create a tidy HSRs matrix")
  }

  testit::assert(all(rownames(hsrs) == paste0("R", seq(1, n_resources))))
  testit::assert(all(colnames(hsrs) ==  paste0("N", seq(1, n_species))))


  growth_rates <- rep(NA, n_species)
  testit::assert(!is.list(growth_rates))
  for (i in seq_along(species_densities)) {
    species_density <- species_densities[i]
    max_growth_rate <- max_growth_rates[i]
    hsr <- hsrs[, i]
    species_growth_rate <- calc_specific_growth_rate(
      resource_densities = resource_densities,
      max_growth_rate = max_growth_rate,
      hsr = hsr
    )
    testit::assert(!is.list(species_growth_rate))
    mortality_rate <- mortality_rates[i]
    testit::assert(length(species_density) == 1)
    testit::assert(length(species_growth_rate) == 1)
    testit::assert(length(mortality_rate) == 1)
    testit::assert(!is.list(species_density))
    testit::assert(!is.list(species_growth_rate))
    testit::assert(!is.list(mortality_rate))
    growth_rates[i] <- species_density * (species_growth_rate - mortality_rate)
    testit::assert(!is.list(growth_rates))
  }
  testit::assert(!is.list(growth_rates))
  growth_rates
}