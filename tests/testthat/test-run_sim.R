context("run_sim")

test_that("use", {

  n_species <- 6
  n_resources <- 3
  initial_species_densities <- create_init_spec_densities(n_species = n_species)
  initial_resource_densities <- c(6, 10, 14)
  dt <- 0.01
  t_max <- 0.1

  df <- run_sim(
    initial_species_densities = initial_species_densities,
    initial_resource_densities = initial_resource_densities,
    dt = dt,
    t_max = t_max
  )
  expect_equal(ncol(df), n_species + n_resources)
  expect_equal(nrow(df), t_max / dt)

})
