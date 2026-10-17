---
title: "Bayesian Statistical Parametric Verification and Synthesis by Machine Learning"
date: 2018-12-09
description: "A tutorial on using Gaussian Processes to estimate satisfaction probabilities of stochastic models as a function of their parameters."
authors:
  - Luca Bortolussi
  - Guido Sanguinetti
  - Simone Silvetti
venue: "Winter Simulation Conference (WSC)"
pages: "381–394"
url: "https://doi.org/10.1109/WSC.2018.8632443"
---

## The problem

**Parametric verification** of stochastic models: estimating the probability that a linear time property holds, as a function of model or property parameters.

## The approach

The method relies on **Bayesian machine learning with Gaussian Processes**. Under mild continuity conditions, property satisfaction is a smooth function of the parameters. Gaussian Processes capture this smoothness and give more accurate estimates of satisfaction probabilities by **transferring information across the parameter space**.

The approach has been used to solve several tasks efficiently:

- parameter synthesis;
- system design;
- counterexample generation;
- requirement synthesis.

## This paper

A tutorial that introduces the basic ideas of the approach and gives an overview of its different applications.
