# Mission Budget

Personal budgeting PWA. All data is stored on the device (IndexedDB). This repo holds only the app code. It contains no financial data, so it is safe to keep public.

## Files
- `index.html`: the app
- `manifest.webmanifest`: app name, icon, colors (what makes it installable)
- `sw.js`: service worker (lets the app open offline)
- `icons/`: home screen icons

**Never upload a `mission-budget-backup-*.json` file here.** Backups hold your real data.

## Updating the app later
1. Replace `index.html` in the repo with the new version (Add file → Upload files → Commit).
2. Wait about 1 minute for GitHub Pages to redeploy.
3. Open the app on your phone while online, close it, and open it again. The new version loads, and your data stays.

If you change the icons or the manifest, also change `VERSION` in `sw.js` (e.g. `mb-v1` → `mb-v2`).
