# 🛡️ Bug Prevention

> Bug Destroyer · Mad Max sweep · 2026-06-28 · `bb54986`

This file captures permanent preventions for every bug class found in `bugs.md`. Apply these rules, hooks, and CI checks so the same bugs cannot return.

---

## 1. Secret & PII Guardrails

### 1.1 `.gitignore` must protect secrets

```gitignore
# Secrets / local config
.env
.env.*
.env.local
*.pem
*.key
*.crt
*.p12
credentials*
secret*
config.local.*
.aws/
.netrc
*.log

# Local tooling
.claude/
.claude-plugin/

# Build outputs
builds/

# Generated reports are kept in the repo for this sweep.
# In production repos, write reports to an ignored `reports/` directory
# or redact and attach them to GitHub Releases instead of committing raw findings.

**Prevents:** BUG-001 · BUG-002 · BUG-004

### 1.2 Mandatory report redaction checklist

Before writing any generated report:

- [ ] Replace API keys, tokens, passwords with `[REDACTED_<TYPE>]`.
- [ ] Replace emails with `[REDACTED_EMAIL]`.
- [ ] Replace user IDs, names, phone numbers, addresses with `[REDACTED_PII]`.
- [ ] Replace database URLs, internal hostnames with `[REDACTED_URL]`.
- [ ] Never paste live credentials in diffs or code blocks.
- [ ] Verify no raw PII appears in `bugs_raw_agent_*.jsonl` before cleanup.

**Prevents:** BUG-001 · BUG-004 · BUG-011

### 1.3 Delete raw scan artifacts after synthesis

```bash
# Run after bugs.md / audit files are finalized
rm -f bugs_raw_agent_*.jsonl
```

**Prevents:** BUG-004

### 1.4 Redact git blame in reports

Use a non-PII identifier instead of full `git blame` output.

```diff
- `{{FILE}}:{{LINE}}` · {{CATEGORY}} · {{BADGES}} · `{{GIT_BLAME}}`
+ `{{FILE}}:{{LINE}}` · {{CATEGORY}} · {{BADGES}} · `{{COMMIT_SHORT}}`
```

If committer identity is required, keep only initials or team alias; never include email.

**Prevents:** BUG-011

---

## 2. Tooling & Execution Safety

### 2.1 Do not run project tooling before approval

The skill must not execute `npx`, `npm test`, `npm audit`, or similar commands until after the user has approved the target, intensity, and (for Deep/Mad Max) the `bugs.md` plan.

```markdown
1. Gate 1: confirm target.
2. Gate 2: confirm intensity.
3. Gate 3: present `bugs.md` and receive explicit approval.
4. Only then run project tooling.
```

**Prevents:** BUG-007

### 2.2 Package manager detection

```bash
if [ -f bun.lockb ]; then PM="bun"
elif [ -f pnpm-lock.yaml ]; then PM="pnpm"
elif [ -f yarn.lock ]; then PM="yarn"
else PM="npm"
fi
```

Use `$PM run lint`, `$PM test`, `$PM audit`. Use `npx --no-install` to avoid silent package downloads.

**Prevents:** BUG-023

### 2.3 Capture full tool output

Do not truncate JSON tool output during detection. Store full output and parse it programmatically. Truncation is only allowed for human-readable chat summaries.

```bash
npx eslint . --format json > .bug-destroyer/eslint.json 2>&1
npm audit --json > .bug-destroyer/npm-audit.json 2>&1
npx tsc --noEmit > .bug-destroyer/tsc.log 2>&1
```

**Prevents:** BUG-008

### 2.4 Surface tool failures

Do not mask exit codes with `|| true`. Capture exit code and stderr, then report failures.

```bash
npx tsc --noEmit > .bug-destroyer/tsc.log 2>&1
TSC_EXIT=$?
if [ $TSC_EXIT -ne 0 ]; then
  echo "TypeScript check failed with exit code $TSC_EXIT"
fi
```

**Prevents:** BUG-016

### 2.5 Timeout all external commands

```bash
timeout 120 npx tsc --noEmit
timeout 180 npm test
timeout 60 npm audit --json
```

Stream concise progress to the user instead of running fully silent.

**Prevents:** BUG-022

### 2.6 Add secret scan to setup

```bash
gitleaks detect --source . --verbose
truffleHog filesystem . --json
git-secrets --scan
```

Mark findings as 🤖 **Tool-Detected**.

**Prevents:** BUG-003

---

## 3. Documentation Consistency

### 3.1 Tool name allow-list

Maintain a list of valid Claude Code tool names. The skill must never reference tools outside this list. Add a CI check:

```bash
grep -n "AskUserQuestion\|present_files" SKILL.md profiles/*.md TEMPLATE.md && exit 1
```

**Prevents:** BUG-005 · BUG-006

### 3.2 Intensity glossary

| Intensity | Branch | Outputs | Use |
|-----------|--------|---------|-----|
| Quick | current or feature branch | chat + lightweight findings | obvious bugs, <50 files |
| Medium | current or feature branch | `bugs.md` | broader scan, fix + verify |
| Deep | current or feature branch | `bugs.md` + `BUG-PREVENTION.md` + `COMPLIANCE-REPORT.md` | near-exhaustive |
| Mad Max | `bug-destroyer/mad-max-{date}` | all above + `AUDIT-TRAIL.md` | full adversarial audit |

Remove every remaining reference to `Scorched` or define it explicitly.

**Prevents:** BUG-014

### 3.3 Scoring alignment

- Privacy-Critical = Privacy Score ≥ 30 (not 15).
- Severity is `max(security_score, privacy_score)` mapped to the severity table.
- Add a documented aggregation formula for project-level Health (0-100) and Privacy (0-100).

**Prevents:** BUG-013 · BUG-036 · BUG-034

### 3.4 Template validation

Add CI checks for `TEMPLATE.md`:

- Table header and data row column counts match.
- Every placeholder `{{...}}` appears in a documented data dictionary.
- Compliance table includes all referenced frameworks.

**Prevents:** BUG-035 · BUG-038 · BUG-033

---

## 4. Testing & CI

### 4.1 Minimum CI workflow

```yaml
name: bug-destroyer-quality
on: [push, pull_request]
jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
      - run: npm ci
      - run: npm run lint:skill      # markdown + tool-name + template checks
      - run: npm test                 # scoring + template tests
      - run: npm run secret-scan      # gitleaks or trufflehog
```

**Prevents:** BUG-032 · BUG-005 · BUG-006 · BUG-035

### 4.2 Required tests

- Scoring math: verify that a privacy score of 45 yields 🔴🛡️🔒 or 🟠🛡️🔒, not 🟡.
- Template rendering: verify table column counts, placeholder substitution.
- Tool allow-list: verify `AskUserQuestion` and `present_files` do not appear.
- Intensity consistency: verify no `Scorched` references unless documented.
- `.gitignore` must contain `.env`, `*.pem`, `*.key`, `credentials*`, `secret*`.

**Prevents:** BUG-013 · BUG-035 · BUG-005 · BUG-006 · BUG-014 · BUG-002

### 4.3 Test baseline

Before any fix:

```markdown
1. Run the test suite and record result.
2. If tests are already failing, warn the user and ask whether to proceed.
3. Only then begin fixes.
```

**Prevents:** BUG-019

---

## 5. Privacy-by-Design for Scan Agents

Every scan agent must:

1. Redact PII in raw findings before writing `bugs_raw_agent_*.jsonl`.
2. Quote only the minimum code snippet necessary.
3. Never include real user data in code excerpts.
4. Treat any file containing PII as sensitive; prefer abstract descriptions.

**Prevents:** BUG-020 · BUG-004

---

## 6. Build & Distribution

### 6.1 Do not commit build artifacts

- Remove `builds/bug-destroyer-v1.0.zip` from the repo.
- Generate release artifacts via CI and publish to GitHub Releases.

### 6.2 Reproducible build

```bash
cd "$(git rev-parse --show-toplevel)"
VERSION=$(git describe --tags --always)
DIR=$(mktemp -d)
install -m644 SKILL.md TAXONOMY.md TEMPLATE.md .gitignore "$DIR/"
install -Dm644 profiles/*.md -t "$DIR/profiles/"
install -Dm644 .claude-plugin/plugin.json -t "$DIR/.claude-plugin/"
(cd "$DIR" && find . -type f | sort | zip "../bug-destroyer-$VERSION.zip" -@)
sha256sum "bug-destroyer-$VERSION.zip" > "bug-destroyer-$VERSION.zip.sha256"
```

### 6.3 Artifact attestation

Use GitHub artifact attestations or GPG signing so consumers can verify integrity.

**Prevents:** BUG-009 · BUG-010 · BUG-025

---

## 7. Quick Wins (apply immediately)

1. Add secret patterns to `.gitignore`.
2. Remove `AskUserQuestion` and `present_files` references.
3. Fix `TEMPLATE.md` verification table and privacy threshold.
4. Remove or define every `Scorched` reference.
5. Add a report redaction checklist to `SKILL.md`.
6. Add raw-artifact cleanup to `MadMax.md`.

---

## 8. Rollout Checklist

- [x] Merge prevention rules into `SKILL.md` and `TAXONOMY.md`.
- [x] Add CI workflow.
- [ ] Add pre-commit secret-scan hook.
- [x] Regenerate release zip via CI and remove stale `builds/` artifact.
- [x] Verify all 39 bugs from this sweep are prevented by at least one rule above.
