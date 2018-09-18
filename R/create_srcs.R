#' Create the matrix of species' (rows) resource (columns) content
#' @inheritParams default_params_doc
#' @author Richel J.C. Bilderbeek
#' @export
create_srcs <- function(
  n_species,
  n_resources
) {
  create_hsrs(n_species = n_species, n_resources = n_resources)
}

#' Create the species resource contents used in figure 1 A.
#' @author Richel J.C. Bilderbeek
#' @export
create_srcs_1_a <- function() {
  create_srcs_1_d()[, 1:3]
}


#' Create the species resource contents used in figure 1 C.
#' @author Richel J.C. Bilderbeek
#' @export
create_srcs_1_c <- function() {
  srcs <- create_srcs(n_species = 6, n_resources = 3)
  srcs[1, ] <- c(0.04, 0.07, 0.04, 0.10, 0.03, 0.02)
  srcs[2, ] <- c(0.08, 0.08, 0.10, 0.10, 0.05, 0.17)
  srcs[3, ] <- c(0.14, 0.10, 0.10, 0.16, 0.06, 0.14)
  srcs
}

#' Create the species resource contents used in figure 1 D.
#' @author Richel J.C. Bilderbeek
#' @export
create_srcs_1_d <- function() {
  srcs <- create_srcs(n_species = 9, n_resources = 3)
  srcs[1, ] <- c(0.10, 0.20, 0.15, 0.05, 0.01, 0.40, 0.30, 0.20, 0.25)
  srcs[2, ] <- c(0.15, 0.10, 0.20, 0.15, 0.30, 0.35, 0.25, 0.02, 0.35)
  srcs[3, ] <- c(0.20, 0.15, 0.10, 0.25, 0.05, 0.20, 0.40, 0.15, 0.10)
srcs
}
