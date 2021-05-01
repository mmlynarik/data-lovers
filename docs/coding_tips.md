# Conditionals

It is tricky to write a condition in a way that is easy to understand to multiple people. Each person finds a different way of expressing the same thing intuitive.

I am trying to follow these rules:
- the less conditions the better  

```
AVOID: if condition_A and condition_B then ...)
DO: if condition_C then... 
```

- the less "negations" the better; True condition is easier to understand for our brains than a FALSE one 

```
AVOID: a < 0 is False
DO: a >= 0 is True
```

- avoid checking boolean variables on inverted field names 

```  
AVOID: df["is_not_holiday"] == False
DO: df["is_holiday"] == True 

AVOID: a.notnull() is False
DO: a.isnull() is True
```
