# k4: pochybnosti a otevřené otázky (copy*.json)

## Věcné
1. **`copy.json` `texts.notifications.wbtbAlarmBody`**: „Vstaň na pár minut…“ jde proti nočnímu průvodci (`nightGuide[0–2]`: „Budík. Nehýbej se.“, „Zůstaň se zavřenýma očima a vybav si sen.“, „Řekni tři slova“). Notifikace přeskakuje vybavení snu, které má být první. Návrh: „Nejdřív si vybav sen, pak pár minut vzhůru.“ Text jsem nechal beze změny, protože jde o obsah.
2. **Noční probuzení v prvních 14 dnech:** `copy.json` povoluje jedno (`wbtb.offerBody`, `wbtbReason.programLimit`, `tooEarlyInProgram`: nejdřív 10. den). Oproti tomu `copy_lab.json` `texts.lab.wbtb.inFirst14Days` říká „Noční probuzení přijde potom“. Pro laboratoř to může platit, ale čte se to jako rozpor. Návrh: „V prvních 14 dnech laboratoř noční probuzení nepoužívá.“
3. **`copy_reality.json` `texts.reality.settings.perDayNote`**: „Výzkum a zkušenosti lidí mluví spíš o 5× denně mezi 9. a 21. hodinou.“ Běžně uváděný rozsah je 5–10× denně (Stumbrys et al. 2012, Consciousness and Cognition 21(3); shrnuto např. v IJoDR 2020, https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/37498/pdf/136208). Přesný počet v protokolu Aspy et al. 2017 (Dreaming, doi 10.1037/drm0000059) jsem neověřil. Okno 9–21 h je spíš pravidlo appky než výsledek výzkumu.
4. **`copy.json` `texts.night.wbtbBody`**: kvůli limitu 6 slov vypadlo „zhruba“ (teď „Po pěti hodinách budík a technika.“). Skutečný čas počítá appka (`telemetry.wbtbWindow`). Kdyby mělo „asi“ zůstat, chce to jinou formulaci.

## Pojmy a SLOVNIK.md
5. **„mise jen v Programu (14 dní)“**: Program má 42 dní (`patches[12]`, `ofTotal`). „Mise“ teď stojí v nášivkách (`patches[0]` „Začátek mise“ u prvního ranního zápisu, `patches[10]`, `patches[12]`) a v `copy_design.json` (`today.programPatch` „Program mise“ na obrazovce Dnes, `program.profile`, `missionCode`). Nechal jsem to tak, protože vše souvisí s programem. Rozhodni, jestli „Program mise“ na obrazovce Dnes a „Začátek mise“ u deníku nevadí.
6. **„Zachytit signál“ jako nadpis rána**: v copy*.json není, ranní obrazovka se jmenuje „Ranní hlášení“ (`texts.morning.title`, notifikace). „Zachytit signál“ je jen v `program.json`. Je potřeba rozhodnout, který nadpis platí.
7. **Stupně odhadu výskytu REM** (`copy_devices.json` `texts.telemetry.remBand.level.*`): „vysoká / střední / nízká / nepravděpodobné“ nemají jednotný rod a `showLow` („Zobrazit i nízká“) předpokládá střední rod množného čísla (okna). Bez kontextu UI jsem je neměnil. Návrh: buď „vysoká / střední / nízká / nepravděpodobná“ (okna), nebo podstatná jména („vysoký odhad“ …).

## Technické (check_a.py)
8. **Chráněné klíče s UI textem:** `copy_devices.json` `texts.telemetry.remBand.source` (věta s „;“, chtěl jsem tečku) a `copy_reality.json` `texts.reality.test.evidence` („Důkazy“; techniky mají pro stejný oddíl „Co víme“) checker hlídá podle názvu klíče. Nechal jsem je beze změny. Doporučuju ručně sjednotit na „Co víme“.
9. **Duplicitní klíče mezi soubory** se různými hodnotami: `texts.morning.record` („Nahrát“ / „Nahrát zvuk“), `recordHint`, `voiceLocal`, `feelingQuestion`, `textHint` (copy.json vs copy_journal.json), `texts.techniques.title` / `back` („Techniky“ / „Výcvik“) a `lead` (copy.json vs copy_training.json). Výsledek závisí na pořadí slučování. Neslučoval jsem je.
10. **Skloňování po číslech:** `texts.design.training.lessonMeta` „{pocet} kapitol“, `texts.lab.ui.nights` „{n} nocí“, `texts.reality.hub.inDreamUnit` „snů“, `texts.lab.detail.missing` aj. Pro 2–4 je potřeba tvar „kapitoly / noci“ (ICU plural jako u `traces.dreams1/2/5`).

## Tón (beze změny, k rozhodnutí)
11. **Rod:** appka důsledně používá mužský rod („Jak ses vyspal“, „Věděl jsi“, „Probudil jsem se z něj“). U žen to drhne. Šlo by to řešit volbou oslovení v onboardingu.
12. **Hlas appky:** míchá „já“ („ukážu“, „losuju“, „přepíšu“) a „my“ („jsme nenašli“, „umíme poznat“, „Jak ti máme říkat?“). Sjednotil jsem jen hlášky „nenašli“.
