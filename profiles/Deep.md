# Deep Scan

**When:** Post-milestone, security/privacy audit, or when the user wants near-certainty.
**Time:** ~15–45 minutes.
**Output:** `bugs.md` + `BUG-PREVENTION.md` + `COMPLIANCE-REPORT.md`.
**Verification:** Three passes — re-read, full tests, strict toolchain + dependency audit.
**Branch/Commits:** `bug-destroyer/deep-{date}`, one commit per severity tier.

## What to Scan

Everything in Medium, plus:

- Tests, test setup, and test data.
- Types, interfaces, and type guards.
- Styles, theming, and responsive code.
- All config files (build, deploy, CI, lint, format).
- CI/CD pipelines.
- Documentation, README, privacy policy.
- Edge cases, race conditions, concurrency.
- Dependency tree and lockfiles.
- Git history for secrets (sample checks).

## How to Scan

1. Detect project type and toolchain.
2. Run every available tool in strict mode:
   - TypeScript strict check
   - Full ESLint with all rules
   - Full test suite
   - Dependency audit (`npm audit`, `pip audit`, `cargo audit`, `govulncheck`)
   - Formatter check
3. Read files exhaustively.
4. Apply the full bug taxonomy from `TAXONOMY.md`.
5. Detect systemic patterns — one fix that eliminates many bugs.
6. Map findings to SOC 2, GDPR, ISO 27001, HIPAA, PCI-DSS controls where applicable.

## Output

1. `bugs.md` — main report, using `TEMPLATE.md`.
2. `BUG-PREVENTION.md` — specific ESLint rules, tsconfig changes, CI additions, pre-commit hooks, and architecture recommendations. Reference the BUG-IDs each prevention would catch.
3. `COMPLIANCE-REPORT.md` — per-framework summary tables and control status.

## Fix Protocol

Same as Medium:

1. Read the file fresh.
2. Apply a surgical fix.
3. Mark progress in `bugs.md`.
4. Commit per severity tier: `fix: [CRITICAL/HIGH/MEDIUM/LOW/COSMETIC] {description}`.
5. Log notable actions in `BUG-PREVENTION.md` context where helpful.

## Verification (Three Passes)

1. **Re-read** every fixed file.
2. **Run the full test suite** and fix any regressions.
3. **Run strict toolchain + dependency audit** — everything must be clean.
4. Generate `BUG-PREVENTION.md` and `COMPLIANCE-REPORT.md`.

## Safety Rules

Same as Medium. Plus:

- Always create the `bug-destroyer/deep-{date}` branch before fixing.
- Do not push the branch without user confirmation.
