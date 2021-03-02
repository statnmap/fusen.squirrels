
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fusen.squirrels

<!-- badges: start -->

[![R-CMD-check](https://github.com/statnmap/fusen.squirrels/workflows/R-CMD-check/badge.svg)](https://github.com/statnmap/fusen.squirrels/actions)
<!-- badges: end -->

The goal of {fusen.squirrels} is to present an example of the use of
{fusen} with Rmd First method to build a package.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("statnmap/fusen.squirrels")
```

## Example

This is a basic example which shows how to check entry dataset on [NYC
Squirrel Census](https://www.thesquirrelcensus.com/):

``` r
library(fusen.squirrels)

## Use internal dataset or your own
datafile <- system.file("nyc_squirrels_sample.csv", package = "fusen.squirrels")
nyc_squirrels <- read.csv(datafile)

## Check integrity of dataset
nyc_squirrels_ok <- check_data_integrity(nyc_squirrels)
#> All tests are good !
```
