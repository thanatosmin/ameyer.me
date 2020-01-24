---
layout: post
title:  "Folding our knowledge in with the data—where systems biology could be headed"
date:   2020-01-24 08:00:00
categories:
- science
tags:
- science
- modeling
- data
---

Last year in our machine learning/data analysis class, we had a bit of extra time to take a step back and return why we were there in the first place. Regardless of the method, machine learning provides us a toolbox of functions with varying amounts of flexibility and rigidness. By applying a method, we get a space of functions:

$$ f(x, \beta) $$

parameterize it with some judge of value:

$$ \arg\max_{\beta} \textrm{Value}(f(x, \beta)) $$

and are left with a function having (hopefully) useful properties:

$$ f(x, \hat{\beta}) $$

Modeling provides benefits beyond prediction, including hypothesis testing, communication, interpretation, and visualization. With these competing goals in mind we roughly organized the various methods in our toolbox:

![Our toolkit of models.](/public/images/models-plot.svg)

This helps to identify a few features of the landscape. First, our choices sit along some front of a tradeoff between explainability/interpretability and prediction performance/flexibility. This is not a new idea—much has been written about this tradeoff.

Before looking ahead, it is helpful to recognize some of the developments that have made it possible to move out in the direction of prediction/flexibility. Namely, the continued march of computational performance has worked alongside computational tools to deal with flexibly-defined, high-parameter models. This includes a resurgence in [autodifferentiation tools](http://tensorly.org/stable/index.html), [parallel/vectorized evaluation](https://www.tensorflow.org), and [probabilistic languages](https://mc-stan.org) to coordinate it all.

However, while very high parameter models[^deep] have given us accurate predictions, especially with ever-growing training data, these models are poor at extrapolation and interpretation. These two properties are _especially_ critical to understanding biological systems; measurements are essentially always data starved, and the complexities of biological systems are such that even our highest-throughput experiments do not comprehensively sample every possible intervention we could make on cells[^invivo]. In other words, we can take lots of pictures of stop signs to teach a model to identify stop signs, but we almost always build models of cells to predict things we can’t or haven’t ever measured yet. We have to be able to see into the uncharted territory. Can your model identify stop signs if it had never seen one before?

So where does extrapolation come from? It comes from the inflexibility built into the model structure we choose. For example, ordinary least squares models are quite inflexible, and their inflexibility forces predictions where each variable extrapolates based on a linear relationship. Even flexible models, while restricted by the data within the training range, rely heavily on model *inflexibility* when extrapolating to entirely new predictions. However, the rigidity we encode to date has largely been tied to making a problem numerically tractable. For example, linear assumptions are often chosen because it gives us models that we can reasonably solve, but we don't expect much of biology to be linear.

However, our new computational tools allow us to perform efficient parameterization with programs of nearly any structure. Through autodifferentiation and probabilistic languages, we can now write semi-flexible functions of essentially any structure and perform reasonably efficient parameterization. The key is flexibility where you don't have prior knowledge and rigidity where you do.

For example, [we did this in a very simple way](https://doi.org/10.1016/j.cels.2018.05.018) with our first paper on antibody responses. We expect antibodies to bind following the laws of binding kinetics. Then, without much expectation about how this binding relates to cell response, we allow a flexible statistical relationship. [Yuan *et al*](https://www.biorxiv.org/content/10.1101/746842v1) and [Ma *et al*](https://www.nature.com/articles/nmeth.4627) also use a similar idea of encoding the structural information we know (the heirarchy and dynamics of biology) into a deep learning model.

If I had to guess where machine learning will take systems biology, it is in this direction, providing a balance of flexibility and rigidity. [Neural ODEs](https://www.stochasticlifestyle.com/how-to-train-interpretable-neural-networks-that-accurately-extrapolate-from-small-data/) will lend themselves nicely to biology as a dynamic system where we have tools to measure dynamic responses and whether components interact. In fact, the authors summarize my point nicely: *scientific knowledge [should be] encoded in structure, not data points*. We will realize that the tools in our toolbox are different views of the same solution, and learn how to encode our prior knowledge in model structure as well as parameters. Finally, I think we will re-focus our efforts on how *far* a model can extrapolate, rather than how accurately it can predict.

[^deep]: Call them deep if you must.

[^invivo]: Sure, single-cell methods can provide enormous throughput, but we ultimately care about what happens in a whole organism, and often in a whole person.
