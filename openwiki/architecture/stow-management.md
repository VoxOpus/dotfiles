---
type: architecture
title: Dotfiles Stow Management
description: How GNU Stow is used to manage and deploy the dotfiles across different environments.
tags: [stow, dotfiles, deployment]
verified:
  - by: openwiki/0.9.0
    at: 2026-11-11T22:47:10.023Z
sources:
  - id: openwiki-source-23775c3de52f3ab95a13cb8b
    resource: repo://README.md
  - id: openwiki-source-0d2d7151fac59d494a6f7860
    resource: repo://zsh/.stow-local-ignore
generated: { by: "pi", at: "2026-11-11T22:47:10.023Z" }
---

# Dotfiles Stow Management

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks for dotfiles. Stow maps the top-level directories in this repository to their corresponding locations in the user's home directory.

## Repository Structure

The repository is organized into packages (directories) that correspond to specific tools or environments. Examples include `zsh`, `code-oss`, `kitty`, and `git`. When Stow is invoked on a package, it mirrors the directory structure within that package into the target directory (usually `$HOME`).

## Stow Local Ignore

To prevent sensitive or environment-specific files from being symlinked, packages can include a `.stow-local-ignore` file. For example, the `zsh` package ignores:
- `.*\.template`: Template files meant to be copied and modified, not symlinked.
- `.secrets/`: Directories containing sensitive configuration.
- `api_keys.zsh`: Files containing environment-specific API keys.

This allows the repository to contain template files (like `zsh/.secrets/api_keys.zsh.template`) that users can copy to un-tracked, un-symlinked locations to store actual secrets.
