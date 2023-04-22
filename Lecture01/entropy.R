# R script to calculate entropy of a given sequence
# install the data.table package
# install.packages("data.table")
library(data.table)

# create a data.table with one variable and 10 observations
# variable is a vector of 'hello' strings
hello <- data.table(hello = rep("hello", 10))
hello

# add another variable to the data.table, filled with integer 1
hello[, hello_int := 1]
hello

# create a new variable that calculates the cumulative sum of hello_int
hello[, hello_cumsum := cumsum(hello_int)]
hello

# create a table with 6 variables and 10 observations
# first variable is a vector of all 'hello' strings
# second variable is a vector of all 1 integers
# third variable is based on the first variable but replace one 
# observation with 'world'
# four variable is a vector of integers using 1 to represent 'hello'
# and 2 to represent 'world'
# fifth variable is a vector of 'tomorrow' 'will' 'be' 'a' 'great'
# day' strings, with 'hello' filled in for other observations
# sixth variable is a vector of integers using 1 to represent 'hello' and
# 2, 3, 4, 5, 6, 7, 8, 9, 10 to represent 'tomorrow', 'will', 'be', 'a',
# 'great', 'day'

entropy_example <- data.table(
    hello = rep("hello", 10),
    hello_int = rep(1, 10),
    hello_world = c('hello', 'world', rep('hello', 8)),
    hello_int2 = c(1, 2, rep(1, 8)),
    hello_world2 = c('hello', 'tomorrow', 'will', 'be', 'a', 'great',
                     'day', 'hello', 'hello', 'hello'),
    hello_int3 = c(1, 2, 3, 4, 5, 6, 7, 1, 1, 1)
)

str(entropy_example)
summary(entropy_example)

# write a function to calculate entropy of a given vector
entropy <- function(x) {
    # calculate the probability of each unique value in the vector
    prob <- table(x) / length(x)
    # calculate the entropy
    entropy <- -sum(prob * log2(prob))
    # return the entropy
    return(entropy)
}

# test the function on the second variable
entropy(entropy_example$hello_int)
# test the function on the fourth variable
entropy(entropy_example$hello_int2)
# test the function on the sixth variable
entropy(entropy_example$hello_int3)


entropy_example$prob <- rep(1/10, 10)



