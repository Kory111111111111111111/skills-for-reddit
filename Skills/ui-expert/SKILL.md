---
name: ui-expert
description: Apply algorithmic UI design principles based on cognitive psychology, ergonomics, and mathematical design systems. Use when generating UI code, reviewing interfaces, making component decisions, or ensuring design system consistency. Covers cognitive load laws (Hick's, Miller's), Gestalt principles, Fitts's Law, 8-point grids, typography scales, and WCAG accessibility.
---

# UI Expert

Apply algorithmic UI design principles derived from cognitive psychology and mathematical design systems to generate consistent, ergonomic, and accessible interfaces.

## Core Philosophy

AI coding agents are text-native constructs that excel at code syntax and DOM structures but lack human spatial reasoning and visual judgment. To generate robust UI code, you must translate abstract design principles into deterministic, mathematical rulesets.

**Critical Rule**: Never rely on "vibe coding" or aesthetic intuition. Always apply explicit, programmatic constraints.

## Quick Decision Framework

### Component Selection Algorithm

Use this decision tree to select the optimal UI component based on data constraints:

| Data Constraint | Component | Justification |
|----------------|-----------|---------------|
| 2-4 mutually exclusive options | Radio buttons | Hick's Law: expose all options immediately, eliminate menu interaction cost |
| 2 mutually exclusive states | Toggle switch | Real-time effect, maps to physical switch mental model |
| Multiple independent options | Checkboxes | Select none/one/several without forced exclusivity |
| 5-10 mutually exclusive options | Select/dropdown | Conserves screen real estate, but avoid for <5 or >10 options |
| >10 options or complex data | Searchable text field/autocomplete | Bypasses Hick's Law via recall vs recognition |
| Deep hierarchical data | Miller's Columns | One hierarchy level at a time, respects working memory limits |
| Broad comparative data | Tree structures | Side-by-side branch comparison with strict node virtualization |

### Layout Pattern Selection

| Content Type | Pattern | Implementation |
|--------------|---------|----------------|
| Dense text, dashboards, search results | F-Pattern | Strict left-align, heavy font weights for first words, bulleted lists |
| Sparse, conversion-focused pages | Z-Pattern | Logo top-left, nav top-right, hero diagonal, CTA bottom-right |

## Mathematical Design Systems

### 8-Point Grid System

All dimensions must be multiples of 8 (8px, 16px, 24px, 32px, 40px, 48px). Half-steps of 4px permitted only for tight component adjustments.

**Why**: Ensures clean scaling across 1.5x, 2x, 3x pixel densities without sub-pixel rendering artifacts.

**Implementation**:
- Use CSS custom properties: `--space-1: 4px`, `--space-2: 8px`, `--space-3: 16px`, etc.
- Prefer layout primitives (Stack component with flexbox gap) over element margins
- Never hardcode arbitrary pixel values

### Typography Scales

Apply modular scales based on interface requirements:

| Scale Type | Ratio | Use Case |
|------------|-------|----------|
| High-contrast | 1.618 (Golden) or 1.414 | Marketing sites, landing pages, dramatic hierarchy |
| Medium-contrast | 1.333 (Perfect Fourth) or 1.250 | Articles, e-commerce, standard applications |
| Low-contrast | 1.067 (Minor Second) or 1.125 | Data-dense dashboards, complex mobile interfaces |

**Line Height Rules**:
- Body copy: 1.5 ratio (e.g., 16px font = 24px line height)
- Headings: 1.1-1.35 ratio (tighter as size increases)

### WCAG 2.1 Contrast Requirements

| Element | Level AA | Level AAA |
|---------|----------|-----------|
| Normal text (<18pt or <14pt bold) | 4.5:1 | 7.0:1 |
| Large text (≥18pt or ≥14pt bold) | 3.0:1 | 4.5:1 |
| UI components, icons, focus rings | 3.0:1 | N/A |

**Note**: No fractional rounding permitted. 4.47:1 fails a 4.5:1 requirement.

## Cognitive Laws

### Hick's Law
Decision time increases logarithmically with choice complexity. Minimize choices when rapid response is critical. Break complex processes into sequential steps.

### Miller's Law
Humans hold 4±1 items in working memory. Group information into meaningful chunks. Limit visible options to respect this constraint.

### Fitts's Law
Target acquisition time depends on distance and target size. Larger targets are faster to acquire. Place related controls proximally. Exploit infinite screen edges for critical navigation.

## Gestalt Principles

| Principle | Application |
|-----------|-------------|
| Proximity | Bind related labels to inputs via spacing; distance unrelated fields |
| Common Region | Group elements with subtle backgrounds, borders, or card containers |
| Similarity | Consistent visual characteristics imply identical functionality |
| Prägnanz (Simplicity) | Prioritize clarity; avoid convoluted geometries |

## Behavioral Heuristics

| Law | Implementation |
|-----|----------------|
| Goal-Gradient Effect | Progress bars accelerate near completion to boost completion rates |
| Doherty Threshold | Keep interactions under 400ms; heavy animations cause frustration |
| Von Restorff Effect | Primary buttons use high-contrast accent colors distinct from secondary |
| Serial Position Effect | Place critical navigation at menu extremes (first/last) |
| Aesthetic-Usability Effect | Polished visuals forgive minor usability flaws |
| Jakob's Law | Users expect your site to work like others they know; follow conventions |

## Design Token Architecture

Never hardcode values. Always reference tokens:

```css
/* Bad */
color: #3B82F6;
padding: 15px;

/* Good */
color: var(--color-primary-500);
padding: var(--space-4);
```

Token categories:
- `--color-*`: Semantic color tokens (primary, secondary, success, error, etc.)
- `--space-*`: 8-point grid spacing (1-4px, 2-8px, 3-16px, 4-24px, 5-32px, etc.)
- `--font-size-*`: Modular scale typography
- `--line-height-*`: Contextual line heights

## State Persistence & Mental Models

- Retain user inputs globally across workflow steps
- Provide intelligent auto-complete
- Use sensible defaults
- State format requirements upfront (placeholders, inline helpers)
- Match established mental models: checkboxes allow multi-select, radio buttons are mutually exclusive

## Implementation Checklist

Before finalizing UI code:

- [ ] All spacing follows 8-point grid (multiples of 8)
- [ ] Typography uses modular scale, not arbitrary sizes
- [ ] Color contrast meets WCAG 2.1 AA minimums
- [ ] Component selection follows Hick's/Miller's decision table
- [ ] Layout pattern matches content type (F vs Z)
- [ ] Interactive targets meet minimum size requirements (Fitts's Law)
- [ ] State persistence implemented for multi-step workflows
- [ ] Design tokens used exclusively (no hardcoded values)
- [ ] Follows Jakob's Law: uses familiar patterns, not novel inventions

## Additional Resources

- For detailed cognitive principles: [reference.md](reference.md)
- For implementation examples: [examples.md](examples.md)
- For source links and references: [resources.md](resources.md)
