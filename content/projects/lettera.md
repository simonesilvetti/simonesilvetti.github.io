---
title: "lettera"
date: 2026-10-20
description: "A minimal, keyboard-driven desktop email client for IMAP and Gmail, written in Rust and Svelte."
technologies:
  - Rust
  - Tauri 2
  - Svelte 5
  - SQLite
  - Flatpak
github: "https://github.com/simonesilvetti/lettera"
---

# lettera

lettera is a desktop email client that does a few things and stays out of the way: monospace type, thin rules, no menus, and only a handful of icons (the folders on the left, the logo, a paperclip for attachments).
It is driven from the keyboard, Vim style (`j`/`k` to move, `e` to archive, `r` to reply, `/` to search), and anything without a shortcut lives in a command palette opened with `:`.
Every key hint on screen is also a button, so the mouse works too.

```
inbox  12 unread · 240                                      simone@example.com
──────────────────────────────────┬────────────────────────────────────────────
 TODAY                            │  Q4 planning
▌■ Anna Rossi 3    Q4 planning    │  3 messages · Anna Rossi, Marco Bianchi
   Marco Bianchi   October invoice│ ───────────────────────────────────────────
──────────────────────────────────┴────────────────────────────────────────────
hjkl navigate · ⏎ open · e archive · r reply · / search · : commands  sync ●
```

## What it does

- **Accounts**: any IMAP/SMTP provider, and Gmail with an app password or OAuth2, side by side.
- **Mail**: read, search (full text), archive, delete, move, reply, forward and write plain-text email with attachments and a signature. Conversations are grouped into threads.
- **In the background**: it syncs every folder, gets new mail instantly through IMAP IDLE and shows a desktop notification. Closing the window leaves it in the tray, and it can start hidden with the session.
- **Drafts** save themselves every few seconds and go to the server's Drafts folder, so other clients see them.
- **Omarchy**: on [Omarchy](https://omarchy.org/) it takes its colors from the current theme and recolors live when the theme changes.
- **Configuration** is a single TOML file, reloaded as soon as it is saved. Passwords and tokens live only in the system keyring.

## How it is built

- `crates/core` is the engine in Rust, with no UI dependency: IMAP (`async-imap`), SMTP (`lettre`), OAuth2, MIME parsing, SQLite with FTS5 for search, sync and threading. It is tested on its own.
- A thin [Tauri 2](https://tauri.app/) layer exposes it to a [Svelte 5](https://svelte.dev/) interface, which only draws and sends commands.
- Each account keeps three IMAP connections: one for background sync, one for user actions, one in IDLE on the inbox. Actions are optimistic: the list changes at once and the server follows; if the server disagrees, the folder is resynced.
- HTML email is sanitized when stored and shown in a sandboxed frame with remote images blocked.

The tests cover parsing, threading and sync against a fake IMAP server, and an integration suite runs the whole engine against real Dovecot and Mailpit servers in Docker.
A GitHub Actions workflow builds the Flatpak package and attaches it to each release.

I built lettera together with [Claude Code](https://claude.com/claude-code): about 10,000 lines of Rust and 3,500 of Svelte and TypeScript.
I set the direction, the design and the priorities, and tried it on my own mail while the agent wrote and tested the code.

## Install

On Linux, with [Flatpak](https://flatpak.org/setup/):

```sh
curl -LO https://github.com/simonesilvetti/lettera/releases/latest/download/lettera.flatpak
flatpak install --user lettera.flatpak
```

lettera is free software, released under the GPL-3.0-or-later.
