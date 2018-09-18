context("get_supply_rates")

test_that("use", {
  expected <- c(6, 10, 14)
  created <- get_supply_rates()
  expect_equal(expected, created)
})
