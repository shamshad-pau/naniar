#' Label a missing from one column
#'
#' Label whether a value is missing in a row of one columns.
#'
#' @param x1 a variable of a dataframe
#'
#' @return a vector indicating whether any of these rows had missing values
#'
#' @note can we generalise label_miss to work for any number of variables?
#'
#' @export
#'
#' @seealso [add_any_miss()] [add_label_missings()] [add_label_shadow()]
#'
#' @examples
#'
#' label_miss_1d(airquality$Ozone)
#'
label_miss_1d <- function(x1){

  # Catch NULL entries
  test_if_null(x1)
  # find which are missing and which are not.
  temp <- data.frame(x1) %>% is.na %>% rowSums()
  ifelse(temp == 0, # 0 means not missing
         "Not Missing", # not missing
         "Missing") # missing

}

#' label_miss_2d
#'
#' Label whether a value is missing in either row of two columns.
#'
#' @param x1 a variable of a dataframe
#' @param x2 another variable of a dataframe
#'
#' @return a vector indicating whether any of these rows had missing values
#' @export
#'
#' @examples
#'
#' label_miss_2d(airquality$Ozone, airquality$Solar.R)
#'
label_miss_2d <- function(x1, x2){

  # Catch NULL entries
  if(is.null(x1) | is.null(x2)) stop("Input cannot be NULL", call. = FALSE)
  # find which are missing and which are not.
  temp <- data.frame(x1,x2) %>% is.na %>% rowSums()
  ifelse(temp == 0, # 0 means not missing
         "Not Missing", # not missing
         "Missing") # missing

}

