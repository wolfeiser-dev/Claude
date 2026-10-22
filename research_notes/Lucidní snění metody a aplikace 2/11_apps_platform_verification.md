# Verification of LD app market data and mobile platform constraints (as of 22 Oct 2026)

Method note (applies to all sections). The data was retrieved on 2026-10-22 and raw files are saved under `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/dl_apps/`.
- **App Store:** the iTunes Lookup/Search API (`itunes.apple.com/lookup?id=…&country=us|cz|de`), which worked, plus full `apps.apple.com/{cc}/app/id…` pages, which return 200 once redirects are followed. These gave in-app purchase (IAP) lists in USD, CZK and EUR.
  - App Store ratings are **per storefront**. All counts below are the US storefront unless marked. The store shows no global total, so figures like the vendor's "~7,075" cannot be checked.
- **Google Play:** detail pages (`hl=en&gl=US`). The page embeds the exact install count, e.g. `["10,000+",10000,32527]`. The exact figure is given in parentheses.
  - Play did not show local-currency IAP ranges for gl=CZ/DE from this proxy, so EUR/CZK prices come from the App Store only.
  - A Play star value is quoted only when Play also shows a review count. Without a count, the parsed star value may belong to another app on the page.
- **Reddit:** fetched via the arctic-shift API (`arctic-shift.photon-reddit.com/api/posts/search` and `/api/comments/search`), which worked with pauses. reddit.com, old.reddit, api.reddit, pullpush (429) and redlib mirrors were blocked.
- **Forums:** LD4all via Discourse JSON worked. DreamViews returned a Cloudflare challenge. web.archive.org reset the connection both via curl and via WebFetch. appbrain, apkpure, alternativeto, appfigures and producthunt returned 403.

## Q1. Do the app comparison figures in the report hold up? (verification log + updated table)

### Takeaway
About half of the report's app rows need corrections. Many prices and dates were stale search snippets.
- **Prices and listings that changed:** MILD Trainer is now free, Everdream's $19.99 is Lifetime rather than yearly, and Shape's listing text says $9.99/mo or $39.99/yr.
- **Wrong platform or no longer available:** Lucid Dreamer (guardanus) is gone from Google Play and was not found on iOS. The Paller-lab "lucid" app is no longer distributed; an MIT successor study app now exists on iOS and Android.
- **Other status changes:** Ludin had still not publicly launched on 22 Oct despite the 1 Oct date. "Somnium" (id6470462666) is now a horoscope/AI-interpretation app. "Lucidly: AI Dream Journal" dates from 2021, not 2026.
- **The iOS gap has closed in claims, not in evidence:** several iOS TLR-style apps are now live (Lucyd, Lucid Scribe iOS, LDAlarm), plus Wear OS real-time-REM apps (Lucid Wake, Lucid Dream Watch). None is independently validated.

### Cited Findings

#### A. Verification log (report claim → status)

**Oniri**
- **Rating:** the report says iOS ~4.6 (~7,075). PARTLY CONFIRMED: iOS US storefront 4.57 from 3,842 ratings; CZ 4.67 (51); DE 4.54 (109). The 7,075 figure cannot be verified. v6.1.3 was released 2026-10-17. — [App Store US](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914); [iTunes Lookup](https://itunes.apple.com/lookup?id=968737914&country=us)
- **Price:** the report says $7.99/mo and $47.99/yr. CORRECTED/NOT FOUND: neither price appears in the current IAP list.
  - US IAP list: "Oniri Premium" $12.99, $59.99, $29.99, $6.49; "Full version" $49.99; legacy "Monthly/Yearly Premium Subscription" $0.99/$5.99.
  - CZ: 100–949.99 Kč; Full version 1,290 Kč.
  - DE: €5.49–€59.99.
  - The Play listing range is "$12.99 – $59.99 per item". Inference: current tiers are probably ~$12.99/mo and ~$59.99/yr, but the listing does not label them.
  - Oniri's FAQ: "Pricing is shown in the app and varies by region and billing period." — [App Store US](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914); [App Store CZ](https://apps.apple.com/cz/app/id968737914); [Google Play](https://play.google.com/store/apps/details?id=io.oniri.oniriapp); [Oniri FAQ](https://www.oniri.io/faq)
- **Android:** the report says ~3.5 (10k+), low confidence. CONFIRMED and sharpened: 3.66★ from 641 reviews, 10K+ installs (32,527). The Play listing dates from 2022-11-30 and was updated 2026-10-16. The "rebuilt mid-2026" claim could not be verified. — [Google Play](https://play.google.com/store/apps/details?id=io.oniri.oniriapp)
- **Night cues:** CONFIRMED. Both listings: "Night cues and alarms to hear in your dreams". Details are in Q4. — [App Store](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914)

**Lucidity (Christopher Benz)**
- **Android:** the report says 4.83 (~7.6K), ~420K installs. CONFIRMED and updated: 4.81★ from 8.19K reviews, 100K+ installs (419,931). Updated 2026-10-05; contains ads; IAP $4.99–$134.99. — [Google Play](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity)
- **iOS:** the report says Pro $4.99/wk, $12.99/mo, $49.99/yr, $119.99 lifetime, rating 4.6 (11). CONFIRMED and expanded.
  - The listing is now named "Lucidity: Dream Interpretation" (id6505020545), v1.4.2 (2026-10-19), iOS 17+, 4.69 from 13 ratings.
  - IAP also includes Annual $59.99, Yearly $48.00, Lifetime $89.99 and an affiliate yearly $42.99.
  - CZ: weekly 129 Kč, monthly 349 Kč, yearly 1,290–1,490 Kč, lifetime 2,490–2,990 Kč.
  - DE: €5.99/wk, €14.99/mo, €49–69.99/yr, €99.99–129.99 lifetime.
  - Source: [App Store US](https://apps.apple.com/us/app/lucidity-dream-interpretation/id6505020545)
- **No night cues:** CONFIRMED. Neither listing mentions night cues. Features are AI interpretation, journal, MILD/WILD/SSILD/WBTB practice screens, reality-check (RC) reminders and totems. — [App Store](https://apps.apple.com/us/app/lucidity-dream-interpretation/id6505020545); [Google Play](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity)

**Shape (Timeless LLC)**
- **Price:** the report says $19.99/mo, $79.99/yr (formerly $9.99/$39.99). CORRECTED.
  - The listing text says: "After a 7-day trial, Shape costs $39.99 per year or $9.99 per month."
  - The IAP list does include $19.99, $49.99, $59.99, $79.99 and $99.99 "Shape" items, possibly regional, test or legacy tiers.
  - CZ IAP: 249–2,990 Kč. DE: €9.99/mo, €29.99–119.99.
  - Source: [App Store US](https://apps.apple.com/us/app/shape-lucid-dreaming/id1577026266)
- **Rating, platform, status:** CONFIRMED. 4.70 from 1,730 ratings (US), iOS 17+, iOS-only, active (v3.37, 2026-10-18). Reads and writes Apple Health sleep data "for the purposes of understanding sleep cycles and identifying dreamtime"; "Know when you're dreaming and use these insights to set a wake-back-to-bed (WBTB) alarm". — [App Store](https://apps.apple.com/us/app/shape-lucid-dreaming/id1577026266)

**Awoken (Andreas Rudolph)**
- **Stats:** the report says 4.42 (~21K), 1M+. CONFIRMED and updated: 4.39★ from 22.3K reviews, 1M+ installs (1,046,096), contains ads. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)
- **Last update:** the report says August 2024. CORRECTED: Play shows "Updated on Jul 12, 2024". It is still stale. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)
- **Price:** the report says $4.99 one-time. CORRECTED: the Play IAP range is $0.99–$2.49 per item. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)
- **Totem cue:** CONFIRMED. "Dream Clues: low audio cues that can trigger your lucid dreaming by playing a special Totem Sound you choose." — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)

**Dream Journal Ultimate**
- **iOS:** the report says 4.47 (565). CONFIRMED. Version CORRECTED: the current version is 2026.10.12 (2026-10-13), not 2026.2.24. The only IAP is "Support Dream Journal Ultimate" $2.99 (79 Kč / €2.99). — [App Store](https://apps.apple.com/us/app/dream-journal-ultimate/id802558054)
- **Android:** the report says 4.3 (1,103). CONFIRMED: 4.28★ from 1.15K reviews, 100K+ installs (102,896), updated 2026-09-28, IAP $2.99. — [Google Play](https://play.google.com/store/apps/details?id=dreamcapsule.com.dl.dreamjournalultimate)
- **Features:** the listing adds AI interpretation and visualization, a "Lucid Dreaming Academy" (Reality Testing, MILD, WBTB, SSILD, FILD) and RC alarms. — [App Store](https://apps.apple.com/us/app/dream-journal-ultimate/id802558054)

**Lucid Dreamer (guardanus)**
- **Platforms:** the report says iOS + Android, Pro ~$6.99, probably stale. CORRECTED: not on Google Play (the detail page `id=guardanus.dreamer` returns HTTP 404) and not found in iTunes Search for "lucid dreamer". Treat it as delisted from the major stores. — [Google Play (404)](https://play.google.com/store/apps/details?id=guardanus.dreamer); [iTunes Search](https://itunes.apple.com/search?term=lucid+dreamer&entity=software&country=us)

**Reality Check (Oneironaut LLC)**
- **Basics:** the report says iOS 26+, free, new. CONFIRMED. Released 2025-12-22, v1.1 (2026-10-21), free with no IAP, 4.67 from 3 ratings. — [App Store](https://apps.apple.com/us/app/reality-check-lucid-dreams/id6755739747)
- **Prompt count:** the report says 50+ prompts. CORRECTED: the listing says "60+ unique prompts", "Choose 5 to 20 checks per day", quiet hours, and "checks from yesterday are linked to last night's dreams". — [App Store](https://apps.apple.com/us/app/reality-check-lucid-dreams/id6755739747)

**Sleep as Android (Urbandroid)**
- **Stats:** the report says Android + wearables, freemium. CONFIRMED: 4.56★ from 393K reviews, 10M+ installs (24,269,534), updated 2026-10-15, IAP $0.99–$75. "Enjoy 7 days premium, then keep freemium or upgrade." — [Google Play](https://play.google.com/store/apps/details?id=com.urbandroid.sleep)
- **Accuracy claim:** the report says cues fire 10/20/30 min after light phase and the vendor admits ~50% chance of hitting REM. NOT FOUND in the current docs; the page has been rewritten.
  - The current LD page claims the app identifies "REM phases with high accuracy". It describes Sensitivity, "Later" delay, Ringtone (default voice "You are dreaming"), Vibrate (wearable-only at night), Volume, Force Headphones Only and Repeat. No 50% figure or 10/20/30-minute offsets appear.
  - The vendor's sleep-theory page still says: "Any attempt to pinpoint the exact beginning of a sleep phase is subject to a high degree of error and guesswork."
  - A 2021 developer forum post concedes "false positives as we are assuming your REM phase from indirect hints rather than actually detecting REM — as for this we would need an EEG" and recommends the "Later" setting.
  - The old 50% wording could not be retrieved because Wayback was blocked.
  - Sources: [SaA docs: Lucid dreaming](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html); [SaA sleep tracking theory](https://sleep.urbandroid.org/docs/sleep/sleep_tracking_theory.html); [Urbandroid forum, petr-urbandroid 2021-06-02](https://forum.urbandroid.org/t/lucid-dreaming-sleep-as-android/4691)

**"lucid" (Paller lab, Northwestern)**
- **Availability:** the report says Android-only, free research app, package `com.neurelectrics.dive` (unverified). CORRECTED: no longer available.
  - `pallerlab.psych.northwestern.edu/dream` now serves the generic lab homepage, which describes TLR as a method but has no app link.
  - Play `id=com.neurelectrics.dive` returns 404.
  - The researcher behind it (Nathan Whitmore) now publishes a successor study app, "Lucid Dreaming Experiment", under Prof. Pattie Maes's MIT group:
    - **iOS:** id6769513728, released 2026-05-22, v1.4 (2026-06-26).
    - **Android:** `edu.mit.lucid`, released 2026-04-15, 100+ installs (377).
    - **Study design:** 8 nights, US-only, 18+, a 20-minute pre-sleep training each night, phone next to the pillow, "sounds, light, and gentle vibrations", sleep alone.
  - Sources: [Paller lab page](https://pallerlab.psych.northwestern.edu/dream); [Play 404](https://play.google.com/store/apps/details?id=com.neurelectrics.dive); [App Store](https://apps.apple.com/us/app/lucid-dreaming-experiment/id6769513728); [Google Play](https://play.google.com/store/apps/details?id=edu.mit.lucid)
- **Study results:** the study's author (u/ohsnapitsnathan) summarized the first Northwestern/MIT app study (Consciousness & Cognition 2024). "When people got training before sleep as well as reminders in sleep, they had around a 10–15% chance of having a lucid dream on each night." An unfamiliar sound non-significantly produced fewer LDs than no sound. — [r/LucidDreaming, 2024-10-23](https://www.reddit.com/r/LucidDreaming/comments/1gaoayw/initial_results_from_the_northwesternmit_lucid/)

**Lucidly (5Path LLC)**
- **Basics:** the report says iOS + Apple Watch required, $5.99/mo, $39.99/yr. CONFIRMED.
  - IAP: Monthly $5.99 / Annual $39.99 (CZ 159 / 1,090 Kč; DE €5.99 / €42.99), "All plans include a FREE 7-day trial".
  - Rating 3.16 from 19 ratings.
  - The listing claims "Real time REM prediction", "overall accuracy > 80%" and "REM inference is an approximation". Integrates with HealthKit.
  - Source: [App Store](https://apps.apple.com/us/app/lucidly/id1566419183)
- **Status:** the report says unclear. CLARIFIED: the last feature version is 1.15.1 (2025-03-03); the latest note says it was "updated by Apple to prepare for watchOS 27 compatibility. No new features". Treat it as maintenance-only. The 270-minute session cap was not re-verified. — [App Store](https://apps.apple.com/us/app/lucidly/id1566419183)

**Ludin**
- **Launch:** the report says launched 1 Oct 2026. CORRECTED: not publicly launched as of 2026-10-22.
  - The site still reads "Launching October 1, 2026 · Built in public" with a countdown, a free waitlist and "Get early access — $5".
  - The FAQ says "Ludin launches October 1, 2026 on both iOS and Android."
  - No Ludin app turned up in iTunes Search ("ludin" returns Ludo games) or Play search.
  - Mechanism: phone on the mattress, on-device ML on motion sensors, screen light cue.
  - Sources: [ludin.app](https://ludin.app/); [iTunes Search "ludin"](https://itunes.apple.com/search?term=ludin&entity=software&country=us)
- **Accuracy claim:** the vendor's "45%" accuracy claim was NOT VERIFIED. The "Live Test Results" page only embeds an external sheet that did not load. — [Ludin test results](https://ludin.app/test-results.html)

**Somnium**
- **Features:** the report says iOS, free + premium, RT, offline WBTB/MILD, voice journal, 100% offline. CORRECTED/NOT FOUND.
  - The only "Somnium" on the US App Store (id6470462666, Green Advex Technology) is now "Somnium: Dream Interpretation", offering an AI dream interpreter plus a "Daily Horoscope".
  - IAP: $4.99, $6.99/week, $39.99/year. Rating 4.75 (20). v1.5 (2026-01-04).
  - No RC, offline or WBTB/MILD features are described. Either the listing changed or the earlier note conflated two apps. Recommend dropping it from the LD table.
  - Source: [App Store](https://apps.apple.com/us/app/somnium-dream-interpretation/id6470462666)

**MILD Trainer (Nathan Woolmore)**
- **Price:** the report says $3.99 on iPhone. CORRECTED: now free with no IAP listed. v4.1.1 (2026-09-20), 5.0 from 1 rating. The listing adds a journal with transcription, iCloud sync and export. — [App Store](https://apps.apple.com/us/app/mild-trainer-lucid-dreaming/id1530667456)
- **Successor app:** the same developer has a newer app, "Lucidity Level" (iOS 26+, released 2026-05-18; Pro $1.99/$9.99/$19.99). The developer's Reddit account says: "I used Oniri for a long time… now I use Lucidity Level (obviously bias as I made it)". — [App Store](https://apps.apple.com/us/app/lucidity-level-lucid-dreaming/id6763508712); [Reddit comment](https://www.reddit.com/r/LucidDreaming/comments/1vhi72j/_/p26cskn/)

**Lucid Now / Lucid Scribe**
- **Lucid Now (Adam Tardy):** the report says iOS, free + IAP, new, no validation. PARTLY CONFIRMED.
  - Premium Monthly is $3.99 (99 Kč / €3.99).
  - v1.1.4 was released 2025-03-31 with no update since, so it is stale, not new. Rating 5.0 from 1.
  - The listing says it "relies on Targeted Lucid Dream Reactivation technique, playing cues during your REM sleep phases" and offers "REM Phase Targeting – timing audio cues to your sleep cycle". No sensor is described.
  - Source: [App Store](https://apps.apple.com/us/app/lucid-now/id6739976528)
- **Lucid Scribe (lucidcode):** CORRECTED, it is not iOS-only.
  - **iOS:** released 2025-11-13, v1.4.6 (2026-10-21), free, no IAP listed, 5.0 from 2.
  - **Android:** `com.lucidcode.lucidscribe`, since 2022-05-12; 3.75★ from 26 reviews; 1K+ installs (4,961); IAP $0.99–$39.99.
  - The developer also makes the INSPEC camera; see Q4.
  - Sources: [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169); [Google Play](https://play.google.com/store/apps/details?id=com.lucidcode.lucidscribe); [lucidcode.com](https://www.lucidcode.com/)

**Everdream (Sandratra Razafindralambo)**
- **Price:** the report says iOS 15+, Pro $19.99/yr. CORRECTED: Annual $14.99, Monthly $3.99, **Lifetime $19.99** (CZ 399 / 99 / 499 Kč; DE €17.99 / €3.99 / €22.99). — [App Store](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)
- **Rating and status:** 4.2 from 54 ratings, v2.26 (2026-10-05), active. Listing: "Everdream will measure sleep stages and ring an alarm during your REM sleep that will turn off automatically". — [App Store](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)

**LucidMe (REMspace, formerly Phaser)**
- **Pricing:** the report says the app is free and the mask costs $245. CORRECTED: the app has a "Morpheus Mode" subscription, $9.99/mo and $69/yr (CZ 249 / 1,990 Kč; DE €9.99 / €79). The mask price was not re-verified. — [App Store](https://apps.apple.com/us/app/lucidme-sleep-dream-journal/id907469483)
- **Ratings:** iOS 4.43 from 14 ratings, v5.11.2 (2026-10-06). Android `com.phaser`: 3.53★ from 1.44K reviews, 100K+ installs (121,764). — [App Store](https://apps.apple.com/us/app/lucidme-sleep-dream-journal/id907469483); [Google Play](https://play.google.com/store/apps/details?id=com.phaser)

**Elsewhere**
- **Price:** the report says $4.99/mo, $49.99/yr, AI journal, no LD tools. CONFIRMED.
  - IAP also includes credit packs ($2.99–$9.99) and "Supporter" tiers ($9.99/$99.99).
  - CZ: 129 / 1,290 Kč. DE: €5.99 / €59.99.
  - Symbol interpretations by David Fontana and thematic insights by Kelly Bulkeley. 41 languages.
  - Source: [App Store](https://apps.apple.com/us/app/elsewhere-dream-journal/id6445864345)
- **Ratings:** iOS 4.94 from 108 ratings. Android `to.elsewhere`: 4.24★ from 86 reviews, 5K+ installs (6,649). — [App Store](https://apps.apple.com/us/app/elsewhere-dream-journal/id6445864345); [Google Play](https://play.google.com/store/apps/details?id=to.elsewhere)

**Dreamu**
- **Release date:** the report says new (2026), Android, levels 0–12. Levels CONFIRMED. Date CORRECTED: released 2026-05-06, not August. 10+ installs (37), IAP $4.99–$49.99, contains ads. — [Google Play](https://play.google.com/store/apps/details?id=com.casuapp.dreamu)

**Lucidly: AI Dream Journal (MindyApps)**
- **Age:** the report calls it new (2026). CORRECTED: released 2021-01-15. 3.75★ from 724 reviews, 50K+ installs (56,193), updated 2026-09-06, IAP $3.99–$34.99. Features: journal, RC reminders, sounds, binaural beats. No night cues. — [Google Play](https://play.google.com/store/apps/details?id=com.mindyapps.lucidlynew)

**WorldWithin**
- **Status:** the report says abandoned (2022). CONFIRMED: last update 2022-07-08 (v3.1.8). US 4.49 from 130; DE 4.59 from 315. — [App Store](https://apps.apple.com/us/app/worldwithin-lucid-dreaming-app/id1546635635)
- **Price:** the report says free. CORRECTED: it still sells "Lucid Plus" IAP at $6.99–$79.99. — [App Store](https://apps.apple.com/us/app/worldwithin-lucid-dreaming-app/id1546635635)

**DreamKeeper**
- **Status:** the report says abandoned (2023), free. CONFIRMED: last update 2023-11-28, 4.79 from 573, no IAP. — [App Store](https://apps.apple.com/us/app/dreamkeeper-my-dream-journal/id530958563)

**Lucidity (Shane Curtis, different iOS app)**
- **Status:** active. v3.0.4 (2026-04-14) now **requires iOS 26**. 4.1 from 436 ratings. Remove Ads $1.99 and Lucidity PRO $5.99, both one-time. "Auto Shutoff Alarms: Short gentle alarms that wake you then stop." — [App Store](https://apps.apple.com/us/app/lucidity-lucid-dreaming/id1121048340)

#### B. Updated app comparison table (retrieved 2026-10-22; ratings = US storefront / Play global)

| App (developer) | Platforms | Price tiers (USD; CZK/EUR where shown) | Rating (count) | Installs (Play) | Last update | Key LD features / night-cue mechanism | Status | Source |
|---|---|---|---|---|---|---|---|---|
| **Oniri** (Oniri Inc) | iOS 16+, Android | Free journal; Premium IAP $6.49–$59.99 (also "Full version" $49.99); CZ 100–1,290 Kč; DE €5.49–59.99 | iOS 4.57 (3,842); Play 3.66 (641) | 10K+ (32,527) | iOS 2026-10-17; Play 2026-10-16 | Journal, AI interpretation, random RCs, **user-scheduled night audio cues** (bell or own voice, set clock offsets, volume ramp), auto-stop night alarms, WILD/MILD/SSILD audio | Active | [AS](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914), [GP](https://play.google.com/store/apps/details?id=io.oniri.oniriapp), [oniri.io](https://www.oniri.io/lucid-dreams) |
| **Lucidity** (Christopher Benz) | Android, iOS 17+ | Android ads + IAP $4.99–$134.99; iOS $4.99/wk, $12.99/mo, $48–59.99/yr, $89.99–119.99 lifetime; CZ 129 Kč/wk–2,990 Kč lifetime | Play 4.81 (8.19K); iOS 4.69 (13) | 100K+ (419,931) | Play 2026-10-05; iOS 2026-10-19 | Journal, AI analysis, technique screens, RC + totems; **no night cues** | Active | [GP](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity), [AS](https://apps.apple.com/us/app/lucidity-dream-interpretation/id6505020545) |
| **Shape** (Timeless LLC) | iOS 17+ only | Listing: $9.99/mo or $39.99/yr after 7-day trial (IAP list also $19.99–$99.99); CZ 249–2,990 Kč | 4.70 (1,730) | — | 2026-10-18 | Coach, audio guides, "Am-I-Dreaming" reminders, Health-based "peak dreamtime" → WBTB alarm | Active | [AS](https://apps.apple.com/us/app/shape-lucid-dreaming/id1577026266) |
| **Awoken** (A. Rudolph) | Android only | Ads; IAP $0.99–$2.49 | 4.39 (22.3K) | 1M+ (1,046,096) | 2024-07-12 | Random RC, "Totem Sound" low audio cues, journal | Stale | [GP](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken) |
| **Dream Journal Ultimate** (Dream Labs) | iOS, Android | Free; "Support" IAP $2.99 (79 Kč / €2.99) | iOS 4.47 (565); Play 4.28 (1.15K) | 100K+ (102,896) | iOS 2026-10-13; Play 2026-09-28 | Journal, AI interpretation/images, Lucid Academy, random RC alarms | Active | [AS](https://apps.apple.com/us/app/dream-journal-ultimate/id802558054), [GP](https://play.google.com/store/apps/details?id=dreamcapsule.com.dl.dreamjournalultimate) |
| **Lucid Dreamer** (guardanus) | — | — | — | — | — | — | **Delisted** (Play 404; not on iOS search) | [GP 404](https://play.google.com/store/apps/details?id=guardanus.dreamer) |
| **Reality Check** (Oneironaut) | iOS 26+ | Free, no IAP | 4.67 (3) | — | 2026-10-21 | 60+ RC prompts, 5–20/day, quiet hours, RC↔LD correlation | Active, new | [AS](https://apps.apple.com/us/app/reality-check-lucid-dreams/id6755739747) |
| **Sleep as Android** (Urbandroid) | Android + Wear OS / Galaxy / Garmin / Mi Band etc. | 7-day premium trial, then freemium; IAP $0.99–$75 | 4.56 (393K) | 10M+ (24.3M) | 2026-10-15 | Actigraphy-estimated REM → audio ("You are dreaming"), vibration (to wearable), light cues; Sensitivity/Later/Repeat | Active | [GP](https://play.google.com/store/apps/details?id=com.urbandroid.sleep), [docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html) |
| **Paller lab "lucid"** | — | — | — | — | — | Former TLR research app | **Not available** (page and package gone) | [Paller lab](https://pallerlab.psych.northwestern.edu/dream) |
| ↳ **Lucid Dreaming Experiment** (N. Whitmore / MIT Maes group) | iOS 15+, Android | Free study app (Android lists IAP range $1.99–69.99, likely irrelevant) | — | 100+ (377) | iOS 2026-06-26; Play 2026-06-25 | 8-night US-only study: 20-min pre-sleep training, sound/light/vibration cues, phone by pillow | Research, recruiting | [AS](https://apps.apple.com/us/app/lucid-dreaming-experiment/id6769513728), [GP](https://play.google.com/store/apps/details?id=edu.mit.lucid) |
| **Lucidly** (5Path) | iOS + Apple Watch | $5.99/mo, $39.99/yr (159 / 1,090 Kč; €5.99 / €42.99), 7-day trial | 3.16 (19) | — | 2025-03-03 (Apple watchOS-27 rebuild since) | Watch HR/motion neural-net REM → haptic/audio; hypnagogic mode; claims >80% | Maintenance only | [AS](https://apps.apple.com/us/app/lucidly/id1566419183) |
| **Ludin** | Claimed iOS + Android | $5 early access; waitlist | — | — | — | Phone on mattress, on-device motion ML, screen light cue | **Not launched** as of 22 Oct 2026 | [ludin.app](https://ludin.app/) |
| **Somnium** (Green Advex) | iOS | $4.99; $6.99/wk; $39.99/yr | 4.75 (20) | — | 2026-01-04 | AI interpretation + horoscope; **not an LD trainer** | Drop from LD table | [AS](https://apps.apple.com/us/app/somnium-dream-interpretation/id6470462666) |
| **MILD Trainer** (N. Woolmore) | iOS 16+ | **Free** | 5.0 (1) | — | 2026-09-20 | Daily target events (LaBerge prospective memory), journal, "night reminders" | Active | [AS](https://apps.apple.com/us/app/mild-trainer-lucid-dreaming/id1530667456) |
| **Lucid Now** (A. Tardy) | iOS 13+ | Premium $3.99/mo | 5.0 (1) | — | 2025-03-31 | Claims TLR cues "during your REM sleep phases"; no sensor described | Stale | [AS](https://apps.apple.com/us/app/lucid-now/id6739976528) |
| **Lucid Scribe** (lucidcode) | iOS 16+, Android | iOS free; Android IAP $0.99–$39.99 | iOS 5.0 (2); Play 3.75 (26) | 1K+ (4,961) | iOS 2026-10-21; Play 2026-10-20 | TLR "Deep Playlist" over media channel, REM Lights (scheduled), FILD timer, TDI, SSILD, INSPEC camera real-time REM, watch vibration | Active (vendor also sells INSPEC) | [AS](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169), [GP](https://play.google.com/store/apps/details?id=com.lucidcode.lucidscribe) |
| **Everdream** | iOS 15+ | $3.99/mo, $14.99/yr, $19.99 lifetime | 4.2 (54) | — | 2026-10-05 | "Measure sleep stages" → auto-off REM alarm, RCs, journal | Active | [AS](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004) |
| **LucidMe** (REMspace) | iOS, Android + mask | "Morpheus Mode" $9.99/mo, $69/yr | iOS 4.43 (14); Play 3.53 (1.44K) | 100K+ (121,764) | iOS 2026-10-06; Play 2026-10-02 | Journal, interpretation, mask sleep tracking | Active | [AS](https://apps.apple.com/us/app/lucidme-sleep-dream-journal/id907469483), [GP](https://play.google.com/store/apps/details?id=com.phaser) |
| **Elsewhere** | iOS, Android | $4.99/mo, $49.99/yr; credits; Supporter $9.99/$99.99 | iOS 4.94 (108); Play 4.24 (86) | 5K+ (6,649) | iOS 2026-09-14; Play 2026-09-13 | AI journal, symbols; no LD tools | Active | [AS](https://apps.apple.com/us/app/elsewhere-dream-journal/id6445864345), [GP](https://play.google.com/store/apps/details?id=to.elsewhere) |
| **Dreamu** (CASUAPP) | Android | Ads; IAP $4.99–$49.99 | no count shown | 10+ (37) | 2026-08-31 | Levels 0–12, RCs, binaural beats | New, negligible uptake | [GP](https://play.google.com/store/apps/details?id=com.casuapp.dreamu) |
| **Lucidly: AI Dream Journal** (MindyApps) | Android | IAP $3.99–$34.99 | 3.75 (724) | 50K+ (56,193) | 2026-09-06 | AI journal, RCs, sounds; no night cues | Active (since 2021) | [GP](https://play.google.com/store/apps/details?id=com.mindyapps.lucidlynew) |
| **WorldWithin** | iOS 12+ | IAP "Lucid Plus" $6.99–$79.99 | 4.49 (130) | — | 2022-07-08 | RC + journal | Abandoned | [AS](https://apps.apple.com/us/app/worldwithin-lucid-dreaming-app/id1546635635) |
| **DreamKeeper** | iOS 14+ | Free | 4.79 (573) | — | 2023-11-28 | Journal only | Abandoned | [AS](https://apps.apple.com/us/app/dreamkeeper-my-dream-journal/id530958563) |

#### C. Notable apps missing from the report's table

- **Lucyd: Lucid Dream On Command** (Natia Osadze), iOS 17+. Released 2026-07-21, v1.5 (2026-08-26), 4.59 from 54 ratings.
  - IAP: $4.99–$9.99/mo, $19.99–$29.99/yr, Pro $9.99/$29.99.
  - Explicitly markets the Northwestern TLR protocol: "During the REM-rich part of the night, Lucyd softly replays your cue, timed and volume-ramped to reach the dream without waking you."
  - On-device journal and transcription, no account.
  - The v1.5 note says the daytime cue "was too quiet, and any Focus mode was silencing it outright", which a design team should take as a warning.
  - Source: [App Store](https://apps.apple.com/us/app/lucyd-lucid-dream-on-command/id6787179501)
- **Lucid Wake** (VigilWave), Wear OS. Released 2026-03-31, 1K+ installs (1,044), IAP $4.99–$29.99.
  - "Analyze your physiological data, including heart rate variability (HRV) and activity levels, to instantly identify REM cycles"; adjustable entry and exit thresholds; phone companion plays audio, vibration or flashing-light cues; raw data export.
  - The developer says on Reddit that it analyzes "real-time biometric data (HR and RMSSD)" and that "Development of the watchOS version is underway".
  - Sources: [Google Play](https://play.google.com/store/apps/details?id=com.vigilwave.lucidwake); [Reddit launch post](https://www.reddit.com/r/LucidDreaming/comments/1sby6ck/the_lucid_wake_app_is_officially_released/); [dev comment](https://www.reddit.com/r/LucidDreaming/comments/1rkfvlp/_/o8rt3o6/)
- **Lucid Dream Watch / "Dr. Lucid"** (Project Lucid), Wear OS + phone and iOS + Apple Watch.
  - **Android:** 3.1★ from 24 reviews, 1K+ installs (1,617), IAP $4.29–$14.99.
  - **iOS:** 3.57 from 7 ratings; not available in the CZ/DE storefronts.
  - "REM Sleep Detection: Advanced sleep tracking detects REM and sends gentle alerts to your Wear OS smartwatch."
  - Sources: [Google Play](https://play.google.com/store/apps/details?id=app.projectlucid.main); [App Store](https://apps.apple.com/us/app/lucid-dream-watch/id6447772149)
- **LDAlarm: Lucid Dream Alarm** (Y. Koteniatkin), iOS 26+. Released 2026-09-21, one-time $2.99 "Lifetime" (79 Kč / €2.99).
  - First signal at 6:15 h (WBTB), then "gentle signals" that "play once and fade by itself".
  - "A waking signal is a real iPhone alarm: it sounds in Silent mode and during Sleep Focus", consistent with AlarmKit.
  - Journal tracks which pattern produced LDs.
  - Source: [App Store](https://apps.apple.com/us/app/ldalarm-lucid-dream-alarm/id6813238351)
- **Lucidity Level** (Nathan Woolmore on iOS 26+; "IndieArc" `studio.victorylapp.lucidlevelup` on Android).
  - **Android:** 4.38★ from 154 reviews, 5K+ installs (5,276).
  - Gamified journal, MILD targets, WBTB and auto-shut-off alarms (CAN-WILD).
  - Reads Health Connect / Apple Health history. Its listing states plainly: "the app does not track sleep itself or detect REM in real time."
  - Sources: [Google Play](https://play.google.com/store/apps/details?id=studio.victorylapp.lucidlevelup); [App Store](https://apps.apple.com/us/app/lucidity-level-lucid-dreaming/id6763508712)
- **Dream Catcher: Lucid Journal** (Snaps Studio AB). Android 4.33★ from 8.31K reviews, 100K+ installs (499,924), IAP $1.99–$29.99, ads. iOS 4.69 from 35. A journal and analysis app, a big install base the report missed. — [Google Play](https://play.google.com/store/apps/details?id=com.vojtkovszky.dreamcatcher)
- **Somni Mask: Lucid Dreaming** (Somni Technologies), iOS companion for the Somni Mask Pro (2026-09-30).
  - "Four infrared sensors sit around one eye… the mask decides on its own when to cue you. Its light flashes, and the sound you chose plays on your phone."
  - Default cue "Wind… starts almost silent and slowly builds". Fully offline.
  - Source: [App Store](https://apps.apple.com/us/app/somni-mask-lucid-dreaming/id6814533249)
- **Other long tail, mostly low uptake:**
  - **BrainWave: Dream Inducer** (iOS, paid $3.99, 4.86 from 1,051): binaural "dream" programs, not evidence-based. — [App Store](https://apps.apple.com/us/app/brainwave-dream-inducer/id383185215)
  - **Lucid Dreaming, Mindfully** (iOS, 4.57 from 84; $9.99/mo, $79.99/yr): AI guide "Maya". — [App Store](https://apps.apple.com/us/app/lucid-dreaming-mindfully/id1374074148)
  - **DreamWell** (iOS 4.22 from 46; Android 4.43 from 208, 10K+): stale since Nov 2024. — [App Store](https://apps.apple.com/us/app/dreamwell-lucid-dreaming/id1560429014); [Google Play](https://play.google.com/store/apps/details?id=com.dreamwellbewell.dreamwell)
  - **Lucid Dream Inducer** (Android, 10K+, 3.48 from 191): WILD reminder with Wear OS support. — [Google Play](https://play.google.com/store/apps/details?id=com.k560.luciddreaminducer)
  - **Lucid Dream Journal – DreamLog** (Android, 10K+, 3.33 from 210). — [Google Play](https://play.google.com/store/apps/details?id=com.luciddreamz.journal.dream)
  - **LucidCue** (Apple Watch wrist-twitch reality test, 2025). — [App Store](https://apps.apple.com/us/app/lucidcue/id6745799090)
  - **"Lucid Reality"** (NextSense, Wear OS REM-timed RCs): stale since Apr 2024, 100+ installs. — [Google Play](https://play.google.com/store/apps/details?id=io.nextsense.android.main.lucid.prod)
- **App Store saturation:** an iTunes Search sweep found dozens of 2025–2026 iOS LD/dream-journal apps with 0–5 ratings, e.g. Go Lucid, Ludream, Dreamiary, Lunicia, REMA, DreamWake, Oneirism. — [iTunes Search "lucid dream"](https://itunes.apple.com/search?term=lucid+dream&entity=software&country=us&limit=50)

### Inferences
- Install leaders on Android are still old journal and RC apps (Awoken 1M+, Dream Catcher ~500K, Lucidity ~420K, LucidMe ~120K, DJU ~100K). Oniri's Android base (~33K) is small compared with its iOS presence, which supports the report's "weaker on Android" point.
- On iOS the only apps with >1,000 US ratings are Oniri (3.8K) and Shape (1.7K), plus the binaural BrainWave app.
- **Night cues: the market has shifted** since the report was drafted.
  - **Timer-scheduled cue apps exist on iOS** (Oniri, Lucyd, LDAlarm, Lucid Scribe, Lucid Now).
  - **Real-time-REM claims moved to watches:** Lucid Wake and Lucid Dream Watch on Wear OS, Lucidly on Apple Watch.
  - **Dedicated sensor hardware** covers the rest: INSPEC camera, Somni mask, LucidMe mask.
  - The report's "iOS gap" is therefore no longer "no cue apps on iOS". It is now "no *validated* cue protocol on iOS". The Paller/MIT protocol itself is only available as a US-only research study app.
- Free reality-check reminders without limits remain under-served on iOS. Users explicitly hit caps of 4 and 10 reminders per day (see Q2).

### Gaps
- Global (all-storefront) App Store rating totals and download/revenue estimates (AppMagic, Sensor Tower, appfigures returned 403) could not be obtained.
- Google Play local-currency prices (CZK/EUR) could not be obtained through this proxy; only USD ranges are available.
- Which Oniri, Shape and Lucidity IAP items are the currently offered tiers cannot be determined from listings, because the App Store shows "top IAPs" including legacy ones.
- The Lucidly 270-minute cap, the Everdream "~50% battery" warning and the LucidMe mask price were not re-verified.
- The old Sleep as Android "~50% REM hit / don't cue first 2 h" wording could not be retrieved, because Wayback was blocked and the page has been rewritten.

## Q2. What does the LD community (r/LucidDreaming, LD4all, DreamViews) say about the best apps and the most-wanted features (2023–2026)?

### Takeaway
There is no single "best app" consensus.
- **Most-named apps:** in 27 r/LucidDreaming app threads from 2023–2026 (388 app-related submissions scanned), the most-mentioned names were Oniri, Lucidity, Lucid Scribe (mostly by its developer), Shape and Awoken.
- **Notes apps get many votes:** many top-voted replies say a phone notes app or paper is enough.
- **Recurring wishes:** (1) auto-shut-off alarms, (2) real-time REM detection from a smartwatch that triggers a gentle cue, (3) unlimited, free, reliable RC reminders, (4) no paywall or ads, (5) watch and Fitbit integration.
- **Recurring complaints:** Awoken data loss and unreliable reminders; caps on reminder counts in iOS apps.
- **Other forums:** LD4all has almost no 2023–26 app discussion. DreamViews could not be accessed.

### Cited Findings
- **Corpus scope:** an arctic-shift title search for app/apps/application/watch/device in r/LucidDreaming since 2023-01-01 returned 388 submissions. The most-commented app-specific threads are quoted below. Across their comments the mention counts were: Oniri 11, Lucidity 9, Lucid Scribe 9, Apple Watch 8, Wear OS 8, INSPEC 7, Shape 6, notes app 5, Fitbit 5, Awoken 4, Lucid Wake 4, auto shut-off 3, Lucid Dreamer 3, Sleep as Android 1. Inference: small counts, low statistical weight. — [arctic-shift API](https://arctic-shift.photon-reddit.com/api/posts/search?subreddit=LucidDreaming&title=app&after=2023-01-01)

**"Every year someone makes a new lucid dreaming app, did any of those turned out good?" (2024-04-15, score 26)**
- Top reply (25 points): "a dream journal (password protected optionally, text and voice memos, maybe sketches) … some helpful tools like alarms that can be customized - a tracker + analysis visualized (eg graphs)". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzoaazy/)
- (9 points): "Auto shut off alarm that is triggered when it recognizes the REM phase using a smart watch." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzp28ma/)
- (6 points): "They all have their own quirks and uses but you can literally just use the notes app and get the same result". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzom2er/)
- (3 points): "I had my first lucid dream after about a month logging with Oniri… it definitely makes it more fun for me to be able to tag characters, items, and emotions." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzrxjng/)
- (2 points): "the auto shut off alarms are just so damn good for easy WILDs." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzs4fdt/)
- Feature request: a journal that lets you log "that you didn't remember any dreams last night" without it counting as a dream. — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzyj6p4/)

**"What would You like to see in lucid dream PC / mobile app?" (2024-08-30)**
- Integration: "Integration with Apple Watch or Fitbit to monitor your sleep patterns." (6 points) — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lko09nt/)
- "The watches aren't great at detecting sleep states but… an app that integrated with real-time smart watch data… set a gentle alarm for 5 minutes after it detects the REM state." (5 points) — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lkohu3z/)
- "HR monitoring through fitbit… play a customized sound/vibrate/flash my screen… when my HR is <45, and as soon as my HR is over 50 again". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lkq8sav/)
- "Sleep as Android does this, you can set it to play a sound when it detects you are in REM sleep. It's not available for apple watches though." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lkpkjtw/)
- "Multiple alarms with different sounds for each and different durations for each, and obviously the alarms have auto off… something subtle that doesn't wake me up… another alarm at 6:00 that actually wakes me up so I can attempt WBTB." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lqki4h8/)

**"Dream journal app" (2024-08-15)**
- "Make it ad-free and don't block features behind a pay-wall… there aren't any good LD apps that are 100% free" (5 points). — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/libhi73/)
- "please don't have a shitty pro subscription that blocks half the features" (4 points). — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/liaf9or/)
- "Try adding an auto shut off alarm feature!… I can't currently find anything with this". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/lifa7zi/)
- "have a notification sound for alarms that dont scare people awake". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/ligiv47/)

**iPhone reminder thread (2025-11-14, score 31, 53 comments)**
- The OP: "I had an app on android called awoken and that was perfect… Ive found 2 apps on my iPhone but one of them has a max amount of reminders of 4... and another has a max of 10." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ox73v5/does_anyone_know_an_app_for_iphone_that_can_buzz/)
- Top answers: "Set 20 alarms" (34 points) and "cant you just use the reminders app" (25 points). — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ox73v5/_/novho7x/)
- Other replies recommend Oniri random RCs, Shape, Lucidity and Awoken. — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ox73v5/_/nowdwx7/)

**Awoken reliability**
- "Avoid Awoken: it glitched and I lost years of dreams." (2023-10-25) — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/17gbywg/_/k6gtgf5/)
- A 2025-12 OP: "awoken reality checks aren't reliable and the app seems pretty outdated". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1pbqde6/any_free_app_to_send_me_reality_checks/)

**Other app mentions and opinions**
- Everdream user: "It sends me a reality check notification every hour… it will play a sound when you are in REM to try to trigger a reality check while you're dreaming." (2024-07-02) — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1dtflf2/_/lbcwe4i/)
- Oniri for journaling (2026-08): "There is a subscription for interpretation and some other features, but you don't need it if you just want to journal… free with no limits". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1vhi72j/_/p46r5q3/)
- Platform skepticism: a 2024 commenter says "I tried writing one for Apple Watch but the APIs don't allow real time detection of REM stage. You can only analyze the entire sleep data". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1fb73be/_/lm173hj/)
  - A 2023 thread: "They should at least make that data available to other applications in real time." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/15xu74r/_/jx8ncfg/)
- Skeptic voices with net-positive votes:
  - "don't use reminders. All that will achieve is train you to do a reality check when your alarm goes off". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/16u8bhe/_/k2mr1mh/)
  - Cue skepticism: "in most cases you either don't notice them at all or they wake you up… the same noise and volume will have different results on different days". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1tbbzpi/_/olncbfa/)

**Developer self-promotion is pervasive and should be discounted**
- The lucidcode developer (u/mcoder) promotes Lucid Scribe and INSPEC in most threads: "Lucid Scribe; in my admittedly biased opinion." — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1gvb88l/_/ly0l91y/)
- Other developer-posted launch threads: Lucid Wake (score 65), a Spanish TLR tester call, Onyra, Lucidity Level. — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1sby6ck/the_lucid_wake_app_is_officially_released/)
- One indie developer reports their LD journal app "makes $200–300/month with zero marketing" (2026-06). Only the thread title was read. — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ujxehf/)

**Willingness to pay for a device**
- A 2026-04 poll-style thread, "If a device truly existed that could give you lucid dreams with a 99% success rate, at a price of around $150-300, would you be willing to buy it?", reached score 203 with 156 comments, the largest app/device thread in the corpus. — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1sokuxu/)

**LD4all and DreamViews**
- **LD4all:** Discourse search shows almost all app threads predate 2021, e.g. "best-lucid-dreaming-app-for-ios" (2014), "anyone-use-sleep-as-android-lucid-dreaming-aid" (2013). — [LD4all search](https://community.ld4all.com/search?q=app%20in%3Atitle)
  - 2026 stack thread (user IAmCoder): "My latest stack: WBTB + Cognitive Training + REM Cue… The lab version of this is called Targeted Lucidity Reactivation (TLR)". — [LD4all "The BIG Lucid Dreaming Stack Topic", 2026-08-19](https://community.ld4all.com/t/the-big-lucid-dreaming-stack-topic/79872)
  - 2023 device thread, moderator Marvin: "A device can certainly help you in the sense that it pretty much guarantees you will encounter the cue in your dream… your signals are only half of the work." — [LD4all, 2023-03-16](https://community.ld4all.com/t/wild-device-is-it-worth-it/77588)
- **DreamViews:** blocked by Cloudflare. A search snippet points only to an older (~2021) Android thread recommending Awoken. — [DreamViews thread](https://www.dreamviews.com/general-lucid-discussion/165753-best-reality-check-techniques-lucid-dreaming-app-android.html)

**Sleep as Android user problems (developer forum)**
- "I am getting sometimes this cue when I am awake" (2021). — [Urbandroid forum](https://forum.urbandroid.org/t/lucid-dreaming-sleep-as-android/4691)
- "Garmin Fenix 7… works fine as alarm, but! Lucid dreaming feature doesnt work properly… the wearable doesn't vibrate at all" (2023-05-30). — [Urbandroid forum](https://forum.urbandroid.org/t/lucid-dreaming-sleep-as-android/4691)

### Inferences
- The top-voted community "features" match the report's MVP list (journal, configurable auto-off alarms, RC reminders, analytics). They add two concrete differentiators: **unlimited, Focus-proof RC reminders on iOS/Apple Watch**, and **watch-triggered REM cues**.
- The strongest negative sentiment is about paywalls, ads, data loss and missing backups (Awoken), not about missing AI features.
- A large share of "recommendations" are developer self-promotion. Community consensus on cue efficacy is skeptical, in line with the Paller/MIT estimate of ~10–15% LD chance per cued night.

### Gaps
- DreamViews 2023–26 threads were not retrievable (Cloudflare challenge); Wayback was blocked.
- Reddit comment trees were limited to ≤100 comments per thread from arctic-shift. Deleted or removed comments were excluded. Scores are as archived, not live.
- No systematic sentiment analysis was possible. The counts above are a rough indicator only.

## Q3. What are the verified platform constraints (iOS/watchOS/Android/Wear OS/HealthKit/Health Connect)?

### Takeaway
The official documents confirm the report's architecture conclusions, with refinements.
- **Apple guideline 2.5.4:** a single generic sentence. The "silent audio" rejection risk comes from forum and developer reports, not from the guideline text.
- **iOS `audio` background mode:** officially for apps that play "audible content".
- **AlarmKit:** alarms override Focus and silent mode, can use a custom bundled sound, and can run App Intents from buttons. Apple positions alarms for wake-up alarms and countdown timers.
- **watchOS `WKExtendedRuntimeSession`:** limits confirmed. Smart alarm is background, schedulable up to 36 h ahead, 30 minutes long, and must play a haptic. Mindfulness is frontmost, 1 h. Physical therapy is background, 1 h. Self care is frontmost, 10 min. One type per app.
- **HealthKit:** no real-time staging. Background delivery is at most hourly for most types on watchOS. Apple writes full stages only for sessions longer than 3 h.
- **Android exact alarms:** `USE_EXACT_ALARM` is restricted by Play policy to alarm/timer/calendar apps. `SCHEDULE_EXACT_ALARM` is denied by default on Android 14 for new installs.
- **Android overnight audio:** `mediaPlayback` FGS has no runtime prerequisites but must be user-initiated and declared with a video in Play Console. The `health` FGS type needs body-sensor or activity-recognition permissions.
- **Raw watch HR:** Wear OS Health Services batches data in the background. Samsung's Health Sensor SDK gives raw PPG and HR with inter-beat intervals (IBI), but requires Samsung partner approval to distribute.
- **Health Connect:** has a REM stage type inside `SleepSessionRecord`, a session record with a start and an end time.

### Cited Findings

**Apple App Review**
- **Guideline 2.5.4, verbatim:** "Multitasking apps may only use background services for their intended purposes: VoIP, audio playback, location, task completion, local notifications, etc." — [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)
- **2.5.1** also states: "Apps should use APIs and frameworks for their intended purposes… HealthKit should be used for health and fitness purposes and integrate with the Health app." — [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)

**iOS background audio**
- The background-modes table lists "Audio, AirPlay, and Picture in Picture | audio | The app plays audible content in the background." It also says: "Use background execution modes sparingly because overuse can negatively impact device performance and battery life. If an alternative to executing in the background exists, use the alternative instead." — [Apple: Configuring background execution modes](https://developer.apple.com/documentation/xcode/configuring-background-execution-modes)
- Inference: an all-night audible soundscape (noise or rain) with cues mixed in fits "audible content". A silent keep-alive loop does not.

**AlarmKit (iOS/iPadOS 26)**
- **Focus and silent mode:** "An alarm is an alert that presents at a pre-determined time based on a schedule or after a countdown. It overrides both a device's focus and silent mode, if necessary." — [Apple sample: Scheduling an alarm with AlarmKit](https://developer.apple.com/documentation/alarmkit/scheduling-an-alarm-with-alarmkit)
- **Authorization:** users must authorize alarms, and `NSAlarmKitUsageDescription` is required. "If the `NSAlarmKitUsageDescription` key is missing or its value is an empty string, apps can't schedule alarms with AlarmKit." — [Apple sample](https://developer.apple.com/documentation/alarmkit/scheduling-an-alarm-with-alarmkit)
- **Schedules:** one-time, weekly-repeating or countdown. "The system forwards the alert presentation to a paired watch (if any)." — [Apple sample](https://developer.apple.com/documentation/alarmkit/scheduling-an-alarm-with-alarmkit)
- **Custom sound:** "If you don't specify a sound parameter, your alarm will use a default system sound. You can also provide a custom sound… the sound file… should be either in your app's main bundle or Library/Sounds folder of your app's data container." — [WWDC25 session 230 transcript](https://developer.apple.com/videos/play/wwdc2025/230/)
- **App Intents:** "AlarmKit gives you the ability to run your own code when someone taps an alarm button… using an app intent." The configuration doc adds that the secondary intent "is only available after first unlock". — [WWDC25 230](https://developer.apple.com/videos/play/wwdc2025/230/); [AlarmConfiguration](https://developer.apple.com/documentation/alarmkit/alarmmanager/alarmconfiguration)
- **Intended use:** "Alarms are a great fit for countdowns with a specific interval, like a cooking timer, or recurring alerts with a schedule, like a wake-up alarm. They are not a replacement for other prominent notifications, like critical alerts or time-sensitive notifications." — [WWDC25 230](https://developer.apple.com/videos/play/wwdc2025/230/)
- **Shipping example:** LDAlarm says its waking signal "is a real iPhone alarm: it sounds in Silent mode and during Sleep Focus". — [App Store](https://apps.apple.com/us/app/ldalarm-lucid-dream-alarm/id6813238351)
- **Report claim that AlarmKit "does not wake the app":** NOT FOUND in official docs. Apple's materials only document that buttons can trigger App Intents. The claim remains secondary-source (WWDC Notes), as cited in the report.

**watchOS WKExtendedRuntimeSession**
- **Session types (official table):** Self care, frontmost, not schedulable, 10 minutes. Mindfulness, frontmost, not schedulable, 1 hour. Physical therapy, background, not schedulable, 1 hour. Smart alarm, background, schedulable, 30 minutes. — [Apple: Using extended runtime sessions](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)
- **One type per app:** "Each app can only support one type of extended runtime session." — [Apple](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)
- **Scheduling:** "For alarm sessions, you can schedule the session to start any time within the next 36 hours by calling start(at:)." "You must always start or schedule the extended runtime session when your app state is in the active state." "You can only schedule one session at a time." — [Apple](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)
- **Haptic requirement:** "During the session, your app must trigger the alarm by calling the session's notifyUser(hapticType:repeatHandler:) method… If you fail to play a haptic during the session, the system displays a warning and offers to disable future sessions." — [Apple](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)
- **CPU limits:** "If your app sustains high CPU usage over a period of time, the system may cancel the session." — [Apple](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)
- **watchOS 26:** the current docs carry no version-specific changes, so the limits above are the current published ones. The open-source watchOS TLR and Lucidly showing feasibility of custom on-watch classification is a report claim not re-checked here.

**HealthKit sleep stages**
- **Sample structure:** "These detailed samples show when the user was awake, in core sleep, in deep sleep, or in rapid eye movement (REM) sleep… Samples recorded by Apple Watch only include awake samples that occur between two sleep samples." — [HKCategoryValueSleepAnalysis](https://developer.apple.com/documentation/healthkit/hkcategoryvaluesleepanalysis)
- **Background delivery:** "The system wakes your app at most once per time period defined by the specified frequency… In watchOS, most data types have an hourly maximum frequency." The immediate-capable list contains only events (high/low HR events, irregular rhythm, audio exposure, falls, handwashing, toothbrushing), not sleep. "Your app can receive four updates (or background app refresh tasks) an hour, as long as it has a complication on the active watch face." — [enableBackgroundDelivery](https://developer.apple.com/documentation/healthkit/hkhealthstore/enablebackgrounddelivery(for:frequency:withcompletion:))
- **3-hour threshold:** CONFIRMED. "Binary sleep and wake data is written to HealthKit if a detected sleep session has a total sleep duration of one to three hours. Full sleep stage classifications (Awake, REM, Core, and Deep) are written to HealthKit if the total sleep duration of a detected sleep session exceeds three hours." This is in the 2024 appendix on sessions outside a sleep schedule. — [Apple white paper, Oct 2025](https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf)
- **How Apple stages sleep:** the algorithm "classifies the signal every 30 seconds (epochs)" using accelerometer data. The watchOS 26 update "incorporated foundation models… Like the original, this updated algorithm is based on accelerometer sensor data". The four-stage kappa was 0.63 in validation. — [Apple white paper](https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf)
- **Report's "no real-time access" claim:** based on Apple Forums thread 804512. Not re-verified: the forum now shows a "Security Verification" page to this client.

**Android exact alarms**
- **Android 14 default:** "SCHEDULE_EXACT_ALARM… is no longer being pre-granted to most newly installed apps targeting Android 13 and higher (will be set to denied by default)." Affected: apps that target API 33+, declare it, and are not a "calendar or alarm clock app". — [Android Developers: Schedule exact alarms are denied by default](https://developer.android.com/about/versions/14/changes/schedule-exact-alarms)
- **`USE_EXACT_ALARM`:** "Calendar or alarm clock apps… can request the USE_EXACT_ALARM normal permission… granted on install… Apps will not be able to publish a version of their app with this permission in the manifest unless they qualify based on the policy language." The page also notes that `setExact()` with an `OnAlarmListener` does not need `SCHEDULE_EXACT_ALARM`, and suggests `setAndAllowWhileIdle()` for approximate idle-time alarms. — [Android Developers](https://developer.android.com/about/versions/14/changes/schedule-exact-alarms)
- **Google Play policy, verbatim:** "USE_EXACT_ALARM is a restricted permission and apps must only declare this permission if their core functionality supports the need for an exact alarm. Apps that request this restricted permission are subject to review, and those that do not meet the acceptable use case criteria will be disallowed from publishing on Google Play."
  - Acceptable uses: "The app is an alarm or timer app. The app is a calendar app that shows event notifications."
  - "If your app does not have this specific core need, consider using SCHEDULE_EXACT_ALARM… access must be granted by the user."
  - Source: [Play Console Help: Permissions and APIs that Access Sensitive Information](https://support.google.com/googleplay/android-developer/answer/9888170?hl=en)
- **`USE_FULL_SCREEN_INTENT`:** on Android 14+ it is "auto-granted only for apps whose core function is setting alarms or handling calls". — [Play policy](https://support.google.com/googleplay/android-developer/answer/9888170?hl=en)

**Android foreground services for overnight audio and sensing**
- **`mediaPlayback`:** permission `FOREGROUND_SERVICE_MEDIA_PLAYBACK`, "Runtime prerequisites: None", "Continue audio or video playback from the background". Apps targeting Android 15+ cannot launch it from `BOOT_COMPLETED`. — [Android Developers: Foreground service types](https://developer.android.com/develop/background-work/services/fgs/service-types)
- **`health`:** needs `HIGH_SAMPLING_RATE_SENSORS` or one of `BODY_SENSORS` (API ≤35), `READ_HEART_RATE`, `READ_SKIN_TEMPERATURE`, `READ_OXYGEN_SATURATION`, `ACTIVITY_RECOGNITION`. Body-sensor permissions are while-in-use, so a background start needs `BODY_SENSORS_BACKGROUND` (API 33–35) or `READ_HEALTH_DATA_IN_BACKGROUND` (API 36). Description: "Any long-running use cases to support apps in the fitness category such as exercise trackers." — [Android Developers](https://developer.android.com/develop/background-work/services/fgs/service-types)
- **Timeouts:** "The system permits dataSync and mediaProcessing foreground services to run for a total of 6 hours in a 24-hour period." Inference: `mediaPlayback` and `health` are not subject to this 6-hour cap; `dataSync` is unsuitable for all-night use. — [Android Developers: FGS timeouts](https://developer.android.com/develop/background-work/services/fgs/timeout)
- **Play declaration:** apps targeting Android 14+ must declare FGS types in Play Console with "a link to a video demonstrating each foreground service feature".
  - Media Playback: "Playback must be user-initiated; any automatic soundtracks that play when you open an app do not qualify."
  - Health: "Syncing of health data for apps in the fitness category… For example, step counter, exercise tracker."
  - Source: [Play Console Help: foreground service requirements](https://support.google.com/googleplay/android-developer/answer/13392821?hl=en)

**Wear OS Health Services and Samsung**
- **Passive data:** "When you receive data in the background, it is delivered in batches. The callback receives data at a slightly faster rate, but only while the app is running." The passive client can report `USER_ACTIVITY_ASLEEP`. — [Android Developers: Passive data updates](https://developer.android.com/health-and-fitness/health-services/monitor-background)
- **MeasureClient:** "not intended for background capture or workout tracking". — [Android Developers: Health Services overview](https://developer.android.com/health-and-fitness/health-services)
- **ExerciseClient batching:** with the screen off, "the processor delivers messages only when awake or when a maximum reporting period is reached, such as every 150 seconds". `BatchingMode` can override this, but "because of the impact to battery performance, use BatchingMode only in scenarios where it is absolutely necessary". — [Android Developers: ExerciseClient](https://developer.android.com/health-and-fitness/health-services/active-data)
- Inference: an overnight "exercise" session to stream HR would misuse the API's purpose, similar to iOS workout sessions.
- **Samsung Health Sensor SDK, capabilities:** "provides both raw sensor signal data… accelerometer, raw ECG, PPG, and heart rate, including inter-beat intervals"; data arrives "as a continuous event… without waking up the CPU". Galaxy Watch4+ on Wear OS powered by Samsung only. — [Samsung Health Sensor SDK overview](https://developer.samsung.com/health/sensor/overview.html)
- **Samsung distribution requirement:** "Please submit partner request before your app distribution… Otherwise, the app using the Samsung Health Sensor SDK works only with the developer mode turned on." — [Samsung: Process](https://developer.samsung.com/health/sensor/process.html)

**Health Connect sleep**
- **Data model:** "Sleep data is displayed as a session, and can be divided into 8 distinct sleep stages: UNKNOWN, AWAKE, SLEEPING, OUT_OF_BED, AWAKE_IN_BED, LIGHT, DEEP, REM… Writing sleep stages is optional." `SleepSessionRecord` has two parts: "The overall session, spanning the entire duration of sleep" and individual stages. Records require startTime and endTime. — [Android Developers: Track sleep sessions](https://developer.android.com/health-and-fitness/health-connect/features/sleep-sessions)
- **Report's claim that records are stored only after the session:** CONFIRMED as an inference from the model, since a record needs an end time. The page does not say so in those words.
- **Samsung:** the report's claim that Samsung creates sleep data only after waking (Samsung developer blog) was not re-fetched.

### Inferences
- The iOS path for adaptive overnight cues is still: user-started audible soundscape (`audio` mode) with cues mixed in, plus AlarmKit for hard-wake WBTB alarms.
  - AlarmKit is a poor fit for "gentle" cues. Apple says it is meant for wake-up alarms and timers, and it presents full alarm UI.
  - LDAlarm uses real alarms only for waking signals. That it uses a different path for its gentle signals is an inference.
- **Apple Watch:** the Smart-alarm session gives only 30 minutes of background runtime, scheduled once per night. Running a custom classifier all night would need a different mechanism, e.g. a workout session, with App Review and battery risk.
  - Lucidly's 270-minute cap and how Lucid Wake's planned watchOS version runs overnight are not explained by the documented session types. This needs investigation before committing to a watch architecture.
- **Android:** a user-started `mediaPlayback` FGS playing an audible soundscape, plus `SCHEDULE_EXACT_ALARM` (user-granted) for WBTB, is the policy-safe combination. `USE_EXACT_ALARM` is defensible only if the app is genuinely an alarm app.

### Gaps
- Apple Developer Forums (thread 804512 and others) could not be re-fetched because of the bot challenge.
- No official Apple statement was found that explicitly bans silent audio. Only the general 2.5.4 and background-mode text exists.
- Doze/App Standby specifics for exact alarms (`setExactAndAllowWhileIdle` throttling) were not re-fetched.
- There is no official doc on whether a watchOS app can legitimately run all night for sleep sensing (`HKWorkoutSession` overnight).

## Q4. How do Sleep as Android, Oniri and Lucid Scribe (and peers) implement night cues?

### Takeaway
- **Sleep as Android:** the only mainstream app that triggers cues from a (phone or wearable) actigraphy-based REM estimate. It has tunable Sensitivity and a "Later" delay, and routes vibration to the wearable.
- **Oniri:** cues are **schedule-based**. The user sets cue times as offsets from sleep onset (UI shows 2.5 h, 4 h, 5 h, 6 h), a sound (bell or a ~30 s self-recorded voice message), volume and a ramp (increase/stable/decrease). Auto-stopping night alarms are "timed to your sleep cycles".
- **Lucid Scribe:** mostly **scheduled media-channel playback** ("Deep Playlist" TLR in the early morning hours; "REM Lights" scheduled audio and light), a FILD inactivity timer, and optional **real-time REM detection only with the vendor's INSPEC night-vision camera**.

### Cited Findings

**Sleep as Android**
- **Mechanism:** "Sleep as Android tracks movement and sleep patterns to estimate your sleep cycles and identify REM phases… Once REM sleep is detected, the app plays a familiar audio cue, gentle vibration, or light flashes."
  - Settings → Sleep tracking → Lucid dreaming. Light cues need a Smartlight, Sleep Phaser or Sleep Mask.
  - Options: Sensitivity ("how quickly or strictly cues trigger based on sleep phase progression"), Later ("Delays the first cue after REM is detected"), Ringtone (default "A soft voice saying 'You are dreaming'"), Vibrate ("If a wearable is paired, vibrations are sent only to your wrist"), Volume, Force Headphones Only, Repeat.
  - Source: [SaA docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html)
- **Troubleshooting FAQ:** "Ensure the app is in your DND exception list", watch Bedtime/Theater modes block vibrations, and for cues that wake you "Reduce the volume slider or lower the repetition frequency… Try using wearable vibration instead of audio cues." — [SaA LD FAQ](https://sleep.urbandroid.org/docs/faqs/lucid_dreaming_faq.html)
- **Accuracy:** on the movement-to-phase mapping the vendor says "Light sleep corresponds to REM, N1, and partly N2… Any attempt to pinpoint the exact beginning of a sleep phase is subject to a high degree of error and guesswork." The developer forum confirms cues "towards the end of the deep sleep phases" and false positives. — [SaA sleep tracking theory](https://sleep.urbandroid.org/docs/sleep/sleep_tracking_theory.html); [Urbandroid forum](https://forum.urbandroid.org/t/lucid-dreaming-sleep-as-android/4691)

**Oniri**
- **Audio Cues ("Play sounds during the night to induce a lucid dream"):** the configurator shows "Occurrences 2.5h 4h 5h 6h", sound "Bell", "Voice Recording: Record an alarm with your voice, telling yourself that you are dreaming… about 30s long", "Volume 80%" with "Increase / Stable / Decrease", and "Test Schedule". — [oniri.io/lucid-dreams](https://www.oniri.io/lucid-dreams)
- **Other features:** "Night alarms: Auto-stopping alarms timed to your sleep cycles, when lucid dreams are most likely". "Repeated sounds: Gentle sound cues repeated through the night". "Conditioning: Train yourself to recognize sounds in your dreams". "Anchor Technique". The App Store listing says premium sounds are used "as lucidity triggers during the night". — [oniri.io/lucid-dreams](https://www.oniri.io/lucid-dreams); [App Store](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914)
- **No sensing:** no sensor or REM detection is mentioned anywhere on the Oniri site or listings. Inference: purely time-based.

**Lucid Scribe (lucidcode)**
- **TLR Deep Playlist:** "Plays custom audio tracks during the early hours of the morning over the media channel. Works with Bluetooth headsets and headbands… Associate the audio track with a lucid state during the day." — [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169)
- **REM Lights:** "plays scheduled audio cues and light prompts during the night". — [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169)
- **DILD:** "Smart scheduling with sound cues and dream prompts during REM or after a delay. Supports silent vibration on smartwatches." — [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169)
- **FILD:** "gently tap to reset the timer… hear the audio track that plays when the timer runs out". The FILD detector can trigger TDI. — [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169)
- **INSPEC:** "Connect the INSPEC… via Bluetooth for real-time REM sleep detection using machine vision… configure LED flash sequences, audio cues, and vibration alerts triggered during REM." — [App Store](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169)
- **Developer's site:** "a deep playlist that plays custom audio tracks over the media channel when the phone is on silent and in power save mode". — [lucidcode.com](https://www.lucidcode.com/)
- **Developer on Reddit:** "auto-off alarms with options for custom MP3s that play over the media channel and keep Bluetooth headphones active overnight" and "It can also vibrate smartwatches at night in DND mode". The iOS version "only uses the watch for optional vibration cues and uses machine vision for detection". — [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1gvb88l/_/ly0l91y/); [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1jwsdud/_/mmpcax2/); [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1oxlt37/_/np4pd4a/)

**Peers, for contrast**
- **Lucyd:** time-window plus volume-ramped replay "during the REM-rich part of the night" after "Pre-Sleep Mode on your nightstand". — [App Store](https://apps.apple.com/us/app/lucyd-lucid-dream-on-command/id6787179501)
- **LDAlarm:** a fixed 6:15 h first signal, then gentle signals at even intervals. — [App Store](https://apps.apple.com/us/app/ldalarm-lucid-dream-alarm/id6813238351)
- **Lucid Wake:** HR/RMSSD thresholds on Wear OS. — [Google Play](https://play.google.com/store/apps/details?id=com.vigilwave.lucidwake)
- **Everdream:** "measure sleep stages and ring an alarm during your REM sleep that will turn off automatically". — [App Store](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)
- **Awoken:** "low audio cues… playing a special Totem Sound". — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)
- **Somni Mask:** IR eye-movement detection on the mask, with the phone playing the sound. — [App Store](https://apps.apple.com/us/app/somni-mask-lucid-dreaming/id6814533249)

### Inferences
- The two most popular cue implementations are opposites. Oniri uses fixed clock offsets with no sensing. Sleep as Android uses a movement-based REM guess.
- The published TLR evidence (Paller/MIT ~10–15% per night, unfamiliar sound ≈ no sound) suggests a fixed-schedule, volume-ramped, pre-trained cue (Oniri, Lucyd, Lucid Scribe style) is not obviously worse than noisy sensor timing.
- Lucid Scribe's "media channel" design is the practical answer to Android DND and silent mode. It is also the iOS answer, since on iOS cues must be audible media within an active audio session.
- Lucid Scribe's iOS background method for its Deep Playlist was not documented. That it relies on an active audio session is an inference.

### Gaps
- The cue implementations of Lucid Now and Everdream (which sensor, if any, and how the app stays alive on iOS) are not documented in their listings.
- Oniri's background execution method on iOS (continuous audio session vs. notifications) is undocumented.
- No independent accuracy data exists for any of these apps' REM timing. Ludin's sheet did not load and Lucidly's ">80%" claim comes from the vendor.
