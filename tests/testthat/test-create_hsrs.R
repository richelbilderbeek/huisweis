context("create_half_saturation_resourceses")

test_that("use", {

  hsrs <- create_hsrs(n_species = 2, n_resources = 3)
  expect_true(colnames(hsrs) == paste0("R", seq(1, n_resources)))
  expect_true(rownames(hsrs) == paste0("N", seq(1, n_species)))
})
