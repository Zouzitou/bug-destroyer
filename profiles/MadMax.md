# Mad Max Scan

**When:** "I need CERTAINTY." Privacy-critical code, compliance-critical releases, or full adversarial audit.
**Time:** ~10 minutes to 2+ hours.
**Output:** `bugs.md` + `BUG-PREVENTION.md` + `COMPLIANCE-REPORT.md` + `AUDIT-TRAIL.md`.
**Verification:** 5 Inquisitor agents. Loop until all 5 return CLEAN in the same round.
**Branch/Commits:** `bug-destroyer/mad-max-{date}`, one commit per bug.

## Phase 1: Map

List every source file, excluding:

- `node_modules`, `.git`, `dist`, `build`, `.next`
- `__pycache__`, `target`, `vendor`
- Binaries, generated files

## Phase 2: Slice and Scan

1. Split the file list into 10 equal slices.
2. Launch 10 scan agents in parallel. Each agent reads `TAXONOMY.md` and scans its slice.
3. Each agent writes raw findings to `bugs_raw_agent_{n}.jsonl`.

## Phase 3: Synthesize

Deduplicate and normalize all raw findings:

- Merge duplicates.
- Re-score every bug with the security and privacy matrices from `TAXONOMY.md`.
- Flag privacy-critical bugs (Privacy Score ≥ 30).
- Map to compliance controls (SOC 2, GDPR, ISO 27001, HIPAA, PCI-DSS).
- Map dependency findings.
- Identify systemic patterns.

## Phase 4: Generate Reports

Use `TEMPLATE.md` to generate `bugs.md`.
Also generate:

- `BUG-PREVENTION.md` — permanent preventions.
- `COMPLIANCE-REPORT.md` — auditor-ready mapping.
- `AUDIT-TRAIL.md` — timestamped log of every action.

## Phase 5: Fix Everything

Fix in this order:

1. 🔴 Critical security + 🛡️🔒 Privacy-Critical
2. 🧩 Systemic issues
3. 🟠 High
4. 🟡 Medium — sort by effort ascending
5. 🟢 Low
6. ⚪ Cosmetic

Per-bug protocol:

1. Read the file fresh.
2. Apply the fix — surgical, match existing style.
3. Mark progress in `bugs.md`.
4. Commit: `fix: [BUG-{ID}] {short description}`.
5. Log the action in `AUDIT-TRAIL.md`.
6. Move to the next bug.

## Phase 6: The Inquisition

Launch 5 Inquisitor agents. Each one:

- Re-verifies every claimed fix.
- Re-reads every file marked clean.
- Checks privacy guarantees after fixes.
- Checks compliance mappings.
- Hunts for new regressions.
- Tests edge cases: null, empty, very large inputs, unicode, concurrency, network failure.

If **any** Inquisitor finds **anything**:

1. Fix it.
2. Re-run **all 5** Inquisitors from scratch.
3. Repeat until **all 5 return CLEAN in the same round**.

## Safety Rules

- Always work on `bug-destroyer/mad-max-{date}`.
- Stop and ask before auth, payments, encryption, PII, or public API changes.
- One fix at a time. Sequential.
- Rollback on regression.
- No refactoring over 50 lines per fix.
- No fix before `bugs.md` approval.

## Done Condition

All 5 Inquisitors return CLEAN in the same verification round, tests pass, toolchain is clean, and `AUDIT-TRAIL.md` is complete.
