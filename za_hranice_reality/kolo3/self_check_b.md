# Kolo 3, část B: Osobní laboratoř (N-of-1). Kontrola

## Soubory

| Soubor | Co obsahuje |
|---|---|
| `experiments.json` | 12 šablon experimentů podle schématu ze zadání |
| `nof1.dart` | výpočet: modely, verdikty, kontrolní body, plánovač `schedule()`, pravidla WBTB, čtení šablony, klíče textů. Čistý Dart 3.6, jen `dart:math` |
| `nof1_test.dart` | 31 testů (`package:test`), z toho 5 simulačních a 2 kontroly obsahu JSON |
| `laborator_texty.json` | texty `{"texts":{"lab":{…}}}`, všechny klíče, které vrací `nof1.dart`, plus texty UI |
| `self_check_b.md` | tenhle soubor |

## Jak jsem ověřoval (přesné příkazy a výstupy)

Prostředí: Dart SDK 3.6.2 (stable) z Flutter SDK v pracovní složce, minimální balíček `nof1_pkg` (`sdk: ^3.6.0`, dev: `test ^1.25.0`, `lints ^5.0.0`), `analysis_options.yaml` = `package:lints/recommended.yaml` + `curly_braces_in_flow_control_structures`.

```
$ dart --version
Dart SDK version: 3.6.2 (stable) (Wed Jan 29 01:20:39 2025 -0800) on "linux_x64"

$ dart pub get
Changed 49 dependencies!

$ dart format -l 120 lib test
$ dart analyze
Analyzing nof1_pkg...
No issues found!

$ python3 -I brace_fix.py lib/nof1.dart --check
lib/nof1.dart: 0 braceless bodies at lines []
$ python3 -I brace_fix.py test/nof1_test.dart --check
test/nof1_test.dart: 0 braceless bodies at lines []

$ NOF1_DATA=za_hranice_reality/kolo3 dart test -r expanded
FP 14 nocí: recall clearA 0.007 clearB 0.010, vividness clearA 0.008 clearB 0.004
FP lucid 12/12 %, 10/20/30/40 nocí na variantu: 0.155
Síla lucid 8 vs 20 %, do 40 nocí na variantu: clearB 0.497, clearA 0.000
Síla recall 1,0 vs 1,6, 28 nocí, jeden pohled: clearB 0.259, clearA 0.004
00:11 +31: All tests passed!

$ python3 -c "import json; json.load(open('experiments.json')); json.load(open('laborator_texty.json'))"
(bez chyby)
$ grep -c $'\u2014' experiments.json laborator_texty.json nof1.dart nof1_test.dart self_check_b.md
0 ve všech souborech
```

Testy JSON najdou soubory přes proměnnou `NOF1_DATA` (jinak `.`, `test/`, `assets/`, `../kolo3`); když je nenajdou, přeskočí se s hláškou. V appce uprav v testu import `package:nof1_pkg/nof1.dart` na skutečné umístění.

### Seznam testů (31)
- Plánovač: alternating střídá, je vyvážený a deterministický, oba začátky se losují · randomBlocks: každý blok 4 je 2× A a 2× B, rozdíl počtů nejvýš 1, objeví se všech 6 pořadí · blok 2 a chybné vstupy · kontrolní body · `fullSchedule` (plán i prodloužení vyvážené) · `seedFrom`.
- Rozdělení: generátor je deterministický a rovnoměrný · Beta sampler (průměr, rozptyl, tvar < 1) · ln Γ, neúplná beta, Studentovo t proti tabulkovým hodnotám · Monte Carlo P(B > A) proti přesnému vzorci (Miller 2015).
- Verdikty: pracovní příklady ze specifikace TOP 4 (4 z 15 vs 1 z 15 → P(d > 0) ≈ 0,91 → v průběžném bodě zatím nevíme, na konci jen náznak; 7 z 20 vs 1 z 20 → P(d > 0,05) ≈ 0,96 → vychází lépe; 2 z 10 vs 2 z 10 → zatím nevíme) · málo nocí = `tooEarly` bez čísel · jasný rozdíl ve vybavování obouma směry · obě varianty bez lucidity = prakticky stejné · chybějící noci a cizí varianty · lucidní noc z lucidity ≥ 5, ořez rozsahu · trend v čase při pevném pořadí AB nezkreslí rozdíl · otočení rozdílu v čase dá štítek · determinismus seedu · přísné pravidlo nikdy nepovolí víc · `analyzeExperiment` + vysvětlení + detail · `formatCz`.
- Simulace: falešně pozitivní na 14 nocích (jeden pohled) · lucid 12/12 % a 5/5 % přes 4 kontrolní body (pojistka ze specifikace ≤ 15 %) · síla lucid 8 vs 20 % · síla recall 1,0 vs 1,6 · učení v čase při nulovém rozdílu.
- WBTB: `wbtbIssues` (14 dní, po sobě, 2 za 7 nocí, špatná noc) · rozpis experimentu přes vhodné noci v 30 simulovaných plánech nikdy neporuší pravidla, špatný plán se pozná.
- Obsah: `experiments.json` podle schématu (10–12 šablon, unikátní id, povolené techniky z 22, varianty A/B, výstupy, primární výstup jde na konci plánu vyhodnotit, zdroj s rokem, WBTB šablony uvádějí pravidla, bez dlouhé pomlčky) · `laborator_texty.json` má všechny klíče z `nof1CopyKeys()` a zástupné symboly v textech přesně odpovídají argumentům z kódu.

## Statistika a zdůvodnění prahů

### Modely
- **Lucidní noc (`lucid`)**: beta-binomický model, stejný prior **Beta(1, 9)** pro obě varianty (specifikace TOP 4). Průměr 10 %, váha 10 nocí. Odpovídá rešerši: spontánně kolem 4 % nocí, praktikující zhruba 5–15 %, nejlepší domácí kombinace 16–20 % (Aspy 2017; Aspy 2020). Stejný prior nic nezvýhodňuje, jen tlumí náhodné rozdíly. Volitelně `lucidPriorMean` po výchozím týdnu (ořez 3–25 %, váha zůstává 10). Slabý prior Beta(1, 1) jsem nepoužil: u vzácné události táhne odhad k 50 % (1 LD z 10 nocí dá odhad 17 % místo 10 % s Beta(1, 9)) a malé vzorky by víc kolísaly. P(d > 0), P(d > ROPE), P(d < −ROPE) a 90% interval z 20 000 tahů Monte Carlo (Beta přes dva tahy Gamma, Marsaglia a Tsang 2000) s pevným seedem; test kontroluje shodu s přesným vzorcem.
- **Počty snů a škály 0–10 (`recall`, `vividness`, `lucidity`, `sleepFeeling`)**: bayesovský t-model se sdruženým priorem, řešený přesně (bez náhody): y = průměr + d · varianta + c · čas. Na průměr a trend plochý prior, na rozdíl d **skeptický prior N(0, σ²/κ0) s κ0 = 3** (ve standardizovaných jednotkách SD 0,58), na rozptyl slabý prior s váhou 2 nocí (σ0 = 1 sen, u škál 2 body). Výsledek pro d je Studentovo t, tedy těžší konce při malém vzorku. Hodnoty se oříznou do rozsahu (počet snů 0–10).
- **Trend (učení se)**: lineární člen času je v modelu vždy (od 6 nocí), takže postupné zlepšení se nepřipíše variantě. Hlavní ochrana je ale návrh: `alternating` (ABAB s losovaným začátkem) a `randomBlocks` (zamíchané bloky AABB) drží obě varianty rovnoměrně v čase. Při pevném pořadí A → B by učení samo vyrobilo „lepší B“; test to ukazuje (prostý rozdíl > 0,2, upravený < 0,2). Štítek `changesOverTime` hlídá, jestli se rozdíl během experimentu otočil (model s interakcí varianta × čas, P ≥ 0,99 a změna ≥ 2 ROPE; při nulovém rozdílu se ukáže u 0,3–2,4 % experimentů).
- **Chybějící noci**: `null` se vynechá jen u daného výstupu, čas se počítá ze skutečného data (díry nezkreslí trend). Víc než 30 % nocí bez údaje = štítek `manyMissing`. Noci s jinou variantou než A/B se ignorují.
- **Malý vzorek**: pod minimem nocí na variantu je vždy `tooEarly` (`fewNights`) a appka neukáže žádná čísla. Minimum je větší z `minNightsPerArm` ze šablony a z minima výstupu (lucidní noc 10, ostatní 5).

### ROPE (oblast praktické shody, Kruschke 2018)
- lucidní noc 0,05 (5 nocí ze 100, specifikace), vybavené sny 0,3 snu za noc (asi 2 sny týdně), škály 0,5 bodu (pod rozlišením celočíselné škály).

### Pravidla verdiktu

| Verdikt | Výchozí pravidlo | Přísné | Kdy |
|---|---|---|---|
| `tooEarly` | pod minimem nocí, nebo žádné pravidlo níž (důvod `inconclusive`, v posledním bodě `inconclusiveAtMax`) | stejně | vždy |
| `clearB` / `clearA` | P(d > 0) ≥ 0,95 a P(d > ROPE) ≥ 0,80 (zrcadlově pro A) | 0,975 a 0,85 | každý kontrolní bod |
| `noDifference` | P(\|d\| < ROPE) ≥ 0,80 | 0,85 | každý kontrolní bod |
| `leanB` / `leanA` | P(d > 0) ≥ 0,90 a P(d > ROPE) ≥ 0,50 | 0,95 a 0,60 | **jen v závěrečném bodě** (konec plánu nebo prodloužení) |

Proč takhle:
- Jasný verdikt a shoda jsou přesně pravidla ze specifikace TOP 4. Simulace ve specifikaci ukázaly, že volnější prahy (0,90 a 0,70) dávají přes čtyři pohledy falešný verdikt u 30 % lidí, a mezistupeň s 0,80 dokonce u 64 %.
- Zadání chce šest verdiktů včetně náznaku. Náznak proto smí jen v závěrečném bodě, nikdy průběžně, a vždy s textem „může to být náhoda, náznak, ne závěr“. Při nulovém rozdílu se ukáže zhruba u 1 z 10 experimentů (tabulka níž), proto se nikdy nepodává jako výsledek.
- Kontrolní body: `checkpoints(nights)` = polovina plánu (jen u plánů od 20 nocí), konec plánu a nejvýš dvě prodloužení po 14 nocích; celkem nejvýš 4 pohledy jako ve specifikaci. Mezi body se nevyhodnocuje (předčasný pohled jen se štítkem `earlyLook`).
- κ0 = 3 jsem vybral simulací (2 000 opakování na variantu): s κ0 = 2 vycházel u šikmých dat (lucidita s mnoha nulami, rozptýlené počty snů) falešný jasný verdikt přes všechny body 13–14 %, s κ0 = 3 nejvýš 10,8 %, s κ0 = 4 asi 8 %, ale síla klesla o dalších 5 bodů. Je to stejný řád tlumení jako u Beta(1, 9) pro lucidní noc. Cena: na 14 nocích model naměřený rozdíl zhruba napůl zmenší. Proto text vysvětlení ukazuje naměřené průměry a vedle nich pásmo rozdílu z modelu.
- Pravděpodobnosti nejsou kalibrovaná procenta: appka je ukazuje jen v detailu „Jak to počítám“ jako desetinné číslo s poznámkou `lab.detail.note`, verdikt je vždy slovy. Lucidní noc navíc přirozenými četnostmi („ze 100 nocí asi 10 a 23“, Gigerenzer a Hoffrage 1995).

### Plánovač `schedule(design, nights, seed, {blockSize = 4})` a `fullSchedule`
- `alternating`: ABAB nebo BABA, začátek losovaný. Rovnováha v čase je nejtěsnější možná; losovaný začátek dělá zbytkový posun o půl noci bez systematického směru. Perioda 2 se nekryje s týdnem, takže obě varianty padnou na všechny dny v týdnu.
- `randomBlocks`: zamíchané vyvážené bloky po 4 (nebo 2). Stejná ochrana proti trendu po každých 4 nocích, ale další noc se nedá snadno uhodnout, což tlumí očekávání u nezaslepených variant. Zbytek se doplní blokem 2 a případně jednou losovanou nocí, rozdíl počtů je nejvýš 1.
- Generátor je vlastní Mulberry32 s 32bitovou aritmetikou, protože `dart:math` Random nezaručuje stejnou posloupnost napříč platformami. Seed doporučuji `seedFrom('<experimentId>|<datum startu>')` a uložit ho k experimentu.

### WBTB
- `wbtbIssues(night, previous, programStart, lastNightGood)` vrací důvody: `inFirst14Days`, `consecutiveNights`, `moreThanTwoPerWeek` (libovolných 7 po sobě jdoucích nocí, přísnější než kalendářní týden), `afterPoorSleep`. `validateWbtbPlan` zkontroluje celý plán.
- Experimenty s `wbtb` v `techniqueIds` (`Nof1Template.needsWbtbNights`) běží jen na nocích, které projdou `wbtbIssues`: n-tá vhodná noc dostane n-tou položku rozpisu. U `wbtbVsMorning` je WBTB jen varianta B, takže se probouzíš nejvýš asi jednou týdně; noc A se do limitu nepočítá. U `wbtbMildVsSsild` mají obě varianty stejné probuzení. Test v 30 simulovaných plánech (20 % špatných nocí) nenašel žádné porušení.

## Operační charakteristiky (simulace, 3 000 opakování)

Generátory: lucidní noc Bernoulli; vybavené sny Poisson, varianta s rozptýlenými počty (negativně binomické, tvar 2) a s trendem +50 % za experiment; živost snu normální SD 2 se závislostí mezi nocemi AR(1) ρ = 0,3, zaokrouhlená na 0–10, varianta s trendem +2 body; lucidita s mnoha nulami (65 % nul, 25 % záblesků 1–4, lucidní noc 5–10). „Sekvenčně“ = všechny kontrolní body až do maxima, zastaví se u jasného verdiktu nebo shody.

### Nulový rozdíl (falešně pozitivní)

| Scénář | Plán | Jeden pohled na konci plánu: clearA + clearB | Sekvenčně do maxima: falešný jasný verdikt (výchozí / přísné) | Náznak na konci (výchozí) |
|---|---|---|---|---|
| vybavené sny 1,2 vs 1,2 | 14 nocí (max 42) | **2,1 %** | 7,6 % / 3,0 % | 10,3 % |
| vybavené sny, trend +50 % | 14 (42) | 2,0 % | 9,3 % / 4,6 % | 9,1 % |
| vybavené sny, rozptýlené | 14 (42) | 1,8 % | 9,3 % / 3,7 % | 7,4 % |
| živost 4 vs 4, AR(1) | 14 (42) | **0,2 %** | 1,8 % / 0,6 % | 4,5 % |
| živost, trend +2 body | 14 (42) | 1,4 % | 5,7 % / 2,4 % | 7,6 % |
| živost 4 vs 4 | 28 (56) | 2,8 % | 6,3 % / 2,6 % | 8,0 % |
| lucidita s nulami 10 vs 10 % | 28 (56) | 4,3 % | 10,8 % / 5,2 % | 8,2 % |
| lucidní noc 12 vs 12 % | 28 (56) | 4,2 % | 11,3 % / 5,5 % | 8,7 % |
| lucidní noc 5 vs 5 % | 28 (56) | 0,7 % | 3,5 % / 1,4 % | 6,9 % |
| lucidní noc 17 vs 17 % (WBTB noci) | 20 (48) | 4,6 % | 13,5 % / 7,1 % | 8,0 % |

V testu (1 000 opakování) vyšlo na 14 nocích: vybavené sny clearA 0,7 % + clearB 1,0 %, živost 0,8 % + 0,4 %. Na 14 nocích je lucidní noc vždy `tooEarly` (7 nocí na variantu < 10), falešný verdikt tam tedy nevznikne vůbec.

### Skutečný rozdíl (síla, správný jasný verdikt)

| Scénář | Plán | Jeden pohled na konci plánu | Sekvenčně do maxima (výchozí / přísné) | Chybný směr |
|---|---|---|---|---|
| vybavené sny 1,0 vs 1,6 | 14 (42) | 8,0 % (+ náznak 12,6 %) | 42,3 % / 30,4 % | 0,1 % |
| vybavené sny 1,0 vs 1,6 | 28 (56) | 25,8 % (+ náznak 18,6 %) | 53,0 % / 42,4 % | 0,1 % |
| vybavené sny 1,6 vs 1,0 (A lepší) | 14 (42) | 8,6 % | 43,6 % / 31,8 % | 0,1 % |
| vybavené sny 1,0 vs 2,0 | 14 (42) | 19,0 % | 78,6 % / 67,2 % | 0 % |
| živost 4 vs 5,5 | 14 (42) | 11,5 % | 72,6 % / 58,6 % | 0 % |
| živost 4 vs 5,5 | 28 (56) | 47,9 % | 83,3 % / 74,5 % | 0 % |
| lucidita s nulami 8 vs 20 % LD | 28 (56) | 12,4 % | 33,3 % / 20,6 % | 0,4 % |
| lucidní noc 8 vs 20 % | 28 (56) | 15,3 % | 38,4 % / 25,9 % | 0,3 % |
| lucidní noc 10 vs 30 % | 28 (56) | 32,3 % | 63,5 % / 49,5 % | 0,1 % |

### Kontrola proti specifikaci TOP 4 (body 10/20/30/40 nocí na variantu, výchozí pravidlo)

| Skutečný stav | Specifikace | Tahle implementace (3 000 opakování) |
|---|---|---|
| 30 % vs 10 %: správný verdikt do 40 nocí | 78 % | 78,1 % |
| 20 % vs 8 % | 51 % | 50,3 % |
| 17 % vs 5 % | 53 % | 54,2 % |
| 15 % vs 10 % | 21 % | 20,9 % |
| 12 % vs 12 %: falešný verdikt | 14 % | 14,6 % |
| 5 % vs 5 %: falešný verdikt | 4 % | 5,4 % |

Implementace tedy reprodukuje čísla ze specifikace. Pojistka ze specifikace (při 12 vs 12 % nejvýš 15 % falešných verdiktů) platí; test ji hlídá s tolerancí Monte Carla (600 opakování, deterministicky 15,5 % ≤ 15 % + 2 SE).

## Šablony experimentů a volba hlavního výstupu

| id | Otázka (zkráceně) | Návrh | Nocí (min. na variantu) | Hlavní výstup | Důkazy |
|---|---|---|---|---|---|
| recallIntention | večerní záměr pamatovat si sen vs jen deník | alternating | 14 (5) | recall | promising |
| voiceVsWriting | ranní zápis hlasem vs písmem | alternating | 14 (5) | recall | community |
| caffeineCutoff | bez kofeinu po 14:00 vs obvyklý den | alternating | 14 (5) | sleepFeeling | strong |
| mildVsJournal | Záměr poznat sen (MILD) vs jen deník | randomBlocks | 28 (10) | lucidity | strong |
| ssildVsMildMorning | Střídání smyslů (SSILD) vs MILD při ranním probuzení | randomBlocks | 28 (10) | lucidity | promising |
| wbtbVsMorning | MILD po WBTB vs jen ráno, jen na nocích, kdy je WBTB dovolené | randomBlocks | 20 vhodných (8) | lucidity | strong |
| wbtbMildVsSsild | po WBTB: MILD vs SSILD, jen WBTB noci | alternating | 20 WBTB nocí (10) | lucid | promising |
| rtThreeVsSix | 3 vs 6 testů reality denně | randomBlocks | 28 (10) | lucidity | community |
| adaVsQuickTest | Kritická reflexe (ADA) vs rychlé testy | randomBlocks | 28 (10) | lucidity | community |
| incubationTheme | inkubace tématu vs bez | alternating | 14 (5) | recall | promising |
| dreamYogaEvening | noční příprava jógy snu vs bez | alternating | 20 (7) | vividness | tradition |
| meditationEvening | 10 min šamathy večer vs bez | randomBlocks | 28 (10) | lucidity | promising |

- Lucidní noc je hlavním výstupem jen tam, kde je dost častá (po WBTB 16–20 %), a i tam `why` poctivě říká, že to potrvá 10 a víc týdnů. Jinde je hlavní škála lucidity 0–10 (zachytí i záblesky, víc informace z každé noci), u vybavovacích otázek počet snů, u kofeinu pocit ze spánku (spánek má přednost; víc probuzení může vybavování paradoxně zvednout).
- `randomBlocks` volím tam, kde se technika může přenášet do dalších nocí (záměr, denní návyky): přenos rozdíl rozmaže, nevyrobí. `alternating` tam, kde jde hlavně o jednoduchost rutiny.
- Bezpečnost: lucidní techniky „až po prvních 14 dnech programu“, WBTB podle pravidel (appka hlídá `wbtbIssues`), žádné série ani tresty, žádné doplňky ani galantamin, kofeinová varianta A není pokyn pít víc, test reality ani zastavení nikdy za volantem, při pocitu odpojení pauza a Návrat do těla a do přítomnosti.
- Přidané pole navíc proti schématu není žádné. Potřebu WBTB nocí appka pozná z `techniqueIds` (obsahuje `wbtb`).

## Napojení v appce (krátce)
1. Start: `seed = seedFrom('$id|$start')`, `arms = fullSchedule(t.design, t.nights, seed)` (rozpis rovnou až do maxima; plán i každé prodloužení o 14 nocí jsou samostatné vyvážené úseky, prvních `nights` položek je přesně `schedule(t.design, t.nights, seed)`).
2. Každý večer: u WBTB šablon `wbtbIssues(...)`; prázdné = noc patří experimentu a dostane další položku rozpisu, jinak text `lab.wbtb.<issue>`.
3. V kontrolním bodě: `analyzeExperiment(nights, outcomes: t.outcomes, primary: t.primary, minNightsPerArm: t.minNightsPerArm, finalLook: index >= finalCheckpointIndex(t.nights), canExtend: index < t.checkpointNights.length - 1)`.
4. UI: titulek a věta z `titleKey` / `bodyKey` (`{arm}` = popisek varianty `favoredArm`), `reasonLine` (`{min}`), `flagKeys`, `explanation`; detail z `detailLines`. Čísla jen tam, kde `showsNumbers`.

## Limity
- Jedna osoba, malý vzorek: i při správných prazích vychází falešný jasný verdikt při nulovém rozdílu u 0,2–4,6 % experimentů s jedním pohledem na konci plánu a u 2–14 % při prodlužování až do maxima. Náznak při nulovém rozdílu zhruba u 1 z 10.
- `noDifference` je na jednom člověku vzácné (prokázat shodu potřebuje víc dat než prokázat rozdíl). Obvyklý výsledek bez rozdílu je `tooEarly` s `inconclusiveAtMax`: „rozdíl je menší, než umíme poznat, vyber, co tě baví“.
- Varianty nejsou zaslepené: očekávání může část rozdílu vyrobit (štítek `unblinded` vždy). Výstupy jsou sebehodnocení.
- Přenos mezi nocemi (učení, návyk z dne do noci) model nezachytí jinak než lineárním trendem a štítkem změny v čase; přenos spíš zmenšuje rozdíl.
- Vedlejší výstupy se vyhodnocují stejnými prahy bez korekce na mnohonásobné srovnání, proto jsou v UI jen doplněk (`lab.secondaryNote`).
- t-model předpokládá zhruba symetrický šum; u šikmých dat (lucidita s nulami) je chybovost o něco vyšší (10,8 % sekvenčně), proto skeptický prior κ0 = 3.
- Prahy, ROPE a κ0 jsou zvolené rozumně a ověřené simulací, ne odvozené z dat skutečných uživatelů. Po betě stojí za to zkontrolovat rozptyly a míru vynechaných nocí na anonymizovaných exportech.
- Determinismus generátoru je ověřený na Dart VM; na webu by měl platit taky (32bitová aritmetika), ale testovaný tam není. Simulační skript operačních charakteristik (`tool/oc.dart`, `tool/lucid_seq.dart`) zůstal v pracovním balíčku, do kola nepatří; stejné scénáře v menším rozsahu jsou v testech.
