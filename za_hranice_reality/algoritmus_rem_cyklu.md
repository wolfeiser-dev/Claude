# Algoritmus REM cyklů: od hypnogramu k pravděpodobným REM oknům

Stav k 23. 10. 2026. Podklad pro záložku Spánek: odhad výskytu REM, REM okna, Chytré probuzení do snu (WBTB) a Zvukový klíč (TLR).

**Vazby na ostatní dokumenty:**
- `presnost_nositelne_elektroniky.md` dává parametry zařízení (senzitivita, falešně pozitivní míra, ρ, γ, β), slovník a vizuální specifikaci. Tady je používám a rozšiřuji. Kde by se čísla lišila, platí tamten dokument. Jediný rozdíl v zápisu je korelace chyb: tamten binární model má ρ′ = 0,3, tady třítřídní vazba ρ = 0,4, a jde o tutéž předpokládanou závislost (převod v 3.3).
- `inovace.md` popisuje funkce (REM profil, TOP 1 WBTB, Zvukový klíč, Osobní laboratoř). Tady je odvozený model, na kterém stojí.

**Značky u čísel:**
- **[L]** literatura,
- **[O]** odvozeno výpočtem z literatury,
- **[P]** předpoklad modelu, nutno kalibrovat,
- **[S]** vlastní simulace v této práci (skripty v scratchpadu sezení, viz 7.1).

---

## 0. Shrnutí

1. **Cyklus = NREM perioda + REM perioda** podle Feinberga a Floyda (1979):
   - NREM perioda (NREMP) trvá aspoň 15 min.
   - REM epizody oddělené méně než 15 min NREM patří do jedné REM periody (REMP).
   - Každá REMP kromě první trvá aspoň 5 min.
   - Strojově to převzal balík SleepCycles (Blume & Cajochen 2021). Doplnil dělení NREMP delší než 120 min (vynechaný první REM) a značení neúplných period na konci noci.
2. **Cyklus trvá 90 ± 25 min** (961 cyklů, 205 zdravých dospělých) a noc má 4,7 ± 0,9 cyklu (Rosenblum 2025).
   - Variabilita je hlavně uvnitř noci. SD intervalu mezi začátky REM v rámci noci je 19 min.
   - Osobní průměr se mezi lidmi liší jen o SD 5,8 min (ICC 0,32; Kishi & Van Dongen 2023).
3. **Model je skrytý semi-Markovův model (HSMM) se segmenty W0 → N1 → R1 → (W1) → N2 → R2 …**, tedy pravděpodobnostní verze Feinberga a Floyda.
   - Délky segmentů jsou log-normální a závisí na pořadí cyklu.
   - Emise spojují Ouru a Garmin přes matice záměn s korelovanými chybami. Jsou zmírněné kvůli autokorelaci a mají pojistku „zařízení celou REM periodu přehlédlo“.
   - Výstupy: P(REM perioda v čase t), intervaly začátku a konce každé REM periody, souhrny noci.
4. **Osobní prior** se učí hierarchicky (populace → člověk → noc) Kalmanovým filtrem po každé noci.
   - Učit se dá hlavně latence REM a průměrná délka cyklu.
   - Pravidelnost uvnitř noci je osobním rysem jen málo (ICC 0,02).
5. **Záznam „probudil jsem se ze snu v čase T“** je jedno svědectví s věrohodnostním poměrem asi 2.
   - Vybavení po probuzení z REM je 82 %, z NREM 43 % (Nielsen 2000).
   - Poměr se upravuje podle kvality vybavení a lucidity a má časové jádro podle jistoty času.
   - Počítá se přesně, rozšířením stavu o příznak „probuzení už nastalo“.
6. **Poctivé číslo pro chytrý budík [S].**
   - Bez dat z téže noci trefí model REM periodu v okně 4,5–6,5 h po usnutí nejvýš s pravděpodobností asi **0,31**. Pevných 5 h dává **0,27**.
   - Vybavení snu při budíku tím stoupne z asi 53 % na 55 %.
   - Kdyby appka znala konec předchozí REM periody téže noci, šlo by o **0,50**. Data v reálném čase ale API nedávají.
   - Chytrý budík proto prezentovat jako „budík ve správnou část noci, kotvený na skutečné usnutí, s bránou spánku a učením“. Ne jako „budík do REM“.
7. **Syntetická zkouška [S]** (30 nocí, záměrně chybný prior, epizodní korelované chyby zařízení):
   - HSMM snížil Brierovo skóre proti surovým štítkům Oury z 0,134 na 0,078.
   - Chybu kalibrace (ECE) snížil z 0,134 na 0,027.
   - Druhé, slabší zařízení přidalo málo.
   - Naivní spojení (ρ = 0) bylo hůř kalibrované a ρ šlo odhadnout z marginální věrohodnosti.
   - Platí jen pro simulované chyby.
8. **Výpočet:** na 5min mřížce desítky milisekund v isolate, na minutové mřížce pod 0,5 s.
9. **Validace** postupuje ve čtyřech krocích:
   - syntetika,
   - polosyntetika (skutečné PSG hypnogramy a simulátor zařízení),
   - veřejná data (Walch 2019, DREAMT, MESA, Sleep-EDF),
   - N-of-1 u uživatele (zápisy snů vynechané jeden po druhém a mikrorandomizovaný budík).

---

## 1. Literatura

### 1.1 Definice cyklu z hypnogramu

| Kritérium | Feinberg & Floyd 1979 | SleepCycles (Blume & Cajochen 2021) | Návrh pro Ouru a Garmin (2.6) |
|---|---|---|---|
| Začátek NREMP | S2 | Na začátku noci N1 (výchozí) nebo N2. Po REMP i bdění. | První epocha trvalého spánku (≥ 10 min spánku) |
| Minimum NREMP | 15 min (smí obsahovat bdění) | 15 min, smí obsahovat W a < 5 min REM | 15 min (3 epochy po 5 min) |
| Maximum NREMP | není | 120 min bez bdění, pak dělení | 120 min, dělení jen jako „možná vynechaný REM“ |
| Dělení dlouhé NREMP | není | U první N3 po ≥ 12 min bez N3 (Jenni & Carskadon 2004; Kurth 2010; Rudzik 2020) | Stejně, ale s nízkou jistotou (hluboký spánek je z náramku nespolehlivý) |
| Minimum REMP | 1. REMP bez minima, další ≥ 5 min | Stejně, parametr `REMP_length` = 10 epoch po 30 s | 1. REMP ≥ 1 epocha a ne dřív než 45 min po usnutí. Další ≥ 10 min na 5min datech, ≥ 5 min na minutových |
| Sloučení REM epizod | Mezera < 15 min NREM | Implicitně (REMP končí až splněním kritérií další NREMP) | Mezera < 15 min |
| Neúplná perioda na konci | Perioda bez ≥ 5 min opačného stavu před probuzením | `rm_incomplete_period` | Označit „neúplné“, do statistik délky nebrat |
| Rozlišení | 30s epochy | jen 30s epochy | 5 min (Oura API), minuty (Garmin přes Health Connect) |

**Poznámky k literatuře:**
- **Blume & Cajochen 2021** upozorňují, že původní kritéria „nebyla psána pro převod do kódu a jsou místy nedourčená“. Jejich implementace je proto de facto standard pro opakovatelnost.
- Vynechaný první REM je častý hlavně u dospívajících a mladých dospělých. Vidět je jen „zesvětlení spánku“ (Jenni & Carskadon 2004; Kurth 2010).
- **Merica & Gaillard 1986:** ani dlouhé bdění uvnitř cyklu „nenulovalo hodiny cyklu“. Číslování cyklů po probuzení WBTB proto nerestartovat.
- **Aeschbach & Borbély 1993** popisují dynamiku spánkového EEG po NREM-REM cyklech. Pomalovlnná aktivita klesá cyklus od cyklu. N3 je tedy značka prvních cyklů.

### 1.2 Délka a variabilita cyklů

- **Rosenblum 2025** (eLife, 5 datových sad, 205 zdravých dospělých):
  - Klasický cyklus trvá 90 ± 25 min, za noc jich je 4,7 ± 0,9.
  - Délka cyklů v průběhu noci tvoří obrácené U.
  - REM epizody trvají v průměru 22–26 ± 12–15 min podle datové sady.
  - Rozdělení délek cyklů není normální.
  - Děti a dospívající mají kratší cykly (80 ± 23 vs 90 ± 22 min).
  - Léky na depresi cykly prodlužují.
- **Kishi & Van Dongen 2023** (12denní laboratorní studie, 12h příležitosti ke spánku):
  - Průměrný interval mezi začátky REM je 91,6 min.
  - Mezi lidmi: SD 5,8 min, rozptyl 34,2 min².
  - Mezi nocemi téhož člověka: rozptyl 73,4 min².
  - ICC průměrné délky cyklu 0,32, počtu cyklů 0,37.
  - SD intervalu uvnitř noci je 19,3 min a jeho ICC jen 0,02. Nepravidelnost tedy není osobní rys.
  - Autoři shrnují, že „90 minut“ je zjednodušení a reálně jde o 70–150 min.
- **Schulz 1980:** po sobě jdoucí cykly mají záporné kovariance. Dlouhý cyklus mívá kratšího následníka. Data odpovídají „periodicky řízenému procesu“, ne procesu obnovy.
  - Důsledek: model, ve kterém se délky cyklů jen sčítají, rozmazává fázi k ránu víc než skutečnost. Rozšíření je v 3.2.
- **Kishi 2011:** délku intervalu mezi REM určují hlavně přechody N2 → N3 v NREM části.
- **Le Bon 2020** je přehled konkurenčních koncepcí regulace REM a NREM.
- **Akhavan 2026** (573 PSG nahrávek z veřejných databází):
  - Lidské REM tvoří „sekvenční“ (krátké mezery) i „jednotlivé“ cykly.
  - Delší předchozí REM znamená delší následující interval (β = 0,33 v log-log modelu).
  - V posledním decilu noci začíná asi 41 % REM záchvatů a podíl REM v něm dosahuje až 70 %.
  - Pro model z toho plyne, že délky REM záchvatů nejsou exponenciální. Semi-Markovův model má proto smysl.

### 1.3 Latence REM, podíl REM a jeho rozložení v noci

- **Boulos 2019** (meta-analýza 169 studií, 5 273 zdravých dospělých; průměry s 95% CI):
  - latence REM 97,4 min (93,9–100,8), ve věku 18–34 let 96,4 min, na druhé a další noci 87,3 min (82,4–92,2),
  - REM 19,0 % celkového spánku, na druhé a další noci 21,4 %,
  - latence usnutí 15,4 min, celkový spánek 394,6 min.
  - Domácí noci odpovídají spíš „druhé a další noci“.
- **Ohayon 2004** (65 studií, 3 577 osob): s věkem dospělých klesá podíl REM i latence REM. Efekty silně závisí na kvalitě výběru zdravých osob.
- **Feinberg & Floyd 1979:** REM periody se v noci prodlužují, NREM periody a pomalé vlny ubývají. Je to klasický zdroj pro „REM přibývá k ránu“.
- **Czeisler 1980; Dijk & Czeisler 1995:** REM má cirkadiánní složku s vrcholem kolem minima tělesné teploty, tedy v druhé polovině obvyklé noci. Při posunutém spánku se mění latence REM i jeho rozložení. Model proto potřebuje kovariátu „posun ulehnutí“.
- **Barbato 2002** (1 189 spontánních probuzení, 364 prodloužených nocí):
  - Probuzení delší než 10 min začínají přednostně z REM.
  - Po probuzení následuje krátká latence REM.
  - Podíl dlouhých probuzení po REM k ránu roste.
  - Pro model: REM po návratu do postele z WBTB přichází dřív a probuzení, které si člověk pamatuje, je spíš z REM.
- **Ebrahim 2013:** alkohol potlačuje REM v první polovině noci a prodlužuje latenci REM. V modelu je to štítek noci.

### 1.4 Probuzení a vybavení snu

- **Nielsen 2000:** vybavení po probuzení z REM 81,9 ± 9,0 % (29 studií), z NREM 43,0 ± 20,8 % (33 studií). Poměr ≈ 1,9.
- **Stucky 2025** (69 studií):
  - Zážitek s vybavením: REM 83,4 %, NREM 59,5 % (N1 84,9 %, N2 53,2 %, N3 50,8 %).
  - Doma o 14 p. b. víc než v laboratoři.
  - Při buzení budíkem o 10 p. b. méně než při oslovení jménem.
  - Novější data dávají menší poměr, asi 1,4.
- **Dement & Kleitman 1957:** vybavení po konci REM klesá během minut. Hranici kolem 8 min uvádějí sekundární zdroje [L, sekundárně]. V modelu z toho plyne okno λ_d = 5 min po konci REMP.
- **Lucidní sny:**
  - Vznikají převážně v REM, poprvé ověřeno signály očima (LaBerge 1981; přehled Baird 2019).
  - Existují i v NREM (Stumbrys & Erlacher 2012).
  - „Lucidní“ je tedy silné, ale ne absolutní svědectví o REM.

### 1.5 Pravděpodobnostní modely hypnogramu a spojování zdrojů

- **HMM pro spánek:**
  - Rabiner 1989 (forward–backward, Viterbi).
  - Pan 2012: HMM s omezenými přechody mezi fázemi.
  - Kemp & Kamphuisen 1986: simulace hypnogramů Markovovým řetězcem. Hodí se jako nezávislý generátor syntetických nocí.
- **Proč semi-Markov:**
  - Délky spánkových záchvatů nejsou geometrické (Lo 2004; Bianchi 2010).
  - Obyčejný HMM proto špatně drží minimální a typické délky period.
  - HSMM s explicitními délkami popisuje Yu 2010.
- **Hypnodenzita** (Stephansen 2018): pravděpodobnost fází po epochách je informativnější výstup než tvrdý hypnogram. Stejně chci ukazovat REM.
- **Čas v noci jako příznak:** Walch 2019 přidal „clock proxy“ k pohybu a tepu z Apple Watch a dosáhl ~72 % přesnosti pro bdění/NREM/REM. Oura používá znaky času v noci také (Altini 2021). Výstup zařízení tak už v sobě nese prior „REM k ránu“ a hrozí jeho dvojí započtení (viz β v 3.4).
- **Spojování nespolehlivých hodnotitelů:**
  - Dawid & Skene 1979: matice záměn hodnotitelů odhadované EM.
  - Kim & Ghahramani 2012: bayesovská kombinace klasifikátorů.
  - Korelované chyby dvou testů řeší model podmíněné závislosti (v `presnost_nositelne_elektroniky.md` 3.2).
- **Zmírněná věrohodnost** (power likelihood, Holmes & Walker 2017): emise umocněná γ < 1, když pozorování nejsou nezávislá.
- **Hodnocení pravděpodobností:**
  - Striktně správná skóre, Brier a log-skóre (Gneiting & Raftery 2007).
  - Slovní pravděpodobnosti lidé čtou nejednotně (Budescu 2014; škála IPCC Mastrandrea 2011). Slovo proto vždy doplnit číslem.

### 1.6 Co z toho plyne pro návrh

1. Feinbergova a Floydova pravidla jsou dobrý cíl, ale na 5min datech ze zařízení se musí převést na pravděpodobnost. Jinak vznikají falešné REM periody: v simulaci [S] surové štítky Oury vytvořily 0,97 falešného začátku REM periody za noc, HSMM 0,23.
2. Prior „cyklus 90 min“ se k ránu rozmaže. Osobní učení zúží hlavně první dva cykly a celkovou úroveň.
3. Dvě zařízení měřící tep a pohyb nejsou dva nezávislí svědci. Spojení musí počítat s korelovanými chybami a s autokorelací v čase.
4. Ruční zápisy snů jsou slabé, ale nezávislé svědectví. Jejich síla roste, když appka zná i probuzení bez snu (tlačítko „bez snu“, budíky WBTB).
5. Plánování (budík, podněty) je vždy předpověď z minulých nocí. API nedávají fáze v reálném čase (`presnost_nositelne_elektroniky.md` bod 7; zpráva *Lucidní snění, metody a aplikace 2*).

---

## 2. Pipeline: od surových dat k noci

### 2.1 Vstupy

| Zdroj | Pole | Kódování | Rozlišení | Poznámka |
|---|---|---|---|---|
| Oura API v2 (`/v2/usercollection/sleep`, OpenAPI 1.42) | `sleep_phase_30_sec`, `sleep_phase_5_min`, `app_sleep_phase_5_min` (bude zrušeno) | znak `1` hluboký, `2` lehký, `3` REM, `4` bdění | 30 s nebo 5 min od `bedtime_start` | Preferovat 30 s, pokud existuje. Logovat `sleep_algorithm_version` (v1/v2). Brát `type` = `long_sleep` (> 3 h). `sleep` a `late_nap` jsou zdřímnutí, `rest` je falešně detekovaný spánek. |
| Oura | `bedtime_start`, `bedtime_end` | ISO 8601 s posunem vůči UTC | | Kotva mřížky |
| Oura | `latency`, `movement_30_sec`, `heart_rate`, `hrv` | s, kódy 1–4, vzorky | | Zarovnání hodin podle tepu, kontrola usnutí |
| Garmin přes Health Connect (od poloviny 2025) | `SleepSessionRecord.stages` | `STAGE_TYPE_AWAKE` 1, `SLEEPING` 2, `OUT_OF_BED` 3, `LIGHT` 4, `DEEP` 5, `REM` 6, `AWAKE_IN_BED` 7, `UNKNOWN` 0 | úseky `startTime`–`endTime` (Instant), v praxi minuty | `startZoneOffset`, `endZoneOffset`. Logovat zdroj (`metadata.dataOrigin`) a verzi aplikace Garmin Connect. |
| Appka | „Jdu spát“, budík WBTB, „zpět do postele“, „Probudilo mě to“, zápis snu v noci, test reality po budíku | časová razítka telefonu (UTC) | sekundy | Jisté bdění (emise a_t) a kotvy |
| Ranní zápis | sny s časem T, jistota času, kvalita 0–10, lucidita, „bez snu“ | | | Kapitola 4 |

**Mapování tříd:** emise pracují se třemi třídami {W, N, R}. N = lehký + hluboký. Hluboký spánek se drží zvlášť jen pro deterministické dělení dlouhé NREMP (2.6, pravidlo F6).

### 2.2 Čas

1. Vše interně v **UTC (Instant)**. Lokální čas se počítá jen pro zobrazení a pro cirkadiánní kovariátu, vždy z posunu platného v daném okamžiku. Noci přes změnu letního času jsou pak bez chyby.
2. **Mřížka** Δ = 5 min (výchozí, rozlišení Oura API). Δ = 1 min, když je k dispozici `sleep_phase_30_sec` nebo jen Garmin.
3. **Měkké štítky:** pro epochu t a zařízení d spočítej podíly tříd φ^d_t ∈ [0,1]³ (stejně jako `presnost_nositelne_elektroniky.md` 3.1). Chybějící data = prázdný štítek (emise 1).
4. **Noc** = spojení relací oddělených méně než 60 min. Zdřímnutí (< 3 h, nebo začátek po 12:00 místního času) se do modelu noci nepočítá.
5. Začátek mřížky t = 1 je dřívější z `bedtime_start` (Oura) a začátku relace Garminu. Konec je pozdější z konců.

### 2.3 Zarovnání zařízení

1. Posun hodin δ ∈ [−5, +5] min odhadni křížovou korelací minutového tepu obou zařízení. Když tep chybí, použij binární sekvenci spánek/bdění a maximalizuj κ.
2. Posun použij, jen když zlepší shodu (κ o ≥ 0,05) a |δ| ≤ 5 min. Větší posun je spíš chyba dat než hodin. Nezarovnávat a noc označit.
3. Konstantní posun celého hypnogramu shodu s PSG nezlepšuje (Mouritzen 2020, citováno v `presnost_nositelne_elektroniky.md` 1.5). Zarovnání proto opravuje jen hodiny, ne chyby klasifikace.

### 2.4 Usnutí a kvalita noci

- **Usnutí S0** = první epocha, po které následuje ≥ 10 min spánku s nejvýš 2 min bdění. Jde o obdobu „latence k trvalému spánku“, shodnou s `inovace.md`.
  - V HSMM je S0 latentní (konec segmentu W0). Deterministické S0 slouží jen k zobrazení a k pravidlům 2.6.
- **Štítky noci** (z appky nebo ručně):
  - alkohol,
  - nemoc,
  - cestování přes ≥ 2 časová pásma,
  - noc s WBTB,
  - léky ovlivňující REM,
  - posun ulehnutí > 2 h proti osobnímu mediánu.
  - Štítky slouží jako kovariáty nebo vyřadí noc z učení (3.5).
- **Kvalita dat:** podíl epoch bez dat, nesoulad délky relací > 30 min, změna verze algoritmu. Noci s > 30 % chybějících epoch se do učení nepočítají.

### 2.5 Vyhlazování

- **Pro pravděpodobnostní model nic nevyhlazovat.** Časovou strukturu dodá HSMM. Předchozí vyhlazení by autokorelaci jen zesílilo a rozbilo kalibraci.
- **Pro deterministickou segmentaci** (zobrazení „surových“ cyklů a srovnávací baseline) použij modus v okně 3 epoch, až potom pravidla 2.6.

### 2.6 Deterministická segmentace podle Feinberga a Floyda, verze pro Ouru a Garmin

Slouží jako baseline ve validaci, pro detail „Surová data“ a jako záloha, když model nedoběhne. Vstup: sekvence {W, N, R} (u Oury i D).

| # | Pravidlo | Parametr (5min data / minutová) | Zdroj |
|---|---|---|---|
| F1 | Mapuj na W, N, R (D zvlášť pro F6), Oura 30 s agreguj na 1 min majoritou | | |
| F2 | Usnutí S0 = začátek prvního úseku ≥ 10 min spánku s ≤ 2 min bdění | 10 min | obdoba latence k trvalému spánku |
| F3 | Sluč REM úseky oddělené < 15 min N nebo W | 15 min | Feinberg & Floyd 1979 |
| F4 | 1. REMP: ≥ 1 epocha a začátek ≥ 45 min po S0. Dřívější REM označ „neobvyklé, spíš chyba zařízení“. Nediagnostikovat. | 5 / 1 min, 45 min | F&F bez minima; `presnost_nositelne_elektroniky.md` 3.9 |
| F5 | Další REMP ≥ 10 min (5min data) nebo ≥ 5 min (minutová). Kratší úseky patří do NREMP. | 10 / 5 min | F&F 5 min; jádra < 10 min z 5min dat nespolehlivá |
| F6 | NREMP > 120 min bez bdění rozděl u první epochy D po ≥ 12 min bez D. Výsledek je „cyklus bez REM“ s nízkou jistotou. | 120, 12 min | Blume & Cajochen 2021; Jenni & Carskadon 2004; Rudzik 2020 |
| F7 | Bdění ≥ 20 min označ jako přerušení (WBTB nebo nespavost). Číslování cyklů pokračuje. | 20 min | Merica & Gaillard 1986 |
| F8 | Perioda na konci bez ≥ 5 min opačného stavu před probuzením je „neúplná“ | 5 min | F&F; SleepCycles |
| F9 | Cyklus k = NREMP_k + REMP_k. Reportuj i interval mezi začátky REM (ROI). | | Kishi & Van Dongen 2023 |

---

## 3. Pravděpodobnostní model REM

### 3.1 Tři úrovně, jedna datová cesta

| Úroveň | Co dělá | Kde je popsaná | Kdy ji použít |
|---|---|---|---|
| 0: REM profil | Beta-vyhlazený průměr podílu REM po 5min binech přes 28 nocí | `inovace.md`, sdílený model | První verze, plánování bez modelu |
| A: dvoustavový HMM | REM / ne-REM po 5 min, prior π(τ), spojení dvou zařízení s ρ, γ, β | `presnost_nositelne_elektroniky.md` 3.2 | MVP denního zobrazení |
| B: HSMM cyklů | Segmenty NREMP/REMP s délkami podle cyklu, osobní prior, missed-REMP pojistka, zápisy snů | tento dokument | Cílový stav. Úrovně 0 a A z něj vypadnou jako speciální případy |

Úroveň B nahrazuje heuristickou křivku π(τ) prior predictive vlastního modelu (3.6). Ta ji při výchozích parametrech reprodukuje (tabulka v 3.6). Do REM profilu úrovně 0 se místo surových štítků zapisuje posterior z úrovně B.

### 3.2 Segmenty a jejich délky

```
Pořadí segmentů (levopravý řetězec, K_max = 8):
  W0, N1, R1, W1, N2, R2, W2, …, N8, R8, W8
Typy: W0 = usínání od začátku záznamu, N = NREM perioda, R = REM perioda,
      W = dlouhé bdění ≥ 5 min (spontánní nebo WBTB)
Přechody:  W0 → N1;  N_k → R_k;  R_k → W_k s p_W(k);  R_k → N_{k+1} s 1 − p_W(k);  W_k → N_{k+1}
Konec záznamu v čase T: segment, který v T běží, je cenzurovaný,
  místo p_j(d) se použije přežití S_j(d) = P(D_j ≥ d)
Délka: p_j(d) ∝ LN(d; m_j, s_j) na [d_min, d_max], diskretizováno po Δ
```

| Segment | Medián m (min) | s (log) | Podpora (min) | Zdroj |
|---|---|---|---|---|
| W0 (usínání) | osobní, výchozí 12 | 0,7 | 0–180 | Boulos 2019 (SOL 15,4 průměr) [L/P] |
| N1 (latence REM od usnutí) | směs: 0,9 · LN(80; 0,30) + 0,1 · LN(170; 0,20) | | 15–300 | Boulos 2019: průměr 87–97 min [L]. Podíl vynechaného 1. REM 0,1 [P] |
| N_k, k ≥ 2 | 68 | 0,25 | 15–200 | Cyklus 90 min minus REMP (Rosenblum 2025; Kishi 2023) [O] |
| N_k po W_{k−1} | 35 | 0,6 | 5–200 | Krátká latence REM po probuzení (Barbato 2002), velikost [P] |
| R1 | 10 | 0,5 | Δ–60 | REM se k ránu prodlužuje (F&F 1979; Rosenblum 2025) [O/P] |
| R2, R3, R4, R5+ | 17, 22, 26, 28 | 0,5 | 5–75 | Průměr REM epizody 22–26 min (Rosenblum 2025) [O] |
| W_k | 10 | 0,8 | 5–120 | [P] |
| p_W(k) | min(0,25; 0,05 + 0,04 (k − 1)) | | | Dlouhá probuzení po REM přibývají k ránu (Barbato 2002) [P] |

**Kontrola [S].** Generativní model s těmito parametry (30 000 simulovaných nocí po 8 h) dává:
- 21,6 % REM (Boulos 2019: 19,0–21,4 %),
- 4,8 REM periody za noc (Rosenblum 2025: 4,7 ± 0,9).

**Rozšíření pro záporné kovariance cyklů (Schulz 1980).** Začátky REM period se modelují jako mřížka s chvěním, ne jako součet nezávislých délek:

```
s_k = L + (k − 1)·P + η_k,   η_k = α·η_{k−1} + ξ_k,   ξ_k ~ N(0, σ_ξ²)
α = 0 … čistě periodický proces (lag-1 korelace intervalů −0,5)
α = 1 … proces obnovy (běžný HSMM)
výchozí α = 0,5 [P], fitovat na Sleep-EDF / MESA (7.2)
```

V HSMM se to přiblíží časově nehomogenní délkou N_k, která závisí na odchylce začátku R_{k−1} od mřížky. Do stavu se přidá diskretizovaná fáze (5 košů). V simulaci [S] změnila mřížka maximum P(REMP) v pozdním okně jen z 0,30 na 0,35. Proto jde o rozšíření, ne o MVP.

### 3.3 Emise: co „vidí“ zařízení

**Mikrostav uvnitř segmentu.** Skutečná fáze v epoše t je z_t ∈ {W, N, R} s rozdělením μ_j(z):

| Segment | μ(W) | μ(N) | μ(R) | Zdůvodnění |
|---|---|---|---|---|
| W0 | 0,95 | 0,05 | 0 | |
| N_k | 0,04 | 0,94 | 0,02 | NREMP smí obsahovat bdění a < 5 min REM (F&F) |
| R_k | 0,05 | 0,10 | 0,85 | REMP smí obsahovat krátké bdění a NREM < 15 min |
| W_k | 0,90 | 0,10 | 0 | |

**Model zařízení.** C_d(o | z) je matice záměn zařízení d (řádek = skutečnost, sloupec = štítek). Výchozí hodnoty sjednocené s `presnost_nositelne_elektroniky.md` 1.4 a 3.3 (s = senzitivita REM, f = falešně pozitivní REM):

| | Oura → W | Oura → N | Oura → R | Garmin → W | Garmin → N | Garmin → R |
|---|---|---|---|---|---|---|
| skutečně W | 0,60 | 0,30 | 0,10 | 0,50 | 0,35 | 0,15 |
| skutečně N | 0,05 | 0,85 | **0,10** (f_O) | 0,05 | 0,80 | **0,15** (f_G) |
| skutečně R | 0,03 | 0,27 | **0,70** (s_O) | 0,04 | 0,46 | **0,50** (s_G) |

- Řádky W jsou [P]: zařízení řadí nehybné bdění jako spánek a Garmin bdění často i jako REM.
- Pesimistická varianta Garminu (Vivosmart 4): s_G = 0,33, f_G = 0,12.

**Korelované chyby: vazba se zachovanými marginálami.** Zobecňuje binární model z `presnost_nositelne_elektroniky.md` 3.2 na tři třídy a nikdy nedá zápornou buňku:

```
pro každé z:  a_i = C_O(i|z),  b_i = C_G(i|z),  m_i = min(a_i, b_i),  M = Σ_i m_i
  J(i,k|z)   = m_i·[i = k] + (a_i − m_i)(b_k − m_k) / (1 − M)        (maximální shoda, Fréchet)
  P_ρ(i,k|z) = (1 − ρ)·a_i·b_k + ρ·J(i,k|z),     ρ ∈ [0, 1]
Marginály P_ρ jsou přesně C_O a C_G. ρ = 0 je naivní Bayes, ρ = 1 maximální korelace.
```

**Převod ρ mezi dokumenty [O].** Pro REM při s_O = 0,70 a s_G = 0,50 platí:
- tady P(oba REM | R) = 0,35 + 0,15 ρ,
- v binárním modelu `presnost_nositelne_elektroniky.md` 0,35 + 0,229 ρ′.

Pro ne-REM (f_O = 0,10, f_G = 0,15) vychází 0,015 + 0,085 ρ vs 0,015 + 0,107 ρ′. Výchozí ρ′ = 0,3 tedy odpovídá **ρ ≈ 0,4**.

**Emise epochy:**

```
P(o_t | z) = Σ_{a,b} φ^O_t(a)·φ^G_t(b)·P_ρ(a, b | z) · P(a_t | z)
  když chybí zařízení d, jeho φ^d_t se vynechá (marginalizace)
  P(a_t = jisté bdění | z) = 0,99 pro z = W, jinak 0,01
e_j(t) = [ Σ_z μ_j(z)·P(o_t | z) ]^γ
  γ = 0,5 na 5min epochu (z `presnost_nositelne_elektroniky.md`), tj. 0,1 na minutu
```

**Pojistka „zařízení celou REM periodu přehlédlo“.**
- Proč: chyby zařízení jsou lokální, ale často pokrývají celou periodu. Garmin má latenci REM +16 až +30 min a krátký první REM zařízení často přehlédnou (`presnost_nositelne_elektroniky.md` 1.5).
- Pro segment R_k na [s, e]:

```
E_j(s, e) = Σ_{m_O, m_G ∈ {0,1}} w(m_O, m_G | k) · Π_{t=s..e} e_j^{(m_O, m_G)}(t)
  w = Π_d π_d(k)^{m_d} (1 − π_d(k))^{1 − m_d}
  v režimu m_d = 1 zařízení d vidí REM jako NREM: C_d(·|R) := C_d(·|N)
π_O(1) = 0,25, π_O(k ≥ 2) = 0,10;  π_G(1) = 0,50, π_G(k ≥ 2) = 0,25     [P/O]
```

- Účinek [S]: v nocích, kdy obě zařízení přehlédla pozdní REM periodu, stoupla průměrná P(REMP) uvnitř skutečné periody z 0,16 na 0,38.
- Dobře kalibrované noci to nezhoršilo (Brier 0,082 → 0,078).

**Dvojí započtení času v noci.** Oura i Garmin už používají znaky času v noci. Při zpětné inferenci se proto apriorní log-pravděpodobnosti délek a přechodů násobí **β = 0,5** a znovu normalizují (tj. p_j(d)^β). Při plánování bez dat ze zařízení je β = 1. Hodnotu β ladit na kalibraci (ECE) ve validaci.

### 3.4 Inference

Prefixové součty dovolí spočítat emisi celého segmentu v O(1):

```
C_j(t) = Σ_{u ≤ t} log e_j(u);   logE_j(s, e) = C_j(e) − C_j(s − 1)   (u R: log-součet přes 4 režimy)

Dopředu (t = 1..T):
  St_j(t) = log P(o_{1:t−1}, segment j začíná v t)
          = 0 pro j = W0, t = 1;   jinak logsumexp_{i ∈ pred(j)} [ A_i(t − 1) + log a_ij ]
  A_j(t)  = log P(o_{1:t}, segment j končí v t)
          = logsumexp_{d = d_min..min(t, d_max)} [ St_j(t − d + 1) + β·log p_j(d) + logE_j(t − d + 1, t) ]
  log Z   = logsumexp_{j, s} [ St_j(s) + β·log S_j(T − s + 1) + logE_j(s, T) ]

Dozadu:
  Bs_j(s) = log P(o_{s:T} | j začíná v s)
          = logsumexp( logsumexp_d [ β·log p_j(d) + logE_j(s, s+d−1) + Be_j(s+d−1) ],
                       β·log S_j(T−s+1) + logE_j(s, T) )
  Be_j(t) = log P(o_{t+1:T} | j končí v t) = logsumexp_{k ∈ succ(j)} [ log a_jk + Bs_k(t + 1) ]

Posterior segmentu na [s, e]:  ξ_j(s, e) = exp( St_j(s) + β·log p_j(e−s+1) + logE_j(s, e) + Be_j(e) − log Z )
Obsazenost occ_j(t) se sečte rozdílovým polem (+ξ v s, −ξ v e+1).
```

**Výstupy noci:**

```
q_t        = P(REMP v t | data)     = Σ_{j ∈ R} occ_j(t)
r_t        = P(z_t = REM | data)    = Σ_j occ_j(t) · μ_j(R)·P(o_t|R) / Σ_z μ_j(z)·P(o_t|z)
on_k(s)    = P(R_k začíná v s | data);  P(R_k existuje) = Σ_s on_k(s)
off_k(e)   analogicky;  80% interval začátku a konce z kvantilů on_k, off_k
```

**Vzorky cest (FFBS):**
1. Vyber poslední cenzurovaný segment a jeho začátek úměrně exp(St + log S + logE).
2. Pak zpětně předchůdce a jeho délku.
3. Opakuj 200×.

Ze vzorků se spočítají souhrny noci s nejistotou:
- latence REM L_n = začátek R1 − začátek N1,
- intervaly mezi začátky REM ROI_k,
- délky REMP D_k,
- „vynechaný 1. REM“ (N1 > 150 min).

Viterbiho cesta (MAP) slouží jen k jednomu hladkému „nejpravděpodobnějšímu hypnogramu“ v detailu, nikdy jako fakt.

### 3.5 Osobní prior: hierarchický model populace → člověk → noc

Pro každý parametr θ (na log škále) platí model místní úrovně (Kalmanův filtr):

```
θ_{u,n} = μ_pop + b_{u,n} + βᵀx_n + e_{u,n},   e ~ N(0, σ_w²)       noc n uživatele u
b_{u,n} = b_{u,n−1} + ω_n,   ω ~ N(0, q)                             pomalý drift
start: b = 0, P = τ²

po noci n (y_n, v_n = průměr a rozptyl θ z 200 vzorků FFBS):
  P⁻ = P + q
  R_n = σ_w² + v_n;   když |y_n − μ_pop − βᵀx_n − b|² > 9 (P⁻ + R_n), R_n ← 4 R_n   (odlehlá noc)
  K  = P⁻ / (P⁻ + R_n)
  b  = b + K·(y_n − μ_pop − βᵀx_n − b);   P = (1 − K)·P⁻

prior pro další noc:  θ ~ N(μ_pop + b + βᵀx, σ_w² + P)   → m_j = exp(·), s_j = √(σ_w² + P + s_cyklus²)
```

| θ | μ_pop | τ (mezi lidmi) | σ_w (mezi nocemi) | Zdroj |
|---|---|---|---|---|
| log latence REM L | log 80 | 0,15 | 0,25 | Boulos 2019; ICC ≈ 0,26 zvoleno podle ICC 0,32 délky cyklu (Kishi 2023) [O/P] |
| log medián N_k (k ≥ 2) | log 68 | 0,065 | 0,10 | Kishi 2023: SD mezi lidmi 5,8 min, rozptyl mezi nocemi 73,4 min² při ROI 91,6 min [O] |
| cyklus od cyklu (uvnitř noci) | 0,22, neučí se | | | SD-ROI 19,3 min, ICC 0,02 (Kishi 2023) [O] |
| log škála REMP (násobí mediány R_k) | 0 | 0,20 | 0,25 | [P] |
| log SOL | log 12 | 0,4 | 0,6 | Boulos 2019 [O/P] |
| π_skip (vynechaný 1. REM) | Beta(2, 18) | | | aktualizace Beta(2 + Σ p_n, 18 + Σ (1 − p_n)) [P] |
| drift q | 0,0005 za noc | | | odpovídá pomalé změně za měsíce [P] |

**Shrnutí (shrinkage).** Váha vlastních dat po n nocích u délky cyklu je n τ² / (n τ² + σ_w²) [O]:
- 1 noc: 0,30,
- 5 nocí: 0,68,
- 14 nocí: 0,86.

**Kovariáty x_n** (koeficienty β s priorem a učením ve stejném filtru jako rozšířený stav):
- **Posun ulehnutí v hodinách proti osobnímu mediánu:** při pozdějším ulehnutí kratší latence REM, prior β ~ N(−0,08; 0,05²) na hodinu (směr: Czeisler 1980; Dijk & Czeisler 1995, velikost [P]).
- **Alkohol:** delší latence REM, prior +0,2 ± 0,15 (Ebrahim 2013, velikost [P]).
- **Noc s WBTB:** jen přes segment W_k a zkrácenou N_{k+1}, ne přes θ.
- **Z učení vyřadit:** noci se štítkem nemoc, cestování a léky ovlivňující REM. Noci s nízkou kvalitou dat (2.4) také.

**Parametry zařízení:**
- **ρ** volit každý týden z mřížky {0; 0,2; 0,4; 0,6} podle součtu log Z přes posledních 28 nocí s oběma zařízeními (aspoň 7 nocí). Prior preferuje 0,4. V simulaci [S] měla marginální věrohodnost maximum u skutečné hodnoty vazby (ρ = 0,5) v obou scénářích.
- **Matice záměn** se z dat uživatele bez referenční noci neučí. Model latentních tříd není bez silných priorů identifikovatelný (`presnost_nositelne_elektroniky.md` 3.6).
- **Výjimka:** EEG referenční noc nebo úpravy typu Dawid–Skene s Dirichletovým priorem (200 pseudopočtů), omezené na ±0,1 od výchozích hodnot.
- **Změna verze algoritmu** (`sleep_algorithm_version`, verze Garmin Connect) vrací ρ na výchozí hodnotu. Osobní θ se nemažou, jen se P zvětší 2×.

### 3.6 Prior predictive: odhad výskytu REM bez dat dané noci

Pro plánování (budík, podněty) a pro prázdný stav se ze simulovaných nocí počítá:

```
π(t) = P(REMP v t), t = minuty od usnutí
π₅(t) = P(REMP v t a běží už ≥ 5 min)
M = 2000 simulovaných nocí z osobního prioru, β = 1
```

| Čas od usnutí (h) | 1 | 1,5 | 2 | 2,5 | 3 | 3,5 | 4 | 4,5 | 5 | 5,5 | 6 | 6,5 | 7 | 7,5 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| π(t), výchozí populace [S] | 0,09 | 0,16 | 0,10 | 0,20 | 0,24 | 0,20 | 0,25 | 0,28 | 0,27 | 0,27 | 0,30 | 0,31 | 0,30 | 0,31 |
| π(τ) heuristika z `presnost_nositelne_elektroniky.md` | 0,15 | 0,15 | 0,18 | 0,18 | 0,22 | 0,22 | 0,26 | 0,26 | 0,30 | 0,30 | 0,33 | 0,33 | 0,33 | 0,33 |

**Čtení tabulky:**
- Model reprodukuje heuristiku a navíc má vlny prvních dvou cyklů (vrchol kolem 1,5 a 3 h, údolí kolem 2 h).
- Od 4 h je fáze rozmazaná. Plyne to z variability 19 min na cyklus, ne z chyby modelu.
- **Osobní prior zúží hlavně první dva cykly.** Pozdní okno zůstane kolem 0,3 i při dokonale známých osobních průměrech [S]: v simulaci bez rozptylu mezi lidmi vyšlo maximum 0,35 místo 0,34.
- Nejistota usnutí (kotva „Jdu spát“ + medián SOL) maximum téměř nemění (0,31) [S].

---

## 4. Ruční záznamy a jejich použití

### 4.1 Datový model záznamu

| Pole | Hodnoty | Účel |
|---|---|---|
| `tMin` | čas probuzení se snem (UTC) | střed jádra |
| `timeSource` | `nocVAppce` (razítko zápisu), `budik` (čas budíku WBTB), `ranoPresne`, `ranoZhruba`, `ranoNevim` | σ_T a posun δ |
| `recalled` | sen / bez snu (bílý sen se počítá jako „bez snu“) | směr svědectví |
| `quality` | 0–10 | síla svědectví |
| `lucid` | ano / ne | síla svědectví |
| `falseAwakening` | ano / ne | jen pro statistiku, do modelu ne |

**Nejistota času** (sladěno s `inovace.md`, SIGMA):

| `timeSource` | δ (min, o kolik dřív bylo probuzení) | σ_T (min) |
|---|---|---|
| `budik` | 0 | 1 |
| `nocVAppce` | 2 | 3 |
| `ranoPresne` | 0 | 5 |
| `ranoZhruba` | 0 | 20 |
| `ranoNevim` | 0 | 60 |

**Doporučení pro UI ranního zápisu:** přidat rychlou volbu **„Probudil jsem se, ale nic si nepamatuju“** s časem. Negativní záznamy (a každý budík WBTB s odpovědí sen / bez snu) udělají ze slabého svědectví měřitelné. Bez nich nejde Λ kalibrovat (4.3).

### 4.2 Věrohodnost záznamu

```
ℓ_r(cesta) = Σ_τ w_r(τ) · λ_r(τ | cesta)
  w_r(τ) = N(τ; T_r − δ_r, σ_r²), normováno na mřížce noci (Σ_τ w_r = 1)
  λ_r(τ | cesta) = Λ_r   když v τ běží REMP, nebo REMP skončila nejvýš λ_d = 5 min před τ
                 = 1     jinak
Sen:     Λ_r = min(10, Λ_0 · exp(β_q·(q_r − 5)/5) · Λ_L^{lucid})
Bez snu: Λ_r = Λ_0⁻
```

| Parametr | Výchozí | Rozsah | Zdroj |
|---|---|---|---|
| Λ_0 | 2,0 | 1,4–3 | 0,82 / 0,43 = 1,9 (Nielsen 2000). Novější 0,83 / 0,60 = 1,4 (Stucky 2025). Dlouhá probuzení jsou častěji z REM (Barbato 2002). [O] |
| Λ_0⁻ (bez snu) | 0,4 | 0,3–0,5 | (1 − 0,82) / (1 − 0,43) = 0,32; se Stucky 2025 0,41 [O] |
| β_q | 0,4 | 0–0,8 | q = 10 → ×1,49, q = 0 → ×0,67. NREM zprávy bývají kratší a méně snové (Nielsen 2000). [P] |
| Λ_L | 3 | 2–5 | LD převážně v REM (LaBerge 1981; Baird 2019), ale ne výhradně (Stumbrys & Erlacher 2012) [P] |
| λ_d | 5 min | 3–10 | Vybavení po konci REM klesá během minut (Dement & Kleitman 1957) [L, sekundárně] |
| strop Λ | 10 | | Ochrana proti přebití dat zařízení jedním zápisem [P] |

**Přesný výpočet: rozšíření stavu o příznak.**
- Ke každému segmentu se přidá příznak c ∈ {0, 1} („probuzení r už nastalo“).
- V segmentu j na [s, e] může cesta buď c zachovat (faktor 1), nebo přejít 0 → 1 s faktorem:

```
F_j(s, e) = Σ_{τ = s..e} w_r(τ) · λ_j(τ − s)
  pro R:                 Λ·(W(e) − W(s−1))
  pro segment po REMP:   Λ·(W(min(e, s−1+λ_d)) − W(s−1)) + (W(e) − W(min(e, s−1+λ_d)))
  jinak:                 W(e) − W(s−1)
  W(t) = Σ_{u ≤ t} w_r(u)   (prefixový součet, výpočet v O(1))
Na konci noci se vyžaduje c = 1.
```

- Výsledek je přesně ℓ_r a cena je jen ×2 stavů.
- Více záznamů za noc: čítač c ∈ {0..R} podle pořadí časů, nejvýš jedna událost na segment. Dva zápisy z jedné REMP jsou vzácné, a když nastanou, slučují se.

**Záložní aproximace (MVP):** logaritmický pool e_j(t) ← e_j(t) · λ_j(t)^{w_r(t)}.
- Pro malé σ_T je přesný.
- Pro velké σ_T rozprostře svědectví do jádra a je mírně slabší.
- V simulaci [S] (Λ = 3, σ = 10 min) zvýšil průměrnou P(REMP) uvnitř REM periody, kterou obě zařízení přehlédla, z 0,38 na 0,43. U lucidního zápisu (Λ = 9) na 0,49.

**Jisté bdění.** Zápis v noci v appce (`nocVAppce`) navíc dává jisté bdění v epoše zápisu (a_t). Ranní odhad ne.

### 4.3 Učení ze záznamů

1. **Osobní parametry** se aktualizují samy: zápis změní posterior hranic REM period dané noci, tedy i vzorky FFBS, ze kterých se počítá y_n (3.5).
2. **Kalibrace Λ** (po ≥ 30 záznamech včetně „bez snu“):
   - Pro každý záznam spočítej p_r = P(REMP⁺ v τ | data bez záznamu r). REMP⁺ je REMP plus 5 min po konci, integrováno přes jádro w_r.
   - Model vybavení je směs se známými vahami:

```
P(y_r | p_r) = p_r · ρ_R^{y_r} (1 − ρ_R)^{1 − y_r} + (1 − p_r) · ρ_N^{y_r} (1 − ρ_N)^{1 − y_r}
y_r = 1 sen, 0 bez snu
priory:  ρ_R ~ Beta(16,4; 3,6) (průměr 0,82),  ρ_N ~ Beta(8,6; 11,4) (průměr 0,43)   (Nielsen 2000, síla 20 pseudopočtů)
EM nebo mřížka → Λ_0 = ρ_R / ρ_N,  Λ_0⁻ = (1 − ρ_R) / (1 − ρ_N)
```

   - Identifikovatelnost dává rozptyl p_r. Budíky WBTB v různých částech noci jsou proto cenné.
   - Λ_0 omezit na [1,2; 4].
3. **Vlastní stopy:** z kvality q a lucidity se neučí nic jiného než β_q a Λ_L, a to až po ≥ 50 záznamech.

### 4.4 Chytré probuzení do snu (WBTB)

**Brána** (pravidla obsahu a `inovace.md`):
- od 15. dne programu,
- nejvýš 2× za 7 dní a nikdy dvě noci po sobě,
- jen po dobré noci: zelená v „Jak ses vyspal“ (ne po žluté ani červené), ne při spánkovém dluhu (spánek předchozí noci < 6 h, pokud je znám),
- ne se štítkem nemoc nebo alkohol,
- uživatel musí chtít.

**Algoritmus:**

```
1. S0 = čas „Jdu spát“ + osobní medián SOL; při opětovném otevření appky do 2 h S0 posunout
2. M = 2000 nocí z osobního prior predictive (3.6), β = 1
3. pro t ∈ [S0 + 270, min(S0 + 390, plánované vstávání − 90)] min:
       π₅(t) = P(REMP běží v t a trvá už ≥ 5 min)
4. t* = argmax_t [ π₅(t) − κ·|t − (S0 + 300)| ],  κ = 0,0003 za min
       (mírná preference 5 h podle praxe NALDIS/ILDIS; větší κ by zisk z modelu vynulovalo:
        rozdíl π₅ mezi 5 h a 6,5 h je jen asi 0,04)
5. budík t*, okno nejistoty = 80% interval začátku REMP, která t* pokrývá
6. ráno po synchronizaci: q(t*) z posterioru + odpověď sen / bez snu → záznam typu `budik` (4.1)
```

Podmínka „vstávání − 90 min“ nechává po návratu do postele čas na pozdní REM, kvůli kterému se WBTB dělá. Při výchozích parametrech model obvykle zvolí 6–6,5 h po usnutí. Odpovídá to naznačení, že pozdější přerušení vychází lépe než 4,5 h (Erlacher 2022, jen mezistudiové srovnání).

**Co od toho čekat [S]:**

| Strategie | P(REM perioda při budíku) | Očekávané vybavení snu (0,43 + 0,39·P) |
|---|---|---|
| Pevně 5 h po usnutí | 0,27 | 0,53 |
| Nejlepší čas z prioru (≈ 6,3 h) | 0,31 | 0,55 |
| Kdyby byl znám konec předchozí REMP téže noci (nedostupné) | 0,50 | 0,62 |

**Důsledky:**
1. Hlavní hodnotu nedává přesné zasažení REM. Dávají ji:
   - kotva na skutečné usnutí místo ulehnutí,
   - pozdní část noci, kde je REM nejvíc a skoro žádný hluboký spánek,
   - brána spánku,
   - měření vlastního efektu.
   Text v appce podle toho (6.4).
2. Laboratorní varianta (buzení po 10–15 min nepřerušeného REM kolem 6 h; Erlacher & Stumbrys 2020) doma bez živých dat nejde. Nesmí se slibovat.
3. **Experimentálně, mimo MVP:** živý odhad z hodinek (vlastní aplikace Connect IQ na Garminu se srdečním tepem a pohybem) by mohl dát informaci z téže noci. Validace neexistuje a dopad na baterii a schválení je neznámý.
4. **Mikrorandomizace v Osobní laboratoři:** na povolených nocích losovat t* vs pevných 5 h. Analýza je v 7.5. Po 3 měsících (~24 nocí) poznáš jen velké rozdíly.

### 4.5 Okna pro Zvukový klíč (TLR)

```
start okna = max(S0 + 6 h, konec večerního tréninku + 6 h)        (Konkoly 2024, exp. 1)
           nebo návrat do postele po WBTB + 20 min                  (krátká latence REM po probuzení, Barbato 2002; délka [P])
konec okna = plánovaný budík − 15 min
v okně: hustota podnětů ∝ π₅(t) / max π₅, nejméně 1 podnět za 60 s, když π₅(t) ≥ 0,2;
        jinak rytmus 20–40 s z protokolu
pauzy:  pohyb (akcelerometr) → 1 min;  „Probudilo mě to“ → 45 min;  strop hlasitosti a jemný režim (Konkoly 2024, exp. 2)
ráno:   přesnost podnětů = Σ_cue q(t_cue) / počet podnětů → týdenní karta a ladění okna
```

- V pozdní noci je π₅ ≈ 0,2–0,3 téměř všude. Model tedy hlavně vynechá první polovinu noci a mezeru hned po budíku.
- Podněty tak budou téměř souvislé, což odpovídá publikovanému protokolu. Je to poctivé: přesné časování do REM bez živých dat neexistuje.
- Každé „Probudilo mě to“ je jisté bdění (a_t) a zároveň hlášení k rozpočtu probuzení.

---

## 5. Výchozí parametry

| Skupina | Parametr | Výchozí | Rozsah pro citlivost | Zdroj |
|---|---|---|---|---|
| Mřížka | Δ | 5 min (1 min s 30s daty) | | Oura API [L] |
| Usnutí | trvalý spánek | 10 min, ≤ 2 min bdění | 5–15 | obdoba latence k trvalému spánku; `inovace.md` |
| Segmenty | latence REM (medián) | 80 min | 60–100 | Boulos 2019 [L/O] |
| | podíl vynechaného 1. REM | 0,10 | 0,05–0,25 | Jenni & Carskadon 2004 kvalitativně [P] |
| | NREMP k ≥ 2 (medián, s) | 68 min, 0,25 | 55–80 | Rosenblum 2025; Kishi 2023 [O] |
| | REMP R1..R5+ (medián) | 10, 17, 22, 26, 28 min | ×0,7–1,3 | F&F 1979; Rosenblum 2025 [O/P] |
| | NREMP po dlouhém bdění | 35 min, s 0,6 | 15–60 | Barbato 2002 kvalitativně [P] |
| | p_W(k) | 0,05 → 0,25 | | Barbato 2002 kvalitativně [P] |
| | min. NREMP, min. REMP (k ≥ 2), sloučení | 15, 5 (10 na 5min datech), 15 min | | F&F 1979 [L] |
| Mikrostav | μ_N(R), μ_R(R) | 0,02, 0,85 | 0–0,05, 0,75–0,95 | F&F 1979 (REMP smí obsahovat W a NREM) [P] |
| Zařízení | s_O, f_O | 0,70, 0,10 | 0,55–0,76, 0,05–0,18 | `presnost_nositelne_elektroniky.md` 3.3 |
| | s_G, f_G | 0,50, 0,15 | 0,33–0,54, 0,11–0,19 | tamtéž |
| | ρ (vazba se zachovanými marginálami) | 0,4 | 0–0,6 | ≈ ρ′ 0,3 binárně [O] |
| | γ | 0,5 na 5 min | 0,3–1 | tamtéž [P] |
| | β (zmírnění prioru) | 0,5 | 0–1 | tamtéž [P] |
| | π_miss Oura (R1, R2+) | 0,25, 0,10 | 0–0,4 | latence REM Oury −9,5 min; přehlížení 1. REM [O/P] |
| | π_miss Garmin (R1, R2+) | 0,50, 0,25 | 0,2–0,6 | latence REM Garminu +16 až +30 min [O/P] |
| Osobní prior | τ, σ_w pro L | 0,15, 0,25 | | [O/P] |
| | τ, σ_w pro N_k | 0,065, 0,10 | | Kishi 2023 [O] |
| | drift q | 0,0005 za noc | 0–0,002 | [P] |
| Zápisy | Λ_0, Λ_0⁻, β_q, Λ_L, λ_d | 2,0; 0,4; 0,4; 3; 5 min | viz 4.2 | Nielsen 2000; Stucky 2025; Dement & Kleitman 1957 |
| | σ_T | 1 / 3 / 5 / 20 / 60 min | | `inovace.md` [P] |
| WBTB | okno | 4,5–6,5 h po S0 | | zpráva *Lucidní snění 2*; Erlacher 2022 [L] |
| | penalizace vzdálenosti od 5 h (κ) | 0,0003 za min | 0–0,0005 | [P] |
| | nejpozději | plánované vstávání − 90 min | | [P] |
| TLR | start | S0 + 6 h nebo po WBTB + 20 min | | Konkoly 2024 [L]; [P] |
| Zobrazení | strop p | 0,9 | 0,8–0,9 | `presnost_nositelne_elektroniky.md` 2.1 |

---

## 6. Jak ukazovat nejistotu

Slovník a vizuální pravidla jsou v `presnost_nositelne_elektroniky.md` 2.2 a 2.4. Tady je jen to, co přidává HSMM.

### 6.1 Kategorie (stejné prahy ve všech obrazovkách)

| p (po stropu 0,9) | Slovo | Den | Noc |
|---|---|---|---|
| ≥ 0,7 | „pravděpodobně REM“ | #FF5F1F, krytí 0,9 | #FF3B2F plně |
| 0,4–0,7 | „možná REM“ | #FF5F1F, krytí 0,55 | #B3261E |
| 0,2–0,4 | „spíš ne“ | #FF5F1F, krytí 0,25 | #5A120D |
| < 0,2 | nezobrazovat, v detailu „málo pravděpodobné“ | | |

- **Slovo vždy s číslem** zaokrouhleným na desítky („pravděpodobně REM, asi 7 z 10“). Slovní pravděpodobnosti si lidé vykládají různě (Budescu 2014).
- **Noc:** jen červené odstíny na černé a bez gradientů. Tři úrovně stačí, nejistotu nese vzor (přerušovaný obrys) místo další barvy.

### 6.2 REM okno jako karta

```
OKNO REM 4 · 04:40–05:05 · POČÁTEK ±10 MIN
pravděpodobně REM (asi 7 z 10)
OURA ●  GARMIN ○  ZÁPIS ★
```

- Časy na 5 min. Okraje z 80% intervalu začátku (on_k) a konce (off_k).
- Pás q_t pod kartou. Jádro p ≥ 0,5 plnou linkou s rohovými značkami, okraj 0,3–0,5 přerušovaně.
- **Proč to tak vychází** (rozbalení karty): příspěvek zdrojů v „bodech“ (log šance ×10, zaokrouhleno):
  - populace a tvoje historie,
  - Oura,
  - Garmin,
  - tvůj zápis.
  Počítá se opakovaným během bez daného zdroje (4 běhy navíc, líně, jen po rozbalení).
  Text: „Nejvíc k tomu přispěla Oura a tvůj zápis ve 4:58. Garmin tu REM nevidí.“

### 6.3 Jistota noci a nejistá okna

- **Jistota noci** = 1 − průměrná binární entropie q_t přes spánek, rozdělená na vysoká / střední / nízká (prahy 0,6 a 0,4 [P]). Vedle ní ukazatel shody zařízení (κ Oura vs Garmin).
- **Citlivostní test:** okno, které se při ρ ∈ {0; 0,6} nebo γ ∈ {0,3; 1} posune o víc než 10 min, dostane štítek „NEJISTÉ“ (`presnost_nositelne_elektroniky.md` 3.9).
- **První cyklus:** nikdy „pravděpodobně“, když ho vidí jen jedno zařízení a chybí zápis. Strop p v prvních 2 h je 0,7 [P].

### 6.4 Plánování a budík

- **Pás osobní křivky π(t)** (medián a 25.–75. percentil z prior predictive). Text: „V 9 ze 14 nocí jsi měl pravděpodobné REM okno mezi 4:10 a 5:00.“
- **Budík:** „Budík 4:55, asi 6 h 10 min po usnutí. Šance, že tě zastihne v REM: asi 3 z 10. Je to nejlepší čas, který z tvých nocí umím odhadnout. Víc dnes nejde, protože prsten ani hodinky neposílají data během noci.“
- **Ráno:** „Budík zazněl ve 4:55. Podle Oury a Garminu jsi byl možná v REM (asi 5 z 10). Sen sis zapsal, to se počítá do tvé Osobní laboratoře.“
- **Kalibrační karta** (po ≥ 20 zápisech): „Když appka napíše ‚pravděpodobně REM‘, tvoje probuzení se snem tam padla v 7 z 10 případů.“ Jde o spolehlivostní diagram přeložený do vět.
- **Nikdy:** „REM začal ve 4:13“, „budík tě vzbudí v REM“, „tvůj sen byl v REM“. Viz `presnost_nositelne_elektroniky.md` 2.3.

---

## 7. Validace

### 7.1 Syntetická data (proběhlo [S])

**Nastavení:**
- Prototyp HSMM v Pythonu podle kapitoly 3 na minutové mřížce, γ = 0,2 na minutu, π_miss = 0,15 sdíleně, ρ podle řádku.
- Pravda se generuje jinak než model: úseky hlubokého spánku, krátká probuzení, spontánní dlouhá bdění.
- Zařízení mají sdílenou chybu „vzhledu“ ve 3min blocích, vlastní šum, 5min agregaci u Oury a 3min modus u Garminu.
- **Scénář B** přidává chybný prior (latence 70 min, cyklus 100 min, REM periody 1,3× delší) a epizodní korelované chyby: celá REMP přehlédnutá oběma zařízeními s p = 0,15, falešné REM úseky 10–20 min.
- 30 nocí na scénář.

| Metoda (scénář B) | Brier | AUROC | ECE |
|---|---|---|---|
| Surový štítek Oura | 0,134 | 0,775 | 0,134 |
| Surový štítek Garmin | 0,163 | 0,644 | 0,163 |
| Jen prior (HSMM bez dat) | 0,157 | 0,637 | 0,088 |
| HSMM + Oura | 0,079 | 0,927 | 0,024 |
| HSMM + Garmin | 0,097 | 0,898 | 0,040 |
| HSMM + obě, ρ = 0 (naivně) | 0,081 | 0,928 | 0,042 |
| HSMM + obě, ρ = 0,5 | **0,078** | **0,929** | **0,027** |
| HSMM + obě, ρ = 0,8 | 0,082 | 0,924 | 0,033 |

**Další výsledky:**
- **Marginální log-věrohodnost** přes 30 nocí: ρ = 0: −4800; ρ = 0,5: −4632; ρ = 0,8: −4812. Maximum je u skutečné vazby.
- **Začátky REM period** (porovnané pravidly 2.6):
  - surová Oura 0,97 falešného začátku za noc, HSMM 0,23,
  - medián chyby shodných začátků 2–3 min,
  - minuto 20–24 % (hlavně krátké první REMP).
- **Scénář A** (správný prior, jen krátké chyby): Brier Oura 0,103 → HSMM (obě, ρ = 0,5) 0,053, ECE 0,103 → 0,017.
- **Výkon:** 0,6 s na noc v neoptimalizovaném Pythonu.

**Limity:** chyby zařízení jsou simulované podle předpokladů z kapitoly 3. Skutečné chyby mohou být delší a závislé na fyziologii. Čísla ukazují, že model funguje správně a které komponenty pomáhají. Neukazují, jak přesný bude na skutečných datech.

**Další syntetické testy:**
1. Pravda z jiného generátoru: Markovův řetězec podle Kemp & Kamphuisen 1986 a varianta s periodickou mřížkou (α = 0).
2. Chybně zadané parametry zařízení (±0,15 u s a f) a ρ (0 vs 0,6): citlivost Brier/ECE.
3. Záznamy snů simulovat z pravdy:
   - probuzení na konci REMP s vybavením 0,82, z NREM 0,43,
   - časový šum podle `timeSource`.
   Kontrolovat, že kalibrace Λ (4.3) najde zadané hodnoty.
4. Noci s WBTB, chybějícím zařízením a přerušeným záznamem.

### 7.2 Polosyntetika a veřejná data

| Datová sada | Co obsahuje | K čemu |
|---|---|---|
| Sleep-EDF Expanded (PhysioNet; Kemp 2000) | PSG hypnogramy, kohorta SC má 2 noci na osobu | Populační prior cyklů (SleepCycles na 30s hypnogramech), rozptyl mezi nocemi, test osobního prioru noc 1 → noc 2 |
| MESA Sleep (NSRR; Chen 2015; Zhang 2018) | PSG + souběžná aktigrafie zápěstí, přibližně 2 000 účastníků | Populační normy podle věku, druhé „zařízení“ (aktigrafie), zobecnění (Walch 2019 na MESA testoval) |
| Walch 2019 (PhysioNet `sleep-accel`) | Apple Watch zrychlení + tep z PPG, PSG štítky, 31 osob | Klasifikátor tepu a pohybu jako „zařízení podobné Ouře/Garminu“; test spojení s reálnými autokorelovanými chybami |
| DREAMT (PhysioNet v2.2.0, omezený přístup; Wang 2024) | Empatica E4 (BVP, EDA, teplota, zrychlení) + PSG, 100 pacientů spánkové poradny | Druhé zařízení s jinými senzory, populace s apnoe (robustnost), výpočet ρ mezi dvěma klasifikátory |
| MNC, BOAS (použité v Akhavan 2026) | PSG z více kohort | Statistika REM period po decilech noci, sekvenční cykly |

**Polosyntetický protokol:**
1. Pravda = skutečný PSG hypnogram (Sleep-EDF, MESA).
2. Zařízení:
   - (a) simulátor s chybovými režimy (minutový šum, přehlédnutá REMP, falešný REM, zpoždění prvního REM) kalibrovaný na `presnost_nositelne_elektroniky.md` 1.4,
   - (b) skutečné klasifikátory natrénované na Walch/MESA/DREAMT.
3. Výstup zařízení agregovat na 5 min jako Oura.
4. Zápisy snů simulovat z pravdy (7.1, bod 3).

### 7.3 Metriky

- **Po epochách** (q_t a r_t vs PSG):
  - Brierovo skóre a skill vůči nejlepšímu surovému štítku a vůči prioru,
  - log-skóre,
  - AUROC a AUPRC (REM je asi 20 %),
  - spolehlivostní diagram a ECE (10 košů).
- **Po REM periodách:**
  - párování REMP s IoU ≥ 0,3,
  - F1 period,
  - absolutní chyba začátku a konce (medián, podíl do 10 min),
  - pokrytí 80% intervalů (cíl 0,75–0,85),
  - chyba počtu cyklů,
  - chyba latence REM.
- **Po rozhodnutích** (offline vyhodnocení politiky na datech s více nocemi):
  - P(REMP při budíku) pro t* vs pevných 5 h,
  - přesnost podnětů TLR (podíl podnětů v PSG REM) vs „vše po 6 h“,
  - počet podnětů v hlubokém spánku.
- **Po nocích:** chyba REM minut (jen jako kontrola, v UI se neukazuje přesně).

### 7.4 Ablace

| Varianta | Co se odstraní | Otázka |
|---|---|---|
| A0 | Model, jen surové štítky + pravidla 2.6 | Kolik dává pravděpodobnostní vrstva |
| A1 | HSMM → dvoustavový HMM (úroveň A) | Kolik dává explicitní délka a struktura cyklu |
| A2 | Bez osobního prioru (jen populace) | Hodnota učení, po 1, 5, 14, 28 nocích |
| A3 | ρ = 0 vs odhad | Cena naivního spojení (překalibrování) |
| A4 | γ = 1 | Cena ignorované autokorelace |
| A5 | Bez π_miss | Robustnost k přehlédnutým periodám |
| A6 | Bez zápisů snů / přesné rozšíření vs log-pool | Hodnota zápisů a aproximace |
| A7 | Jen Oura, jen Garmin, obě | Hodnota druhého zařízení |
| A8 | Oura 5 min vs 30 s | Hodnota jemnějšího rozlišení |
| A9 | β ∈ {0,5; 1} | Dvojí započtení času v noci |
| A10 | Mřížka cyklů (α = 0,5) vs obnova | Má smysl rozšíření ze Schulz 1980? |

### 7.5 N-of-1 u uživatele

1. **Zápisy vynechané jeden po druhém:**
   - Pro každý zápis r spočítej p_r z dat bez něj a základní míru b_r = průměr q_t v okně ±2 h kolem T_r.
   - Statistiky:
     - průměr log(p_r / b_r),
     - podíl zápisů s p_r > b_r,
     - beta-binomický „zásah“ h = podíl zápisů, kde p_r > 0,5, s priorem Beta(1, 1).
   - Příklad výpočtu [S]: 12 zásahů z 20 dává P(h > 0,3) = 0,997 a 95% interval 0,38–0,78. 9 z 20 dává 0,93.
   - **Očekávání:** zápisy se snem mají vyšší p_r než zápisy „bez snu“ (`presnost_nositelne_elektroniky.md` 3.9). Opak signalizuje chybu dat (posun hodin, špatná časová zóna) nebo modelu.
2. **Kalibrace na vlastních datech:** spolehlivostní diagram q_t v čase probuzení vs y_r (sen / bez snu). Po přepočtu přes ρ_R a ρ_N jde o nepřímou kalibraci.
3. **Mikrorandomizovaný budík (Osobní laboratoř):**
   - Na povolených nocích losovat t* nebo pevných 5 h. Výsledek: vybavení snu při budíku a jeho kvalita.
   - Beta-binomický model a rozdíl ramen [S]:

     | Nocí na rameno | Skutečně | Medián P(t* lepší) | P(posterior > 0,95) |
     |---|---|---|---|
     | 8 | 0,60 vs 0,40 | 0,82 | 0,17 |
     | 12 | 0,60 vs 0,40 | 0,80 | 0,21 |
     | 24 | 0,60 vs 0,40 | 0,92 | 0,42 |
     | 24 | 0,80 vs 0,45 | 0,99 | 0,83 |

   - Při rozdílu, který model skutečně předpovídá (≈ 2 p. b.), se nic neprokáže. To je správně a appka to má říct („zatím nevíme“).
4. **Kontrola driftu:** posun mediánu latence REM nebo délky cyklu o > 2 SD za 14 dní ukáž jako změnu („Poslední dva týdny první REM přichází později. Mohla se změnit verze algoritmu, léky, alkohol nebo režim.“). Nediagnostikovat.

### 7.6 Kritéria pro nasazení úrovně B

Na polosyntetice a na Walch/DREAMT/MESA (držené stranou):
1. ECE ≤ 0,05.
2. Brier skill ≥ 0,25 vůči nejlepšímu surovému štítku.
3. Pokrytí 80% intervalů začátku REMP 0,75–0,85.
4. Medián chyby začátku REMP (k ≥ 2) ≤ 10 min.
5. Falešné REMP < 0,5 za noc.
6. Žádné zhoršení proti úrovni A v žádné ablaci.

U prvních 20 uživatelů: medián log(p_r / b_r) > 0 po 30 dnech.

---

## 8. Pseudokód (Dart) a výpočetní náročnost

```dart
import 'dart:math';
import 'dart:typed_data';

const int W = 0, N = 1, R = 2;
const double NEG = double.negativeInfinity;
enum SegType { w0, n, r, w }

class Seg { final SegType type; final int k; const Seg(this.type, this.k); }

double lse(double a, double b) {
  if (a == NEG) return b;
  if (b == NEG) return a;
  final m = max(a, b);
  return m + log(exp(a - m) + exp(b - m));
}

class Params {
  // matice záměn [z][o] pro W, N, R (kap. 3.3)
  List<List<double>> cO = [[.60,.30,.10],[.05,.85,.10],[.03,.27,.70]];
  List<List<double>> cG = [[.50,.35,.15],[.05,.80,.15],[.04,.46,.50]];
  double rho = 0.4, gammaPerEpoch = 0.5, betaPrior = 0.5;
  List<double> piMissO = [0.25, 0.10], piMissG = [0.50, 0.25]; // [R1, R2+]
}

/// Sdružená emise P(o_t | z) se zachovanými marginálami (kap. 3.3).
double jointLik(Float64List? fO, Float64List? fG, List<double> a, List<double> b, double rho) {
  if (fO == null && fG == null) return 1.0;
  if (fG == null) return fO![0]*a[0] + fO[1]*a[1] + fO[2]*a[2];
  if (fO == null) return fG[0]*b[0] + fG[1]*b[1] + fG[2]*b[2];
  final m = [min(a[0], b[0]), min(a[1], b[1]), min(a[2], b[2])];
  final mm = m[0] + m[1] + m[2];
  var s = 0.0;
  for (var i = 0; i < 3; i++) {
    for (var k = 0; k < 3; k++) {
      final jMax = (i == k ? m[i] : 0.0) + (mm < 1 ? (a[i]-m[i])*(b[k]-m[k])/(1-mm) : 0.0);
      s += fO[i] * fG[k] * ((1 - rho) * a[i] * b[k] + rho * jMax);
    }
  }
  return s;
}

class Hsmm {
  final List<Seg> segs; final int T;
  final List<Float64List> logP;      // [j][d-1], už × beta a normováno
  final List<Float64List> logS;      // přežití [j][d-1]
  final List<int> dMin, dMax;
  final List<List<(int, double)>> pred, succ; // (index, log a_ij)
  // prefixové součty log emisí: [mode 0..3][typ segmentu][t]
  late List<List<Float64List>> cum;
  late List<Float64List> logModeW;       // [k 0/1][mode] váhy režimů přehlédnutí
  late List<Float64List> a, st, be, bs;
  late double logZ;
  Hsmm(this.segs, this.T, this.logP, this.logS, this.dMin, this.dMax, this.pred, this.succ);

  double segE(int j, int s, int e) {         // log emise segmentu j na [s, e], 1-indexováno
    final ty = segs[j].type.index;
    if (segs[j].type != SegType.r) return cum[0][ty][e] - cum[0][ty][s - 1];
    final kk = segs[j].k == 1 ? 0 : 1;
    var acc = NEG;
    for (var mode = 0; mode < 4; mode++) {
      acc = lse(acc, logModeW[kk][mode] + cum[mode][ty][e] - cum[mode][ty][s - 1]);
    }
    return acc;
  }

  void forward() {
    final J = segs.length;
    a  = List.generate(J, (_) => Float64List(T + 1)..fillRange(0, T + 1, NEG));
    st = List.generate(J, (_) => Float64List(T + 2)..fillRange(0, T + 2, NEG));
    st[0][1] = 0.0;
    for (var t = 1; t <= T; t++) {
      for (var j = 1; j < J; j++) {
        var acc = NEG;
        for (final (i, la) in pred[j]) { acc = lse(acc, a[i][t - 1] + la); }
        st[j][t] = acc;
      }
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        final dHi = min(t, dMax[j]);
        for (var d = dMin[j]; d <= dHi; d++) {
          final s = t - d + 1;
          if (st[j][s] == NEG) continue;
          acc = lse(acc, st[j][s] + logP[j][d - 1] + segE(j, s, t));
        }
        a[j][t] = acc;
      }
    }
    logZ = NEG;
    for (var j = 0; j < J; j++) {
      for (var s = max(1, T - dMax[j] + 1); s <= T; s++) {
        if (st[j][s] == NEG) continue;
        logZ = lse(logZ, st[j][s] + logS[j][T - s] + segE(j, s, T));
      }
    }
  }

  void backward() {
    final J = segs.length;
    be = List.generate(J, (_) => Float64List(T + 1)..fillRange(0, T + 1, NEG));
    bs = List.generate(J, (_) => Float64List(T + 2)..fillRange(0, T + 2, NEG));
    for (var t = T; t >= 1; t--) {
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        final eHi = min(T, t + dMax[j] - 1);
        for (var e = t + dMin[j] - 1; e <= eHi; e++) {
          if (be[j][e] == NEG) continue;               // konec přesně v T pokrývá přežití níže
          acc = lse(acc, logP[j][e - t] + segE(j, t, e) + be[j][e]);
        }
        final dc = T - t + 1;                          // cenzurovaný běh do konce
        if (dc <= dMax[j]) acc = lse(acc, logS[j][dc - 1] + segE(j, t, T));
        bs[j][t] = acc;
      }
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        for (final (k, la) in succ[j]) { acc = lse(acc, la + bs[k][t]); }
        be[j][t - 1] = acc;
      }
    }
  }

  /// q_t = P(REMP v t) a začátky REMP; rozdílové pole přes páry (s, e).
  (Float64List, List<Float64List>) posteriorRem() {
    final q = Float64List(T + 2);
    final onsets = <Float64List>[];
    for (var j = 0; j < segs.length; j++) {
      if (segs[j].type != SegType.r) continue;
      final on = Float64List(T + 1);
      for (var s = 1; s <= T; s++) {
        if (st[j][s] == NEG) continue;
        final eHi = min(T, s + dMax[j] - 1);
        for (var e = s + dMin[j] - 1; e <= eHi; e++) {
          final p = exp(st[j][s] + logP[j][e - s] + segE(j, s, e) + be[j][e] - logZ);
          on[s] += p; q[s] += p; q[e + 1] -= p;
        }
        final dc = T - s + 1;
        if (dc <= dMax[j]) {
          final p = exp(st[j][s] + logS[j][dc - 1] + segE(j, s, T) - logZ);
          on[s] += p; q[s] += p; q[T + 1] -= p;
        }
      }
      onsets.add(on);
    }
    for (var t = 1; t <= T; t++) { q[t] += q[t - 1]; }
    return (q, onsets);
  }
}

/// Osobní parametr: model místní úrovně (kap. 3.5).
class LocalLevel {
  final double muPop, sigmaW, q; double b = 0, P;
  LocalLevel(this.muPop, double tau, this.sigmaW, this.q) : P = tau * tau;
  void update(double y, double v) {
    final pm = P + q; var rn = sigmaW * sigmaW + v;
    final innov = y - muPop - b;
    if (innov * innov > 9 * (pm + rn)) rn *= 4;      // odlehlá noc
    final k = pm / (pm + rn);
    b += k * innov; P = (1 - k) * pm;
  }
  double get mean => muPop + b;
  double get sd => sqrt(sigmaW * sigmaW + P);
}

/// Budík WBTB z prior predictive (kap. 4.4). Vrací minuty po usnutí, nebo null.
int? planWbtb(bool gateOpen, List<List<(int, int)>> Function(Random, int) sampleNights, Random rng) {
  if (!gateOpen) return null;
  const lo = 270, hi = 390, m = 2000;
  final hits = Float64List(hi - lo);
  for (final night in sampleNights(rng, m)) {        // night = REM periody (start, end) v min od usnutí
    for (final (s, e) in night) {
      for (var t = max(s + 5, lo); t < min(e, hi); t++) { hits[t - lo] += 1; }
    }
  }
  var best = lo; var bestU = NEG;
  for (var t = lo; t < hi; t++) {
    final u = hits[t - lo] / m - 0.0003 * (t - 300).abs();   // κ z kap. 4.4
    if (u > bestU) { bestU = u; best = t; }
  }
  return best;
}
```

**Doplnit podle textu:**
- výpočet `cum` (kap. 3.3: μ_j, `jointLik` pro 4 režimy přehlédnutí, umocnění γ, prefixové součty),
- rozšíření o příznak záznamu (kap. 4.2),
- FFBS (kap. 3.4).

**Implementační poznámky:**
- Běh v `Isolate.run` po synchronizaci nebo při otevření záložky Spánek. Výsledek noci uložit (q_t po epochách, REMP souhrny, verze parametrů a algoritmů zařízení).
- Prořezávání: segment N_k/R_k nemůže začít dřív než (k − 1) · 40 min po začátku záznamu. Délky s p_j(d) < 1e-6 vynechat.
- Místo logaritmů lze počítat v pravděpodobnostech se škálováním po epochách (2–4× rychlejší).
- Testy:
  - Σ_j occ_j(t) = 1 pro každé t,
  - Σ_s on_k(s) ≤ 1,
  - log Z z dopředného i zpětného průchodu se shoduje na 1e-8,
  - prior predictive dává 21 ± 2 % REM.

**Výpočetní náročnost** (T epoch, J ≈ 25 segmentů, D̄ průměrná šířka podpory délek):

| Konfigurace | T | Operace na průchod (≈ T·J·D̄) | Celkem (dopředu, dozadu, posterior, 4 režimy R, 1 záznam ×2) | Odhad na telefonu (Dart AOT) |
|---|---|---|---|---|
| 5 min, 10 h | 120 | 120 · 25 · 30 ≈ 90 tis. | ≈ 1 mil. logsumexp | < 30 ms |
| 1 min, 10 h | 600 | 600 · 25 · 150 ≈ 2,3 mil. | ≈ 20 mil. | 0,2–0,5 s |
| FFBS 200 vzorků | | 200 · T · D̄ | 0,7–20 mil. | < 0,3 s |
| Plánování (2000 nocí) | | 2000 · ~12 segmentů | ≈ 25 tis. vzorků | < 20 ms |
| „Proč to tak vychází“ (4 běhy navíc) | | | 4× konfigurace | na vyžádání |

- **Paměť:** 4 pole J × T doubles + prefixové součty ≈ 0,1 MB (5 min) až 1 MB (1 min).
- **Baterie:** zanedbatelná, jeden běh denně.
- **Referenční prototyp** v Pythonu (minutová mřížka, smyčky v Pythonu) běžel 0,6 s na noc [S].

---

## 9. Rizika a otevřené otázky

1. **Parametry zařízení jsou nejistější než model.** Oura Gen4/Ring 5 a současné Garminy nemají PSG validaci fází (`presnost_nositelne_elektroniky.md` 4). Celý výstup je podmíněný maticemi záměn. Citlivostní analýza a štítek „NEJISTÉ“ jsou povinné.
2. **Časování jednotlivých REM period nikdo nevalidoval.** Kritéria 7.6 se proto musí ověřit na polosyntetice, ne na studiích zařízení.
3. **Dvojí započtení času v noci** (β) a autokorelace (γ) se navzájem částečně zastupují. Ladit je společně na ECE, ne odděleně.
4. **ρ a Λ** jsou bez referenční noci identifikovatelné jen díky priorům a rozptylu situací. Tlačítko „bez snu“ a budíky v různých časech jsou pro učení klíčové.
5. **Populační prior neplatí:**
   - u lidí na antidepresivech (delší cykly, potlačený REM; Rosenblum 2025),
   - při práci na směny,
   - při narkolepsii (REM hned po usnutí),
   - při neléčené apnoe.
   Štítky noci a široké priory pomohou, ale appka nemá nic diagnostikovat. „REM hned po usnutí“ z náramku je spíš chyba zařízení.
6. **Změny algoritmů zařízení** mohou posunout výstup bez ohlášení. Logovat verze a po změně zvětšit nejistotu.
7. **Budík do REM bez živých dat:** model ukazuje, že zisk je malý (4.4). `inovace.md` TOP 1 proto mluví o budíku „v nejpravděpodobnější části noci“, ne „když nejspíš sníš“ (upraveno při QA 23. 10. 2026).
8. **Otevřené:**
   - Vyplatí se mřížka cyklů (Schulz 1980)?
   - Pomáhá hluboký spánek ze zařízení k určení fáze cyklu?
   - Jak velké je ρ pro konkrétní pár Oura + Garmin?
   - Liší se chyby zařízení po WBTB a při MILD vleže (nehybné bdění)?

---

## 10. Zdroje

**Cykly, latence a rozložení REM**
- Feinberg I, Floyd TC (1979). Systematic trends across the night in human sleep cycles. *Psychophysiology* 16(3):283–291. doi:10.1111/j.1469-8986.1979.tb02991.x
- Blume C, Cajochen C (2021). 'SleepCycles' package for R: a free software tool for the detection of sleep cycles from sleep staging. *MethodsX* 8:101318. doi:10.1016/j.mex.2021.101318 (PMC8374325). Balík SleepCycles 1.1.4, CRAN, https://cran.r-project.org/package=SleepCycles
- Jenni OG, Carskadon MA (2004). Spectral analysis of the sleep electroencephalogram during adolescence. *Sleep* 27(4):774–783. doi:10.1093/sleep/27.4.774
- Kurth S a kol. (2010). Mapping of cortical activity in the first two decades of life: a high-density sleep EEG study. *J Neurosci* 30(40):13211–13219. doi:10.1523/JNEUROSCI.2532-10.2010
- Rudzik F a kol. (2020). Ultradian modulation of cortical arousals during sleep: effects of age and exposure to nighttime transportation noise. *Sleep* 43(7):zsz324. doi:10.1093/sleep/zsz324
- Aeschbach D, Borbély AA (1993). All-night dynamics of the human sleep EEG. *J Sleep Res* 2(2):70–81. doi:10.1111/j.1365-2869.1993.tb00065.x
- Merica H, Gaillard JM (1986). Internal structure of sleep cycles in a healthy population. *Sleep* 9(4):502–513. doi:10.1093/sleep/9.4.502
- Schulz H, Dirlich G, Balteskonis S, Zulley J (1980). The REM-NREM sleep cycle: renewal process or periodically driven process? *Sleep* 2(3):319–328. doi:10.1093/sleep/2.3.319
- Kishi A a kol. (2011). NREM sleep stage transitions control ultradian REM sleep rhythm. *Sleep* 34(10):1423–1432. doi:10.5665/sleep.1292
- Kishi A, Van Dongen HPA (2023). Phenotypic interindividual differences in the dynamic structure of sleep in healthy young adults. *Nat Sci Sleep* 15:465–476. doi:10.2147/NSS.S392038
- Le Bon O (2020). Relationships between REM and NREM in the NREM-REM sleep cycle: a review on competing concepts. *Sleep Med* 70:6–16. doi:10.1016/j.sleep.2020.02.004
- Rosenblum Y a kol. (2025). Fractal cycles of sleep, a new aperiodic activity-based definition of sleep cycles. *eLife* 13:RP96784. doi:10.7554/eLife.96784
- Akhavan N a kol. (2026). A data-driven measure of REM sleep propensity for human and rodent sleep. *Front Neurosci* 20:1844209. doi:10.3389/fnins.2026.1844209
- Ohayon MM, Carskadon MA, Guilleminault C, Vitiello MV (2004). Meta-analysis of quantitative sleep parameters from childhood to old age in healthy individuals. *Sleep* 27(7):1255–1273. doi:10.1093/sleep/27.7.1255
- Boulos MI a kol. (2019). Normal polysomnography parameters in healthy adults: a systematic review and meta-analysis. *Lancet Respir Med* 7(6):533–543. doi:10.1016/S2213-2600(19)30057-8. Tabulky 2 a 3: https://omc.ohri.ca/psgnorms
- Czeisler CA a kol. (1980). Human sleep: its duration and organization depend on its circadian phase. *Science* 210:1264–1267. doi:10.1126/science.7434029
- Dijk DJ, Czeisler CA (1995). Contribution of the circadian pacemaker and the sleep homeostat to sleep propensity, sleep structure, electroencephalographic slow waves, and sleep spindle activity in humans. *J Neurosci* 15(5):3526–3538. doi:10.1523/JNEUROSCI.15-05-03526.1995
- Barbato G, Barker C, Bender C, Wehr TA (2002). Spontaneous sleep interruptions during extended nights. *Clin Neurophysiol* 113(6):892–900. doi:10.1016/S1388-2457(02)00081-0
- Ebrahim IO, Shapiro CM, Williams AJ, Fenwick PB (2013). Alcohol and sleep I: effects on normal sleep. *Alcohol Clin Exp Res* 37(4):539–549. doi:10.1111/acer.12006

**Sny, vybavení, lucidita**
- Nielsen TA (2000). A review of mentation in REM and NREM sleep: "covert" REM sleep as a possible reconciliation of two opposing models. *Behav Brain Sci* 23(6):851–866. doi:10.1017/S0140525X0000399X
- Stucky B (2025). We are the sensors of consciousness! A review and analysis on how awakenings during sleep influence dream recall. *Nat Sci Sleep* 17:709–729. doi:10.2147/NSS.S506461
- Dement W, Kleitman N (1957). The relation of eye movements during sleep to dream activity: an objective method for the study of dreaming. *J Exp Psychol* 53(5):339–346. doi:10.1037/h0048189
- LaBerge SP, Nagel LE, Dement WC, Zarcone VP (1981). Lucid dreaming verified by volitional communication during REM sleep. *Percept Mot Skills* 52(3):727–732. doi:10.2466/pms.1981.52.3.727
- Baird B, Mota-Rolim SA, Dresler M (2019). The cognitive neuroscience of lucid dreaming. *Neurosci Biobehav Rev* 100:305–323. doi:10.1016/j.neubiorev.2019.03.008
- Stumbrys T, Erlacher D (2012). Lucid dreaming during NREM sleep: two case reports. *Int J Dream Res* 5(2):151–155.
- Erlacher D, Stumbrys T (2020). Wake up, work on dreams, back to bed and lucid dream: a sleep laboratory study. *Front Psychol* 11:1383. doi:10.3389/fpsyg.2020.01383
- Erlacher D, Furrer V, Ineichen M, Braillard J, Schmid D (2022). Combining wake-up-back-to-bed with cognitive induction techniques: does earlier sleep interruption reduce lucid dream induction rate? *Clocks Sleep* 4(2):230–239. doi:10.3390/clockssleep4020021
- Konkoly KR a kol. (2024). Provoking lucid dreams at home with sensory cues paired with pre-sleep cognitive training. *Conscious Cogn* 125:103759. doi:10.1016/j.concog.2024.103759

**Modely, spojování zdrojů, hodnocení**
- Rabiner LR (1989). A tutorial on hidden Markov models and selected applications in speech recognition. *Proc IEEE* 77(2):257–286. doi:10.1109/5.18626
- Yu SZ (2010). Hidden semi-Markov models. *Artif Intell* 174(2):215–243. doi:10.1016/j.artint.2009.11.011
- Pan ST, Kuo CE, Zeng JH, Liang SF (2012). A transition-constrained discrete hidden Markov model for automatic sleep staging. *Biomed Eng Online* 11:52. doi:10.1186/1475-925X-11-52
- Kemp B, Kamphuisen HAC (1986). Simulation of human hypnograms using a Markov chain model. *Sleep* 9(3):405–414. doi:10.1093/sleep/9.3.405
- Lo CC a kol. (2004). Common scale-invariant patterns of sleep–wake transitions across mammalian species. *PNAS* 101(50):17545–17548. doi:10.1073/pnas.0408242101
- Bianchi MT a kol. (2010). Obstructive sleep apnea alters sleep stage transition dynamics. *PLoS One* 5(6):e11356. doi:10.1371/journal.pone.0011356
- Stephansen JB a kol. (2018). Neural network analysis of sleep stages enables efficient diagnosis of narcolepsy. *Nat Commun* 9:5229. doi:10.1038/s41467-018-07229-3
- Dawid AP, Skene AM (1979). Maximum likelihood estimation of observer error-rates using the EM algorithm. *Appl Stat* 28(1):20–28. doi:10.2307/2346806
- Kim HC, Ghahramani Z (2012). Bayesian classifier combination. *AISTATS*, PMLR 22:619–627. https://proceedings.mlr.press/v22/kim12.html
- Holmes CC, Walker SG (2017). Assigning a value to a power likelihood in a general Bayesian model. *Biometrika* 104(2):497–503. doi:10.1093/biomet/asx010
- Gneiting T, Raftery AE (2007). Strictly proper scoring rules, prediction, and estimation. *J Am Stat Assoc* 102:359–378. doi:10.1198/016214506000001437
- Budescu DV, Por HH, Broomell SB, Smithson M (2014). The interpretation of IPCC probabilistic statements around the world. *Nat Clim Change* 4:508–512. doi:10.1038/nclimate2194
- Mastrandrea MD a kol. (2011). The IPCC AR5 guidance note on consistent treatment of uncertainties. *Climatic Change* 108:675–691. doi:10.1007/s10584-011-0178-6

**Nositelná elektronika a datové sady**
- Walch O, Huang Y, Forger D, Goldstein C (2019). Sleep stage prediction with raw acceleration and photoplethysmography heart rate data derived from a consumer wearable device. *Sleep* 42(12):zsz180. doi:10.1093/sleep/zsz180. Data: PhysioNet, doi:10.13026/hmhs-py35
- Wang K a kol. (2024). Addressing wearable sleep tracking inequity: a new dataset and novel methods for a population with sleep disorders. *CHIL 2024*, PMLR 248:380–396. Data DREAMT v2.2.0: PhysioNet, doi:10.13026/3f7y-2d80
- Chen X a kol. (2015). Racial/ethnic differences in sleep disturbances: the Multi-Ethnic Study of Atherosclerosis (MESA). *Sleep* 38(6):877–888. doi:10.5665/sleep.4732
- Zhang GQ a kol. (2018). The National Sleep Research Resource: towards a sleep data commons. *J Am Med Inform Assoc* 25(10):1351–1358. doi:10.1093/jamia/ocy064
- Kemp B a kol. (2000). Analysis of a sleep-dependent neuronal feedback loop: the slow-wave microcontinuity of the EEG. *IEEE Trans Biomed Eng* 47(9):1185–1194. doi:10.1109/10.867928 (Sleep-EDF)
- Altini M, Kinnunen H (2021). The promise of sleep: a multi-sensor approach for accurate sleep stage detection using the Oura ring. *Sensors* 21(13):4302. doi:10.3390/s21134302
- Studie přesnosti Oura a Garmin (Robbins 2024, Lee 2023, Schyvens 2025, Mouritzen 2020, Chinoy 2021 a další): viz `presnost_nositelne_elektroniky.md`, kapitola 5
- Oura API v2, OpenAPI specifikace 1.42 (schéma `PublicModifiedSleepModel`, `PublicSleepType`, `PublicSleepAlgorithmVersion`). https://cloud.ouraring.com/v2/docs
- Android Developers: `SleepSessionRecord` (Health Connect), konstanty `STAGE_TYPE_*`. https://developer.android.com/reference/kotlin/androidx/health/connect/client/records/SleepSessionRecord
- Notebookcheck (2025): Garmin officially reveals Google Health Connect support for wearables (spánkové fáze mezi zapisovanými typy). https://www.notebookcheck.net/Garmin-officially-reveals-Google-Health-Connect-support-for-wearables.1054577.0.html

**Interní podklady**
- *Lucidní snění, metody a aplikace 2* (ověřená zpráva): technická proveditelnost, parametry WBTB a TLR.
- `presnost_nositelne_elektroniky.md` (23. 10. 2026): parametry zařízení, slovník, vizuální specifikace, binární model ρ.
- `inovace.md` (23. 10. 2026): REM profil, Chytré probuzení do snu, Zvukový klíč, Osobní laboratoř, rozpočet probuzení.
