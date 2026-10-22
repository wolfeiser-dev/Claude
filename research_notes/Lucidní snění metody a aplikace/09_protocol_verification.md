# Protocol verification for key lucid dream (LD) induction techniques (gap-fill, state as of Oct 2026)

> **How the sources were checked.** This file adds to `01_evidence_based_techniques.md`. Direct page fetching failed this session for every host tried: frontiersin.org, public-pages-files-2025.frontiersin.org, ncbi/PMC, sci.news, lucidity.com, researchgate, semanticscholar, europepmc, openalex, archive.org, biorxiv, mdpi and reddit. All failed at DNS or proxy level. Every item below therefore rests on **WebSearch result snippets** (about 21 queries).
>
> Tags used:
> - **[V]**: the specific claim appeared in a search snippet attributed to the cited primary or near-primary source.
> - **[V-sec]**: verified only via a secondary source (press, blog or a citing paper).
> - **[UNV]**: still unverified (prior knowledge or community lore).
>
> Snippet-level verification is weaker than reading the full text. Exact verbatim participant instructions from Aspy 2017 and 2020 could **not** be read.

---

## 1. MILD: exact protocol (LaBerge 1980/1990; Aspy 2017/2020)

### Takeaway
The research form of MILD is confirmed at the structural level:
1. Wake from sleep about 5 h after going to bed (WBTB).
2. Recall the dream you just had, or any recent dream if none.
3. Silently and meaningfully repeat the prospective-memory intention, "next time I'm dreaming, I will remember I'm dreaming" (or a variation).
4. Imagine being back in the dream and becoming lucid.
5. Repeat until you fall asleep or the intention is set.

ILDIS participants reported about **13.6 phrase repetitions** on average. The phrase is explicitly *not* a mantra; the meaning of the words matters.

### Cited Findings
- In ILDIS, MILD builds a **prospective memory intention**. The practitioner repeats a phrase along the lines of **"next time I'm dreaming, I will remember I'm dreaming" (or some variation)**, during a brief awakening **after about 5 h of sleep** — [Aspy 2020, ILDIS (ResearchGate copy)](https://www.researchgate.net/publication/343016030_Findings_From_the_International_Lucid_Dream_Induction_Study); [PMC7379166](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V]**
- In ILDIS the practitioner also **imagines themselves in a lucid dream**, i.e. the visualisation step — [sci.news summary of ILDIS](https://www.sci.news/othersciences/psychology/lucid-dream-induction-08653.html) **[V-sec]**
- Adelaide-study version, as relayed by the press:
  1. **Set an alarm for 5 h after going to bed.**
  2. When it sounds, **try to remember a dream from just before waking; if you can't, recall any recent dream.**
  3. Repeat the phrase **silently in your mind, putting real meaning into the words** and focusing on the intention to remember.

  [ScienceAlert on Aspy 2017](https://www.sciencealert.com/science-has-found-a-drug-free-way-to-unlock-the-power-of-lucid-dreaming) **[V-sec]**
- ILDIS logbook item: participants recorded how many times they repeated the MILD phrase after the alarm. The **mean was 13.6 (SD 11.6) repetitions**. The same logbook recorded **4.1 (SD 4.4) reality tests per day** — [ILDIS, PMC7379166](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V, snippet]**
- Success depended on falling asleep fast. In 2017, about 46% success on nights when participants fell asleep **within 5 min** of finishing MILD ([ScienceAlert](https://www.sciencealert.com/science-has-found-a-drug-free-way-to-unlock-the-power-of-lucid-dreaming) [V-sec]). In ILDIS, falling asleep **within 10 min** and better general dream recall predicted success ([ILDIS, ResearchGate](https://www.researchgate.net/publication/343016030_Findings_From_the_International_Lucid_Dream_Induction_Study) [V]).
- The Aspy 2017 paper's own text describes WBTB as "waking up after several hours of sleep (usually five to six hours) and remaining awake for a period of time (from as little as 10 min to more than one hour)". It says WBTB "provides an ideal time to practice the MILD technique" — [Aspy et al. 2017, Semantic Scholar record](https://www.semanticscholar.org/paper/Reality-Testing-and-the-Mnemonic-Induction-of-Lucid-Aspy-Delfabbro/9cb99be433c3b1a9d5c8b5e0b3ab59c80a597dcb); [ResearchGate](https://www.researchgate.net/publication/319855294_Reality_testing_and_the_mnemonic_induction_of_lucid_dreams_Findings_from_the_national_Australian_lucid_dream_induction_study) **[V, snippet]**
- The 2017 RT+WBTB+MILD group went from 9.4% (week 1) to **17.4% of nights lucid (week 2)**. Aspy's thesis summarises: "MILD was shown to be effective … reality testing was not shown to be effective" — [Aspy thesis, Univ. Adelaide](https://digital.library.adelaide.edu.au/items/a20d2a0c-cda2-4b9a-9590-472cd525c93b) **[V]**
- LaBerge's canonical MILD (book form) has four parts: **dream recall**, then (in some versions) **noting dream signs or reality checks**, then the **lucid intention or affirmation**, then **visualising the dream**. The best time is **after awakening from a dream, before returning to sleep**. The primary reference is LaBerge & Rheingold, *Exploring the World of Lucid Dreaming* (1990), around p. 78 — [World of Lucid Dreaming guide](https://www.world-of-lucid-dreaming.com/mnemonic-induction-of-lucid-dreams.html) **[V-sec]**. The phrase "is NOT a mantra and may be worded in any way you find suitable" — [The Lucid Guide](https://www.thelucidguide.com/techniques/mnemonic-induction-of-lucid-dreaming-(mild)) **[V-sec]**
- **Discrepancy warning:** commercial blogs claim "46% success, rising to 54% if asleep within 5 min" for Aspy 2017 ([oneironauts.io](https://oneironauts.io/blog/mild-technique-complete-guide)). This conflicts with the primary press release, which gives **17.4% of nights overall and 45.8% of attempts when asleep within 5 min** ([Adelaide](https://adelaide.edu.au/news/news95682.html), cited in file 01). **Use the primary figures. The "54%" appears to be a blog error.**

### Inferences
- The app's MILD script should do the following:
  - Default the alarm to about 5 h after lights-out, user-adjustable to 4.5–6 h.
  - Prompt the user to recall the dream (with a fallback: "recall any recent dream").
  - Offer an editable intention phrase. The default is "Next time I'm dreaming, I will remember I'm dreaming"; LaBerge's variant is "…I want to remember to recognise that I'm dreaming".
  - Guide a visualisation of re-entering the recalled dream, spotting a dream sign, and becoming lucid.
  - Loop phrase plus visualisation until sleep. About 10–15 repetitions is typical, but it should not be a fixed count.
- Emphasise falling asleep quickly (target ≤10 min) after MILD.

### Gaps
- Verbatim ILDIS/NALDIS participant instruction sheets (supplementary materials) were not readable. Exact wording, visualisation script and minimum awake time in the Aspy protocol remain **unverified**.
- LaBerge 1980 (*Percept Mot Skills* 51:1039) self-study protocol details: **unverified** (no snippet found).
- LaBerge's exact book wording ("Next time I'm dreaming, I want to remember to recognise that I'm dreaming") was **not confirmed** verbatim in any snippet.

---

## 2. SSILD (Senses-Initiated Lucid Dream; CosmicIron)

### Takeaway
**Correction to file 01.** The research versions of SSILD do not match the common "4–6 fast cycles then 3–4 slow cycles of 30 s" community recipe. ILDIS reportedly instructed about **4 fast cycles (2–3 s per sense), then 4–6 slow cycles (about 20 s per sense)**, and told participants **not to count seconds**. The 2024–2026 multi-centre lab study used **fast (2–3 s), then medium (about 20 s), then slow (about 60 s)** cycles. All versions are done after WBTB at about 5 h.

### Cited Findings
- SSILD in ILDIS: wake after **about 5 h of sleep** (as for MILD), then repeatedly shift attention between **visual, auditory and physical sensations** before returning to sleep — [ILDIS, PMC7379166](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V]**
- ILDIS SSILD timing: participants were told to perform **"four fast cycles (2 or 3 s on each step)" and then "four to six slow cycles (approximately 20 s on each step)"**, and **not to count the seconds**. Each cycle has three steps: vision, hearing, body — [ILDIS PDF, Frontiers](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01746/pdf) **[V, from a search-engine summary of the PDF; not read directly. Treat as probable, and confirm before shipping.]**
- The ILDIS questionnaire asked SSILD participants **how many fast and slow cycles they completed**. Participants printed their technique instructions, kept them by the bed and reviewed them nightly — [Frontiers ILDIS](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01746/full) **[V, snippet]**
- Multi-centre lab study (Netherlands, Italy, Canada; N = 60). Participants were guided through SSILD cycles of vision, hearing and touch: **fast (2–3 s), then medium (20 s), then slower (60 s)** cycles. Two morning naps. Preregistered — [bioRxiv 10.1101/2024.06.21.600133 v1](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v1.full.pdf); [v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2) **[V]**
- Community versions: "4–6 quick cycles, then 3–4 slow cycles of 20–30 s per sense", or "up to six slow cycles of 20 s per step" — [Gateway to Lucid Dreaming](https://www.gateway-to-lucid-dreaming.com/ssild.html); [luciddreaming.blog](https://luciddreaming.blog/ssild-lucid-dreaming/); [Orphyx](https://orphyx.com/posts/a-practitioners-guide-to-the-ssild-technique) **[V-sec; community]**. The "4–6" figure is assigned to the *fast* cycles in community guides but to the *slow* cycles in ILDIS.
- Outcome: MILD ≈ SSILD in ILDIS, and the hybrid had no advantage — [ILDIS](https://www.researchgate.net/publication/343016030_Findings_From_the_International_Lucid_Dream_Induction_Study) **[V]**

### Inferences
- App SSILD default ("ILDIS mode"): 4 fast cycles, about 2–3 s per sense (sight → sound → body), then 4–6 slow cycles, about 20 s per sense. Use gentle audio cues instead of on-screen counting, since participants were told not to count. Then let go and sleep. Optional "lab mode": add 60-s slow cycles (multi-centre protocol).
- A guided audio track fits SSILD well, because the multi-centre lab "guided" participants through the cycles.

### Gaps
- CosmicIron's original tutorial (cosmiciron.blogspot / ssild.net) could not be found or fetched. The creator's own cycle counts are **unverified**.
- The exact number of medium and slow cycles in the multi-centre protocol was not visible.

---

## 3. WBTB parameters

### Takeaway
The evidence supports waking about **5–6 h** after sleep onset. 6 h beat 4.5 h in the lab (Erlacher 2022, file 01). A **home study now adds a controlled within-subject comparison**: WBTB (about 6 h) + MILD nights gave **18% LD vs 6% on non-WBTB nights** (Schredl, Dyck & Kühnel 2020). Wake duration: LaBerge's NightLight work and later citing papers put the optimum at **30–60 min, with 10 min less effective**. Aspy's field protocols used shorter awakenings, and the 2017 paper says 10 min to over 1 h is used. WBTB alone without a cognitive technique is null (Klofat 2024, file 01).

### Cited Findings
- **Schredl, Dyck & Kühnel (2020).** "Inducing lucid dreams: the wake-up-back-to-bed technique in the home setting", *Dreaming* 30(4):287–296, doi:10.1037/drm0000152.
  - **N = 50**, 5-week morning dream log.
  - **Once a week**: alarm at **about 6 h after sleep onset**, a brief awake period rehearsing dream elements, then back to bed with the intention to become lucid (WBTB + MILD).
  - **18% LD after WBTB nights vs 6% after non-WBTB nights.**
  - **5 of 10 participants with no prior LDs** had at least one LD in the 5 weeks.

  [Heidelberg library record](https://heibib.ub.uni-heidelberg.de/search/Record/1879821842); [PsyPost](https://www.psypost.org/more-evidence-the-wake-up-back-to-bed-technique-can-help-to-induce-lucid-dreams/) **[V; the design details are from PsyPost, V-sec]**. *This resolves the "18% vs 6%, primary unverified" gap in file 01.*
- **LaBerge, Phillips & Levitan (1994)**, "An hour of wakefulness before morning naps makes lucidity more likely", *NightLight* 6(3) — [lucidity.com page](http://www.lucidity.com/NL63.RU.Naps.html) (exists; content not fetched). Citing papers summarise it as "interruptions of the sleep cycle with **30 to 60 minutes of wakefulness** strongly increase the probability of lucidity". Another summary: it is most effective to use WBTB for **30–120 min**, and **shorter periods such as napping after 10 min were less effective** (a 60 vs 10 min comparison) — [Carr et al. 2020 preprint, Swansea Cronfa](https://cronfa.swan.ac.uk/Record/cronfa53997/Download/53997__17126__f5832f1a79734acb950ae493504c3a2c.pdf); [Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full) **[V-sec: via citing papers; exact NightLight percentages unverified]**
- Erlacher & Stumbrys 2020: "the most effective approach is to use **1 h WBTB** time, during which dreamwork is carried out and MILD is practiced" — [PMC9149976 / Frontiers 01383](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/) **[V]**
- Aspy 2017 definition: waking **usually after 5–6 h**, awake **from as little as 10 min to more than one hour** — [Semantic Scholar](https://www.semanticscholar.org/paper/Reality-Testing-and-the-Mnemonic-Induction-of-Lucid-Aspy-Delfabbro/9cb99be433c3b1a9d5c8b5e0b3ab59c80a597dcb) **[V, snippet]**. The ILDIS awakening is described as "brief", after about 5 h — [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V]**
- Galantamine RCT placebo benchmark (WBTB + MILD): **14% of nights lucid on placebo vs 42% with 8 mg galantamine**, as cited inside ILDIS — [ILDIS, PMC7379166](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7379166/); [LaBerge et al. 2018, PLoS ONE](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0201246) **[V; upgrades file 01's PK tag]**

### Inferences
- There is a trade-off. Lab evidence favours 30–60 min awake. Home field evidence (Aspy) favours falling asleep within 5–10 min after the technique, so the awake time should not drift into insomnia. A sensible app default: wake at 5–6 h; stay awake about 10–30 min (journal plus MILD or SSILD); adjustable up to 60 min for "intensive" nights.
- Schredl 2020 used WBTB **once per week**. This is a low-burden schedule for an app; for example, recommend 1–3 WBTB nights per week to protect sleep.

### Gaps
- Primary NightLight 1994 percentages: **unverified**.
- No home RCT varying wake duration systematically was found.
- ILDIS's exact minimum awake time: **unverified**.

---

## 4. Reality testing (which checks, frequency, newer evidence)

### Takeaway
ILDIS (2020) apparently tested **two RT variants: "RT Breath" (nose-pinch breathing) and "RT Hands"**. Participants averaged **only about 4.1 reality tests per day**, and the **number of RTs per day did not correlate with LD incidence**. RT alone was ineffective (2017), and it remains uncertain whether it adds to MILD + WBTB. "10×/day" and "read text twice" as Aspy instructions were **not verified**. No peer-reviewed 2021–2026 study directly compares check types or random-prompt reminders.

### Cited Findings
- ILDIS group structure (snippet; the listing appears garbled): MILD + WBTB (no RT), MILD + WBTB + **RT Breath**, MILD + WBTB + **RT Hands**, SSILD + WBTB, SSILD/MILD hybrid + WBTB — [ILDIS, PMC7379166](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V, snippet; the exact group composition needs full-text check]**
- "No significant correlations were observed between **number of RT performed each day** and lucid dreaming incidence." Logbook mean **4.1 (SD 4.4) RTs/day**. "Although RT was ineffective when practiced in isolation, it remained uncertain whether RT contributed to the significant increase… in the RT + WBTB + MILD group" — [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) **[V, snippet]**
- 2017 RT-only group: **7.6% of nights lucid in week 2, lower than week 1** — [Aspy 2017, ResearchGate](https://www.researchgate.net/publication/319855294_Reality_testing_and_the_mnemonic_induction_of_lucid_dreams_Findings_from_the_national_Australian_lucid_dream_induction_study) **[V, snippet]**
- Later comparison: **no significant difference** in LD rate between MILD + WBTB groups with and without daytime RT — [Aspy thesis/ILDIS summary](https://digital.library.adelaide.edu.au/items/a20d2a0c-cda2-4b9a-9590-472cd525c93b) **[V, snippet]**
- Schredl 2025 (N = 81, RT vs autosuggestion, 4 weeks): null (see file 01) **[V earlier]**
- Blog claims of a "2022 Maciejewicz study" (mindful hand checks beat mechanical repetition) and a "152% increase (Levitan & LaBerge 1989)" — [oneironauts.io](https://oneironauts.io/blog/reality-checks-for-lucid-dreaming) **[UNV; could not locate primary sources, so treat as unreliable]**
- Nose-pinch rationale: in dreams air usually seems to flow through the pinched nose, which gives a clear result — [oneironauts nose-pinch](https://oneironauts.io/blog/nose-pinch-reality-check) **[V-sec; expert/community opinion, not data]**

### Inferences
- An app should not promise that more checks bring more lucidity; frequency did not correlate in ILDIS. Prompting fewer but **mindful** checks (a genuine "Am I dreaming?" question, scanning for oddities, plus one physical test such as nose-pinch or hands) is defensible as expert opinion. RT should be framed as optional support for MILD, not a stand-alone technique.
- Random-prompt reminders (push notifications) have **no specific controlled evidence**. Konkoly 2024's app used pre-sleep training with sound cues, not daytime random prompts.

### Gaps
- Whether Aspy instructed "10×/day", and the exact breath and hand test wording: **unverified**.
- No 2021–2026 head-to-head comparison of check types was found. No trial of random-interval RT reminders was found.

---

## 5. WILD and Tholey's reflection technique

### Takeaway
Tholey's reflection technique is confirmed in outline: a daytime habit of critically asking whether one is dreaming, several times a day, while scanning the environment for incongruities with waking physics. The "5–10 times per day" figure in file 01 was **not verified**; sources say "several times a day". Tholey's combined technique (reflection + intention + autosuggestion) is confirmed only by a secondary source. Authoritative WILD protocol text was **not retrievable**.

### Cited Findings
- Tholey 1983, "Techniques for inducing and manipulating lucid dreams", *Perceptual and Motor Skills*. The reflection technique is a waking habit of "continuously suspecting waking life to be a dream", asking the critical question **several times a day** with a critical look at the scene. It involves "checking the environment for possible incongruences with the physical laws of waking reality" — [Wikipedia: Paul Tholey](https://en.wikipedia.org/wiki/Paul_Tholey); [IJoDR 2017 article](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/37498/pdf/136208); [traumring.info](http://traumring.info/tholey2.html) **[V-sec]**
- Combined technique = **reflection + intention + autosuggestion**. The intention part is short-term concentration immediately before falling asleep — [Nirvanic Insights blog](https://nirvanicinsights.com/lucid-dreaming-techniques/) **[V-sec, low quality]**
- Tholey's 7 "Klartraum" criteria are used in a 2020 neuroscience paper — [PMC7403396](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7403396/) **[V existence]**
- WILD: no authoritative protocol text was retrieved this session. The descriptions in file 01 (LaBerge & Rheingold 1990 counting technique "1, I'm dreaming…"; hypnagogic imagery; body/float imagery) remain **[UNV]**.

### Gaps
- Tholey's exact frequency, wording and success claims: **unverified**.
- The WILD protocol from LaBerge 1985/1990: **unverified**. No controlled trial was found.

---

## 6. Dream recall training (Schredl and 2020–2026 studies)

### Takeaway
Keeping a dream diary raises *recorded* recall mainly in **low and medium recallers**. In high recallers it may decrease, and diary-based recall tends to **drop in the second week**. Part of the effect is a measurement or motivation artefact. A 2012 paper explicitly questions the "a diary increases recall" assumption. The largest recent study (Bernardi lab, *Communications Psychology* 2025, N = 217) found that **attitude towards dreaming, proneness to mind-wandering, and sleep patterns** predict morning recall. Recall was also higher with **longer light sleep**, at **younger age**, and in **spring vs winter**. No trial on alarm-free waking was found.

### Cited Findings
- Schredl & Fulda 2005 (N = 285, 2 weeks): keeping a dream diary **increased recall in low and medium recallers but decreased it in high recallers** — [Schredl, reliability/stability of DRF (ResearchGate)](https://www.researchgate.net/publication/282737690_Reliability_and_stability_of_dream_recall_frequency) **[V, snippet; exact paper attribution should be double-checked]**
- Diary-based recall **declines from week 1 to week 2** — [same; IJoDR 2020 vol 13(2)](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/73198/69711/209728) **[V, snippet]**
- "Keeping a dream log does **not necessarily** increase dream recall", contrary to its being "often reported as an established fact". Expecting recall to be measured may raise the effort to remember — ["Dream recall frequency: Impact of prospective measures and motivational factors", *Consciousness and Cognition* 2012](https://www.sciencedirect.com/science/article/abs/pii/S1053810012001973) **[V, snippet]**
- Simple encouragement to recall dreams can increase recall — [search snippet, same cluster of sources](https://www.sciencedirect.com/science/article/abs/pii/S1053810012001973) **[V-sec]**
- Bernardi et al. 2025, "The individual determinants of morning dream recall", *Communications Psychology*. **N = 217** (18–70 y), with dream reports, psychometrics, actigraphy and EEG. Predictors: **attitude towards dreaming, mind-wandering proneness, sleep patterns**. Recall was higher with longer light sleep and at younger ages, and lower in winter — [AlphaGalileo/IMT Lucca press release](https://www.alphagalileo.org/en-gb/Item-Display/ItemId/257739); [BPS Research Digest](https://bps.org.uk/research-digest/what-makes-us-more-likely-remember-dreams); [Neuroscience News](https://neurosciencenews.com/dream-memory-neuroscience-24833/) **[V-sec; one digest says N = 204, conflict unresolved]**
- Schredl & Noveski 2018, "Lucid Dreaming: A Diary Study", *Imagination, Cognition and Personality* — [doi:10.1177/0276236617742622](https://doi.org/10.1177/0276236617742622) **[V existence only]**

### Inferences
- App: frame journaling as recall training plus dream-sign mining. Expect gains mainly for low recallers. Since a positive attitude to dreams predicts recall, include motivational content and a pre-sleep recall intention. To counter the second-week drop, add streaks, varied prompts or a short reflection.
- Alarm-free or gentle waking: there is still no direct trial. Recommending lying still with eyes closed and rehearsing before moving rests on the interference literature ([PK] in file 01).

### Gaps
- No effect sizes (d) for diary interventions were retrieved.
- Alarm vs natural waking for recall: **no trial found**.

---

## 7. New 2024–2026 technique papers

### Takeaway
1. **The multi-centre SSILD + TLR study's revised preprint (v2, "Inducing lucid dreaming with multisensory stimulation: a preregistered multi-center study") changes the conclusion.** Verified LD rates did **not differ between REM cueing (38.3%) and sham (28.3%)**. The authors say there is **no clear benefit of REM cueing over SSILD training alone**, although cues prolonged lucid episodes. **No peer-reviewed journal version was found** as of Oct 2026.
2. Konkoly 2024 home-app numbers: **0.74 → 2.11 LDs/week** in a 19-person experiment.
3. A Geneva master's thesis (2025) tested the **Oniri app (MILD + TLR) at home, N = 60, 3 weeks**. Results are restricted-access.
4. Several RCTs are registered (VR / dream yoga; narcolepsy imagery and LD therapy) with no results yet.

### Cited Findings
- **Multi-centre study v2** (Picard-Deland, Dresler, Carr et al.). N = 60 (NL, IT, CA), two morning naps, counterbalanced stimulation and sham. SVLD in **31/60 (51.7%) participants**. Subjective lucidity in 63 naps (52.5%), including **40 SVLDs (33.3%)**, with **no difference between stimulation (38.3%) and sham (28.3%)**. SVLD duration and the number of predefined eye signals were **higher with cueing**. Conclusion: "results do not show clear benefits of REM cueing over SSILD training alone" — [bioRxiv v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2) **[V]**. v1 (NL + IT only, N = 40) looked more favourable to cueing — [v1](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v1) **[V]**. Journal publication: **not found** — [Dresler lab publications](https://dreslerlab.org/publications/) (not fetched) **[UNV]**
- **App relevance:** this supports **SSILD + WBTB + instructions** as the main active ingredient in that protocol, with cue hardware optional.
- **Konkoly et al. 2024** (*Consciousness and Cognition*), Exp 1: **19 participants**, mean **0.74 LDs in the week before vs 2.11 during the app week** — [Northwestern news](https://news.northwestern.edu/stories/2024/10/study-shows-pre-sleep-training-coupled-with-sensory-cues-can-trigger-lucid-dreaming-2); [Science News](https://www.sciencenews.org/article/phone-app-help-lucid-dreams) **[V-sec]**. A press account of a 120-person follow-up (fewer LDs on nights without sound in the once-daily group) is **[UNV]** — [Psychology Today](https://www.psychologytoday.com/us/blog/illusions-delusions-and-reality/202410/can-a-smartphone-app-trigger-lucid-dreaming). The team's research app, "Lucid Experiment", is on Google Play **[V-sec]**.
- **Oniri app, Geneva master's thesis 2025**: MILD + TLR, **60 participants, 3-week home protocol**. Restricted access, outcomes unknown — [archive-ouverte.unige.ch](https://archive-ouverte.unige.ch/unige:190406) **[V existence]**
- "Becoming Lucid: A Micro-Phenomenological Investigation of Signal-Verified Lucid Dreams" (2025). Used TLR, with participants from the NL site of the multi-centre project — [ResearchGate](https://www.researchgate.net/publication/397680378_Becoming_Lucid_A_Micro-Phenomenological_Investigation_of_Signal-Verified_Lucid_Dreams) **[V existence]**
- Dresler 2025 review, "The clinical neuroscience of lucid dreaming", *Neuroscience & Biobehavioral Reviews* **[V-sec existence, via search summary]**
- Registered, no results: **NCT07408206** (Sleep, Dreaming, and VR for Mental Health; dream-yoga-inspired VR + home sleep tech); **NCT07217340** (feasibility of contemplative sleep practices); **NCT07609537** (imagery control therapy and lucid dreaming for REM-related symptoms in narcolepsy) — [ClinicalTrials.gov](https://clinicaltrials.gov/study/NCT07408206); [NCT07217340](https://clinicaltrials.gov/study/NCT07217340); [NCT07609537](https://clinicaltrials.gov/study/NCT07609537) **[V existence]**
- Other device/hypnosis items surfaced but not examined: "Using hypnotic enhancement with auditory suggestion for lucid dream induction", *Somnologie* 2023 — [Springer](https://link.springer.com/article/10.1007/s11818-023-00414-7) **[V existence]**. The olfactory-cued reality-testing proof of concept (*Consciousness and Cognition* 2020) — [ScienceDirect](https://sciencedirect.com/science/article/pii/S1053810020300222) **[V existence]**
- A press release mentioned a 2026 preprint across three sleep labs in which REM cue replay did not raise LD rates beyond pre-sleep training, but LDs lasted about twice as long with cueing — [openPR](https://www.openpr.com/news/4630195/free-app-opens-at-home-lucid-dreaming-study-to-ios-and-android) **[V-sec; probably describes the multi-centre v2 above]**

### Inferences
- The 2026 evidence converges (multi-centre v2; Peters et al. 2026 in file 01): **pre-sleep cognitive training plus well-timed sleep (WBTB / morning sleep) does most of the work. Added stimulation technology contributes little to LD incidence**, though possibly to LD duration. This supports a cognitive-first app design.

### Gaps
- No peer-reviewed 2025–2026 home RCT of an LD induction app with published results was found.
- Oniri thesis outcomes are inaccessible.
- The Konkoly 2024 Exp 2 N and effect sizes are **unverified**.

### Verification status summary, all items (for the report writer)

| Item | Status | Key source |
|---|---|---|
| MILD research steps (alarm 5 h, recall, phrase, visualise, repeat) | Verified (snippet/secondary) | ILDIS PMC7379166; ScienceAlert |
| MILD phrase "next time I'm dreaming, I will remember I'm dreaming" | Verified ("or variation") | ILDIS ResearchGate |
| LaBerge book wording "…I want to remember to recognise…" | Unverified | — |
| Mean 13.6 phrase repetitions; 4.1 RTs/day (ILDIS) | Verified (snippet) | PMC7379166 |
| Blog "54% within 5 min" | Contradicted (primary: 45.8%) | Adelaide press release |
| SSILD in ILDIS: 4 fast (2–3 s) + 4–6 slow (~20 s), don't count | Probable (search-summary of PDF) | Frontiers PDF |
| SSILD in multi-centre lab: 2–3 s, then 20 s, then 60 s | Verified | bioRxiv v1 |
| Community "4–6 fast + 3–4 slow × 30 s" | Community only | Gateway/blogs |
| WBTB home: 18% vs 6% (Schredl, Dyck & Kühnel 2020) | Verified | Heidelberg record; PsyPost |
| WBTB 30–60 min optimum; 10 min worse (LaBerge 1994) | Secondary only | Carr 2020; Erlacher & Stumbrys 2020 |
| Aspy: wake 5–6 h, 10 min to >1 h awake | Verified (snippet) | Aspy 2017 |
| Galantamine placebo 14% / 8 mg 42% | Verified | ILDIS citing LaBerge 2018 |
| RT 10×/day, nose + text in Aspy | Unverified; ILDIS used "RT Breath" vs "RT Hands" | PMC7379166 |
| RT count did not correlate with LD | Verified (snippet) | PMC7379166 |
| Tholey reflection "several times a day" | Verified (secondary); "5–10×" unverified | Wikipedia; IJoDR 2017 |
| WILD protocol | Unverified | — |
| Diary helps low/medium recallers, can hurt high recallers | Verified (snippet) | Schredl & Fulda 2005 |
| 2025 recall predictors (attitude, mind-wandering, sleep) | Verified (press) | Bernardi 2025 |
| Multi-centre v2: cue 38.3% vs sham 28.3%, no clear benefit | Verified | bioRxiv v2 |
| Konkoly 2024: 0.74 → 2.11 LD/week, N = 19 | Verified (secondary) | Northwestern news |
