context("calc_resource_changes")

test_that("use", {

  n_species <- 1
  n_resources <- 1
  max_growth_rates <- 12.34
  resource_densities <- 23.45
  hsrs <- create_hsrs(n_species = n_species, n_resources = n_resources)
  hsrs[1, 1] <- 34.56

  growth_rate <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rates[1],
    hsr = hsrs[, ]
  )

  srcs <- create_srcs(n_species = 1, n_resources = 1)
  srcs[1, 1] <- 1.2
  species_densities <- create_init_spec_densities(n_species = n_species)

  resource_uptake <- srcs[ ,1] * growth_rate * species_densities
})
