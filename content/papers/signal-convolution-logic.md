---
title: "Signal Convolution Logic"
date: 2018-09-30
description: "SCL: a temporal logic with convolutional filters, to reason about the percentage of time a property holds."
authors:
  - Simone Silvetti
  - Laura Nenzi
  - Ezio Bartocci
  - Luca Bortolussi
venue: "International Symposium on Automated Technology for Verification and Analysis (ATVA)"
pages: "267–283"
url: "https://doi.org/10.1007/978-3-030-01090-4_16"
preprint: "https://arxiv.org/abs/1806.00238"
---

## The idea

**Signal Convolution Logic (SCL)** is a new logic that combines temporal logic with **convolutional filters** from digital signal processing.

Classic temporal operators ask whether something holds *always* or *eventually* in an interval. SCL can instead reason about the **percentage of time** a formula is satisfied in a bounded interval, which is the natural way to express many non-functional requirements.

## The contribution

- The logic is shown to be a suitable formalism to express **non-functional requirements** of cyber-physical systems with noisy and irregular behaviours.
- Both a **qualitative and a quantitative semantics** are defined, together with an efficient **monitoring procedure**.

## Case study

SCL is used to monitor **artificial pancreas** controllers, which automate insulin delivery for patients with type 1 diabetes.
