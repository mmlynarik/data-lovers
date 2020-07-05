# Tree-Based Methods

Prediction algorithm (regression and classification methods).

Nodes split for the value of a certain attribute.
Edges are outcomes of a split to next node.
Root is the node that performs the first split.
Leaves are the terminal nodes that predict the outcome.

## Information gain
The information gain measures how good the split is.

The entropy is a measure of uncertainty associated with our data.
If you have a collection of data points, the entropy will be large when they are evenly distributed across the classes and small when they are mostly the same class. If a split on your tree equally divides your data with a 50% probability, you have the highest possibly entropy. (even distribution)

Information gain is the original Entropy of the data before the split minus the sum of the weighted split entropy values.

## Ensemble classifier
Ensemble method - combining multiple machine learning algorithms to obtain better predictive performance
Using multiple models on the data with aggregated predictions might be better than a single model alone.

Overfitting is a modelling error that occurs when a function is too closely fit to a limited set of data points.

Bootstrapping - randomly drawing a sub sample from your original list with replacement

## Random forest 
- random selection of the attribute to split on
- ensemble method, collection of Decision trees
- repeated selection of data from the data set with replacement to build a Decision tree with each new sample

## Decision tree Pros
- easy to interpret
- can handle missing values and outliers
- can handle discrete and continuous data types
- can handle irrelevant features
- computationally cheap for prediction

## Decision tree Cons
- very easy to overfit
- computationally expensive for training


# References
[A quick guide to decision trees and random forests by Jose Marcial Portilla](https://towardsdatascience.com/enchanted-random-forest-b08d418cb411#.hh7n1co54)
An Introduction to Statistical Learning - Chapter 8