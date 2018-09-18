#' Calculate the growth rates of all species
#' @return the growth rates of all species
#' @inheritParams default_params_doc
#' @export
calc_growth_rates <- function(
  species_densities,
  resource_densities,
  max_growth_rates,
  mortality_rates,
  hsrs
) {
  n_species <- length(species_densities)
  n_resources <- length(resource_densities)
  testit::assert(n_species == length(max_growth_rates))
  testit::assert(n_species == length(mortality_rates))
  testit::assert(n_resources == ncol(hsrs))
  testit::assert(n_species == nrow(hsrs))


  growth_rates <- rep(NA, n_species)
  for (i in seq_along(species_densities)) {
    species_density <- species_densities[i]
    max_growth_rate <- max_growth_rates[i]
    hsr <- hsrs[i, ]
    species_growth_rate <- calc_specific_growth_rate(
      resource_densities = resource_densities,
      max_growth_rate = max_growth_rate,
      hsr = hsr
    )
    mortality_rate <- mortality_rates[i]
    growth_rates[i] <- species_density * (species_growth_rate - mortality_rate)
  }
  growth_rates
}