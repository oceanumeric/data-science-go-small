library(MASS)

# Load the Boston housing data
data(Boston)
str(Boston)
names(Boston)

# meaning of the variables
?Boston

# plot the data
plot(Boston)

# plot median value against status
options(repr.plot.width = 8, repr.plot.height = 6)
plot(medv ~ lstat, data = Boston,
            xlab = "Lower status of the population",
            ylab = "Median value of owner-occupied homes in $1000s")

# fit a linear regression model
fit <- lm(medv ~ lstat, data = Boston)
summary(fit)

# plot the fitted model
options(repr.plot.width = 8, repr.plot.height = 6)
plot(medv ~ lstat, data = Boston,
            xlab = "Lower status of the population",
            ylab = "Median value of owner-occupied homes in $1000s")
abline(fit, col = "red")


# export to a table

# install.packages("stargazer")
library(stargazer)
stargazer(fit, type = "text")
stargazer(fit, type = "html")