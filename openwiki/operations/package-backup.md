---
type: operation
title: Package List Backup
description: Automated package list backup process using Git pre-commit hooks tailored for different OS environments.
tags: [backup, pre-commit, git, packages]
verified:
  - by: openwiki/0.9.0
    at: 2026-11-11T22:47:10.023Z
sources:
  - id: openwiki-source-bf5be0c9253ed1d07b502e10
    resource: repo://.githooks/pre-commit
generated: { by: "pi", at: "2026-11-11T22:47:10.023Z" }
---

# Package List Backup

To maintain a comprehensive record of installed software across different environments, this repository uses a Git `pre-commit` hook to automatically backup system package lists before each commit.

## Pre-Commit Hook

The script at `.githooks/pre-commit` executes in the repository root and analyzes the current environment to determine which package manager to query. It targets three distinct setups:

### Arch Linux (Laptop)
If the script detects `pacman` and the hostname matches `arch-laptop`, it generates two files:
- `pkglist_repo.txt`: Contains explicitly installed packages from the official repositories (`pacman -Qqen`).
- `pkglist_aur.txt`: Contains explicitly installed packages from the AUR or third-party sources (`pacman -Qqem`).

### Cloud VPS (RPM-based)
If the script detects `rpm` and the hostname matches `cloud-vps`, it queries all installed RPM packages using `rpm -qa --qf '%{NAME}\n'`.
- The sorted unique list is saved to `pkglist_vps.txt`.

### Termux
If the `$TERMUX_VERSION` environment variable is present and the `pkg` command is available, it lists the installed Termux packages.
- The parsed list is saved to `pkglist_termux.txt`.

## Workflow
During a `git commit`, the hook evaluates these conditions. If an environment match is found, the package lists are regenerated and automatically staged using `git add`. This ensures that the dotfiles repository always reflects the most up-to-date software requirements for the active environment without requiring manual intervention.
