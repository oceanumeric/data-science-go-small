---
marp: true
theme: gradient
size: 16:9
paginate: true
---


# Making presentations with Marp and AI


Fei Wang (Michael) :heart: AI 
Goethe University Frankfurt
08-May-2023


:star: :relaxed:

---

# Motivations


- I found it very convenient to make presentations with Marp
- It is easy to present in an online meeting
- You can use AI to make your presentation more effectively and efficiently


---

# Roadmap of this video

- What is Marp?
- How to use Marp?
- How to use AI to make your presentation more effectively and efficiently?
- How to convert your presentation to PPT, PDF and HTML?
    - PPT: Microsoft PowerPoint
        - many people use it
    - PDF: present it more professionally


---

# What is Marp?

- Marp is a markdown presentation tool

```markdown
---
marp: true
theme: default
size: 16:9
---
```

- How about themes?
    - we do not have so many themes like PowerPoint
    - it is free and open source
    - you can make your own theme

- Use an open source theme



---

# How to change themes?

- Graident theme

```url
https://raw.githubusercontent.com/rnd195/marp-community-themes/live/themes/gradient.css
```

- Paste it to your settings of Vscode 

    1. Open Settings in VSCode (Ctrl + ,)
    2. Search for markdown.marp.themes
    3. Add a URL or a local path to the .css file


---

- Change the settings of your markdown file

```markdown
---
marp: true
theme: gradient
size: 16:9
paginate: true
---
```


---

# How to convert your presentation to PPT, PDF and HTML?

- This step is very useful if you want to present your slides in a conference or a meeting

- You can convert your slides to PPT, PDF and HTML
- Follow instructions on the website of Marp-cli

```url
https://github.com/marp-team/marp-cli
```

---

# Install Docker and use it to convert your slides

- Codespaces has a built-in Docker environment, so you don't need to install Docker on your computer.
- What is docker?
    - Docker is a tool designed to make it easier to create, deploy, and run applications by using containers.
    - Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.

---


- Pull the docker image of Marp-cli

```bash
docker pull marpteam/marp-cli
```

- Convert slide deck into PDF

```bash
 docker run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli practice_02/p02_slides.md --pdf  --theme ./the
mes/gradient.css
```
- Structure of the command
    - `docker run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG marpteam/marp-cli`
    - `practice_02/p02_slides.md`
    - `--pdf`
    - `--theme ./themes/gradient.css`

--- 

- The structure of the folder

```bash
. current folder
├── practice_01
│   ├── p01.R
│   └── p01_slides.md
├── practice_02
│   ├── p02_slides.html
│   ├── p02_slides.md
│   └── p02_slides.pdf
└── themes
    └── gradient.css
```

