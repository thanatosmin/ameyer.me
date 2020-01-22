---
layout: post
title:  "Folding theory in with the data—where systems biology could be headed"
date:   2020-01-21 11:00:00
categories:
- science
tags:
- science
- modeling
- systems biology
- data
---

Last year in our machine learning/data analysis class, we had a bit of extra time to take a step back and return why we were really there in the first place. Regardless of the method, machine learning provides us a toolbox of functions with varying amounts of flexibility and rigidness. By applying a method, we take this flexible space of functions:

$$ f(x, \beta) $$

Parameterize it with some judge of value:

$$ \arg\max_{\beta} \textrm{Value}(f(x, \beta)) $$

and are left with a single function we hope has useful properties:

$$ f(x, \hat{\beta}) $$

As we start with in the course, nearly any modeling structure provides benefits beyond prediction, including hypothesis testing, communication, interpretation, and visualization. It is with these competing goals in mind that we can roughly organize the various methods in our toolbox:
