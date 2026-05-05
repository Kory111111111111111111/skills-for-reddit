# Workspace Instructions

Follow the Ralph workflow and use the `.ralph/` directory as persistent workspace memory.

## Instruction order
- Follow system and platform rules first.
- Then follow the user’s current request.
- Then follow repository-specific conventions and documented project patterns.
- Then follow this file.
- If two instructions conflict at the same priority, prefer the more task-specific one.
- If a higher-priority rule prevents the ideal technical solution, follow the higher-priority rule and explain the trade-off briefly.

## General rules
- Understand the application and intended user workflow before editing.
- If the `.ralph/` workspace memory is missing or still blank, run the `/init-ralph` skill before substantive work.
- Start from the most concrete local evidence available before exploring broadly.
- Default to doing the work, not only describing it, when investigation, editing, and validation are safe.
- Prefer changes that are consistent with existing architecture and design patterns.
- Avoid speculative refactors unless they clearly reduce complexity or fix real issues.
- Keep modifications scoped and verifiable.
- Preserve existing user work and avoid overwriting unrelated changes.
- Be explicit about uncertainty, assumptions, and risk.

## Workflow expectations
- Before substantive edits, identify the relevant code path, likely intent, and a cheap way to validate the planned change.
- Prefer small, testable edits over broad rewrites.
- After the first substantive edit, run the narrowest useful validation before continuing when possible.
- Reuse existing codebase patterns, dependencies, naming, and structure unless the task clearly requires a new pattern.
- Do not leave controls, flows, or interactions in a half-implemented state.

## Implementation standards
- Reuse existing components and patterns before introducing new abstractions.
- Keep naming consistent with the codebase.
- Avoid dead code and placeholder UI.
- Implement complete interaction states where relevant.
- Prefer root-cause fixes over symptom patches when the root cause is reasonably reachable.
- Avoid adding new dependencies when built-in or existing project utilities are sufficient.
- Update nearby documentation when setup, behavior, or usage changes materially.

## UI and design standards
- Maintain consistent spacing, alignment, and hierarchy.
- Ensure text fits inside components and remains readable.
- Ensure component placement makes sense in user workflow.
- Add animations only if they improve clarity and feel intentional.
- Cover loading, empty, error, disabled, and success states.
- Avoid controls that appear interactive but do nothing.

## Verification standards
Before handoff, run the narrowest useful checks first, then broader checks as needed. Run all relevant verification available in the repo when applicable:
- focused repro or behavior check
- lint
- typecheck
- tests
- build
- local runtime checks when possible

Always report:
- what was run,
- what passed,
- what could not be run,
- remaining risks or assumptions.

Update `.ralph/verification-report.md` and `.ralph/handoff.md`.

## Safety and boundaries
- Do not use destructive git or filesystem operations unless the user explicitly asks for them or they are clearly reversible and necessary.
- Do not expose secrets, credentials, or sensitive configuration in outputs, diffs, or summaries.
- For security-sensitive changes, move carefully, validate assumptions explicitly, and prefer the safer interpretation when requirements are ambiguous.
- Do not claim a change is production-ready or fully verified unless it has been validated to that level.

## Interruption rules
Do not repeatedly ask what to do next.
Only interrupt when:
- product intent is unclear,
- a decision would materially alter expected behavior,
- access, secrets, or approval are needed,
- multiple incompatible solutions are equally plausible.

## Completion standard
A task is complete only when:
- the requested outcome is implemented, answered, or reviewed,
- the touched area has been validated as far as the environment allows,
- `.ralph/verification-report.md` and `.ralph/handoff.md` are updated when relevant,
- any remaining risks, unknowns, or unrun checks are stated plainly,
- no obvious requested follow-up work has been silently skipped.
