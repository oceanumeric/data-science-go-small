# Linux Basic Commands 

give me basic commands in linux and its explanation

## Basic Linux commands 

```bash
clear  # clear the console
ls  # list files
cd  # change directory

# create a new directory
mkdir <directory_name>

# create a new file
touch <file_name>

# delete a file
rm <file_name>

# delete a directory
rm -r <directory_name>

# copy a file
cp <file_name> <new_file_name>

# copy a directory
cp -r <directory_name> <new_directory_name>

# move a directory
mv <directory_name> <new_directory_name>

# move a file to a directory
mv <file_name> <directory_name>


# check running processes
top 

# check running processes
ps aux

# difference between top and ps aux ?
# top is interactive, ps aux is not interactive

# download an image from the internet
wget <image_url>
``` 

## Install R 

```bash
# update the package list
sudo apt-get update
sudo apt-get install r-base
```

## Install R packages 

```r
install.packages("data.table")
install.packages("magrittr")
install.packages("dplyr")
install.packages("knitr")
install.packages("ggplot2")
```

## disable language tool linter extension in vscode 

You do not need `LanguageTool for Visual Studio Code` extension, which is very annoying.

## Tips on using vscode

- `ctrl + shift + p` to open command palette (the most important shortcut)
- `ctrl + shift + x` to open extensions
- `ctrl + shift + b` to open build tasks
- `ctrl + shift + g` to open git
- turn off notifications by clicking the bell icon

We will learn more about vscode during the course.