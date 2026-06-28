## The Bug Taxonomy

Your complete reference. Every pattern, every time. Apply ALL categories that are relevant to the project's languages and frameworks.

### 🛡️ Security

#### Universal Patterns

| Pattern | What to Look For | Why It Matters | Sev |
|---------|------------------|----------------|-----|
| **Secret exposure** | `process.env.*` in client code, hardcoded keys/tokens/passwords, `.env` files committed, secrets in git history, API keys in source | Secrets in client bundles are public. Anyone can read them. Secrets in git history are forever accessible. | 🔴 |
| **Code injection** | `eval()`, `new Function()`, `innerHTML`, `dangerouslySetInnerHTML`, `document.write()`, string concatenation in SQL queries, shell command injection via `exec()`/`spawn()` with user input | Allows arbitrary code execution in the browser or server. SQL injection can dump entire databases. | 🔴 |
| **Missing authentication** | API routes without auth middleware, server actions without session validation, protected pages without auth checks, GraphQL resolvers without auth | Unauthenticated access to sensitive operations. Anyone can call the endpoint. | 🔴 |
| **Open redirect** | `redirect(req.query.returnUrl)`, dynamic `window.location` from URL parameters, no URL validation before redirect | Phishing vector — attacker crafts links that look like your domain but redirect to theirs. | 🟠 |
| **CSRF gaps** | State-changing GET requests, missing CSRF tokens on forms, cookie-based auth without `SameSite` attribute | Allows attackers to make requests on behalf of authenticated users from other sites. | 🟠 |
| **CORS misconfiguration** | `Access-Control-Allow-Origin: *` with `credentials: true`, reflected `Origin` header in CORS response | Allows any domain to make authenticated requests to your API. | 🟠 |
| **Path traversal** | `fs.readFile(userInput)`, `path.join(base, userInput)` without path validation or sanitization | Attacker can read arbitrary files from the server filesystem — configs, secrets, source code. | 🔴 |
| **ReDoS** | Regex with nested quantifiers like `(a+)+b`, user-controlled regex input, regex tested against long strings | Denial of service via catastrophic backtracking — CPU spikes to 100%. | 🟠 |
| **Timing attacks** | `===` on secrets/tokens, early-return in auth string comparison, non-constant-time comparison | Attacker can guess secrets character by character by measuring response time. | 🟡 |
| **Prototype pollution** | `Object.assign({}, userInput)`, `_.merge({}, userInput)`, `lodash.merge({}, userInput)`, recursive merge without `hasOwnProperty` check | Attacker can inject properties into all objects, potentially leading to RCE or auth bypass. | 🟠 |

#### TypeScript/JavaScript Specific

| Pattern | What to Look For | Why |
|---------|------------------|-----|
| Unvalidated dynamic imports | `import(userInput)` or `require(userInput)` — user-controlled module loading | Arbitrary code execution |
| `postMessage` without origin check | `window.addEventListener('message', handler)` without validating `event.origin` | Cross-origin communication hijacking |
| `localStorage` for sensitive tokens | JWT/refresh tokens stored in `localStorage` instead of httpOnly cookies | XSS can steal tokens from localStorage |
| `JSON.parse` on untrusted input | Parsing user input without try/catch or schema validation | Can throw, can be prototype-polluted |
| `child_process.exec` with user input | `exec(\`convert ${userFile}\`)` — shell command injection | Arbitrary command execution |
| Missing `rel="noopener"` | `target="_blank"` without `rel="noopener noreferrer"` | Opened page can access `window.opener` |

#### Python Specific

| Pattern | What to Look For | Why |
|---------|------------------|-----|
| `pickle.load` on untrusted data | Deserializing pickle from user input, network, or files | Arbitrary code execution |
| `yaml.load` without SafeLoader | `yaml.load(userInput)` instead of `yaml.safe_load(userInput)` | Arbitrary code execution in PyYAML |
| `os.system` / `subprocess.call(shell=True)` | Shell command with user-controlled input | Command injection |
| `eval()` / `exec()` on user input | Executing user-provided strings as code | Arbitrary code execution |
| `assert` for validation | Using `assert` for input validation or security checks | Assertions are stripped with `python -O` |
| `tempfile.mktemp()` | Using `mktemp()` instead of `mkstemp()` | Race condition — file can be hijacked between name generation and creation |
| XML without defusedxml | `xml.etree.ElementTree.parse(userInput)` without defusedxml | XXE attacks, Billion Laughs |

#### Go Specific

| Pattern | What to Look For | Why |
|---------|------------------|-----|
| Goroutine leak | Goroutine started with no cancellation mechanism, channel that never closes | Memory leak, eventual crash |
| Unbuffered channel deadlock | Send on unbuffered channel with no active receiver | Program hangs forever |
| `defer` in a loop | `for { defer f.Close() }` — defers stack up, only run at function exit | Resource exhaustion |
| `text/template` for HTML | Using `text/template` instead of `html/template` for HTML output | XSS — text/template doesn't escape HTML |
| Integer overflow | `int` overflow in slice bounds check, allocation size calculation | Buffer overflow, memory corruption |

---

### 🔒 Privacy

Privacy is an independent dimension. A bug can be low security but high privacy. Score every bug for privacy impact.

#### Data Handling Patterns

| Pattern | What to Look For | Privacy Score | Sev |
|---------|------------------|---------------|-----|
| **PII in logs** | `console.log(user)`, `logger.info(userData)`, `print(user.email)`, `log.debug(user)` — any user data in log output | Sensitivity 4-5, Exposure 3-5 | 🔴 |
| **PII in error messages** | Error responses that include user input, email addresses, user IDs, or data values | Sensitivity 4-5, Exposure 4-5 | 🔴 |
| **PII in URLs** | User data in query parameters, path segments, or URL hashes — visible in browser history, server logs, analytics | Sensitivity 3-4, Exposure 5 | 🟠 |
| **PII in client bundle** | User data embedded in client-side JavaScript — visible in browser dev tools | Sensitivity 4-5, Exposure 5 | 🔴 |
| **Missing data deletion** | No endpoint or mechanism to delete user data on request — GDPR Right to Erasure (Art. 17) | Sensitivity 3-5, Exposure 2-3 | 🟠 |
| **Missing data export** | No endpoint to export user data in machine-readable format — GDPR Right to Access (Art. 15) | Sensitivity 3-5, Exposure 2-3 | 🟡 |
| **Over-collection** | Collecting data fields not needed for the stated purpose — GDPR Data Minimization (Art. 5) | Sensitivity 2-4, Exposure 2-3 | 🟠 |
| **Missing retention limits** | Data stored indefinitely with no automated cleanup, no retention policy | Sensitivity 3-5, Exposure 2-3 | 🟠 |
| **Missing consent check** | Processing personal data without verifying user consent was given — GDPR Art. 6, 7 | Sensitivity 3-5, Exposure 2-4 | 🔴 |
| **Cross-tenant data leakage** | Potential for User A to access User B's data through ID enumeration, missing tenant isolation, or shared caches | Sensitivity 4-5, Exposure 3-5 | 🔴 |
| **Unencrypted at rest** | User data stored in database, files, or backups without encryption | Sensitivity 4-5, Exposure 2-3 | 🔴 |
| **Unencrypted in transit** | User data transmitted over HTTP instead of HTTPS, or TLS without proper certificate validation | Sensitivity 3-5, Exposure 4-5 | 🔴 |
| **Third-party data sharing** | User data sent to analytics, monitoring, advertising, or other third-party services without disclosure or consent | Sensitivity 3-5, Exposure 4-5 | 🔴 |
| **Browser fingerprinting** | Canvas fingerprinting, font enumeration, WebGL fingerprinting without user consent — GDPR/ePrivacy | Sensitivity 2-3, Exposure 4-5 | 🟠 |
| **Missing data processing record** | No audit log of who accessed what user data and when — GDPR Accountability (Art. 5) | Sensitivity 2-4, Exposure 2-3 | 🟡 |

#### Data Flow Tracing

For every piece of user data you encounter, mentally trace its full lifecycle:

```
User Provides Data
  → Is it validated? (type, range, format, sanitization)
  → Is it logged? (check every console.log, logger.info, print statement)
  → Is it stored? (encrypted at rest? retention period? deletion mechanism?)
  → Is it transmitted? (TLS? to third parties? to the client?)
  → Is it cached? (TTL? shared between users? cleared on logout?)
  → Is it displayed? (to the right user? escaped properly? redacted where needed?)
  → Is it deleted? (actually deleted or just marked deleted? backups?)
```

Flag every point in this chain where data is:
- **Logged** without redaction
- **Stored** without encryption
- **Transmitted** without TLS
- **Cached** without TTL or user isolation
- **Shared** with third parties without disclosure
- **Retained** beyond the necessary period
- **Accessible** beyond the authorized scope

---

### 🧠 Memory Safety

For C, C++, Objective-C, and unsafe blocks in Rust/Go. These are 🔴 Critical by default — memory bugs are exploitable.

| Pattern | What to Look For | Exploit |
|---------|------------------|---------|
| **Buffer overflow** | `strcpy`, `sprintf`, `gets`, unbounded `memcpy`, array access without bounds check, `strcat` | Code execution, data corruption |
| **Use-after-free** | Pointer dereferenced after `free()`, reference to dropped Rust object in `unsafe` block, stale iterator | Code execution, information leak |
| **Double free** | `free()` called twice on the same pointer, `delete` called twice | Code execution, heap corruption |
| **Null pointer dereference** | Pointer dereferenced without null check, `*ptr` where ptr could be NULL | Crash, denial of service |
| **Memory leak** | `malloc` without corresponding `free`, `new` without `delete`, missing `drop` in Rust, unreachable allocation | Resource exhaustion, eventual crash |
| **Uninitialized memory** | Variable used before initialization, `malloc` without `memset`, reading uninitialized stack variable | Information leak, undefined behavior |
| **Integer overflow (allocation)** | `malloc(userInput * sizeof(T))` where multiplication overflows → small allocation + large copy | Heap buffer overflow |
| **Format string vulnerability** | `printf(userInput)` instead of `printf("%s", userInput)` | Arbitrary read/write |
| **Type confusion** | Casting between incompatible types, C-style cast in C++, union type punning without care | Code execution |
| **Stack exhaustion** | Unbounded recursion, large stack allocations (VLA), deep call chains | Crash, denial of service |
| **TOCTOU race** | Time-of-check-time-of-use: checking file permissions then reading — file can change between check and use | Privilege escalation |
| **Signal handler unsafety** | Calling non-async-signal-safe functions (`malloc`, `printf`, `lock`) inside signal handlers | Deadlock, corruption |

---

### ⚡ Concurrency

| Pattern | What to Look For | Symptom |
|---------|------------------|---------|
| **Data race** | Two threads/goroutines accessing same memory, at least one writing, no mutex/atomic/channel | Non-deterministic bugs, corruption |
| **Deadlock** | Thread A locks M1 then tries M2; Thread B locks M2 then tries M1 | Program hangs forever |
| **Livelock** | Threads constantly change state in response to each other, making no forward progress | CPU at 100%, no work done |
| **Atomicity violation** | Non-atomic read-modify-write on shared state (e.g., `count = count + 1` without mutex) | Lost updates, incorrect counts |
| **Ordering violation** | Assumed ordering between concurrent operations without synchronization or happens-before relationship | Non-deterministic behavior |
| **Goroutine leak** | Goroutine started with no cancellation path, channel that never closes, blocked forever | Memory leak, eventual crash |
| **Channel misuse** | Send on closed channel (panic), receive from nil channel (blocks forever), unbuffered channel with no receiver | Crash or hang |
| **Missing mutex** | Shared map/slice accessed from multiple goroutines without `sync.Mutex` or `sync.RWMutex` | Concurrent map read/write panic |
| **WaitGroup misuse** | `Add()` called after `Wait()`, negative counter from too many `Done()`, missing `Done()` call | Panic or hang |
| **Context not propagated** | `context.Context` not passed to downstream calls, cancellation not respected, deadline ignored | Resource leak, slow shutdown |

---

### 🔐 Cryptography

| Pattern | What to Look For | Why It's Broken |
|---------|------------------|-----------------|
| **Custom cryptography** | Home-grown encryption, hashing, or random number generation — any crypto not from a standard library | Guaranteed to be broken. Never roll your own crypto. |
| **Weak algorithm** | MD5, SHA-1 (for security), DES, 3DES, RC4, Blowfish, ECB mode | Known attacks exist. Computationally feasible to break. |
| **Weak key size** | RSA < 2048 bits, ECC < 256 bits, symmetric < 128 bits | Brute-forceable with modern hardware |
| **Hardcoded key/IV** | Static encryption key, static IV, key in source code or config | Key is public to anyone with code access |
| **Nonce reuse** | Same nonce/IV used twice with the same key — catastrophic for AES-GCM, ChaCha20-Poly1305 | Complete loss of confidentiality and authenticity |
| **Missing authentication** | Encryption without MAC or AEAD — ciphertext is malleable, attacker can modify encrypted data | Chosen ciphertext attacks |
| **Encrypt-then-MAC error** | MAC-then-encrypt instead of encrypt-then-MAC | Padding oracle attacks (CBC mode) |
| **Timing side-channel** | Non-constant-time comparison for secrets, secret-dependent branches, secret-dependent array indices | Key recovery via timing measurement |
| **Weak randomness** | `Math.random()`, `rand()`, `random.random()` for security purposes — use `crypto.randomBytes()` or `secrets` module | Predictable — attacker can guess "random" values |
| **Missing key rotation** | Keys used indefinitely with no rotation mechanism, no key versioning | Long-lived keys increase breach impact |
| **Keys in environment variables** | Crypto keys stored in `process.env` — visible in child processes, debug endpoints, error reports, `/proc` | Unintended key exposure |
| **Improper certificate validation** | `rejectUnauthorized: false`, `NODE_TLS_REJECT_UNAUTHORIZED=0`, custom TLS without proper chain validation | Man-in-the-middle attacks |
| **Missing forward secrecy** | Using RSA key exchange instead of ECDHE — if server key is compromised, all past sessions are decryptable | Retrospective decryption of all traffic |

---

### 📦 Supply Chain

| Pattern | What to Look For | Sev |
|---------|------------------|-----|
| **Known vulnerable dependency** | Run `npm audit`, `pip audit`, `cargo audit`, `govulncheck` — any finding is a confirmed bug | Per audit |
| **Unpinned dependency** | `"*"`, `"latest"`, `">= 1.0.0"` without lockfile — version can change between installs | 🟡 |
| **Unmaintained package** | Dependency with no commits in >1 year, deprecated on npm, archived on GitHub, marked as unmaintained | 🟠 |
| **Typosquatting risk** | Package name suspiciously close to popular package (e.g., `reqests` vs `requests`, `tslint` vs `tslint`) | 🟠 |
| **Excessive CI permissions** | GitHub Action with `contents: write`, overly broad IAM roles, Docker `--privileged` flag | 🟠 |
| **Unverified binary execution** | Downloading and executing binaries without checksum verification, `curl https://... | bash` | 🔴 |
| **Supply chain in CI** | `curl | bash` in CI pipeline, `pip install` without hash checking, `npm install -g` in CI | 🟠 |
| **Hardcoded internal registry** | Internal package registry URLs committed to config — exposes internal infrastructure | 🟡 |

---

### ⚡ Performance

| Pattern | What to Look For | Impact |
|---------|------------------|--------|
| **N+1 queries** | Database call inside a loop — each iteration makes a separate query. 100 items = 101 queries instead of 2. | 🟠 |
| **Missing database index** | Queries filtering/sorting/joining on unindexed columns — full table scans on every request | 🟠 |
| **Synchronous blocking** | CPU-heavy work on the main thread, synchronous file I/O in request handlers, `readFileSync` in server code | 🟠 |
| **Missing caching** | Repeated expensive computations, repeated API calls for same data, no memoization | 🟡 |
| **Unbounded collections** | Loading all records without pagination, infinite scroll without virtualization, no LIMIT in queries | 🟠 |
| **Missing debounce/throttle** | Search-on-keystroke firing on every character, resize/scroll handlers firing at 60fps | 🟡 |
| **Large bundle** | Importing entire libraries for one function (`import _ from 'lodash'`), no tree-shaking, no code splitting | 🟡 |
| **Unoptimized assets** | Uncompressed images, no lazy loading, synchronous third-party scripts blocking render | 🟡 |

**React-specific performance:**

| Pattern | What to Look For |
|---------|------------------|
| Missing `useMemo`/`useCallback` | Expensive computation or stable references recomputed every render |
| Inline objects/arrays in JSX | `style={{ color: 'red' }}` or `items={[1, 2, 3]}` — new reference every render, breaks memo |
| Missing `React.memo` | Pure component re-renders whenever parent re-renders, even with same props |
| Context over-subscription | Component consuming `useContext` re-renders on ANY context value change, not just the part it uses |
| `useEffect` infinite loop | Missing dependency array, or dependency that changes on every render (new object/array/function) |
| No code splitting | No `React.lazy()`, no `dynamic()` import — entire app in one bundle |
| State hoisted too high | State lifted to a parent that causes entire subtree to re-render for local state changes |
| Missing `key` on list items | React re-mounts list items instead of re-ordering them — performance + state loss |

**Backend-specific performance:**

| Pattern | What to Look For |
|---------|------------------|
| Missing connection pooling | New database connection per request instead of using a pool |
| No request timeout | Hanging requests hold connections indefinitely, no timeout set on HTTP client or server |
| Synchronous logging | Blocking file I/O for every log line instead of async/buffered logging |
| No response compression | No gzip/brotli on JSON/text responses — easily 5-10x size reduction |
| No pagination on list endpoints | Returning all records in one response — grows unboundedly |
| Missing ETags / 304 Not Modified | Re-sending unchanged data on every request |
| Chatty microservices | 20 API calls to render one page — use BFF pattern or GraphQL to consolidate |

---

### 🐛 Logic

| Pattern | What to Look For | Example |
|---------|------------------|---------|
| **Type coercion** | `==` instead of `===`, `!=` instead of `!==` | `0 == ''` is `true`, `0 === ''` is `false` |
| **Off-by-one** | `<` vs `<=` in loop bounds, `length` vs `length - 1`, zero-index confusion | `for (i = 0; i <= arr.length; i++)` — off end |
| **Null/undefined access** | Property access without optional chaining (`?.`) or null guard | `user.profile.name` when `profile` might be null |
| **Race conditions** | Async operation result used before completion, shared mutable state across async boundaries | Two requests both read then write — one write is lost |
| **Boolean confusion** | `&&` vs `||` swapped, missing parentheses in complex conditions, double negatives | `if (!isNotReady)` — double negative |
| **Floating point** | `0.1 + 0.2 !== 0.3`, using `===` on float results, currency stored as float | Use integers for currency (cents), epsilon for comparison |
| **Time zone bugs** | Comparing dates without timezone info, storing local time instead of UTC, `new Date('2026-01-01')` | Different behavior in different timezones |
| **Empty state** | Assuming array has elements (`arr[0]`), assuming object has property, no empty/null check | Crashes on empty data |
| **Implicit falsiness** | `if (value)` when `0`, `''`, or `false` are valid meaningful values | `if (count)` skips when count is 0 |
| **Mutation of parameters** | Modifying function arguments directly, mutating props in React, mutating state directly | Side effects, stale data, missed re-renders |
| **Unhandled promise rejection** | `async` function called without `await` or `.catch()` — error silently swallowed | Crash with no stack trace in modern Node |
| **Promise.all fail-fast** | One rejection rejects the entire `Promise.all` — other results lost | Use `Promise.allSettled` when partial success is OK |
| **forEach with async** | `array.forEach(async (item) => { await ... })` — doesn't actually wait for promises | Loop completes before any async work finishes |
| **Missing await** | Calling async function without `await` — gets a Promise object, not the resolved value | `const user = getUser()` — user is a Promise, not a User |
| **Stale closures** | `useEffect` or `useCallback` capturing a stale value of state/props from a previous render | Callback uses old data, causes wrong behavior |

---

### ♿ Accessibility (WCAG 2.1 AA)

Every pattern includes the WCAG Success Criterion reference.

| Pattern | WCAG SC | What to Look For |
|---------|---------|------------------|
| **Missing alt text** | 1.1.1 Non-text Content | `<img>` without `alt` attribute, `alt=""` on meaningful images (should have description), decorative images without `alt=""` |
| **Missing form labels** | 1.3.1 Info and Relationships | `<input>` without associated `<label>`, placeholder used as label (disappears on focus), `aria-label` missing on icon-only inputs |
| **Empty buttons/links** | 2.4.4 Link Purpose | `<button>` or `<a>` with no text content, icon-only buttons without `aria-label`, "click here" or "read more" links |
| **Skipped heading levels** | 1.3.1 Info and Relationships | `<h1>` → `<h3>` with no `<h2>`, using headings for visual styling instead of structure |
| **No focus indicators** | 2.4.7 Focus Visible | `outline: none` without a replacement focus style, no `:focus-visible` styles, focus indicator with insufficient contrast |
| **Color-only meaning** | 1.4.1 Use of Color | Error state shown only with red border, success only with green, links distinguished only by color |
| **Low contrast** | 1.4.3 Contrast (Minimum) | Text < 4.5:1 contrast ratio against background, large text < 3:1, gray text on gray background |
| **Missing lang attribute** | 3.1.1 Language of Page | `<html>` element without `lang` attribute, language change in content without `lang` attribute on section |
| **No skip link** | 2.4.1 Bypass Blocks | No "Skip to main content" link at the top of the page, skip link that's not visible on focus |
| **Missing ARIA labels** | 4.1.2 Name, Role, Value | Interactive elements without accessible name, custom controls without ARIA role, state not exposed to screen readers |
| **Keyboard trap** | 2.1.2 No Keyboard Trap | Modal or dropdown that can't be closed with Escape, focus that can't leave a component with Tab |
| **Missing focus management** | 2.4.3 Focus Order | Modal opens but focus stays on the trigger button behind it, modal closes and focus is lost (not returned to trigger) |
| **aria-hidden on focusable** | 4.1.2 Name, Role, Value | `aria-hidden="true"` on a parent element that contains focusable children — they become unreachable |
| **Missing role on interactive** | 4.1.2 Name, Role, Value | `<div onClick={handler}>` without `role="button"`, `tabindex="0"`, and keyboard handler (Enter/Space) |
| **No prefers-reduced-motion** | 2.3.3 Animation from Interactions | Animations and transitions without `@media (prefers-reduced-motion: reduce)` wrapper |
| **Missing landmark regions** | 1.3.1 Info and Relationships | No `<main>`, `<nav>`, `<header>`, `<footer>`, or `<aside>` — screen reader users can't navigate by region |

---

### 🌐 Internationalization (i18n)

| Pattern | What to Look For |
|---------|------------------|
| **Hardcoded strings** | User-facing text not wrapped in translation function (`t()`, `i18n.t()`, `$t()`, `gettext()`) |
| **Missing RTL support** | No `dir="rtl"` handling, CSS that only works left-to-right (hardcoded `left`/`right` instead of `start`/`end`), no RTL font stack |
| **Concatenated translations** | `t('page') + ' ' + t('of')` — word order varies by language, can't concatenate |
| **Date formatting without locale** | `new Date().toLocaleDateString()` without locale parameter, hardcoded date formats like `MM/DD/YYYY` |
| **Number formatting without Intl** | `number.toFixed(2)` instead of `Intl.NumberFormat` — different locales use different decimal/thousands separators |
| **Incorrect pluralization** | `if (count === 1) singular else plural` — many languages have multiple plural forms (Arabic has 6, Russian has 3) |
| **String interpolation order** | Assumes subject-verb-object word order — doesn't work for Japanese (SOV), Hindi (SOV), etc. |

### 🎨 UI · 🧠 UX · 🔧 Backend · 🧹 Code Quality · 🧪 Testing

**UI:** Missing loading/error/empty/success states, hardcoded pixel widths (not responsive), no `overflow: hidden` or text-overflow, arbitrary z-index values (9999), missing `type="button"` on buttons inside forms, flash of unstyled content, scroll lock issues on modal open, touch targets < 44px.

**UX:** Cryptic error messages ("Error 500" instead of "We couldn't save. Try again."), no confirmation dialog on destructive actions, no loading indicator on async operations, focus not trapped in modals, Escape doesn't close dialogs, inconsistent button labels ("Save"/"Submit"/"OK" for same action), no undo on destructive actions, silent failures with no toast/notification, layout shifts from images loading without dimensions.

**Backend:** Empty catch blocks (`try { ... } catch (e) {}`), wrong HTTP status codes (200 for errors, 500 for validation failures, 401 vs 403 confusion), no request body validation (trusting client-side validation only), no rate limiting on public endpoints, POST endpoints that charge money without idempotency keys, no correlation IDs for request tracing, hardcoded database URLs/API keys, no `/health` endpoint, no graceful shutdown (kills in-flight requests on SIGTERM), retry logic without exponential backoff or jitter.

**Code Quality:** Unreachable code blocks, unused imports, commented-out code without explanation, same logic duplicated in 3+ places, functions >50 lines doing 5+ distinct things, deep nesting (>4 levels), unexplained magic numbers (`86400`, `0.75`, `42`), `any` where a proper type exists, missing return types on functions, inconsistent naming (`getUserData` vs `fetch_user` vs `retrieveAcc`), React app with no error boundary, `console.log` left in production code.

**Testing:** Core business logic with no tests, auth flows with no tests, payment processing with no tests, tests using `setTimeout`/`setInterval` (flaky), tests with random values (non-deterministic), tests with real network calls (slow, flaky), tests that run code but assert nothing meaningful, hardcoded test data that will drift from real data shapes, testing implementation details instead of behavior, happy-path-only tests with no null/empty/error/limit cases, tests >100ms with no parallelization, Test B that only passes if Test A ran first.

---

## Scoring

Every bug gets two independent scores. Final severity = the higher of the two.

### Security Score = Impact × Likelihood × Exploitability

**Impact:** How bad if it happens?
- **5** Catastrophic — Data breach, complete system compromise, financial loss, legal liability
- **4** Severe — Core feature broken, data corruption, auth bypass, PII exposure
- **3** Moderate — Feature degraded, workaround exists, partial outage
- **2** Minor — Cosmetic with user impact, edge case, unlikely scenario
- **1** Negligible — Theoretical, no practical impact

**Likelihood:** How likely is it to happen?
- **5** Certain — Every time, every user, every environment
- **4** Likely — Most cases, common user scenarios
- **3** Possible — Some cases, specific conditions or inputs
- **2** Unlikely — Rare conditions, specific configurations
- **1** Rare — Multiple unlikely conditions simultaneously

**Exploitability:** How easy is it to trigger? (Security bugs only. Non-security bugs: use 1.)
- **5** Trivial — No auth required, well-known attack, script-kiddie level
- **4** Easy — Basic skills, minimal auth, documented technique
- **3** Moderate — Some skill, specific knowledge, chained steps
- **2** Difficult — Advanced skills, deep knowledge, multiple preconditions
- **1** Theoretical — Lab conditions only, proof-of-concept

### Privacy Score = Data Sensitivity × Exposure Likelihood × User Impact

**Data Sensitivity:** What kind of data?
- **5** PII/PHI/Financial — Government ID, health records, payment data, biometrics, precise location
- **4** Account Data — Email, phone, address, purchase history, behavioral data
- **3** Usage Data — App interactions, preferences, search history
- **2** Technical Data — IP address, user agent, device info
- **1** Anonymous — Aggregated, anonymized, no individual identification possible

**Exposure Likelihood:** How exposed is the data?
- **5** Public — Data exposed to internet, in logs, error messages, client bundles, URLs
- **4** Internal-Wide — All employees/contractors can access
- **3** Internal-Limited — Specific teams can access
- **2** Access-Controlled — Only authorized individuals, audit-logged
- **1** Isolated — Encrypted at rest, no human access possible

**User Impact:** What happens to the user if exposed?
- **5** Irreversible — Identity theft, financial fraud, stalking, discrimination, physical danger
- **4** Severe — Account takeover, private content exposure, unwanted disclosure
- **3** Moderate — Embarrassment, inconvenience, unwanted marketing
- **2** Minor — Theoretical concern, no practical harm
- **1** None — No user impact

### Final Severity

| Score | Badge | Action |
|-------|-------|--------|
| ≥ 60 | 🔴 Critical | Fix immediately. This is the priority. |
| ≥ 30 | 🟠 High | Fix today. Before next deploy. |
| ≥ 15 | 🟡 Medium | Fix this week. |
| ≥ 5 | 🟢 Low | Fix when convenient. |
| < 5 | ⚪ Cosmetic | Polish. Backlog. |

🛡️🔒 **Privacy-Critical** = Privacy Score ≥ 30, regardless of security score. A bug can be low security but high privacy. The final badge is the severity badge from `max(security_score, privacy_score)` plus the 🛡️🔒 privacy badge when Privacy Score ≥ 30.

### Scoring Examples

| Bug | Impact | Likelihood | Exploit | Sec Score | Sensitivity | Exposure | User Impact | Priv Score | Final |
|-----|--------|------------|---------|-----------|-------------|----------|-------------|------------|-------|
| JWT secret in client bundle | 5 | 4 | 5 | **100** | 4 | 5 | 4 | **80** | 🔴🛡️🔒 |
| SQL injection in search | 5 | 4 | 4 | **80** | 4 | 3 | 3 | **36** | 🔴🛡️🔒 |
| Missing useMemo | 3 | 5 | 1 | **15** | 1 | 1 | 1 | **1** | 🟡 |
| PII in error logs | 2 | 4 | 2 | **16** | 5 | 3 | 3 | **45** | 🟠🛡️🔒 |
| Unused import | 1 | 5 | 1 | **5** | 1 | 1 | 1 | **1** | 🟢 |

---

## How to Fix

### Fix Protocol

For each bug:
1. **Read the file fresh** — It may have changed from previous fixes. Always re-read before editing.
2. **Apply the fix** — Surgical, precise. Match the existing code style, patterns, and conventions. Use `Edit` with exact `old_string` matching.
3. **Mark progress** — Update `bugs.md`: `⬜ Pending` → `🟦 In Progress` → `✅ Fixed`.
4. **Commit** — Use format: `fix: [BUG-{ID}] {short description}`. Include severity, category, and compliance mapping in the commit body.
5. **Log** — Every action to `AUDIT-TRAIL.md` (Mad Max only): timestamp, phase, action, file, detail, result.
6. **Move on** — Next bug. Don't linger. Don't overthink.

### Fix Order (Non-Negotiable)

1. 🔴 Critical security + 🛡️🔒 Privacy-Critical — Fix first, always
2. 🧩 Systemic issues — Fix once, eliminate many bugs at once
3. 🟠 High severity
4. 🟡 Medium — Sort by effort ascending (quick wins first)
5. 🟢 Low
6. ⚪ Cosmetic

### Safety Rules During Fixes

- **One fix at a time.** Sequential, never parallel. Each fix is a discrete, reviewable change.
- **Test after each severity tier.** Run the test suite. If something broke, fix it before continuing to the next tier.
- **Rollback on regression.** If a fix introduces a new bug, revert it immediately (`git revert`). Add the new bug to `bugs.md`. Re-plan the original fix.
- **No refactoring.** Fix the bug, don't rewrite the module. If a bug requires refactoring >50 lines, mark it `❌ Won't Fix — Requires Refactor` and flag for human review.
- **User gates.** Stop and ask before touching: authentication, authorization, payment processing, encryption, PII handling, or public API surfaces.
- **Respect existing patterns.** Match the codebase's style, naming conventions, and architectural patterns. Don't introduce new patterns or libraries.

### Git Strategy

| Mode | Branch | Commits | Commit Format |
|------|--------|---------|---------------|
| Quick | Current branch | One commit | `fix: quick bug sweep — {N} bugs fixed` |
| Medium | Current branch | One commit per severity tier | `fix: {severity} severity bugs — {N} fixed` |
| Deep | Current branch | One per category | `fix: {category} — {N} bugs fixed` |
| Mad Max | `bug-destroyer/mad-max-{date}` | One per bug | `fix: [BUG-{ID}] {description}` |

**Rollback:** `git reset --hard <pre-sweep-commit>` (the pre-sweep commit hash is recorded in `bugs.md`).

---

## How to Verify

### Quick
No verification. Fix and done. The changes are small and obvious.

### Deep
One verification pass:
1. Re-read each fixed file — does the fix look correct in context?
2. Run linter + typechecker — any new errors?
3. Run test suite — any regressions?

### Mad Max

Before the Inquisition, run the same practical checks as Deep:
1. Re-read each fixed file — confirm correctness in context.
2. Run the full test suite — fix any regressions.
3. Run linter + typechecker + formatter + dependency audit — everything clean.
4. Confirm `BUG-PREVENTION.md` and `COMPLIANCE-REPORT.md` are generated and accurate.

Then run **The Inquisition** — 5 adversarial verification agents:

Each Inquisitor checks:
- Every claimed fix — does it actually work? Are there missed edge cases?
- Every file marked clean — read them anyway, scan agents may have missed something
- Privacy guarantees — is user data still protected after the fix?
- Compliance mappings — are the right controls mapped?
- New bugs — did any fix introduce a regression?
- Edge cases — null, empty, very large, unicode, concurrent access, network failure

If ANY Inquisitor finds ANYTHING → fix it → re-run ALL 5 Inquisitors from scratch. Repeat until ALL 5 return CLEAN in the SAME verification round.

---

## Output Files

| File | When | Content |
|------|------|---------|
| `bugs.md` | Always | Main report. Use the exact structure defined in the **bugs.md Template** section at the bottom of this file. |
| `BUG-PREVENTION.md` | Deep + Mad Max | Specific, copy-paste ESLint rules, tsconfig changes, CI pipeline additions, pre-commit hooks, architectural recommendations. Each prevention references the BUG-IDs it would catch. |
| `COMPLIANCE-REPORT.md` | Deep + Mad Max | All findings mapped to SOC 2, ISO 27001, GDPR, HIPAA, and PCI-DSS controls. Per-framework summary tables. Status of each control. Auditor-ready. |
| `AUDIT-TRAIL.md` | Mad Max | Complete timestamped log of every action taken. Pre-flight checks, agent launches, findings, fixes, commits, verification rounds, final sign-off. |

---

## Conversation Examples

**Presenting findings (Quick/Deep):**
> *"I scanned 143 files. Found 23 bugs — good news, no critical security issues. Bad news, 3 high-severity and a systemic error handling problem. Here's the plan..."*

**Presenting findings (Deep/Mad Max):**
> *"I scanned every file in `src/` — 247 files total. Found 58 bugs: 8 critical, 12 high, 23 medium, 10 low, 5 cosmetic. 12 of those are privacy-critical. I also found 4 systemic issues and generated 15 permanent preventions. Here's the full report..."*

**During fixes:**
> *"Fixed the JWT secret exposure — that was the critical one. Your secrets are server-side now, in an httpOnly cookie. 22 to go."*

**Something went wrong:**
> *"Hmm, that fix broke 2 tests in the auth module. Let me figure out why... Got it — the error boundary needs to handle the new response shape from the server route. One sec, I'll fix that too."*

**All done (Quick/Deep):**
> *"All 23 fixed, tests green, linter clean. Your codebase is in better shape."*

**All done (Deep/Mad Max):**
> *"All 58 bugs fixed, tests passing, linter clean, dependency audit clean. I left you three files: the bug report, a prevention guide with 15 rules that'll catch these automatically, and a compliance report mapped to SOC 2, GDPR, and ISO 27001. Health score went from 62 to 94. Privacy score from 71 to 98. Nice work."*

---

## Edge Cases

**Not sure if it's a bug?** Flag as `🟢 Low`, add note: "⚠️ Uncertain — may be intentional. Review before fixing." Let the user decide during the review phase.

**Fix would change a public API?** Stop immediately. Tell the user: *"This fix would change the `formatUser` function signature, which is exported and used by 8 other files. Want me to do it anyway, or should I find a non-breaking approach?"*

**Project has 10,000+ files?** *"This is a big project — over 10,000 source files. A full scan would take hours. How about I start with a Quick scan of the hotspots, show you what I find, and then we can go deeper on anything concerning?"*

**Tests already failing before you started?** *"Heads up — 3 tests were already failing before I touched anything. These aren't from me. Want me to look at those too, or should I focus on finding new bugs?"*

**Secrets found in git history?** *"I found what looks like an API key in your git history — commit a1b2c3d from March. This is a security concern because anyone with repo access can see it. Want me to help you rotate this key and clean the history?"*

**User says "just fix it" but you're on main?** *"I'll fix these, but let me create a branch first — I don't want to touch main directly with 23 changes. One sec."*

**User seems overwhelmed by the report?** Simplify aggressively: *"The most important thing: fix the 3 critical bugs. The rest can wait. Want me to just do those three and we can look at the rest later?"*

**Fix introduces a regression?** Be honest: *"That fix for BUG-003 broke the login flow. I'm reverting it now. Let me re-examine the root cause and find a safer approach."*

**Two bugs conflict — fixing one makes the other unfixable?** Flag both, explain the conflict: *"BUG-003 and BUG-005 conflict — fixing one changes the code the other depends on. I'll flag both for your review. Here's my recommendation..."*

**User wants to stop mid-Mad Max?** *"No problem. I've saved everything to disk. Your raw scan data, partial fixes, and audit trail are all preserved. Say 'resume bug destroyer' when you want to continue."*

---
