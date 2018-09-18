context("create_init_spec_densities")

test_that("use", {
  expect_equal(0.11, create_init_spec_densities(n_species = 1))
  expect_equal(c(0.11, 0.12), create_init_spec_densities(n_species = 2))
  expect_equal(c(0.11, 0.12, 0.13), create_init_spec_densities(n_species = 3))
})
