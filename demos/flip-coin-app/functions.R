# function to flip a coin
flip <- function(coin = c('H', 'T'), 
                 tosses = 1, prob = c(0.5, 0.5)) {
  sample(coin, size = tosses, replace = TRUE, prob = prob)
}

