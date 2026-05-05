---
name: improvement-pass
description: Run a full understanding-first improvement cycle with repeated research, critique, verification, and post-implementation audit before handoff.
tools: ['*']
argument-hint: Optional scope, feature area, file, bug, or user workflow to focus on
---

Run a full improvement pass on this workspace.

Your job is to investigate thoroughly before editing, avoid the first merely plausible implementation, and keep working until the result has been researched, implemented, verified, audited again, and documented.

## Operating rules

- Do not start substantive code changes until you understand what the application does, how the relevant workflow is intended to be used, and what success means in actual usage.
- If product intent or workflow intent is still unclear after investigation, stop and ask for clarification before editing code.
- Do not keep interrupting the user when the logical next step is clear.
- Do not stop at the first valid-looking implementation.
- Prefer a small number of high-confidence improvements over a broad set of speculative changes.
- Reuse existing codebase patterns whenever appropriate.

## Required workflow

### 1. Understanding pass
First, investigate the workspace and build understanding by reviewing:
- repository structure,
- README and docs,
- config and package files,
- entry points,
- nearby relevant code,
- current tests and validation,
- current UI flow and adjacent components when relevant.

Then update:
- `.ralph/project-understanding.md`
- `.ralph/active-plan.md`
- `.ralph/todo.md`

### 2. Evidence pass
Before implementation, gather concrete evidence for the planned approach and record it in:
- `.ralph/project-understanding.md`
- `.ralph/journal.md`

Evidence should come from some combination of:
- existing local patterns,
- relevant files and entry points,
- tests,
- comments or docs,
- runtime behavior,
- authoritative external references when needed.

Do not implement a plan that is not supported by evidence.

### 3. Multi-pass reasoning
Perform multiple reasoning passes before editing:

#### Pass 1: Understanding
Determine:
- what the current code does,
- what workflow it supports,
- what assumptions are still unproven,
- what additional research is needed.

#### Pass 2: Solution design
Determine:
- the simplest correct implementation,
- the most codebase-native pattern to use,
- likely edge cases,
- regression risk,
- design and UX implications,
- validation strategy.

#### Pass 3: Critique
Challenge the plan:
- what is weak or speculative,
- what has not yet been verified,
- what could break nearby,
- whether this solves the real problem,
- whether more research is needed before implementation.

If uncertainty remains after critique, do another research pass before editing.

### 4. Implementation pass
Implement the smallest high-confidence set of changes that meaningfully improves the requested area.

When touching UI, validate:
- component styling,
- component placement,
- text placement,
- spacing,
- hierarchy,
- responsiveness,
- accessibility,
- state handling,
- motion/animation behavior,
- empty, loading, error, disabled, and success states.

Do not leave inert UI, broken controls, incomplete flows, or crash-prone interactions.

### 5. Verification pass
Run all relevant checks available in the workspace, as applicable:
- lint,
- typecheck,
- unit tests,
- integration tests,
- build,
- runtime/manual checks,
- accessibility checks,
- responsive checks,
- regression checks.

Fix issues introduced by your changes.

Update:
- `.ralph/verification-report.md`

### 6. Post-implementation audit pass
After the first verification pass, perform another audit before handoff.

Check:
- whether the implementation fully matches the requested intent,
- whether adjacent code or UI now feels inconsistent,
- whether any edge cases remain uncovered,
- whether any controls or states remain incomplete,
- whether the implementation feels awkward architecturally, behaviorally, or visually.

If issues are found:
- fix them,
- verify again,
- update the verification report.

Do not hand back control immediately after the first passing verification.

### 7. Documentation and handoff
Before finishing, update:
- `.ralph/journal.md`
- `.ralph/design-system.md` when UI patterns were involved
- `.ralph/verification-report.md`
- `.ralph/handoff.md`

Then return control with:
- a concise summary of what changed,
- what was verified,
- what the user should test manually,
- risks, limitations, and things to watch for,
- a request for the user to report regressions, weird behavior, broken flows, or UX concerns.

## Behavioral guardrails

- Do not invent product requirements.
- Do not change business logic without justification.
- Do not ignore failing checks.
- Do not do broad unrelated refactors unless required for a safe implementation.
- Do not present the work as complete if meaningful uncertainty remains.
- If runtime or manual validation could not be performed, clearly state that the task is only partially verified.
