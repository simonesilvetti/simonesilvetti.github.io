---
title: "Essential Software"
date: 2026-10-20
description: "On building software with purpose, care, and restraint in the age of generative AI."
tags:
  - software
  - design
  - ai
---

I've been thinking about what makes software *good*. Not merely powerful, clever, or packed with features, but genuinely useful—something that feels natural to use and remains understandable over time.

Software development often rewards addition: another feature, another option, another abstraction. Generative AI makes it easier than ever to follow that impulse. We can produce code faster, experiment more freely, and turn ideas into working interfaces in remarkably little time. But being able to build something is not the same as having a good reason to build it.

In my own development work, I've been trying to move in the opposite direction: to be more deliberate about what I add, what I leave out, and how the pieces fit together. I've started thinking of this approach as **Essential Software**.

The idea is simple: **do what matters, do it well, and avoid unnecessary complexity.**

That doesn't mean making everything as small as possible. An interface with fewer buttons isn't necessarily easier to use, just as a codebase with fewer lines isn't necessarily easier to maintain. The aim is to keep what serves a real purpose—and to take care with every part that remains.

## Simple to start, powerful to use

A useful example is the tension between efficiency and accessibility.

I admire tools like Neovim for putting content first and treating the keyboard as a precise, expressive way to work. But I don't think that power should require everyone to climb a steep learning curve.

In an application I've been developing, I wanted keyboard interaction to feel natural and fast, without making it mandatory. Commands should also be visible and clickable. Someone should be able to use the software immediately, then discover shortcuts as they grow comfortable with it. **Efficiency should be a reward for familiarity, not a condition of entry.**

I feel the same way about configuration. Good defaults should make a tool useful from the first launch. If someone wants to change how it works, that freedom should be there—ideally through straightforward, readable configuration rather than hidden complexity. A product can have a strong opinion about how it should work without taking control away from the person using it.

These decisions aren't isolated interface preferences. They reflect a broader set of principles that guide how I think about software, from the first sketch to the underlying architecture.

## Eleven principles of Essential Software

These ideas owe a great deal to Dieter Rams, the Unix philosophy, Rails, Neovim, the free-software movement, and sustainable computing. I don't see Essential Software as a replacement for those traditions. It's my attempt to bring their lessons together in the everyday decisions I make when building software.

### 1. Function comes first

Start with the problem, not the feature list. Every interaction, component, and technical decision should help the software do something genuinely useful. If it doesn't, it deserves to be questioned.

### 2. Simplicity is a design decision

Simplicity rarely happens by accident. It takes effort to choose clear solutions, avoid premature abstractions, and resist solving problems that don't exist yet. The goal isn't the shortest implementation; it's the simplest one that meets the real need.

### 3. Less, but better

Every feature, dependency, setting, and visual element should earn its place. Removing something can make a product more capable in practice by making the things that matter easier to find and use.

### 4. Beauty serves a purpose

Typography, spacing, rhythm, and consistency shape how software feels. I want interfaces to be visually appealing, but never at the expense of clarity. Beauty should help people focus, not compete for their attention.

### 5. Defaults should be excellent

A good tool shouldn't require an afternoon of configuration before it becomes useful. Thoughtful conventions reduce decisions, make behavior predictable, and let people get on with their work.

### 6. Easy to use, free to customize

Ease of use and flexibility shouldn't be opposites. Important actions should be discoverable and clickable; faster keyboard workflows should be available to those who want them. Configuration should be understandable, optional, and portable wherever possible.

### 7. Architecture should be essential and composable

I prefer clear responsibilities, simple boundaries, and components that are easy to reason about. Avoiding unnecessary dependencies and layers matters—but so does resisting the temptation to compress everything into an unmaintainable monolith. Good architecture makes change easier without predicting every future change.

### 8. Efficiency is a responsibility

CPU, memory, storage, bandwidth, and energy aren't free resources. I want to use them carefully, measure actual performance, and avoid waste. Efficiency isn't about chasing impressive benchmarks; it's about respecting the devices and resources people already have.

### 9. Good software should last

Software should remain useful beyond the latest trend. Durable formats, understandable code, maintainable dependencies, and reasonable hardware compatibility all contribute to longevity. Keeping a tool useful for longer can be more valuable than continually replacing it.

### 10. Quality lives in the details—and in honesty

Naming, feedback, error messages, documentation, and small interactions are part of the product, not finishing touches. Software should behave as promised, explain failures clearly, and avoid hiding complexity behind misleading simplicity.

### 11. Users should remain in control

People should be able to access their data, understand their tools, and move on without losing their work. Open formats, portability, transparent behavior, and the freedom to modify software are important ideals. Where possible, I want to design for genuine independence rather than lock-in. Open source is one way to support that goal, but it requires a deliberate licensing choice—not just publicly visible code.

## Why these ideas matter more with AI

Generative AI changes the economics of writing code, but it doesn't eliminate the cost of understanding, testing, securing, or maintaining what we create.

When producing another feature becomes easy, deciding *not* to add it becomes a more meaningful act of design. When an AI assistant can generate an implementation in seconds, it's still our responsibility to ask whether that implementation is appropriate, comprehensible, and worth maintaining.

AI may also make software more adaptable. People who couldn't previously modify a program might be able to explain what they need and receive help changing it. That's exciting. But the resulting tools shouldn't depend on one particular model or vendor to remain usable. The source code, data, configuration, and core behavior should be understandable and accessible independently of the system that helped produce them.

For me, this is the central question of software development in the age of generative AI: **if we can build almost anything more easily, how do we become better at choosing what is worth building?**

## A direction, not a doctrine

These principles aren't a checklist that automatically produces good software. They sometimes pull against one another. A simpler experience may require a more sophisticated implementation. More configurability may introduce maintenance costs. Greater performance may complicate the code. The point is to make those trade-offs intentionally, rather than letting them accumulate unnoticed.

Essential Software is the name I've given to the approach that guides my software development: build around a real purpose, care about the experience, keep the architecture understandable, respect finite resources, and leave the user with as much freedom as possible.

> **Do what matters. Do it well. Make it understandable, beautiful, efficient, and durable. Leave out what doesn't belong.**

As software becomes easier to generate, I want to become more thoughtful about the software I choose to make.
