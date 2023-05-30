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

# before we model
# medv ~ lstat + age
# medv ~ lstat + age + age^2
# we should focus on age and age^2

lr2 <- lm(medv ~ age + I(age^2), data=Boston)

lr2 %>% 
    stargazer(type="text")

# plot the model
Boston %>%
    with(plot(age, medv))

# simulate the model

age_sim <- seq(0, 100, 1)
age_sim2 <- age_sim^2

# create a data frame
sim_data <- data.frame(age_sim, age_sim2)

# predict
names(sim_data) <- c("age", "I(age^2)")

pred <- predict(lr2, newdata=sim_data)

# plot the original data
plot(Boston$age, Boston$medv)
# add the predicted values
lines(age_sim, pred, col="red", lwd=2)


# the other interesting thing is that
# when we add lstat to the model
# the coefficient of age and age^2 changes
# this is called confounding
# why?
# because age and lstat are correlated
# and we are trying to explain medv
# with age and lstat
# but age and lstat are correlated
# so we cannot tell which one is the real driver

cor(Boston$age, Boston$lstat)

plot(Boston$age, Boston$lstat)

# we need to check the correlation between
# the independent variables
# this is called multicollinearity

