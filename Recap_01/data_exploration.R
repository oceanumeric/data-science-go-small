# data exploraiton with data.table
library(data.table)
library(magrittr)
library(knitr)


# read data
survey <- fread("../data/innovation_survey/extmidp21.csv")

str(survey)

# univariate analysis
# bges18 , bges

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


# [i, j, by]
survey %>%
    .[10:15, c('bges18', 'bges')] %>%
    kable()

# [i, j, by] works for big data


