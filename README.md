# Mission Budget

Personal budgeting PWA. All data is stored on the device (IndexedDB). This repo holds only the app code. It contains no financial data, so it is safe to keep public.

## Files
- `index.html`: the app
- `manifest.webmanifest`: app name, icon, colors (what makes it installable)
- `sw.js`: service worker (lets the app open offline)
- `icon-*.png`, `apple-touch-icon.png`: home screen icons

**Never upload a `mission-budget-backup-*.json` file here.** Backups hold your real data.

## Updating the app
Updates are pushed here by Claude. The app checks GitHub every time you open it or return to it, and reloads into the newest build by itself (it waits if a sheet is open). Your data is never touched.

Last updated: Oct 18, 2026 · 4:04 PM ET.

If an update doesn't show: give GitHub about a minute, then fully close and reopen the app once.

If you change the icons or the manifest, bump `VERSION` in `sw.js`. Run `./stamp.sh` before every push.
