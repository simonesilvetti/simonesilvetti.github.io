---
title: "Combining Machine Learning and Formal Methods for Complex Systems Design"
date: 2018-09-28
description: "My PhD thesis: machine learning, active learning and optimisation to address the limits of temporal logics and model checking."
authors:
  - Simone Silvetti
venue: "PhD thesis, University of Udine"
url: "https://tesidottorato.depositolegale.it/handle/20.500.14242/178502"
---

## Context

Over the last twenty years, **model-based design** has become standard practice in fields such as automotive, aerospace engineering, and systems and synthetic biology. Formal methods, like temporal logics and model checking, allow a precise description and automatic verification of a prototype's requirements.

The rise of cyber-physical systems pushes complexity further and opens new challenges:

1. standard temporal logics cannot express every kind of requirement designers need, for example **non-functional requirements**;
2. standard model checking cannot cope with this level of complexity, because of the **state space explosion**.

## Contributions

The thesis uses machine learning, active learning and optimisation to address these challenges:

- **Signal measure logic**, a new temporal logic suited to non-functional requirements (see also [Signal Convolution Logic](/papers/signal-convolution-logic));
- evolutionary algorithms and Signal Temporal Logic for a **supervised classification** problem (see [A robust genetic algorithm](/papers/robust-genetic-algorithm-temporal-specifications));
- a **system design** problem with multiple conflicting requirements (see [Logic-based multi-objective design](/papers/multi-objective-design-chemical-reaction-networks));
- **active learning** based on Gaussian Processes for **falsification** problems in the automotive field (see [An active learning approach to falsification](/papers/active-learning-falsification-black-box-cps));
- a **threshold synthesis** problem, with an epidemics case study (see [Bayesian statistical parameter synthesis](/papers/bayesian-statistical-parameter-synthesis)).
