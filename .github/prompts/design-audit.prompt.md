---
name: design-audit
description: Audit and improve UI consistency, behavior, and visual logic
tools: ['*']
argument-hint: Optional screen, component, route, or feature area
---

Perform a design and interaction audit for the requested area.

Focus on:
- component styling
- component placement
- text placement
- spacing and hierarchy
- interaction clarity
- accessibility
- responsiveness
- animation quality
- empty, loading, error, and disabled states

Do not stop at visual comments.
Where safe and clear, implement the fixes and verify them. In this repository, report findings in chat by default and do not update `.ralph/` files unless the user explicitly asks for those docs to be maintained.

If a control is present but does nothing, either wire it correctly, remove it, or clearly identify the blocker.
