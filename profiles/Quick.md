# Quick Scan

**When:** Pre-PR, user is busy, or they just want a fast health check.
**Time:** ~2–5 minutes.
**Output:** Chat summary plus a lightweight `QUICK-FINDINGS.md` (or `bugs.md` if preferred) with id, file, line, title, severity, status, and the pre-sweep commit hash for rollback.
**Commit:** One commit on the current branch if any fixes are approved. If the current branch is `main` (or the default branch), create and switch to a feature branch first.

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
- Accessibility: missing `alt`, empty buttons/links, low-contrast text, missing labels.
- i18n: hardcoded user-facing strings, no RTL handling.
- Testing: core business logic with no tests, flaky tests, missing null/empty/error cases.
- Privacy data flow: validate → log → store → transmit → cache → display → delete.

## How to Deliver

Summarize in chat, adapting to the user's language:

> *"Quick scan of `{{TARGET}}` found {{N}} issues: {{C}} critical, {{H}} high, {{M}} medium. Top risk: {{TOP_ISSUE}}. Want me to go deeper or fix the obvious ones?"*

(The example above is English; translate it when the user is writing in another language.)

Only offer to fix. Do not apply fixes without explicit approval, even in Quick mode.
