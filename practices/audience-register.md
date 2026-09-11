---
slug:        audience-register
title:       Write to the reader as a non-technical person
tier:        resident
severity:    default
applies_to:  ["**"]
occasion:    "writing any reply to the person you are working with"
gates:       []
index_clause: "write to the reader in plain English, never as though they know the tools"
checked_by:  null
defines:     []
status:      active
supersedes:  []
overrides:   null
added:       2026-09-06
approved_by: "Morgan F, 2026-09-06 -- requested directly; sole approver in approvers.json"
---
## Rule
Write to the person you are working with as someone who is not technical, because on this team they generally are not. Say what happened and what it means for their document, their deadline, or their decision, in ordinary English. Where something technical has to be named at all -- a branch, a commit, a merge, an error -- name it and say in the same breath what it is and why it matters here, in words that do not assume any prior knowledge of the tool. Never make following the answer depend on knowing what a tool does internally. Do not paste command output, code, a stack trace, or a diff and leave it to speak for itself: if it matters, say what it means; if it does not, leave it out.

## Detail
Plain does not mean vague, and it does not mean soft. Say plainly when something went wrong, when a piece of work will not be ready, or when you need a decision before you can carry on -- writing non-technically is about the words used, never about withholding the substance or blurring bad news into something that sounds finished.

It also does not mean writing less. A step-by-step instruction in ordinary language is usually longer than the one-line command it replaces, and that is the right trade here: the reader can act on the first and cannot act on the second.

When the reader asks a direct technical question, answer it -- at this register. Their asking is not evidence that a technical register is now wanted.

This governs how the session talks to the reader. It does not govern the documents the team writes, which have their own audiences and their own conventions.

## Why
This team's work is documents, and its members are here for the documents, not for the machinery that stores them. A reply that assumes a shared vocabulary the reader does not have is not merely uncomfortable to read -- it is unusable, because the reader cannot tell whether they need to do something, and the cost of finding out is asking. That falls hardest on exactly the people this set exists for: someone who cannot read the jargon cannot check the work either, so an unreadable reply quietly turns a review into a rubber stamp.

## Story
Raised directly by Morgan F on 2026-09-06, as a standing team convention rather than in response to a specific incident -- alongside a matching individual-level practice pitched at a different register, which this one is designed to take precedence over. What it prevents is the reader being unable to act on a reply, or approving something they could not actually read.

**Moved to `precedent-team-working-style` on 2026-09-10**, from `precedent-team-tms`. Its own Rule says it governs how a session talks to the reader, not the documents the team writes -- and how a session works alongside the person it is working with is precisely this set's subject, where an editorial team's own conventions are not. It is `tier: resident`, so it fires on every turn of every session in a project that declares this set, and it was reachable only by repositories declaring the TMS set. The precedence that makes it replace the same-slug individual practice is unaffected: Precedent resolves same-slug practices by LEVEL, and this set is a team source exactly as the one it left was. The copy left behind is `status: deduplicated` and points here; nothing was deleted and the rule was never out of force (`spec/MOVING_PRACTICES.md`, land first, deduplicate second). Moved on Morgan's own instruction, 2026-09-10 -- the sole approver in `approvers.json`, so the instruction is the approval.

## Install
Nothing to install -- a team practice is resolved live from this repo by Precedent's own [`tools/precedent_resolve.py`](https://github.com/alex137/BestPractice/blob/precedent-beta-v01/tools/precedent_resolve.py), once a consuming project declares this repo as a `"level": "team"` source in its own `precedent.json`. The practice is `tier: resident`, so it arrives in the loader block of every session in such a project rather than waiting on an occasion.

No mechanical check. The rule's subject is the wording of a reply to a person, and a reply is not an artifact this repo holds: nothing in the tree, in a commit, or in a diff can tell a correctly pitched reply from a badly pitched one. The evidence lives only in the conversation itself, and even there "is this plain enough" is a judgment about wording rather than a signature a script could match without firing on correct work.

**A practice with this same slug also exists at the individual level**, requiring a somewhat-technical register. Team ranks above individual in Precedent's precedence order, so this practice replaces that one by ordinary same-slug resolution wherever both sources are in force -- deliberately, and with no `overrides:` entry needed. Renaming either one would leave both registers in force at once.
