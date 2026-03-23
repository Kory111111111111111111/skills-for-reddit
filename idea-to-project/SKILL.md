---
name: idea-to-project
description: 'Turn small ideas into fully-fledged projects through structured discovery, research, and specification. Use when: starting a new project from a rough idea, need to validate feasibility, want to create comprehensive project documentation, exploring feature requirements and design patterns. Conversational, adaptive workflow.'
argument-hint: 'Describe your project idea or problem you want to solve'
user-invocable: true
disable-model-invocation: false
---

# Idea to Project

Transform a rough concept into a complete project specification through four conversational, adaptive phases: discovery, research, feature definition, and design systems.

## When to Use

- **Starting from scratch**: You have a vague idea and need structure
- **Validating feasibility**: Want to know if similar solutions exist
- **Team alignment**: Creating a shared project specification document
- **Risk reduction**: Understanding features and design before development
- **Scope clarification**: Converting informal requirements into executable specs

## Approach

This skill uses **progressive questioning**, **adaptive branching**, and **natural dialogue** to guide you through each phase. See [RULES.md](./RULES.md) for conversational guidelines and decision trees.

## Procedure

### Phase 1: Conversational Discovery

**Goal**: Understand the user's core idea, problem, and vision through natural dialogue.

**Agent Behavior** (see [RULES.md](./RULES.md#phase-1-discovery-rules) for conversational patterns):

1. **Opening**: Greet warmly and ask the user to describe their idea naturally—no pressure for polish or completeness.
   - *Example*: "Tell me about your idea—what's the spark here? What problem are you trying to solve?"

2. **Probe deeper on problem & pain point**: Listen for the real problem, not the solution.
   - If vague: "You mentioned organization. What specifically is hard about [domain]?"
   - Look for emotion or frustration—that's the real problem.

3. **Map the users**: Understand who this is for.
   - "Who feels this pain? Are they professionals, consumers, a specific niche?"

4. **Uncover motivation & constraints** (adaptively, based on what they reveal):
   - Timeline: "When do you want this live?"
   - Team: "Are you building solo or with a team?"
   - Tech comfort: "Any tech you prefer or want to learn?"
   - Success: "What does winning look like in 6 months?"

5. **Extract features organically**: Don't ask "list 3 features." Instead:
   - "What's the first thing someone would do when they open this?"
   - "What would make it worth their time?"
   - "Anything you'd want *removed* to keep it simple?"

6. **Validate & summarize**: Reflect back what you heard to confirm.
   - *Example*: "So you're building a habit tracker for teams, focused on streak-tracking and accountability. The goal is to launch in 3 months. Did I get that right?"

**Decision Gate**: Does the agent have enough clarity to search for existing solutions?
- ✅ **Move forward** if: Problem is clear, users are defined, 2–3 core features emerge, constraints are known.
- ❌ **Loop back** if: Still vague, conflicting signals, or missing key context. Use follow-ups from [RULES.md](./RULES.md#fallback-conversational-patterns).

### Phase 2: Research & Validation

**Goal**: Ground the idea in reality by researching what exists and what's working.

**Agent Behavior** (see [RULES.md](./RULES.md#phase-2-research-rules)):

1. **Prepare**: Based on Discovery, identify key search terms (problem domain, user type, features).
   - *Example*: For "habit tracker for teams," search: "team habit tracking apps," "accountability tools," "habit tracking SaaS"

2. **Search the web**: Find 3–7 existing projects, competitors, or reference implementations.
   - Document: name, URL, key features, target users, pricing (if applicable)
   - Note strengths, weaknesses, and gaps

3. **Analyze patterns**: Extract common features and differentiators.
   - *Example*: "Most habit trackers show daily streaks. Some add social elements. Few integrate with Slack."

4. **Present findings conversationally**:
   - "Here's what's out there... [summary]"
   - "Here's what works really well: [patterns]"
   - "Here's where most solutions fall short: [gaps]"
   - "So... given all this, do you still see a unique angle? How do you want to be different?"

5. **Adapt scope**: Let the user comment on findings. They may want to:
   - ✅ Proceed with confidence (idea is fresh or better)
   - 🔄 Pivot (learned something that changes direction)
   - ⛔ Pause (realized someone is already doing it really well)

**Decision Gate**: Is the idea still worthwhile?
- ✅ **Move forward** if: Idea complements existing solutions, user sees differentiation, or no direct competitor exists.
- 🔄 **Pivot** if: Competition is strong; help user find a niche or angle.
- ⛔ **Pause** if: User wants to reconsider, but offer to refocus scope.

### Phase 3: Feature Definition & Project Spec

**Goal**: Collaboratively build a comprehensive project specification document.

**Agent Behavior** (see [RULES.md](./RULES.md#phase-3-specification-rules)):

1. **Frame the conversation**: "Let's create a master spec document. I'll start a template and we'll build it together."

2. **Co-author PROJECT_SPEC.md** with these sections:
   - **Project Overview**: 1–2 sentence hook, problem, audience, success metrics
   - **Feature List**: Core (must-have), secondary (nice-to-have), out-of-scope
   - **Requirements**: Functional, non-functional, compliance
   - **Architecture**: System design, tech stack, data flow (if applicable)
   - **UI/Theming Outline**: User flows, wireframe descriptions, visual tone

3. **Iterate conversationally**:
   - "Here's what I drafted for features. What did I miss or misunderstand?"
   - "Let's prioritize—which of these *must* be in v1?"
   - "For architecture, are you thinking [Option A] or [Option B]? Any constraints?"

4. **Validate**: "Does this feel complete? Anything you want to refine before we move to design?"

**Deliverable**: `PROJECT_SPEC.md` lives in the root or user-specified folder for team collaboration.

**Decision Gate**: User approves spec (or requests revisions).
- ✅ **Move to Phase 4** if spec is solid and user is ready for design details.
- 🔄 **Iterate** if user wants to refine features or requirements.

### Phase 4: Design System & UI/Theming

**Goal**: Establish a comprehensive, accessible design system together.

**Agent Behavior** (see [RULES.md](./RULES.md#phase-4-design-rules)):

1. **Start with tone & vision**: "Before we dive into colors and components, let's nail the feel. Is this [playful], [professional], [minimalist], or something else? Why?"

2. **Build collaboratively**:
   - **Color Palette**: "What colors resonate with your brand? Let's check WCAG contrast ratios to ensure accessibility."
   - **Typography**: "What font pairing feels right? Serif for formal, sans-serif for modern, or something distinctive?"
   - **Component Library**: "Let's define buttons, forms, cards, etc. Each with states (normal, hover, active, disabled) and accessibility notes."
   - **Layout & Spacing**: "What grid system? 12-column? Flexible? How much white space?"
   - **Accessibility**: "We're targeting WCAG 2.1 AA, right? That means [contrast, keyboard nav, screen reader support]."
   - **Responsiveness**: "Mobile first? Desktop first? What are your key breakpoints?"

3. **Provide examples**: "Here's what this might look like in Tailwind / CSS / your framework of choice..."

4. **Iterate**: "Does this direction feel right, or should we adjust colors/spacing/component styles?"

**Deliverable**: `DESIGN_SYSTEM.md` (or appended to PROJECT_SPEC.md). Includes design tokens (CSS variables, Tailwind config snippets, etc.) for dev handoff.

**Decision Gate**: User confirms design system is usable.
- ✅ **Complete** if: Colors, components, and guidelines are defined; accessibility checks passed.
- 🔄 **Refine** if: User wants to adjust colors, spacing, or component patterns.

## Example Usage Prompts

- `/idea-to-project` → "I want to build a habit tracker for small teams"
- `/idea-to-project` → "Problem: Developers waste time context-switching between monitoring tools"
- `/idea-to-project` → "An app to help friends organize and split shared expenses"

## Output & Deliverables

Two markdown files created in project root (or user-specified folder):

1. **PROJECT_SPEC.md** – Overview, problem, features, requirements, architecture, UI outline
2. **DESIGN_SYSTEM.md** – Colors, typography, components, layout, accessibility, responsiveness, design tokens

Both are ready for team collaboration and developer handoff.

## Conversational Tips

See [RULES.md](./RULES.md) for detailed conversational patterns, decision trees, and fallback strategies.

Quick reminders:
- **Listen more than direct**: Let the user shape the idea; ask open-ended questions.
- **Validate frequently**: Summarize after each phase. Confirm before moving forward.
- **Adapt based on response**: If the user says "actually, scratch that," pivot without judgment.
- **Stay curious**: Ask "why?" when you don't understand the rationale behind a feature or choice.
- **Make it collaborative**: Use "let's" language, not "I'll."

## References

- [RULES.md](./RULES.md) – Conversational guidelines and decision trees for this skill
- [WCAG 2.1 Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Design Systems Best Practices](https://www.nngroup.com/articles/design-systems-101/)
- [User Story Format](https://en.wikipedia.org/wiki/User_story)
