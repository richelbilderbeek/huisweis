context("create_half_saturation_resourceses")

test_that("use", {

  n_species <- 2
  n_resources <- 3
  hsrs <- create_hsrs(n_species = n_species, n_resources = n_resources)
  expect_equal(colnames(hsrs), paste0("R", seq(1, n_resources)))
  expect_equal(rownames(hsrs),  paste0("N", seq(1, n_species)))
})
