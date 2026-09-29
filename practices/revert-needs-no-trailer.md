---
slug:        revert-needs-no-trailer
title:       A revert needs no Session trailer
tier:        on-demand
severity:    advisory
applies_to:  ["**"]
occasion:    "committing a revert, or a trailer check flags one"
gates:       []
index_clause: "a revert commit may leave out the Session: trailer"
checked_by:  null
defines:     []
status:      active
supersedes:  []
overrides:   null
added:       "2026-09-29"
approved_by: "Morgan F, 2026-09-29"
in_force_at: null
source_practice_number: null
strength: decided
---
## Rule
**A revert commit may leave out the `Session:` trailer** that
`session-trailer` (universal) asks for on every other commit. A revert is
`Revert "<subject>"` with `This reverts commit <sha>.` in its body -- what
`git revert` and GitHub's revert button write. Adding the trailer is still
welcome; it is simply not required.

## Detail
The exemption covers reverts only. A commit that undoes something by hand,
with its own message, is new work and still carries the trailer.

The trailer check in the repository-maintenance set honours this practice
only where it resolves in force: it asks the engine's own resolver, so a
repository whose declared sets do not include this one keeps requiring the
trailer on reverts.

## Why
A revert's reason is the commit it names, and the trailer on that commit
already leads back to the session that made the change being undone. Asking
for a second link on the undo adds friction at the moment someone is
backing out of a mistake quickly.

## Story
2026-09-29, Morgan, while approving the change that made the trailer check
judge only what a push carries: *"I think we should update the 'Session'
trailer rule to say that it is okay if reverts don't have it ... And I think
this should be in the working-style repo, maybe Alex or others don't want to
include that."* So the exemption lives in this set, which a team declares
by choice, rather than in the universal rule everyone gets.

## Install
No check of its own: the trailer check reads whether this practice is in
force and skips reverts when it is.
