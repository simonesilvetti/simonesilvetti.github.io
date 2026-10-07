---
title: "Towards Interpretable Concept Learning over Time Series via Temporal Logic Semantics"
date: 2025-08-05
description: "First results on classifying time series through an embedding into Signal Temporal Logic concepts."
authors:
  - Irene Ferfoglia
  - Simone Silvetti
  - Gaia Saveri
  - Laura Nenzi
  - Luca Bortolussi
venue: "arXiv preprint arXiv:2508.03269"
url: "https://arxiv.org/abs/2508.03269"
---

## The problem

Time series classification is usually solved with black-box deep learning, which makes it hard to understand the rationale behind a prediction, a real issue in safety-critical settings.

## The approach

A neuro-symbolic framework that unifies classification and explanation by embedding trajectories into a space of **Signal Temporal Logic (STL) concepts**. A novel STL-inspired kernel maps each raw time series to its alignment with a set of predefined STL formulae, so every prediction comes with the logical concepts that best characterise it.

This enables classification grounded in human-interpretable temporal patterns, with both local and global symbolic explanations.

## Results

Early results show competitive performance together with high-quality logical justifications for the model's decisions. The work is developed further in [Guided by Stars](/papers/guided-by-stars).
