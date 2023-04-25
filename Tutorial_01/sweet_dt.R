# sweet data.table best practices
library(data.table)
library(magrittr)
library(dplyr)
library(knitr)
library(ggplot2)


######----------------- read and clean the data  -----------------######

# read the dataset
csv_url <- "https://shorturl.at/bclM4"
survey <- fread(csv_url)

# check the data
str(survey)
head(survey)
summary(survey)

# change names
survey %>%
    setnames("Timestamp", "timestamp") %>%
    str()

# change names from second column to the last column
survey %>%
    setnames(2:ncol(survey), paste0("q", 1:(ncol(survey) - 1))) %>%
    str()

# check NA values
sapply(survey, function(x) sum(is.na(x))) %>% kable()

# convert the data type of the first column to date and time
survey %>%
    .[, timestamp := as.POSIXct(timestamp, format = "%m/%d/%Y %H:%M:%S")] %>%
    str()

# create a new column called year
survey %>%
    .[, year := format(timestamp, "%Y")] %>%
    str()


# advanced one
# select columns that start with "q" and the data
# type of the columns are character
# query column names first 
survey %>%
    .[, .SD, .SDcols = patterns("^q")] %>%
    .[, .SD, .SDcols = is.character] %>%
    names() -> select_col_names

select_col_names

# convert string of selected columns to lower case
survey %>%
    .[, (select_col_names) := lapply(.SD, tolower),
       .SDcols = select_col_names] 

str(survey)

# save the data set
fwrite(survey, "survey_cleaned.csv")


######----------------- check duplicates and NAs -----------------######
# duplicates and NAs are tricky
# you need to check them carefully
# to check duplicates, you need to set up a criteria
# for instance q1 has two answers: yes and no
# many people might answer yes but this does not mean
# they are duplicates
str(survey)

# in our case, we can use the timestamp as the criteria
# to check duplicates

# check how many duplicates
survey %>%
    .[, .N, by = timestamp] %>%
    .[N > 1] %>%
    kable()

# check the duplicates
survey %>%
    .[timestamp == "2023-04-20 23:44:06"] %>%
    kable()

# another way to check duplicates (the best way)
survey %>%
    .[duplicated(timestamp) | duplicated(timestamp, fromLast = TRUE)] %>%
    kable()

# get unique values
survey %>%
    .[!duplicated(timestamp)] %>%
    str()

# or use unique function (the best way)
# when you use unique function, you need put by = "variable_name"
# as unique function is basic R function, whereas 
# duplicated function is data.table function
# which means you can pass variable name to duplicated function
# directly without putting quotation marks
survey %>%
    unique(by = "timestamp") %>%
    str()

# save the data set
survey %>%
    unique(by = "timestamp") %>%
    fwrite("survey_cleaned_unique.csv")


######----------------- univariate analysis -----------------######

# read the data set
survey <- fread("survey_cleaned_unique.csv")

# q1: have you ever learned regression analysis before?
# q1 answer: yes, no
# it is a categorical variable
# for categorical variables, we can do following analysis:
# 1. frequency table with count or percentage
# 2. bar plot or pie chart

# frequency table with count
survey %>%
    .[, .N, by = q1] %>%
    kable()  # a function to print out the table

# frequency table with percentage
survey %>%
    .[, .N, by = q1] %>%
    .[, percent := N / sum(N) * 100] %>%
    kable(align = "c", digits = 2)

# use basic R function to get the frequency table
survey %>%
    with(table(q1)) %>%
    kable()

# using prop.table function to get the percentage
survey %>%
    with(table(q1)) %>%
    prop.table() %>%
    kable()


# plot the bar chart with table function and barplot function
# set the width and height of the plot
options(repr.plot.width = 8, repr.plot.height = 5)
survey %>%
    with(table(q1)) %>%
    barplot(main = "Did you study the regression analysis before?",
            xlab = "Answer",
            ylab = "Count",
            col = "lightblue")

# plot the pie chart with table function and pie function based on percentage
# add the percentage to the pie chart
# following code was inspired by ChatGPT, which is amazing!
# it uses rainbow color to distinguish the pie chart
# this is new to me, I will try it next time
# it also uses prob.table with a dot, which is brilliant!
survey %>%
    with(table(q1)) %>%
    pie(main = "Did you study the regression analysis before?",
        col = c("lightblue", "lightgreen"),
        labels = paste0(round(prop.table(.) * 100), "%"))

# sometimes you might need ggplot
# ggplot is a powerful package to plot the data
survey %>%
    with(table(q1)) %>%
    data.frame() %>%
    ggplot(aes(x = q1, y = Freq)) +
    geom_bar(stat = "identity", fill = "#2598bf") +
    geom_text(aes(label = Freq),
              vjust = -0.5, size = 4) +
    labs(title = "Did you study the regression analysis before?",
         x = "Answer",
         y = "Count") +
    theme_bw()

# I only use ggplot when I need to plot multiple variables
# against one variable by using facet_wrap
# or any other special plot that is not supported by base R

######----------------- Binomial Distribution -----------------######
# in question 1, we have the following probability table
survey %>%
    with(table(q1)) %>%
    prop.table() %>%
    kable()

# this means the probability of getting yes is 0.708
# the probability of getting no is 0.292
# NOW, assuming our survey data is a sample of the population
# and also representing the population
# we can use binomial distribution to calculate the probability
# of getting yes or no in the population

# binomial distribution with n = 1000
# p = 0.708
# q = 0.292
# rbinom function is used to generate random numbers
# from binomial distribution
# rbinom(1, 10, 0.5) ==  sum(rbionom(10, 1, 0.5))

rbinom(1000, 1, 0.708) %>%
    table() %>%
    prop.table() %>%
    kable()

# the above code simulate 1000 times with p = 0.708
# the simulation is to imitate our survey
# but we need to do inference to the population


# NOW, we are interested the probability of having 60
# or more yes in the population if we have 100 people?
# our parameter of interest is p = 0.708
# our inference is based on the binomial distribution
# we need to use the binomial distribution to calculate
# the probability of getting 60 or more yes in the population
# if we have 100 people
pbinom(59, 100, 0.708, lower.tail = FALSE)

# plot the binomial probability density function
# and cumulative distribution function
# using type = "h" to indicate it is discrete 
options(repr.plot.width = 9, repr.plot.height = 5)
n = 100
p = 0.708
x = 0:100
y = dbinom(x, n, p)
y_cum = pbinom(x, n, p)
par(mfrow = c(1, 2))
plot(x, y, type = "h", lwd = 2,
        xlab = "Number of Yes", ylab = "Probability",
        main = "Probability Density Function")
plot(x, y_cum, type = "h", lwd = 2,
        xlab = "Number of Yes", ylab = "Probability",
        main = "cumulative Distribution Function")


# simulate the Poisson distribution
# and plot the probability density function
# and cumulative distribution function
# with restaurant example
# lambda = 10
options(repr.plot.width = 9, repr.plot.height = 5)
lambda = 10
x = 0:30
y = dpois(x, lambda)
y_cum = ppois(x, lambda)
par(mfrow = c(1, 2))
plot(x, y, type = "h", lwd = 2,
        xlab = "Number of Customers", ylab = "Probability",
        main = "Probability Density Function")
plot(x, y_cum, type = "h", lwd = 2,
        xlab = "Number of Customers", ylab = "Probability",
        main = "cumulative Distribution Function")

# plot gaussian distribution with different mean and sd
means = c(0, -2, 2)
sds = c(1, 2, 3)
x = seq(-10, 10, length.out = 100)
dfy = data.frame(x = x)
for (i in 1:length(means)) {
    dfy[, paste0("mean", i)] = dnorm(x, means[i], sds[i])
}
# plot the probability density function with basic R
# with different mean and sd and different color
options(repr.plot.width = 8, repr.plot.height = 5)
plot(x, dfy[, "mean1"], type = "l", lwd = 2,
        xlab = "x", ylab = "Probability",
        main = "Probability Density Function")
lines(x, dfy[, "mean2"], lwd = 2, col = "red")
lines(x, dfy[, "mean3"], lwd = 2, col = "green")
# add legend with mean and sd with different color
legend("topright", legend = paste0("mean=", means, ", sd=", sds),
        lty = 1, lwd = 2, col = c("black", "red", "green"))


######----------------- multivariate analysis -----------------######

# read the dataset
survey <- fread("survey_cleaned_unique.csv")

# now, let's do some multivariate analysis
str(survey)

# multivariate analysis is to find the relationship between
# multiple variables

# let's start with two variables
# for two variables, we have the following possibilities
# 1. categorical vs categorical
# 2. categorical vs continuous
# 3. continuous vs continuous

# NOW, let's focus on categorical vs categorical
# q1 vs q2
# q1: have you studied regression analysis before?
# q2: what kind of language do you use for data analysis?

survey %>%
    with(table(q1, q2)) %>%
    kable()

# how could we visualize the above table?
# we can use mosaicplot
# mosaicplot is a powerful package to visualize the relationship
# between multiple variables
mosaicplot(q2 ~ q1, data = survey, color = TRUE, shade = TRUE,
            main = "What kind of language do you use for data analysis?",
            xlab = "Answer", ylab = "Answer")


# you can see that data visualization could tell us a lot
# about the relationship between multiple variables
# for cases with more than 2 categorical variables
# you need to use ggplot to visualize the relationship
# we will not cover this in this course

# since our survey does not have continuous variables
# we will simulate some data to show the relationship
# by adding three variables:
# gender dummy - female 1 / male 0 
# weight - continuous
# height - continuous

females <- rep("female", 100)
males <- rep("male", 100)

# combine the above two vectors into one vector
c(females, males) %>%
    sample(nrow(survey)) -> survey$gender

str(survey)

# create dummy variable from gender
survey %>%
    .[, gender_dummy := ifelse(gender == "female", 1, 0)] %>%
    str()

# check balance of gender
survey %>%
    with(table(gender))

# generate random weight and height
# weight is normally distributed with mean 60 and sd 5 
# height is normally distributed with mean 170 and sd 5 for female
# height is normally distributed with mean 175 and sd 6 for male 
survey %>%
    .[, weight := rnorm(nrow(.), 60, 10)] %>%
    .[, height := ifelse(gender_dummy,
                            rnorm(nrow(.), 170, 5),
                            rnorm(nrow(.), 175, 6))] %>%
    str()


# now, let's do some multivariate analysis
# with one categorical and one continuous variable
# two continuous variables