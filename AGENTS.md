# Repository notes for agents

This repo IS `precedent-team-working-style` — a **team** source for
[Precedent](https://github.com/alex137/BestPractice/tree/precedent-beta-v01),
named for a **subject** rather than for a roster. Its subject is **how a session works alongside the person it is working with**: deciding small calls rather than stopping for them, keeping going on everything an open question does not touch, and not repeating the same disclaimer every run. Most of it is `tier: resident`, so it fires on every turn.

**Any team whose work includes that subject declares this set alongside its
own**, and a repo may declare several team sets — see
[README.md](README.md) for what is here, and Precedent's `INSTALL.md`
("Which team sets does this repo declare?") for how a project picks.

<!-- BEGIN GENERATED: precedent-loader -->

<!-- Regenerate with: python3 tools/build_views.py -- do not hand-edit this block, tools/verify_harness.py's regeneration check fails on drift. -->

## Resident block (~183 of 2000 token budget, 2 of 3 practices)

**nonblocking-questions.** Once a question is worth asking at all, asking is not itself a stopping point. A session holding a queue of work and an open question doesn't go idle waiting for the answer -- it keeps going on everything the answer doesn't touch.

**small-calls.** Default to continuing, not asking. When a judgment call is needed to keep the work moving -- filling in a default, picking between two reasonable implementations, resolving an ambiguity that doesn't change the shape of what gets delivered -- make the call and note it, rather than stopping to ask first. Reserve stopping and asking for calls that are genuinely big: hard or costly to undo, change what gets delivered or to whom, spend real money, touch credentials or production, or are the kind of toss-up where two reasonable people would clearly land in different places.

## Occasion index

```
When reporting a check's outcome that includes a known pre-existing backlog:
  quiet-checks — "checks passed" is fine; don't re-explain the same old backlog
```

## Standing instruction

Before starting work of a kind named in the occasion index above, run `python3 tools/precedent_show.py SLUG` for each listed slug to load its Rule. When editing a file, `python3 tools/precedent_paths.py FILE` prints any on-demand practice whose `applies_to` matches it, without needing the index at all.

<!-- END GENERATED -->

## Working in this repo

- **Practices are in [practices/](practices/)**, one file per practice, in
  Precedent's phase-1 format — frontmatter plus `## Rule` / `## Detail` /
  `## Why` / `## Story` / `## Install`.
- **Regenerate the block above** with `python3 tools/build_views.py` after
  any practice change; it rebuilds [MAP.md](MAP.md) and
  [GLOSSARY.md](GLOSSARY.md) alongside it. Never hand-edit it.
- **Before committing:** `python3 tools/precedent_check.py` — what matters
  is `0 violated`, never the passed or skipped count.
- **Approval** is a listed approver's own yes, in
  [approvers.json](approvers.json).
