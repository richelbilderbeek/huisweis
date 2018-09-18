#' Calculate the specific growth rates, equation 3
#' @inheritParams default_params_doc
#' @return the growth rate of the focal species
#' @author Richel J.C. Bilderbeek
#' @examples
#'   max_growth_rate <- 12.34
#'   resource_densities <- 23.45
#'   hsr <- 34.56
#'   specific_growth_rate <- calc_specific_growth_rate(
#'     resource_densities = resource_densities,
#'     max_growth_rate = max_growth_rate,
#'     hsr = hsr
#'   )
#'   testthat::expect_equal(4.988329598, specific_growth_rate)
#' @export
calc_specific_growth_rate <- function(
  resource_densities,
  max_growth_rate,
  hsr
) {
  testit::assert(
    length(resource_densities) == length(hsr)
  )
  testit::assert(length(max_growth_rate) == 1)

  specific_growth_rates <- (max_growth_rate * resource_densities) /
    (hsr + resource_densities)

  min(specific_growth_rates)
}