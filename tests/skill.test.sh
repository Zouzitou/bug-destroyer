#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

fail=0

# 1. Forbidden tool names must not appear
if grep -R "AskUserQuestion\|present_files" SKILL.md profiles/*.md TEMPLATE.md; then
  echo "FAIL: Forbidden tool names found"
  fail=1
else
  echo "PASS: No forbidden tool names"
fi

# 2. .gitignore must contain secret patterns
for pat in '.env' '*.pem' '*.key' 'credentials*' 'secret*' 'bugs_raw_agent_*.jsonl'; do
  if grep -q "^${pat//\*/\\*}" .gitignore; then
    echo "PASS: .gitignore contains $pat"
  else
    echo "FAIL: .gitignore missing $pat"
    fail=1
  fi
done

# 3. TAXONOMY.md scoring example for PII in error logs must be 🟠🛡️🔒
if grep -q '| PII in error logs | 2 | 4 | 2 | \*\*16\*\* | 5 | 3 | 3 | \*\*45\*\* | 🟠🛡️🔒 |' TAXONOMY.md; then
  echo "PASS: PII in error logs scoring example is correct"
else
  echo "FAIL: PII in error logs scoring example is wrong"
  fail=1
fi

# 4. TEMPLATE.md verification table header and row column counts must match
# Header: Round | Alpha | Beta | Gamma | Delta | Omega | |
# Data row: | 1 | ... | ... | ... | ... | ... | |
# So both should have 7 columns.
header_cols=$(sed -n '/^## 🏆 Verification/,/^---$/p' TEMPLATE.md | grep -E '^\| [0-9]+ \|' | head -1 | awk -F'|' '{print NF-1}')
if [ "$header_cols" = "7" ]; then
  echo "PASS: Verification table has 7 columns"
else
  echo "FAIL: Verification table has $header_cols columns, expected 7"
  fail=1
fi

# 5. No Scorched references in SKILL.md or TAXONOMY.md
if grep -R "Scorched\|scorched" SKILL.md TAXONOMY.md TEMPLATE.md; then
  echo "FAIL: Scorched references remain"
  fail=1
else
  echo "PASS: No Scorched references"
fi

if [ "$fail" -eq 0 ]; then
  echo "All tests passed"
  exit 0
else
  echo "Some tests failed"
  exit 1
fi
