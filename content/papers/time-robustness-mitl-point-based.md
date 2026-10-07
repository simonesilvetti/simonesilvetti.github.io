---
title: "Time Robustness for Point-Based Semantics of Metric Interval Temporal Logic"
date: 2026-01-01
description: "A quantitative notion of time robustness for MITL over timestamped events, stable under small timing perturbations."
authors:
  - Simone Silvetti
  - Ivan Compagnucci
  - Francesca Cairoli
  - Catia Trubiani
  - Laura Nenzi
venue: "International Conference on Principles of Knowledge Representation and Reasoning (KR)"
pages: "589–599"
url: "https://ivancomp.github.io/assets/file/KR.pdf"
---

## The problem

Time-critical systems must satisfy constraints where correctness depends not only on the order of events, but on their precise timing. Metric Interval Temporal Logic (MITL) expresses such requirements. Robustness has been widely studied for signal-based interpretations, but much less for **point-based semantics**, where an execution is a sequence of timestamped facts. There, a tiny shift in a timestamp can flip a formula from true to false.

## The contribution

- A notion of **time robustness** for MITL over point-based semantics, read as the margin by which a temporal interpretation stays valid.
- A quantitative semantics, proven **sound** with respect to Boolean satisfaction.
- A **Lipschitz stability** property with respect to timestamp perturbations, which induces a metric notion of proximity between interpretations.
- A **polynomial-time** evaluation procedure.

## Case studies

The semantics is illustrated on drone surveillance and a smart hospital scenario, where robustness empirically correlates with tolerance to temporal noise.
