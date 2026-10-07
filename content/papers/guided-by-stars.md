---
title: "Guided by Stars: Interpretable Concept Learning Over Time Series via Temporal Logic Semantics"
date: 2025-11-06
description: "STELLE: a neuro-symbolic time series classifier whose predictions come with human-readable temporal logic explanations."
authors:
  - Irene Ferfoglia
  - Simone Silvetti
  - Gaia Saveri
  - Laura Nenzi
  - Luca Bortolussi
venue: "arXiv preprint arXiv:2511.04244"
url: "https://arxiv.org/abs/2511.04244"
---

## The problem

Time series classification often matters in safety-critical applications, yet it is usually tackled with black-box deep learning models whose decisions are hard for people to understand.

## The approach

**STELLE** (Signal Temporal logic Embedding for Logically-grounded Learning and Explanation) is a neuro-symbolic framework that unifies classification and explanation. Trajectories are embedded directly into a space of temporal logic concepts through a new STL-inspired kernel, which measures how well a raw time series aligns with a set of predefined STL formulae.

The model optimises accuracy and interpretability together, producing:

1. **local explanations**: human-readable STL conditions that justify each prediction;
2. **global explanations**: formulae that characterise each class.

## Results

Experiments on diverse real-world benchmarks show competitive accuracy together with logically faithful explanations.
