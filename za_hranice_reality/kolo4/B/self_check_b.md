# Kolo 4, část B: model výskytu REM v2. Kontrola

Stav 23. 10. 2026.

## Soubory

| Soubor | Co obsahuje |
|---|---|
| `rem_types.dart` | A: typy appky přesně ze zadání (`SleepStage`, `SleepSource`, `SleepSegment`, `SleepNight`, `RemLevel`, `remLevel()`, `RemWindow`) a náhrada `RemProbabilityParams` se čtyřmi poli, která čte `remLevel`. B: nové `RemMark` a `typedef Predictor`. Při integraci část A smaž a importuj originály. |
| `rem_model_v2.dart` | Model: HSMM jedné noci (Oura + Garmin, matice záměn, ρ, γ, β, pojistka přehlédnutí REM periody, značky), Kalmanův osobní prior, prior predictive, Beta směs s nocemi, úrovně a okna. API `remWindowsV2(...)` (signatura ze zadání plus volitelná `cache`), `RemModelV2Params` s výchozími hodnotami, výstup `RemWindowV2 extends RemWindow` s `probability`, `probabilityLow`, `probabilityHigh`, `deviceProbability` a sdílenou křivkou `RemCurveV2`. |
| `rem_backtest.dart` | Walk-forward harness `backtest(nights, marks, predictor)`, metriky, `bestRemWindow`, párové srovnání `comparePaired` s bootstrapem, výpis do Markdownu. |
| `rem_baseline.dart` | Napodobenina dnešního modelu: vážený průměr hypnogramů (60 nocí, poločas 30 dní), populační šablona, ruční značky. |
| `rem_synth.dart` | Generátor syntetických nocí s pevným seedem. |
| `rem_v2_test.dart` | 23 testů (`package:test`). |
| `rem_synth_report.dart` | Skript, který vypíše všechny tabulky tohoto souboru (v balíčku `tool/`). |
| `doporuceni_parametru.md` | Výchozí parametry, co ladit a v jakých mezích, protokol srovnání se dnešním modelem. |

Importy v testu a ve skriptu jsou `package:rem_pkg/...`. V appce je přepiš na skutečné umístění.

## Jak jsem ověřoval (příkazy a výstupy)

Prostředí: Dart SDK 3.6.2 z Flutter SDK v pracovní složce. Balíček `rem_pkg` (`sdk: ^3.6.0`, dev `test ^1.25.0`, `lints ^5.0.0`) má v `lib/` pět souborů `rem_*.dart`, v `test/` test a v `tool/` skript. `analysis_options.yaml` = `package:lints/recommended.yaml` + `curly_braces_in_flow_control_structures`. Knihovny importují jen `dart:math`.

```
$ dart --version
Dart SDK version: 3.6.2 (stable) (Wed Jan 29 01:20:39 2025 -0800) on "linux_x64"

$ dart pub get
Got dependencies!

$ dart format -l 120 --output=none --set-exit-if-changed lib test tool
Formatted 7 files (0 changed) in 0.78 seconds.

$ dart analyze
Analyzing rem_pkg...
No issues found!

$ for f in kolo4/B/*.dart; do python3 -I brace_fix.py $f --check; done
rem_backtest.dart: 0 braceless bodies at lines []
rem_baseline.dart: 0 braceless bodies at lines []
rem_model_v2.dart: 0 braceless bodies at lines []
rem_synth.dart: 0 braceless bodies at lines []
rem_synth_report.dart: 0 braceless bodies at lines []
rem_types.dart: 0 braceless bodies at lines []
rem_v2_test.dart: 0 braceless bodies at lines []

$ dart test
00:05 +23: All tests passed!
$ TZ=Europe/Prague dart test
00:05 +23: All tests passed!
$ TZ=America/New_York dart test
00:05 +23: All tests passed!
$ TZ=Australia/Lord_Howe dart test      (změna času o 30 min)
00:05 +23: All tests passed!

$ grep -c $'\u2014' kolo4/B/*        (dlouhá pomlčka, U+2014)
0 ve všech souborech

$ cmp lib/*.dart kolo4/B/*.dart        (soubory v B jsou totožné s otestovanými)
bez rozdílu

$ dart run tool/rem_synth_report.dart all   (asi 5 min, výstup je v příloze níž)
```

### Testy (23)

- **Úrovně:**
  - `RemLevelRules.levelOf` dává totéž co `remLevel` z appky pro mřížku hodnot a zvednutý práh.
  - `remLevelRuns` na 200 náhodných křivkách: `high` ≤ 15 %, žádné okno pod 10 min, okna souvislá od 0 do konce.
- **Okrajové případy:**
  - Žádné noci: okna z populačního prioru, kotva zaokrouhlená na 5 min, začátek noci `unlikely`.
  - Jen Oura / jen Garmin: počty `ouraOnlyNights` / `garminOnlyNights` sedí, slabší Garmin dává méně vyhraněný posterior, `high` leží v REM bloku z historie.
  - Ruční noci (`manual`) se do REM nepočítají a nic nezmění.
  - Noc přes půlnoc: okna přes půlnoc, `contains`, posterior najde REM bloky.
  - Změna času, poslední neděle října i března 2026 (ověřeno, že jde o poslední neděle). Noc přes změnu času dá stejné offsety jako stejná noc o týden dřív. Mřížka má 102 epoch podle uplynulého času, ne podle ciferníku. Totéž zadané v místním čase dá stejné offsety a `to − onset` = `toOffset` minut. Test běží i s `TZ=Europe/Prague`, kde jde přes skutečnou změnu času.
  - Místní čas vs UTC: stejná syntetická data převedená `toLocal()` dají stejná okna, úrovně, pravděpodobnosti i počty značek.
  - Překryvy a mezery: zdvojené a obrácené úseky dají stejné podíly. Hodinová mezera = epochy bez dat. Kotva noci je usnutí Oury, i když Garmin začíná o 7 min později.
- **Ruční značky:**
  - „Probudil jsem se ze snu“ v čase T zvedne REM kolem T víc než sen bez probuzení, a pořád pod 0,9 (omezená váha).
  - Značka bez času nic nemění.
  - „Nic si nepamatuju“ sníží REM u ranního probuzení a začátek noci nechá.
  - Čas snu s datem večera se posune o kalendářní den.
  - `dreamMarks` / `wokeMarks` v oknech sedí a prázdná noc se nepočítá.
- **Model:**
  - log P(data) z dopředného a zpětného průchodu se shoduje na 1e-8, stavy se sčítají na 1, latence se pozná.
  - Prior predictive bez dat: 17–24 % REM za 8 h, vlna prvního cyklu a údolí po něm.
  - Vazba ρ drží marginály a nikdy nedá zápornou buňku. Naivní spojení (ρ = 0) je přehnaně jisté v REM i mimo něj.
  - Kalmanův filtr: pořadí lidí podle latence sedí, dlouhou latenci se naučí na ±10 min.
  - **Nezávislá kontrola HSMM:** posterior noci bez dat se na 1e-9 shoduje s apriorní obsazeností počítanou jiným algoritmem (dopředná rekurze začátků segmentů).
  - Determinismus: stejný seed dá stejná data, cache nemění výsledek, noci z dneška a budoucnosti se ignorují.
- **Backtest:**
  - Walk-forward bez nahlížení: prediktor dostane jen dřívější noci a značky a neměnitelné seznamy, usnutí = kotva noci.
  - Kalibrační koše a úrovně sečtou všechny epochy, srovnání prediktoru se sebou dá rozdíl 0 s intervalem [0, 0].
  - `bestRemWindow` řadí podle pravidla.
  - **Syntetika, 2 seedy po 100 nocích:** v2 má nižší log ztrátu i Brier podle úrovní než baseline ve všech třech variantách pravdy, interval párového rozdílu leží celý pod nulou, hustota REM klesá od `high` k `unlikely`, `high` ≤ 15 %, ECE vlastní pravděpodobnosti < 0,06 a střed nejlepšího okna trefí REM aspoň stejně často (tolerance 5 p. b.).
  - Generátor: přesnost zařízení v mezích z rešerše, Garmin horší než Oura, korelace chyb 0,15–0,45, přes 70 % značek s časem ve druhé polovině noci, jsou i prázdné noci a značky bez času.

## Syntetická data

Generátor `rem_synth.dart` záměrně počítá jinak než model, aby test nebyl kruhový:
- **Pravda:**
  - Začátky REM tvoří mřížku s chvěním (Schulz 1980), ne obnovovací proces jako v modelu.
  - Cyklus kolem 95 min, uvnitř noci SD 12 min.
  - První REM po 75–110 min (osobní průměr se losuje v rozsahu 82–100 min, mezi nocemi SD 10 min a pomalý drift).
  - 8 % nocí s vynechaným prvním REM, 5 % nocí s pozdním a zkráceným prvním REM.
  - REM bloky k ránu delší (12 → 34 min).
  - Hluboký spánek hlavně v prvních dvou cyklech.
  - Krátká probuzení (35 % hned po REM) a občas dlouhé bdění.
  - Delší víkendové noci.
- **Zařízení:** chyby lokální a korelované.
  - Společné i vlastní přehlédnutí celé REM periody.
  - Oura začíná REM asi o 3 min dřív, Garmin o 5 min později.
  - Výpadky uvnitř REM po 3min blocích.
  - Falešné REM bloky v lehkém spánku, společné i vlastní.
  - Garmin značí 45 % krátkých probuzení jako REM.
  - Oura je agregovaná na 5 min, Garmin po minutách.
  - Oura chybí v 5 % nocí, Garmin v 15 %, noc bez obou zařízení dostane ruční záznam.
- **Realizovaná přesnost po minutách** (400 nocí, seed 1): Oura citlivost 0,779 a falešné poplachy 0,080, Garmin 0,484 / 0,136, korelace chyb (phi) 0,269. Model počítá s 0,70 / 0,10 a 0,50 / 0,15, tedy mírně jinak, jako ve skutečnosti.
- **Ruční značky:**
  - Ranní probuzení z REM si pamatuje 65 %, z NREM 25 %.
  - Noční probuzení slábnou s časem do rána, sny bez probuzení jen z posledních 3 h.
  - Čas ±15 min (SD), 15 % bez času, prázdné noci „nic si nepamatuju“.

**Pravda v backtestu:** `primary` = Oura, když je, jinak Garmin (jako na skutečných datech). `agree` = jen epochy, kde se obě zařízení shodnou. `reference` = skrytá pravda generátoru, kterou na skutečných datech nemáš.

**Baseline** je průměr hypnogramů podle popisu dnešního modelu, ve variantě, kdy už skončená noc počítá jako „bez REM“. Varianta s průměrem jen přes trvající noci měla stejnou log ztrátu (0,4678 vs 0,4673), ale nejlepší okno mělo aspoň 10 min REM jen v 16 % nocí místo 52 % (5 seedů po 120 nocích). Srovnání je proto proti silnější verzi.

## Výsledky v kostce

### 400 nocí (jako tvých 399), walk-forward, hodnoceno 386 nocí od 15.

| pravda | log ztráta v2 / baseline (úrovně) | rozdíl v2 − baseline, 95% interval | Brier v2 / baseline | rozdíl Brieru, 95% interval | nocí lepší v2 |
|---|---|---|---|---|---|
| primary (Oura, jinak Garmin) | 0,4559 / 0,4691 | −0,0132 (−0,0169 až −0,0096) | 0,1486 / 0,1522 | −0,0037 (−0,0047 až −0,0027) | 72 % |
| agree (shoda zařízení) | 0,3320 / 0,3430 | −0,0111 (−0,0155 až −0,0072) | 0,1005 / 0,1030 | −0,0024 (−0,0034 až −0,0016) | 66 % |
| reference (skrytá pravda) | 0,4097 / 0,4289 | −0,0192 (−0,0235 až −0,0148) | 0,1329 / 0,1373 | −0,0044 (−0,0054 až −0,0033) | 78 % |

Posledních 120 nocí (protokol z `doporuceni_parametru.md`): primary −0,0135 (−0,0214 až −0,0058), agree −0,0103 (−0,0173 až −0,0041), reference −0,0206 (−0,0298 až −0,0099).

| ukazatel (400 nocí, primary) | v2 | baseline |
|---|---|---|
| hustota REM v high / mid / low / unlikely | 43,5 / 32,7 / 17,7 / 3,9 % | 41,4 / 30,7 / 20,1 / 5,5 % |
| `high` zabírá noci (průměr, maximum) | 9,8 % (15,5 %) | 11,6 % (17,5 %) |
| nejlepší okno: střed v REM | 44,3 % | 42,5 % |
| nejlepší okno: aspoň 10 min REM | 50,5 % | 58,8 % |
| nejlepší okno: délka, hustota REM, lift | 20 min, 43,1 %, 2,17 | 30 min, 39,1 %, 1,95 |
| vlastní pravděpodobnost: log ztráta, ECE | 0,4495, 0,009 | nemá |
| `pRem` proti skryté pravdě: log ztráta, ECE | 0,4102, 0,041 | nemá |

**Čtení:**
1. **v2 je lepší ve všech třech variantách pravdy.** Nižší log ztráta i Brier, interval rozdílu daleko od nuly, lepší asi ve 2 ze 3 nocí. Hustota REM klesá od `high` k `unlikely` u obou prediktorů, u v2 strměji (víc REM ve vysokých úrovních, méně v `unlikely`).
2. **Pět seedů po 120 nocích:** v2 lepší ve všech 15 kombinacích seed × pravda. Interval leží pod nulou ve 13 z 15. Dvakrát se ve variantě `agree` dotkne nuly (seed 2: −0,0041, −0,0090 až 0,0013; seed 4: −0,0031, −0,0091 až 0,0005).
3. **Scénáře** (jiná osoba nebo jiná zařízení, průměr 5 seedů): v2 lepší v log ztrátě i Brieru ve všech 9:
   - latence 68 a 110 min,
   - cyklus 82 a 108 min,
   - REM periody ×1,3,
   - jen Garmin, jen Oura,
   - nový uživatel (noci 4–33).

   Rozdíl je 0,006–0,011 nat. Hustota REM klesá monotónně ve 44 z 45 běhů v2; výjimka je jeden seed scénáře „jen Garmin“.
4. **Nejlepší okno:** střed okna trefí REM u v2 stejně nebo trochu častěji (5 seedů: 42 vs 39 %, nový uživatel 41 vs 33 %). V2 má ale kratší okna (19–20 min vs 27–30 min), takže kritérium „aspoň 10 min REM v okně“, které zvýhodňuje délku, vychází na 400 nocích lépe baseline (59 vs 51 %). Na pěti seedech po 120 nocích je to vyrovnané (53 vs 52 %). Hustota REM v nejlepším okně je u v2 vyšší (43 vs 39 %).
5. **Kalibrace:** `pDevice` proti štítku zařízení ECE 0,009–0,011, `pRem` proti skryté pravdě 0,039–0,041. `pRem` je mírně plochý: v koši 0,1–0,2 skutečně 0,09, v koši 0,3–0,4 skutečně 0,39. Vlastní pravděpodobnost v2 má nižší log ztrátu než jeho čtyři úrovně (0,4495 vs 0,4559).
6. **Citlivost:** parametry v rozsazích z `doporuceni_parametru.md` mění log ztrátu nejvýš o 0,0034 (apriorní síla 2 noci), vše zůstává lépe než baseline. Ruční značky předpověď prakticky nemění (LR 1: 0,4570 vs 0,4571), ovlivňují jen posteriory jednotlivých minulých nocí. Dvě volby se zkoušely jako konstrukce, ne jako ladění:
   - úrovně i `peak` z P(REM | spíš): stejná log ztráta, ale střed nejlepšího okna 30 % místo 42 %,
   - úrovně i `peak` z P(REM) · P(spíš): log ztráta 0,4682, tedy jako baseline.
7. **Čas:**
   - posterior noci 1,9 ms,
   - `remWindowsV2` s historií 400 nocí bez cache 252 ms, s cache 6 ms,
   - backtest 400 nocí 3,8 s (v2) a 0,9 s (baseline).

   Na telefonu počítej 2–4× víc a pouštěj výpočet v isolate.

## Jak se z oken dělá pravděpodobnost pro log skóre a Brier

Prediktor, který vrací jen úrovně (dnešní model), nemá pravděpodobnost. Harness proto počítá dvě rodiny metrik:
- **Podle úrovní** (pro oba prediktory): p = četnost REM v epochách dané úrovně ze **dříve** vyhodnocených nocí téhož prediktoru.
  - Beta prior se středem 0,2 a silou 20 epoch, stejný pro všechny úrovně i prediktory.
  - Prvních 30 nocí před hodnocením jen zahřívá četnosti.
  - Měří, jak dobře úrovně třídí noc, a jde o férové srovnání se dnešním modelem.
- **Vlastní pravděpodobnost**: když okna jsou `RemWindowV2`, bere se jejich křivka po 5 min bez úprav:
  - `pDevice` pro `primary`,
  - `pAgree` pro `agree`,
  - `pRem` pro `reference`.

Obojí je oříznuté do [0,01; 0,99]. Pro měřítko se hlásí klimatologie, tedy stálá walk-forward četnost REM bez času v noci.

**Nejlepší okno** (`bestRemWindow`) = okno s nejvyšším `peak`; při shodě vyšší úroveň, pak delší, pak dřívější.
- Hlavní zásah: střed okna padne do REM. Nejlepší okno slouží k budíku nebo podnětům, které míří doprostřed, a toto kritérium nezvýhodňuje dlouhá okna.
- Vedlejší zásahy: aspoň 10 min REM v okně (nejkratší REM perioda, kterou 5min data spolehlivě odliší, pravidlo F5) a jakýkoli překryv.
- Hlásí se i délka okna, hustota REM v něm a lift proti průměru noci.

## Limity

1. **Syntetika není skutečnost.** Zařízení v generátoru se chovají zhruba podle předpokladů modelu: lokální chyby, společné přehlédnutí, falešné bloky. Skutečné chyby mohou být delší, závislé na fyziologii (tep po probuzení, alkohol) a měnit se s verzí algoritmu. Čísla ukazují, že model funguje a je lepší než průměr hypnogramů za podobných podmínek. Neukazují, o kolik bude lepší na tvých 399 nocích.
2. **Dnešní model znám jen z popisu.** `rem_baseline.dart` je napodobenina. Skutečné prahy, váhy značek a zacházení s koncem noci se mohou lišit. Rozhodující je backtest se skutečnou funkcí `remWindows`.
3. **Pravda ze zařízení není REM.** Na skutečných datech měří `primary` a `agree` shodu s Ourou nebo Garminem. Na syntetice dávaly všechny tři varianty pravdy stejné pořadí prediktorů, ale nemusí to platit vždy. Model, který opraví systematickou chybu zařízení, může proti štítku zařízení vyjít hůř.
4. **První REM:** krátký první REM je pro model slabé svědectví (γ 0,5, pojistka přehlédnutí). Posterior noci ho často nechává kolem 0,3–0,4. Osobní latenci se proto filtr naučí jen zčásti. Dlouhou latenci (105 min) trefí na ±10 min, krátkou (65–75 min) přeceňuje o 7–16 min.
5. **Předpověď bez dat z téže noci** je z principu rozmazaná. Kolem 4. hodiny se fáze cyklu rozmaže a P(REM) zůstává většinou pod 0,45 (kap. 3.6 návrhu). Úrovně a nejlepší okno to nezmění, jen to přeskládají.
6. **Ruční značky** mění předpověď málo, protože přispívají jen do posteriorů minulých nocí a mají omezenou váhu. Na syntetice jsou časté, na skutečných datech budou spíš řidší.
7. **Interval `pRemLow`–`pRemHigh`** je přibližný. Měkké posteriory nocí se v Beta směsi berou jako zlomkové počty a sousední epochy nejsou nezávislé. Hodí se jako „kolik toho o téhle době víme“, ne jako přesný kredibilní interval.
8. **Cache** pozná změnu dat noci podle otisku úseků (časy, fáze, počet), značek a identity parametrů. Když appka přepíše noc se stejným otiskem, ale jinými daty, cache ji nepřepočítá. To je prakticky vyloučené, ale možné.

---

## Příloha: celý výstup `dart run tool/rem_synth_report.dart all`

Desetinná místa jsou v příloze s tečkou, jak je vypisuje program.

### Hlavní backtest: 400 syntetických nocí, seed 1

Záznamů 709, značek 404 (s časem 311, „nic si nepamatuju“ 50). Realizovaná přesnost po minutách: Oura citlivost 0.779, falešné poplachy 0.080; Garmin 0.484 / 0.136; korelace chyb (phi) 0.269.

#### Všechny noci od 15. (walk-forward)

Čas: v2 3758 ms za 399 předpovědí, baseline 871 ms.

##### Pravda: primary

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 386 | 36018 | 21.0 % | 0.4559 | 0.1486 | 0.4495 | 0.1473 | 0.009 | 0.5145 / 0.1661 | 9.8 % (15.5 %) | 44.3 % / 50.5 % / 65.0 % / 20 min / 43.1 % / 2.17 |
| baseline | 386 | 36018 | 21.0 % | 0.4691 | 0.1522 | n/a | n/a | n/a | 0.5145 / 0.1661 | 11.6 % (17.5 %) | 42.5 % / 58.8 % / 70.7 % / 30 min / 39.1 % / 1.95 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 43.5 % / 32.7 % / 17.7 % / 3.9 % | 9.9 % / 30.8 % / 31.4 % / 27.9 % | 20.5 % / 47.9 % / 26.4 % / 5.2 % | ano |
| baseline | 41.4 % / 30.7 % / 20.1 % / 5.5 % | 11.6 % / 25.2 % / 34.3 % / 28.8 % | 22.8 % / 36.8 % / 32.8 % / 7.6 % | ano |

##### Pravda: agree

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 300 | 22486 | 12.7 % | 0.3320 | 0.1005 | 0.3300 | 0.1004 | 0.009 | 0.3807 / 0.1109 | 8.9 % (18.3 %) | 23.7 % / 27.3 % / 42.3 % / 20 min / 32.7 % / 3.22 |
| baseline | 300 | 22486 | 12.7 % | 0.3430 | 0.1030 | n/a | n/a | n/a | 0.3807 / 0.1109 | 10.4 % (20.6 %) | 22.7 % / 32.7 % / 47.0 % / 30 min / 28.6 % / 2.43 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 33.3 % / 22.4 % / 9.3 % / 1.9 % | 9.0 % / 27.7 % / 30.9 % / 32.4 % | 23.5 % / 48.9 % / 22.7 % / 4.9 % | ano |
| baseline | 30.3 % / 20.9 % / 11.6 % / 2.6 % | 10.4 % / 23.0 % / 33.4 % / 33.1 % | 24.9 % / 37.8 % / 30.5 % / 6.8 % | ano |

##### Pravda: reference

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 386 | 36018 | 18.8 % | 0.4097 | 0.1329 | 0.4102 | 0.1319 | 0.041 | 0.4841 / 0.1530 | 9.8 % (15.5 %) | 43.8 % / 49.0 % / 65.5 % / 20 min / 42.1 % / 2.28 |
| baseline | 386 | 36018 | 18.8 % | 0.4289 | 0.1373 | n/a | n/a | n/a | 0.4841 / 0.1530 | 11.6 % (17.5 %) | 43.5 % / 61.1 % / 74.9 % / 30 min / 40.9 % / 2.26 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 45.0 % / 31.1 % / 13.9 % / 1.6 % | 9.9 % / 30.8 % / 31.4 % / 27.9 % | 23.7 % / 50.8 % / 23.2 % / 2.4 % | ano |
| baseline | 42.6 % / 28.9 % / 16.3 % / 3.6 % | 11.6 % / 25.2 % / 34.3 % / 28.8 % | 26.2 % / 38.7 % / 29.6 % / 5.5 % | ano |


Párové srovnání v2 − baseline po nocích (bootstrap po blocích 7 nocí, 2000×; záporný rozdíl = v2 lepší):

| metrika | pravda | nocí | v2 | baseline | rozdíl | 95% interval | nocí lepší v2 |
|---|---|---|---|---|---|---|---|
| logLossLevel | primary | 386 | 0.4559 | 0.4691 | -0.0132 | -0.0169 až -0.0096 | 72 % |
| brierLevel | primary | 386 | 0.1486 | 0.1522 | -0.0037 | -0.0047 až -0.0027 | 68 % |
| logLossLevel | agree | 300 | 0.3320 | 0.3430 | -0.0111 | -0.0155 až -0.0072 | 66 % |
| brierLevel | agree | 300 | 0.1005 | 0.1030 | -0.0024 | -0.0034 až -0.0016 | 63 % |
| logLossLevel | reference | 386 | 0.4097 | 0.4289 | -0.0192 | -0.0235 až -0.0148 | 78 % |
| brierLevel | reference | 386 | 0.1329 | 0.1373 | -0.0044 | -0.0054 až -0.0033 | 69 % |

Kalibrace v2 (vlastní pravděpodobnost) proti štítku zařízení (primary):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 9159 | 0.045 | 0.036 |
| 0.1–0.2 | 9359 | 0.150 | 0.154 |
| 0.2–0.3 | 7713 | 0.247 | 0.257 |
| 0.3–0.4 | 6176 | 0.349 | 0.366 |
| 0.4–0.5 | 3336 | 0.440 | 0.436 |
| 0.5–0.6 | 275 | 0.516 | 0.411 |

Kalibrace v2 (`pRem`) proti skryté pravdě (reference):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 7647 | 0.042 | 0.008 |
| 0.1–0.2 | 9562 | 0.154 | 0.093 |
| 0.2–0.3 | 8936 | 0.244 | 0.212 |
| 0.3–0.4 | 7840 | 0.349 | 0.385 |
| 0.4–0.5 | 2032 | 0.423 | 0.455 |
| 0.5–0.6 | 1 | 0.503 | 0.000 |

Kalibrace podle úrovní, baseline (primary):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 9844 | 0.064 | 0.054 |
| 0.1–0.2 | 5239 | 0.185 | 0.192 |
| 0.2–0.3 | 15229 | 0.249 | 0.253 |
| 0.3–0.4 | 3292 | 0.332 | 0.355 |
| 0.4–0.5 | 2414 | 0.408 | 0.418 |

#### Posledních 120 nocí (walk-forward, 30 nocí zahřátí)

Čas: v2 1535 ms za 150 předpovědí, baseline 334 ms.

##### Pravda: primary

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 120 | 11107 | 21.1 % | 0.4572 | 0.1490 | 0.4483 | 0.1471 | 0.009 | 0.5152 / 0.1664 | 10.3 % (14.9 %) | 45.0 % / 47.5 % / 61.7 % / 19 min / 41.8 % / 2.20 |
| baseline | 120 | 11107 | 21.1 % | 0.4707 | 0.1525 | n/a | n/a | n/a | 0.5152 / 0.1664 | 11.5 % (16.9 %) | 44.2 % / 55.0 % / 66.7 % / 27 min / 38.9 % / 1.95 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 44.7 % / 32.4 % / 18.5 % / 4.0 % | 10.4 % / 28.4 % / 33.1 % / 28.1 % | 22.0 % / 43.8 % / 29.0 % / 5.3 % | ano |
| baseline | 40.8 % / 32.1 % / 19.3 % / 5.9 % | 11.5 % / 24.4 % / 35.5 % / 28.5 % | 22.3 % / 37.2 % / 32.5 % / 8.0 % | ano |

##### Pravda: agree

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 101 | 7504 | 12.8 % | 0.3392 | 0.1029 | 0.3359 | 0.1024 | 0.011 | 0.3835 / 0.1119 | 9.3 % (16.7 %) | 24.8 % / 24.8 % / 38.6 % / 19 min / 30.0 % / 2.94 |
| baseline | 101 | 7504 | 12.8 % | 0.3495 | 0.1048 | n/a | n/a | n/a | 0.3835 / 0.1119 | 10.3 % (17.3 %) | 23.8 % / 28.7 % / 45.5 % / 27 min / 29.0 % / 2.51 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 31.8 % / 22.2 % / 10.9 % / 2.0 % | 9.4 % / 25.8 % / 32.0 % / 32.8 % | 23.2 % / 44.7 % / 27.2 % / 5.0 % | ano |
| baseline | 28.7 % / 21.3 % / 12.2 % / 2.9 % | 10.3 % / 21.8 % / 35.0 % / 32.9 % | 23.1 % / 36.1 % / 33.3 % / 7.5 % | ano |

##### Pravda: reference

| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |
|---|---|---|---|---|---|---|---|---|---|---|---|
| v2 | 120 | 11107 | 18.8 % | 0.4115 | 0.1332 | 0.4107 | 0.1320 | 0.039 | 0.4834 / 0.1527 | 10.3 % (14.9 %) | 43.3 % / 44.2 % / 65.0 % / 19 min / 40.7 % / 2.29 |
| baseline | 120 | 11107 | 18.8 % | 0.4321 | 0.1376 | n/a | n/a | n/a | 0.4834 / 0.1527 | 11.5 % (16.9 %) | 39.2 % / 55.8 % / 71.7 % / 27 min / 39.4 % / 2.21 |

| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | podíl všeho REM high / mid / low / unlikely | klesá? |
|---|---|---|---|---|
| v2 | 44.1 % / 31.3 % / 14.6 % / 1.8 % | 10.4 % / 28.4 % / 33.1 % / 28.1 % | 24.3 % / 47.3 % / 25.7 % / 2.7 % | ano |
| baseline | 41.2 % / 30.2 % / 15.3 % / 4.4 % | 11.5 % / 24.4 % / 35.5 % / 28.5 % | 25.2 % / 39.2 % / 29.0 % / 6.6 % | ano |


Párové srovnání v2 − baseline po nocích (bootstrap po blocích 7 nocí, 2000×; záporný rozdíl = v2 lepší):

| metrika | pravda | nocí | v2 | baseline | rozdíl | 95% interval | nocí lepší v2 |
|---|---|---|---|---|---|---|---|
| logLossLevel | primary | 120 | 0.4572 | 0.4707 | -0.0135 | -0.0214 až -0.0058 | 69 % |
| brierLevel | primary | 120 | 0.1490 | 0.1525 | -0.0035 | -0.0055 až -0.0014 | 64 % |
| logLossLevel | agree | 101 | 0.3392 | 0.3495 | -0.0103 | -0.0173 až -0.0041 | 62 % |
| brierLevel | agree | 101 | 0.1029 | 0.1048 | -0.0020 | -0.0035 až -0.0006 | 60 % |
| logLossLevel | reference | 120 | 0.4115 | 0.4321 | -0.0206 | -0.0298 až -0.0099 | 74 % |
| brierLevel | reference | 120 | 0.1332 | 0.1376 | -0.0044 | -0.0064 až -0.0018 | 67 % |

Kalibrace v2 (vlastní pravděpodobnost) proti štítku zařízení (primary):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 2817 | 0.043 | 0.035 |
| 0.1–0.2 | 3025 | 0.150 | 0.157 |
| 0.2–0.3 | 2258 | 0.245 | 0.253 |
| 0.3–0.4 | 1730 | 0.351 | 0.368 |
| 0.4–0.5 | 1196 | 0.439 | 0.436 |
| 0.5–0.6 | 81 | 0.516 | 0.457 |

Kalibrace v2 (`pRem`) proti skryté pravdě (reference):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 2435 | 0.042 | 0.011 |
| 0.1–0.2 | 3017 | 0.155 | 0.097 |
| 0.2–0.3 | 2635 | 0.242 | 0.211 |
| 0.3–0.4 | 2354 | 0.353 | 0.393 |
| 0.4–0.5 | 666 | 0.419 | 0.432 |

Kalibrace podle úrovní, baseline (primary):

| koš p | epoch | průměr p | skutečně REM |
|---|---|---|---|
| 0.0–0.1 | 3171 | 0.047 | 0.059 |
| 0.1–0.2 | 3947 | 0.185 | 0.193 |
| 0.2–0.3 | 184 | 0.298 | 0.353 |
| 0.3–0.4 | 3347 | 0.332 | 0.342 |
| 0.4–0.5 | 458 | 0.411 | 0.397 |

### Pět seedů po 120 nocích

| seed | pravda | log v2 | log baseline | Brier v2 | Brier baseline | log v2 vlastní p | rozdíl log (95% CI) |
|---|---|---|---|---|---|---|---|
| 1 | primary | 0.4484 | 0.4647 | 0.1459 | 0.1498 | 0.4460 | -0.0163 (-0.0242 až -0.0097) |
| 1 | agree | 0.3184 | 0.3319 | 0.0954 | 0.0977 | 0.3176 | -0.0135 (-0.0223 až -0.0074) |
| 1 | reference | 0.4040 | 0.4259 | 0.1311 | 0.1354 | 0.4055 | -0.0219 (-0.0290 až -0.0168) |
| 2 | primary | 0.4637 | 0.4733 | 0.1527 | 0.1547 | 0.4609 | -0.0096 (-0.0137 až -0.0045) |
| 2 | agree | 0.3528 | 0.3568 | 0.1076 | 0.1081 | 0.3506 | -0.0041 (-0.0090 až 0.0013) |
| 2 | reference | 0.4226 | 0.4370 | 0.1367 | 0.1399 | 0.4211 | -0.0144 (-0.0195 až -0.0075) |
| 3 | primary | 0.4497 | 0.4591 | 0.1472 | 0.1486 | 0.4468 | -0.0093 (-0.0144 až -0.0039) |
| 3 | agree | 0.3309 | 0.3404 | 0.1008 | 0.1021 | 0.3346 | -0.0095 (-0.0154 až -0.0034) |
| 3 | reference | 0.4190 | 0.4338 | 0.1365 | 0.1392 | 0.4219 | -0.0149 (-0.0211 až -0.0095) |
| 4 | primary | 0.4668 | 0.4758 | 0.1522 | 0.1545 | 0.4607 | -0.0090 (-0.0149 až -0.0058) |
| 4 | agree | 0.3418 | 0.3449 | 0.1029 | 0.1031 | 0.3397 | -0.0031 (-0.0091 až 0.0005) |
| 4 | reference | 0.4299 | 0.4418 | 0.1387 | 0.1409 | 0.4254 | -0.0119 (-0.0189 až -0.0087) |
| 5 | primary | 0.4570 | 0.4634 | 0.1494 | 0.1512 | 0.4486 | -0.0065 (-0.0118 až -0.0027) |
| 5 | agree | 0.3272 | 0.3357 | 0.0989 | 0.1004 | 0.3223 | -0.0085 (-0.0145 až -0.0041) |
| 5 | reference | 0.4248 | 0.4366 | 0.1381 | 0.1410 | 0.4182 | -0.0117 (-0.0164 až -0.0079) |

### Scénáře generátoru (průměr 5 seedů po 120 nocích)

| scénář | prediktor | log úrovně (primary) | Brier úrovně (primary) | log vlastní p (primary) | ECE (primary) | log úrovně (reference) | log vlastní p (reference) | ECE (reference) | střed nejl. okna v REM (primary / reference) | ≥ 10 min REM v nejl. okně (primary / reference) | hustota klesá |
|---|---|---|---|---|---|---|---|---|---|---|---|
| výchozí | baseline | 0.4673 | 0.1517 | n/a | n/a | 0.4350 | n/a | n/a | 39 % / 38 % | 52 % / 52 % | 5/5 |
| výchozí | v2 výchozí | 0.4571 | 0.1495 | 0.4526 | 0.014 | 0.4201 | 0.4184 | 0.030 | 42 % / 43 % | 53 % / 55 % | 5/5 |
| latence 68 min | baseline | 0.5026 | 0.1657 | n/a | n/a | 0.4694 | n/a | n/a | 37 % / 39 % | 57 % / 57 % | 5/5 |
| latence 68 min | v2 výchozí | 0.4949 | 0.1635 | 0.4885 | 0.019 | 0.4583 | 0.4534 | 0.021 | 39 % / 42 % | 54 % / 53 % | 5/5 |
| latence 110 min | baseline | 0.4521 | 0.1456 | n/a | n/a | 0.4109 | n/a | n/a | 34 % / 35 % | 51 % / 54 % | 5/5 |
| latence 110 min | v2 výchozí | 0.4416 | 0.1433 | 0.4387 | 0.016 | 0.3975 | 0.4000 | 0.034 | 39 % / 38 % | 52 % / 53 % | 5/5 |
| cyklus 82 min | baseline | 0.5078 | 0.1687 | n/a | n/a | 0.4794 | n/a | n/a | 40 % / 36 % | 63 % / 60 % | 5/5 |
| cyklus 82 min | v2 výchozí | 0.4991 | 0.1672 | 0.4953 | 0.020 | 0.4653 | 0.4610 | 0.026 | 40 % / 39 % | 56 % / 56 % | 5/5 |
| cyklus 108 min | baseline | 0.4326 | 0.1376 | n/a | n/a | 0.3847 | n/a | n/a | 41 % / 42 % | 62 % / 64 % | 5/5 |
| cyklus 108 min | v2 výchozí | 0.4246 | 0.1359 | 0.4195 | 0.013 | 0.3690 | 0.3756 | 0.042 | 42 % / 44 % | 59 % / 63 % | 5/5 |
| REM periody ×1,3 | baseline | 0.5018 | 0.1673 | n/a | n/a | 0.4803 | n/a | n/a | 46 % / 46 % | 64 % / 64 % | 5/5 |
| REM periody ×1,3 | v2 výchozí | 0.4907 | 0.1644 | 0.4871 | 0.020 | 0.4635 | 0.4615 | 0.034 | 46 % / 45 % | 57 % / 59 % | 5/5 |
| jen Garmin | baseline | 0.4685 | 0.1497 | n/a | n/a | 0.4482 | n/a | n/a | 31 % / 36 % | 49 % / 52 % | 5/5 |
| jen Garmin | v2 výchozí | 0.4622 | 0.1485 | 0.4631 | 0.015 | 0.4406 | 0.4373 | 0.027 | 31 % / 38 % | 60 % / 65 % | 4/5 |
| jen Oura | baseline | 0.4722 | 0.1534 | n/a | n/a | 0.4297 | n/a | n/a | 41 % / 40 % | 55 % / 54 % | 5/5 |
| jen Oura | v2 výchozí | 0.4623 | 0.1516 | 0.4575 | 0.016 | 0.4190 | 0.4196 | 0.031 | 43 % / 41 % | 54 % / 53 % | 5/5 |
| nový uživatel (noci 4–33) | baseline | 0.4953 | 0.1623 | n/a | n/a | 0.4521 | n/a | n/a | 33 % / 29 % | 47 % / 43 % | 4/5 |
| nový uživatel (noci 4–33) | v2 výchozí | 0.4870 | 0.1606 | 0.4845 | 0.030 | 0.4405 | 0.4328 | 0.035 | 41 % / 35 % | 55 % / 51 % | 5/5 |

### Citlivost na parametry v2 (průměr 5 seedů po 120 nocích)

| scénář | prediktor | log úrovně (primary) | Brier úrovně (primary) | log vlastní p (primary) | ECE (primary) | log úrovně (reference) | log vlastní p (reference) | ECE (reference) | střed nejl. okna v REM (primary / reference) | ≥ 10 min REM v nejl. okně (primary / reference) | hustota klesá |
|---|---|---|---|---|---|---|---|---|---|---|---|
| výchozí | baseline | 0.4673 | 0.1517 | n/a | n/a | 0.4350 | n/a | n/a | 39 % / 38 % | 52 % / 52 % | 5/5 |
| výchozí | v2 výchozí | 0.4571 | 0.1495 | 0.4526 | 0.014 | 0.4201 | 0.4184 | 0.030 | 42 % / 43 % | 53 % / 55 % | 5/5 |
| výchozí | γ 0,3 | 0.4577 | 0.1501 | 0.4527 | 0.014 | 0.4225 | 0.4218 | 0.032 | 41 % / 40 % | 55 % / 57 % | 5/5 |
| výchozí | γ 0,75 | 0.4578 | 0.1494 | 0.4526 | 0.015 | 0.4205 | 0.4175 | 0.032 | 44 % / 43 % | 52 % / 54 % | 5/5 |
| výchozí | γ 1 | 0.4594 | 0.1497 | 0.4526 | 0.014 | 0.4214 | 0.4177 | 0.034 | 43 % / 43 % | 51 % / 53 % | 5/5 |
| výchozí | β 1 | 0.4569 | 0.1492 | 0.4525 | 0.014 | 0.4202 | 0.4162 | 0.026 | 41 % / 44 % | 51 % / 54 % | 5/5 |
| výchozí | ρ 0 | 0.4570 | 0.1494 | 0.4526 | 0.014 | 0.4205 | 0.4183 | 0.030 | 43 % / 43 % | 53 % / 54 % | 5/5 |
| výchozí | ρ 0,6 | 0.4571 | 0.1495 | 0.4526 | 0.014 | 0.4202 | 0.4187 | 0.031 | 42 % / 43 % | 52 % / 54 % | 5/5 |
| výchozí | bez pojistky přehlédnutí | 0.4576 | 0.1494 | 0.4526 | 0.014 | 0.4208 | 0.4165 | 0.025 | 44 % / 44 % | 54 % / 55 % | 5/5 |
| výchozí | apriorní síla 2 noci | 0.4605 | 0.1498 | 0.4538 | 0.018 | 0.4229 | 0.4172 | 0.027 | 43 % / 43 % | 52 % / 52 % | 5/5 |
| výchozí | apriorní síla 20 nocí | 0.4564 | 0.1496 | 0.4550 | 0.019 | 0.4192 | 0.4210 | 0.036 | 42 % / 42 % | 53 % / 54 % | 5/5 |
| výchozí | poločas 15 dní | 0.4570 | 0.1496 | 0.4548 | 0.017 | 0.4203 | 0.4195 | 0.031 | 43 % / 41 % | 54 % / 54 % | 5/5 |
| výchozí | poločas 60 dní | 0.4570 | 0.1493 | 0.4519 | 0.014 | 0.4202 | 0.4181 | 0.030 | 45 % / 43 % | 52 % / 53 % | 5/5 |
| výchozí | okno 60 dní | 0.4571 | 0.1495 | 0.4533 | 0.015 | 0.4206 | 0.4187 | 0.030 | 42 % / 42 % | 53 % / 54 % | 5/5 |
| výchozí | bez značek (LR 1) | 0.4570 | 0.1494 | 0.4526 | 0.014 | 0.4198 | 0.4183 | 0.030 | 43 % / 43 % | 52 % / 54 % | 5/5 |
| výchozí | citlivost zařízení −0,1 | 0.4567 | 0.1495 | 0.4528 | 0.015 | 0.4204 | 0.4210 | 0.036 | 44 % / 45 % | 53 % / 55 % | 5/5 |
| výchozí | falešné poplachy +0,05 | 0.4570 | 0.1495 | 0.4541 | 0.016 | 0.4203 | 0.4183 | 0.027 | 42 % / 43 % | 53 % / 54 % | 5/5 |
| výchozí | úrovně i peak bez P(spíš) | 0.4571 | 0.1495 | 0.4526 | 0.014 | 0.4201 | 0.4184 | 0.030 | 30 % / 31 % | 41 % / 43 % | 5/5 |
| výchozí | úrovně i peak s P(spíš) | 0.4682 | 0.1514 | 0.4524 | 0.014 | 0.4369 | 0.4182 | 0.030 | 44 % / 43 % | 58 % / 61 % | 5/5 |

### Výpočetní čas (Dart VM JIT, tento počítač)

| operace | čas |
|---|---|
| posterior jedné noci (HSMM, 5 min, obě zařízení) | 1.9 ms |
| `remWindowsV2`, historie 400 nocí, bez cache (zpracuje ~120 nocí) | 252 ms |
| `remWindowsV2` s `RemV2Cache` (posteriory už spočítané) | 6.0 ms |
| `remWindowsBaseline` | 5.5 ms |

