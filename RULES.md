# Workspace Rules & Available Skills Baseline

**Purpose**: This document serves as the "drop-in" starting point for any AI Coding Agent entering this project. It defines your core behavioral directives and provides a complete directory of the custom skills installed in this workspace. 

---

## 1. CORE AI DIRECTIVES

When dropped into this project, you must immediately conform to these baseline rules:
1. **Proactive & Autonomous**: Do not ask for permission for simple fixes, refactors, or logical next steps. Implement them and report back. Only escalate destructive changes.
2. **Context Before Code**: Do not assume you know the architecture. Use filesystem tools (`grep_search`, `list_dir`, `view_file`) to map the existing patterns before suggesting changes.
3. **Atomic Changes**: Break complex implementations into testable, verifiable steps.
4. **Token Efficiency**: Communicate concisely. Omit conversational filler. Use Markdown structures (tables, lists).
5. **Pivot Handling**: If the user pivots or changes their mind, completely abandon the old context without debate and immediately adopt the new instruction.

---

## 2. HOW TO USE SKILLS

This workspace acts as a universal toolkit. You have access to a suite of highly refined skills (located in `.(github,cursor,agents)/skills/`).

*   **When to invoke them**: Trigger these skills automatically when the user's request aligns with the skill's purpose, or when the user explicitly calls a slash command (e.g., `/root-cause-debugging`).
*   **How to invoke them**: Read the skill's `SKILL.md` file in the directory to understand the exact workflow and decision gates required.

*(Note: If you need to install or synchronize these skills to a new project environment, run the `/init-skills` command or its equivalent setup script).*

---

## 3. INSTALLED SKILLS DIRECTORY

Below is the standard library of skills available in this workspace. Use them to ensure maximum consistency and quality.

### 🛠️ Environment Setup
*   **init-skills (Bootstrap Macro)**
    *   *Purpose*: This is **not** an installed IDE skill yet. It is the initial manual setup procedure. When a user asks to "Initialize skills", you must manually read the `init-skills/SKILL.md` file from the dropped folder and execute its instructions to install all other skills into the proper IDE directories.
    *   *When to use*: Immediately after pasting this workspace folder into a new project, or when setting up a fresh IDE environment.

### 🧠 Planning & Architecture
*   **/idea-to-project**
    *   *Purpose*: Turn rough ideas into structured project specifications and design directions.
    *   *When to use*: At the absolute start of a new module, app, or major feature block.
*   **/feature-implementation-planner**
    *   *Purpose*: Build a comprehensive, codebase-aware implementation plan before writing the actual code.
    *   *When to use*: Before tackling a complex multi-file feature.

### 🧹 Code Quality & Review
*   **/code-change-review**
    *   *Purpose*: Review code changes for bugs, regressions, and pattern mismatches.
    *   *When to use*: When a PR is completed, or the user wants an audit of recent changes.
*   **/agent-code-deslop**
    *   *Purpose*: Clean up messy, AI-generated code while preserving its exact behavior.
    *   *When to use*: When a file becomes cluttered, unreadable, or excessively complex due to rapid AI iteration.

### 🐛 Debugging & Fixing
*   **/root-cause-debugging**
    *   *Purpose*: Methodically find the verified causes of bugs, flaky behavior, and regressions.
    *   *When to use*: When facing runtime errors, logical bugs, or unpredictable behavior.
*   **/build-error-fix**
    *   *Purpose*: Investigate and resolve build, compilation, or linker errors.
    *   *When to use*: When the compiler or build system (e.g., CMake) fails.

### 🧪 Testing & Security
*   **/test-strategy-and-generation**
    *   *Purpose*: Choose and generate the smallest effective set of tests for a given change.
    *   *When to use*: After completing a feature or fixing a major bug.
*   **/security-and-hardening**
    *   *Purpose*: Review the attack surface and harden code against practical risks.
    *   *When to use*: Before finalizing network calls, memory allocations, or user-input handling.

### 🎛️ Project-Specific (JUCE/WAVFin Audio)
*(Only applicable if working in a JUCE/WAVFin repository)*
*   **/wavfin-juce-workflow-pt1**
    *   *Purpose*: Scaffold and build UI components specific to JUCE projects.
*   **/wavfin-juce-workflow-pt2**
    *   *Purpose*: Implement DSP and audio effects for JUCE projects (Depends on pt1).
*   **/ui-audit**
    *   *Purpose*: Conduct a comprehensive audit of a JUCE GUI for premium aesthetics and UX constraints.

---

## 4. ERROR LOOP PROTOCOL

If you fail to resolve a bug or compile error after **3 attempts**:
1. Stop implementing code.
2. Read `/root-cause-debugging/SKILL.md` to reset your troubleshooting approach.
3. Formulate a list of assumptions that might be wrong, present them to the user, and ask for direction.
