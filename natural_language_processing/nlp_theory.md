# Natural Language Processing

A document represented as a vector of word counts is called a `Bag of Words`. You can use cosine similarity on the vectors made to determine similarity:

> sim(A,B) = cos($\theta$) = $\frac{A \times B}{||A||||B||}$

corpus = the group of all the documents

# TF-IDF
TF - IDF = term frequency - inverse document frequency

Term Frequency (TF) - importance of the term within the document. 
> TF(d,t) = number of occurrences of term t in document d

Inverse Document Frequency (IDF) - importance of the term in the corpus
> IDF(t) = log(D/t) 
 - D = total number of documents
 - t = number of documents with the term

Term `x` within document `y`
> $$W_x,_y = tx_x,_y \times log(\frac{N}{df_x})$$

$tf_x,_y$ = frequency of `x` in `y`

$df_x$ = number of documents containing `x`

N = total number of documents

References:
[Udemy - Python for Data Science and Machine Learning Bootcamp](https://www.udemy.com/course/python-for-data-science-and-machine-learning-bootcamp/learn/lecture/5733564#overview)