# Medium Scan

**When:** Pre-release or when the user wants a thorough plan.
**Time:** ~5–15 minutes.
**Output:** `bugs.md` with code, fixes, and scoring.
**Verification:** Re-read fixed files, run linter + typechecker, run tests.
**Branch/Commits:** Current branch, one commit per category.

## What to Scan

Everything in Quick, plus:

- Utilities, helpers, shared functions.
- Hooks, middleware, interceptors.
- Auth, sessions, permissions.
- Database queries, ORM usage, migrations.
- State management (client and server).
- Error handling and edge cases.
- Environment and config handling.

## How to Scan

1. Detect project type and toolchain (run the detection commands from `SKILL.md` setup).
2. Run the user's tools:
   - TypeScript: `tsc --noEmit`
   - ESLint
   - Tests
   - `npm audit` or equivalent dependency audit
3. Read files systematically, starting from entry points outward.
4. Apply the full bug taxonomy from `TAXONOMY.md`. Read `TAXONOMY.md` before scoring.
5. Score every finding with the security and privacy matrices in `TAXONOMY.md`.

## Output

Generate `bugs.md` using `TEMPLATE.md`.

## Fix Protocol

1. **Read the file fresh** — it may have changed since scanning.
2. **Apply the fix** — surgical, match existing style.
3. **Mark progress** in `bugs.md`: `⬜ Pending` → `🟦 In Progress` → `✅ Fixed`.
4. **Commit** — `fix: [{CATEGORY}] {short description}`.
5. **Stop and ask** before touching auth, payments, encryption, PII, or public APIs.

## Fix Order

1. 🔴 Critical security + 🛡️🔒 Privacy-Critical
2. 🧩 Systemic issues
3. 🟠 High
4. 🟡 Medium — sort by effort ascending
5. 🟢 Low
6. ⚪ Cosmetic

## Safety Rules

- One fix at a time. Sequential.
- Test after each severity tier.
- Rollback on regression.
- No refactoring. If a bug needs >50 lines of refactor, mark `❌ Won't Fix — Requires Refactor`.
- No fixes before `bugs.md` approval.

## Verification

After all fixes:

1. Re-read each fixed file.
2. Run linter + typechecker.
3. Run test suite.
4. If anything fails, fix before declaring done.
