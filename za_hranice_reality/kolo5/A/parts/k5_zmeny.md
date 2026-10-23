# k5: změny (reflections.json, experiments.json, safety.json)

Měnil jsem jen textové hodnoty. Klíče, `id`, `tag`, `evidence`, `techniqueId(s)`, `source`, čísla a pořadí zůstaly beze změny. `check_a.py` u těchto tří souborů nehlásí žádnou chybu ani varování.

| Soubor | Upravených řetězců | Hlavní typy úprav |
|---|---|---|
| reflections.json | 40 z 54 | jednotný přepis Čuang-c' (jen v textech, zdroje zůstaly), české uvozovky u citovaných vět, rozdělené dlouhé souvětí, opravený slovosled (příklonky), kalky („čte jako“ → „chápe jako“), nejasné vztažné „který“, vata kolem metafory „cesta“ |
| experiments.json | 47 | slovník: ADA = „Vědomí po celý den (ADA)“, uzemnění podle ostatních souborů; místo středníků samostatné věty; pokyny jako slovesa v rozkazovacím způsobu („Přes den udělej…“); přímá řeč v uvozovkách; plynulejší slovosled |
| safety.json | 13 | jasnější vztah zájmen („ho“ po výčtu), přirozenější věty, doplněná dvojtečka před výčtem, upřesnění „Občasné noční můry“; `nightSteps` jsem neměnil (všechny mají nejvýš 6 slov) |

## Nejzajímavější příklady „před → po“

1. `reflections.json` → `reflections[r27].text`
   „Přesně tohle zkoumá otázka, jak vede cesta až sem.“ → „Přesně tohle zkoumá otázka „Jak jsem se sem dostal?““
2. `reflections.json` → `reflections[r31].text`
   „svět, který vidíš, je nejlepší odhad mozku, který smysly průběžně drží při zemi“ → „svět, který vidíš, je nejlepší odhad tvého mozku a smysly ho průběžně drží při zemi“ (původní „který“ se vztahovalo k mozku)
3. `reflections.json` → `reflections[r33].text`
   „Když Frederic Bartlett nechal lidi opakovaně převyprávět cizí příběh, každým převyprávěním se víc podobal jejich vlastnímu světu.“ → „Frederic Bartlett nechal lidi opakovaně převyprávět cizí příběh. S každým převyprávěním se příběh víc podobal jejich vlastnímu světu.“ (chyběl podmět, gramaticky se „podobal“ vztahoval k Bartlettovi)
4. `reflections.json` → `reflections[r09].text`
   „Párkrát dnes řekni: tohle je jako sen. Jako, ne neskutečné. Když přijde úzkost, chodidla na zem.“ → „Párkrát si dnes řekni: „Tohle je jako sen.“ Jako sen, ne neskutečné. Když přijde úzkost, polož chodidla na zem.“
5. `reflections.json` → `reflections[r54].text`
   „Učitelé jógy snu radí ve snu se ke strachu obrátit místo útěku. Strach podle nich drží hlavně dojem…“ → „Učitelé jógy snu radí před strachem ve snu neutíkat, ale obrátit se k němu čelem. Strach podle nich živí hlavně dojem…“
6. `reflections.json` → `reflections[r51].text`
   „…začíná ve dne: opakovaně si připomínat, že to, co právě prožíváš, je jako sen.“ → „…začíná ve dne: opakovaně si připomínáš, že to, co právě prožíváš, je jako sen.“ (míchání infinitivu a 2. osoby)
7. `experiments.json` → `experiments[adaVsQuickTest].title` a `arms[B].label`
   „Kritická reflexe (ADA), nebo rychlý test“ → „Vědomí po celý den (ADA), nebo rychlý test“ (podle SLOVNIK.md a program.json)
8. `experiments.json` → `experiments[rtThreeVsSix].question`
   „Přidá mi šest testů reality denně něco proti třem pořádným?“ → „Pomůže mi šest testů reality denně víc než tři pořádné?“
9. `experiments.json` → `experiments[rtThreeVsSix].why`
   „…přenos návyku z jednoho dne do dalšího rozdíl spíš rozmaže, nevyrobí.“ → „Návyk se přenáší i do dalšího dne, takže rozdíl spíš rozmaže, než aby ho vytvořil.“
10. `experiments.json` → `experiments[rtThreeVsSix].safety` (stejně `adaVsQuickTest` a `meditationEvening`)
    „přestaň a přejdi na Návrat do těla a do přítomnosti“ → „přestaň a přejdi na uzemnění“ (stejné znění jako v techniques.json, lessons.json, program.json a safety.json)
11. `experiments.json` → `experiments[mildVsJournal].arms[B].instruction`
    „Řekni si: Až budu příště snít, uvědomím si, že sním. Představ si, že to poznáš.“ → „Řekni si: „Až budu příště snít, uvědomím si, že sním.“ Představ si, že to ve snu poznáš.“
12. `experiments.json` → `experiments[caffeineCutoff].arms[B].instruction`
    „…kola ani energetický nápoj. Dopoledne jako obvykle.“ → „…kola ani energetické nápoje. Do té doby jako obvykle.“ (zákaz platí od 14:00, ne od poledne)
13. `safety.json` → `screening.results.limitWbtb.body`
    „Deník, záměr a denní praxe běží. Zapnout ho můžeš v nastavení…“ → „Deník, záměr a denní praxe běží dál. Noční probuzení zapneš v nastavení…“ („ho“ se po výčtu nevztahovalo k ničemu)
14. `safety.json` → `locks.noSleep.body`
    „Usínání po technice tentokrát nešlo.“ → „Po technice se ti tentokrát nepodařilo usnout.“

## Vědomě ponecháno
- „Předletová kontrola“ (`screening.title`, `locks.screening.body`): je to název funkce, který používá i copy.json.
- `nightSteps` a `steps` bezpečnostních karet: jsou krátké, klidné a v limitu, a tak zůstaly beze změny.
- Rozsahy typu „10 až 30 minut“ a „0 až 10“ v pokynech experimentů jsem nepřepisoval na pomlčku, protože se slovy se v pokynu čtou lépe.
