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


# Recap 2.2 :butterfly:

## Linear Regression with R


---

# Linear Regression: case studies

- We will use `Boston` and `Carseats` datasets for this practice.
- Purpose: study the __effects of different variables on__ sales of car seats / house prices in Boston.

<div class="columns">
<div>

- __Different variables__:
    - qualitative variables
    - quantitative variables
    - interaction variables
    - dummy variables /categorical variables
    - continuous variables
    - etc.
</div>
<div>

- __Framework__:
    - Univariant Analysis (one variable) - distribution
    - Bivariant Analysis (two variables) - correlation/association(contingency table)
    - Multivariant Analysis (more than two variables) - regression
</div>
<div>


---

# Linear Regression: Boston dataset

- Boston dataset is available in `MASS` package.
- We found there is negative correlation between `lstat` and `medv`.
- We also found there is negative correlation between `age` and `medv`.
  - The older the houses the lower the price.
  - The higher share of lower status of the population the lower the price.

- What about the specific effects of `lstat` and `age` on `medv`?


---

# Linear Regression: Nonlinear relationship with squared term

- x: `age`

$$
\begin{aligned}
y & = 5+  0.035 \times x  + \epsilon \\ 
y & = 5  -0.045  \times x + 0.001 x^2 + \epsilon
\end{aligned}
$$


- age = 10

$$
y = 5 + 0.035 \times 10 + \epsilon = 5.35 + \epsilon
$$

$$
y = 5 - 0.045 \times 10 + 0.001 \times 10^2 + \epsilon = 4.55 + \epsilon
$$

- age = 100

$$
y = 5 + 0.035 \times 100 + \epsilon = 8.5 + \epsilon
$$

$$
y = 5 - 0.045 \times 100 + 0.001 \times 100^2 + \epsilon = 0.55 + \epsilon
$$


---

# give me a markdown table with 3 columns and 2 rows


| dependent variable | independent variable 1 | independent variable2 | independent variable3 |
|---|---|---|---|
| mdev | lstat |  | |
| mdev | age |  | |
| mdev | age | age^2 | |
| mdev | lstat | age | |
| mdev | lstat | age | age^2 |

