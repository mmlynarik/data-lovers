# K Means Clustering
Unsupervised learning algorithm that will attempt to group similar clusters together in your data.

> Goal: Divide data into distinct groups such that observations within each group are similar.

## How does K means clustering work?
1. Choose a number of Clusters "K"
2. Randomly assign each point to a cluster
3. For each cluster, compute the cluster centroid by taking the mean vector of points in the cluster.
4. Assign each data point to the cluster for which the centroid is the closest.
5. Repeat 3 and 4 until clusters stop changing.

## How to choose a K value?

### The elbow method
- compute the sum of squared error (SSE) for some values of k
- the SSE is defined as the sum of the squared distance between each member of the cluster and its centroid
- the idea of the elbow method is to choose the k at which the SSE decreases abruptly

References:
[Udemy: Python for Data Science and Machine Learning Bootcamp](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/learn/lecture/5733544?start=15#overview)