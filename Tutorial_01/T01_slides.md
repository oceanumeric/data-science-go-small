---
marp: true
theme: gradient
size: 16:9
paginate: true
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
---

# Institutions and Innovation

## Tutorial 01 - Statistics Review

Prof. Dr. Cornelia Storz
Fei Wang (Michael) :heart: AI
Goehte University Frankfurt
Summer Semester 2023


---

# Roadmap of this tutorial

#### 1.  [Introduction to `data.table`](#1-introduction-to-datatable)
#### 2.  [Univariate Statistics](#2-univariate-statistics)
#### 3.  [Bivariate Statistics](#3-bivariate-statistics)
#### 4.  [Multivariate Statistics](#4-multivariate-statistics)
#### 5.  [Regression Analysis](#5-regression-analysis)
#### 6.  [Summary](#6-summary)


---

# 1. Introduction to `data.table` 


---

# 1.1. What is `data.table`?

- `data.table` is a package in R that provides an enhanced version of data.frame. It is widely used for fast aggregation of large datasets, low latency add/update/remove of columns, quicker ordered joins, and a fast file reader. `data.table` is an extension of `data.frame` package in R. 
- check benchmark: https://h2oai.github.io/db-benchmark/
    - 100 GB data
    - 155 seconds
    - out of memory for `Pandas`


---

# In-class Lab 1.1 :butterfly:

![center width:900](../images/survey-table.png)


---

# In-class Lab 1.1 :butterfly:

![center width:900](../images/survey-viz.png)


---

# In-class Lab 1.1 :butterfly:

```r
# library
library(data.table)

# read the dataset from url
# url: https://shorturl.at/eixVX
csv_url <- "https://shorturl.at/eixVX"
survey <- fread(csv_url)

# check the data
str(survey)
head(survey)
summary(survey)
```


---

# 2. Univariate Statistics


--- 

# 2.1. What is Univariate Statistics?

- Univariate analysis is the simplest form of analyzing data. <mark>“Uni” means “one”</mark>, so in other words your data has only one variable. It doesn’t deal with causes or relationships (unlike regression) and it’s major purpose is to describe; It takes data, summarizes that data and finds patterns in the data.

- Methods:
    - Discrete data: frequency table, bar chart, pie chart
    - Continuous data: histogram, box plot, summary statistics


---

# 2.2. Discrete Data


<div class="columns">
<div>

For discrete data, we can use 
- frequency table
- bar chart
- pie chart to visualize the data.


</div>
<div>

|q1  |  N|
|:---|--:|
|no  |  6|
|yes | 16|

</div>
</div>

--- 


# 2.2.1. Bar plot

![bg right:45% 55% width:500](../images/t01-q1-bar-plot.png)


```r
# use basic R function to get the frequency table
survey %>%
    with(table(q1)) %>%
    kable()

# using prop.table function to get the percentage
survey %>%
    with(table(q1)) %>%
    prop.table() %>%
    kable()

options(repr.plot.width = 8, repr.plot.height = 5)
survey %>%
    with(table(q1)) %>%
    barplot(main = "Did you study the regression analysis before?",
            xlab = "Answer",
            ylab = "Count",
            col = "lightblue")
```


---

# 3. Bivariate Statistics


---

# 4. Multivariate Statistics


---

# 5. Regression Analysis


---

# 6. Summary
