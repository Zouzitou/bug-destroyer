# Quick Scan

**When:** Pre-PR, user is busy, or they just want a fast health check.
**Time:** ~2–5 minutes.
**Output:** Chat summary. No `bugs.md`.
**Commit:** One commit on the current branch if any fixes are approved.

## What to Scan

- Entry points (API routes, server actions, main entry file).
- Top imports and dependency surface.
- Config files (env handling, auth config, CORS, middleware).
- TODO/FIXME/XXX comments.
- Recent diff or most-touched files.

## Patterns to Check

Run lightweight greps or quick reads for:

- Hardcoded secrets, API keys, tokens.
- `eval`, `new Function`, `innerHTML`, `dangerouslySetInnerHTML`.
- `console.log` left in production code.
- Open redirects from URL params.
- Missing auth on routes/handlers.
- `process.env.*` used in client code.
- PII in logs or error messages.

## How to Deliver

Summarize in chat:

> *"Quick scan of `{{TARGET}}` found {{N}} issues: {{C}} critical, {{H}} high, {{M}} medium. Top risk: {{TOP_ISSUE}}. Want me to go deeper or fix the obvious ones?"*

Only offer to fix. Do not apply fixes without explicit approval, even in Quick mode.
