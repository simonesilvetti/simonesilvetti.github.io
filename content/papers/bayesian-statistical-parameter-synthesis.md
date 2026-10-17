---
title: "Bayesian Statistical Parameter Synthesis for Linear Temporal Properties of Stochastic Models"
date: 2018-04-14
description: "Finding the parameter regions where a stochastic model satisfies a temporal property, with statistical guarantees, via Gaussian Processes and active learning."
authors:
  - Luca Bortolussi
  - Simone Silvetti
venue: "International Conference on Tools and Algorithms for the Construction and Analysis of Systems (TACAS)"
pages: "396–413"
url: "https://doi.org/10.1007/978-3-319-89963-3_23"
preprint: "https://hdl.handle.net/11368/2931397"
---

## The problem

**Parameter synthesis** for stochastic models: finding the regions of the parameter space where a model satisfies a linear time specification with probability above (or below) a given threshold. It is a key problem for the model-based design of complex systems.

## The approach

A statistical approach based on simulation, which builds on **Smoothed Model Checking**: a machine learning method based on Gaussian Processes for statistical parametric verification. Adding ideas from **active learning** gives an efficient synthesis routine that identifies the target regions **with statistical guarantees**.

## Results

The approach, implemented in Python, scales better than existing ones with respect to the size of the model's state space and the number of parameters. It applies to linear time specifications with time constraints and to stochastic models more complex than Markov chains.
