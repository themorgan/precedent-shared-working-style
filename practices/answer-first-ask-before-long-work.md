---
slug:        answer-first-ask-before-long-work
title:       Answer the easy questions first; propose a long task before starting it
tier:        resident
severity:    default
applies_to:  ["**"]
occasion:    "a turn that could start a computation, search or build lasting longer than a few minutes"
gates:       []
index_clause: "easy answers first; a long run is proposed with its cost -- never just started"
checked_by:  null
defines:     ["long task"]
status:      active
in_force_at: null
supersedes:  []
overrides:   null
added:       "2026-09-23"
approved_by: "Morgan F, 2026-09-23 -- moved from the universal catalogue (BestPractice) to precedent-shared-working-style as part of a cross-repo practice-placement review; strength: decided"
strength:    decided
---
## Rule
Three parts. **(1) Answer the easy questions in a message before starting
anything long** — in the same turn; the long run never gates the answer.
**(2) A task that will run longer than a few minutes is proposed, not
started:** what it is, how long from the tool's own cost line, what it
blocks and what it does not, then the go-ahead. The exceptions are the
checks a commit needs on the files the turn touched, and a run already
asked for by name. **(3) When idle on a wait, say what the wait is for,
what it will change, and how to stop it** — never a bare "still running".
A background task nobody asked for is stopped, not waited on.

## Detail
**What part 1 means by an easy question:** one answered from what is already
known, without waiting on a run. **What part 2 means by a long task:** a
cold solve, a search family, a re-solve cascade, a whole-tree gate. Both
were in the Rule until 2026-09-21 (see `## Story`).

"A few minutes" is the boundary at which a person would rather have been
asked: below it the run is cheaper than the exchange; above it the run
is a decision about their time and their machine. The proposal is one
message: the task, its estimated duration from a measured cost line
(never a guess), what the person can and cannot do meanwhile, and the
question. A run that was authorized once is not authorized again after
its inputs change — a merge that re-keys a cache is a new proposal.

## Why
A long run started unasked costs twice: the person waits for something
they did not choose, and the easy answers they did ask for wait behind
it. And a wait nobody explained is indistinguishable from a hang, so the
person either interrupts healthy work or sits through dead work.

## Story
A session launched an hours-long re-solve while four conceptual
questions sat unanswered, then sat on a ninety-minute cold solve after a
merge invalidated a cache, before answering a one-line question about
the merge itself. The person's direction, adopted as the rule: do not
start long tasks without checking first, and answer the easy questions
before anything else.

This was a downstream consumer's own contribution to the universal
catalogue -- S. Alexander Jacobson's direction in dependent repo #1,
adopted verbatim, "As a general practice, we should not start long tasks
without checking with the user about doing so and without answering easy
questions first," checked in from that repo 2026-09-17.

**Rule compressed 2026-09-21**, in the reduction pass recorded in
[todo-2026-09-21-resident-cap-was-measured-on-the-wrong-shape.md](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/todo/todo-2026-09-21-resident-cap-was-measured-on-the-wrong-shape.md).
208 tokens -> 124. All three parts stayed; what moved into `## Detail` is
the pair of definitions the Rule was carrying inline -- what counts as an
easy question, and the four examples of a long task. The exceptions stayed
in the Rule, because a session reads them at the moment it is deciding
whether to ask.

**2026-09-23: moved here from the universal catalogue**, in a cross-repo
practice-placement review, as squarely working-style's own subject -- how
a session works alongside the person it is working with. Landed as
`tier: resident` here too, so a repo that declares this team set keeps the
same every-turn behavior it had from universal. **Disclosed cost of the
move**: this practice reached every Precedent consumer while it lived in
universal, including the downstream repo that originally contributed it;
moved here, it only reaches a repo that explicitly declares
precedent-shared-working-style. Morgan approved the move knowing that
trade-off; the universal copy is deduplicated and points here.

## Install
Adopt the rule in the working-conventions file and name the cost-line
convention it depends on (every heavy tool prints its estimated duration
before it runs; see
[slow-steps-report-and-cache](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/practices/slow-steps-report-and-cache.md) for the
progress line and the memo, and
[scripts-assert-properties](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/practices/scripts-assert-properties.md) for the
model-side discipline). A wait longer than a minute reports elapsed and
remaining time on its own.
