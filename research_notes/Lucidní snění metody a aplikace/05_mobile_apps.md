# Lucid Dreaming (LD) Mobile Apps – Competitive Analysis (as of Oct 2026)

> **Method note for the report writer.** The research environment blocked direct page fetches: App Store, Google Play, developer sites and review blogs all returned DNS or proxy errors. The shared web-search budget also ran out before Reddit-specific and Google Play statistics queries could run. **Every figure below therefore comes from search-engine result snippets/summaries of the cited pages, not from reading the full pages.** Treat store ratings, install counts and prices as approximate snapshots. Where sources disagree, both values are given. Many "best LD apps" roundups are written by competing app makers (Oniri, Oneironauts/Reality Check, Ludin, INSPEC, Elsewhere, Shape). These are flagged as **[vendor]**.

## Q1. Which LD apps exist, what do they do, how do features work, pricing, platforms, ratings, maintenance?

### Takeaway
There is no single dominant LD app. The market splits into four groups:
- **All-in-one trainers:** Oniri, Lucidity (Benz), Shape (iOS only), Lucid Dreamer.
- **Reality-check / journal utilities:** Awoken (Android), Reality Check (iOS), Dream Journal Ultimate, DreamKeeper, Somnium.
- **Night-cue (REM-timed) tools:** Sleep as Android, SleepSpace, the Northwestern "lucid" research app, Lucidly (Apple Watch), Ludin, Everdream/Lucid Waker.
- **AI dream-journal / interpretation apps that touch LD lightly:** Elsewhere, Onyra, LUCIDIA, LucidAI and others.

Freemium with a subscription of about $5–20/month or $40–80/year is the norm. A few apps are still free or charge once.

### Comparison table (snapshot; verify before publishing)

| App (developer) | Platforms | Model / price | Rating (reviews) | Installs | Last update / status | LD core |
|---|---|---|---|---|---|---|
| **Oniri** (Oniri, France/Geneva) | iOS + Android | Freemium; Premium $7.99/mo, $47.99/yr | 4.6 (~7,075 ratings, per Oniri's own page) | n/a | Active; Android reportedly rebuilt to iOS parity in mid-2026 | Journal, RC reminders (interval or random), widgets, sleep-cycle-timed night audio cues (own voice), MILD/WILD/SSILD guides, binaural beats, AI interpretation and images |
| **Lucidity: Lucid Dream Journal** (Christopher Benz, `ch.b3nz.lucidity`) | Android + iOS (iOS id6505020545) | Freemium; Pro $4.99/wk, $12.99/mo, $49.99/yr, $119.99 lifetime (iOS); ads on free Android | Google Play 4.7 (7,163, cited by Oniri); iOS 4.6 (11 ratings) | Old WOLD snapshot 10k–50k (outdated) | Active | Journal (voice, tags, mood, lucid flag), PIN/biometric lock, RC reminders, practice screens for WBTB/WILD/MILD/SSILD, 7-day course, Learn Center, AI interpretation (Pro). No overnight audio cues |
| **Lucidity – Lucid Dreaming** (Shane Curtis, iOS id1121048340) | iOS | Free + PRO | n/a | n/a | Older app, status unclear | Journal, reminders, "touch-less" alarm (WBTB) |
| **Shape: Lucid Dreaming** (Timeless LLC, id1577026266) | iOS only (iOS 17+) | Freemium; $19.99/mo or $79.99/yr (older copy: $9.99/mo, $39.99/yr) | 4.7 (~1.6–1.7K, US) | n/a | Active | "Learn in 30 days" coach, audio guides, "Am I Dreaming" reminders, Apple Health sleep read/write |
| **Awoken** (Andreas Rudolph, `com.lucid_dreaming.awoken`) | Android only | Free with ads; $4.99 one-time removes ads | ~4.5 (old WOLD snapshot) | 1M+ (APKCombo mirror) | Last update Jul/Aug 2024. **Stalled** | Random RC notifications, "Totem Sound" by day plus overnight "Dream Clues" audio, journal, PIN, speech-to-text, dream-pattern word analysis, achievements, cloud backup |
| **Dream Journal Ultimate** (dreamcapsule / dreamjournal.co) | iOS + Android | Free journal; paid extras ($2.99 once or $4.99/mo, conflicting); "Dream Companion" AI chat $2.99 | iOS 4.47 (565); Google Play 4.3 (1,103) | n/a | Active (release 2026.2.24 added voice transcription) | Unlimited free entries, RC reminders, lucid lessons, community, voice (reported unreliable) |
| **Lucid Dreamer** (guardanus) | iOS + Android | Free + Pro (one-time $6.99 per download site; others say subscription) | ~4.0 (old WOLD) | 100k–500k (old WOLD) | Latest seen v3.3.3, ~2022. **Likely stale** | RC (up to 150 or 287/day), night audio/visual cues, custom sounds, binaural beats, "Paralyzer" mode for WILD |
| **Reality Check: Lucid Dreams** (Oneironaut LLC, id6755739747) | iOS only (iOS 26+) | Free (per vendor) | n/a | n/a | New (2025–26) | Smart RC scheduling between wake and sleep, 50+ non-repeating prompts, dream log and stats, privacy |
| **Sleep as Android** (Urbandroid) | Android (+ wearables) | Freemium sleep tracker | n/a | n/a | Active | Lucid cues (sound, vibration, light) 10/20/30 min after a detected light phase |
| **SleepSpace** (id1193763939) | iOS (+Android?) | n/a | n/a | n/a | Active | Predicts dream periods from movement; plays a rain-storm cue |
| **"lucid"** (Paller lab, Northwestern) | Android only | Free (research) | n/a | n/a | Research app | Pre-sleep training plus sound cue during sleep (TLR) |
| **Lucidly** (id1566419183) | iOS + Apple Watch required | 7-day trial, $5.99/mo, $39.99/yr (2024 snapshot) | n/a | n/a | Status unclear | Neural-net REM inference from watch data, vibration/sound alerts, hypnagogic haptics mode, session charts |
| **Ludin** (ludin.app) | Phone only | n/a | n/a | n/a | Launched 1 Oct 2026 | On-device accelerometer REM model, light cue |
| **Somnium** (id6470462666) | iOS | Free + Premium (interpretation, visualization) | n/a | n/a | n/a | RC reminders, offline WBTB/MILD guides, voice journal, 100% offline |
| **DreamKeeper** (ScorpionDev, id530958563) | iPhone | Free | n/a | n/a | Last update Nov 2023 | Journal only (tags, search, passcode, Dropbox, PDF export) |
| **LucidMe** (REMspace, formerly "Phaser: Lucid Dreaming Tools", id907469483) | iOS (+mask) | Free app; mask $245 | n/a | n/a | PRO mask preorders pulled Aug 2026 | Journal, symbols, friends, mask companion |
| **Elsewhere** (id6445864345) | iOS + Android | Free + IAP | n/a | n/a | Active | AI journal: auto-tags, Fontana symbols, AI images, 30+ languages. No LD tools found |
| **MILD Trainer** (Nathan Woolmore, id1530667456) | iPhone | $3.99 | n/a | n/a | n/a | Daily list of "events" that trigger prospective-memory RCs |
| **Dreamu** (`com.casuapp.dreamu`) | Android | n/a | n/a | n/a | v1.0, 31 Aug 2026 (new) | Levels 0–12 (MILD/WBTB/SSILD/WILD), AI interpretation (beta) |
| **Lucidly: AI Dream Journal** (mindyapps, `com.mindyapps.lucidlynew`) | Android | n/a | n/a | n/a | New | AI LD "mentor", free 6-lesson "first lucid dream" course |
| **Everdream – Lucid Dream Alarm** (id1553743004) | iOS | n/a | n/a | n/a | n/a | Second "in-dream" alarm after WBTB; drains battery |
| **WorldWithin** (id1546635635) | iOS | Free + IAP | n/a | n/a | Last update Jul 2022. **Abandoned** | RC reminders with a time window, journal |

### Cited findings – per app

**Oniri** (iOS + Android)
- The App Store listing describes monthly and yearly subscriptions unlocking all features. Shown prices are $7.99/month and $47.99/year (may vary by region). In 2023 NextPit said WILD/MILD/SSILD guidance needed the paid plan while reality-check (RC) reminders were free. — [App Store (UK)](https://apps.apple.com/gb/app/oniri-your-dream-journal/id968737914); [NextPit 2023](https://nextpit.com/apps-of-the-week-18-2023); [AlternativeTo](https://alternativeto.net/software/oniri/about)
- RC mechanics: reminders through the day at a chosen interval, or on "random frequency". Home-screen widgets are also offered; Oniri's own claim to be the "only" app with them is unverified. — [Medium review (by Elsewhere team) [vendor]](https://medium.com/@elsewheredreams/best-dream-journal-apps-of-2025-fb7f800371b8); [World of Lucid Dreaming review](https://www.world-of-lucid-dreaming.com/oniri-app-review.html)
- Night audio cues are set to ring during REM / sleep cycles and work best with your own recorded voice. I found no independent test of the timing accuracy. The cues are premium. — [WOLD Oniri review](https://www.world-of-lucid-dreaming.com/oniri-app-review.html); [Oniri LD page [vendor]](https://www.oniri.io/lucid-dreams)
- Behind the paywall: statistics, AI interpretation, AI image generation, voice recording, alarms and audio guides. — [Medium review](https://medium.com/@elsewheredreams/best-dream-journal-apps-of-2025-fb7f800371b8); [Google Play listing](https://play.google.com/store/apps/details?id=io.oniri.oniriapp&hl=en_IN)
- Rating: 4.6 with about 7,075 ratings, according to Oniri's own page. — [Oniri](https://www.oniri.io/lucid-dreams)
- A 2026 review says the Android app was rebuilt from scratch in mid-2026 to reach iOS parity. Other 2026 features: dream goals and binaural beats. — [Oniri best apps 2026 [vendor]](https://www.oniri.io/post/best-lucid-dreaming-apps)

**Lucidity (Christopher Benz, `ch.b3nz.lucidity`)**
- Journal: entries can be written or voice-recorded, searched by symbol, mood, lucid tag or date, and locked with PIN or biometrics. Storage is local or personal-cloud sync. — [Google Play](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity&hl=en_US)
- Technique practice screens for WBTB/WILD/MILD/SSILD, RC reminders, and a Learn Center on LD, REM, recall and nightmares. — [Google Play](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity&hl=en_US)
- iOS in-app prices: Pro Weekly $4.99, Monthly $12.99, Yearly $49.99, Lifetime $119.99. iOS rating 4.6 from 11 ratings. — [App Store id6505020545](https://apps.apple.com/us/app/lucidity-lucid-dream-journal/id6505020545)
- Oniri **[vendor]** cites Google Play 4.7 (7,163 ratings) and a 7-day trial. It praises the course's SSILD timer as "the best implementation of that technique we found in any app". Its criticisms: SSILD unlocks only several days into the 7-day course, there are no audio cues during sleep, and AI is "the only thing Pro buys". — [Oniri 2026](https://www.oniri.io/post/best-lucid-dreaming-apps)
- Other reviewers: the Android version shows ads ([Ovinchi](https://ovinchi.com/en/blog/best-dream-interpretation-apps)); "many premium features require expensive subscription" ([Oneironauts [vendor]](https://oneironauts.io/blog/best-reality-check-apps)).
- Pro contents differ between listings: "remove ads + analytics" vs "unlimited dream analysis". — [Google Play](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity&hl=en_CA)
- An older WOLD snapshot shows 10k–50k downloads and a 4.3 rating, now clearly outdated. — [WOLD Lucidity for Android](https://www.world-of-lucid-dreaming.com/lucidity-app-for-android.html)

**Lucidity – Lucid Dreaming (Shane Curtis, iOS)**
- This is a different iOS app with the same name: free with a PRO upgrade. — [App Store id1121048340](https://apps.apple.com/us/app/lucidity-lucid-dreaming/id1121048340); [WOLD dev story](https://www.world-of-lucid-dreaming.com/lucidity-app-curtis-development.html)
- Its "touch-less" alarm auto-sets to the next day if set between 7pm and midnight. That design caused many "alarm didn't go off" 1-star reviews. — [App Store](https://apps.apple.com/us/app/lucidity-lucid-dreaming/id1121048340); [JustUseApp reviews](https://justuseapp.com/en/app/1121048340/lucidity-lucid-dreaming/reviews)

**Shape: Lucid Dreaming (Timeless LLC, iOS only)**
- Pitch: "Learn to lucid dream in 30 days with the ultimate lucid dreaming coach". Premium unlocks unlimited journal entries and all audio guides. It reads and writes Apple Health sleep data "to identify dreamtime". Requires iOS 17+. — [App Store](https://apps.apple.com/app/id1577026266); [AppBrain](https://www.appbrain.com/appstore/shape-lucid-dreaming/ios-1577026266)
- Price: currently $19.99/month or $79.99/year; older App Store text says $9.99/month or $39.99/year after a 7-day trial. One reviewer reports being shown $39.99/year but charged $79.99. — [mylifenote comparison](https://blog.mylifenote.ai/best-dream-journal-apps/); [Oniri 2026 [vendor]](https://www.oniri.io/post/best-lucid-dreaming-apps)
- Rating: 4.7 (about 1.6K ratings; 1,729 in the US). — [App Store](https://apps.apple.com/app/id1577026266); [mylifenote](https://blog.mylifenote.ai/best-dream-journal-apps/)
- Oniri **[vendor]** calls Shape "the app that costs the most, does the least" ($79.99). It also says Shape is good for audio guidance but thin elsewhere. — [Oniri 2026](https://www.oniri.io/post/best-lucid-dreaming-apps)

**Awoken (Android only)**
- Features: random daytime RC notifications ("Am I dreaming?") with adjustable frequency, plus a "Totem Sound" (any phone sound used as the RC trigger). "Dream Clues" play the same totem sound at night to cue lucidity. — [MakeUseOf](https://www.makeuseof.com/best-android-apps-lucid-dreaming/); [Subtle Realm review](https://www.subtlerealm.org/review/michael-c-willis/awoken-app-tool-help-induce-lucid-dreaming)
- Also: a silent morning notification to start recall, continuous speech-to-text, a dream-pattern list of the most common words, dream-sign tracking, PIN, achievements and optional cloud backup. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken&hl=en_US); [APKCombo](https://apkcombo.com/awoken/com.lucid_dreaming.awoken/)
- Installs and status: 1,000,000+ installs, last update 3 Aug 2024, developer Andreas Rudolph (per an APKCombo mirror). Oniri says it has been stalled since July 2024, with no export and a cloud backup that failed in testing. — [APKCombo](https://apkcombo.com/awoken/com.lucid_dreaming.awoken/); [Oniri [vendor]](https://www.oniri.io/post/best-lucid-dreaming-apps)
- Price: free with ads, $4.99 one-time to remove ads. — [review via search summary](https://oneironauts.io/blog/best-reality-check-apps)
- User reviews are mixed: "totem does not work" and "reality checks and totem alarms never seem to work consistently" sit alongside praise for the journal and improved recall. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken&hl=en_US)
- Oneironauts **[vendor]** ranks it the #2 RC app and "the most popular and well-developed reality checking app for Android". — [Oneironauts](https://oneironauts.io/blog/best-reality-check-apps)

**Dream Journal Ultimate (iOS + Android)**
- The 2026.2.24 release added voice recording with automatic transcription. Oniri's testing got "We didn't catch anything" on every attempt. — [App Store](https://apps.apple.com/us/app/dream-journal-ultimate/id802558054); [Oniri journaling 2026 [vendor]](https://www.oniri.io/post/best-lucid-dream-journaling-apps-for-2024)
- Free tier: unlimited dreams and customizable RC reminders, with community features, lucid lessons and a "Dream Companion" chat ($2.99). — [mylifenote](https://blog.mylifenote.ai/best-dream-journal-apps/); [App Store](https://apps.apple.com/app/id802558054)
- Price conflict: "$2.99 once" ([Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps)) vs "Free / $4.99/month" ([Oneironauts](https://oneironauts.io/blog/best-dream-journal-apps)).
- Ratings: iOS 4.47 (565) per [mylifenote](https://blog.mylifenote.ai/best-dream-journal-apps/); Google Play 4.3 (1,103) per [Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps).
- Dream signs: one source describes automatic detection; Oniri says it has only tags and notes, so dream signs "never surface". — [Oniri journaling](https://www.oniri.io/post/best-lucid-dream-journaling-apps-for-2024)

**Lucid Dreamer (guardanus)**
- Plays audio and/or visual cues during sleep cycles. Users can supply their own sounds, binaural beats or recorded voice. — [CafeBazaar listing](https://cafebazaar.ir/app/guardanus.dreamer?l=en)
- "Paralyzer" mode targets the sleep-paralysis transition for WILD; a reviewer calls it advanced. RC reminders go up to 287/day per one source, 150 per another. — [Mattress Miracle](https://mattressmiracle.ca/blogs/mattress-miracle-blog/best-lucid-dreaming-app); [SaaSDiscovery](https://saasdiscovery.com/lucid-dreamer/)
- Pro is a $6.99 one-time upgrade per a download site. Latest versions seen are 3.3.0–3.3.3; the CafeBazaar entry dates to ~April/May 2022. — [UpdateStar](https://lucid-dreamer.updatestar.com/); [CafeBazaar](https://cafebazaar.ir/app/guardanus.dreamer)
- WOLD (developer-written page): 100k–500k downloads, about 4 stars. — [WOLD](https://www.world-of-lucid-dreaming.com/lucid-dreamer-app.html)

**Reality Check: Lucid Dreams (Oneironaut LLC, iOS)**
- Smart scheduling between wake and sleep times, customizable frequency, notification sounds, dream logging and stats. Requires iOS 26+. — [App Store](https://apps.apple.com/app/id6755739747)
- The vendor's own blog ranks it #1 and cites 50+ anti-repetition prompts and full privacy. — [Oneironauts [vendor]](https://oneironauts.io/reality-check)

**Sleep as Android (Urbandroid)**
- The docs admit REM can't be identified directly from movement. Instead the app fires cues (sound, gentle vibration or light flash) 10, 20 and optionally 30 minutes after a light phase starts.
- The developers' simulation gives about a **50% chance** that a cue lands in REM. False positives are expected, and users report cues firing while awake.
- Source: [Sleep as Android docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html)

**SleepSpace**
- Predicts likely dream periods from body movement and sleep duration and plays a "calming rain storm sound" as the cue. The same technology is pitched for targeted memory reactivation (TMR). The App Store lists a "Lucid Dreamer" feature. — [SleepSpace](https://sleepspace.com/dream-enhancement/); [App Store](https://apps.apple.com/vc/app/sleepspace-tracker-coach/id1193763939)

**Lucidly (Apple Watch)**
- Needs a paired Apple Watch. A neural network infers REM in-session and triggers vibration or sound. Claimed overall accuracy is ">80%", with the caveat that it is "an approximation".
- Two modes: Inference, and Hypnagogic (periodic haptics for WILD). Supports WILD, WBTB, DEILD and DILD, shows per-session charts, needs no registration.
- 2024 pricing: 7-day trial, $5.99/month, $39.99/year.
- Reviewers complain of a 270-minute session cap.
- G2 shows 0 reviews.
- Sources: [App Store](https://apps.apple.com/us/app/lucidly/id1566419183); [mwm.ai](https://mwm.ai/apps/lucidly/1566419183); [G2](https://www.g2.com/products/lucidlyapp/discuss)
- Note: a different Android app, "Lucidly: AI Dream Journal" (mindyapps), shares the name. — [Google Play](https://play.google.com/store/apps/details?id=com.mindyapps.lucidlynew&hl=en_US)

**Ludin (new, phone-only)**
- An on-device model reads the accelerometer while the phone lies on the mattress, estimates REM onset and fires a light cue. The vendor says it will publish accuracy on a live page and that the model personalizes over time.
- Self-reported result: the median of its first 25 testers found 45% of remembered dreams became lucid. This is unverified.
- Launch date: 1 Oct 2026.
- Sources: [Ludin [vendor]](http://ludin.app/); [Ludin – can your phone detect REM](https://ludin.app/learn/can-your-phone-detect-rem)

**Somnium**
- Free with IAP. RC reminders, offline WBTB/MILD guides, LD progress tracking, one-tap voice journal with offline speech-to-text, "100% offline". Premium adds interpretation and visualization. — [App Store](https://apps.apple.com/us/app/-/id6470462666)

**DreamKeeper (ScorpionDev)**
- iPhone, free. Journal only: tags, search, passcode, Dropbox backup, text/PDF export. Released Aug 2012, last updated Nov 2023, no LD tools. — [App Store](https://apps.apple.com/app/id530958563); [AppGoblin](https://appgoblin.info/apps/530958563)

**LucidMe (REMspace / Michael Raduga)**
- The App Store listing (URL slug "phaser-lucid-dreaming-tools") offers a free journal, symbol insights, friend sharing and a sleep tracker that works with the LucidMe mask. — [App Store](https://apps.apple.com/us/app/phaser-lucid-dreaming-tools/id907469483)
- The mask launched July 2025 at $245, with induction at sleep onset, in REM and on awakening. — [BusinessWire](https://www.businesswire.com/news/home/20250709051233/en/REMspace-Launches-LucidMe-A-Breakthrough-Smart-Sleep-Mask-With-AI-Powered-Sleep-Snoring-and-Dream-Features)
- The LucidMe PRO EEG mask is listed as "Shipping now" at $79.99 by WOLD. INSPEC **[competitor]** says that in Aug 2026 REMspace pulled PRO preorders over circuit-board issues. — [WOLD devices 2026](https://www.world-of-lucid-dreaming.com/best-lucid-dreaming-devices-2026.html); [INSPEC](https://www.inspec.me/lucid-dreaming-devices-compared)

**Elsewhere**
- iOS + Android, free + IAP. Write or speak an entry; AI auto-tags characters, settings and themes; symbol meanings come from David Fontana; generates an image per dream; charts and search; 30+ languages. I found no LD-specific tools.
- Promoted by dream researcher Kelly Bulkeley's blog (developer-affiliated commentary).
- Sources: [App Store](https://apps.apple.com/app/id6445864345); [bulkeley.org](https://bulkeley.org/the-elsewhere-dream-journaling-app/)

**MILD Trainer (Nathan Woolmore)**
- $3.99 iPhone app. Each morning you set everyday "events" that serve as prospective-memory triggers for RCs, in LaBerge's MILD logic. — [App Store](https://apps.apple.com/app/id1530667456)

**Other / long tail** (listings only, details unverified)
- **Lucid Reality** (iOS): REM-timed RCs that need an Apple Watch or a wearable writing to Health. — [App Store](https://apps.apple.com/us/app/lucid-reality/id1417122335)
- **Everdream – Lucid Dream Alarm** (iOS): a second in-dream alarm. A reviewer notes it warns of about 50% battery drain unless plugged in, and that the alarm is quiet. — [App Store](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)
- **Lucid Waker** (alarm app). — [AlternativeTo](https://alternativeto.net/software/lucid-waker-lucid-dream-alarm/about)
- **DreamKnock** (Apple Watch; heart rate plus wrist stillness; Product Hunt only). — [Hunted](https://www.hunted.space/product/dreamknock)
- **Volonte** (Apple Watch, $0.99). — [mwm.ai](https://mwm.ai/apps/volonte/1538260624)
- **Dreamu** (Android, v1.0 Aug 2026, levels 0–12). — [Google Play](https://play.google.com/store/apps/details?id=com.casuapp.dreamu&hl=en_SG)
- **Onyra**. — [App Store](https://apps.apple.com/app/id/6753615481)
- **LucidAI – Dream Visualizer**. — [App Store](https://apps.apple.com/lc/app/lucidai-dream-visualizer/id6744613038)
- **Lucid Scribe**. — [App Store](https://apps.apple.com/us/app/-/id6755086169)
- **Dream Lucid**. — [App Store](https://apps.apple.com/us/app/dream-lucid/id6449860447)
- **Lucid Dreaming: Awakening**. — [App Store](https://apps.apple.com/app/id6754253351)
- **Lucid Dreaming – DreamTotem**. — [App Store](https://apps.apple.com/us/app/id6745737025)
- **Dream Catcher: Lucid Journal**. — [App Store](https://apps.apple.com/us/app/-/id6444252682)
- **Dream Journal & Lucid Dreaming**. — [App Store](https://apps.apple.com/us/app/-/id1571288163)
- **Lucid Dream Journal – DreamLog** (Android, 10k+ installs). — [AppBrain](https://www.appbrain.com/dev/Lucid+Dream+%26+Sleep+Tracker+Apps/)
- **Lucid Dreaming Journal and Tools** (Product Hunt). — [Product Hunt](https://www.producthunt.com/products/lucid-dreaming-journal-and-tools-app)
- **Dream Signs** (iOS, a 2010 listing). — [AppSpy](https://www.appspy.com/app/402363/dream-signs)
- **WorldWithin**: last updated 8 July 2022, so treat as abandoned. — [App Store](https://apps.apple.com/app/id1546635635); [summary via Oneironauts](https://oneironauts.io/blog/best-reality-check-apps)

**Hardware with companion apps** (context for cue-based competition)
- **Remee**: timer-based LED mask that does not detect REM; mixed reviews, some about awakenings. — [WOLD devices](https://www.world-of-lucid-dreaming.com/best-lucid-dreaming-devices-2026.html); [howtolucid](https://howtolucid.com/lucid-dreaming-masks-compared/)
- **INSPEC**: €300, claims to be the only REM-detecting device buyable new as of Sept 2026 **[vendor]**. — [INSPEC](https://www.inspec.me/lucid-dreaming-devices-compared)
- **SmartLucider**: successor to the REM Dreamer. — [WOLD](https://www.world-of-lucid-dreaming.com/rem-dreamer.html)
- **Somni Mask Pro**: infrared eye-movement sensing. — [BackerBuzz](https://www.backerbuzz.com/post/somni-mask-pro-rem-triggered-cues-for-lucid-dreaming)
- **Prophetic**: "Halo" pivoted to the Dual ($449, Batch 1 sold out, ships end 2026; Batch 2 early 2027) and the Phase ($1,299, 2027). Both use transcranial focused ultrasound. No peer-reviewed studies yet. The companion app syncs data and tracks LDs. — [Prophetic](https://www.prophetic.com/halo); [NeuroFounders](https://www.neurofounders.co/articles/prophetic-announces-a-dream-inducing-ultrasound-headband); [Live Science](https://livescience.com/technology/virtual-reality/ultrasonic-headband-induces-lucid-dreams-using-ai-its-creators-claim-but-an-expert-remains-skeptical)

**Requested names that could not be verified as LD apps**
- **"LUCI"**: no app found. Close matches are Lucidly, LUCIDIA and LucidAI. — [search summary incl. App Store links](https://apps.apple.com/app/id1566419183)
- **"Somnio"**: "somnio – sleep coach" is a German insomnia app for test users, not LD. The LD app is **Somnium**. — [App Store](https://apps.apple.com/app/id1523016446)
- **"Dreamfinity"** and **"Lucid Dream Trainer"** (exact name): no results.
- **"Mindfulness of Dream & Sleep"** (Charlie Morley): no app found. It exists as the book *Dreams of Awakening* (2013), the audio *Lucid Dreaming, Conscious Sleeping* (Audible) and workshops. — [Audible](https://audible.com.au/author/Charlie-Morley/B00ELGDVVO); [Omega](https://www.eomega.org/workshops/teachers/charlie-morley)
- **"Lucid Dreaming Fast Track"**: a web course by Rebecca Casale / WOLD (30 tutorials, 4 audio tools, quizzes, mobile-accessible), not a store app. — [WOLD press release](https://www.world-of-lucid-dreaming.com/lucid-dreaming-fast-track-2014-edition-press-release.html)
- **Lucidity Institute** (LaBerge): no current app found. — [Lucid wiki](https://lucid.fandom.com/wiki/The_Lucidity_Institute?oldid=2448)
- **"Shleep"**: no LD feature found.
- **"Dream Code"** and **"Dreamer"**: not searched in time (budget exhausted).
- **Remee companion "Lucid Dreamer"**: not verified.

### Inferences
- The highest-review-count LD-specific apps are Oniri (~7K ratings) and Lucidity on Google Play (~7K). Awoken has the largest install base (1M+) but is unmaintained since mid-2024, leaving a gap on Android for a free, maintained RC + night-cue app.
- Lucidity has two different iOS apps under one name, plus a new Benz iOS port with only 11 ratings. That suggests the Benz iOS port is recent (an id65… App Store ID implies about 2024) and the brand is confusing.
- Monetization has converged on freemium subscriptions with a 7-day trial. Prices run from about $40/yr (Lucidly, older Shape) to $80/yr (Shape); weekly plans and lifetime tiers (Lucidity $119.99) are appearing. One-time purchase is rare and loved (Dream Journal Ultimate, Awoken ad removal, MILD Trainer).

### Gaps
- No current verified Google Play install ranges for Oniri, Lucidity, Dream Journal Ultimate or Lucid Dreamer, because store pages could not be fetched.
- EUR prices were not captured. Only the INSPEC device is quoted in EUR.
- Exact last-update dates for most iOS apps were not obtained.
- No AppMagic/Sensor Tower revenue or download estimates were found.

## Q2. Which apps have scientific backing or researcher involvement?

### Takeaway
Only one app has peer-reviewed validation of its own protocol: the Northwestern Paller-lab "lucid" Android app (Targeted Lucidity Reactivation, TLR). Oniri claims a collaboration with a Geneva sleep lab and appears in a Geneva master's thesis. REMspace (Raduga) publishes research but its device claims are not independently validated. Everything else is technique-based (MILD/WBTB/RC are evidence-based methods) without app-level trials.

### Cited Findings
- **Paller lab app:** Konkoly, Whitmore, Mallett, Mazurek & Paller (2024), *Consciousness and Cognition*, "Provoking lucid dreams at home with sensory cues paired with pre-sleep cognitive training". It is a smartphone TLR protocol without polysomnography. Pre-sleep training in the app associates a sound with a lucid mindset; the sound is replayed during sleep. — [PubMed](https://pubmed.ncbi.nlm.nih.gov/39278157/); [PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932); [PDF](https://faculty.wcas.northwestern.edu/paller/C&C24.pdf)
- **Experiment 1:** lucid dreams rose from 0.74/week (prior week) to 2.11/week with nightly app use (N=19). — [PsyPost](https://www.psypost.org/lucid-dreaming-app-triples-users-awareness-in-dreams-study-finds/); [Northwestern News](https://news.northwestern.edu/stories/2024/10/study-shows-pre-sleep-training-coupled-with-sensory-cues-can-trigger-lucid-dreaming-2)
- **Experiment 2:** cues were most effective when paired with pre-sleep cognitive training. Sample size is reported as 120 by PsyPost and 416 in another summary; this conflict is unresolved, and possibly enrolled vs analyzed. — [PsyPost](https://www.psypost.org/lucid-dreaming-app-triples-users-awareness-in-dreams-study-finds/); [Neuroscience News](https://neurosciencenews.com/lucid-dreaming-sensory-cues-27941/)
- **Key limitation:** cues often woke people. The app's motion-detection pause fired significantly more after cues than in the no-cue group. The authors suggest wearables for better stage targeting. — [ScienceDirect abstract](https://www.sciencedirect.com/science/article/abs/pii/S1053810024001260)
- **Availability:** the lab offers the app ("lucid") free on Google Play, Android only. Advice: keep the phone plugged in and notifications off. Contact: lucidhelp@gmail.com. — [Paller lab](https://pallerlab.psych.northwestern.edu/dream)
- **Oniri:** its materials say the founder collaborates with the Sleep and Cognition Neuroimaging Laboratory in Geneva. A University of Geneva master's thesis evaluated MILD combined with TLR delivered through the Oniri app; this is not peer-reviewed. — [Oniri [vendor]](https://www.oniri.io/lucid-dreams); [UNIGE archive](https://archive-ouverte.unige.ch/unige:190406)
- **REMspace / LucidMe:** Raduga says he has published peer-reviewed studies. Press notes that some of the claims had only been "submitted" for review. I found no independent validation of the mask. — [Pulse 2.0 interview](https://pulse2.com/remspace-profile-michael-raduga-interview/); [6abc](https://6abc.com/amp/post/startup-remspace-claims-developed-communication-between-people-dreams/15441710/)
- **MILD Trainer:** explicitly built on LaBerge's MILD. — [App Store](https://apps.apple.com/app/id1530667456)
- **Monash:** a research prototype, "LucidEntry Home: an anywhere lucid dream induction prototype", exists. — [Monash research portal](https://research.monash.edu/en/publications/lucientry-home-an-anywhere-lucid-dream-induction-prototype/)
- **Prophetic:** planned a Radboud University trial with 30 lucid dreamers; no peer-reviewed results. — [Daily Beast](https://thedailybeast.com/this-experimental-device-uses-ai-to-help-you-lucid-dream); [Live Science](https://livescience.com/technology/virtual-reality/ultrasonic-headband-induces-lucid-dreams-using-ai-its-creators-claim-but-an-expert-remains-skeptical)
- **Expert comment:** Harvard psychologist Deirdre Barrett said of LD apps "These concepts work", but that the apps sometimes wake people up. — [Vice](https://vice.com/en/article/i-tried-controlling-my-dreams-with-my-iphone-lucid-apps)

### Inferences
- A new app that implements the published TLR protocol (pre-sleep sound-association training plus REM-window cues plus wake-aware pausing) and runs its own outcome tracking would be the most "evidence-based" offering on the market. Doing so cross-platform, particularly on iOS, would beat the Paller app, which is Android-only and research-grade UX.
- Few vendors (only Ludin, with its promised live page) publish their REM-detection accuracy. That transparency is a differentiator.

### Gaps
- I did not find app-level involvement of Aspy (ILDIS) or Erlacher/Stumbrys.
- The Oniri–Geneva thesis outcome numbers were not obtained.

## Q3. Which are best-rated by users and experts? Best overall, best free, best journal, best cue-based, best for beginners

### Takeaway
Reviewers (mostly vendor-authored) converge on these picks:
- **Best overall / all-in-one:** Oniri or Lucidity.
- **Best Android free RC + night cues:** Awoken, though it is stale.
- **Best iOS RC:** Reality Check, which is free.
- **Best value journal:** Dream Journal Ultimate.
- **Best guided audio course:** Shape, iOS only and expensive.
- **Cue-based:** none is proven. Sleep as Android, Lucidly (Apple Watch), the Paller app and the new Ludin are the main options.

Most sources advise combining two or three apps.

### Cited Findings
- **Oniri's 2026 roundup [vendor]:**
  - Lucidity is the pick "for a structured course with guided technique timers".
  - Dream Journal Ultimate is "best value".
  - Shape "costs the most, does the least".
  - Oniri ranks itself "the strongest all-round pick".
  - Source: [Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps)
- **Oneironauts.io [vendor]:** tested 12 apps in 5 categories. It ranks its own Reality Check app #1, Awoken #2 and Lucidity #3 among RC apps. — [Oneironauts LD apps](https://oneironauts.io/blog/best-lucid-dreaming-apps); [RC apps](https://oneironauts.io/blog/best-reality-check-apps)
- **World of Lucid Dreaming apps page:** reviews are developer-written, so promotional. Listed picks: Awoken (Android), Lucid Dreamer (iOS/Android), Lucidity (Android), SHADOW (iOS) and Lucidity iOS by Shane Curtis. — [WOLD](https://www.world-of-lucid-dreaming.com/lucid-dreaming-apps.html)
- **WOLD's separate Oniri review:** calls Oniri "the best dream app on iOS". — [WOLD](https://www.world-of-lucid-dreaming.com/image-files/oniri-app-review.html)
- **Mattress Miracle guide:** Awoken (Android), Shape (iOS) and Lucidity (both platforms) are best for the "two most evidence-based techniques, MILD and dream journaling". It also warns that frequent WBTB fragments sleep. — [Mattress Miracle](https://mattressmiracle.ca/blogs/mattress-miracle-blog/best-lucid-dreaming-app)
- **Other roundups:**
  - Requiem for a Dream (July 2026): [link](https://www.requiemforadream.com/best-apps-for-tracking-your-dreams/)
  - Lunicia: [link](https://lunicia.app/best/lucid-dreaming-apps/)
  - TechWiser: [link](https://techwiser.com/best-lucid-dreaming-app/)
  - Zamnesia: [link](https://www.zamnesia.com/blog-the-best-lucid-dreaming-apps-n1347)
- **Consensus:** no single app does everything well; many lucid dreamers combine two or three apps, typically an RC app plus a journal. — [search synthesis of WOLD/Oniri/Oneironauts](https://www.world-of-lucid-dreaming.com/lucid-dreaming-apps.html)
- **Ludin [vendor] on hardware:** "does it know when you're in REM, or is it firing on a timer?" — [Ludin](https://ludin.app/learn/best-lucid-dream-inducers-2026)

### Inferences (synthesis for the report)
- **Best overall (cross-platform):** Oniri. It has the widest feature set (RC with random intervals and widgets, night audio cues, technique guides, AI), about 7K ratings at 4.6, and active development. The trade-off is a heavy paywall. Runner-up: Lucidity (Benz), for its strong journal and SSILD trainer, but it has no night cues and pricey Pro tiers.
- **Best free:**
  - Android: Awoken (free incl. night cues, but abandoned since 2024) or the Paller lab "lucid" app (free and research-backed).
  - iOS: Reality Check (RC) plus Dream Journal Ultimate or Somnium (journal).
- **Best journal:** Lucidity (free unlimited, tags, lock) or Dream Journal Ultimate (value). Elsewhere, Oniri and Somnium are best for AI or offline-privacy journals.
- **Best cue-based:**
  - Android: Sleep as Android (actigraphy, ~50% REM hit rate admitted).
  - Apple Watch: Lucidly (claims >80%).
  - Research: Paller app (TLR).
  - New: Ludin.
  - None is independently validated except the Paller protocol.
- **Best for beginners:** Lucidity's 7-day course or Shape's 30-day coach (iOS, expensive). Newer leveled programs such as Dreamu (levels 0–12) and Lucidly AI Journal's 6-lesson course are emerging on Android.
- Rankings here rest mostly on vendor blogs, so the report should say so.

### Gaps
- No Reddit r/LucidDreaming "best app" threads could be retrieved: search returned none, then the budget ran out. Community consensus is therefore not independently verified.
- No independent tech-press 2025–26 roundups (e.g., Verge, Wired) were found.

## Q4. Common complaints, gaps and unmet needs (product opportunities)

### Takeaway
The recurring pain points:
- Night cues either wake the user fully or fire at the wrong sleep stage. Phone-only REM detection is weak (Sleep as Android admits about 50%).
- Alarms fail or are too quiet, and phones must stay plugged in.
- Paywalls hide basic features and pricing is opaque.
- Many apps are abandoned, voice transcription is unreliable, and there is no export or backup.
- Users get no feedback loop showing which technique works for them.

### Cited Findings
- **Cues wake users:**
  - In the Northwestern study, app pauses from motion were significantly higher after cues. — [ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1053810024001260)
  - Barrett: apps "sometimes wake people up". — [Vice](https://vice.com/en/article/i-tried-controlling-my-dreams-with-my-iphone-lucid-apps)
  - Remee reviews mention awakenings. — [howtolucid](https://howtolucid.com/lucid-dreaming-masks-compared/)
- **Unreliable REM detection:**
  - Sleep as Android: "not possible to directly identify REM phase from activity data alone"; about a 50% chance a cue lands in REM; cues sound while awake. — [Docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html)
  - Lucidly: REM "an approximation". — [App Store](https://apps.apple.com/us/app/lucidly/id1566419183)
  - Fixed-timer cues mostly land in the wrong stage (vendor opinion). — [Ludin](https://ludin.app/learn/do-lucid-dreaming-apps-work)
- **Alarm failures:** Lucidity (Curtis) users report alarms not going off (due to auto-next-day logic), no tone choice, and sleeping through alarms. — [JustUseApp](https://justuseapp.com/en/app/1121048340/lucidity-lucid-dreaming/reviews); [App Store](https://apps.apple.com/us/app/lucidity-lucid-dreaming/id1121048340)
- **Battery and charging:**
  - Everdream warns of about 50% battery drain if not plugged in, and its alarm is quiet and sounds only once or twice. — [App Store](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)
  - The Paller lab requires the phone plugged in with notifications off. — [Paller lab](https://pallerlab.psych.northwestern.edu/dream)
- **Session limits:** Lucidly sessions are capped at 270 minutes. — [search summary of App Store reviews](https://apps.apple.com/us/app/lucidly/id1566419183)
- **Paywalls and pricing opacity:**
  - Oniri gates stats, AI, voice and audio. — [Medium](https://medium.com/@elsewheredreams/best-dream-journal-apps-of-2025-fb7f800371b8)
  - Shape: price shown vs charged differed ($39.99 vs $79.99). — [Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps)
  - Lucidity: "many premium features require expensive subscription". — [Oneironauts](https://oneironauts.io/blog/best-reality-check-apps)
  - Lucidity Android shows ads. — [Ovinchi](https://ovinchi.com/en/blog/best-dream-interpretation-apps)
- **Abandonment:**
  - Awoken: no update since mid-2024. — [APKCombo](https://apkcombo.com/awoken/com.lucid_dreaming.awoken/)
  - WorldWithin: last updated July 2022. — [Oneironauts](https://oneironauts.io/blog/best-reality-check-apps)
  - Lucid Dreamer: v3.3.3, ~2022. — [CafeBazaar](https://cafebazaar.ir/app/guardanus.dreamer)
  - DreamKeeper: last updated Nov 2023. — [AppGoblin](https://appgoblin.info/apps/530958563)
  - Dream Signs: 2010. — [AppSpy](https://www.appspy.com/app/402363/dream-signs)
- **Reliability bugs:**
  - Awoken: totem and RC notifications inconsistent; cloud backup failed. — [Google Play](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken&hl=en_US); [Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps)
  - Dream Journal Ultimate: voice transcription fails. — [Oniri journaling](https://www.oniri.io/post/best-lucid-dream-journaling-apps-for-2024)
  - Lucidity: a bug lost half-awake notes (later fixed). — [search summary](https://justuseapp.com/en/app/1121048340/lucidity-lucid-dreaming/reviews)
- **Course friction:** Lucidity's SSILD trainer unlocks only after several days of the course. — [Oniri](https://www.oniri.io/post/best-lucid-dreaming-apps)
- **Platform fragmentation:** Shape and Reality Check are iOS-only; Awoken and the Paller app are Android-only; Reality Check requires iOS 26. — [App Store Shape](https://apps.apple.com/app/id1577026266); [App Store Reality Check](https://apps.apple.com/app/id6755739747); [Paller lab](https://pallerlab.psych.northwestern.edu/dream)
- **Hardware unavailability:** LucidMe PRO preorders pulled (Aug 2026), Prophetic delayed to late 2026–2027, Remee doesn't detect REM. — [INSPEC](https://www.inspec.me/lucid-dreaming-devices-compared); [Prophetic](https://www.prophetic.com/halo)
- **Recall prerequisite:** "if you can't yet remember dreams reliably, no device will help you" (vendor advice). — [Ludin](https://ludin.app/learn/best-lucid-dream-inducers-2026)

### Inferences (product opportunities)
1. **Wake-aware cueing.** Cues should start below the audibility threshold and ramp up, stop instantly on motion (Paller-style pause), and adapt their intensity night by night from "did it wake me?" feedback. This directly addresses the #1 complaint.
2. **Honest, validated REM estimation.** Fuse phone actigraphy with optional wearables (Apple Watch, Wear OS, Health Connect / Apple Health). Publish accuracy like Ludin promises. Use time-of-night priors: late REM windows after WBTB are a high-yield, low-tech approach.
3. **TLR-native design.** A pre-sleep training session pairs the cue with an RC/lucid mindset, the same cue is used by day as the "totem" for RC reminders (as in Awoken), and it replays at night. This is the only published-validated app protocol, and it is missing on iOS.
4. **Personal experiment loop.** Morning check-in (recall Y/N, lucid Y/N, woke by cue Y/N), technique tagging (MILD/WBTB/SSILD), per-technique success rates and streaks. No reviewed app clearly offers "what works for you" analytics. Dream-sign auto-extraction from the journal is promised but reportedly weak (Dream Journal Ultimate).
5. **Reliability basics:** guaranteed alarms (iOS critical-alert style, clear next-day logic), battery-safe overnight mode, offline-first storage with export (Awoken lacks export) and E2E-encrypted backup.
6. **Fair monetization.** Users praise one-time purchases. A generous free core (journal, RC, basic cues) with a lifetime option counters the paywall and opaque-pricing backlash seen with Shape and Oniri.
7. **Cross-platform parity from day one**, since the best tools are split by OS.
8. **Maintenance signal.** The market is full of stale apps (Awoken, Lucid Dreamer, WorldWithin, DreamKeeper), so visible active development is a competitive advantage in itself.

### Gaps
- iOS background-audio and notification constraints affecting overnight cues: the search could not be run (budget). This needs separate verification, e.g. whether the app must stay foregrounded with an audio session.
- No quantitative review-mining (e.g., % of 1-star reviews by theme) was possible without store access.
- No Reddit user voice was captured.
