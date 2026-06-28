# 🐛💥 Bug Destroyer

> `Mad Max` · `/Users/zouzou/Skills/Bug destroyer` · 2026-06-28 · 9 files · ~5m scan · `bb54986`

---

```
  42/100  Health     ████████░░░░░░░░░░░░░░  ↗ after fix
  38/100  Privacy    ███████░░░░░░░░░░░░░░░░  ↗ after fix
```

| 🔴 Critical | 🟠 High | 🟡 Medium | 🟢 Low | ⚪ Cosmetic | 🛡️🔒 Privacy |
|:---:|:---:|:---:|:---:|:---:|:---:|
| **3** | **9** | **13** | **11** | **5** | **5** |

> **41 bugs found.** No runtime code here — this is a markdown skill repo, so the bugs are instruction errors, tooling gaps, template mistakes, and privacy/compliance gaps that would propagate into every sweep.

---

## ⚡ What Needs Attention

### 🔴 Fix Now

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-001 🛡️🔒 | Reports lack mandatory PII/secrets redaction | `SKILL.md:446-451` | 20m |
| BUG-002 🛡️🔒 | `.gitignore` ignores nothing secret/config-related | `.gitignore:1-7` | 5m |
| BUG-003 | Setup phase has no secret-scanning step | `SKILL.md:150` | 20m |

### 🟠 Fix Today

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-004 🛡️🔒 | Raw scan artifacts retained with no cleanup | `SKILL.md:226` · `MadMax.md:19-22` | 15m |
| BUG-005 | Skill references non-existent `AskUserQuestion` tool | `SKILL.md:88` · `SKILL.md:99-100` | 15m |
| BUG-006 | Skill references non-existent `present_files` tool | `SKILL.md:120` · `SKILL.md:253` | 10m |
| BUG-007 | Setup blindly runs `npx`/`npm` before approval gate | `SKILL.md:193-197` | 20m |
| BUG-008 | Toolchain output truncated, hiding vulns | `SKILL.md:193-197` | 15m |
| BUG-009 | Stale release zip out of sync with source | `builds/bug-destroyer-v1.0.zip` | 45m |
| BUG-010 | Release zip has no checksum/manifest/CI | `builds/bug-destroyer-v1.0.zip` | 90m |
| BUG-011 🛡️🔒 | `{{GIT_BLAME}}` embeds committer PII in reports | `TEMPLATE.md:121` | 15m |

### 🟡 This Week

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-012 | Compliance grep uses unescaped `.` wildcards | `SKILL.md:186` | 5m |
| BUG-013 | Scoring example contradicts severity table | `SKILL.md:362` · `TAXONOMY.md:362` | 5m |
| BUG-014 | Undefined `Scorched` intensity in strategy/output tables | `SKILL.md:403` · `TAXONOMY.md:403` | 15m |
| BUG-015 | Verification pass counts don't match listed steps | `SKILL.md:416-425` | 5m |
| BUG-016 | Setup commands suppress exit codes with `\|\| true` | `SKILL.md:154-188` | 15m |
| BUG-017 | Quick profile disables `bugs.md` output | `profiles/Quick.md:6` | 15m |
| BUG-018 | Quick profile omits required taxonomy categories | `profiles/Quick.md:9-26` | 20m |
| BUG-019 | Medium profile omits test baseline step | `profiles/Medium.md:21-28` | 10m |
| BUG-020 | No privacy handling rules for scan agents | `profiles/MadMax.md:19` | 15m |
| BUG-021 | `npm audit` shares dependency metadata without disclosure | `SKILL.md:193-197` | 15m |
| BUG-022 | Setup has no timeout/progress and can hang | `SKILL.md:146` · `SKILL.md:190-199` | 15m |
| BUG-023 | Toolchain assumes npm, ignores yarn/pnpm/bun | `SKILL.md:193-197` | 15m |

### 🟢 When Convenient

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-024 | Intensity recommendation inverts project-size guidance | `SKILL.md:209` | 5m |
| BUG-025 | `.gitignore` ignores `.claude-plugin/plugin.json` | `.gitignore:2` | 5m |
| BUG-026 | Useless use of `cat` in framework detection | `SKILL.md:166-172` | 5m |
| BUG-027 | ESLint command uses deprecated `--ext` | `SKILL.md:194` | 10m |
| BUG-028 | Framework detection greps instead of parsing JSON | `SKILL.md:166-172` | 10m |
| BUG-029 | Setup labeled "30 Seconds, Silent" but may run for minutes | `SKILL.md:146` | 5m |
| BUG-030 | Hardcoded English chat templates | `SKILL.md:456-472` · `profiles/Quick.md:32` | 20m |
| BUG-031 | Quick profile allows committing directly from main | `profiles/Quick.md:7` | 5m |
| BUG-032 | No skill test suite or CI | `SKILL.md:245` | 60m |
| BUG-033 | Template compliance table omits HIPAA/PCI-DSS | `TEMPLATE.md:197-206` | 10m |
| BUG-034 | Health/Privacy 0-100 aggregation formula undefined | `TAXONOMY.md:293-352` | 20m |

### ⚪ Polish

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-035 | TEMPLATE verification table has extra column | `TEMPLATE.md:260-268` | 5m |
| BUG-036 | TEMPLATE privacy-impact threshold inconsistent | `TEMPLATE.md:193` | 5m |
| BUG-037 | Rollback commands lack safety warning | `TEMPLATE.md:285-286` | 10m |
| BUG-038 | Compliance table lacks evidence/auditor columns | `TEMPLATE.md:197-206` | 5m |
| BUG-039 | Taxonomy has duplicate pattern name "Missing authentication" | `TAXONOMY.md:14` · `TAXONOMY.md:154` | 2m |

---

## 🔥 Where

*Files with the most findings.*

| File | Bugs | Mix | Risk |
|------|------|-----|------|
| 🔥 `SKILL.md` | 22 | 2🔴 8🟠 8🟡 4🟢 | **🔴 Critical** |
| 🔥 `TEMPLATE.md` | 6 | 1🟠 1🟡 4⚪ | **🟠 High** |
| 🔥 `TAXONOMY.md` | 5 | 2🟡 1🟢 2⚪ | **🟡 Medium** |
| `profiles/MadMax.md` | 3 | 2🟠 1🟡 | **🟠 High** |
| `profiles/Quick.md` | 5 | 1🟡 4🟢 | **🟡 Medium** |
| `profiles/Medium.md` | 1 | 1🟢 | **🟢 Low** |
| `.gitignore` | 3 | 1🔴 1🟡 1🟢 | **🔴 Critical** |
| `builds/bug-destroyer-v1.0.zip` | 2 | 2🟠 | **🟠 High** |

---

## 📊 What Kinds

| Category | Total | 🔴 | 🟠 | 🟡 | 🟢 |
|----------|-------|----|----|----|----|
| 🛡️ Security | 9 | 2 | 4 | 2 | 1 |
| 🔒 Privacy | 5 | 1 | 2 | 1 | 1 |
| 📦 Supply Chain | 3 | 0 | 2 | 1 | 0 |
| 🐛 Logic | 10 | 0 | 1 | 5 | 4 |
| 🧹 Quality | 9 | 0 | 1 | 4 | 4 |
| 🧪 Testing | 2 | 0 | 0 | 1 | 1 |
| 🌐 i18n | 2 | 0 | 0 | 1 | 1 |
| ♿ A11y | 1 | 0 | 0 | 0 | 1 |
| 🔧 Backend/Tooling | 7 | 0 | 2 | 3 | 2 |
| 📋 Compliance | 5 | 0 | 0 | 4 | 1 |

---

## 🎯 Risk Matrix

*Top-right = most urgent. 🛡️🔒 = privacy-critical.*

| Likelihood \ Impact | 5 Catastrophic | 4 Severe | 3 Moderate | 2 Minor | 1 Negligible |
|---------------------|:--------------:|:--------:|:----------:|:-------:|:------------:|
| **5 Certain** | | | | BUG-025 | |
| **4 Likely** | BUG-001 🛡️🔒 | BUG-002 🛡️🔒 | BUG-003 | | |
| **3 Possible** | | BUG-007 · BUG-009 | BUG-008 · BUG-012 · BUG-013 | BUG-024 · BUG-026 | |
| **2 Unlikely** | | BUG-004 🛡️🔒 · BUG-011 🛡️🔒 | BUG-005 · BUG-006 · BUG-010 | BUG-014 · BUG-017 | BUG-035 |
| **1 Rare** | | | BUG-015 · BUG-016 | BUG-018 · BUG-020 | BUG-036-039 |

---

## 🔗 Dependencies

*Fix blockers first.*

| Order | Bug | Blocked By | Blocks |
|:-----:|-----|------------|--------|
| **1** | BUG-001 | — | BUG-035 · BUG-036 · BUG-037 · BUG-038 |
| **2** | BUG-002 | — | BUG-025 |
| **3** | BUG-005 | — | BUG-024 · BUG-030 |
| **4** | BUG-014 | — | BUG-003 · BUG-007 · BUG-008 · BUG-023 |

---

## ✅ Progress

```
⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜  0/41   ~120m left
```

| Bug | Status | What Was Done |
|-----|:------:|---------------|
| BUG-001 🛡️🔒 | ✅ | Added mandatory report redaction guidance to `SKILL.md`; committed `1bceccb`. |
| BUG-002 🛡️🔒 | ✅ | Added secret/config ignore patterns and generated-report ignores to `.gitignore`; committed `ae59039`. |
| BUG-003 | ✅ | Added secret-scanning commands to setup phase in `SKILL.md`. |
| BUG-004 🛡️🔒 | ✅ | Added raw-artifact cleanup step to `MadMax.md`; added `bugs_raw_agent_*.jsonl` to `.gitignore`. |
| BUG-005 | ✅ | Replaced all `AskUserQuestion` references in `SKILL.md` with plain-text user prompts. |
| BUG-006 | ✅ | Replaced all `present_files` references in `SKILL.md` with chat summary + file-path citation. |
| BUG-007 | ✅ | Added trust/approval gate and package-manager detection guidance before running project tooling. |
| BUG-008 | ✅ | Replaced truncation with full output capture to `.bug-destroyer/` files. |
| BUG-009 | ✅ | Deleted stale `builds/bug-destroyer-v1.0.zip`; added reproducible `scripts/build-release.sh`. |
| BUG-010 | ✅ | Build script generates deterministic zip + SHA-256 checksum; documented release process in `SKILL.md`. |
| BUG-011 🛡️🔒 | ✅ | Replaced `{{GIT_BLAME}}` with `{{COMMIT_SHORT}}` in `TEMPLATE.md` to avoid embedding committer PII. |
| BUG-012 | ✅ | Fixed compliance grep to use extended regex with escaped/optional separators. |
| BUG-013 | ✅ | Corrected `PII in error logs` scoring example to 🟠🛡️🔒 and clarified final badge rule in `TAXONOMY.md`. |
| BUG-014 | ✅ | Removed undefined `Scorched` intensity from `TAXONOMY.md`; mapped outputs to `Deep + Mad Max`; added Medium to git strategy. |
| BUG-015 | ✅ | Renamed Deep verification heading from "One verification pass" to "Verification steps" to match actual count. |
| BUG-016 | ✅ | Removed `|| true` masking; commands now capture exit codes and stderr. |
| BUG-017 | ✅ | Quick profile now requires `QUICK-FINDINGS.md` (or `bugs.md`) with rollback commit hash. |
| BUG-018 | ✅ | Added accessibility, i18n, testing, and privacy data-flow checks to Quick profile. |
| BUG-019 | ✅ | Added test-baseline step to `profiles/Medium.md` before any fix. |
| BUG-020 | ✅ | Added scan-agent privacy rule to `profiles/MadMax.md` requiring PII redaction in raw findings. |
| BUG-021 | ✅ | Added privacy note that `npm audit` sends dependency metadata to npm registry. |
| BUG-022 | ✅ | Added `timeout` wrapper to all setup commands. |
| BUG-023 | ✅ | Added package-manager detection from lockfiles and `npx --no-install` guidance. |
| BUG-024 | ⬜ | — |
| BUG-025 | ⬜ | — |
| BUG-026 | ⬜ | — |
| BUG-027 | ✅ | Removed deprecated ESLint `--ext` flag from example command. |
| BUG-028 | ⬜ | — |
| BUG-029 | ⬜ | — |
| BUG-030 | ⬜ | — |
| BUG-031 | ✅ | Quick profile now requires creating a feature branch when on `main`. |
| BUG-032 | ⬜ | — |
| BUG-033 | ⬜ | — |
| BUG-034 | ⬜ | — |
| BUG-035 | ⬜ | — |
| BUG-036 | ⬜ | — |
| BUG-037 | ⬜ | — |
| BUG-038 | ⬜ | — |
| BUG-039 | ⬜ | — |

*(Status: ⬜ Pending | 🟦 In Progress | ✅ Fixed | ❌ Won't Fix | ⚠️ Blocked)*

---

## 🔍 Details

---

### 🔴 BUG-001 · Reports lack mandatory PII/secrets redaction

`SKILL.md:446-451` · Security / Privacy · 🛡️🔒 · ⏱ 20m · `bb54986`

| | Score |
|---|---|
| Security | Impact 5 · Likelihood 4 · Exploitability 3 = **60/125** |
| Privacy | Sensitivity 5 · Exposure 4 · User Impact 4 = **80/125** |
| Compliance | GDPR Art. 5(1)(f), GDPR Art. 32, PCI-DSS 3.4, SOC 2 CC6.1, ISO 27001 A.12.3.1 |

<details open>
<summary><b>What's wrong</b></summary>
<br>

The skill instructs writing `bugs.md`, `BUG-PREVENTION.md`, `COMPLIANCE-REPORT.md`, and `AUDIT-TRAIL.md` into the repository but gives no instruction to redact PII, tokens, passwords, or other secrets discovered during scanning. Because these files are not in `.gitignore`, any sensitive finding becomes part of git history.

**If exploited:** PII exposure, secret leakage into version control, amplification of any secret-exposure bug found, and compliance violations under GDPR, PCI-DSS, and similar frameworks.

**Fix now:** 20 minutes. **Fix after breach:** key rotation, incident response, legal review.

</details>

<details>
<summary><b>Current code</b></summary>
<br>

```markdown
| File | When | Content |
|------|------|---------|
| `bugs.md` | Always | Main report. Use the exact structure defined in the **bugs.md Template** section at the bottom of this file. |
| `BUG-PREVENTION.md` | Scorched + Mad Max | Specific, copy-paste ESLint rules, tsconfig changes, CI pipeline additions, pre-commit hooks, architectural recommendations. Each prevention references the BUG-IDs it would catch. |
| `COMPLIANCE-REPORT.md` | Scorched + Mad Max | All findings mapped to SOC 2, ISO 27001, GDPR, HIPAA, and PCI-DSS controls. Per-framework summary tables. Status of each control. Auditor-ready. |
| `AUDIT-TRAIL.md` | Mad Max | Complete timestamped log of every action taken. Pre-flight checks, agent launches, findings, fixes, commits, verification rounds, final sign-off. |
```

</details>

<details>
<summary><b>Fix</b></summary>
<br>

Add a mandatory sanitization step before writing any report: replace secrets/tokens/PII with placeholders (e.g., `[REDACTED_API_KEY]`, `[REDACTED_EMAIL]`) in code excerpts and findings. Add a "redaction verified" item to the Done Checklist. Consider adding generated report artifacts to `.gitignore` or storing them outside the repo.

```diff
+ Before writing any report, redact all secrets, tokens, passwords, emails, user IDs, and other PII using placeholders such as `[REDACTED]`.
+ Never paste live credentials or raw PII into `bugs.md`, `BUG-PREVENTION.md`, `COMPLIANCE-REPORT.md`, or `AUDIT-TRAIL.md`.
```

</details>

<details>
<summary><b>Prevent forever</b></summary>
<br>

- Add a pre-commit hook or CI check that scans generated reports for high-entropy strings and email patterns.
- Add `bugs.md`, `BUG-PREVENTION.md`, `COMPLIANCE-REPORT.md`, `AUDIT-TRAIL.md`, and `bugs_raw_agent_*.jsonl` to `.gitignore` or write them to a `reports/` directory that is ignored.

</details>

---

### 🔴 BUG-002 · `.gitignore` ignores nothing secret/config-related

`.gitignore:1-7` · Security / Privacy · 🛡️🔒 · ⏱ 5m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 4 · Exploitability 3 = **48/125** |
| Privacy | Sensitivity 4 · Exposure 5 · User Impact 4 = **80/125** |
| Compliance | SOC 2 CC6.1, SOC 2 CC6.7, ISO 27001 A.9.4.3, GDPR Art. 25, GDPR Art. 32, HIPAA §164.312(d), PCI-DSS Req 8.2.1 |

<details open>
<summary><b>What's wrong</b></summary>
<br>

The `.gitignore` only ignores Claude-specific directories and a build output directory. It contains no patterns for `.env` files, secrets, API keys, certificates, credentials, or local config. This is a preventive control gap: developers can accidentally commit sensitive files to git.

**If exploited:** If a `.env`, `*.pem`, `*.key`, credentials file, or similar secret-bearing file is later added to the repo, it will not be ignored by default and can be committed and pushed. Anyone with repo access can extract secrets.

**Fix now:** 5 minutes. **Fix after breach:** secret rotation, git history rewrite.

</details>

<details>
<summary><b>Current code</b></summary>
<br>

```gitignore
.claude
.claude-plugin
builds
```

</details>

<details>
<summary><b>Fix</b></summary>
<br>

Add standard secret/config ignore patterns and use trailing slashes for directories.

```diff
+ # Local / secrets
+ .env
+ .env.*
+ .env.local
+ *.pem
+ *.key
+ *.crt
+ *.p12
+ credentials*
+ secret*
+ config.local.*
+ .aws/
+ .netrc
+ *.log
+
  # Local tooling
- .claude
+ .claude/
- .claude-plugin
+ .claude-plugin/
- builds
+ builds/
```

</details>

<details>
<summary><b>Prevent forever</b></summary>
<br>

- Add a pre-commit hook (e.g., gitleaks, trufflehog) and a CI step that scans for committed secrets.
- Document the secret-handling policy in `CONTRIBUTING.md` or `SECURITY.md`.

</details>

---

### 🔴 BUG-003 · Setup phase has no secret-scanning step

`SKILL.md:150` · Security · ⏱ 20m · `bb54986`

| | Score |
|---|---|
| Security | Impact 5 · Likelihood 4 · Exploitability 5 = **100/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC6.1, SOC 2 CC6.6, ISO 27001 A.9.4, GDPR Art. 32, PCI-DSS 3.6 |

<details open>
<summary><b>What's wrong</b></summary>
<br>

The setup phase detects languages and frameworks but does not run secret-scanning tools (e.g., `gitleaks detect`, `truffleHog filesystem .`, `git-secrets --scan`). Hardcoded secrets and credentials in git history are therefore likely to be missed.

**If exploited:** Undetected secrets remain in the repository and can be exploited by anyone with access, leading to unauthorized API access, data breaches, or service abuse.

**Fix now:** 20 minutes. **Fix after breach:** rotate every exposed secret and rewrite git history.

</details>

<details>
<summary><b>Fix</b></summary>
<br>

Add secret-scanning commands to the setup phase, mark findings as 🤖 **Tool-Detected**, and include a dedicated "Secrets" category in the scan checklist.

```diff
+ # Secret scan
+ gitleaks detect --source . --verbose 2>&1 || true
+ truffleHog filesystem . --json 2>&1 || true
```

(Use `|| true` only after the first run is gated; capture exit codes and output for the report.)

</details>

---

### 🟠 BUG-004 · Raw scan artifacts retained with no cleanup

`SKILL.md:226` · `profiles/MadMax.md:19-22` · Privacy · 🛡️🔒 · ⏱ 15m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 3 · Exploitability 4 = **48/125** |
| Privacy | Sensitivity 4 · Exposure 3 · User Impact 3 = **36/125** |
| Compliance | GDPR Art. 5(1)(e), GDPR Art. 17, SOC 2 CC6.1 |

Raw scan artifacts (`bugs_raw_agent_*.jsonl`) likely contain raw, unredacted scan output. The skill never instructs deleting or securing these files after the sweep, and they are absent from `.gitignore`.

**Fix:** Add a cleanup step to delete raw agent files once `bugs.md` and audit files are finalized, define a retention period, and add `bugs_raw_agent_*.jsonl` to `.gitignore`.

---

### 🟠 BUG-005 · Skill references non-existent `AskUserQuestion` tool

`SKILL.md:88` · `SKILL.md:99-100` · Logic / Security · ⏱ 15m · `bb54986`

| | Score |
|---|---|
| Security | Impact 5 · Likelihood 3 · Exploitability 3 = **45/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC6.1, ISO 27001 A.9.4.1, GDPR Art. 32 |

The skill instructs using `AskUserQuestion` to resolve mandatory Gate 1 (target) and Gate 2 (intensity), but no such tool exists. Without a specified fallback, the agent may silently choose defaults or skip the mandatory gates.

**Fix:** Replace every `AskUserQuestion` reference with the available user-interaction pattern: ask in plain text with numbered options and wait for a reply. Add fallback behavior when the user does not provide a clear answer.

---

### 🟠 BUG-006 · Skill references non-existent `present_files` tool

`SKILL.md:120` · `SKILL.md:253` · Logic / Security · ⏱ 10m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 3 · Exploitability 3 = **36/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC6.1, ISO 27001 A.12.1.2 |

Gate 3 and the Done Checklist require presenting `bugs.md` via `present_files`, a tool not available to the agent. This breaks the approval gate because the plan cannot be surfaced to the user in the prescribed way.

**Fix:** Replace `present_files` with an available method: summarize the plan in chat and cite the file path. Require one of the explicit approval keywords before any fix is applied.

---

### 🟠 BUG-007 · Setup blindly runs `npx`/`npm` before approval gate

`SKILL.md:193-197` · Security / Supply Chain · ⏱ 20m · `bb54986`

| | Score |
|---|---|
| Security | Impact 5 · Likelihood 3 · Exploitability 3 = **45/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC6.1, ISO 27001 A.12.6, PCI-DSS 6.2 |

The setup phase runs `npx tsc`, `npx eslint`, `npm test`, and `npm audit` automatically in the user's repository before the approval gate. `npx` downloads and executes packages, and npm lifecycle scripts can run arbitrary code from a malicious or compromised `package.json`.

**Fix:** Gate all toolchain commands behind explicit user approval when the repo is untrusted; prefer locally installed binaries; warn that `npx`/`npm` may download code. Use `npx --no-install` and detect package manager from lockfiles.

---

### 🟠 BUG-008 · Toolchain output truncated, hiding vulns

`SKILL.md:193-197` · Security / Logic · ⏱ 15m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 4 · Exploitability 3 = **48/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC7.1, ISO 27001 A.12.6.1 |

The toolchain setup runs `npx tsc`, `npx eslint`, `npm test`, and `npm audit` and pipes output through `tail` or `head`. `npm audit --json 2>&1 | head -50` can silently cut off vulnerabilities that appear after the first 50 lines.

**Fix:** Remove truncation for detection; capture full JSON output from `npm audit --json`, `eslint --format json`, etc., and parse it programmatically. Only truncate for human-readable chat summaries.

---

### 🟠 BUG-009 · Stale release zip out of sync with source

`builds/bug-destroyer-v1.0.zip` · Supply Chain · ⏱ 45m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 3 · Exploitability 3 = **36/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC8.1, ISO 27001 A.12.1.2, ISO 27001 A.14.2.2 |

The v1.0 release zip in `builds/` predates the latest refactor and contains an older `SKILL.md` that still references the deprecated `Scorched` intensity. It also excludes the entire `profiles/` directory.

**Fix:** Regenerate the release zip from current HEAD, include all required files, and move final release artifacts to GitHub Releases instead of storing them in the source tree. Add an automated build script.

---

### 🟠 BUG-010 · Release zip has no checksum/manifest/CI

`builds/bug-destroyer-v1.0.zip` · Supply Chain · ⏱ 90m · `bb54986`

| | Score |
|---|---|
| Security | Impact 4 · Likelihood 4 · Exploitability 2.5 = **40/125** |
| Privacy | Sensitivity 1 · Exposure 1 · User Impact 1 = **1/125** |
| Compliance | SOC 2 CC7.2, ISO 27001 A.12.5.1, ISO 27001 A.14.2.9, NIST SSDF PW6.2 |

There is no SHA-256 checksum, signed manifest, GPG signature, or CI attestation for the release zip, and no build script defines how it is created.

**Fix:** Add a reproducible build step that packages the zip with deterministic file ordering, generates a SHA-256 manifest, and signs it. Publish releases to GitHub Releases rather than keeping the binary inside the source tree.

---

### 🟠 BUG-011 · `{{GIT_BLAME}}` embeds committer PII in reports

`TEMPLATE.md:121` · Privacy · 🛡️🔒 · ⏱ 15m · `bb54986`

| | Score |
|---|---|
| Security | Impact 2 · Likelihood 4 · Exploitability 2 = **16/125** |
| Privacy | Sensitivity 5 · Exposure 3 · User Impact 3 = **45/125** |
| Compliance | GDPR Art. 5(1)(c), GDPR Art. 32, SOC 2 CC6.1, ISO 27001 A.18.1 |

Each bug detail block includes a `{{GIT_BLAME}}` field. Git blame output contains developer names and email addresses (PII) and will be copied into generated bug reports shared with auditors or external reviewers.

**Fix:** Make git blame optional, redact email addresses, or replace it with a non-PII identifier such as a team alias. Add a note that reports containing git blame should not be shared externally.

---

### 🟡 BUG-012 · Compliance grep uses unescaped `.` wildcards

`SKILL.md:186` · Logic / Quality · ⏱ 5m · `bb54986`

The compliance grep uses `grep -ri "GDPR\|HIPAA\|PCI\|SOC.2\|ISO.27001\|CCPA"`. The unescaped dots mean `SOC.2` matches strings like `SOC12` and may miss exact `SOC 2`.

**Fix:** Escape the dots: `grep -Eri 'GDPR|HIPAA|PCI|SOC[ -]?2|ISO[ -]?27001|CCPA'`.

---

### 🟡 BUG-013 · Scoring example contradicts severity table

`SKILL.md:362` · `TAXONOMY.md:362` · Logic / Quality · ⏱ 5m · `bb54986`

The `PII in error logs` scoring example has a privacy score of 45, which the document defines as Privacy-Critical (≥ 30) and maps to at least High (🟠), yet the `Final` column shows Medium (🟡).

**Fix:** Correct the final badge for that row to 🔴🛡️🔒 or 🟠🛡️🔒 to align with the scoring matrix.

---

### 🟡 BUG-014 · Undefined `Scorched` intensity in strategy/output tables

`SKILL.md:403` · `TAXONOMY.md:403` · Logic / Quality · ⏱ 15m · `bb54986`

The skill defines only four intensities (Quick, Medium, Deep, Mad Max), but `Scorched` appears in the Git Strategy table, the verification section, and the output-file table. It is never defined.

**Fix:** Either add `profiles/Scorched.md` with a clear definition, or replace every `Scorched` reference with the appropriate documented intensity (likely Deep or Mad Max).

---

### 🟡 BUG-015 · Verification pass counts don't match listed steps

`SKILL.md:416-425` · Logic / Quality · ⏱ 5m · `bb54986`

The Deep section states "One verification pass" but enumerates three distinct steps. The Scorched section states "Three verification passes" but enumerates four steps.

**Fix:** Rephrase headings to "verification steps" or adjust the stated count to match the actual number of activities.

---

### 🟡 BUG-016 · Setup commands suppress exit codes with `|| true`

`SKILL.md:154-188` · Logic / Quality · ⏱ 15m · `bb54986`

Detection and toolchain snippets append `|| true` after nearly every step. If a tool fails, the failure is silently swallowed and the audit continues as if the step succeeded.

**Fix:** Use `[ -f file ]` checks instead of `ls ... || true`. Run toolchain commands without `|| true`, capture exit codes and full output separately, and surface failures to the user.

---

### 🟡 BUG-017 · Quick profile disables `bugs.md` output

`profiles/Quick.md:6` · Compliance · ⏱ 15m · `bb54986`

Quick.md declares "Output: Chat summary. No `bugs.md`", which contradicts `TAXONOMY.md` that lists `bugs.md` as required "Always".

**Fix:** Update Quick.md to require a minimal `bugs.md` (or an approved lightweight `QUICK-FINDINGS.md`) with id, file, line, title, severity, status, and pre-sweep commit hash.

---

### 🟡 BUG-018 · Quick profile omits required taxonomy categories

`profiles/Quick.md:9-26` · Compliance · ⏱ 20m · `bb54986`

The Quick profile covers only a narrow security pattern list and omits accessibility, i18n, testing quality, and full privacy data-flow checks.

**Fix:** Add lightweight category-specific checks to the profile: alt text/labels for accessibility, hardcoded-string/RTL sniff for i18n, test-file presence for testing, and a short privacy data-flow prompt.

---

### 🟡 BUG-019 · Medium profile omits test baseline step

`profiles/Medium.md:21-28` · Testing / Quality · ⏱ 10m · `bb54986`

The fix protocols require re-running tests after changes but never instruct establishing a baseline before touching code.

**Fix:** Add a baseline step: "Run tests before any fix and record the result. If tests are already failing, warn the user and ask whether to proceed."

---

### 🟡 BUG-020 · No privacy handling rules for scan agents

`profiles/MadMax.md:19` · Privacy · ⏱ 15m · `bb54986`

Scan agents are instructed to hunt for PII but are not told to redact PII in logs/raw findings or avoid including real user data in report excerpts.

**Fix:** Add explicit instructions for scan agents to redact PII in logs and raw findings, quote only necessary code snippets, and avoid including real user data.

---

### 🟡 BUG-021 · `npm audit` shares dependency metadata without disclosure

`SKILL.md:193-197` · Privacy / Compliance · ⏱ 15m · `bb54986`

`npm audit` transmits dependency names/versions to the npm registry. The skill documentation contains no privacy notice or consent gate.

**Fix:** Add a privacy/transparency notice and gate the first network-dependent command with user consent; offer an offline-only mode.

---

### 🟡 BUG-022 · Setup has no timeout/progress and can hang

`SKILL.md:146` · `SKILL.md:190-199` · UX / Security · ⏱ 15m · `bb54986`

The skill labels setup as "30 Seconds, Silent" but commands like `npm test` can hang indefinitely without timeouts or visible progress.

**Fix:** Wrap every setup command with a timeout (e.g., `timeout 120`), stream concise progress, and abort on excessive duration.

---

### 🟡 BUG-023 · Toolchain assumes npm, ignores yarn/pnpm/bun

`SKILL.md:193-197` · Logic / Supply Chain · ⏱ 15m · `bb54986`

The setup hardcodes `npm`/`npx` without detecting the project's actual package manager. `npx` can download and execute a package if it is missing.

**Fix:** Detect package manager from lockfiles and use the matching runner. Add `npx --no-install` so missing tools fail loudly.

---

### 🟢 BUG-024 · Intensity recommendation inverts project-size guidance

`SKILL.md:209` · UX / Logic · ⏱ 5m · `bb54986`

The recommendation table says projects with fewer than 50 files should use Medium (5–15 min), while 50–200 file projects should use Quick or Medium (2–5 min or 5–15 min). This inverts the expected relationship.

**Fix:** Recommend Quick for <50 files, Medium for 50–200 files, and Quick-first for >200 files.

---

### 🟢 BUG-025 · `.gitignore` ignores `.claude-plugin/plugin.json`

`.gitignore:2` · Supply Chain / Quality · ⏱ 5m · `bb54986`

`.gitignore` ignores the entire `.claude-plugin` directory, so `plugin.json` is not tracked even though it is required for skill distribution.

**Fix:** Remove `.claude-plugin` from `.gitignore` or add `!.claude-plugin/plugin.json` and commit `plugin.json`.

---

### 🟢 BUG-026 · Useless use of `cat` in framework detection

`SKILL.md:166-172` · Code Quality · ⏱ 5m · `bb54986`

Framework detection uses `cat package.json 2>/dev/null | grep -q '"next"'` instead of `grep` reading the file directly.

**Fix:** Replace with `grep -q '"next"' package.json 2>/dev/null` for each framework check.

---

### 🟢 BUG-027 · ESLint command uses deprecated `--ext`

`SKILL.md:194` · Logic / Quality · ⏱ 10m · `bb54986`

`npx eslint . --ext .ts,.tsx --format json` uses `--ext`, which is deprecated and ignored in ESLint flat-config projects.

**Fix:** Detect the ESLint config style and use the project's own lint script or invoke ESLint without `--ext` when a flat config is present.

---

### 🟢 BUG-028 · Framework detection greps instead of parsing JSON

`SKILL.md:166-172` · Logic / Quality · ⏱ 10m · `bb54986`

Framework detection greps for strings like `"next"` inside `package.json` instead of parsing JSON, causing false positives/negatives.

**Fix:** Parse `package.json` with `node -e` or `jq` and check actual dependency keys.

---

### 🟢 BUG-029 · Setup labeled "30 Seconds, Silent" but may run for minutes

`SKILL.md:146` · UX · ⏱ 5m · `bb54986`

The setup section is labeled "(30 Seconds, Silent)" but includes `npm test` and `npm audit`, which routinely take minutes.

**Fix:** Change the heading to "Setup (silent; duration varies by project)" and split fast detection from slower toolchain validation.

---

### 🟢 BUG-030 · Hardcoded English chat templates

`SKILL.md:456-472` · `profiles/Quick.md:32` · i18n / UX · ⏱ 20m · `bb54986`

All skill responses, report templates, and generated files are hardcoded in English with no i18n guidance.

**Fix:** Replace fixed English templates with language-agnostic structural guidance or label examples as English-only and instruct translation into the user's language.

---

### 🟢 BUG-031 · Quick profile allows committing directly from main

`profiles/Quick.md:7` · Security / Quality · ⏱ 5m · `bb54986`

Quick.md says "One commit on the current branch if any fixes are approved" without verifying whether the current branch is protected `main`.

**Fix:** Add a pre-fix branch check: if the current branch is main, create and switch to a feature branch before committing any fixes.

---

### 🟢 BUG-032 · No skill test suite or CI

`SKILL.md:245` · Testing · ⏱ 60m · `bb54986`

The skill defines complex behavior but has no automated tests, fixtures, CI workflow, or example outputs.

**Fix:** Add a `tests/` directory with example conversations, expected `bugs.md` outputs, and checks that forbidden tools like `AskUserQuestion` are never referenced. Add a minimal CI workflow.

---

### 🟢 BUG-033 · Template compliance table omits HIPAA/PCI-DSS

`TEMPLATE.md:197-206` · Compliance · ⏱ 10m · `bb54986`

The template only reserves columns for SOC 2, GDPR, and ISO 27001, though HIPAA and PCI-DSS are also referenced.

**Fix:** Add HIPAA and PCI-DSS columns or document conditional rendering.

---

### 🟢 BUG-034 · Health/Privacy 0-100 aggregation formula undefined

`TAXONOMY.md:293-352` · Logic / Quality · ⏱ 20m · `bb54986`

The report template requires Health and Privacy scores out of 100, but the taxonomy only defines per-bug scores (max 125). No aggregation algorithm is documented.

**Fix:** Define the aggregation formula in `TAXONOMY.md` and reference it from `SKILL.md` and `TEMPLATE.md`.

---

### ⚪ BUG-035 · TEMPLATE verification table has extra column

`TEMPLATE.md:260-268` · Logic / Quality · ⏱ 5m · `bb54986`

The verification table header defines five inquisitor columns plus an empty seventh column, but each data row contains six status values after the Round number.

**Fix:** Remove the trailing extra status cell or add a sixth named inquisitor.

---

### ⚪ BUG-036 · TEMPLATE privacy-impact threshold inconsistent

`TEMPLATE.md:193` · Logic · ⏱ 5m · `bb54986`

The Privacy Impact table note says to include bugs with "Privacy Score ≥ 15," but the taxonomy defines Privacy-Critical as Privacy Score ≥ 30.

**Fix:** Change the note to "Privacy Score ≥ 30" to match the taxonomy.

---

### ⚪ BUG-037 · Rollback commands lack safety warning

`TEMPLATE.md:285-286` · UX / Quality · ⏱ 10m · `bb54986`

The Rollback section includes literal `git reset --hard` and `git revert` snippets without warning that `reset --hard` discards uncommitted work.

**Fix:** Add an explicit warning above the commands and explain placeholder substitution. Prefer safer alternatives like `git stash` before reset.

---

### ⚪ BUG-038 · Compliance table lacks evidence/auditor columns

`TEMPLATE.md:197-206` · Compliance · ⏱ 5m · `bb54986`

The Compliance table only contains Framework, Controls, and Status. Auditors require evidence location and remediation notes.

**Fix:** Add "Evidence" and "Notes / Remediation Date" columns.

---

### ⚪ BUG-039 · Taxonomy has duplicate pattern name "Missing authentication"

`TAXONOMY.md:14` · `TAXONOMY.md:154` · Documentation Quality · ⏱ 2m · `bb54986`

The exact same name "Missing authentication" is used for a security pattern and a cryptography pattern.

**Fix:** Rename the cryptography entry to "Missing ciphertext authentication" or "Encryption without MAC/AEAD".

---

## 🧩 Systemic

*Patterns across files. Fix once, eliminate many.*

| Issue | Files | Bugs | Fix |
|-------|-------|------|-----|
| References to non-existent tools (`AskUserQuestion`, `present_files`) | `SKILL.md` | BUG-005 · BUG-006 | Replace with plain-text user interaction instructions |
| Toolchain snippets run project code silently and truncate output | `SKILL.md` | BUG-007 · BUG-008 · BUG-016 · BUG-021 · BUG-022 · BUG-023 | Add trust gate, full JSON capture, timeouts, package-manager detection |
| Generated reports lack privacy guardrails | `SKILL.md` · `TEMPLATE.md` | BUG-001 · BUG-004 · BUG-011 | Mandatory redaction, artifact cleanup, git blame redaction |
| Scoring/workflow inconsistencies | `SKILL.md` · `TAXONOMY.md` · `TEMPLATE.md` | BUG-013 · BUG-014 · BUG-015 · BUG-034 · BUG-036 · BUG-039 | Audit and align all thresholds and intensity references |
| Build/distribution hygiene | `.gitignore` · `builds/` | BUG-002 · BUG-009 · BUG-010 · BUG-025 | Ignore secrets, automate releases, sign artifacts |
| English-only / no i18n | `SKILL.md` · `profiles/Quick.md` | BUG-030 · BUG-018 (partial) | Add i18n guidance and locale-aware templates |

---

## 🔒 Privacy Impact

| Bug | Data | Exposure | Harm | Score |
|-----|------|----------|------|:----:|
| BUG-001 | Secrets, PII, tokens | Report written to repo / git history | Breach amplification, compliance violation | **80** 🛡️🔒 |
| BUG-002 | `.env`, keys, certs | Accidental git commit | Secret leak, identity theft, account takeover | **80** 🛡️🔒 |
| BUG-004 | Raw scan output | Untracked JSONL files retained | PII/secrets linger in workspace | **36** 🛡️🔒 |
| BUG-011 | Developer name/email | Copied into shared bug reports | Social engineering, unwanted disclosure | **45** 🛡️🔒 |
| BUG-021 | Dependency metadata | Sent to npm registry | Unauthorized data sharing | **18** |

---

## 📋 Compliance

| Framework | Controls | Status |
|-----------|----------|:------:|
| **SOC 2** | CC6.1, CC6.6, CC6.7, CC7.1, CC7.2, CC8.1 | ❌ |
| **GDPR** | Art. 5, Art. 13/14, Art. 17, Art. 25, Art. 32 | ❌ |
| **ISO 27001** | A.8.1, A.9.4.1, A.9.4.3, A.12.1, A.12.3, A.12.4, A.12.5, A.12.6, A.14.2, A.18.1, A.18.2 | ❌ |
| **HIPAA** | §164.312(a)(1), §164.312(d) | ❌ |
| **PCI-DSS** | Req 3.4, Req 3.6, Req 6.2, Req 8.2.1 | ❌ |

---

## 🛡️ Prevention

*35 of 41 bugs could have been caught automatically or by better process.*

### Markdown lint / template validation (12 preventable)

| Rule / Check | Catches |
|------|---------|
| Placeholder/brace balance | BUG-035 |
| Internal link consistency | BUG-014 · BUG-039 |
| Severity-threshold cross-check | BUG-013 · BUG-036 |
| Table column count | BUG-035 |
| Terminology glossary | BUG-014 · BUG-039 |

### CI / tooling (15 preventable)

| Rule / Check | Catches |
|------|---------|
| Secret-scan in CI | BUG-003 · BUG-002 |
| Reproducible build + checksum | BUG-009 · BUG-010 |
| Tool existence check | BUG-005 · BUG-006 |
| Package-manager detection test | BUG-023 |
| ESLint deprecation lint | BUG-027 |
| Test baseline assertion | BUG-019 · BUG-032 |

### Privacy-by-design (8 preventable)

| Rule / Check | Catches |
|------|---------|
| Redaction checklist | BUG-001 · BUG-004 · BUG-011 |
| `.gitignore` secret patterns | BUG-002 |
| Network tool consent | BUG-021 |
| Artifact retention policy | BUG-004 |

---

## 📈 Before & After

| | Before | After |
|---|---|---|
| Health | 42/100 | **TBD** |
| Privacy | 38/100 | **TBD** |
| 🔴 Critical | 3 | **0** |
| 🛡️🔒 Privacy-Critical | 3 | **0** |
| 🟠 High | 9 | **0** |
| Tests | none | **TBD** |
| Lint | none | **TBD** |
| Types | none | **TBD** |
| Vulns | 1 stale artifact | **TBD** |
| Files changed | — | **TBD** |

---

## 🏆 Verification

*Mad Max only. Every Inquisitor must return CLEAN.*

| Round | Alpha | Beta | Gamma | Delta | Omega | |
|:-----:|-------|------|-------|-------|-------|---|
| 1 | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ |

> **Pending.** Fixes not yet applied. `2026-06-28` · `bug-destroyer/mad-max-2026-06-28`

---

## ⚠️ Residual Risk

| Risk | Likelihood | Impact | Mitigation |
|------|:----------:|:------:|------------|
| Skill consumed while stale | High | Moderate | Regenerate zip on every release; use CI-attested artifacts |
| Tool name drift in future Claude versions | Possible | Moderate | Add CI test that forbids unknown tool names |
| User commits secrets before `.gitignore` fixed | Possible | Catastrophic | Add pre-commit secret scan |

> **Residual risk: 🔴 HIGH until fixes applied.**

---

## ↩️ Rollback

```bash
git reset --hard bb54986   # Everything
git revert <commit>        # Single fix
```

> ⚠️ `git reset --hard` discards uncommitted work. Stash or back up first.

---

> *"I came. I saw. I found 41 bugs in a skill about finding bugs. Let me fix them."*
> — Bug Destroyer v2.0 (aspirational)
