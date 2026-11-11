# Rosewood (repo: mission-budget)

Personal budgeting PWA for one user, installed on an iPhone and served from GitHub Pages at https://tjsmfd.github.io/mission-budget/ (pushes to `main` go live). The whole app is `index.html` (plain HTML/CSS/JS, no build step), plus `sw.js`, `manifest.webmanifest` and the icon PNGs. All user data lives on the phone in IndexedDB; the repo holds code only.

## Project rules
- **No implementing until the user says "proceed".** Ideas, options and plans come first.
- **Show, don't describe.** When the user asks for ideas or options (names, UI, features), show a visual concept (artifact/mockup), not just text.
- **Never lose data.** Every change must carry over everything already entered. Schema changes need a one-time migration (see the existing `config/migr` pattern); never drop or rename stored fields without migrating them.
- **Updates must arrive on their own.** Opening the app should show the newest push via the auto-update check; don't break `mb-build` / `var B` or the `?check=` request.
- **Keep the backups working:** weekly in-app copies (8 kept) and the safety copy made when an update arrives.
- **Design:** premium "editorial luxury" (burgundy and champagne, soft serif numbers, rose mark), never generic or "AI generated". Keep every existing category and feature. Red / yellow / green status colors must stay distinguishable on burgundy; red only ever means a bill is at risk.
- **Secrets:** never put Plaid keys, the Worker passphrase or other credentials in the repo or in chat. The bridge passphrase lives only in the phone's localStorage.
- **Never commit real financial data** (`mission-budget-backup-*.json` or anything like it). The repo is public.
- Keep `README.md` current when a feature changes; it is the user-facing changelog.

## Before every push
1. Run `./stamp.sh` in the repo root. It writes a new build number into `index.html` (`<meta name="mb-build">` and `var B=`) and the "Last updated" line in `README.md`. Open copies of the app compare that number to decide to reload, so a push without a stamp will not reach the phone.
   - Note: `stamp.sh` uses GNU `sed -i` syntax. macOS `/usr/bin/sed` needs `sed -i ''`, so on this Mac it fails as written. Use GNU sed (`gsed`) or fix the script before relying on it; confirm both values changed after running.
2. If icons or `manifest.webmanifest` changed, bump `VERSION` in `sw.js` (currently `mb-v9` → `mb-v10`, etc.) so the service worker drops its old cache. Code-only changes to `index.html` don't need a bump (the page is fetched network-first).

## handoff/ is never committed
`handoff/` holds the migration notes and full chat history from claude.ai (personal and financial details). It is in `.gitignore` and must stay out of git: never `git add` it, never force-add it, never copy its contents into tracked files. Read it for context only.

## Related
- `tjsmfd/twice-a-week` (titled "S ≠ L"): the user's other app, the look and feature reference for a planned port.
- Bank: Navy Federal via Plaid through a Cloudflare Worker bridge (read-only). The Worker code is not in this repo.
