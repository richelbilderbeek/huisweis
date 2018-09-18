context("calc_specific_growth_rate")

test_that("use, 1 resource", {

  max_growth_rate <- 12.34
  resource_densities <- 23.45
  half_saturation_resources <- 34.56

  created <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rate,
    half_saturation_resources = half_saturation_resources
  )

  expected <- (max_growth_rate * resource_densities[1]) /
    (half_saturation_resources[1] + resource_densities[1])
  expect_equal(created, expected)
})

test_that("use, 2 resources, 0 density", {
  max_growth_rate <- 12.34
  resource_densities <- c(23.45, 0.0)
  half_saturation_resources <- c(34.56, 45.67)

  created <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rate,
    half_saturation_resources = half_saturation_resources
  )

  expected <- 0.0
  expect_equal(created, expected)
})

test_that("use, 2 resource", {

  max_growth_rate <- 12.34
  resource_densities <- c(23.45, 34.56)
  half_saturation_resources <- c(45.56, 56.78)

  created <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rate,
    half_saturation_resources = half_saturation_resources
  )

  specific_growth_rate_1 <- (max_growth_rate * resource_densities[1]) /
    (half_saturation_resources[1] + resource_densities[1])
  specific_growth_rate_2 <- (max_growth_rate * resource_densities[2]) /
    (half_saturation_resources[2] + resource_densities[2])
  expected <- min(specific_growth_rate_1, specific_growth_rate_2)
  expect_equal(created, expected)
})
