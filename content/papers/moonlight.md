---
title: "MoonLight: A Lightweight Tool for Monitoring Spatio-Temporal Properties"
date: 2020-10-02
description: "A Java tool for monitoring temporal and spatio-temporal (STREL) properties of mobile, spatially distributed CPS."
authors:
  - Ezio Bartocci
  - Luca Bortolussi
  - Michele Loreti
  - Laura Nenzi
  - Simone Silvetti
venue: "International Conference on Runtime Verification (RV)"
pages: "417–428"
url: "https://doi.org/10.1007/978-3-030-60508-7_23"
preprint: "https://arxiv.org/abs/2104.14333"
---

## The tool

**MoonLight** monitors temporal and spatio-temporal properties of mobile and spatially distributed cyber-physical systems (CPS).

Space is represented as a **weighted graph**: the CPS entities are its nodes, and both nodes and edges have attributes modelling physical and logical quantities that change over time. The tool supports the Spatio-Temporal Reach and Escape Logic (**STREL**).

## How to use it

MoonLight is implemented in Java and can be used:

- as a standalone command line tool;
- as a Java API;
- through a **Matlab™** interface.

The paper shows examples through the Matlab interface and evaluates performance, also comparing MoonLight with tools specialised in monitoring temporal properties only.

An extended version appeared in [STTT in 2023](/papers/moonlight-sttt).
