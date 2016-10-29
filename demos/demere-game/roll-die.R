# roll a die a given number of times
roll <- function(die = 1:6, times = 1) {
  sample(die, size = times, replace = TRUE)
}


# how many sixes in a vector of rolls
num_sixes <- function(x) {
  sum(x == 6)
}


games <- 1000
wager <- 1
set.seed(1234)

rolls <- roll(die = 1:6, times = 4 * games)

outputs <- matrix(rolls, nrow = games, ncol = 4, byrow = TRUE)

sixes <- apply(outputs, 1, num_sixes)

apply(outputs, MARGIN = 2, mean)




losses <- sum(sixes == 0)

wins <- games - losses

gain <- wager * (wins - losses)

barplot(round(table(sixes) / games, 2),
         las = 1, col = "gray70", border = NA,
         xlab = "Number of sixes",
         ylab = "relative frequency",
         main = "Distribution of sixes")
