context("create_srcs")

test_that("use", {

  n_species <- 2
  n_resources <- 3
  srcs <- create_srcs(n_species = n_species, n_resources = n_resources)
  expect_equal(rownames(srcs), paste0("R", seq(1, n_resources)))
  expect_equal(colnames(srcs),  paste0("N", seq(1, n_species)))
})
