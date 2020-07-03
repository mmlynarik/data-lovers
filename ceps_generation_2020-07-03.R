# Load .txt data into R and store them into a datafram
# Data are downloaded from https://www.ceps.cz/cs/data#Generation

# library("readxl")
# I tried to use the xls file for the dataframe creation but could not figure it out
# l <- read_excel("sample_datasets/ceps_generation_2020-07-03.xls")
# df <- data.frame(matrix(unlist(l), nrow=length(l), byrow=T))

library(tidyverse)

# Data Documentation
"
Verze dat;Od;Do;Agregační funkce;Agregace;Typ výrobního zařízení;
reálná data;03.07.2020 00:00:00;03.07.2020 23:59:59;agregace průměr;15 minut;Vše;
"

raw <- read.delim(
  "sample_datasets/ceps_generation_2020-07-03.txt",
  header = TRUE,
  sep = ";"
)
typeof(raw)

df <- as.data.frame(raw)
# Check the column names of the data frame
colnames(df)
# Check the data type of the variable
typeof(df)
# Remove the X column from the data frame
df <- select(df,-c("X"))


