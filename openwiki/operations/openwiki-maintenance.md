---
type: operation
title: OpenWiki Documentation Maintenance
description: Repository-specific guidance for retrieving OpenWiki context when useful and refreshing generated documentation after source changes.
tags: [openwiki, documentation, maintenance, contributor-guide]
verified:
  - by: openwiki/0.9.0
    at: 2026-11-11T23:18:43.570Z
sources:
  - id: openwiki-source-8037e2358a2c4f9b2c722a11
    resource: repo://AGENTS.md
generated: { by: "pi", at: "2026-11-11T23:18:43.570Z" }
---

# OpenWiki Documentation Maintenance

The repository's `openwiki/` directory is a generated evidence index, not required startup reading. `AGENTS.md` describes when to retrieve it and how contributors should keep generated pages aligned with source.

## Retrieve Context Just in Time

Do not enumerate, preload, or search the wiki at the start of every task. Retrieve context when a user asks, when unfamiliar architecture or dependency behavior matters, or when source inspection leaves an important uncertainty. Use `openwiki_search` to locate relevant material and `openwiki_read` to read the selected sections; stop when the question is grounded. If search reports `workspace_required`, ask which workspace applies before retrying. When OpenWiki retrieval tools are unavailable, use `openwiki/quickstart.md` to navigate the repository's pages.

## Verify Against the Repository

Treat source code and tests as authoritative. Unknowns and review items in a brief are verification gaps, not requirements by themselves. Prefer the narrowest quiet validation that proves changed behavior, and preserve complete failure output.

## Refresh Generated Pages

After source changes, follow the repository's documented OpenWiki maintenance process. Check its configuration and completed runs before relying on automatic updates. Prefer updating source code or documentation and letting OpenWiki regenerate its pages; do not hand-edit generated OpenWiki pages unless explicitly asked.
