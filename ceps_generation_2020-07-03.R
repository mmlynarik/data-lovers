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
df <- select(df, -c("X"))
# Rename the column names
df <- df %>%
  rename(
    "date" = Datum,
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
df["date"] <- lapply(df["date"],
                     function(x)
                       as.POSIXct(
                         strptime(x, "%d.%m.%Y %H:%M", tz = "Europe/Prague"), format = "%Y-%m-%d %H:%M"
                       ))

# Line chart with multiple metrics
ggplot(data = df) +
  # A geom is the geometrical object that a plot uses to represent data
  geom_line(mapping = aes(x = date, y = VTE), color = "blue") +
  geom_line(mapping = aes(x = date, y = FVE), color = "red")

# Create a column with total electricity generated
df <- df %>%
  replace(is.na(.), 0) %>% mutate(total_MW = rowSums(.[2:10]))

# Plot the total electricity produced
ggplot(data = df) +
  geom_line(mapping = aes(x = date, y = total_MW), color = "blue")

# Data preparation
# Create a categorical variable for electricity generation source
categorized = df %>%
  select(date, PE, PPE, JE, VE, PVE, AE, VTE, FVE) %>%
  gather(key = "source", value = "output_MW",-date)

# Create a custom color palette
custom.col <-
  c(
    "#000000",
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#F0E442",
    "#0072B2",
    "#D55E00",
    "#CC79A7"
  )

# Simple line chart trend
ggplot(categorized, aes(x = date, y = output_MW)) +
  geom_line(aes(color = source)) +
  scale_color_manual(values = custom.col)

# Stacked bar chart
ggplot(categorized, aes(
  fill = source, y = output_MW, x = date
)) +
  geom_bar(position = "stack", stat = "identity") +
  scale_fill_manual(values = custom.col)

# 100% Stacked bar chart
ggplot(categorized, aes(
  fill = source, y = output_MW, x = date
)) +
  geom_bar(position = "fill", stat = "identity") +
  scale_fill_manual(values = custom.col)

# Calculate the  overall total
summarise(categorized, total_MW = sum(output_MW, na.rm = TRUE))

# Calculate the total output per source
# Grouped data have to be stored in a new variable in order to assign custom colors
categorized_by_source <- categorized %>%
  group_by(source) %>%
  summarise(output_MW = sum(output_MW, na.rm = TRUE))

ggplot(data = categorized_by_source) +
  geom_col(mapping = aes(x = source, y = output_MW), fill = custom.col) +
  scale_y_continuous(labels = scales::comma)

# Without the new variable this would not work as categorized is not grouped by in reality
categorized %>%
  group_by(source) %>%
  summarise(output_MW = sum(output_MW, na.rm = TRUE))

ggplot(data = categorized) +
  geom_col(mapping = aes(x = source, y = output_MW), fill = custom.col) +
  scale_y_continuous(labels = scales::comma)
