# Working in this repo — the long version

**[AGENTS.md](../AGENTS.md)'s "Working in this repo" section carries the
instructions. This file carries the incident behind each one**, moved here
on 2026-09-22 by a reduction pass (universal `reduction-pass`: move, never
delete). Nothing was shortened on the way out — every paragraph below is the
text that used to sit in `AGENTS.md`, word for word.

**Why the split at all.** `AGENTS.md` is loaded in full by every session
before it does any work, and it had grown to 1,046 tokens against the
1,000-token ceiling `tools/session_load_budgets.json` declares for it,
with no warning: this repo had no `headroom_floor_pct` declared, so
`tools/session_load_trend.py`'s early-warning notice at merge/push was
silently off the whole time. Both landed the same day.

## The check, and why there is no CI

**Before committing:** `python3 tools/precedent_check.py` — what matters is
`0 violated`, never the passed or skipped count. **Nothing else runs it, on
any branch.** This repo carried a `precedent-check.yml` workflow from
2026-09-14; on 2026-09-21 the vendored engine deleted it on refresh, because
a practice source installs no CI at all — universal's
`source-sets-run-no-ci`, decided on a usage export in which four sets
running two workflows each were 127 of 143 billed minutes in one day. So
there is no after-the-push gate here any more, and none of the older ones is
coming back: the check runs before the push, or it does not run.

## Mechanism, never inventory

**The hand-written half of this file describes the MECHANISM, never the
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
