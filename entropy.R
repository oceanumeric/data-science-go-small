# R script to calculate entropy of a given sequence

# variable and value assignment
x <- 1
log(x)

# 1 - hello
# create a vector of 5 elements, all 1
data_vector0 <- rep(1, 5)
print(data_vector0)
sum(log(data_vector0))

# add new element to the vector
data_vector1 <- c(1, 2, 1, 1, 1)
print(data_vector1)
print(length(data_vector1))
sum(log(data_vector1))

# add more elements to the vector
data_vector2 <- c(1, 2, 3, 4, 5)
print(data_vector2)
print(length(data_vector2))
sum(log(data_vector2))

# example with five same values that are less than 1
data_vector3 <- c(0.1, 0.1, 0.1, 0.1, 0.1)
print(data_vector3)
print(length(data_vector3))
sum(log(data_vector3))

# change one value in data_vector3 to 0.3 and create a new vector
data_vector4 <- c(0.1, 0.1, 0.1, 0.1, 0.3)
print(data_vector4)
print(length(data_vector4))
sum(log(data_vector4))

# another example with five values less than 1
data_vector5 <- c(0.1, 0.2, 0.3, 0.4, 0.5)
print(data_vector5)
print(length(data_vector5))
sum(log(data_vector5))

