datafile <- system.file("nyc_squirrels_sample.csv", package = "fusen.squirrels")
nyc_squirrels <- read.csv(datafile)
nyc_squirrels_ok <- check_data_integrity(nyc_squirrels)

test_that("check_data_integrity works correctly", {
  # Ok
  expect_message(check_data_integrity(nyc_squirrels), "All tests are good !")
  
  # No dataframe
  expect_error(check_data_integrity("vector data"), "x is not a dataframe")
  
  # False latitude
  old_ok <- nyc_squirrels[["lat"]][1]
  nyc_squirrels[["lat"]][1] <- 12
  expect_error(check_data_integrity(nyc_squirrels), "Not all data are in Central Park")
  nyc_squirrels[["lat"]][1] <- old_ok
  
  # Error primary_fur_color
  old_ok <- nyc_squirrels[["primary_fur_color"]][1]
  nyc_squirrels[["primary_fur_color"]][1] <- "grey+pink"
  expect_error(check_data_integrity(nyc_squirrels), "There are multiple colors in some 'primary_fur_color'")
  nyc_squirrels[["primary_fur_color"]][1] <- old_ok
})
