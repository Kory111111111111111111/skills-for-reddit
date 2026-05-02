---
name: init-skills
description: 'Bootstrap macro used to install dropped-in skills into proper IDE directories.'
user-invocable: true
disable-model-invocation: false
---

# Initialize Skills (Bootstrap Macro)

**CRITICAL NOTE FOR AI AGENTS**: This is technically **NOT** an installed skill yet. Because the user just dropped this folder into a new workspace, the IDE has not registered these skills. This document serves as your manual bootstrap procedure. 

## When to Use
- When the user pastes or drops this skills folder into a new project and tells you to "init-skills" or "setup skills".
- You must manually execute the procedure below to install everything so the IDE natively recognizes the slash commands.

## Installation Procedure

### Phase 1: Locate Resources
1. Scan the current workspace root for the dropped-in files: `RULES.md`, `skills-index.yaml`, and the skill directories (directories containing a `SKILL.md`).
2. If none are found, ask the user to specify where they dropped the skills folder.

### Phase 2: Determine Target Architecture
1. Detect or ask the user for their current IDE environment (e.g., Cursor, Windsurf, GitHub Copilot, Gemini).
2. Establish the **correct** target directory structure specifically designed for that IDE's tools, agents, or custom commands:
   - **Cursor**: Use `.cursor/rules/` for skills and point master rules to `.cursorrules` at the workspace root.
   - **Windsurf**: Use `.windsurf/rules/` for skills and point master rules to `.windsurfrules` at the workspace root.
   - **GitHub Copilot**: Use the appropriate folder for Copilot custom instructions/prompts (e.g., `.github/instructions/` or `.github/prompts/` for individual skill workflows/commands) and point master rules to `.github/copilot-instructions.md`.
   - **Gemini / Generic Agent**: Use `.agents/skills/` (or `.agents/workflows/`) for skills and point master rules to `RULES.md` at the workspace root.
   - **Other IDEs**: Determine the exact folder that the specific IDE natively uses for registering custom AI commands or agents. **DO NOT default to `.agents/` if the IDE uses a different convention.**

### Phase 3: Move & Install 
1. Move or copy all identified skill folders into the target directory.
2. If `RULES.md` was dropped, copy it to the root `.cursorrules`, `.windsurfrules`, or equivalent to act as the master system prompt across the IDE.
3. Move `skills-index.yaml` into the target directory alongside the skills.

### Phase 4: Validation
1. Verify each skill's `SKILL.md` is present in the new location.
2. Report success to the user with a list of the initialized skills and confirm the master ruleset is now active.

## Output
A properly structured directory for the specific IDE (e.g., `.agents/skills`, `.cursor/rules`, `.github/instructions`, etc.), a global config file (e.g., `.cursorrules`, `.github/copilot-instructions.md`, etc.), and a confirmation message summarizing available slash commands.
