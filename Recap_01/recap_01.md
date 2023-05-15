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

<center style="font-size:50pt">

# Recap 01 :butterfly:

# Watch THIS video :eyes:

# :fire: Important :fire:

</center>

---

# Recap 1 - Roadmap :butterfly:

- Manage your codespaces
- A truly __one-click__ environment :dart:
- Data exploration with R
- Linear Regression with R
- Presentation with Markdown and Marp


---

# Recap 1.1 - Manage your codespaces :woman_office_worker:

![center width:600](https://media.tenor.com/IPRetduuCSUAAAAM/that70s-show-shame.gif)


--- 

# Recap 1.1 - Manage your codespaces :woman_office_worker:

![center width:800](https://media.cdn.teamtailor.com/images/s3/teamtailor-production/gallery_picture/image_uploads/97bcb630-fb8e-4396-b093-4f31882c103a/original.gif)


---

# Recap 1.1 - Manage your codespaces :woman_office_worker:

- You can create maximum 2 codespaces in your account.
- You can only run 180 hours per month.
- Please try to use only 1 codespace for this course.
- Which one to use?
    - [DataLab-Template](https://github.com/oceanumeric/DataLab-Template)
    - I set up everything for you :blush:
      - There is no need to install anything.
      - There is no need to copy and past anything for shortcuts.
      - Easy to convert slides to pdf, pptx, html, etc.



---

# Recap 1.2 - A truly __one-click__ environment :dart:

- Make sure you have __only 1 codespace__ in your account.
- Go to [DataLab-Template](https://github.com/oceanumeric/DataLab-Template)
- Click on `Use this template` button  

&nbsp;
&nbsp;

![center width:400 Use this template](https://img.shields.io/badge/Use%20this%20template-2ea44f?style=for-the-badge&logo=github)



---

# Recap 1.2 - A truly __one-click__ environment :dart:

In this codespace, you have different kinds of files:

Do not touch these files:

- README.md
- .devcontainer
- .github
- .vscode

- some other files you can change it based on your needs.


---

# Recap 1.2 - A truly __one-click__ environment :dart:

The AI Copilot will help you to write codes only if your file ends with the following endings:

- `hello.R`
- `hello.py`
- `my_file.md`
- `my_file.html`
- ...

This kind of files such as `hello_world` will not work. 


---

# Recap 1.2 - A truly __one-click__ environment :dart:


## :fire: There is no need to rebuild your codespace :fire:



--- 

# Recap 1.2 - A truly __one-click__ environment :dart:

- It takes around 1 minute to create a new codespace.

- Once you have a new codespace, wait for extension installation to finish.

- after a while (around 1 minute), refresh the page.

- Last step before you run your code
    - setup profile


---


# Recap 1.2 - A truly __one-click__ environment :dart:

- Last step before you run your code
    - setup profile

---


# Recap 1.2 - A truly __one-click__ environment :dart:

- Last step before you run your code
    - setup profile
    - here is the link: https://gist.github.com/oceanumeric/fea3f2a9d7457b53b9346e4c0f8df4b0
    - copy and paste the code in your `import profile` section
    - reload the window
    - you are ready to go :rocket:

- When you use `Shift + Space` to run your code, it will run but you have to switch the kernel to `R` or `Python` manually.



---

# Recap 2.1 - Data exploration with R :bar_chart:

## :fire: Important one :fire:

## - Left: data-science-go-small
## - Right: DataLab-Template

---

# Recap 2.1 - Data exploration with R :bar_chart:

- We will use `data.table` package for data exploration.
- `data.table` is a package for __Big Data__.
- We will practice its syntax in this practice
  - `[i, j, by]` syntax
  - `:=` syntax
  - `.SDcols` syntax


---

# Recap 2.1 - Data exploration with R :bar_chart:

## - Download the data with `wget` command

## - Read the data with `fread` function
  - `file_path` argument is important
  - If `R` file and `data` files are in the same folder, you can use `file_name` only.

```R
library(data.table)
# copy relative path from the file
# every slash is a file separator
file_path = "data/innovation_survey/extmidp21.csv"
dt <- fread(file_path)
```

---

# Recap 2.1 - Data exploration with R :bar_chart:

- We will follow the steps we have learned in Tutorial 1.
  - univariate analysis
  - bivariate analysis
  - multivariate analysis


---

# Recap 2.1 - Data exploration with R :bar_chart:

- We will follow the steps we have learned in Tutorial 1.
  - univariate analysis
  - bivariate analysis
  - multivariate analysis

- Community Innovation Survey (CIS)
  - around 5000 enterprises in Germany :de:
  - It has lots of variables, more than 200 variables.
  - Many stories to tell :fire:

---

# Recap 2.1 - Data exploration with R :bar_chart:

## CIS - Community Innovation Survey

- Understand Innovation in Germany :de:
- Understand the role of enterprises in innovation
- Possible questions:
  - role of digitalization in innovation
  - environmental innovation

---

# Recap 2.1 - Data exploration with R :bar_chart:

## Missing values

- Missing values are very common in real life data.
- We have to deal with them.
  - sometimes it is `is.na` function could find them
  - sometimes it is `NA` value
  - sometimes it is not easy to find them
     - `""` is not missing value
     - it is treated as a 'missing value' in some cases
    


---

# Innovation Survey

- Did your firm introduce new or significantly improved products or processes in the last 3 years for: ogistics, delivery or distribution methods ?

|pzlv |      share|
|:----|---------:|
|   missing value  | 0.0834153|
|ja   | 0.1154830|
|nein | 0.8011017|

---

# Innovation Survey

- compare average number of employees for two category: introduced ...


|pzlv |      Min.|   1st Qu.|   Median|      Mean|  3rd Qu.|     Max.|
|:----|---------:|---------:|--------:|---------:|--------:|--------:|
|nein | 0.0000000|  8.081066| 21.50957|  80.67038|  77.6965| 1306.097|
|ja   | 0.5451545| 13.531381| 45.24070| 129.31504| 147.9465| 1164.163|


---

# Recap 2.2 - Linear Regression with R :chart_with_upwards_trend:

## - Simple Linear Regression
## - Multiple Linear Regression
## - Logistic Regression