# k4: změny v textech UI (copy*.json)

Výchozí stav byl celkem čistý (typografie bez chyb: žádné rovné uvozovky, „—“, „...“ ani nalepené jednotky). Úpravy jsou hlavně sjednocení pojmů a tlačítek, noční texty do 6 slov a oprava 3 popisků ilustrací.

## Počty upravených řetězců (podle check_a.py)
| Soubor | Řetězců |
|---|---|
| copy.json | 26 |
| copy_design.json | 7 |
| copy_devices.json | 12 |
| copy_journal.json | 9 |
| copy_lab.json | 10 |
| copy_reality.json | 8 |
| copy_training.json | 3 |
| **celkem** | **75** |

check_a.py: u všech 7 souborů 0 chyb a 0 varování.

## Hlavní linie sjednocení
- **Kategorie znaků snů** podle zadání (B) a ilustrace `dreamSignGrid`: Děj, Souvislosti, **Podoba**, **Vnitřní prožitek** (dřív v copy.json „Tvar“ a „Vědomí“). Totéž v `patches[7].condition`.
- **Tlačítko „Nic si nepamatuju“** (dřív „Nic si nevybavuju“). Tak ho jmenuje zadání C a sedí s `journal.emptyNightBody`.
- **„Zapsat sen“** podle SLOVNIK.md: `texts.journal.newEntry` (dřív „Nový zápis“).
- **zápis místo záznamu** pro deník i laboratoř (Zápisy: {pocet}, Zápis, nocí se zápisem, Bez zápisu, Oprav zápis).
- **Stejná akce = stejné slovo:** „Vyzkoušet teď“ (techniky i testy), „Vibrace hodinek“ (dvě obrazovky), „Tvoje znaky snů“, „Tenhle test jsme nenašli.“ (jako u techniky a lekce), „Pozastavit“ místo „Pauza“ (vedle „Přehrát nahrávku“), „Učesání textu“ místo „Úprava textu“ (k tlačítku „Učesat text“), stavové štítky v krátkém tvaru („Nahrávka uložena“, „Klíč uložen“).
- **„Klepni“** všude (dřív i „Ťukni“).
- **Když … tak …**: výpustka s mezerou a čárka před „tak“, sjednoceno ve třech souborech.
- **Techniky:** WBTB v copy.json ve formátu „(WBTB)“ jako jinde v souboru, „Vědomí po celý den (ADA)“, „budík WBTB“ nahrazený „budíkem pro noční probuzení“ nebo „nočním budíkem“.
- **Noční obrazovka:** všechny `texts.night.*` mají nejvýš 6 slov (calmBody, mildAtWakeBody, wbtbBody, awake, awakeLimit). Rozsah je teď „5–10 min“.
- **Kalk „dávat smysl“** v laboratoři pryč.

## Příklady před → po
1. `copy_training.json` `texts.training.art.ssild.rhythm`: „4× RYCHLE, PAK POMALU“ → „4× RYCHLE → POMALU“ (3 slova, číslo zachované)
2. `copy_training.json` `texts.training.art.body.caption`: „SCHÉMA POZORNOSTI, NE ANATOMIE“ → „SCHÉMA, NE ANATOMIE“ (vzor „PRINCIP, NE MĚŘENÍ“)
3. `copy_training.json` `texts.training.art.breath.note`: „VÝDECH DELŠÍ NEŽ NÁDECH“ → „DELŠÍ VÝDECH“
4. `copy.json` `texts.night.mildAtWakeBody`: „Probudíš se v noci? Nehýbej se a začni s MILD.“ → „Probudíš se? Nehýbej se, opakuj záměr.“
5. `copy.json` `texts.night.wbtbBody`: „Budík zhruba pět hodin po usnutí, krátká technika a zpátky spát.“ → „Po pěti hodinách budík a technika.“
6. `copy.json` `nightGuide[4].night`: „MILD, nebo SSILD?“ → „Záměr, nebo střídání smyslů?“ (česky první, i v noci)
7. `copy.json` `texts.signs.awareness` / `form`: „Vědomí“ / „Tvar“ → „Vnitřní prožitek“ / „Podoba“
8. `copy.json` `texts.morning.emptyNight`: „Nic si nevybavuju“ → „Nic si nepamatuju“
9. `copy_reality.json` `texts.reality.test.guide.doTest`: „Teď test“ → „Udělej test“ (aby se nepletl s tlačítkem „Test teď“)
10. `copy_reality.json` `texts.reality.hub.today`: „Dnešní plán“ → „Dnešní připomínky“ (časová osa testů; „Plán na dnešek“ podle slovníku patří večernímu plánu, tak ať se nepletou)
11. `copy_lab.json` `texts.lab.verdict.clearA.body`: „…rozdíl je dost velký, aby dával smysl.“ → „…rozdíl je dost velký, aby se s ním dalo počítat.“
12. `copy_lab.json` `texts.lab.endPrompt`: „Klidně si mezi tím dej…“ → „Klidně si mezitím dej…“ (pravopis)
13. `copy_devices.json` `texts.telemetry.avgHr` / `lowestHr`: „Tep průměr“ / „Tep nejnižší“ → „Průměrný tep“ / „Nejnižší tep“
14. `copy_design.json` `texts.design.program.spanWeek1`: „Den 1–14“ → „Dny 1–14“ (stejně u 15–28 a 29–42)
15. `copy_journal.json` `texts.morning.feelingLow` / `High`: „vyčerpaný“ / „svěží“ → „vyčerpaně“ / „svěže“ (bez rodu, stejně jako stupnice feeling1–5)
