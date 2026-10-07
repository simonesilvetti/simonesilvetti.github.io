---
title: "Logic-Based Multi-Objective Design of Chemical Reaction Networks"
date: 2016-09-25
description: "Tuning the parameters of stochastic models so that several Signal Temporal Logic goals hold at once, for synthetic biology design."
authors:
  - Luca Bortolussi
  - Alberto Policriti
  - Simone Silvetti
venue: "International Workshop on Hybrid Systems Biology (HSB)"
pages: "164–178"
url: "https://doi.org/10.1007/978-3-319-47151-8_11"
---

## The problem

Designing genetic or protein networks that satisfy a set of behavioural specifications is one of the main challenges of **synthetic biology**, and model-based design is a natural choice for it.

The paper considers how to tune the parameters of a **stochastic model** so that one or more behavioural goals hold.

## The approach

The goals are specified as **Signal Temporal Logic** formulae, and the aim is a parameter set that makes their satisfaction probability as large as possible. This is a **multi-objective optimisation** problem.

It is solved with an optimisation scheme that combines satisfaction probability and the average robustness of the STL properties, using state-of-the-art multi-objective optimisation routines.
