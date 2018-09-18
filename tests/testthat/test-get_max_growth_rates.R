context("get_max_growth_rates")

test_that("use", {
  expect_equal(1.0, get_max_growth_rates(n_species = 1))
  expect_equal(c(1.0, 1.0), get_max_growth_rates(n_species = 2))
})
