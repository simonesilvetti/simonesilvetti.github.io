---
title: "Research"
description: "Where machine learning meets formal methods: temporal logics, spatio-temporal monitoring, learning specifications from data and Bayesian verification."
---

I work where **machine learning** meets **quantitative formal methods**. Most of the systems I study are cyber-physical systems: software that senses and acts on the physical world, like an engine controller, an artificial pancreas, a drone swarm or an autonomous car. They are too complex to check by hand and often too complex for classic model checking, so I look for ways to write down precisely what they should do, check it efficiently, and use learning where exact methods stop scaling. Lately I have been working on monitoring spatio-temporal properties, on formal methods for monitoring and prediction in business process management, on neuro-symbolic approaches to time series analysis, and on modular software design to reduce uncertainty in ethics-based cyber-physical systems.

## Specification languages

Temporal logics such as Signal Temporal Logic (STL) describe how a signal should behave over time, and their *robustness* says by how much a requirement is satisfied or violated. Many real requirements, though, do not fit the classic "always" and "eventually" operators.

- [Signal Convolution Logic](/papers/signal-convolution-logic) uses convolutional filters to talk about the **percentage of time** a property holds, which suits noisy systems and non-functional requirements.
- [Integral and filter operators](/papers/modular-online-monitoring-integral-filter) express **cumulative properties** over sliding windows, with an efficient online monitor.
- [Time robustness for MITL](/papers/time-robustness-mitl-point-based) measures how much the **timing** of events can shift before a requirement stops holding, for systems described by timestamped events.

## Spatio-temporal monitoring

When a system is made of many interacting agents, *where* things happen matters as much as *when*. The Spatio-Temporal Reach and Escape Logic (STREL) describes properties over a dynamic graph of agents.

- [MoonLight](/papers/moonlight-sttt) is a lightweight Java tool, with Python and Matlab interfaces, for monitoring temporal and spatio-temporal properties.
- [Alternating finite automata](/papers/monitoring-spatially-distributed-cps-alternating-automata) give STREL an automaton semantics, for offline and online monitoring of a drone swarm.

## Learning specifications from data

Requirements are not always known in advance. Learning them from data gives models that people can read and check.

- A [genetic algorithm](/papers/robust-genetic-algorithm-temporal-specifications) learns both the structure and the parameters of STL formulae that separate normal from anomalous behaviour.
- The same idea, applied to [real patient data](/papers/diabetes-patient-behaviors), finds behaviour patterns linked to glycemic control in type 1 diabetes.
- [STELLE](/papers/guided-by-stars) is a neuro-symbolic classifier for time series whose predictions come with **human-readable temporal logic explanations**.
- Kernels over STL formulae make it possible to [check a property without access to the system](/papers/machine-learning-model-checking-privacy), and raise the question of how much such a method reveals about it.

## Machine learning for verification and design

Simulating a complex model is expensive. Statistical models such as **Gaussian Processes** learn how a property behaves across inputs or parameters from a few simulations, and guide the search towards the interesting cases.

- [Active learning for falsification](/papers/active-learning-falsification-black-box-cps) finds inputs that break a requirement of a black box model with far fewer simulations, on industrial automotive benchmarks.
- [Bayesian parameter synthesis](/papers/bayesian-statistical-parameter-synthesis) finds the parameters for which a stochastic model satisfies a property, with statistical guarantees (see also the [tutorial](/papers/bayesian-parametric-verification-synthesis-machine-learning)).
- [Multi-objective design](/papers/multi-objective-design-chemical-reaction-networks) tunes a stochastic model of a biological network so that several conflicting requirements hold at once.

My [PhD thesis](/papers/phd-thesis) brings these threads together.

## Collaborations

Most of this work is joint with Laura Nenzi and Luca Bortolussi at the University of Trieste, Ezio Bartocci at TU Wien, Michele Loreti at the University of Camerino and Jyotirmoy Deshmukh at the University of Southern California, together with many students and colleagues. The full list of publications is on the [papers](/papers) page.
