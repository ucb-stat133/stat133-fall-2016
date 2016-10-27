#' @title Roll a die
#' @description Rolls a die a given number of times
#' @param die object die
#' @param times number of times to roll the die
roll <- function(die = 1:6, times = 1) {
  sample(die, size = times, replace = TRUE)
}


#' @title Number of Sixes
#' @description computes how many sixes are in a vector of rolls of a die
#' @param x vector of rolls of a die
#' @return how many sixes
num_sixes <- function(x) {
  sum(x == 6)
}
