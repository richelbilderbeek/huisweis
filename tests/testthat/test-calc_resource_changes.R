context("calc_resource_changes")

test_that("use", {

  n_species <- 1
  n_resources <- 1
  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  species_densities <- create_init_spec_densities(n_species = n_species)
  resource_densities <- 6
  hsrs <- create_hsrs(n_species = n_species, n_resources = n_resources)
  hsrs[1, 1] <- 1.2
  mortality_rates <- get_mortality_rates(n_species = n_species)

  growth_rates <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  srcs <- create_srcs(n_species = 1, n_resources = 1)
  srcs[1, 1] <- 0.04
  supply_rates <- 6
  turnover_rate <- get_turnover_rate()

  resource_uptake <- srcs[ ,1] * growth_rates * species_densities

  resource_flux <- turnover_rate * (supply_rates[1] - resource_densities[1])

  expected <- resource_flux - resource_uptake

  created <- calc_resource_changes(
    max_growth_rates = max_growth_rates,
    resource_densities = resource_densities,
    hsrs = hsrs,
    srcs = srcs,
    species_densities = species_densities,
    supply_rates = supply_rates,
    turnover_rate = turnover_rate,
    mortality_rates = mortality_rates
  )
  expect_equal(expected, created)
})

test_that("use, 3 species, 3 resurces", {

  n_species <- 3
  n_resources <- 3
  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  species_densities <- create_init_spec_densities(n_species = n_species)
  supply_rates <- get_supply_rates()
  resource_densities <- supply_rates
  hsrs <- create_hsrs_1_a()
  mortality_rates <- get_mortality_rates(n_species = n_species)

  growth_rates <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  srcs <- create_srcs_1_a()
  turnover_rate <- get_turnover_rate()

  resource_uptake <- as.numeric(rowSums(srcs * growth_rates * species_densities))

  resource_flux <- turnover_rate * (supply_rates - resource_densities)

  expected <- resource_flux - resource_uptake

  created <- calc_resource_changes(
    max_growth_rates = max_growth_rates,
    resource_densities = resource_densities,
    hsrs = hsrs,
    srcs = srcs,
    species_densities = species_densities,
    supply_rates = supply_rates,
    turnover_rate = turnover_rate,
    mortality_rates = mortality_rates
  )
  expect_equal(expected, created)
})
