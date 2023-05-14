# European Horizon 2020

European Horizon 2020 is a dataset that contains information about the projects funded by the European Union's Horizon 2020 research and innovation programme. The dataset is available at [CORDIS](https://cordis.europa.eu/). We will use the dataset to learn data science and innovation of enterprises.

The dataset is relative large, therefore we have to download it from the internet. The dataset is available in zip format. We will use `wget` command to download the dataset. We will use `unzip` command to unzip the dataset.


## Data

```bash
wget -N https://cordis.europa.eu/data/cordis-HORIZONprojects-csv.zip
wget -N https://cordis.europa.eu/data/cordis-HORIZONprojects-xml.zip
```

After downloading the dataset, we will unzip it.

```bash
unzip cordis-HORIZONprojects-csv.zip
unzip cordis-HORIZONprojects-xml.zip
```