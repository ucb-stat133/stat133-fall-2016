# =========================================================================
# Title: Merging Data Tables
#
# Description:
# This script shows various examples about merging data tables
# mostly with functions merge() and join()
# ==============================================================

library(dplyr)


# ==============================================================
# Column and Row Binding
# ==============================================================

# Toy data frames
A <- data.frame(
  v1 = seq(2, 10, 2),
  v2 = 16:20)

A

B <- data.frame(
  v1 = seq(0.1, 0.5, 0.1),
  v2 = seq(0.6, 1, 0.1))

B


# column binding
AB <- cbind(A, B)
AB

# which columnd will I get?
AB$v1

# what about this?
AB[ ,c('v1', 'v1')]

# more cbind
cbind(A, B, A)



# row binding
rbind(A, B)


# ==============================================================
# Basic Merging
# ==============================================================

X <- data.frame(
  id = letters[1:5],
  x1 = 5:1,
  x2 = 10:6)

X

Y <- data.frame(
  id = letters[1:5],
  y1 = seq(0.1, 0.5, 0.1),
  y2 = seq(0.6, 1, 0.1))

Y

# default merge
XY <- merge(X, Y)
XY

# equivalent to:
merge(X, Y, by = 'id')


# shuffling rows in data frame Y
Z <- Y[c(3, 2, 5, 4, 1), ]
Z

XZ <- merge(X, Z, by = 'id')
XZ
# compare to
XY


# ==============================================================
# Less basic Merging
# ==============================================================

X <- data.frame(
  x1 = c(10, 20),
  x2 = c(30, 40))

X

Y <- data.frame(
  y1 = c(0.1, 0.2, 0.3),
  y2 = c(0.4, 0.5, 0.6))

Y

# no id in common
XY <- merge(X, Y)
XY


# ==============================================================
# Advanced Merging: same id column
# ==============================================================

X <- data.frame(
  id = letters[1:4],
  x1 = 4:1,
  x2 = 10:7)

X

Y <- data.frame(
  id = c('b', 'd'),
  y1 = c(0.1, 0.2),
  y2 = c(0.6, 0.7))

Y

XY <- merge(X, Y)
XY


XY_all <- merge(X, Y, by = 'id', all = TRUE)
XY_all

XY_allx <- merge(X, Y, by = 'id', all.x = TRUE)
XY_allx

XY_ally <- merge(X, Y, by = 'id', all.y = TRUE)
XY_ally



# ==============================================================
# Advanced Merging: different id column
# ==============================================================

X <- data.frame(
  idx = letters[1:4],
  x1 = 4:1,
  x2 = 10:7)

X

Y <- data.frame(
  idy = c('b', 'd'),
  y1 = c(0.1, 0.2),
  y2 = c(0.6, 0.7))

Y

# different id columns
XY <- merge(X, Y, by.x = 'idx', by.y = 'idy')


# ==============================================================
# Merging with "dplyr"
# ==============================================================

X <- data.frame(
  id = letters[1:4],
  x1 = 4:1,
  x2 = 10:7,
  stringsAsFactors = FALSE)

X


Y <- data.frame(
  id = c('b', 'd'),
  y1 = c(0.1, 0.2),
  y2 = c(0.6, 0.7),
  stringsAsFactors = FALSE)

Y

# inner join (intersection)
inner_join(X, Y, by = 'id')

# left join
left_join(X, Y, by = 'id')

# right join
right_join(X, Y, by = 'id')

# full join (union)
full_join(X, Y, by = 'id')

# semi join
semi_join(X, Y, by = 'id')

# anti join
anti_join(X, Y, by = 'id')
