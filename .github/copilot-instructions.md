# Project Guidelines

## Purpose
- This repository is the source of truth for the WAVFin workflow assets: rules, instructions, prompts, indexes, and supporting workspace scripts.
- Optimize for cohesion across those surfaces. Prefer changes that keep naming, scope, trigger language, and expected behavior aligned.

## Boundaries
- Treat `.ralph/` as reference material only in this repository. Do not create, update, or rely on `.ralph/` task docs unless the user explicitly asks for that work.
- Keep planning, verification, and handoff reporting in chat by default.
- Do not expand the repo with unrelated product code; focus on the workflow assets that make the agent behavior consistent and reliable.

## Working Style
- Start from the concrete customization surface being changed: workspace instructions, prompts, skills metadata, rules, or supporting scripts.
- Prefer recognized VS Code customization locations and conventions over ad hoc files when introducing or consolidating guidance.
- Keep repo-wide instructions minimal and repo-specific. Link to existing docs instead of duplicating their full contents.
- When editing instructions, prompts, or indexes, make sure names, descriptions, arguments, referenced files, and intended invocation paths agree with each other.
- If two guidance files overlap, consolidate toward the active customization surface instead of letting parallel rules drift.

## Skill And Research Routing
- Before inventing a new workflow, check `skills-index.yaml` and the relevant `.github/skills/*/SKILL.md` file to see whether the repo already defines a matching skill.
- Use skills for repeatable multi-step workflows, and keep the instruction layer focused on routing, scope, and conflict resolution.
- Use the web when correctness depends on current official docs, standards, or reference implementations; prefer primary sources.
- Use a read-only subagent for broad exploration or independent audits, then verify the recommended files locally before editing.
- In this repo, `init-ralph` is opt-in only: never use it unless the user explicitly asks for Ralph initialization or refresh work.
- If the repo also contains a reusable instruction template or source document, keep it aligned and non-conflicting with this file. `.github/copilot-instructions.md` remains the authoritative workspace-wide instruction surface.

## References
- Use [.github/copilot-instructions.md](copilot-instructions.md) as the active workspace instruction file for this repository.
- If a separate reusable instruction template exists, keep it aligned with this file without depending on a fixed filename.

## Validation
- After changing workflow assets, verify the file lives in the correct customization location and that any frontmatter, paths, and cross-references are valid.
- Prefer the smallest check that proves the change improves cohesion without introducing conflicting guidance.