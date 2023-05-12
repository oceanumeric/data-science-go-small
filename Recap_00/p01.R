# practice 01 with R and AI
# 2023-05-05
# library packages
library(data.table)
library(knit)


# ------------Vector ---------------- #

x <- c(1,2,3,4,5,6,7,8,9,10)
y <- c(1:10)

print(x)
print(y)

z = c(0.35, 12.239, -129.0)
print(z)

x1 <- c("hello", "world", "!")
print(x1)

hel <- c("hell", "A", "B")
print(hel)


# -------------- Matrix -------------- #
# create a matrix for me with 5 rows and 4 columns
# name it as "my_matrix"
# fill it with numbers from 1 to 20
# print it

my_matrix <- matrix(1:20, nrow = 5, ncol = 4)

print(my_matrix)


# -------------- Data Frame -------------- #
# create a data frame for me with 5 rows and 4 columns
# name it as "my_df"
# fill it with numbers from 1 to 20
# print it

my_df <- data.frame(matrix(1:20, nrow = 5, ncol = 4))

print(my_df)


# -------------- data.table -------------- #

# create a data.table for me with 20 rows and 4 columns
# first column is a sequence from 1 to 20
# second column is sample drawn from a normal 
# distribution with mean 0 and sd 1
# third column should be filled with two values: 1 and
# 0 in a random fashion
# fourth column should be filled with 20 random
# characters from the alphabet

my_dt <- data.table(
  x = 1:20,
  y = rnorm(20, mean = 0, sd = 1),
  z = sample(c(0,1), 20, replace = TRUE),
  w = sample(letters, 20, replace = TRUE)
)

print(my_dt)


str(my_dt)


my_dt <- data.table(
  'c1' = 1:20,
  'n1' = rnorm(20, mean = 0, sd = 1),
  'binary_col' = sample(c(0,1), 20, replace = TRUE),
  'letters' = sample(letters, 20, replace = TRUE)
)

head(my_dt)

# crate a dataframe like my_dt

my_df <- data.frame(
  'c1' = 1:20,
  'n1' = rnorm(20, mean = 0, sd = 1),
  'binary_col' = sample(c(0,1), 20, replace = TRUE),
  'letters' = sample(letters, 20, replace = TRUE)
)