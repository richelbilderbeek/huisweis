#' Run the simulation
#' @return a data frame
#'   with the species densities and resource concentrations (as columns)
#'   in time (as rows)
#' @author Richel J.C. Bilderbeek
#' @export
run_sim <- function(
  initial_species_densities,
  initial_resource_densities,
  dt,
  t_max
) {
  n_species <- length(initial_species_densities)
  n_resources <- length(initial_resource_densities)
  n_timesteps <- t_max / dt

  df <- data.frame(matrix(nrow = n_timesteps, ncol = n_species + n_resources))
  colnames(df) <- c(paste0("N", seq(1, n_species)), paste0("R", seq(1, n_resources)))
  rownames(df) <- paste0("t", seq(1, n_timesteps) - 1)
  df[1, ] <- c(initial_species_densities, initial_resource_densities)

  for (t in seq(2, n_timesteps)) {
    ns <- df[t - 1, 1:n_species]
    rs <- df[t - 1, -c(1:n_species)]
    testit::assert(length(ns) == n_species)
    testit::assert(length(rs) == n_resources)
    new_ns <- ns
    new_rs <- rs
    df[t, ] <- c(new_ns, new_rs)
  }

  df
}