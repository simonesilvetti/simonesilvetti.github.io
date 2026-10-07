---
title: "Rails and Hotwire"
date: 2026-10-01
description: "A first look at Turbo and Stimulus, the Rails frontend without JavaScript frameworks."
tags:
  - rails
  - hotwire
---

# Rails and Hotwire

Hotwire is the Rails approach to the frontend: instead of building a separate JavaScript application, the server sends HTML.

## Turbo

Turbo makes navigation fast by replacing only the page content, without a full reload.

## Stimulus

Stimulus adds small behaviours to existing HTML:

```html
<div data-controller="hello">
  <button data-action="click->hello#greet">Greet</button>
</div>
```

1. Write the HTML.
2. Connect a controller.
3. Add the behaviour.
