#' Calculate the specific growth rates, equation 3
#' @param resource_densities resource densities
#' @param max_growth_rate max growth rate of the focal species
#' @param half_saturation_resources half-saturation constants for
#'   this focal species for each of the resources
#' @return the growth rate of the focal species
#' @author Richel J.C. Bilderbeek
#' @examples
#'   max_growth_rate <- 12.34
#'   resource_densities <- 23.45
#'   half_saturation_resources <- 34.56
#'   specific_growth_rate <- calc_specific_growth_rate(
#'     resource_densities = resource_densities,
#'     max_growth_rate = max_growth_rate,
#'     half_saturation_resources = half_saturation_resources
#'   )
#'   expect_equal(4.988329598, specific_growth_rate)
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