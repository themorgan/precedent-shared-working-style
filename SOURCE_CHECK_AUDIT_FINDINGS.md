# Source-Supplied Check Audit — Install-Model Assumptions

**This file is the record of an audit, not a practice and not a decision.**
It exists so the next person does not run this pass again. **Verdict:
nothing to fix — this set supplies no checks at all.** What follows is what
was looked at and how, so the verdict can be trusted without repeating the
work.

**Date:** 2026-09-10.
**Engine read at:** `alex137/BestPractice` `precedent-beta-v01`, commit
`680ee07` — the commit that added the two engine helpers this audit exists
to adopt.

## What Was Being Looked For

Three defects in source-supplied checks were found on 2026-09-10 by
installing `precedent-beta-v01` into a real private project via
INSTALL.md §0 — the first real-project install, after the design had only
ever been walked against scratch repositories. Every one was the same
shape: **a check re-deriving from private assumptions something that is
only true of one install model.** In the defect report's own words, *"this
one was found because it fired, not because anything looked for it."*
Nothing in any set distinguished "reads a §1 path" from "reads a path", so
this pass looked deliberately, at all four classes:

1. a §1-only path (`process/upstream/...`, `process/manifest.json`)
   treated as universal — §0 step 5 says outright to skip the manifest,
   and a §0 install puts the engine at `tools/` and the vendored catalogue
   at whatever path `precedent.json` declares;
2. an absent optional file reported as a violation, where the honest
   answer is `NotApplicable`;
3. an unguarded import of an optional engine module — `precedent_resolve.py`,
   `doc_lint.py`, `doc_sync.py` and `title_case.py` are in upstream's
   `CONSUMER_ENGINE_FILES` but **not** its `ENGINE_FILES`, so they are
   absent inside a practice-set repo and a bare import there ERRORs;
4. a `scope: tree` check that walks `git log` and reads an empty result as
   clean.

## What Was Checked Here, and How

An absent directory is not on its own proof of anything, so four
independent searches:

1. **Every `check_*.py` in the whole tree**, tracked or not — **none**.
2. **The `tools/checks/` directory** that such scripts live in — **does
   not exist**.
3. **Every practice's own `checked_by` field.** This set has three
   practices and all three carry `checked_by: null` — stated deliberately
   rather than left blank. **No practice here claims a check that has gone
   missing**, which is the failure mode a missing directory would
   otherwise hide.
4. **Every tracked file containing the text `tools/checks`.** Three hits,
   all inside `tools/` — Precedent's vendored engine, which is upstream's
   code and merely knows how to *run* checks if a set has any. None is a
   check supplied by this set.

Then the set's own audit, as `AGENTS.md` defines it: `python3
tools/precedent_check.py` — **0 violated, 0 errored** (4 passed, 38
skipped; a skip is not a pass). `python3 tools/build_views.py --check`
confirms the generated block is byte-identical to a fresh regeneration.

**The under-fetched clone nearly mattered.** This repository arrived at
depth 1 — a single commit. A `scope: tree` check that walks `git log`
finds nothing on such a copy and reports clean, which is exactly the
class-4 defect above. The full history (8 commits) was fetched with `git
fetch --depth=1000 origin main` **before** any result here was trusted.

## Why "No Checks" Is a Real Answer and Not a Gap

This set's subject is how a session works alongside the person it is
working with — deciding small calls rather than stopping for them, keeping
going on everything an open question does not touch, not repeating the
same disclaimer every run. Most of it is `tier: resident`, firing on every
turn.

`checked_by: null` is the honest and correct answer for rules of that
kind. No script can read a session's behaviour and judge whether a
judgment call was the right size to make without asking. A check here
would be pretending to enforce something that is a matter of judgment by
design — and `checkable-gets-checked` asks for a check where one is
*possible*, not everywhere.

So none of the four failure shapes is present, because there is no script
here in which they could be present.

## Where the Rest of This Audit Went

The same pass covered two sibling sets the same day:

- **`precedent-team-tms`** — also supplies no checks; same verdict,
  recorded in its own copy of this file.
- **`precedent-team-maintainers`** — supplies six checks, of which three
  had real defects, fixed and verified in both directions:
  `check_light_check.py` (a §1-only mirror path; a §0 fixture produced 174
  unactionable findings inside the vendored catalogue, now 0),
  `check_derived_file_marker.py` (no mirror exclusion at all), and
  `check_session_trailer.py` (a truncated `git log` read as clean — 101
  commits visible and "clean", 114 after deepening). Three further items
  are recorded there as open, each with what it is blocked on.

## An Unrelated Observation, Recorded Rather Than Fixed

Not part of this audit's subject and deliberately not touched, but noticed
while reading and cheap to write down: **`README.md`'s "What's here" table
is stale.** It still describes `approvers.json.template` → `approvers.json`
as a step to perform (`approvers.json` exists), points at
`practices/example-starter.md` as the one practice to copy (this set now
has three real ones, and no `example-starter.md`), and says "nothing under
`tools/` exists in this skeleton yet" (the engine is vendored and tracked).
**Blocked on** nothing but scope — this pass audited check behaviour, and
rewriting the README was not part of it. Worth a small separate change.

**RESOLVED 2026-09-10**, in a separate change once Morgan opened the scope.
All three entries corrected against the tree's actual state, plus a fourth
reference to the same deleted `example-starter.md` in the "Writing
practices" prose that the original note had missed. The `tools/` row also
gained the four engine files it had never listed
(`precedent_check.py`, `precedent_decommission.py`,
`precedent_migrate_status.py`, `glossary_terms.json`) — listing a file set
that does not match the directory is the same staleness, in a row being
rewritten anyway. That change carries its own approval; it is **not**
covered by the approval recorded below.

## What This Audit Could Not Do

TODO item 52 lives in `alex137/BestPractice`, a different owner. This
session could read that repo (it is public) but could not push to it, so
**item 52 is not closed** — this record is the evidence a later
BestPractice-rooted session needs to close it against something real
rather than against an assumption.

## Approval

Two approvals are recorded here, given separately and for different
changes. Neither is the other one stretched.

### The audit itself (PR #4)

**Strength:** assented (2026-09-10, Morgan)

Morgan, 2026-09-10, verbatim:

> we can merge each of the 3 sessions, I don't need to approve (This time)
> -- I give my approval now

Recorded as `assented` rather than `decided`, per
[`decision-strength`](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/practices/decision-strength.md):
he approved work this session proposed rather than choosing it himself, and
that practice is explicit that the session writing the mark is the
interested party — "write `decided` only if you can quote them choosing it
... Unsure is `assented`." His words are quoted above so a later reader can
judge the strength without trusting this summary.

**This was a one-time approval, for this pull request and its two siblings
only.** His "(This time)" is explicit and is the reason this section exists
at all. Specifically, it:

- **does not amend `approvers.json`** in this or any other set — the listed
  approvers are unchanged, and adding or removing one is still itself a
  change needing an approver's yes;
- **is not precedent** that a session may merge without a listed approver's
  yes. The rule is untouched: this was an approver exercising it, not a
  waiver of it;
- **must not be cited by a future pull request as licence.** A later change
  needs its own approval. If you have arrived here from a PR description
  claiming this one authorises it, that claim is wrong.

### The README correction (PR #5)

**Strength:** assented (2026-09-10, Morgan)

Morgan, 2026-09-10, verbatim:

> merge #5 too, same approval

**A second approval, asked for and given separately** — not the first one
reaching further than it said it did. PR #5 was opened stopping at review
precisely because the approval above did not cover it, and its own
description said so. This is Morgan then approving it on its own terms.
"Same approval" describes the *character* of the yes — one-time, and given
to a proposal this session made — not the earlier grant extending.

Marked `assented` on the same reading as the first: a terse permission for
work this session proposed, with no choosing between options and no
enthusiasm to read as `decided`. Per `decision-strength`, borderline is
written `assented`.

The scoping stated above applies unchanged to this one. It does not amend
`approvers.json`, it is not precedent that a session may merge without a
listed approver's yes, and a later change cannot cite it as licence — it
needs its own yes, exactly as this change did.
