context("create_uptake_matrix")

test_that("use", {

  n_species <- 6
  n_resources <- 3
  srcs <- create_srcs_1_c()
  species_densities <- create_init_spec_densities(n_species = n_species)
  resource_densities <- c(6, 10, 14)
  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  hsrs <- create_hsrs_1_c()
  mortality_rates <- get_mortality_rates(n_species = n_species)

  growth_rates <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  expected <- create_srcs(n_species = n_species, n_resources = n_resources)
  for (j in seq_along(resource_densities)) {
    expected[j, ] <- srcs[j, ] * growth_rates * species_densities
  }

  created <- create_uptake_matrix(
    srcs = srcs,
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    hsrs = hsrs,
    mortality_rates = mortality_rates
  )

  expect_equal(expected, created)

})
