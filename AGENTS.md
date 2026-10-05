# Repository notes for agents

This repo IS `precedent-shared-working-style` — a **shared** source for
[Precedent](https://github.com/alex137/BestPractice/tree/staging),
named for a **subject** rather than for a roster. Its subject is **how a session paces work with the person it is working with**, which is its `precedent-source.json` `subject`. It loads on two channels: its `tier: resident` practices are carried in the block below and fire on every turn, and the rest sit in that block's occasion index, pulled in by the standing instruction when their occasion comes up.

**Any team whose work includes that subject declares this set alongside its
own**, and a repo may declare several shared sets — see
[README.md](README.md) for what is here, and Precedent's `INSTALL.md`
("Which shared sets does this repo declare?") for how a project picks.

<!-- BEGIN GENERATED: precedent-loader -->

<!-- Regenerate with: python3 tools/build_views.py -- do not hand-edit this block; `python3 tools/build_views.py --check` exits non-zero on drift. Source: practices/ -- edit the practice file, never this block. -->

## Resident block (~189 of 425 token budget, 1 of 5 practices)

**answer-first-ask-before-long-work.** Four parts. **(1) Answer the easy questions in a message before starting
anything long** — in the same turn; the long run never gates the answer.
**(2) A task that will run longer than a few minutes is proposed, not
started:** what it is, how long from the tool's own cost line, what it
blocks and what it does not, then the go-ahead. The exceptions are the
checks a commit needs on the files the turn touched, and a run already
asked for by name. **(3) When idle on a wait, say what the wait is for,
what it will change, and how to stop it** — never a bare "still running".
A background task nobody asked for is stopped, not waited on.
**(4) An open question is not a stopping point:** ask it early and keep
working on everything its answer does not touch.

## Occasion index

```
When a person's account of their own situation seems contradicted by the evidence:
  their-constraints-are-given — say it once, then work from theirs
When about four or more end-user content files sit scattered around a repo:
  organize-scattered-content — name a directory and its files, ask, move nothing until yes; recheck later
When finishing a task a session was spawned or triggered to do:
  report-up-the-chain — report to whoever tasked you; noticed work goes up the chain, never out as a proposal

(More on-demand practices are not listed here: one whose applies_to names real paths, or which declares a gate, is reached by those channels instead -- `precedent_paths.py FILE` and `precedent_gate.py MOMENT`. A trigger a PERSON SAYS cannot be reached that way and is always listed above. `precedent_show.py --index-omitted` names the omitted ones.)
```

## Standing instruction

Before starting work of a kind named in the occasion index above, run `python3 tools/precedent_show.py SLUG` for each listed slug to load its Rule. When editing a file, `python3 tools/precedent_paths.py FILE` prints any on-demand practice whose `applies_to` matches it, without needing the index at all. At a named moment — before pushing — run `python3 tools/precedent_gate.py push`: some practices fire at a moment rather than in a file, and no path glob reaches those. If `.precedent/SESSION_PRACTICES.md` exists, read it too: it carries the practices in force from the other sources this repo declares, which are NOT in this block and bind work here exactly as these do. It is regenerated at session start and is deliberately untracked — never commit it or quote it into a pull request.

<!-- END GENERATED -->

## Working in this repo

**The instructions are here; the incident behind each one is in
[spec/WORKING_IN_THIS_REPO.md](spec/WORKING_IN_THIS_REPO.md)**, moved there
whole on 2026-09-22.

- **Practices are in [practices/](practices/)**, one file per practice, in
  Precedent's phase-1 format — frontmatter plus `## Rule` / `## Detail` /
  `## Why` / `## Story` / `## Install`.
- **Regenerate the block above** with `python3 tools/build_views.py` after
  any practice change; it rebuilds [MAP.md](MAP.md) and
  [GLOSSARY.md](GLOSSARY.md) alongside it. Never hand-edit it.
- **Before committing:** `python3 tools/precedent_check.py --full-sweep` —
  `0 violated` is what matters. **Never the bare command**: it reaches most
  of this set's checks only one commit in ten. **There is no CI here** --
  [why](spec/WORKING_IN_THIS_REPO.md#the-check-and-why-there-is-no-ci).
- **The hand-written half of this file describes the MECHANISM, never the
  INVENTORY** -- restating what's currently in force creates a second copy
  only a person can keep true;
  [that is not hypothetical](spec/WORKING_IN_THIS_REPO.md#mechanism-never-inventory).
- **Approval** is a listed approver's own yes, in
  [approvers.json](approvers.json).
