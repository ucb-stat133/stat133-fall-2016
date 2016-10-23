# generate bins based on bins from ui.R

library(ggplot2)

# random seed
seed <- 12345

# probability of heads
prob <- 0.5

# number of tosses
times <- 100

# random seed for reproducibility purposes
set.seed(seed)

# toss a coin multiple times
tosses <- sample(c("heads", "tails"), 
                 size = times,
                 replace = TRUE,
                 prob = c(prob, 1 - prob))

# data frame
dat <- data.frame(
  tosses = 1:times,
  num_heads = cumsum(tosses == 'heads'),
  prop_heads = cumsum(tosses == 'heads') / (1:times),
  num_tails = cumsum(tosses == 'tails'),
  prop_tails = cumsum(tosses == 'tails') / (1:times)
)

# plot relative frequencies
ggplot(data = dat, aes(x = tosses, y = prop_heads)) +
  geom_abline(intercept = 0.5, slope = 0, col = "gray70", size = 0.8) +
  geom_path(size = 1, col = "#9783d4") + 
  ylim(0, 1)
