# Full-text verification of LD induction techniques, protocols and TLR data (state as of 22 Oct 2026)

Scope: the technique-related claims in the report sections "Metody se posunuly…", "Tabulka věrohodnosti…", "Protokoly krok za krokem…" and "Nejsilnějším prediktorem…" of `/home/user/Claude/reports/Lucidní snění metody a aplikace.md`.

**How the sources were read.**

Read in full (HTML or PDF, full text):
- Konkoly et al. 2024 (PMC author manuscript, plus the Northwestern PDF)
- Aspy 2020 ILDIS (PMC)
- Aspy et al. 2017 NALDIS (author manuscript PDF)
- Erlacher & Stumbrys 2020 (Frontiers)
- Erlacher et al. 2022 (PMC)
- Picard-Deland/Esfahani/Dresler et al. multicentre preprint v2 (bioRxiv)
- LaBerge et al. 2018 galantamine (PLOS ONE)
- Peters et al. 2026 "Waking up in the dream lab" v2 (bioRxiv)
- Wolk et al. 2024 IJoDR pilot (Northwestern PDF)

Read at abstract or metadata level only:
- Klofat 2024 (Crossref abstract; Springer was blocked)
- Tan & Fan 2023 (Europe PMC abstract; Wiley returned 403)
- Saunders 2016 (repository abstract)
- Gott 2021, Morris 2026, Signorelli 2026, Peters 2026 (Sleep Advances), Genc 2025 thesis (abstracts)

Search snippets only:
- Schredl 2025 IJoDR: journals.ub.uni-heidelberg.de failed at DNS and with connection resets throughout the session
- Schredl, Dyck & Kühnel 2020 (Dreaming)

Not reachable:
- Carr et al. 2020/2023 (cronfa.swan.ac.uk returned 503 three times)
- lucidity.com (DNS failure)
- IJoDR 2026 article 115408 (Heidelberg host blocked)

Status codes in the log:
- **CONFIRMED**: the full text says this.
- **CORRECTED**: the claim is wrong, imprecise or missing important nuance; the correct value is given.
- **NOT FOUND**: the claim could not be checked against a primary text.
- Suffix **(abs)**: checked against the abstract only.

---

## Q1. Verification log: report claims vs primary full texts

### Takeaway
Most headline numbers in the report are correct. However, about a dozen claims need correction or nuance. The most important are:
1. Erlacher 2022 did **not** "prove" that 6 h beats 4.5 h. It compared its own 4.5 h data with an earlier study.
2. In ILDIS, the 5-minute fall-asleep criterion was **not** replicated; only ≤10 min was significant.
3. In Konkoly 2024 Exp 2, the TLR-cue group got cues on **all 7** nights. Only the control groups alternated nights.
4. The "416" figure **is** real: it is the number of people who used the app at least once.
5. The Konkoly Exp 1 "27 % dropout" was mostly technical exclusions. Only one participant voluntarily dropped out.
6. The SSILD lab protocol is now fully specified (see Q2).
7. The NALDIS 45.8 % comes from only 24 occasions by 14 people who already had a high baseline.
8. ILDIS explicitly found technique success **independent of prior technique experience**. This softens the report's framing that prior experience is "the strongest predictor".

### Cited Findings

#### A. Section "Metody se posunuly…" (methods-history section) and the milestone table

| Report claim (short) | Status | Source and exact quote |
|---|---|---|
| Stumbrys 2012: 35 studies, "no technique reliably induces LD", 60 % poor methodology | CONFIRMED (via two full texts citing it) | [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/): "Stumbrys et al. (2012) identified 35 empirical studies… found that most (60%) were of poor methodological quality. The others were classified as moderate quality." [Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full): "none of the induction techniques were verified to induce lucid dreams reliably, consistently and with a high success rate". Breakdown: 24 field and 11 lab studies. |
| Aspy 2017: only RT + WBTB + MILD worked; 9.4 → 17.4 % of nights (n = 47) | CONFIRMED, with nuance | [Aspy 2017 author MS](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf) ([DOI](https://doi.org/10.1037/drm0000059)), Table 4: "RT + WBTB + MILD (n = 47) 9.4% (20.0%) 17.4% (22.0%) 84.5% [improvement] Z 2.94 p .003". RT + WBTB went 6.9 → 10.7 % (p = .301, n.s.). RT only went 8.1 → 7.6 %. Nuance: post-hoc, only RT-only vs triple differed significantly (p = .035). RT + WBTB vs triple was n.s. (p = .492). N = 169 completers out of 420 who did the pretest. |
| ILDIS N = 355; SSILD ≈ MILD; hybrid adds nothing | CONFIRMED | [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/): "The weighted average lucid dreaming rate for the four MILD technique groups was 16.5%"; "SSILD… Week 2 lucid dreaming rate of 16.9%"; "overall lucid dreaming rate… improvement… and the effect size were all lowest for the SSILD/MILD hybrid group" (13.3 %, n.s. vs others). |
| Erlacher 2022 "proved" that waking after 6 h is better than after 4.5 h | **CORRECTED** | [Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/) tested only 4.5 h. The comparison is with the authors' **earlier** 6 h study, not randomized or within-study: "Compared to the original study, the earlier sleep interruption seems to reduce the lucid dream induction rate." The authors call for "the different time sets [to] be experimentally tested in a within subject design". Correct wording: "suggests", not "proved". |
| Tan & Fan 2023: 19 studies, 14 techniques, MILD most effective; SSILD and galantamine are candidates | CONFIRMED (abs) | [Tan & Fan 2023 abstract](https://doi.org/10.1111/jsr.13786), read via Europe PMC: "A total of 19 peer-reviewed studies… 14 lucid dream induction techniques… the mnemonic induction of lucid dream technique was the most effective… senses-initiated lucid dream technique and galantamine intervention, might also be competitive candidates… further replications are needed." |
| Tan & Fan: "6 supporting studies" for MILD | NOT FOUND | This is not in the abstract, and the Wiley full text returned 403. |
| Carr 2020: TLR in a lab nap, 50 % vs 17 % | CONFIRMED (via citing full texts), but **date and citation need correcting** | Published as Carr, Konkoly, Mallett, Edwards, Appel & Blagrove **2023**, *Psychology of Consciousness* 10(4):413–430, doi:10.1037/cns0000227 ([reference in Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)). The 2020 date is the preprint. [Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/): "In the experimental group, 50% of the participants had a lucid dream verified by volitional eye signaling, whereas in the control group, only 17%…". Pre-sleep training was "20 minutes" in bed with eyes closed ([Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)). [MC v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full) adds that Carr's sample had frequent nightmares and mean LD duration was 1.9 min. |
| Konkoly 2024 home TLR 0.74 → 2.11 LD/week (n = 19) | CONFIRMED | [Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/): "(M = 2.11, SD = 2.23, range = 0–6) than during the week before (M = .74, SD = 1.24…; W = 2.5… p = .007). Out of the sample of 19 participants, 14 reported at least 1 lucid dream during the week of app use, whereas only 8 reported having a lucid dream in the week prior." |
| Klofat 2024: WBTB alone at home 4.3 % | CONFIRMED (abs), **nuance needed** | [Klofat 2024 abstract via Crossref](https://api.crossref.org/works/10.1007/s11818-024-00453-8) ([DOI](https://doi.org/10.1007/s11818-024-00453-8)): "Die sichere LD-Rate lag bei 6/138 = 4,3 % in der WBTB-Nacht." Nuance: there was **one** WBTB night (woken after 5 h, 30 min awake), deliberately run "ohne Hinweise auf LD" (without any mention of LD), and participants read "einen detailreichen Text für eine Gedächtnisaufgabe" (a detailed text for a memory task). It is therefore a test of WBTB without lucid intention, not of WBTB as practitioners use it. All 8 participants who had an LD were already experienced. WBTB did raise dream recall. Side effect: difficulty falling back asleep. |
| Schredl 2025 IJoDR: RT alone and autosuggestion alone both n.s. over 4 weeks (N = 81) | CONFIRMED (search snippet only) | [Schredl 2025](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/110523): "Testing the effectiveness of two lucid dream induction methods: A four-week diary study", IJoDR 18(2):201–206, 81 persons (59 F, 22 M). Neither technique significantly raised LD frequency. The initial RT advantage (medium effect) mostly disappeared once prior LD frequency was controlled. Prior LD frequency was the strongest predictor. Full text unreachable (host blocked). |
| MC v2: SVLD in 31/60 (51.7 %); stim 38.3 % vs sham 28.3 %, n.s.; "no clear benefit of REM cueing over SSILD training alone"; cues only lengthened LD | CONFIRMED, with **nuance on duration** | [MC v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full): "At least one SVLD occurred in 40 out of 120 (33.3%) naps: 23/60 (38.3%) in the stim condition, and 17/60 (28.3%) in the sham… (χ²(1) = 1.51, p = .219)". Duration was longer under stim on **only one of three** measures: first-to-last LRLR 6.08 ± 6.98 vs 3.24 ± 5.43 min (p = .027). First LRLR to awakening did not differ (7.60 vs 7.78 min, p = .836), nor did continuous duration (p = .129). Stim also brought more eye signals (1.93 vs 0.63/nap, p = .025), shorter REM (12.7 vs 16.2 min, p = .040) and lower sleep efficiency (53.4 vs 57.6 %, p = .025). Subjective LD naps: stim 50 % vs sham 55 %. |
| MC preprint status | **UPDATED** | v2 was "Posted August 21, 2026". Title changed to "Inducing lucid dreaming with multisensory stimulation: a preregistered multi-center study". First author is now Picard-Deland (co-first with Jafarzadeh Esfahani). The bioRxiv page shows no "Now published in" link, so it is still a preprint as of Oct 2026. The v1 title was "Highly effective verified lucid dream induction…". |
| Peters 2026: 3 studies, N = 101; 40–45 % externally rated lucid; 11–32 % SVLD "by verbal instructions and lab-context priming alone"; VR, haptics and glitches added nothing | CONFIRMED, **nuance needed** | [Peters 2026 v2](https://www.biorxiv.org/content/10.64898/2026.03.11.711049v2.full): N = 44 + 38 + 19 = 101. "Overall, 45.4% of dreams were externally rated as lucid… no significant effect of condition, χ2(3) = 0.91, p = .823"; SVLD "χ2(3) = 3.75, p = .289". Nuance: the instructions-plus-audio-only group (Study 3, n = 19) had the **lowest** SVLD rate: "32.1%… VR-only… 29.7%… implicit VR… 16.0%… VR + HS… 11.1% in the Active Control". The pre-sleep audio was a 22:34-min Carr-style TLR training script focused on the lab. Study 3 used repeated REM awakenings while Studies 1–2 had one final awakening, so the design is confounded. Morning nap ≈ 90 min. |
| Milestone "2018 galantamine 14/27/42 %" | CONFIRMED | [LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246): "17 (14%) with the active placebo… 33 (27%) participants with the 4 mg dose, and 51 (42%) participants with the 8 mg dose". N = 121. Each participant had one night per dose, so the % of participants equals the % of nights. |
| Milestone "2020 ILDIS: falling asleep ≤ 10 min" | CONFIRMED | ILDIS: "18.3%… within 10 min or less, compared to 11.1%… more than 10 min… χ2(1, n = 452) = 4.33, p = 0.037". |

#### B. Section "Tabulka věrohodnosti…" (credibility table)

| Report claim | Status | Source and exact quote |
|---|---|---|
| MILD + WBTB: "45.8 % of attempts when falling asleep < 5 min" | CONFIRMED, **important caveat** | [Aspy 2017 MS](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf): "This was achieved a total of 24 times by 14 participants. For these 24 occasions, Week 2 L DRF lucid (M = 45.8%…) was much higher than for all the other nights on which these participants practiced MILD (M = 24.6%)… the baseline L DRF lucid rate for these participants during Week 1 was higher than average at M = 20.4%… which limits the generalizability". ILDIS did **not** replicate the 5-min cut-off: "17.5%… within 5 min or less, compared to 13.8%… not significant: χ2(1, n = 452) = 1.14, p = 0.286". |
| Lab MILD + WBTB: "~50 % reported, ~1/3 SVLD" (Erlacher & Stumbrys 2020) | **CORRECTED** | [Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full): 60-min WBTB conditions "six (54%), eight (53%)" reported LD; "three (27%), four (27%)… produced PSG-verified eye signals". The 30-min condition gave 36 % reported and 14 % verified. Controls: reading 9 %, Wii 0 %. Correct figure: **≈ 27 % SVLD** (60 min), not 1/3. Wake-up rule: after ≥ 5 h 40 min, woken from REM after 10–15 min of uninterrupted REM, i.e. about 6 h. N = 11/15/14/11. |
| SSILD ≈ MILD in ILDIS; 51.7 % SVLD in the lab | CONFIRMED | ILDIS SSILD group: n = 76, Week 1 4.7 % → Week 2 16.9 %, r = 0.51. MC v2 as in A. |
| WBTB alone: 4.3 % at home (N = 138) | CONFIRMED (abs) | Klofat abstract; see A for the nuance. 153 were recruited and 138 analysed. |
| WBTB + brief dream-element practice at home (Schredl 2020): 18 % vs 6 %, N = 50, 5/10 novices ≥ 1 LD in 5 weeks | CONFIRMED (snippet/abs) | Schredl, Dyck & Kühnel 2020, *Dreaming* 30(4):287–296 ([HeiBib record](https://heibib.ub.uni-heidelberg.de/search/Record/1879821842); [PsyPost](https://www.psypost.org/more-evidence-the-wake-up-back-to-bed-technique-can-help-to-induce-lucid-dreams/)). Protocol per the abstract: alarm after **~6 h** of sleep, once a week, review dream elements from earlier dreams, intend to become lucid when one appears. Full text not read. |
| WBTB timing: 6 h > 4.5 h (26 %/0 %/20 % vs 53 %) | CONFIRMED numbers, **interpretation corrected** | [Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/): "four out of 15 (26%), zero out of 20 (0%), and three out of 15 (20%)". 4/15 is actually 26.7 %. Exp 2 (0 %) used time-based instead of REM-based morning awakenings, so dream recall fell to 20 %. Exp 3 (20 %) used **RT instead of MILD**. Only Exp 1 is a clean 4.5 h MILD condition. Strict PSG-verified: 2/15 (13 %), 0/20, 3/15 (20 %). |
| RT alone: RT group 7.6 % of nights in week 2, less than week 1 | CONFIRMED | Aspy 2017 Table 4: "RT only (n = 68) 8.1%… 7.6%… −6.8%… p .786". |
| ILDIS: number of RTs per day did not correlate with LD; mean 4.1 RT/day (SD 4.4) | CONFIRMED, with an **internal inconsistency** | ILDIS Table 5: "L Reality tests (Groups 2 and 3) 4.1 (4.4) –0.04". But ILDIS Table 6 gives 9.8 (LD nights) and 9.7 (non-LD nights) RT/day, so the paper is internally inconsistent. Report it as "≈ 4–10/day, no relationship". |
| Report: Aspy's "10× a day" RT recommendation is [NEOV] | **CORRECTED → CONFIRMED** | ILDIS Group 2: "instructions for performing a minimum of 10 inhalation RT per day". NALDIS: "perform a minimum of 10 reality tests per day by first asking themselves 'Am I dreaming?'" |
| ILDIS tested "RT Breath" and "RT Hands" | CONFIRMED | Breath: "closing one's lips and then attempting to inhale through the mouth" (note: through the closed **mouth**, not a pinched nose). Hands: "attempting to push the fingers of one hand through the palm of the other… also inspect their hands for anomalies". MILD + RT combined 12.1 % vs MILD without RT 19.4 % (p = 0.052). |
| Autosuggestion: null in RCT 2025; WBTB + affirmation ineffective (Dyck 2017) | CONFIRMED (Dyck 2017 via ILDIS) | ILDIS: "Dyck et al. (2017) found that keeping a dream diary, RT, and a combined WBTB and affirmation technique were ineffective." Schredl 2025: see A (snippet). |
| TLR home: experiment 2 "~17 % vs ~5 %" | CONFIRMED (secondary), **precision corrected** | [Science News](https://www.sciencenews.org/article/phone-app-help-lucid-dreams): "The first night, 17 percent of participants reported lucid dreams. The second night, people who heard the sounds from training kept up that rate… only 5 percent of the people in the other two groups had lucid dreams." Primary [Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/) gives only ORs; the percentages are in Fig. 5: "TLR-cue and combined control groups differed on night 2 (OR = 3.61, p = .006) but not night 1 (OR = 1.06, p = .87)". This is a **night-2** comparison (n = 112). It is not the overall result. |
| MC v2: cue 38.3 % vs sham 28.3 %, n.s. | CONFIRMED | See A. |
| Instructions + context priming (Peters 2026) | CORRECTED nuance | See A. The instructions-only arm had 11.1 % SVLD. |
| Auditory RT cues without training (IJoDR 2026, 1/15 strictly verified) | NOT FOUND | The IJoDR host (115408) was unreachable. |
| Meditation/contemplative content as TLR association: 2/5 SVLD (breathing), 2/5 LD (Chenrezig) | CONFIRMED, with nuance | [Wolk et al. 2024 IJoDR](https://faculty.wcas.northwestern.edu/~paller/IJDR2024.pdf): "participants (N = 5) underwent a wake-back-to-bed procedure… After approximately 5 hours of sleep… breath-counting task while ambient music cues played… This procedure induced signal-verified lucid dreams in two participants." [Morris et al. 2026, Brain Sci](https://doi.org/10.3390/brainsci16030315) (now published): 5 participants × 7 overnight PSG sessions. "Lucid dreams were reported by two participants": one in the lab after cueing; one monastic had a first-ever LD "on the night following their laboratory session" (i.e. not during a cued lab night). |
| VR training (Gott 2021): n = 42, 4 weeks, more LD than no training | CONFIRMED (abs), with nuance | [Gott 2021 abstract](https://doi.org/10.1098/rstb.2019.0697): "VR-assisted training led to significantly stronger increases in lucid dreaming compared to the no-training condition". Peters 2026 adds that it was **not** better than an active control (classical training). n = 42 was not checked. |
| Galantamine: side effects 12 % vs 3 % placebo | CONFIRMED | LaBerge 2018: "14 participants (12%) reporting mild side effects on an active dose… compared to 4 (3%) with placebo". |
| "Active placebo" (MILD + WBTB + belief one may have had the drug) 14 % of nights | CONFIRMED, **context needed** | LaBerge 2018: placebo night = WBTB at ~4.5 h (actual 4.54 ± 0.86 h), 30 min out of bed (actual 36 ± 18 min), MILD while returning to sleep. Context: participants were attending an 8-day Lucidity Institute workshop in Hawaii, and "94 participants also wore a sleep mask which recorded physiological variables and provided additional memory cues during sleep". Expected baseline was 4 % per night (6-month self-report ÷ 180), so placebo was about 3× baseline. |

#### C. Section "Protokoly krok za krokem…" (step-by-step protocols)

| Report claim | Status | Source and exact quote |
|---|---|---|
| P1 MILD: alarm ~5 h after going to bed | CONFIRMED | ILDIS: "set an alarm 5 h after going to bed, to place the alarm somewhere that would require getting out of bed to turn it off". NALDIS is identical, plus "put a light on… sit upright in bed". |
| P1: Aspy 2017 defines WBTB as "usually after 5–6 h", wake "10 min to more than an hour" | CONFIRMED (literature description, not the NALDIS protocol) | NALDIS intro: "usually five to six hours… from as little as 10 min to more than one hour". NALDIS itself set no minimum wake time. It told participants "the longer they spend doing the technique the more effective it would be, and not to worry if it took a long time to fall asleep". ILDIS reversed this and emphasised falling asleep quickly. |
| P1: recall a dream; if none, any recent dream | CONFIRMED | ILDIS: "recalling a dream from directly prior to waking up (or alternatively, any other recent dream)". |
| P1: phrase "next time I'm dreaming, I will remember I'm dreaming" "or a variation"; not a mantra, meaning matters | CONFIRMED | ILDIS: phrase as quoted; "The importance of strong intention was emphasized." NALDIS: "next time I'm dreaming, I will remember that I'm dreaming… The importance of putting meaning into the words was emphasized." |
| P1: LaBerge's book wording is [NEOV] | **CORRECTED → CONFIRMED** | [LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246): "the practitioner mentally recites, 'The next time I'm dreaming I want to remember to recognize that I'm dreaming.' In addition, the technique involves visualizing carrying out a preselected action… repeatedly lets go of distracting thoughts… consistently until falling back to sleep." [Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full): "Next time I'm dreaming, I will remember to recognize that I'm dreaming". |
| P1: visualise returning to the dream, notice a dream sign, plan an action (e.g. flying) | CONFIRMED | ILDIS: "visualize being back in the dream… noticing something unusual that causes them to realize they are dreaming… continue until they felt their intention was set". Planned action: LaBerge 2018 ("preselected action"). NALDIS adds: "If their mind wandered… repeat the procedure so that the last thing they thought about was their intention". |
| P1: ILDIS mean 13.6 repetitions (SD 11.6) | CONFIRMED | ILDIS Table 5: "L MILD phrase repetitions… 13.6 (11.6) –0.02" (no correlation with LD). NALDIS: 17.4 (16.1), weakly **negative** correlation (−.12). |
| P1: fall asleep within 10 min (ILDIS); 45.8 % for < 5 min (Aspy 2017) | CONFIRMED with caveats | See B. ILDIS mean minutes back to sleep 19.5 (SD 52.0). Technique duration 8.7 (SD 9.2) min. 70.7 % fell asleep during the technique (unrelated to LD). |
| P1: verbatim ILDIS instructions not verified | **RESOLVED** | See Q2 for the verbatim text. The full technique documents were not published, only paraphrased in Methods. |
| P2 WBTB: lab wake 30–60 min, best 60 min | CONFIRMED, **nuance** | Erlacher & Stumbrys 2020: 60 min → 53–54 % reported / 27 % verified; 30 min → 36 % / 14 %. Same paper: "it is most effective to use WBTB for a period of 30–120 min (LaBerge et al., 1994). The shorter periods of wakefulness, such as taking a nap after 10 min… are less effective". This is now a primary-paper citation of NightLight 1994 rather than only secondary. LaBerge 2018 chose 30 min because "30 minutes of sleep interruption is more effective than shorter… longer than 30 minutes… does not lead to further increases". In LaBerge 2018, "at least 30 minutes of sleep interruption" predicted LD (β = 0.11, p = 0.03, one-tailed). |
| P2: Schredl 2020 used WBTB once a week | CONFIRMED (snippet), and **WBTB at ~6 h** | Abstract-level only. |
| P2: home default 10–30 min | Design choice, not data | ILDIS home data: technique minutes did not predict LD (Table 6: 9.4 vs 8.6 min, p = .398). In the SSILD group, longer technique time correlated slightly negatively with LD (rs = −0.16, p = .013). Getting out of bed (70.1 % of occasions) and turning on the light (28.7 %) were unrelated to LD. |
| P3 SSILD home: 4 fast cycles × 2–3 s per sense, then 4–6 slow × ~20 s; don't count seconds | CONFIRMED | ILDIS: "first perform four fast cycles (2 or 3 s on each step) and then four to six slow cycles (approximately 20 s on each step). They were told not to count the number of seconds, and that it is important to complete at least four slow cycles. Participants were instructed to fall asleep as normal after completing six slow cycles." Note the internal tension between "4–6", "at least 4" and "after six". |
| P3 lab mode: fast → medium (~20 s) → slow (~60 s), cycle counts unknown | **RESOLVED** | MC v2: "starting with 4 fast cycles (2-3 s on each modality), followed by 4 medium length cycles (20 s), and ending with 4 slower cycles (60 s)". Of the 4 slow cued cycles, 2 had verbal prompts and 2 had cues only. Full timings in Q2. Total ≈ 30 min. |
| P3: community recipe "4–6 fast + 3–4 slow × 30 s" is community-only | CONFIRMED (no primary source uses it) | ILDIS and MC v2 both use the numbers above. |
| P3: ILDIS cycle counts actually performed | NEW | ILDIS Table 5: fast cycles 4.0 (2.2), slow cycles 5.1 (4.1). On LD nights fast cycles were 4.4 vs 4.0 (p = .039). The author considers Type I error likely. |
| P4 RT: event-based triggers rather than random push notifications | No data (design inference) | NALDIS told participants to do RT "at a range of times and settings throughout the day (especially when something unusual or unexpected happens)" and to count RTs with a tally app. ILDIS: "Many participants complained that performing RT was burdensome… Lucid dream induction studies should avoid daytime RT unless this technique is of specific interest." |
| P5 TLR: ~20 min training in bed, eyes closed | CONFIRMED approximately | Konkoly: 4 cue + verbal-guidance blocks, then "Over the next 15 minutes, the TLR cue was played 12 more times". Intervals sum to 870 s (14.5 min), so the total is roughly 18–22 min (my estimate). Carr's original: "20 minutes". |
| P5: volume calibration "audible from a phone face-down by the pillow, but must not wake" | **CORRECTED** | Konkoly: "turn off their phone notifications and turn their phone intensity to maximum… placed the phone face-down on their bed beside their pillow. On the first night… the app tested participants' auditory perceptual threshold and discrimination threshold". Sleep cueing starts **at the discrimination threshold** and ramps upward (see Q2). There is no separate "must not wake" calibration; in Exp 1 cues "continue[d] increasing… until participants woke". |
| P5: cue "~6 h later"; unclear whether from training or sleep onset | **RESOLVED** | Konkoly: "the app began presenting cues again 6 hours after TLR training ended". The rationale cites Erlacher & Stumbrys 2020 ("sleep interruption 6 hours after sleep onset"). |
| P5: post-wake question "did the cue wake you?"; movement pauses playback; cues woke people | CONFIRMED | Konkoly: "Did you wake up because of a sound presented by the app?" ("yes," "no," "I'm not sure"). Exp 2 motion per cue: TLR cues ".19, SD = .15" vs no cues ".1… p = .002". |
| P5: Exp 1 (n = 19, Android, 1 week, no control) | CONFIRMED; **dropout corrected** | 26 recruited; "Four participants were excluded due to technical difficulties, and one participant voluntarily dropped out… Two other participants… never initiated the study." Voluntary dropout was therefore 1/26, not ~27 %. |
| P5: Exp 2 n = 112 (40/35/37); Northwestern says 120; "416 not confirmed" | **CORRECTED** | Konkoly: "a total of 416 participants used the app at least once… (154 recalled 0 dreams, 142 recalled 1 dream)… met this criterion and used the app for the recommended 7 nights was 50… at least one night in each condition was 120… completed the first two nights was 112". Groups: 7-night 22/11/17; all-nights 41/39/40; first two nights 40/35/37. |
| P5: cues played every other night (nights 1, 3, 5, 7) | **CORRECTED** | Konkoly: "In the TLR-cue group, this same procedure from night 1 was also used on the next 6 nights… In the other two groups, TLR was delivered normally only on nights 1, 3, 5, and 7… untrained-cue group, on nights 2, 4, and 6… the cue sound they heard during the perceptual discrimination test… no-cue group… no cues on nights 2, 4, and 6." |
| P5: unverified cue repetitions, interval, acoustics, movement-pause rule | **RESOLVED** | See Q2. |
| P5: effect not significant in the full sample | NEW nuance | Konkoly: "there were no significant effects when repeating the above analysis including those 116 additional participants (ps > .3)". In the no-cue group, TLR nights ≈ no-cue nights (p = .77). |
| P7: nightmare RCT (Spoormaker & van den Bout 2006, n = 23) | Not re-checked | Outside the scope of the fetched texts. |

#### D. Section "Nejsilnějším prediktorem…" (predictors section; technique-related parts)

| Report claim | Status | Source and exact quote |
|---|---|---|
| 55 % (95 % CI 49–62) ever had an LD; 23 % (20–25) monthly | CONFIRMED (abs) | [Saunders 2016](https://nectar.northampton.ac.uk/id/eprint/8705/): "34 studies yielded a mean estimate of 55%, 95% C.I. [49%, 62%]… frequent lucid dreaming (one or more lucid dreams in a month)… 25 studies… 23%, 95% C.I. [20%, 25%]". Monthly, not weekly. |
| Baseline LD frequency is the strongest predictor | **CORRECTED** (mixed evidence) | Supporting: Schredl 2025 (snippet), Klofat (all 8 successes were experienced), MC v2 (subjective-LD achievers' prior LD frequency 3.70 vs 5.06 MADRE, p = .005), LaBerge 2018 ("higher baseline levels… more likely… β = 0.04, p = 0.0001"). Contradicting or limiting: ILDIS found "no difference in Week 2 L DRF Lucid between participants who had prior lucid dream induction experience (M = 15.3%) and… without (M = 16.4%)… p = 0.454" and concluded the techniques "can be used successfully regardless of baseline lucid dreaming or prior technique experience". Note: ILDIS pre-test LD/month correlated with week-2 LD at rs = .38. MC v2: "10 participants who reported only having lucid dreams once a year or less were able to achieve an SVLD". LaBerge 2018: 4/10 never-lucid participants succeeded on 8 mg (40 %), comparable to 42 % in the others. Correct framing: baseline frequency predicts level, but novices still respond. |
| Falling asleep fast after the technique (≤ 10 min, < 5 min) | CONFIRMED for ≤ 10 min; **< 5 min not replicated** | See B. |
| General dream recall predicts success | CONFIRMED | ILDIS Table 6: dreams/day on LD nights 2.8 vs 1.7 (p < .001, r = .23); dream quantity 10.2 vs 5.2. Konkoly 2024: TLR effect only in participants recalling dreams on ≥ 2 nights. |
| Successful LD does not harm sleep quality | CONFIRMED (self-report) | ILDIS: sleep quality on LD nights 3.6 vs 3.4 (p = .037). Week 2 time asleep 7.7 vs 7.4 h. "sleep quality was not adversely affected by successful induction… but may have been adversely affected by unsuccessful attempts". Contrast: MC v2 cueing reduced REM duration and sleep efficiency. |
| ILDIS "about half completed both weeks" [PK] | **CORRECTED** | ILDIS: "An initial sample of 1618 participants completed the pre-test questionnaire. A total of 843 participants continued to complete Week 1… and 355 participants completed Week 2." That is 42 % of Week-1 starters and 22 % of pre-test. Week-2 logbook entries averaged 4.6/7 vs 6.9/7 in Week 1. |
| Home TLR lost ~27 % in a week (26 → 19) | **CORRECTED** | See C. For an app, Exp 2 attrition is the relevant figure: 416 users → 120 with ≥ 2 recalled dreams and ≥ 1 night per condition → 50 who did all 7 nights. |

### Inferences
- Across studies the "stable core" is home WBTB at about 5 h, followed by MILD or SSILD, followed by fast return to sleep. It yields about 16–20 % of practice nights with self-reported LD over one week, in motivated volunteers (NALDIS 17.4 %, ILDIS 16.5–16.9 %, LaBerge 2018 placebo 14 %).
- Every positive TLR effect at home rests on secondary analyses: night 2 of Exp 2, or participants with good recall. In the full Exp 2 sample the effect was not significant, and in the best-controlled lab study (MC v2) REM cueing did not raise SVLD prevalence over SSILD alone. TLR should therefore be framed as "pre-sleep association training plus optional cueing". The cue itself is best treated as a lucidity "reminder" or prolonger and as a sleep-disruption risk, not as an inducer.
- The lab "~50 %" numbers (Carr, MC, Peters, Erlacher) share a common context: morning naps, REM awakenings, explicit LD instructions and lab dreaming. Peters 2026 shows that this context alone produces high rates. This supports the report's statement that lab numbers do not transfer home.

### Gaps
- Carr et al. 2023: exact n per group and the full training script could not be read (Swansea repository 503).
- Tan & Fan 2023 full text (Wiley 403): the "6 supporting studies" for MILD is unverified.
- Schredl 2025 IJoDR and Schredl, Dyck & Kühnel 2020 *Dreaming*: only abstract-level data. The Heidelberg host failed at DNS and with connection resets throughout.
- Klofat 2024 full text (Springer blocked): exact control comparison and side-effect rates unknown beyond the abstract.
- IJoDR 2026 (115408) on auditory RT cues: not reachable.
- lucidity.com MILD pages: DNS failure. LaBerge's wording was taken from LaBerge 2018 instead.
- Konkoly 2024 Exp 2 per-group night-1/night-2 percentages are only in Figure 5. The text gives ORs, and Science News gives about 17 % vs 5 %.

---

## Q2. Ověřené implementační protokoly (verified implementation protocols, exact parameters)

### Takeaway
The four protocols that can now be implemented exactly from primary text are: ILDIS MILD + WBTB, ILDIS SSILD + WBTB, the Konkoly 2024 phone TLR (Exp 1 and the Exp 2 v2 app) and the MC v2 lab SSILD + TLR script. Parameters not stated in the papers are marked as such.

### Cited Findings

#### P-A. WBTB wrapper (home), ILDIS / NALDIS
Source: [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/); [NALDIS MS](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf).

**Preparation**
- Print the instructions and keep them by the bed.
- Spend "a full hour familiarizing" with them before starting.
- Practise the technique once during the day.
- Re-read the instructions "directly before bed each night".

**The alarm**
- Set the alarm **5 h after going to bed** (ILDIS, NALDIS).
- Lab variant: about 6 h (after ≥ 5 h 40 min, from REM; Erlacher & Stumbrys 2020).
- Place the alarm so that turning it off requires getting out of bed.

**Arousal adjustments (ILDIS)**
- If falling asleep too quickly: turn the lights on for a few minutes and re-read the instructions.
- If returning to sleep is hard: keep the lights off, put the alarm next to the bed and use a quieter tone.

**Other rules**
- Do not practise when sleep-deprived; make up skipped days at the end.
- Give a short RT instruction for use when unsure whether dreaming.
- Give sleep-paralysis information.

**Duration of wakefulness**
- ILDIS fixed no wake duration. Technique time was M = 8.7 min.
- Lab and supervised evidence favours 30–60 min of wake: LaBerge 2018 used 30 min ("does not lead to further increases" beyond that); Erlacher & Stumbrys 2020 found 60 > 30 min.
- At home, falling asleep within ≤ 10 min after the technique matters (18.3 % vs 11.1 %).

**"What to do if you have a lucid dream" sheet (NALDIS, about 700 words)**
- Stay calm to avoid waking.
- Do an RT.
- Stabilise by "rubbing the palms of their hands together vigorously and focusing on the physical sensations while repeating 'this is a lucid dream'".

#### P-B. MILD (ILDIS Groups 1/4 wording; LaBerge 2018 additions)
1. On the WBTB alarm, recall the dream from just before waking (or "any other recent dream").
2. Lie down comfortably.
3. Repeat silently: **"next time I'm dreaming, I will remember I'm dreaming."**
   - LaBerge's variant: "The next time I'm dreaming I want to remember to recognize that I'm dreaming."
   - Emphasise "strong intention" / "putting meaning into the words".
4. At the same time, visualise being back in the recalled dream, "noticing something unusual that causes them to realize they are dreaming".
5. Add a pre-selected action once lucid (LaBerge 2018).
6. Continue "until they felt their intention was set" (ILDIS) or "until they either fell asleep or their intention was set" (NALDIS).
7. If the mind wanders, restart so that the intention is the last thought (NALDIS).
8. LaBerge 2018 recommends a minimum of **10 min** of MILD. Participants practising ≥ 10 min were more likely to have an LD (β = 0.09, p < 0.01, one-tailed), but total minutes did not predict success.
9. Observed in ILDIS: 13.6 ± 11.6 phrase repetitions, unrelated to success. Do not impose a repetition count.

#### P-C. SSILD (ILDIS Group 5, designed "with consultation from the creator")
Framing given to participants: "conditioning the mind and body into a subtle state that is optimized for lucid dreams".

One cycle has three steps (verbatim ILDIS wording):
1. **Vision:** "Close your eyes and focus all your attention on the darkness behind your closed eyelids. Keep your eyes completely still and totally relaxed. You might see colored dots, complex patterns, images, or maybe nothing at all… don't 'try' to see anything."
2. **Hearing:** "Shift all of your attention to your ears… faint sounds of traffic or the wind… your own heartbeat or a faint ringing in your ears…"
3. **Body:** "Feel the weight of the blanket, your heartbeat, the temperature of the air… tingling, heaviness, lightness, spinning sensations… simply relax, observe them passively and try not to get excited."

Dose:
- **4 fast cycles** at 2–3 s per step.
- Then **4–6 slow cycles** at ~20 s per step.
- Do not count seconds.
- "at least four slow cycles".
- Fall asleep "as normal after completing six slow cycles".
- Arithmetic: fast block ≈ 30 s; slow block ≈ 4–6 min.

Observed in ILDIS: fast 4.0 ± 2.2, slow 5.1 ± 4.1. Longer total technique time correlated slightly negatively with LD (rs = −0.16).

Hybrid (Group 6, the weakest): 4–6 slow cycles only, repeating the MILD phrase at every modality switch, with no dream recall or visualisation.

#### P-D. SSILD + TLR lab script (MC v2, ~30 min)
Source: [MC v2 Methods and Supplement](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full).

**Block 1 — introduction**
- Defines LD.
- Gives the three exercise texts, near-verbatim from ILDIS.
- Includes an intrusive-thoughts note: "It doesn't matter if the intrusive thoughts come… what matters is that you can intentionally let them go".

**Block 2 — uncued SSILD**
- 4 fast cycles (2–3 s per sense) in **1 min of silence**.
- Then "four to six slower cycles… approximately 20 seconds" in **4 min of silence**.

**Block 3 — SSILD + cues + prompts**
- 2 cycles, i.e. 6 cues in the order light → audio → tactile → light → audio → tactile, at **1-min intervals**.
- Each exercise lasts 1 min and ends with its modality's cue, which marks the switch to the next sense.
- After each cue a prompt plays: "As you notice the cue, you become lucid. Bring your attention to your thoughts… notice where your mind has wandered… Now observe your body… your sensations… and your feelings… Observe your breathing… remain critically aware, lucid, and notice how aspects of this experience are in any way different from your normal waking experience."

**Block 4 — cues without prompts**
- 2 more cycles (6 cues, 1-min intervals, "over the next 6 minutes"), with no prompts.
- Cue intensity, or number of vibrations, decreases across cycles.
- Then the person falls asleep normally.
- Cues stop if REM sleep begins during training.

**Cue properties**
- Visual: 3 brief red-light flashes from the ZMax headband.
- Auditory: 3-tone melody at **500–700–900 Hz** through loudspeakers.
- Tactile: 1–3 soft vibrations on the forehead.
- Background white noise ~35 dBA.

**Thresholds**
- Audio starts at 40 dBA, lowered in 5-dB steps until the participant judges it non-arousing.
- Light starts at 1 % (500 ms on/off), raised in 5 % steps until perceived.
- Vibration: 1 repetition (200 ms on / 500 ms off).

**REM cueing**
- Starts ~20 s after REM is detected; cues in training order, about every 20 s.
- Increments: light +5 %, sound +5 dBA, vibration 1 → 3 repetitions.
- On micro-arousal (EMG or alpha), pause until it fully dissipates, then resume at the pre-disturbance level.
- If an LRLR signal is given, hold intensity constant.
- Reset to baseline for each new REM period.
- The authors note that starting at 20 s "may have been before REM sleep was stabilized".

**After each awakening**
- A ~7-min short version: 4 fast cycles (1 min), 1 uncued slow cycle (1 min), then 1 cued cycle (3 cues) without prompts.

**Lucid behaviour instructions**
- Give LRLR at lucidity onset, at each perceived cue, and about every 30 s while lucid.
- In false awakenings, do an RT ("breathe through a pinched nose or count fingers").
- Once lucid, "calmly observe or explore the dream scene and avoid intense actions (e.g., flying or free-falling) during the initial moments".

#### P-E. Phone TLR, Konkoly et al. 2024 (exact)
Source: [PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/); [Northwestern PDF](https://faculty.wcas.northwestern.edu/paller/C&C24.pdf).

**Exp 1 inclusion**
- Android phone.
- Recalls ≥ 3–4 dreams per week.
- Sleeps ≥ 7–8 h per night.
- Expects to fall back asleep if woken "in the final 2 hours of the night".

**Pre-study instructions**
- Lucidity is defined as "the ability to think clearly and critically about the experiences of the present moment".
- Participants are told the sound will be replayed in sleep.

**Nightly phone setup**
- Notifications off.
- Volume at maximum.
- Phone face-down on the bed beside the pillow.

**Night 1 tests**
- Auditory perceptual threshold.
- Discrimination threshold: the level at which the two study sounds can be told apart.

**Exp 1 cue**
- Either three pure-tone beeps rising **400 → 600 → 800 Hz**, about **650 ms** in total, or a **1000-ms violin** sound.
- Each participant used one cue throughout.
- Pilot comparison: violin 0.67 → 3.16 LD/week (n = 6) vs beeps 0.83 → 1.67 (n = 12). No inference was drawn because of the sample size.

**Training, night 1**
- The cue is played 4 times, each followed by this guidance: "As you notice the signal, you become lucid. Bring your attention to your thoughts and notice where your mind has wandered [pause]. Now observe your body, sensations, and feelings [pause]. Observe your breath [pause]. Remain lucid, critically aware, and notice how aspects of this experience are in any way different from your normal waking experience [45-s pause]."
- Then the announcement: cues will continue without instructions, and the person may fall asleep while still "practic[ing] becoming lucid each time they heard a cue".
- Then 12 cues over ~15 min at intervals of **45, 70, 55, 65, 70, 80, 65, 60, 75, 75, 90, 120 s**.

**Training, nights 2–7**
- After the first cue, the verbal guidance plays **once** instead of four times.
- The 12-cue tail is presumably unchanged; the paper does not state this explicitly.

**Sleep cueing (Exp 1)**
- Onset **6 h after training ended**.
- One cue every **20–40 s**.
- Night 1 starts at the discrimination-threshold intensity; each cue is **+0.16 %** louder.
- The paper does not define the unit; presumably 0.16 % of maximum volume.
- The paper does not state an end time or a cap; cueing continued "until participants woke".

**Pause rules (Exp 1)**
- Accelerometer movement since the previous cue → pause until **5 min after movement ceases**.
- User reports being woken by the app → pause until **45 min** after they choose to return to sleep.
- After any pause, restart at the discrimination threshold.

**Morning and awakening user interface**
- Once cueing has started, picking up the phone shows: "Did you wake up because of a sound presented by the app?" (yes / no / I'm not sure).
- Then a dream report form: free text, "were you lucid", "did you hear cues", and 5 LuCiD insight items.
- Then a choice: return to sleep, or wake up for the day.

**Exp 2 changes (public app)**
- Two distinct **harp melodies, ~3 s each, fading in and out**.
- Movement pause shortened to **1 min**.
- Intensity is **capped** at the level at which the user reports a cue being incorporated into a dream or triggering an LD.
- Optional gentle mode: +0.08 % per cue, maximum = discrimination threshold, cueing halted for the night after a detected arousal. It was used on about 15–17 % of nights, with no effect on LD.

**Exp 2 design**
- Night 1: everyone gets TLR.
- TLR-cue group: TLR on all 7 nights.
- Control groups: TLR on nights 1, 3, 5, 7. On nights 2, 4, 6, either the untrained (discrimination-test) sound or no cue.
- Participants were blind to the existence of control nights.

#### P-F. Galantamine protocol, for reference only (prescription drug)
Source: LaBerge 2018.
- Sleep ~4.5 h.
- Recall and memorise a dream.
- Take capsules (0, 4 or 8 mg).
- 30 min out of bed doing quiet LD-focused activity.
- Return to bed practising MILD.
- Rationale for timing: galantamine peaks about 1 h after ingestion, aligned with the next sleep period.

### Inferences
- For an app, the Konkoly Exp 2 parameters are the safer default: 1-min movement pause, an intensity cap after incorporation, and the gentle mode as an option. The Exp 1 ramp-until-wake approach produced "alarm clock" awakenings.
- Konkoly ties cue onset to the end of training. A literal implementation therefore starts cueing about 6 h after bedtime plus ~20 min. This lands in the late-night REM window without any sleep staging. Accelerometer pauses are the only safeguard against cueing during arousal.
- The exact SSILD dose for a guided-audio product can follow the MC v2 timings (1 min fast + 4 min slow + optional 2 × 3 min cued cycles). Home SSILD as in ILDIS runs about 5–7 min. Longer sessions showed no benefit.

### Gaps
- Konkoly: no stated end time or maximum intensity for nightly cueing in Exp 1; the unit of the 0.16 % step; and whether the 12-cue tail ran on nights 2–7. The supplement (docx) was not read.
- ILDIS: the full technique documents (word-for-word sheets) are paraphrased in Methods, not reproduced.
- No primary source gives an optimal home wake duration; ILDIS measured only technique minutes.

---

## Q3. New findings (2024–2026) not in, or only partly in, the report

### Takeaway
The 2025–2026 literature consists mostly of small lab studies and preprints. They repeatedly show that cognitive training, instructions and context produce most of the effect, while added stimulation (haptic, EMS, home TLR via a third-party app) adds little. The exceptions are a small GVS signal and a VR-plus-open-monitoring field study.

### Cited Findings
- **Home MILD + TLR replication failed (unpublished thesis).** 60 participants over 3 weeks used the Oniri app. MILD + TLR (cue embedded in pre-sleep training) was compared with MILD (same cue during sleep, but not trained). "Our results do not support this hypothesis, and we highlight the logistical challenges of translating a lab-based paradigm like TLR into a home setting" — [Genc 2025, Univ. Geneva master's thesis](https://archive-ouverte.unige.ch/unige:190406). The same work analysed 3,423 dreams from 372 users: lucid dreams carried more positive, "cognitively driven" emotions.
- **VR plus open-monitoring meditation, 5-week home program (peer-reviewed 2026).** n = 38 low-experience participants; all did daily dream diaries and reality checks. Lucid-like dreams: VR-experimental 26, Control 11, VR-control 4. RR vs control 4.00 (95 % CI 1.97–8.09). At least one lucid-like dream: 84.6 % / 61.5 % / 33.3 %. "VR exposure alone was insufficient." Semi-lucid dreams were counted as lucid-like — [Signorelli et al. 2026, Front Psychol](https://doi.org/10.3389/fpsyg.2026.1924370).
- **Bodily stimulation in REM (peer-reviewed 2026).** n = 28, with a 2-week cognitive training (journaling, RT, association training) and two counterbalanced naps. EMS showed no effect. GVS produced "higher externally rated lucidity and higher Dream Lucidity Questionnaire-7 scores than Control" despite minimal incorporation. "Lucidity rates were high across EMS conditions, suggesting possible contributions of cognitive training, expectancy, and baseline lucid dream frequency" — [Peters et al. 2026, Sleep Advances](https://doi.org/10.1093/sleepadvances/zpag074).
- **Context-based induction (preprint v2, 26 Mar 2026).** 17 of 121 dreams involved lucidity arising after a false awakening in the lab context. Lab content appeared in 47.9 % of dreams and false awakenings in 23.1 % — [Peters et al. 2026 bioRxiv](https://www.biorxiv.org/content/10.64898/2026.03.11.711049v2.full).
- **MC v2 follow-up and safety.** Of 49 who answered a 2-week follow-up, 16 (32.7 %) had ≥ 1 LD at home; 46.9 % reported some change in dream life; "No participants reported negative impacts". In stim periods, cues were perceived in 71.1 %, woke the participant in 23.7 %, and directly initiated 39.1 % of stim SVLDs. In 15.3 % of sham REM awakenings, people reported "perceiving cues" that were never played — [MC v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full).
- **Chenrezig TLR pilot now in a journal:** [Morris et al. 2026, Brain Sciences 16(3):315](https://doi.org/10.3390/brainsci16030315) (see Q1-B).
- **Breath-counting TLR pilot:** [Wolk et al. 2024, IJoDR](https://faculty.wcas.northwestern.edu/~paller/IJDR2024.pdf), with N = 5 and 2 SVLD (see Q1-B).
- **Open-source watchOS TLR app with real-time REM detection** (Mallela & Mallett 2024, IJoDR). Seen only as a search-result title and snippet; the host was unreachable — [IJoDR 100797](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/100797).
- **Konkoly 2024 is a published journal article:** *Consciousness and Cognition* (2024), doi:10.1016/j.concog.2024.103759, PMID 39278157 ([Europe PMC record](https://europepmc.org/article/MED/39278157)). The authors state the app code is on GitHub and the latest version on the Google Play Store ([PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)).
- **New measurement tool:** the Lucid Dream Control Questionnaire (36 items, 7 domains) — [Peters, Erlacher & Bonamino 2026, PsyArXiv](https://doi.org/10.31234/osf.io/p7su6_v1). Relevant for in-app outcome measurement.

### Inferences
- Two independent tests of home or lab TLR (Genc 2025 null; MC v2 n.s.) now join Konkoly's mixed Exp 2. Together they support the report's repositioning of TLR as an amplifier with preliminary data. If anything, "preliminary" should be strengthened to "currently unreplicated at home".
- Signorelli 2026 is the first peer-reviewed field RCT-style study since ILDIS to show a training add-on effect over an active control. It is small (n ≈ 13 per arm) and counted semi-lucid dreams.

### Gaps
- No large (N > 100) preregistered home RCT of any technique published in 2025–2026 was found in Europe PMC, bioRxiv or web searches.
- The publication status of the MC study after v2 (Aug 2026) is unknown; no journal version was found.
- The full texts of Signorelli 2026, Peters 2026 (Sleep Advances) and Morris 2026 were not read; their figures come from the abstracts.
