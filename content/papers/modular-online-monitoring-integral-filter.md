---
title: "Modular and Online Monitoring of Temporal Logic Specification with Integral and Filter"
date: 2025-09-12
description: "Extending an STL-based specification language with sliding-window integrals and filters, plus an efficient online monitor."
authors:
  - Simone Silvetti
  - Michele Loreti
  - Laura Nenzi
venue: "International Conference on Runtime Verification (RV)"
pages: "120–139"
url: "https://doi.org/10.1007/978-3-032-05435-7_8"
---

## Background

Bakhirkin and Basset recently proposed a specification language that extends Signal Temporal Logic (STL), lifting its syntactic restrictions: it can produce and manipulate real-valued output signals and express properties usually described with other logics, such as STL*.

## The contribution

This paper extends that language in three directions:

1. **An integral operator over sliding windows**, to specify cumulative properties, for example that the integral of a signal over a time interval stays within a threshold.
2. **A filtering operator** for sliding windows, restricting the aggregation to the signal segments that satisfy a given condition.
3. **An efficient online monitoring algorithm** for the extended logic.

The logic is evaluated on two case studies.
