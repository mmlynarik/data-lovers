K Nearest Neighbors (KNN) is a classification algorithm 

# Training algorithm
- store all the data

# Prediction algorithm
1. Calculate the distance from x to all points in your data
2. Sort the points in your data by increasing distance from x
3. Predict the majority label of the "k" closest points

> Choosing a K will affect what class a new point is assigned to

# Pros
- very simple
- training is trivial (entire dataset)
- works with any number of classes
- easy to add more data
- few parameters (K, distance metric)

# Cons
- high prediction cost (worse performance on large data sets)
- not good with high dimensional data
- categorical features don't work well

# References
[Python for Data Science and Machine Learning Bootcamp](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/learn/lecture/5733472?start=0#overview)

