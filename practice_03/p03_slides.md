---
marp: true
theme: beam
size: 16:9
paginate: true
header: 'Michael Wang (Goethe University Frankfurt)'
footer: 'AI with :heart: 08-May-2023'
---

<!-- _class: title -->

# Academic Presentation with AI and Marp <br> see how future looks like 

&nbsp;
&nbsp;

Michael Wang :heart: AI
Goethe University Frankfurt
08-May-2023


--- 

# Table of Contents

1. [Using math in the presentation](#using-math-in-the-presentation)
2. [Using tables in the presentation](#using-tables-in-the-presentation)
3. [Using images in the presentation](#using-images-in-the-presentation)
4. [Using code in the presentation](#using-code-in-the-presentation)
5. [References](#references)



---

# Using math in the presentation

- The normal distribution is a continuous probability distribution that is symmetrical on both sides of the mean, so the right side of the center is a mirror image of the left side.

$$
f(x) = \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{1}{2} (\frac{x-\mu}{\sigma})^2}
$$

- Inline math: $f(x) = ax + b$

---

# Using math in the presentation

- A matrix is a rectangular array of numbers or other mathematical objects for which operations such as addition and multiplication are defined.

&nbsp;

$$
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix} \times \begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix} = \begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
$$


--- 

# Using tables in the presentation



| col_1 | col_2 | col_3 | col_4 | col_5 |
| ----- | ----- | ----- | ----- | ----- |
| 1     | 2     | 3     | 4     | 5     |
| 6     | 7     | 8     | 9     | 10    |
| 11    | 12    | 13    | 14    | 15    |
| 16    | 17    | 18    | 19    | 20    |
| 21    | 22    | 23    | 24    | 25    |


---

# Using images in the presentation

- image in the center 

![center right:40% 80%](https://www.python.org/static/community_logos/python-logo-master-v3-TM.png)

- another one left aligned with R logo

![center w:20% h:200](https://www.r-project.org/logo/Rlogo.png)


---

# Using code in the presentation

- Python code

```python
import numpy as np
import matplotlib.pyplot as plt

print('Hello World!')
```

- R code

```r
library(ggplot2)
library(data.table)

print('Hello World!')
```


--- 

# Convert to PDF or PPT

- Convert to PDF


```bash
 docker \
    run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG \
    marpteam/marp-cli \
    practice_03/p03_slides.md --pdf \
    --theme ./themes/beam.css
```

- Convert to PPT

```bash
 docker \
    run --rm -v $PWD:/home/marp/app/ -e LANG=$LANG \
    marpteam/marp-cli practice_03/p03_slides.md --pptx \
    --theme ./themes/beam.css
```


--- 

# References


1. [Marp](https://marpit.marp.app/)
2. [Marp Theme](https://rnd195.github.io/marp-community-themes/)
3. [Marp CLI](https://github.com/marp-team/marp-cli)
4. [Marp Docker](https://hub.docker.com/r/marpteam/marp-cli/)
5. [Marp Instruction](https://www.mma.club.uec.ac.jp/~terry/posts/auto-marp-pdf/)
6. [Latex style with Vscode](https://goessner.github.io/mdmath/publication.html#2-editor-math-extension-and-configuration)
7. [Latex css](https://latex.vercel.app/)

8. Blei, D. M., Ng, A. Y., & Jordan, M. I. (2003). Latent dirichlet allocation. Journal of machine Learning research, 3(Jan), 993-1022.



