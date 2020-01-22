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

Last year in our machine learning/data analysis class, we had a bit of extra time to take a step back and return why we were there in the first place. Regardless of the method, machine learning provides us a toolbox of functions with varying amounts of flexibility and rigidness. By applying a method, we take this flexible space of functions:

$$ f(x, \beta) $$

Parameterize it with some judge of value:

$$ \arg\max_{\beta} \textrm{Value}(f(x, \beta)) $$

and are left with a single function we hope has useful properties:

$$ f(x, \hat{\beta}) $$

Nearly any modeling structure provides benefits beyond prediction, including hypothesis testing, communication, interpretation, and visualization. It is with these competing goals in mind that we can roughly organize the various methods in our toolbox:


![Our toolkit of models.](/public/images/models-plot.svg)


This helps to identify a few features of the landscape. First, our choices sit along some barrier of a tradeoff between explainability/interpretability and prediction performance/flexibility. This is not a new idea—much has been written about this tradeoff. 




Before looking ahead, it is helpful to recognize some of the developments that have made it possible to move out in the direction of prediction/flexibility. Namely, the continued march of computational performance has worked alongside computational tools to deal with flexible/high-parameter models. This includes a resurgence in autodifferentiation tools, parallel evaluation, and probabilistic languages to coordinate it all.


However, while flexible models have given us accurate predictions, especially with ever-growing training data, these models are poor at extrapolation and interpretation. These two properties are especially critical to understanding biological systems; measurements are essentially always data starved, and the complexities of biological systems are such that even our highest-throughput experiments do not comprehensively sample every possible intervention we could make on cells. In other words, we can take lots of pictures of stop signs to teach a model to identify stop signs, but we almost always build models of cells to predict things we can’t or haven’t ever measured yet. We have to be able to see into the uncharted territory.


So where does extrapolation come from? It comes from the inflexibility built into the model structure we choose. For example, XXXX. Flexible models, while restricted by the data within the training range, rely heavilty on model inflexbility when extrapolating to entirely new predictions. Our new computational tools can help lead us here, too. We have, to date, made specific assumptions about the structure of data problems because they provide us with computationally tractable numerical methods. For example, linear assumptions often give us models that we can reasonably solve, but we don't expect much of biology to be linear. However, our new computational tools allow us to perform efficient parameterization with programs of nearly any structure. Through autodifferentiation and probabilistic languages, we can now write semi-flexible functions of essentially any structure, and perform reasonably efficient parameterization. The key is flexbility where you don't have prior knowledge as to the structure, and rigidity where you do.



For example, we did this in a very simple way with our first paper on antibody responses. We expect antibodies to bind following the laws of binding kinetics. Then, without much expectation about how this binding relates to cell response, we allow a flexible statistical relationship. [This paper](https://www.biorxiv.org/content/10.1101/746842v1) comes from the other end of the complexity scale, but begins to build on the same concept. They show similarly that dynamical models can now be treated as our flexible \[f(x, \beta)\]. This structure is exciting, and the authors apply a constraint that their model come to a steady-state. However, one could now regularize the interactions of their dynamical model using interactome measurements. One can further enforce sparsity through regularization of the model parameters. This structure might be particularly exciting to characterize oscillatory behavior, where one could apply constraints on observing oscillatory behavior. These are just like the constraints of our simpler models, but tailored to the problem at hand.


