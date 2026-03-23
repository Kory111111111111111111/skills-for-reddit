---
name: code-change-review
description: 'Review AI-generated code changes for unintended consequences, logic errors, UI inconsistencies, and context-specific issues. Use when: code has just been modified, flag potential bugs, verify UI consistency, check implementation correctness against project patterns.'
argument-hint: 'Describe the change or file(s) to review'
user-invocable: true
---

# Code Change Review

## Purpose

This skill guides thorough post-change code review to catch issues AI agents commonly miss: unintended side effects, logic errors unintuitive to the codebase, UI inconsistencies, and implementation details that don't align with project context.

## When to Use

- After AI agents make modifications to code
- Before committing changes to verify quality
- When suspicious about consistency or hidden impacts
- Testing cross-cutting effects (styling, state management, routing)
- UI/UX quality check for visual consistency

## Philosophy

The best changes are the ones that appear *invisible* — they fit seamlessly into the existing codebase without standing out. This skill helps ensure changes follow project patterns, don't introduce unnecessary complexity, and don't break subtle invariants.

---

## Review Checklist: Logic & Implementation

Use this checklist when reviewing functional code changes.

### 1. Context & Intent
- [ ] Change aligns with the stated objective?
- [ ] No gold-plating (over-engineering, premature optimization)?
- [ ] Solution follows the simplest path for this codebase?

### 2. Unintended Side Effects
- [ ] Check all functions called by modified code — could they have unexpected behavior in this context?
- [ ] State mutations: does this modify shared state that other parts depend on?
- [ ] Configuration/globals: does this change affect other modules or features?
- [ ] Lifecycle hooks: does this trigger initialization-time side effects elsewhere?

### 3. Error Handling & Edge Cases
- [ ] Null/undefined/empty inputs handled?
- [ ] Boundary conditions tested (zero, negative, very large numbers)?
- [ ] What happens if external calls fail (API, database, file I/O)?
- [ ] Error messages are clear and actionable?

### 4. Implementation Correctness
- [ ] Logic matches the actual intent (not just semantically, but for this project)?
- [ ] Any assumptions about data shape/format validated?
- [ ] Loop logic correct (off-by-one errors, termination conditions)?
- [ ] Conditional logic covers all branches (no unreachable code)?
- [ ] Type safety checks pass (no implicit coercions that surprise)?

### 5. Code Style & Patterns
- [ ] Follows project conventions (naming, structure, idioms)?
- [ ] No inconsistent patterns compared to similar code nearby?
- [ ] Variable names clear and consistent with codebase glossary?
- [ ] Function/method too long or doing multiple things?

### 6. Dependencies & Imports
- [ ] New imports actually used (no leftover dead imports)?
- [ ] Circular dependencies introduced?
- [ ] External library versions compatible?
- [ ] Breaking changes in used APIs checked?

### 7. Performance & Scalability
- [ ] Inefficient loops or repeated calculations?
- [ ] Deep nesting or large intermediate data structures?
- [ ] Could this cause performance degradation with scale?
- [ ] Any unintended logging or debug statements left?

---

## Review Checklist: UI/UX Consistency

Use this checklist when reviewing UI components, styling, or layout changes.

### 1. Visual Consistency
- [ ] Font sizes match existing components (heading, body, label hierarchy)?
- [ ] Color palette uses defined colors, not arbitrary hex/rgb?
- [ ] Spacing/padding consistent with design system (8px grid, multiples of base unit)?
- [ ] Border radius, shadows, stroke weights match existing pattern?

### 2. Layout & Placement
- [ ] Component positioned logically in visual hierarchy?
- [ ] Alignment consistent with surrounding elements?
- [ ] Responsiveness maintained (mobile/tablet/desktop views)?
- [ ] Z-index conflicts or layering issues?

### 3. Interactive Elements
- [ ] Button states (hover, active, disabled) styled consistently?
- [ ] Focus states visible and accessible (keyboard navigation)?
- [ ] Touch targets proper size (minimum 44x44px on mobile)?
- [ ] Feedback provided for user actions (loading, success, error)?

### 4. Content & Text
- [ ] Line length reasonable (not too wide, not cramped)?
- [ ] Text contrast sufficient for accessibility?
- [ ] Capitalization, labels, placeholder text consistent with conventions?
- [ ] No truncated text without tooltips/overflow handling?

### 5. State Management (UI)
- [ ] Loading states visible and distinguishable?
- [ ] Empty states, error states properly designed?
- [ ] Disabled states visually clear and not interactive?
- [ ] Transitions/animations smooth, not jarring?

### 6. Integration with Design System
- [ ] Uses existing component library instead of custom styles?
- [ ] Theme/dark mode support maintained if applicable?
- [ ] CSS classes/utilities follow naming conventions?
- [ ] No inline styles when design system equivalents exist?

---

## Step-by-Step Procedure

### Phase 1: Understand the Change
1. **Read the change request** — what was the user asking for?
2. **Scan the diff** — what files changed? How extensive?
3. **Identify scope** — is this localized or cross-cutting?

### Phase 2: Logic Review (if code modified)
1. **Trace execution paths** — follow the modified code through its callers and callees
2. **Check assumptions** — are implicit assumptions about data/state valid?
3. **Look for edge cases** — try to break the logic mentally with unusual inputs
4. **Verify patterns match** — does this follow similar code patterns in the project?
5. **Test mentally** — would this work correctly in production conditions?

### Phase 3: UI Review (if UI modified)
1. **Visual scan** — does it look consistent with the rest of the app?
2. **Component hierarchy** — do sizes, spacing, colors follow the design system?
3. **Interactive behavior** — test hover, focus, active states mentally
4. **Across devices** — imagine how this looks on mobile, tablet, desktop
5. **Dark mode check** — if applicable, does this work in both themes?

### Phase 4: Integration & Context
1. **Related code** — what else depends on this? Could it break?
2. **Configuration** — are there env vars, settings, permissions to validate?
3. **External systems** — does this call APIs, databases, or services correctly?
4. **Documentation** — do comments/docs need updates?

### Phase 5: Report & Recommend
- List specific issues found (with line numbers if applicable)
- For each issue, identify: *what*, *why it matters*, *how to fix*
- Rank by severity (breaking, high, medium, low)
- Suggest improvements even if functionally correct

---

## Common Red Flags

Watch for these patterns when reviewing AI-generated changes:

| Red Flag | What It Means | Check |
|----------|------------------|-------|
| Overly defensive code | Too many null checks, type guards for things that shouldn't be null | Traces assumptions — are they valid? |
| New utility function doing work that exists elsewhere | Code duplication or missing abstraction | Search for similar logic in codebase |
| Magic numbers or strings | Hardcoded values that should be constants/config | Find where same values defined elsewhere |
| Nested ternaries or complex conditionals | Hard to reason about logic | Simplify to guard clauses or early returns |
| Inconsistent error handling | mix of try/catch, if-checks, silent failures | Standardize to project's error pattern |
| Unused variables after refactor | Leftover declarations | Search for actual usage |
| New dependency added without thought | Library bloat or version conflicts | Check if something similar exists in project |
| State mutation in pure function context | Unexpected side effects | Check whether function should be pure |
| CSS specificity arms race | `!important`, deeply nested selectors, inline styles | Migrate to design system utilities |
| Component too complex | Too many props, state, or nested children | Consider splitting or simplifying |

For concrete examples of negative patterns to avoid and positive patterns to follow, see [Pattern Reference](./references/patterns.md).

---

## Example Triggers

Ask for this skill when:
- "Review this change for bugs or issues I might have missed"
- "Check if this implementation fits our codebase patterns"
- "Look for UI inconsistencies in this component"
- "Find any unintended side effects from this change"
- "Verify this looks right and follows our conventions"

---

## Quick Reference

**For quick reviews**: Use the [Common Red Flags](#common-red-flags) table and spot-check 2-3 items.

**For thorough reviews**: Walk through [Phase 1-5](#step-by-step-procedure) systematically.

**For UI-heavy changes**: Prioritize [UI/UX Checklist](#review-checklist-uiux-consistency).

**For complex logic**: Prioritize [Logic Checklist](#review-checklist-logic--implementation) and trace execution paths carefully.
