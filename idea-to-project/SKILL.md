---
name: idea-to-project
description: 'Turn small ideas into fully-fledged projects through structured discovery, research, and specification. Use when: starting a new project from a rough idea, need to validate feasibility, want to create comprehensive project documentation, exploring feature requirements and design patterns.'
argument-hint: 'Describe your project idea or problem you want to solve'
user-invocable: true
disable-model-invocation: false
---

# Idea to Project

Transform a rough concept into a complete project specification through four iterative phases: discovery, research, feature definition, and design systems.

## When to Use

- **Starting from scratch**: You have a vague idea and need structure
- **Validating feasibility**: Want to know if similar solutions exist
- **Team alignment**: Creating a shared project specification document
- **Risk reduction**: Understanding features and design before development
- **Scope clarification**: Converting informal requirements into executable specs

## Procedure

### Phase 1: Conversational Discovery

**Goal**: Extract the user's core idea, problem statement, and goals

**Steps**:

1. Ask the user to describe their idea in their own words
2. Clarify the **problem being solved**. Ask: "What's the main pain point?"
3. Identify **primary users**. Ask: "Who will use this?"
4. Establish **success criteria**. Ask: "How will you know this project succeeded?"
5. Uncover **constraints**. Ask about timeline, budget, team size, tech preferences
6. Ask for **three key features** they imagine
7. Document findings; confirm your understanding before proceeding

**Decision Gate**: Do you have enough clarity to search for existing solutions? If no, loop back to Phase 1.

### Phase 2: Research & Validation

**Goal**: Research existing implementations and best-practice patterns

**Steps**:

1. Search the web for **similar existing projects/products** in the problem domain
2. Document 3–5 key competitors or references with brief summaries
3. Extract **best practices** from what you found (patterns, features, strengths, gaps)
4. Identify **feature patterns** across similar solutions (common, expected, differentiation)
5. Compile findings into a research summary
6. Present to user: "Here's what exists. Here's what's working. Where do you want to differentiate?"

**Decision Gate**: Is the idea still worthwhile? Does it complement or improve upon existing solutions? Adjust scope if needed.

### Phase 3: Feature Definition & Project Spec

**Goal**: Create a comprehensive `.md` project specification document

**Generate** a markdown file (e.g., `PROJECT_SPEC.md` or `{ProjectName}_Spec.md`) with these sections:

1. **Project Overview**
   - 1–2 sentence description
   - Problem statement
   - Target audience
   - Success metrics

2. **Feature List**
   - Core features (must-have)
   - Secondary features (nice-to-have)
   - Out-of-scope features
   - Feature priorities and sequencing

3. **Requirements**
   - Functional requirements
   - Non-functional requirements (performance, scalability, security)
   - Compliance or regulatory needs

4. **Architecture** (if applicable)
   - High-level system design
   - Technology stack recommendations
   - Data flow / component interactions
   - Deployment model

5. **UI/Theming Outline** (foundation for Phase 4)
   - Primary use cases and user flows
   - Wireframe-level descriptions or ASCII sketches
   - Tone and visual style (e.g., "modern & minimalist" vs. "playful & colorful")

**Decision Gate**: User reviews and approves the spec. Make revisions as needed before Phase 4.

### Phase 4: Design System & UI/Theming

**Goal**: Establish a comprehensive design system with components, accessibility, and responsiveness guidance

**Steps**:

1. **Color Palette**
   - Primary color(s) and rationale
   - Secondary/accent colors
   - Neutral palette (grays, whites, blacks)
   - Semantic colors (success, warning, error, info)
   - Accessibility checks (WCAG contrast ratios)

2. **Typography**
   - Font choices (heading font, body font, monospace)
   - Type scale (sizes, weights, line-heights)
   - Usage guidelines per component type

3. **Component Library**
   - Button styles and states (default, hover, active, disabled)
   - Form inputs (text, checkbox, radio, select, etc.)
   - Cards, modals, notifications, alerts
   - Navigation components (header, sidebar, breadcrumbs, tabs)
   - Data presentation (tables, lists, grids)
   - Each: visual specs, interaction states, accessibility notes

4. **Layout & Spacing**
   - Grid system (12-col, 8-col, etc.)
   - Spacing scale (margins, padding increments)
   - Breakpoints (responsive design)
   - Safe areas and margins

5. **Accessibility Guidelines**
   - WCAG 2.1 AA compliance targets
   - Keyboard navigation patterns
   - Screen reader considerations
   - Color contrast requirements
   - Focus indicators

6. **Responsiveness**
   - Mobile-first approach or desktop-first rationale
   - Breakpoint definitions (mobile, tablet, desktop)
   - Adaptation strategies per breakpoint
   - Touch-friendly spacing and sizing rules

7. **Design Tokens & Implementation**
   - CSS custom properties (`--color-primary`, etc.)
   - Reference code snippets (CSS, Tailwind, styled-components, etc.)
   - Component examples or links to component library starter

**Deliverable**: Update the project spec with a full "Design System" section, or create a separate `DESIGN_SYSTEM.md`.

## Example Usage Prompts

- `/idea-to-project` → "I want to build a habit tracker for small teams"
- `/idea-to-project` → "Problem: Developers waste time context-switching between monitoring tools"
- `/idea-to-project` → "An app to help friends organize and split shared expenses"

## Output

Two or more markdown files:

- **PROJECT_SPEC.md** – Project overview, features, requirements, architecture, UI outline
- **DESIGN_SYSTEM.md** (or appended section) – Colors, typography, components, layout, accessibility, responsiveness

Both files live in the project root (or folder specified by user) for team collaboration and future reference.

## Tips

- **Phase 1 is critical**: Take time to clarify the problem. Vague specs cause rework later.
- **Web research saves time**: Don't rebuild what exists. Find what's working and differentiate.
- **Design systems scale**: Investing in component specs upfront prevents design debt.
- **Share early**: Get user/stakeholder feedback after Phase 3 before diving into implementation.
- **Document assumptions**: Note what you *don't* know and flag risks in the spec.

## References

- [WCAG 2.1 Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Design Systems Best Practices](https://www.nngroup.com/articles/design-systems-101/)
- [User Story Format](https://en.wikipedia.org/wiki/User_story)
