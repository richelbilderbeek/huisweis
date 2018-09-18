#' Calculate the specific growth rates, equation 3
#' @author Richel J.C. Bilderbeek
#' @export
calc_specific_growth_rate <- function(
  resource_densities,
  max_growth_rate,
  half_saturation_resources
) {
  testit::assert(
    length(resource_densities) == length(half_saturation_resources)
  )
  testit::assert(length(max_growth_rate) == 1)

  specific_growth_rates <- (max_growth_rate * resource_densities) /
    (half_saturation_resources + resource_densities)

  min(specific_growth_rates)
}