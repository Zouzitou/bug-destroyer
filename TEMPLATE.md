## bugs.md Template

When generating `bugs.md`, use this exact structure. Replace `{{PLACEHOLDER}}` values with real data. Duplicate sections (bug rows, detail blocks, etc.) for each bug found.

```markdown
# 🐛💥 Bug Destroyer

> `{{MODE}}` · `{{TARGET}}` · {{DATE}} · {{FILES}} files · {{DURATION}} · `{{COMMIT}}`

---

  {{HEALTH}}/100  Health     ████████████████░░░░░░  {{HEALTH_TREND}}
  {{PRIVACY}}/100  Privacy    ████████████████████░░  {{PRIVACY_TREND}}

| 🔴 Critical | 🟠 High | 🟡 Medium | 🟢 Low | ⚪ Cosmetic | 🛡️🔒 Privacy |
|:---:|:---:|:---:|:---:|:---:|:---:|
| **{{C}}** | **{{H}}** | **{{M}}** | **{{L}}** | **{{O}}** | **{{P}}** |

> **{{TOTAL}} bugs found.** {{ONE_LINER}}

---

## ⚡ What Needs Attention

### 🔴 Fix Now

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-001 🛡️🔒 | {{TITLE}} | `{{FILE}}:{{LINE}}` | {{EFFORT}}m |

### 🟠 Fix Today

| Bug | What | Where | ⏱ |
|-----|------|-------|----|
| BUG-003 | {{TITLE}} | `{{FILE}}:{{LINE}}` | {{EFFORT}}m |

### 🟡 This Week

| Bug | What | Where | ⏱ |
|-----|------|-------|----|

### 🟢 When Convenient

| Bug | What | Where | ⏱ |
|-----|------|-------|----|

### ⚪ Polish

| Bug | What | Where | ⏱ |
|-----|------|-------|----|

---

## 🔥 Where

*Files with the most findings.*

| File | Bugs | Mix | Risk |
|------|------|-----|------|
| 🔥 `{{FILE}}` | {{N}} | {{SEVERITY_MIX}} | **{{RISK}}** |

---

## 📊 What Kinds

| Category | Total | 🔴 | 🟠 | 🟡 | 🟢 |
|----------|-------|----|----|----|----|
| 🛡️ Security | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🔒 Privacy | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| ⚡ Performance | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🐛 Logic | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| ♿ A11y | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🎨 UI | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🧠 UX | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🔧 Backend | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🧹 Quality | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |
| 🧪 Testing | {{N}} | {{C}} | {{H}} | {{M}} | {{L}} |

*(Include only categories that have bugs. Add 🧠 Memory, ⚡ Concurrency, 🔐 Crypto, 📦 Supply Chain, 🌐 i18n if applicable.)*

---

## 🎯 Risk Matrix

*Top-right = most urgent. 🛡️🔒 = privacy-critical.*

Place each bug in the grid at its (Likelihood, Impact) coordinate.

---

## 🔗 Dependencies

*Fix blockers first.*

| Order | Bug | Blocked By | Blocks |
|:-----:|-----|------------|--------|
| **1** | BUG-{{ID}} | — | BUG-{{ID}} |

---

## ✅ Progress

{{PROGRESS_BAR}}   {{FIXED}}/{{TOTAL}}   ~{{REMAINING}} left

| Bug | Status | What Was Done |
|-----|:------:|---------------|
| 🔴 BUG-001 🛡️🔒 | ✅ | {{WHAT_WAS_DONE}} |
| 🟠 BUG-003 | 🟦 | {{WHAT_IS_HAPPENING}} |
| 🟡 BUG-005 | ⬜ | — |

*(Status: ⬜ Pending | 🟦 In Progress | ✅ Fixed | ❌ Won't Fix | ⚠️ Blocked)*

---

## 🔍 Details

---

### 🔴 BUG-001 · {{TITLE}}

`{{FILE}}:{{LINE}}` · {{CATEGORY}} · {{BADGES}} · ⏱ {{EFFORT}}m · `{{COMMIT_SHORT}}`

| | Score |
|---|---|
| Security | Impact {{I}} · Likelihood {{L}} · Exploitability {{E}} = **{{SEC_SCORE}}/125** |
| Privacy | Sensitivity {{S}} · Exposure {{E}} · User Impact {{U}} = **{{PRIV_SCORE}}/125** |
| Compliance | {{COMPLIANCE_CONTROLS}} |

<details open>
<summary><b>What's wrong</b></summary>
<br>

{{DESCRIPTION}}

**If exploited:** {{EXPLOIT_IMPACT}}

**Fix now:** {{EFFORT}} minutes. **Fix after breach:** {{COST_OF_INACTION}}

</details>

<details>
<summary><b>Current code</b></summary>
<br>

```{{LANGUAGE}}
{{CURRENT_CODE}}
```

</details>

<details>
<summary><b>Fix</b></summary>
<br>

{{FIX_EXPLANATION}}

```diff
{{DIFF}}
```

</details>

<details>
<summary><b>Prevent forever</b></summary>
<br>

{{PREVENTION_CONFIG}}

</details>

---

*(Repeat the Bug Details block for every bug. Order: Critical → High → Medium → Low → Cosmetic.)*

---

## 🧩 Systemic

*Patterns across files. Fix once, eliminate many.*

| Issue | Files | Bugs | Fix |
|-------|-------|------|-----|
| {{PATTERN}} | {{N}} files | BUG-{{IDS}} | {{ONE_FIX}} |

---

## 🔒 Privacy Impact

| Bug | Data | Exposure | Harm | Score |
|-----|------|----------|------|:----:|
| BUG-{{ID}} | {{DATA_TYPE}} | {{EXPOSURE}} | {{HARM}} | **{{SCORE}}** 🛡️🔒 |

*(Only include bugs with Privacy Score ≥ 15.)*

---

## 📋 Compliance

| Framework | Controls | Status |
|-----------|----------|:------:|
| **SOC 2** | {{CONTROLS}} | ✅ |
| **GDPR** | {{ARTICLES}} | ✅ |
| **ISO 27001** | {{CONTROLS}} | ✅ |

*(Only include frameworks that have mapped findings.)*

---

## 📦 Supply Chain

| Package | Issue | Sev | Fix |
|---------|-------|:---:|-----|
| `{{PACKAGE}}@{{VERSION}}` | {{CVE}} | {{SEV}} | → {{FIX_VERSION}} |

*(Only include if dependency audit found vulnerabilities.)*

---

## 🛡️ Prevention

*{{PREVENTABLE}} of {{TOTAL}} bugs could have been caught automatically.*

### ESLint ({{N}} preventable)

| Rule | Catches |
|------|---------|
| `{{RULE}}` | BUG-{{IDS}} |

### TypeScript ({{N}} preventable)

| Config | Catches |
|--------|---------|
| `{{CONFIG}}` | BUG-{{IDS}} |

### CI

```yaml
{{CI_CONFIG}}
```

---

## 📈 Before & After

| | Before | After |
|---|---|---|
| Health | {{BEFORE}}/100 | **{{AFTER}}/100** |
| Privacy | {{BEFORE}}/100 | **{{AFTER}}/100** |
| 🔴 Critical | {{BEFORE}} | **0** |
| 🛡️🔒 Privacy-Critical | {{BEFORE}} | **0** |
| 🟠 High | {{BEFORE}} | **0** |
| Tests | {{BEFORE}} passing | **{{AFTER}} passing** |
| Lint | {{BEFORE}} errors | **{{AFTER}}** |
| Types | {{BEFORE}} errors | **{{AFTER}}** |
| Vulns | {{BEFORE}} | **{{AFTER}}** |
| Files changed | — | **{{FILES}}** |

---

## 🏆 Verification

*Mad Max only. Every Inquisitor must return CLEAN.*

| Round | Alpha | Beta | Gamma | Delta | Omega | |
|:-----:|-------|------|-------|-------|-------|---|
| 1 | ❌ {{N}} | ❌ {{N}} | ✅ | ❌ {{N}} | ✅ | ❌ |
| 2 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

> **All 5 Inquisitors CLEAN.** Zero bugs, zero privacy violations, zero compliance gaps. `{{DATE}}` · `{{FINAL_COMMIT}}`

---

## ⚠️ Residual Risk

| Risk | Likelihood | Impact | Mitigation |
|------|:----------:|:------:|------------|
| {{RISK}} | {{L}} | {{I}} | {{MITIGATION}} |

> **Residual risk: 🟢 LOW.** All critical/high resolved. Remaining at industry-standard with mitigations.

---

## ↩️ Rollback

git reset --hard {{PRE_SWEEP_COMMIT}}   # Everything
git revert <commit>                       # Single fix

---

> *"I came. I saw. I destroyed every bug — and left the tools to ensure they never return."*
> — Bug Destroyer {{VERSION}}
```
