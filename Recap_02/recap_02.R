# recap 02 
# linear regression with R
library(data.table)
library(MASS)
library(ISLR)
library(magrittr)
library(knitr)
library(stargazer)
# install.packages("ISLR")

# load data
data("Boston")
head(Boston)

# convert to data.table
Boston <- data.table(Boston)

head(Boston)

# medv = median value of owner-occupied homes in $1000s
# lstat = % lower status of the population
#       = % of people with lower status 
#         (lower status = lower class)
# age = proportion of owner-occupied units built prior to 1940

# understand the data one variable at a time
# plot the data
plot(Boston$medv) # continuous variable

# distribution of medv
hist(Boston$medv)

# some normality

# check lsat
plot(Boston$lstat) # continuous variable
# distribution of lstat
hist(Boston$lstat)

# log transformation
hist(log(Boston$lstat+1))

# put the above two plots together
options(repr.plot.width=10, repr.plot.height=5)
par(mfrow=c(1,2))
hist(Boston$lstat, main="lstat")
hist(log(Boston$lstat+1), main="log(lstat+1)")



# bivariate analysis
# medv vs lstat
options(repr.plot.width=7, repr.plot.height=5)
plot(Boston$medv, Boston$lstat)


# This is important! 
Boston %>%
    with(plot(medv, lstat))

# correlation
Boston %>%
    with(cor(medv, lstat))


# age
Boston %>%
    with(plot(age))

# plot(age, medv)
options(repr.plot.width=7, repr.plot.height=5)
Boston %>%
    with(plot(age, medv))

# correlation
Boston %>%
    with(cor(age, medv))


# run our first regression
# medv = b0 + b1*lstat + b2*age + e

# fit the model
lr1 <- lm(medv ~ lstat + age, data=Boston)

lr1 %>% 
    stargazer(type="text")

Boston %>%
    with(plot(age, medv))

# add age^2 to the model
lr2 <- lm(medv ~ lstat + age + I(age^2), data=Boston)

lr2 %>% 
    stargazer(type="text")


# let's plot the model
# coefficient for age = -0.045
# coefficient for age^2 = 0.001
# simulate the model

# create a sequence of age values
age_seq <- seq(min(Boston$age), max(Boston$age), length.out=100)

# create a data.frame with age_seq
df <- data.frame(age=age_seq)
df$lstat <- mean(Boston$lstat)

# predict medv
df$medv <- predict(lr2, newdata=df)

head(df)

plot(medv ~ age, data=df)

lr3 <- lm(medv ~ age + I(age^2), data=Boston)

lr3 %>% 
    stargazer(type="text")

