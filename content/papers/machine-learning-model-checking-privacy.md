---
title: "Is Machine Learning Model Checking Privacy Preserving?"
date: 2024-10-27
description: "Can a system be queried through learned STL kernels without revealing the system itself? A look at the privacy of ML model checking."
authors:
  - Luca Bortolussi
  - Laura Nenzi
  - Gaia Saveri
  - Simone Silvetti
venue: "International Symposium on Leveraging Applications of Formal Methods (ISoLA)"
pages: "139–155"
url: "https://doi.org/10.1007/978-3-031-75107-3_9"
---

## Background

Model checking verifies whether a system exhibits a given behaviour or property, but classic algorithms need full knowledge of the system under analysis.

**Machine learning model checking** recasts the problem as learning: a predictor is trained in a continuous latent space that captures the semantics of formulae. A kernel for Signal Temporal Logic (STL) extracts features of specifications automatically through the kernel trick. A new formula can then be verified **without access to a (generative) model of the system**, using only a set of formulae and their satisfaction values.

## The question

This suggests a potentially **privacy-preserving** method: specifications of a system could be queried without giving access to the system itself.

## This paper

The paper studies whether the approach is feasible by **quantifying the information leakage** that machine learning model checking causes about the system being checked. The analysis is carried out for STL under different training regimes.
