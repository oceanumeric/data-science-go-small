# import packages
# each code block is a chain of commands/thinking
{
library(data.table)
library(ggplot2)
library(knitr)
library(magrittr)
library(MASS)
}


# read in data and explore
{
data(Boston)

# convert to data.table
Boston <- data.table(Boston)
str(Boston)
# what does crim mean?
# what does zn mean? 
help(Boston)
head(Boston)
}


# univariate analysis
{
# dependent variable - medv
# what is the medv?
# it is the median value of owner-occupied homes in $1000s
# histogram
hist(Boston$medv)
# boxplot
boxplot(Boston$medv)


# independent variables
# crim
hist(Boston$crim)
boxplot(Boston$crim)
}

# bivariate analysis
{
# correlation between medv and crim
cor(Boston$medv, Boston$crim)

# scatterplot between crim and medv
plot(Boston$crim, Boston$medv)

# fiter out the outliers
# subset the data
Boston %>%
    # [i, j, by] - i: row, j: column, by: group
    # & - and
    .[crim >= 5 & crim < 30] %>% 
    .[medv <= 40] %>%
    with(plot(crim, medv))
}


# bivariate analysis
{
# correlation between medv and age
cor(Boston$medv, Boston$age)

# scatterplot between age and medv
plot(Boston$age, Boston$medv)

hist(Boston$age)
}


# bivariate analysis between medv and lstat
{
plot(Boston$lstat, Boston$medv)

hist(Boston$lstat)
}

# multivariate analysis
{
head(Boston)
# give me correlation plot
library(corrplot)
# install.packages("corrplot")
corrplot(cor(Boston))
help(Boston)
}

# quantifying the relationship
{
# develop a linear regression model
# for Mr Phil Dunphy so that he can predict the price of a house
# dependent variable - medv
# independent variables - rm, lstat, age, crim
plot(Boston$rm, Boston$medv)

# fit a linear regression model
# between medv and rm
lm.fit <- lm(medv ~ rm, data = Boston)

# summary of the model
summary(lm.fit)

# give me a good table
install.packages("stargazer")
library(stargazer)
stargazer(lm.fit, type = "text")
}

# fit regression model between medv and lstat
{
lm.fit <- lm(medv ~ lstat, data = Boston)

stargazer(lm.fit, type = "text")

# fit regression model between medv and age
lm.fit <- lm(medv ~ age, data = Boston)

stargazer(lm.fit, type = "text")
}

# age and rm
{
# two graph side by side
options(repr.plot.width = 10, repr.plot.height = 5)
par(mfrow = c(1, 2))
plot(Boston$rm, Boston$medv)
plot(Boston$age, Boston$medv)
}

# fit regression model between medv and age and age^2
{
lm.fit <- lm(medv ~ age + I(age^2), data = Boston)

# print the summary
stargazer(lm.fit, type = "text")

# want to plot the fitted line
# plot the data
plot(Boston$age, Boston$medv)
# add the fitted line
abline(lm.fit)

# plot non-linear relationship
# plot the data
# plot the data side by side
options(repr.plot.width = 10, repr.plot.height = 5)
par(mfrow = c(1, 2))
plot(Boston$age, Boston$medv)
# add the fitted line 
# set the limits of the y-axis
# ylim = c(0, 60)
plot(Boston$age, predict(lm.fit),
                col = "red", ylim = c(0, 50))
}


# put everything together
# medv = lsat + age + age^2
{
lm.fit <- lm(medv ~ lstat + age + I(age^2), data = Boston)

# print the summary
stargazer(lm.fit, type = "text")
}
