---
title: "A Robust Genetic Algorithm for Learning Temporal Specifications from Data"
date: 2018-08-15
description: "Mining Signal Temporal Logic requirements from good and anomalous trajectories, learning both structure and parameters."
authors:
  - Laura Nenzi
  - Simone Silvetti
  - Ezio Bartocci
  - Luca Bortolussi
venue: "International Conference on Quantitative Evaluation of Systems (QEST)"
pages: "323–338"
url: "https://doi.org/10.1007/978-3-319-99154-2_20"
preprint: "https://arxiv.org/abs/1711.06202"
---

## The problem

Mining **Signal Temporal Logic** requirements from a dataset of regular (good) and anomalous (bad) trajectories of a dynamical system. The training set is labelled by human experts, and only a limited, typically noisy, amount of data is available.

## The approach

A systematic, two-step procedure that synthesises both the **structure** and the **parameters** of the formula:

1. a novel **evolutionary algorithm** learns the structure of the formula;
2. **parameter synthesis** works on a statistical emulation of the average robustness of a candidate formula with respect to its parameters.

## Results

The method is compared with previous work and with a recent decision-tree based method, on two case studies:

- anomalous trajectory detection in a **naval surveillance** system;
- the characterisation of **ineffective respiratory effort**.
