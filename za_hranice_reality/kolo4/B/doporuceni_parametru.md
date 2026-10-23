# Model REM v2: výchozí parametry, ladění a jak poznat, že je opravdu lepší

Stav 23. 10. 2026. Kód: `rem_model_v2.dart` (`RemModelV2Params`), backtest `rem_backtest.dart`. Čísla ze syntetiky jsou v `self_check_b.md`.

## 1. Co model dělá, v pěti větách

1. Každou minulou noc zvlášť přečte skrytý semi-Markovův model cyklů (N1 → R1 → W1 → N2 → R2 …, 5min mřížka od usnutí). Spojuje Ouru a Garmin přes matice záměn s korelací chyb ρ, s pojistkou „zařízení přehlédlo celou REM periodu“, se zmírněním γ (autokorelace chyb) a β (zařízení už čas v noci znají). Ruční značky přidají slabé svědectví s časovým jádrem. Výsledek: posterior P(REM po 5 min | data noci).
2. Kalmanův filtr se z posteriorů učí osobní latenci prvního REM, délku NREM periody a délku REM period (populace → člověk → noc, kap. 3.5 návrhu).
3. Na dnešní noc (data z téže noci nejsou) spočítá osobní apriorní křivku (prior predictive HSMM) a přidá k ní vážený průměr posteriorů minulých nocí. Po 5 min vznikne Beta posterior „jak často mívám v tuhle dobu REM“: střed `pRem`, 80% interval `pRemLow`–`pRemHigh`.
4. Stejně složená `pDevice` předpovídá, co ukáže hlavní zařízení. Jde ji ověřit na skutečných datech, `pRem` jen na referenci (EEG, PSG) nebo syntetice.
5. Úrovně jsou relativní k vrcholu noci jako dnes. Počítají se z P(REM | v tu dobu spíš). `peak` (řazení oken a nejlepší okno) se počítá z P(REM) · P(ještě spíš). `high` zabírá nejvýš 15 % očekávané délky spánku a okna mají aspoň 10 min.

## 2. Výchozí parametry a proč

Značky zdrojů: [L] literatura, [O] odvozeno z literatury, [P] předpoklad, [S] ověřeno jen na syntetice.

### 2.1 Úrovně a okna

| Parametr | Výchozí | Proč |
|---|---|---|
| `levelLow` / `levelMid` / `levelHigh` | 0,30 / 0,55 / 0,80 | Relativně k vrcholu noci jako dnešní `remLevel`. **Před srovnáním nastav stejné hodnoty, jaké má dnešní `RemProbabilityParams`**, jinak backtest srovnává i prahy, ne jen model. |
| `maxHighShare` | 0,15 | Zadání. U v2 se počítá z očekávané délky spánku (Σ `pAsleep`), ne z délky křivky (ta má rezervu 30 min nad 90. percentilem nocí). |
| `minWindowMinutes` | 10 | Zadání. Kratší úsek se sloučí se sousedem s nejbližší úrovní (při shodě s nižší), `high` se nikdy nenafoukne nad strop. |
| `asleepWeight` | 0 | Úrovně podle P(REM \| spíš). Přesně to měří hodnocení po 5 min. Na syntetice dává nejnižší log ztrátu [S]. |
| `peakAsleepWeight` | 1 | `peak` podle P(REM) · P(ještě spíš). Nejlepší okno tak nepadne na 8. hodinu, když obvykle vstáváš po 7,5 h. Bez toho by střed nejlepšího okna trefil REM o 12 p. b. méně často (30 % místo 42 %) [S]. |
| `nightLengthMedian`, `nightLengthSd`, `nightPriorNights` | 450 min, 60 min, 3 noci | Populační délka spánku pro P(ještě spíš). Po pár nocích převáží tvoje délky. |

### 2.2 Zařízení (z `presnost_nositelne_elektroniky.md` 1.4 a 3.3)

| Parametr | Výchozí | Rozsah pro ladění | Zdroj |
|---|---|---|---|
| `ouraSensitivity`, `ouraFalsePositive` | 0,70, 0,10 | 0,55–0,80, 0,05–0,15 | Lee 0,71; Topalidis 0,73; Robbins 0,76; Herberger 0,55 [L] |
| `garminSensitivity`, `garminFalsePositive` | 0,50, 0,15 | 0,33–0,60, 0,10–0,20 | Chinoy, Miller, Topalidis; pesimisticky Vivosmart 4 0,33 / 0,12 [L] |
| `ouraWakeRow`, `garminWakeRow` | [0,60; 0,30; 0,10], [0,50; 0,35; 0,15] | neladit | Nehybné bdění vypadá jako spánek, Garmin ho často značí jako REM [P] |
| `rho` | 0,4 | 0–0,6 | Třítřídní vazba se zachovanými marginálami; 0,4 = binární ρ′ 0,3 [O] |
| `gamma` | 0,5 na 5min epochu | 0,3–0,75 | Autokorelace chyb (klouzavá okna, normalizace na noc) [P]. Na syntetice je kalibrace posteriorů noci nejlepší u 0,5–0,75 [S]. |
| `beta` | 0,5 | 0,5–1 | Zařízení už čas v noci používají, plný prior by ho započítal dvakrát [P]. Zmírňuje se tvar každé složky délky zvlášť, váhy směsi (podíl nocí s vynechaným prvním REM) zůstávají. |
| `ouraMissFirst`, `ouraMissLater` | 0,25, 0,10 | 0–0,4 | Krátký první REM zařízení přehlédnou, Oura má latenci REM −9,5 min [O/P] |
| `garminMissFirst`, `garminMissLater` | 0,50, 0,25 | 0,2–0,6 | Latence REM Garminu +16 až +30 min [O/P] |

### 2.3 Cykly (populační prior, `algoritmus_rem_cyklu.md` 3.2)

| Parametr | Výchozí | Zdroj |
|---|---|---|
| `latencyMedian` | 80 min | Boulos 2019, druhá a další noc 87 min [L/O] |
| `skipShare`, `skipPriorStrength` | 0,10, 20 nocí | Vynechaný první REM [P], Beta(2, 18) |
| `nremMedian`, `nremLogSd`, `nremWithinNightLogSd` | 68 min, 0,25, 0,22 | Cyklus 90 min minus REM (Rosenblum 2025; Kishi 2023, SD-ROI 19 min) [O] |
| `remMedians`, `remLogSd` | 10, 17, 22, 26, 28 min; 0,5 | REM se k ránu prodlužuje (Feinberg a Floyd 1979; Rosenblum 2025) [O/P] |
| `nremAfterWakeMedian` | 35 min | Krátká latence REM po probuzení (Barbato 2002) [P] |
| mikrostavy (`remInRemPeriod` …) | 0,85 / 0,05 / 0,02 / 0,04 / 0,90 | REM perioda smí obsahovat krátké bdění a NREM (F&F) [P] |

### 2.4 Osobní prior (Kalmanův filtr)

| Parametr | Výchozí | Zdroj |
|---|---|---|
| `latencyTau`, `latencySigmaW` | 0,15, 0,25 | ICC latence asi 0,26 podle ICC délky cyklu 0,32 (Kishi 2023) [O/P] |
| `nremTau`, `nremSigmaW` | 0,065, 0,10 | Kishi 2023: SD mezi lidmi 5,8 min, rozptyl mezi nocemi 73 min² [O] |
| `remScaleTau`, `remScaleSigmaW` | 0,20, 0,25 | [P] |
| `driftPerDay` | 0,0005 | Pomalá změna za měsíce [P] |
| `learnNights` | 120 | Starší noci mají po driftu malou váhu a stojí čas |

Měření latence pro filtr je posterior noci, ze kterého se gaussovsky vydělí populační prior (zmírněný β). Bez toho by filtr táhl k populaci dvakrát. Noc, kde posterior latence není užší než prior, se do učení nepočítá.

### 2.5 Ruční značky (`algoritmus_rem_cyklu.md` 4.2)

| Parametr | Výchozí | Proč |
|---|---|---|
| `markWokeLr` | 2,0 | Vybavení po probuzení z REM 0,82, z NREM 0,43 (Nielsen 2000) [O] |
| `markDreamLr` | 1,5 | Sen bez probuzení: čas je odhad zpětně, svědectví slabší [P] |
| `markEmptyLr` | 0,4 | „Nic si nepamatuju“: (1 − 0,82) / (1 − 0,43) = 0,32, se Stucky 2025 0,41 [O] |
| `markSigmaMinutes` | 15 min | Čas ze vzpomínky ±15 min (zadání) |
| `markDreamSigmaMinutes` | 30 min | Sen bez probuzení se hůř časuje [P] |
| `emptyNightSigmaMinutes` | 10 min | Prázdná noc bez času = ranní probuzení (konec záznamu) |
| `markLrCap` | 10 | Jeden zápis nepřebije data zařízení |

Značka bez času nic neposouvá. Svědčí jen o tom, že noc měla sen. Kdyby se přiřadila k ránu, posílila by zkreslení vybavování, které je k ránu nejsilnější. Čas snu zadaný s datem večera (05:10 téhož data) se posune o kalendářní den.

### 2.6 Předpověď

| Parametr | Výchozí | Proč |
|---|---|---|
| `lookbackDays`, `halfLifeDays` | 90 dní, 30 dní | Poločas 30 dní má dnešní model vyladěný na tvých 399 nocích. Okno 90 dní místo 60 nocí: starší noci mají váhu pod 0,13. |
| `priorNights` | 8 nocí | Síla osobní apriorní křivky. Po měsíci tvoří vlastní noci asi 73 % předpovědi, po třech měsících asi 83 %. |
| `countDays` | 30 dní | `recentNights`, `bothNights` … a `dreamMarks` / `wokeMarks` počítají noci a značky za posledních 30 dní |
| `intervalMass` | 0,8 | 80% interval jako v návrhu (kap. 6.2) |

## 3. Co ladit na skutečných datech a v jakých mezích

Na syntetice je model na všechno málo citlivý. Změny parametrů v rozsazích níž hýbou log ztrátou nejvýš o 0,004 nat na 5 min, rozdíl proti průměru hypnogramů je 0,01 (tabulka v `self_check_b.md`). Ladění tedy nepřinese víc než pár procent a snadno se přeučí. Doporučené pořadí:

1. **Prahy úrovní převezmi z dnešního modelu** (`levelLow`, `levelMid`, `levelHigh`, `maxHighShare`). To není ladění, ale podmínka férového srovnání.
2. **Paměť předpovědi:** `halfLifeDays` 15–60, `priorNights` 4–20, `lookbackDays` 60–180. Nejvýš mřížka 3 × 3 na ladicím období (oddíl 4). Kratší poločas pomůže, když se ti mění režim (směny, sezóna). Delší zpřesní kalibraci, když je režim stálý.
3. **Parametry zařízení** (citlivost a falešné poplachy v rozsazích z 2.2, ρ z {0; 0,2; 0,4; 0,6}) neladit podle log skóre úrovní. Kritérium je marginální věrohodnost dat zařízení: součet `RemNightPosterior.logLikelihood` přes posledních 28–60 nocí s oběma zařízeními (kap. 3.5 návrhu). Vyber hodnotu s nejvyšším součtem. Když se dvě hodnoty liší o méně než 2 na noc, nech výchozí.
4. **γ a β** bez referenční noci (EEG čelenka, spánková laboratoř) neladit. Jen z dat zařízení se nedají odlišit od chyb zařízení. S referenční nocí je laď společně na ECE posteriorů noci (γ 0,3–0,75, β 0,5–1). Marginální věrohodnost z bodu 3 mezi různými γ nesrovnávej: γ mění měřítko věrohodnosti, takže součet `logLikelihood` je srovnatelný jen při stejném γ (a β).
5. **Neladit vůbec:** populační prior cyklů (učí ho Kalmanův filtr), pojistku přehlédnutí (jen s referencí) a věrohodnostní poměry značek. Ty kalibruj až po ≥ 30 záznamech včetně „nic si nepamatuju“ (kap. 4.3 návrhu), a i pak jen Λ0 v mezích 1,4–3 a Λ0⁻ v mezích 0,3–0,5.

Co ladění neopraví: krátký první REM je pro model slabé svědectví (γ 0,5 a pojistka přehlédnutí). Osobní latenci se proto naučí jen zčásti, u lidí s latencí 65–75 min ji přeceňuje o 7–16 min (syntetika). Předpověď to drží v mezích, protože hlavní váhu má průměr posteriorů nocí, ale číslo `latencyMedianMinutes` v UI ukazuj jen zaokrouhleně a s nejistotou.

## 4. Jak poznat, že v2 je opravdu lepší a ne přeučený

### 4.1 Protokol (předregistruj si ho, než pustíš testovací období)

1. **Rozdělení dat:** posledních 120 nocí je testovací období. Před ním je ladicí období (u 399 nocí tedy noci 1–279). V ladicím období smíš zkoušet bod 2 z oddílu 3. Testovací období pustíš jednou.
2. **Zmrazení:** před testem si zapiš parametry v2 i dnešního modelu (hash `RemModelV2Params`, verze kódu). Po pohledu na test se nic nemění. Když se změní, test je spotřebovaný a nový test je až na nových nocích (prospektivně, třeba dalších 60).
3. **Stejné podmínky:** stejné prahy úrovní, stejné noci, stejné značky. Oba prediktory přes `backtest(..., options: BacktestOptions(lastNights: 120))`. Harness zahřeje četnosti úrovní na 30 nocích před testem a prediktor vidí jen minulost.
4. **Primární metrika (jedna, předem daná):** log ztráta podle úrovní po 5 min, pravda `primary` (Oura, jinak Garmin). Párové srovnání po nocích `comparePaired(v2, dnes)` s bootstrapem po blocích 7 nocí.
5. **Kritérium úspěchu:** horní mez 95% intervalu rozdílu v2 − dnes < 0. Zároveň Brier ne horší (horní mez intervalu ≤ 0,001), hustota REM klesá od `high` k `unlikely` a průměrný podíl `high` ≤ 15 %.
6. **Sekundární metriky (jen popis, ne rozhodnutí):**
   - varianta `agree`,
   - střed nejlepšího okna v REM a hustota REM v nejlepším okně,
   - ECE vlastní pravděpodobnosti `pDevice`,
   - podíl nocí, kde je v2 lepší.

### 4.2 Varovné signály přeučení

- Zlepšení v ladicím období, ale ne v testu.
- Výsledek drží jen na jednom nastavení. Sousední hodnoty z mřížky dávají horší výsledek než dnešní model.
- Zisk dělá pár nocí (podívej se na rozdělení rozdílů po nocích v `perNight`). Medián rozdílu je kolem nuly, průměr táhne několik extrémů.
- Rozdíl se otočí mezi první a druhou půlkou testu.
- ECE `pDevice` > 0,05 nebo hustota REM neklesá monotónně s úrovní.

### 4.3 Jak velký rozdíl čekat

- Na syntetice je v2 lepší o 0,013 nat na 5 min (asi 3 % log ztráty) a o 0,0037 v Brieru (asi 2,4 %). Interval je daleko od nuly, lepší je asi 70 % nocí.
- Na skutečných datech bude rozdíl nejspíš menší. Syntetická zařízení se chovají podle předpokladů modelu a dnešní model je vyladěný přímo na tvých nocích.
- Rozdíl pod 0,005 nat je prakticky malý. V tom případě rozhodni podle vedlejších výhod: kalibrovaná pravděpodobnost, interval nejistoty, rozumné chování u nových uživatelů a u jednoho zařízení.

### 4.4 Kdy ukázat pravděpodobnost v UI

Až když na testovacím období platí:
- ECE `pDevice` ≤ 0,05,
- `logLossProb` < `logLossLevel` téhož prediktoru (vlastní pravděpodobnost nese víc než čtyři úrovně).

Slovo vždy doplň číslem zaokrouhleným na desítky, „asi 3 z 10“. Formuluj to jako „podle tvých zařízení“. `pRem` (skutečný REM) bez referenční noci ověřit nejde, ukazuj ho nanejvýš jako rozsah `pRemLow`–`pRemHigh` v detailu.

## 5. Integrace a výpočetní cena

- **Typy:** v `rem_types.dart` smaž část A a importuj originály. `RemMark` a `Predictor` (část B) nech.
- **Plnění `RemMark` z `Dream`:**
  - `nightDate`,
  - `at` = `dreamAt`,
  - `woke` = `wokeFromDream`,
  - `emptyNight` = `recall == RecallLevel.none`.
- **Usnutí na dnešní noc** předem neznáš. Použij plánované „Jdu spát“ plus osobní medián latence usnutí. Offsety oken jsou od usnutí, takže okna se po synchronizaci jen posunou.
- **Cena** (Dart VM na tomhle počítači):
  - posterior noci asi 2 ms,
  - první volání bez cache asi 0,3 s (zpracuje asi 120 nocí),
  - s `RemV2Cache` asi 10 ms.

  Na telefonu počítej 2–4× víc. Pouštěj to v `Isolate.run` a `RemV2Cache` drž v paměti. Cache výsledek nemění, klíč je datum, otisk dat noci, značky a identita parametrů. Při změně parametrů se sama vyprázdní.
- **Zrušení:** `remWindowsV2` vrací `List<RemWindow>`, prvky jsou `RemWindowV2`. Stávající UI funguje beze změny. Nová pole (`probability`, `probabilityLow`, `probabilityHigh`, `deviceProbability`, `curve`) čti přes `is RemWindowV2`.
