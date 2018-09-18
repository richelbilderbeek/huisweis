#' Create the matrix of half-saturation constants
#'   of species (columns) on resources (rows)
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs <- function(
  n_species,
  n_resources
) {
  m <- matrix(ncol = n_species, nrow = n_resources, data = 0.0)
  rownames(m) <- paste0("R", seq(1, n_resources))
  colnames(m) <- paste0("N", seq(1, n_species))
  m
}

#' Create the matrix of half-saturation constants
#'   of 6 species (columns) on 3 resources (rows)
#'   as used in igure 1C
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs_1_c <- function() {
  m <- create_hsrs(n_species = 6, n_resources = 3)
  m[1, ] <- c(1.00, 0.90, 0.30, 1.04, 0.34, 0.77)
  m[2, ] <- c(0.30, 1.00, 0.90, 0.71, 1.02, 0.76)
  m[3, ] <- c(0.90, 0.30, 1.00, 0.46, 0.34, 1.07)
  m
}