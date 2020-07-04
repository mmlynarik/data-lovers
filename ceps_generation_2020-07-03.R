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

Celková brutto výroba elektřiny v rámci elektrizační soustavy v členění podle jednotlivých typů elektráren
(
parní - PE,
plynové a paroplynové - PPE,
jaderné - JE,
vodní - VE,
přečerpávací vodní - PVE,
alternativní - AE,
závodní - ZE,
fotovoltaická FVE
a větrné elektrárny VTE
).

Poznámka: Kategorie závodní elektrárny (ZE) byla zrušena od 9. října 2014.
Data výroby byla rozdělena do ostatních stávajících kategorií podle příslušného typu výroby.

Zobrazená data jsou vždy patnácti minutové průměry [MW] získané z okamžitých hodnot výroby na svorkách generátorů,
které jsou dostupné v řídícím systému ČEPS. Hodnoty výroby FVE jsou odhady celkové výroby.
Při agregaci „Hodina“ je průměrný výkon roven energii [MWh].
"

raw <- read.delim(
  "sample_datasets/ceps_generation_2020-07-03.txt",
  header = TRUE,
  sep = ";"
)

# Copy the raw data into a new variable to create a checkpoint to return to if needed
df <- as.data.frame(raw)
# Check the column names of the data frame
colnames(df)
# Remove the X column from the data frame
df <- select(df,-c("X"))
# Rename the column names
df <- df %>%
  rename(
    "Date" = Datum,
    "PE" = PE..MW.,
    "PPE" = PPE..MW.,
    "JE" = JE..MW.,
    "VE" = VE..MW.,
    "PVE" = PVE..MW.,
    "AE" = AE..MW.,
    "ZE" = ZE..MW.,
    "VTE" = VTE..MW.,
    "FVE" = FVE..MW.
  )
# Check the data type of the variables within the data frame
sapply(df, class)

# Convert the Date column from type character into type POSIXct
df["Date"] <- lapply(df["Date"],
                     function(x)
                       as.POSIXct(
                         strptime(x, "%d.%m.%Y %H:%M", tz = "Europe/Prague"), format = "%Y-%m-%d %H:%M"
                       ))


ggplot(data = df) +
  # A geom is the geometrical object that a plot uses to represent data
  geom_smooth(mapping = aes(x = Date, y = VTE), color = "blue")

ggplot(data = df) +
  geom_point(mapping = aes(x = Date, y = FVE))
