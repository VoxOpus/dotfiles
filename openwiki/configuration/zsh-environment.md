---
type: configuration
title: Zsh Environment
description: Structure and configuration of the Zsh environment, including XDG base directories, aliases, and secrets management.
tags: [zsh, xdg, environment, configuration]
verified:
  - by: openwiki/0.9.0
    at: 2026-11-12T03:43:47.041Z
sources:
  - id: openwiki-source-f30b8a983deea3be8fd4a4cc
    resource: repo://zsh/.config/zsh/.zshrc
  - id: openwiki-source-ac694f04ac2a65c61512baa9
    resource: repo://zsh/.zshenv
generated: { by: "pi", at: "2026-11-12T03:43:47.041Z" }
---

# Zsh Environment

This repository configures a modern, XDG-compliant Zsh environment using Oh My Zsh and Powerlevel10k. The configuration is modularized to separate base environment variables, aliases, and sensitive secrets.

## Core Configuration

- **`.zshenv`**: Defines the foundational XDG base directories (`XDG_CONFIG_HOME`, `XDG_DATA_HOME`, etc.) and sets `ZDOTDIR` to `$XDG_CONFIG_HOME/zsh`. It also maps tools such as Cargo, npm, Docker, and Emacs to XDG locations, configures pi-lens global data under `$XDG_DATA_HOME/pi-lens`, per-project data under `$XDG_CACHE_HOME/pi-lens`, and its global config at `$XDG_CONFIG_HOME/pi-lens/config.json`, then constructs a unified `PATH`.
- **`.zshrc`**: The primary interactive shell configuration located at `$ZDOTDIR/.zshrc`. It initializes Powerlevel10k instant prompt, configures Oh My Zsh with essential plugins (e.g., `git`, `zsh-autosuggestions`, `zsh-syntax-highlighting`), and manages Zsh history within `$XDG_STATE_HOME`.

## Secrets Management

To prevent accidental commits of sensitive information, API keys and other secrets are managed externally:
- A template file is provided at `zsh/.secrets/api_keys.zsh.template`.
- Users should copy this template to `~/.secrets/api_keys.zsh` (an un-symlinked, un-tracked location) and populate it with their actual keys.
- The `.zshrc` conditionally sources `~/.secrets/api_keys.zsh` if it is readable.

## Aliases and Environment-Specific Loading

The Zsh configuration dynamically loads aliases based on the environment to ensure command availability:
- **`zsh_aliases.zsh`**: Contains universal aliases (e.g., `alias c='clear'`).
- **Environment-Specific Aliases**: The `.zshrc` inspects the operating system or runtime and sources additional alias files if present:
  - `termux_aliases.zsh` is loaded if `$TERMUX_VERSION` is set.
  - `arch_aliases.zsh` is loaded if `/etc/arch-release` exists.
  - `fedora_aliases.zsh` is loaded if `/etc/os-release` identifies the OS as Fedora.
