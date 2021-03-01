#' Check data integrity
#'
#' @param x dataframe with at least colums lat, long and primary_fur_color
#'
#' @return Original dataframe if all tests are good. Otherwise stops.
#' @export
#'
#' @examples
#' datafile <- system.file("nyc_squirrels_sample.csv", package = "fusen.squirrels")
#' nyc_squirrels <- read.csv(datafile)
#' nyc_squirrels_ok <- check_data_integrity(nyc_squirrels)
check_data_integrity <- function(x) {
  # Verify it is a data.frame
  if (!is.data.frame(x)) {stop("x is not a dataframe")}
  
  # Verify points are in New York around Central Park
  all_coords_ok <- all(
    c(min(x[["lat"]]) > 40.76400,
      max(x[["lat"]]) < 40.80100,
      min(x[["long"]]) > -73.98300,
      max(x[["long"]]) < -73.94735)
  )
  if (!all_coords_ok) {stop("Not all data are in Central Park")}
  
  # Verify there is only one color in primary_fur_color.
  # A `+` is a sign of multiple colours
  if (any(grepl("+", x[["primary_fur_color"]], fixed = TRUE))) {
    stop("There are multiple colors in some 'primary_fur_color'")
  }
  
  message("All tests are good !")
  return(x)
}

