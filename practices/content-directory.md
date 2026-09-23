---
slug:        content-directory
title:       A content/ directory keeps working files apart from repo machinery
tier:        on-demand
severity:    advisory
applies_to:  ["**"]
occasion:    "laying out a repo's root directory, or a root that's grown crowded with agent/tooling files"
gates:       []
index_clause: "put working files in content/ so they don't mix with agent/tooling files"
checked_by:  null
defines:     []
status:      active
supersedes:  []
overrides:   null
added:       "2026-09-23"
approved_by: "Morgan F, 2026-09-23, moved from the individual set precedent-individual (there: Morgan F, 2026-09-04)"
source_practice_number: null
in_force_at: null
strength: decided
---
## Rule
When a repo's root directory is carrying so much machinery for managing agents -- `AGENTS.md`/`CLAUDE.md`, tool scripts, hooks, config -- that the files actually being worked on and referenced get lost among them, put those working files in a `content/` directory rather than the root. This is a default I fall back to when the repo doesn't already define its own layout convention, not a mandate: an existing, established structure (a `docs/`, `src/`, or whatever the repo already uses) wins over this every time.

## Why
The root of a repo like this one already does a specific job -- it's where an agent looks first for `AGENTS.md`, tool scripts, and config -- and piling the actual content being worked on into that same directory makes both harder to scan: the machinery gets lost among the content, and the content gets lost among the machinery. Separating them keeps each directory legible for what it's for.

## Story
**Not a migration casualty, unlike the rest of the backfill this landed
with.** This practice was written natively in this set on 2026-09-04
(`aa1d5f8`), after the RepoPersonalPreferences migration, so there is no
older text it was separated from -- it was simply created without a Story
and inherited the same blank section by a different route.

Its origin is that commit's own reasoning. The root of a repo running this
setup already does a specific job: it is where a session looks first for the
agent instructions, tool scripts and config. Piling the files actually being
worked on into that same directory makes both harder to scan -- the
machinery gets lost among the content and the content among the machinery --
so separating them keeps each directory legible for what it is for.

Two limits were deliberate from the start, and both are why it is advisory
rather than default severity. It is a fallback for a repo that has not
already defined its own layout, and any established structure wins over it
outright. And nothing checks it: a layout preference is not a property a
script can verify against arbitrary repo content, so it is reached by
occasion only.

## Install
No mechanical check -- this is a layout preference, not a property a script can verify against arbitrary repo content. Reached by occasion only: when starting a repo's directory layout, or restructuring a root that's become crowded, check whether the repo already has its own convention before defaulting to `content/`.
