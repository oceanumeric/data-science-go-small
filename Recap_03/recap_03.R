# data exploraiton with data.table
library(data.table)
library(magrittr)
library(knitr)
library(ggplot2)


# read data

file_path <- "../data/innovation_survey/extmidp21.csv"
survey <- fread(file_path)

str(survey)

# branche - industry
{
translation = c("Transport/Post", "Water/Disposal/Recycling", "Metal production/processing",
                "Furniture/Toys/Medical technology/Repair", "Business services",
                "Business consulting/Advertising", "Technical/R&D services",
                "Electrical industry", "Media services", "IT/Telecommunications",
                "Food/Beverages/Tobacco", "Mechanical engineering", "Energy/Mining/Petroleum",
                "Financial services", "Textile/Apparel/Leather", "Wholesale", "Chemical/Pharmaceutical",
                "Wood/Paper", "Rubber/Plastic processing", "Vehicle manufacturing",
                "Glass/Ceramics/Stoneware")
survey %>%
    .[, .(branche)] %>%
    # summarize the frequency of each category
    table() %>%
    as.data.table() %>%
    .[order(-N)] %>%
    # add translation of branche
    .[, industry := translation] %>%
    # plot the bar chart
    ggplot(aes(x = reorder(industry, N), y = N)) +
    geom_bar(stat = "identity") +
    coord_flip() +
    labs(x = "Industry", y = "Frequency", title = "Industry of the firms") +
    theme_bw() +
    theme(plot.title = element_text(hjust = 0.5)) + 
    theme(axis.text.y = element_text(size = 8))
}


# bran_4 - big category of industry
{
survey %>%
    .[, .(bran_4)] %>%
    table() %>%
    as.data.table()
}