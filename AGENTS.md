# Repository notes for agents

This repo IS `precedent-shared-working-style` — a **shared** source for
[Precedent](https://github.com/alex137/BestPractice/tree/precedent-beta-v01),
named for a **subject** rather than for a roster. Its subject is **how a session works alongside the person it is working with**: deciding small calls rather than stopping for them, keeping going on everything an open question does not touch, and not repeating the same disclaimer every run. It loads on two channels: its `tier: resident` practices are carried in the block below and fire on every turn, and the rest sit in that block's occasion index, pulled in by the standing instruction when their occasion comes up.

**Any team whose work includes that subject declares this set alongside its
own**, and a repo may declare several team sets — see
[README.md](README.md) for what is here, and Precedent's `INSTALL.md`
("Which team sets does this repo declare?") for how a project picks.

<!-- BEGIN GENERATED: precedent-loader -->

<!-- Regenerate with: python3 tools/build_views.py -- do not hand-edit this block; `python3 tools/build_views.py --check` exits non-zero on drift. Source: practices/ -- edit the practice file, never this block. -->

## Resident block (~144 of 425 token budget, 2 of 5 practices)

**default-register.** **The register of a reply belongs to its reader.** Where the person you are working with has declared their own -- their individual practice set is where they do it -- that declaration governs and this rule steps aside. **Where none resolves, write to a reader who is not technical**, because on this team they generally are not; `## Detail` says what that means in full.

**nonblocking-questions.** Once a question is worth asking at all, asking is not itself a stopping point. A session holding a queue of work and an open question doesn't go idle waiting for the answer -- it keeps going on everything the answer doesn't touch.

## Occasion index

```
When a judgment call is needed to keep work moving:
  small-calls — make small calls yourself; note them; stop only for big ones
When finishing a task a session was spawned or triggered to do:
  report-up-the-chain — report to whoever tasked you; noticed work goes up the chain, never out as a proposal
When reporting a check's outcome that includes a known pre-existing backlog:
  quiet-checks — "checks passed" is fine; don't re-explain the same old backlog
```

## Standing instruction

Before starting work of a kind named in the occasion index above, run `python3 tools/precedent_show.py SLUG` for each listed slug to load its Rule. When editing a file, `python3 tools/precedent_paths.py FILE` prints any on-demand practice whose `applies_to` matches it, without needing the index at all. If `.precedent/SESSION_PRACTICES.md` exists, read it too: it carries the practices in force from the other sources this repo declares, which are NOT in this block and bind work here exactly as these do. It is regenerated at session start and is deliberately untracked — never commit it or quote it into a pull request.

<!-- END GENERATED -->

## Working in this repo

- **Practices are in [practices/](practices/)**, one file per practice, in
  Precedent's phase-1 format — frontmatter plus `## Rule` / `## Detail` /
  `## Why` / `## Story` / `## Install`.
- **Regenerate the block above** with `python3 tools/build_views.py` after
  any practice change; it rebuilds [MAP.md](MAP.md) and
  [GLOSSARY.md](GLOSSARY.md) alongside it. Never hand-edit it.
- **Before committing:** `python3 tools/precedent_check.py` — what matters
  is `0 violated`, never the passed or skipped count. This is the ONLY
  check a working branch gets:
  [`.github/workflows/precedent-check.yml`](.github/workflows/precedent-check.yml)
  ran on every push to every branch from 2026-09-14, but was narrowed to
  `push: branches: [main]` on 2026-09-19 (billing; see the file's own
  header), so a violation on a working branch is caught only if you run
  this yourself before the push, same as before 2026-09-14.
- **The hand-written half of this file describes the MECHANISM, never the
  INVENTORY.** `MAP.md` and `GLOSSARY.md` are generated top to bottom, but
  this file is the one mixed file in the repo — the generator owns only what
  sits between the `BEGIN GENERATED`/`END GENERATED` markers, and `--check`
  compares only that. So prose outside the markers can contradict the block
  inside them with every check still green, which is what happened here on
  2026-09-11: the opening paragraph said "Most of it is `tier: resident`"
  while the block twelve lines below said `2 of 4 practices`. Describing how
  the two loading channels work is safe — that stays true until the engine
  changes. Describing what is currently in the set is not: which practices
  are resident, how many, what proportion, what `applies_to` covers. All of
  that is generated a few lines down, and restating it creates a second copy
  that only a person can keep true. Nothing mechanical catches this; that is
  the whole point of the rule.
- **Approval** is a listed approver's own yes, in
  [approvers.json](approvers.json).
