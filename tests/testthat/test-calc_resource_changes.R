context("calc_resource_changes")

test_that("use", {

  max_growth_rates <- 12.34
  resource_densities <- 23.45
  hsrs <- create_hsrs(n_species = 1, n_resources = 1)
  hsrs[1, 1] <- 34.56

  growth_rate <- calc_specific_growth_rate(
    resource_densities = resource_densities,
    max_growth_rate = max_growth_rates[1],
    hsr = hsrs[1, ]
  )

  srcs <- create_srcs(n_species = 1, n_resources = 1)
  srcs[1, 1] <- 1.2

})
