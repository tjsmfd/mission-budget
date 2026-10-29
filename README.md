# Rosewood

Personal budgeting PWA. All data is stored on the device (IndexedDB). This repo holds only the app code. It contains no financial data, so it is safe to keep public.

## Files
- `index.html`: the app
- `manifest.webmanifest`: app name, icon, colors (what makes it installable)
- `sw.js`: service worker (lets the app open offline)
- `icon-*.png`, `apple-touch-icon.png`: home screen icons

**Never upload a `mission-budget-backup-*.json` file here.** Backups hold your real data.

## Updating the app
Updates are pushed here by Claude. The app checks GitHub every time you open it or return to it, and reloads into the newest build by itself (it waits if a sheet is open). Your data is never touched.

Last updated: Oct 28, 2026 · 8:13 PM ET.

If an update doesn't show: give GitHub about a minute, then fully close and reopen the app once.

If you change the icons or the manifest, bump `VERSION` in `sw.js`. Run `./stamp.sh` before every push.

## Looks (Guide > Appearance)
- **Rosewood** (default): rose mixed with graphite. Flat tab bar, uppercase labels.
- **Pro**: peach gradients and a glass nav bar.
- **Classic**: the original Soft Night look.
All three live in `index.html`; the choice is saved on the device and never touches your data.

## Your data and updates
Data lives in the phone's IndexedDB and is never part of an update. When a new version arrives, the app also saves its own safety copy (last 3 kept, Guide > Backup & your data). Still save a file backup weekly.

## Month review
History > Month review (also offered on Today in the last days of a month and the first days of the next). Computed from the logged month, so nothing extra is stored: categories and pocket money over budget, goals short of their monthly amount, DoorDash stats (entries whose note says DoorDash), and plain notes to act on when editing the plan.

## Pocket money by week
Today shows **Safe to spend now** (the bill-protecting ceiling), **This week** (an even pace of what is left over the remaining days; weeks run Sunday to Saturday), **This month**, a **Can I afford it?** checker, and a collapsible list of the month's weeks. Logging a pocket-money expense that is over the pace or over the safe amount shows a warning in the log sheet.

## Morning paper
Guide > Morning paper. Paste the paper link from your Fuller Dispatch Apps Script and the app sends three things to your own Google Drive whenever it opens or you log something: safe to spend, bills due in the next 7 days, and next payday. Balances and transactions never leave the phone. Unlink any time.
