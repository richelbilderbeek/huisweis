context("run_sim")

test_that("use", {

  n_species <- 6
  n_resources <- 3
  initial_species_densities <- create_init_spec_densities(n_species = n_species)
  supply_rates <- c(6, 10, 14)
  initial_resource_densities <- supply_rates
  dt <- 0.01
  t_max <- 0.1

  max_growth_rates <- get_max_growth_rates(n_species = n_species)
  mortality_rates <- get_mortality_rates(n_species = n_species)
  hsrs <- create_hsrs_1_c()
  srcs <- create_srcs_1_c()
  turnover_rate <- get_turnover_rate()

  df <- run_sim(
    initial_species_densities = initial_species_densities,
    initial_resource_densities = initial_resource_densities,
    dt = dt,
    t_max = t_max,
    max_growth_rates = max_growth_rates,
    mortality_rates = mortality_rates,
    hsrs = hsrs,
    srcs = srcs,
    supply_rates = supply_rates,
    turnover_rate = turnover_rate
  )
  # '1 +' because the time
  expect_equal(ncol(df), 1 + n_species + n_resources)
  expect_equal(nrow(df), t_max / dt)

})
