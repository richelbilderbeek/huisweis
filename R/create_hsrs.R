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
#'   of 3 species (columns) on 3 resources (rows)
#'   as used in figure 1 A
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs_1_a <- function() {
  create_hsrs_1_d()[, 1:3]
}


#' Create the matrix of half-saturation constants
#'   of 6 species (columns) on 3 resources (rows)
#'   as used in figure 1 C
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs_1_c <- function() {
  m <- create_hsrs(n_species = 6, n_resources = 3)
  m[1, ] <- c(1.00, 0.90, 0.30, 1.04, 0.34, 0.77)
  m[2, ] <- c(0.30, 1.00, 0.90, 0.71, 1.02, 0.76)
  m[3, ] <- c(0.90, 0.30, 1.00, 0.46, 0.34, 1.07)
  m
}
#' Create the matrix of half-saturation constants
#'   of 6 species (columns) on 3 resources (rows)
#'   as used in figure 1 D
#' @author Richel J.C. Bilderbeek
#' @export
create_hsrs_1_d <- function() {
  m <- create_hsrs(n_species = 9, n_resources = 3)
  m[1, ] <- c(1.00, 0.75, 0.25, 0.70, 0.20, 0.65, 0.68, 0.38, 0.46)
  m[2, ] <- c(0.25, 1.00, 0.75, 0.20, 1.01, 0.55, 0.83, 1.10, 0.85)
  m[3, ] <- c(0.75, 0.25, 1.00, 1.10, 0.70, 0.95, 0.60, 0.50, 0.77)
  m
}
