# Tidy data
1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

> Tip: put each dataset in a tibble and each variable in a column

Try to store your data consistently as it is easier to build follow-up data transformations and visualizations. Putting the data always into the same form will make it easier for you to work with them as you will be mostly repeating the same processes over and over.

## Missing values
Explicit = flagged with `NA`
Implicit = not present in the data

You can change explicit missing values into implicit and vice versa based on the context of the data.

Structural missing values represent measurements that can't be made e.g. the count of pregnant males. (usually can be removed from the dataset)

## Data structure
**Rectangular tables** are made up of rows and columns.
A **dataset** is a collection of **values**, both qualitative or quantitative.
Every value belongs to a **variable** and an **observation**.

A **variable** contains all values that measure the same underlying attribute (like height, temperature, duration) across units.
An **observation** contains all values measured on the same unit (like a person, or a day) across attributes.

References
[Wickham Hadley: Tidy Data](../wickham_tidy_data.pdf)