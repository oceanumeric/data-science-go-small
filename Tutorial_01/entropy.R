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

# create a new variable that divides hello_int by the number of observations
hello[, hello_prob := (hello_int / nrow(hello))]
hello

# Big Lesson 1: never use the same name for a variable as the name of a
# data.table

# re-create a data.table with one variable and 10 observations
# variable is a vector of 'hello' strings called dt_demo
dt_demo <- data.table(hello = rep("hello", 10))
dt_demo

# Exercise: repeat what we have done on the dt_demo data.table


entropy_example <- fread("https://docs.google.com/spreadsheets/d/1Ral3hG1AHCuiaWYtB3taCSKuWl_j1_A0aKOTb_uh43E/edit?usp=sharing")
entropy_example

entropy_fun <- function(x) {
    # x is the probability of each unique value in the vector
    return(-x * log2(x))
}
entropy_names <- entropy_example[, paste(names(.SD), "_entropy", sep = ""),
                                                .SDcols = patterns("prob")]

entropy_example[, (entropy_names) := lapply(.SD, function(x) entropy_fun(x)),
                                                .SDcols = patterns("prob")]
# cumulative entropy
entropy_example[, lapply(.SD, cumsum), .SDcols = patterns("entropy")] 

options(repr.plot.width = 8, repr.plot.height = 5)
plot(entropy_example$prob1_entropy, type = "l", col = "red", ylim = c(0, 1))
lines(entropy_example$prob2_entropy, col = "blue", ylim = c(0, 1))
lines(entropy_example$prob3_entropy, col = "#0F7F12", ylim = c(0, 1))
legend("topright", legend = c("prob1_entropy", "prob2_entropy", "prob3_entropy"),
       col = c("red", "blue", "#0F7F12"), lty = 1, cex = 0.8)


### ------------- experiment with ChatGPT ------------------ ###

# Take away:
# for small examples, excel works way better !
# you do not need any coding if you only have less than 100 observations


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
head(entropy_example)

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


# create a vector called hello_int_prob that contains the probability of
# each unique value in the second variable
# add in to the entropy_example data.table
entropy_example[, hello_int_prob := table(hello_int) / nrow(entropy_example)]

# the above code does not work because the table function does not
# recognize the hello_int variable as a factor
# give me a hint
entropy_example[, hello_int := as.factor(hello_int)]
entropy_example[, hello_int_prob := table(hello_int) / nrow(entropy_example)]
entropy_example

# it still does not work because the table function returns a table 
# object, not a vector
# give me a hint
entropy_example[, hello_int_prob := as.vector(table(hello_int) / nrow(entropy_example))]

# table is a wrong choice of function
# use prop.table instead
entropy_example[, hello_int_prob := prop.table(hello_int)]
entropy_example

# add similar variables like hello_int_prob for the other variables
# such as hello_int2_prob, hello_int3_prob
entropy_example[, hello_int2_prob := prop.table(hello_int2)]
entropy_example[, hello_int3_prob := prop.table(hello_int3)]
entropy_example


# check whether sums of the probabilities are 1 for variables with names
# containing 'prob'
entropy_example[, lapply(.SD, sum), .SDcols = grepl('prob', names(.SD))]

# the above examples shows the limitations of ChatGPT

# the following code was searched on the internet
# based on human beings' understanding of the problem
entropy_example[, lapply(.SD, sum), .SDcols = patterns("prob")]

# the sum of the probabilities equal to 1, which is correct
entropy_example

# now we will calculate the entropy of the variables
# that contain 'prob' in their names
entropy_example[, lapply(.SD, entropy), .SDcols = grepl('prob', names(.SD))]



entropy_example
# create multiple variables to represent the probabilities of each unique
# value for variables with names containing 'int'
entropy_example[, lapply(.SD, function(x) prop.table(x)), .SDcols = patterns("int")]

entropy_example[, lapply(.SD, function(x) prop.table(x)),
                                    .SDcols = patterns("int")]

# assign those columns in place of the original columns
# the following code gives probabilties of each unique value for
# the whole talbe in .sd
# entropy_example[, prop.table(.SD), .SDcols = patterns("int")]

# a fast way to create new column names  based on the old column names

col_names_prob <- entropy_example[, paste(names(.SD), "_prob", sep=""),
                                    .SDcols = patterns("int")]
entropy_example[, (col_names_prob) := lapply(.SD, function(x) prop.table(x)),
                    .SDcols = patterns("int")]
entropy_example


# create a new variable that calculates the entropy of the probabilities
# of each unique value for variables with names containing 'prob'
entropy_prob <- function(x) {
    # x as probabilities
    return(-x * log2(x))
}
entropy_names_entropy <- entropy_example[, paste(names(.SD), "_entropy", sep=""),
                                    .SDcols = patterns("prob")]
entropy_example[, (entropy_names_entropy) := lapply(.SD, function(x) entropy_prob(x)),
                    .SDcols = patterns("prob")]
entropy_example













