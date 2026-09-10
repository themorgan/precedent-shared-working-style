<!-- Template: instantiated by `tools/precedent_bootstrap_source.py --level team`
     (Precedent, https://github.com/alex137/BestPractice). Placeholders
     (precedent-team-working-style, Morgan F, themorgan) are filled in at
     bootstrap time; edit this file freely afterward, it is yours. -->

# precedent-team-working-style — a team practice set

This is **precedent-team-working-style's own private space** — one per team, holding the
conventions that team has agreed on. Everyone on the team can read it;
nobody else can.

## What's here

| File | What it's for |
|---|---|
| [`approvers.json`](approvers.json) | The list of people who can say yes to a change here — currently Morgan F. Run `python3 tools/build_codeowners.py` after editing it: that writes [`CODEOWNERS`](CODEOWNERS), which is what actually makes GitHub require an approver's review. Never hand-edit `CODEOWNERS`; it is regenerated wholesale. Adding or removing an approver is itself a change to this set, so it needs a current approver's own yes. |
| [`practices/`](practices/) | This set's practices, one file each: [`nonblocking-questions.md`](practices/nonblocking-questions.md), [`small-calls.md`](practices/small-calls.md) and [`quiet-checks.md`](practices/quiet-checks.md). The first two are `tier: resident`, so they load on every turn in a project that declares this set. (`example-starter.md`, the placeholder this set was bootstrapped with, was deleted once these landed — which is what its own text asked for.) |
| [`leak-blocklist.txt`](leak-blocklist.txt) | The private-term blocklist for Precedent's leak gate — client names, code words, anything that must never reach a public repo. Fill it in; see the file's own header for the format and the two environment/git settings that switch it on. |
| [`SOURCE_CHECK_AUDIT_FINDINGS.md`](SOURCE_CHECK_AUDIT_FINDINGS.md) | The record of a 2026-09-10 audit asking whether this set ships check scripts carrying assumptions about how an adopting project is laid out. It ships none — the right answer for a set whose rules are matters of judgment — so the file is mostly a record of *how* that was established (four independent searches, not just a missing directory), written down so nobody repeats the pass. It also notes, without fixing, that this table is stale in three places. |
| [`tools/`](tools/) | Precedent's vendored source-repo engine, tracked and present: `build_views.py` and its companion `glossary_terms.json`, `build_codeowners.py`, `precedent_check.py`, `precedent_decommission.py`, `precedent_gate.py`, `precedent_migrate_status.py`, `precedent_paths.py`, `precedent_show.py`, `split_practices.py`, a trimmed `routing_scope.json`, and `precedent_vendor_engine.py` itself. Never hand-edit these — [`tools/ENGINE_MANIFEST.json`](tools/ENGINE_MANIFEST.json) records the BestPractice commit and a sha256 per file, so a hand-edit is detected as drift and refused. Refresh with `python3 tools/precedent_vendor_engine.py refresh <bestpractice-clone>`; see [`spec/BOOTSTRAP_NEW_SOURCES.md`](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/spec/BOOTSTRAP_NEW_SOURCES.md#the-vendored-engine)'s "The vendored engine". |

## Writing practices

Each practice is one file under `practices/`, in Precedent's phase-1
format — frontmatter plus `## Rule` / `## Detail` / `## Why` / `## Story` /
`## Install`. The full spec is
[Precedent's `spec/PRACTICE_FORMAT.md`](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/spec/PRACTICE_FORMAT.md);
[`practices/small-calls.md`](practices/small-calls.md) in this repo shows the shape directly.

## Approval

An assistant proposes a practice and asks an approver to look at it — a
review on this repo, so the approval *is* the record. `approvers.json`
holds the list `tools/precedent_land.py` checks a proposer's name against;
adding or removing an approver is itself a change to that file, so it
needs a current approver's own agreement, which is what stops someone
quietly adding themselves.

If the approver is also the person proposing the change — for a small
team, it usually is — there's no waiting: their "yes" in the conversation
*is* the approval, landed directly in the same sitting.

**Nobody is ever blocked waiting for a team approval to *use* a practice
right now.** Put it in your own individual set instead, where it applies
immediately with nobody's permission; offering it to the team is a
separate step, whenever it suits you.
