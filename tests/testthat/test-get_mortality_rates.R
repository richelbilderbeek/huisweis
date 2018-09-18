context("get_mortality_rates")

test_that("use", {
  expect_equal(0.25, get_mortality_rates(n_species = 1))
  expect_equal(c(0.25, 0.25), get_mortality_rates(n_species = 2))
})
