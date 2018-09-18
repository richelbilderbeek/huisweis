#' Run the simulation
#' @inheritParams default_params_doc
#' @return a data frame
#'   with the species densities and resource concentrations (as columns)
#'   in time (as rows)
#' @author Richel J.C. Bilderbeek
#' @export
run_sim <- function(
  initial_species_densities,
  initial_resource_densities,
  dt,
  t_max,
  max_growth_rates,
  mortality_rates,
  hsrs,
  srcs,
  supply_rates,
  turnover_rate
) {
  n_species <- length(initial_species_densities)
  n_resources <- length(initial_resource_densities)
  testit::assert(n_species == length(max_growth_rates))
  testit::assert(n_species == length(mortality_rates))
  testit::assert(n_resources == nrow(hsrs))
  testit::assert(n_species == ncol(hsrs))
  if (!all(rownames(hsrs) == paste0("R", seq(1, n_resources)))) {
    stop("Use 'create_hsrs' to create a tidy HSRs matrix")
  }
  if (!all(colnames(hsrs) ==  paste0("N", seq(1, n_species)))) {
    stop("Use 'create_hsrs' to create a tidy HSRs matrix")
  }
  testit::assert(all(rownames(hsrs) == paste0("R", seq(1, n_resources))))
  testit::assert(all(colnames(hsrs) ==  paste0("N", seq(1, n_species))))
  testit::assert(ncol(srcs) == n_species)
  testit::assert(nrow(srcs) == n_resources)
  testit::assert(n_resources == length(supply_rates))
  testit::assert(length(turnover_rate) == 1)


  n_timesteps <- t_max / dt

  # '1 +' due to the time
  df <- data.frame(matrix(nrow = n_timesteps, ncol = 1 + n_species + n_resources))
  colnames(df) <- c("t", paste0("N", seq(1, n_species)), paste0("R", seq(1, n_resources)))
  rownames(df) <- paste0("t", seq(1, n_timesteps) - 1)
  df[1, ] <- c(0.0, initial_species_densities, initial_resource_densities)

  for (t in seq(2, n_timesteps)) {
    ns <- as.numeric(df[t - 1, 2:(n_species + 1)])
    rs <- as.numeric(df[t - 1, -c(1, 2:(n_species + 1))])
    testit::assert(length(ns) == n_species)
    testit::assert(length(rs) == n_resources)
    testit::assert(!is.list(ns))
    testit::assert(!is.list(rs))
    delta_ns <- calc_growth_rates(
      species_densities = ns,
      resource_densities = rs,
      max_growth_rates = max_growth_rates,
      mortality_rates = mortality_rates,
      hsrs = hsrs
    )
    new_ns <- ns + (delta_ns * dt)
    delta_rs <- calc_resource_changes(
      max_growth_rates = max_growth_rates,
      resource_densities = rs,
      hsrs = hsrs,
      srcs = srcs,
      species_densities = ns,
      supply_rates = supply_rates,
      turnover_rate = turnover_rate,
      mortality_rates = mortality_rates
    )
    new_rs <- rs + (delta_rs * dt)
    df[t, ] <- c((t - 1) * dt, new_ns, new_rs)
  }

  df
}