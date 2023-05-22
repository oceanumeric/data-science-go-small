# data exploraiton with data.table
library(data.table)
library(magrittr)
library(knitr)
library(ggplot2)


# read data

file_path <- "../data/innovation_survey/extmidp21.csv"
survey <- fread(file_path)

str(survey)

# univariate analysis
# bges18 , bges
# average number of employees

survey %>%
    #[i, j, by]
    .[, c('bges18', 'bges')] %>%
    #[i, j, by]
    # sample, sample rows
    #.N : number of rows, 5083 rows
    .[sample(.N, 5)] %>%
    kable()



survey %>%
    #[i, j, by]
    .[, c('bges')] %>%
    # get the summary of the data
    summary() %>%
    kable()

survey %>%
    # do something with the data
    #[i, j, by]
    .[, c('bges')] %>% 
    # transform the data with log
    log() %>%
    # plot the histogram
    # for continuous variables
    # with: with the data
    with(hist(bges, breaks = 10))
    # histogram is very skewed
    # we could use log transformation
    # to make it more normal


# another variable
names(survey)

# pzlv
# Logistical procedures, delivery/distribution methods.
survey %>%
    .[, c('pzlv')] %>%
    # give me the table of categorical variables
    # but showing share of each category
    with(table(pzlv)) %>%
    prop.table() %>%
    kable()


# Bivariate analysis
# pzlv - bges
# firms who introduced innovation
# in logistics/distribution
# having more employees or less employees
# or same number of employees
# maybe only big firms can afford to introduce
# innovation in logistics/distribution

survey %>%
    # [i, select columns, by]
    .[, c('pzlv', 'bges')] %>%
    # bges is continuous
    # pzlv is categorical
    # we want to see the average number of employees
    # for each category of pzlv
    # filter out missing values
    #[i-filter, j-select, by-group]
    .[pzlv != ''] %>%
    # [i, j, by a group (categorical variable)]
    .[, mean(bges), by = pzlv]

# compare distribution of bges
# for firms who introduced innovation
# in logistics/distribution

survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>% 
    #[i-column filter, j-operation columns, by]
    .[, as.list(summary(bges)), by = pzlv] %>%
    kable()

# do boxplot for bges
# for each category of pzlv
# boxplot is a good way to compare distributions

options(repr.plot.width = 8, repr.plot.height = 6)
survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>%
    # [i, j, by] 
    .[bges <= 600] %>%
    # boxplot with basic r function
    boxplot(bges ~ pzlv, data = .)


# compare histograms of bges for each category of pzlv
# histogram is a good way to compare distributions

options(repr.plot.width = 8, repr.plot.height = 6)
survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>%
    # histogram with ggplot2
    # histogram with ggplot2
    ggplot(aes(x = log(bges))) +
    geom_histogram(bins = 30, alpha = 0.5) + 
    facet_wrap(~ pzlv, ncol = 2) 
    # add 


options(repr.plot.width = 8, repr.plot.height = 6)
survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>%
    # histogram with ggplot2
    # histogram with ggplot2
    ggplot(aes(x = log(bges))) +
    geom_histogram(aes(y = ..density..), ybins = 30, alpha = 0.5) + 
    facet_wrap(~ pzlv, ncol = 2) 
    # add 



# log transformation always plus 1 
# to avoid log(0) = -Inf
x <- seq(0, 6, length = 1000)
survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>%
    with(hist(log(1+survey$bges), breaks = 30, freq = FALSE,
                main = "Density of bges for all firms"))

curve(dnorm(x, mean = mean(log(1+survey$bges)), sd = sd(log(1+survey$bges))), 
      add = TRUE, col = "red", lwd = 2)

# plot the histogram of bges for each category of pzlv
# with density
# with log transformation

options(repr.plot.width = 8, repr.plot.height = 6)
survey %>%
    .[, c('pzlv', 'bges')] %>%
    .[pzlv != ''] %>%
    # histogram with ggplot2
    # histogram with ggplot2
    ggplot(aes(x = log(1+bges))) +
    geom_histogram(aes(y = ..density..), ybins = 30, alpha = 0.5) + 
    facet_wrap(~ pzlv, ncol = 2) +
    geom_density(alpha = 0.5) +
    geom_vline(aes(xintercept = mean(log(1+bges)), color = pzlv), 
               linetype = "dashed", size = 1) +
    scale_color_manual(values = c("red", "blue", "green", "orange", "purple")) +
    theme(legend.position = "none")



