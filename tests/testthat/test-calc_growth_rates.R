context("calc_growth_rates")

test_that("use, 1 species, 1 resource", {

  max_growth_rates <- 12.34
  resource_densities <- 23.45
  hsrs <- create_hsrs(n_species = 1, n_resources = 1)
  hsrs[1, 1] <- 34.56

  growth_rate <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rates[1],
    hsr = hsrs[1, ]
  )

  species_densities <- 45.56
  mortality_rates <- 0.56

  expected <- species_densities[1] * (growth_rate - mortality_rates[1])

  created <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  expect_equal(created, expected)
})

test_that("use, 2 species, 1 resource", {

  n_species <- 2
  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  resource_densities <- 23.45
  hsrs <- create_hsrs(n_species = n_species, n_resources = 1)
  hsrs[1, 1] <- 34.56
  hsrs[1, 2] <- 45.67

  growth_rate_1 <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rates[1],
    hsr = hsrs[, 1]
  )
  growth_rate_2 <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rates[2],
    hsr = hsrs[, 2]
  )

  species_densities <- c(45.56, 56.78)
  mortality_rates <- get_mortality_rates(n_species = n_species)

  expected_1 <- species_densities[1] * (growth_rate_1 - mortality_rates[1])
  expected_2 <- species_densities[2] * (growth_rate_2 - mortality_rates[2])
  expected <- c(expected_1, expected_2)

  created <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  expect_equal(created, expected)
})

test_that("use, 3 species, 3 resource", {

  n_species <- 3
  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  resource_densities <- get_supply_rates()
  hsrs <- create_hsrs_1_a()
  species_densities <- create_init_spec_densities(n_species = n_species)
  mortality_rates <- get_mortality_rates(n_species = n_species)

  expected_dn1_dt <- species_densities[1] * (
    calc_specific_growth_rate(
      resource_densities = resource_densities,
      max_growth_rate = max_growth_rates[1],
      hsr = hsrs[,1]
    ) - mortality_rates[1]
  )
  expected_dn2_dt <- species_densities[2] * (
    calc_specific_growth_rate(
      resource_densities = resource_densities,
      max_growth_rate = max_growth_rates[2],
      hsr = hsrs[,2]
    ) - mortality_rates[2]
  )
  expected_dn3_dt <- species_densities[3] * (
    calc_specific_growth_rate(
      resource_densities = resource_densities,
      max_growth_rate = max_growth_rates[3],
      hsr = hsrs[,3]
    ) - mortality_rates[3]
  )



  created <- calc_growth_rates(
    species_densities = species_densities,
    resource_densities = resource_densities,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs
  )

  expect_equal(created[1], expected_dn1_dt)
  expect_equal(created[2], expected_dn2_dt)
  expect_equal(created[3], expected_dn3_dt)
})
