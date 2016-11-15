# =========================================================================
# Title: Efficiency Index and PCA
#
# Description:
# This script shows you how to use Principal Component Analysis to
# compute the Efficiency Index for the final project using
# the "dummy" data (season 2014-2015)
# 
# Details:
# The code focuses on players who are PG "Point Guards"
# PG runs the team's offense by controlling the ball and making 
# sure that it gets to the right players at the right time.
# =========================================================================

library(dplyr)
library(ggplot2)
library(FactoMineR)

# data from github repository
dat <- read.csv("data/roster-salary-stats.csv",
                row.names = 1,
                stringsAsFactors = FALSE)


# =========================================================================
# Exploring variables to be used in Efficiency
# =========================================================================

# subset data for position 'PG' (point guard)
# and add Missed Field Goals MFG, Missed Free Throws MFT, Turnovers TO
pg <- dat %>%
  filter(position == 'PG') %>%
  mutate(MFT = FTA - FT) %>%
  mutate(MFG = FGA - FG)
  
# statistics for efficiency
stats <- c('PTS', 'TRB', 'AST', 'STL', 'BLK', 'MFT', 'MFG', 'TOV')

# correlations and scatterplot-matrix
print(round(cor(pg[ ,stats]), 2), print.gap = 3)
pairs(pg[ ,stats], pch = 20)

# PCA with FactoMineR
pca <- PCA(pg[ ,stats], graph = FALSE)
plot(pca, choix = "var")


# =========================================================================
# Efficiency
# =========================================================================

# subset data for position 'PG' (point guard)
# and add Missed Field Goals MFG, Missed Free Throws MFT, Turnovers TO
# (these variables have negative sign)
pg <- dat %>%
  filter(position == 'PG') %>%
  mutate(MFT = FT - FTA) %>%
  mutate(MFG = FG - FGA) %>%
  mutate(TO = -1 * TOV)

head(pg)

# statistics for efficiency
stats <- c('PTS', 'TRB', 'AST', 'STL', 'BLK', 'MFG', 'MFT', 'TO')

# keep in mind that all variables are divided by number of games
X <- as.matrix(pg[ ,stats] / pg$G)
print(round(cor(X), 2), print.gap = 2)


# PCA with prcomp()
pg_pca <- prcomp(X, center = TRUE, scale. = TRUE)
pg_weights <- pg_pca$rotation[,1]

# std deviations
pg_sigmas <- apply(X, 2, sd)

# modified efficiency
pg_eff <- X %*% (pg_weights / pg_sigmas)
pg$EFF <- pg_eff


ggplot(data = pg, aes(x = salary, y = EFF, label = player)) + 
  geom_point()
  
ggplot(data = pg, aes(x = salary, y = EFF, label = player)) + 
  geom_point() + 
  geom_label()

ggplot(data = pg, aes(x = height, y = EFF)) + 
  geom_point()

ggplot(data = pg, aes(x = weight, y = EFF)) + 
  geom_point()

ggplot(data = pg, aes(x = MFT / G, y = EFF, label = player)) + 
  geom_point() +
  geom_label()


ggplot(data = pg, aes(x = MFT / G, y = EFF, label = player)) + 
  geom_point() +
  geom_text()
