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

## Automatic weekly copies
The app saves a copy of your data inside itself once a week (kept for 8 weeks, separate from the update copies). Guide > Back up lists them with Restore and Save file buttons.

## Rosewood design, DoorDash log and goal dates
- Burgundy and champagne theme, soft serif numbers, rose mark, launch animation and celebratory add-money animations.
- Goals can have an exact date, a first checkpoint, and be marked "DoorDash funds this".
- Log a dash (earned, miles, hours) on Today. Gas is miles / mpg x price (Fusion mpg and gas price are editable). The net after gas counts toward the goal, and the card says how much to earn or how many hours to dash. If you fall behind, it offers to move the gap from pocket money, only with your OK.

Last updated: Nov 7, 2026 · 12:19 PM ET.

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

## Cash plan (Today)
- **Bills first:** a green "Bills covered" line, or a red "Bills at risk" line that says how much to add to checking and by when. It looks at checking against bills before your next payday and the next 30 days of paychecks.
- **One pocket money number:** your pace is the pocket money budget spread over the month and it grows a little every day. Pocket-flagged DoorDash money is available right away. It never goes above what checking can spare after bills.
- **Back on pace date:** if you spend past the pace, the date when the daily growth catches up is shown, and the "Can I afford it?" box gives the date a purchase will fit.
- **Three warnings:** 1 Heads-up (champagne "i", over pace, you can still spend), 2 Careful (amber "!", pocket money used up until payday, bills still covered), 3 Action needed (red, a bill is at risk). Red only ever means a bill is at risk.
- A bill can be marked "not due" for a future month (config/billskip, e.g. a car payment already paid early).

## DoorDash split and plan balance (from Nov 2026)
- Logging DoorDash income (note says DoorDash) now pre-fills pocket money with **70%** when your bills are covered and your goals are on track, otherwise **40%**. The rest goes to goals and your buffer. October dates still count all of it. Tap All, None or the percent chip to change it.
- Plan has an "Expected DoorDash per month" box. 60% of it counts toward goals, so Left to assign can reach $0 without paychecks covering every goal dollar.

## Bills post themselves (Plan has a switch)
On the due day of each bill and subscription (and any day after, if you didn't open the app), the app adds it to History, which takes it out of your checking estimate. It skips anything you already logged, any bill marked "not due" for the month, and nothing before the start of the month it was turned on. Tap an entry in History to fix the amount if your bank charged something different.

## Moving savings to checking
Today → Accounts → **Move money** (or Goals → a goal → **Take money out**) moves money out of a savings goal. By default it lands in your checking: checking goes up, savings and the goal go down, and it shows in History. Choose "Spent from savings" if you paid for something straight from savings (checking doesn't change).

## Today, three questions (Nov 2026)
Today now shows one big pocket-money number with a short status chip (On pace / Over pace / Pocket money used up / Bill at risk), a tappable "Bills covered" row, Accounts, and three shortcuts (Can I afford it?, DoorDash, Paychecks). Tap the number for pace per day/week/month, a 7-day spending chart and Can I afford it. Everything else (DoorDash, paychecks, categories) lives under "Budget details". Tapping a History purchase opens a read-only details sheet; Edit and Delete are behind the ••• button.

## Live bank balances (Nov 2026)
Plan -> Bank: enter the bridge address and passphrase. Rosewood then reads checking (available balance) and savings from the bank through the Cloudflare Worker bridge (Plaid, read-only), on app open and every time you return to the app. In bank mode, entries logged in Rosewood no longer adjust the balance estimate, because the bank is the source of truth. The passphrase is stored only on the phone (localStorage), never in the backup or the repo. Turn off in Plan -> Bank.

## Auto-logging bank activity (Nov 2026)
After each balance sync Rosewood reads new bank activity from today onward (cursor and rules in config/bankTx). Purchases are categorized (remembered merchant rule, bill amount match, every gas station charge = Gas, food = Pocket money), deposits go to the matching paycheck source or DoorDash (with the 70/40 pocket share), checking/savings transfers become a savings-goal move on Emergency Fund (not spending). Entries you already logged by hand, or bills Rosewood auto-posted, are matched instead of duplicated. Pending charges are updated when they post and removed if they disappear. Everything lands in the "New from bank" box on Today: change the category (it remembers the merchant), OK, or Undo.

## Goals vs savings, pocket display, Emergency Fund (Nov 2026)
Goals tab: when goals add up to more than the savings account, "Fix goal balances" lets you remove the difference from the goal(s) you spent from (no real money moves); when savings exceed goals, "Assign it". Pocket money rows and the pace sheet now show the $400 budget separately from DoorDash/pocket income ("$X of $400 budget + $Y DoorDash"); only the budget sets the pace. A one-time migration raised Emergency Fund monthly from $102 to $105 (config/migr).
