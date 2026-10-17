---
title: "Monitoring Spatially Distributed Cyber-Physical Systems with Alternating Finite Automata"
date: 2025-05-06
description: "An automaton-based semantics for the spatio-temporal logic STREL, to monitor mobile, networked cyber-physical systems."
authors:
  - Anand Balakrishnan
  - Sheryl Paul
  - Simone Silvetti
  - Laura Nenzi
  - Jyotirmoy V Deshmukh
venue: "ACM International Conference on Hybrid Systems: Computation and Control (HSCC)"
pages: "1–11"
url: "https://doi.org/10.1145/3716863.3718033"
preprint: "https://arxiv.org/abs/2503.21906"
---

## The setting

Modern cyber-physical systems (CPS) are often made of many networked components and agents that interact and communicate. In **spatially distributed** CPS, these connections can change with the spatial configuration of the agents. Robust monitoring of the distributed components is essential to make sure complex behaviours are achieved and safety properties hold.

## The contribution

The paper defines an **automaton semantics** for the Spatio-Temporal Reach and Escape Logic (**STREL**), a formal logic for expressing and monitoring spatio-temporal requirements over mobile, spatially distributed CPS, reasoning on dynamic weighted graphs.

STREL already has well-defined qualitative and quantitative semantics; this work proposes a new construction of **(weighted) alternating finite automata** from STREL specifications that efficiently encodes both.

## Results

The automaton semantics is used for both **offline and online monitoring** of STREL specifications, demonstrated on a simulated **drone swarm**.
