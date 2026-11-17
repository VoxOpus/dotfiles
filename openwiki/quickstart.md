---
type: concept
title: Quickstart
description: High-level overview of the dotfiles repository and guide to navigating its architecture, configuration, and maintenance.
tags: [quickstart, overview, navigation]
verified:
  - by: openwiki/0.9.0
    at: 2026-11-11T23:18:43.570Z
sources:
  - id: openwiki-source-bf5be0c9253ed1d07b502e10
    resource: repo://.githooks/pre-commit
  - id: openwiki-source-23775c3de52f3ab95a13cb8b
    resource: repo://README.md
generated: { by: "pi", at: "2026-11-11T23:18:43.570Z" }
---

# Quickstart

Welcome to this XDG-compliant, Stow-ready dotfiles repository. Its tool and environment configurations are organized into packages that can be deployed with GNU Stow.

## Repository Overview

The repository is centered on top-level packages such as `zsh`, `kitty`, `doom`, and `git`. GNU Stow maps each package's directory structure into the home directory. See [Dotfiles Stow Management](architecture/stow-management.md) for deployment behavior and package-specific ignore rules.

For shell setup, XDG directories, secrets, and OS-specific aliases, see [Zsh Environment](configuration/zsh-environment.md).

## Operations and Maintenance

- [Package List Backup](operations/package-backup.md) explains the pre-commit hook that refreshes and stages package inventories for supported hosts.
- [OpenWiki Documentation Maintenance](operations/openwiki-maintenance.md) explains when to retrieve repository wiki context and how contributors should refresh generated documentation after source changes.
