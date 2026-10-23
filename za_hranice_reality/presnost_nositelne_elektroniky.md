# Přesnost nositelné elektroniky pro REM: Oura a Garmin vs. polysomnografie

Stav k 23. 10. 2026. Podklad pro záložku Spánek a funkci „odhad výskytu REM“ v appce Za hranice reality.

**Metodika.** Plné texty jsem četl z Europe PMC (PMC je za captchou), preprint Topalidis z Research Square, firemní stránky Oura a Garmin přímo. ScienceDirect byl blokovaný, takže u Svensson 2024 mám jen abstrakt. U Ong 2024 také jen abstrakt. Hodnoty označené **odv.** jsem dopočítal z publikovaných matic chyb a z rozložení fází v dané studii. Metodu jsem ověřil na Robbins 2024: odvozená PPV 0,788 proti publikované 0,791. **Inference** značí můj úsudek, ne údaj ze studie.

**Pojmy.**
- **Senzitivita REM**: podíl epoch, které PSG označí jako REM a zařízení také.
- **Specificita REM**: podíl epoch, které nejsou REM a zařízení je jako REM neoznačí.
- **PPV (přesnost)**: podíl „REM“ označení zařízení, která jsou podle PSG opravdu REM. Pro appku je to nejdůležitější číslo.
- **κ 4f / 2f**: Cohenovo kappa pro čtyři fáze (bdění, lehký, hluboký, REM) a pro spánek/bdění.
- **LoA**: 95% meze shody Bland–Altman pro minuty REM za noc.
- **Latence REM**: čas od usnutí do prvního REM.

---

## 0. Hlavní zjištění

1. **Oura Gen3 (algoritmus OSSA 2.0, nasazený v roce 2023).**
   - REM senzitivita 0,55–0,76, specificita přibližně 0,82–0,95, PPV 0,36–0,79, κ 4f 0,35–0,65.
   - Nejlepší čísla pocházejí ze studie, kterou Oura financovala: Robbins 2024 (senzitivita 0,76, PPV 0,79, κ 0,65).
   - Klinický a nezávislý vzorek dává méně. Lee 2023: κ 0,35. Herberger 2025: senzitivita 0,55, PPV odv. 0,36.
2. **Oura Ring 4 (2024) a Ring 5 (2026).**
   - Nenašel jsem žádnou recenzovanou PSG validaci určování fází.
   - Oura v srpnu 2026 sama uvádí, že nejnovější algoritmus fází je z roku 2023, a cituje jen studie Gen2 a Gen3.
   - Gen4 má lepší vstupní signál: HRV vs EKG CCC 0,99 (Dial 2025).
   - **Inference:** horší určování fází než u Gen3 nečekám, ale ověřené to není.
3. **Garmin.**
   - V nezávislých studiích má REM senzitivitu 0,33–0,54:
     - Vivosmart 4: 0,33–0,34
     - Vivosmart 3: 0,50
     - Fenix 5S: 0,54
     - Forerunner 245: 0,50
     - Venu 3 / Vivoactive 5–6: 0,49
   - PPV 0,39–0,51, κ 4f 0,20–0,41.
   - Výrobce uvádí 0,70 a κ 0,54. Jde o Vivosmart 3 v roce 2019 a o křížovou validaci na vlastních vývojových datech.
   - Pro Index Sleep Monitor jsem validaci nenašel.
4. **Prakticky:**
   - Když Garmin hlásí REM, je to REM asi ve **40–50 %** případů (odv.).
   - U Oury Gen3 je to **50–80 %**.
   - REM do „lehkého spánku“ chybně řadí obě zařízení. Garmin navíc často označí jako REM bdění a lehký spánek.
5. **REM minuty za jednu noc jsou nespolehlivé.**
   - 95% LoA: Oura zhruba ±60–100 min, Garmin ±65–150 min.
   - ICC/CCC pro REM za noc: 0,06–0,37.
   - Smysl mají jen průměry za týden a delší trendy (inference).
6. **Časová shoda.**
   - Žádná studie nehodnotí začátek a konec jednotlivých REM období.
   - Nepřímé údaje:
     - První REM zařízení často přehlédnou. Latence REM u Garminu +16 až +30 min, u Oury Gen3 ≈ −9,5 min (Lee 2023).
     - Posun celého hypnogramu o ±20 min shodu nezlepšil (Mouritzen 2020). Chyby jsou tedy lokální, hlavně na okrajích period, ne konstantní posun.
     - Hypnogram Oury v appce i v API má rozlišení **5 min**.
7. **Algoritmy počítají až po noci.**
   - Oura normalizuje znaky přes celou noc, používá klouzavá okna „minulost i budoucnost“ a znaky času v noci (Altini 2021).
   - Garmin počítá část znaků přes celou noc v cloudu (Garmin 2019).
   - Důsledek: REM není k dispozici v reálném čase a výstup už v sobě má prior „REM přibývá k ránu“.
8. **Komunikace v appce.** Mluvit o **pravděpodobném REM okně**, kategoriích a rozsazích. Ne o minutách a přesných časech.
9. **Shoda Oury a Garminu** zvyšuje důvěru méně, než ukazuje prosté násobení pravděpodobností. Obě zařízení odhadují z tepu, HRV, pohybu a času v noci, takže jejich chyby jsou korelované. Navrhuji model s podmíněnou závislostí chyb (výchozí ρ = 0,3) a skrytý Markovův model po 5min epochách.
10. **Shoda dvou zařízení není důkaz přesnosti.** I dvě zařízení přesná podle literatury by se při nezávislých chybách shodovala na REM jen s κ ≈ 0,2 (výpočet v 3.5).

---

## 1. Souhrnné tabulky

### 1.1 Oura podle generace

| Studie | Zařízení / algoritmus | Vzorek, prostředí, reference | REM sens. | REM spec. | REM PPV | REM F1 | κ 4f / 2f | REM min za noc: bias (LoA) | Latence REM | Financování / COI |
|---|---|---|---|---|---|---|---|---|---|---|
| de Zambotti 2019, *Behav Sleep Med* | Gen1 | n = 41, 17,2 ± 2,4 r., laboratoř, 1 noc, PSG | 0,61 („agreement“) | n/a | n/a | n/a | n/a | +17 min (nadhodnocení) | n/a | NIH (NIAAA, NCANDA). De Zambotti je od 2025 zaměstnanec Oury. |
| Chee 2021, *Nat Sci Sleep* | Gen2, fw 1.36.3 | n = 53 adolescentů 15–19 r., laboratoř, více nocí (6,5 / 8 / 9 h v posteli), PSG | 0,51–0,53 | n/a | n/a | n/a | 0,44–0,45 / n/a | −12,8 až −19,5 min | n/a | Grant NMRC. Prsteny dodala Oura pro sběr dat pro vlastní účely firmy. |
| Altini & Kinnunen 2021, *Sensors* | Gen2M (výzkumná verze), model akcelerometr + teplota + HRV + cirkadiánní znaky (Oura ho uvádí jako základ současného algoritmu) | 106 osob, 440 nocí, 3 kontinenty, PSG; **křížová validace vývojových dat** | 0,78 | 0,94 | n/a | 0,78 (celkové F1 4f) | n/a (4f přesnost 79 %) | ≈ +2 min (LoA ≈ ±44 min při 90 min REM) | n/a | Kinnunen zaměstnanec Oury, Altini poradce Oury |
| Ghorbani 2022, *Nat Sci Sleep* | Hardware Gen2, nový algoritmus („Gen3“) | n = 58, 23–69 r., domácí PSG, 3 noci | n/a (jen v příloze) | n/a | n/a | n/a | κ pro REM 0,67–0,69 (starý algoritmus 0,49); 4f přesnost 76–78 % | +0,8 až +11,7 min (SD 23–32) | n/a | Chee a Ong mají patent na Z3Score; prohlášení zní „report other conflicts“ bez upřesnění; Oura studii propaguje jako svou validaci |
| Miller 2022, *Sensors* | Gen2 | n = 53, 25 r., laboratoř, 1 noc, 9 h v posteli, PSG | 0,52 | ≈ 0,92 (odv.) | ≈ 0,61 (odv.) | ≈ 0,56 (odv.) | 0,43 / 0,51 | −20,7 ± 35,3 min | n/a | Laboratoř dostává podporu od WHOOP |
| Chinoy 2022, *Nat Sci Sleep* | Gen2 | n = 21, doma, 7 nocí, reference EEG čelenka Dreem 2 | 0,39–0,40 | 0,92 | 0,68 | 0,50 (odv.) | n/a (REM PABAK 0,51) | 77,5 vs 132,7 min (podle Dreemu) | n/a | Office of Naval Research; bez COI |
| Kainec 2024, *Sensors* | Gen2 | n = 53 mladých dospělých, laboratoř, 1 noc, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | +5,8 min (SD 37,7); ICC 0,34 | n/a | Grant UMass; bez COI |
| **Robbins 2024**, *Sensors* | **Gen3, OSSA 2.0** | n = 35, 20–50 r., zdraví, laboratoř, 1 noc, PSG | **0,76** | ≈ 0,95 (odv.) | **0,79** | 0,77 | **0,65 / 0,60**; 4f shoda 76,3 % | −3 min; ICC 0,27 | n/a | **Financovala Oura Ring Inc.**; Robbins je v poradním sboru Oury |
| Lee 2023, *JMIR mHealth uHealth* | Oura Ring 3; verze algoritmu neuvedena (data před 7/2023, pravděpodobně před OSSA 2.0) | n = 53 (z 75), korejští pacienti s plánovanou PSG a klientela kliniky, laboratoř | 0,71 | 0,87 | ≈ 0,52 (odv. z F1) | 0,60 | **0,35** / n/a; 4f přesnost 0,54 | n/a | **≈ −9,5 min** (odečteno z obr. 5) | Autoři z firmy Asleep (konkurenční SleepRoutine) mají akcie |
| Svensson 2024, *Sleep Med* | Gen3, OSSA 2.0 | n = 96 Japonců, 20–70 r., ambulantní PSG v hotelu, až 3 noci, 421 045 epoch | n/a (v abstraktu jen „accuracy“ REM 90,6 %, binární) | n/a | n/a | n/a | n/a / PABAK 0,83–0,84 | −4,1 až −5,6 min | n/a | **Částečně financovala Oura** (blog Oura); Herberger 2025 uvádí COI |
| Ong 2024, *Sleep Health* | Gen3 | n = 60, 18–70 r., laboratoř, PSG, konsenzus 3 hodnotitelů | n/a | n/a | n/a | n/a | 0,55–0,70 / 0,64 | n/a | n/a | Neověřeno (jen abstrakt) |
| **Herberger 2025**, *Sci Rep* | Gen3 (data 8–11/2022, před OSSA 2.0); **5min epochy z API** | n = 31 pacientů spánkové laboratoře Charité, 54 r., BMI 33 | **0,55** (0,45–0,65) | ≈ 0,82 (odv.) | ≈ **0,36** (odv.) | ≈ 0,44 (odv.) | n/a / 0,43; 4f přesnost 53,2 % | **+31,6 ± 44,0 min** | n/a | Bez COI |
| Searles 2026, *Sleep Adv* | Gen3, app 2.8.41 | 12 nocí mladí (19–24 r.) + 15 nocí starší (56–80 r.), laboratoř, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | mladí −1,3 min (LoA −77,5 až +74,9); starší +22,7 min (LoA −77,0 až +122,3); CCC 0,12–0,16 | n/a | NIH; bez COI |
| Topalidis 2025/2026, preprint | Oura Ring 3, app 3.1.1, data 30 s přes Apple Health | n = 18 × 5 nocí, doma, ambulantní PSG, záměrně narušené, zkrácené a prodloužené noci | 0,73 (0,69–0,76) | n/a | n/a | n/a | 0,59 / n/a; 4f přesnost 72,8 % | 84 vs 88 min; proporcionální bias (+16 min při 40 min REM, −21 min při 130 min REM) | n/a | **COI:** autoři z NUKKUAA (konkurenční sleep²). Zarovnání metodou „best-world fit“ přes křížovou korelaci, tedy optimistické |
| Gen4 / Ring 5 | | | **Žádná PSG validace určování fází nenalezena** (Europe PMC, web, 10/2026) | | | | | | | |
| Dial 2025, *Physiol Rep* (jen vstupní signál) | Gen3 vs Gen4 | n = 13, 536 nocí, reference EKG | HRV CCC: Gen4 0,99 (MAPE 6,0 %), Gen3 0,97 (7,2 %) | | | | | | | AFRL; bez COI |

### 1.2 Garmin podle modelu

| Studie | Model / firmware | Vzorek, prostředí, reference | REM sens. | REM spec. | REM PPV | REM F1 | κ 4f / 2f | REM min za noc: bias (LoA) | Latence REM | Financování / COI |
|---|---|---|---|---|---|---|---|---|---|---|
| Garmin / KUMC 2019 (Burgett a kol., poster AAN; firemní blog) | Vivosmart 3, „Advanced Sleep Monitoring“ | n = 55 (14 s poruchou spánku nebo léky), doma, Sleep Profiler (3kanálové EEG); **5násobná křížová validace na vývojových datech** | 0,70 | ≈ 0,89 (odv.) | ≈ 0,59 (odv.) | ≈ 0,64 (odv.) | 0,54 ± 0,12 (4f) | Garmin 21,6 % vs EEG 18,3 % REM | n/a | **Výrobce** |
| Chinoy 2021, *Sleep* | Fenix 5S | 34 mladých dospělých (28 r.) × 3 noci včetně narušené, laboratoř, PSG; analyzováno 29–30 nocí | 0,54 | 0,84 | 0,51 | 0,53 (odv.) | n/a (REM PABAK 0,53) | +8,6 min (LoA −74,9 až +92,1) | **+29,8 min** (LoA −83,3 až +142,9) | Office of Naval Research; bez COI |
| Chinoy 2021 | Vivosmart 3 | totéž, 43–44 nocí | 0,50 | 0,82 | 0,46 | 0,48 (odv.) | n/a (PABAK 0,48) | +8,4 min (LoA −75,9 až +92,6) | **+24,5 min** (LoA −94,8 až +143,7) | totéž |
| Mouritzen 2020, *PLoS One* | Vivosmart 4 | n = 18, 56 ± 12 r., 72 % žen, domácí PSG (typ II) | 0,34 ± 0,26 | 0,88 ± 0,08 | 0,42 (z matice) | 0,37 | **0,20 / 0,33** | −22,1 ± 54,7 min; ICC 0,14 | **+16,1 ± 40,3 min** (n = 14; u 3 osob Garmin REM vůbec nenašel) | Hodinky zapůjčil Garmin |
| Kainec 2024, *Sensors* | Vivosmart 4 | n = 53, laboratoř, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | **+39,2 min (SD 82,3)**; ICC 0,06 | n/a | Bez COI |
| Schyvens 2025, *Sleep Adv* | Vivosmart 4 | n = 25 (z 62; celý vzorek 84 % mužů, 46 r., i podezření na apnoe), laboratoř, PSG | **0,33** | ≈ 0,89 (odv.) | ≈ **0,39** (odv.) | ≈ 0,36 (odv.) | **0,21** (typ κ nejasný) | −14,4 min (LoA **−163,6 až +134,8**) | n/a | VLAIO; bez COI |
| Miller 2022, *Sensors* | Forerunner 245 Music | n = 53, 25 r., laboratoř, PSG | 0,50 (21 % lehkého a 23 % bdění označí jako REM) | ≈ 0,81 (odv.) | ≈ 0,40 (odv.) | ≈ 0,44 (odv.) | 0,25 / 0,35 | +20,2 ± 64,1 min | n/a | Laboratoř dostává podporu od WHOOP |
| Budig 2022, *Sensors* | Forerunner 945, fw 5.50 | n = 49 pacientů s podezřením na poruchu spánku, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | REM MAE 53,1 min, MAPE 97,5 % | n/a | Bez COI |
| Topalidis 2025/2026, preprint | Vivoactive 5/6 a Venu 3, fw 5.10.0.22 | n = 18 × 5 nocí doma, ambulantní PSG | **0,49** (0,45–0,53) | n/a | n/a (PPV pro fáze 0,55–0,64) | n/a | **0,41** / n/a; 4f přesnost 63 % | 71 vs 89 min, při průměru ≈ −19 min, LoA ±64,9 | n/a | COI NUKKUAA; optimistické zarovnání |
| Dial 2025 (jen vstupní signál) | Fenix 6 | n = 13, 536 nocí, EKG | HRV CCC 0,87, MAPE 10,5 % (Oura Gen4 0,99) | | | | | | | AFRL; bez COI |
| Saliba 2026, *Front Psychiatry* | Vivoactive 4, Venu 2 Plus, Venu 3 | 130 osob, jen proti spánkovému deníku | Fáze nehodnoceny | | | | | | | |
| Index Sleep Monitor (2025) | pásek na paži | | **Validace nenalezena** | | | | | | | |
| NCT06174558 | Vivosmart 5 vs PSG | registrováno 12/2023, stav „unknown“ | Výsledky nejsou | | | | | | | |

### 1.3 Meta-analýzy a přehledy

| Práce | Zahrnuto | Klíčové číslo pro REM | Pozn. |
|---|---|---|---|
| Khan 2025, *OTO Open* | 6 studií Oury, n = 388 | REM: průměrný rozdíl −3,9 min (95% CI −17,2 až +9,5) | Jen průměrný rozdíl skupin, ne individuální chyba |
| Jin 2026, *J Transl Med* | 28 článků, 11 prstenů | Sloučená binární přesnost REM 0,74 (0,68–0,79); senzitivita REM v jednotlivých studiích 0,14–0,89, specificita 0,87–0,94; κ 0,06–0,70 | Binární přesnost je nafouknutá převahou ne-REM epoch |
| Schyvens 2024, *JMIR mHealth* | 8 studií: Fitbit Charge 4, Garmin Vivosmart 4, WHOOP | Garmin VS4 „mírná“ přesnost fází; WHOOP největší odchylka REM (+21 min) | |
| Lee YJ 2025, *J Clin Sleep Med* | 24 studií náramků, 798 osob | Fáze nemetaanalyzovány; rozdíly v celkové době spánku a WASO | |
| Agostinho 2026, *Behav Sleep Med* | 16 studií, 10 v meta-analýze | Žádné zařízení konzistentně nejlepší; nejblíže PSG Oura Gen3 pro latenci a efektivitu spánku | |
| de Zambotti 2025, *Sleep Adv* | komentář | Validace zaostávají za verzemi; srovnávat ve 30s epochách; 5min epochy z API (Herberger) zhoršují metriky | Všichni autoři kromě jednoho jsou zaměstnanci Oury |
| Chee 2025 (World Sleep Society), *Sleep Med* | doporučení | Oddělovat standardizovaná „základní měřítka spánku“ od proprietárních explorativních metrik | **Inference:** REM okna patří do méně spolehlivé vrstvy |

### 1.4 Srovnání a hodnoty, které appka použije

| Metrika (REM) | Oura Gen3 / Gen4 (OSSA 2.0) | Garmin výchozí (Fenix 5S, Vivosmart 3, Forerunner 245, Venu 3, Vivoactive 5/6) | Garmin Vivosmart 4 (pesimistická varianta) | Kontext |
|---|---|---|---|---|
| Senzitivita | 0,55–0,76 (střed **0,70**) | 0,49–0,54 (střed **0,50**); výrobce 0,70 | 0,33–0,34 | Apple Watch (white paper 2025) 0,82; EEG Dreem 3 κ 4f 0,76–0,86 |
| Falešně pozitivní (1 − spec.) | 0,05–0,18 (střed **0,10**) | 0,16–0,19 (střed **0,15**) | 0,11–0,12 | |
| PPV | 0,36–0,79 | 0,40–0,51 | 0,39–0,42 | |
| κ 4f | 0,35–0,65 | 0,25–0,41 (výrobce 0,54) | 0,20–0,21 | Shoda dvou lidských hodnotitelů PSG je asi 82–83 % epoch (cit. v Altini 2021) |
| REM min za noc, bias | −5 až +33 min | −19 až +20 min | −22 až +39 min | |
| REM min za noc, 95% LoA | asi ±75–100 min (Searles, Herberger, Kainec) | asi ±65–85 min (Chinoy, Topalidis) | až ±150 min | |
| Latence REM (první REM) | ≈ −9,5 min (Lee 2023) | +25 až +30 min (Chinoy) | +16 min (Mouritzen) | Zařízení často přehlédnou krátký první REM |
| Typický vzorec chyby | REM → lehký (15–37 % REM epoch) | REM → lehký (37–42 %); lehký a bdění → REM (13–23 %) | REM → lehký 42–54 %, REM → hluboký 23 % | |
| Rozlišení dat | app a API 5 min (`sleep_phase_5_min`); export do Apple Health 30 s | úseky s časem zaokrouhleným na minuty (Topalidis přes Apple Health) | | |

### 1.5 Časová shoda: co víme a co ne

| Otázka | Co je doloženo | Zdroj |
|---|---|---|
| Přesnost začátku a konce jednotlivých REM období | **Žádná studie to pro Ouru ani Garmin nehodnotí** | rešerše Europe PMC 2018–2026 (negativní) |
| Začátek prvního REM (latence) | Garmin nadhodnocuje o 16–30 min (první REM přehlédne nebo posune). Oura Gen3: bias ≈ −9,5 min. U dalších zařízení se biasy pohybují od −50 do +65 min. | Mouritzen 2020; Chinoy 2021 (tab. S6); Lee 2023 (obr. 5) |
| Je chyba konstantní posun? | Ne. Posun Garminu o ±40 epoch (±20 min) vůči PSG shodu prakticky nezlepšil. | Mouritzen 2020 |
| Malé posuny hodin zařízení | Existují. Topalidis zarovnával křížovou korelací v 3min okně a zarovnání ponechal, jen když zlepšilo shodu. Garmin si v roce 2019 zarovnával data podle tepu s přesností pod 1 s. | Topalidis 2025; Garmin 2019 |
| Opakovatelnost zařízení | Dvoje Vivosmart 4 na téže osobě (23 nocí) se na REM shodly jen v 53 % (pozitivní shoda; κ 4f mezi nimi 0,68). | Mouritzen 2020 (odv. z tab. 2) |
| Vliv delších epoch | Hodnocení po 5 min (data z API Oury) snižuje metriky a vytváří umělé přechody. | Herberger 2025; de Zambotti 2025 |
| Počítá se v reálném čase? | Ne. Oura normalizuje přes celou noc a používá okna s budoucností a znaky času v noci. Garmin počítá 7 znaků přes celou noc v cloudu. | Altini 2021; Garmin 2019 |
| Shoda nočních součtů | Špatná: ICC/CCC pro REM 0,06–0,37 | Robbins 2024; Kainec 2024; Searles 2026; Mouritzen 2020 |

**Inference pro návrh:** hranice REM okna nejsou jisté zhruba o jednu až dvě 5min epochy (±5–10 min). První cyklus je nejméně spolehlivý. Když zařízení v první polovině noci REM „nevidí“, je to slabá informace.

---

## 2. Jak v appce mluvit o „odhadu výskytu REM“

### 2.1 Zásady

1. **Je to odhad z těla, ne měření mozku.** Oura a Garmin odhadují REM z tepu, variability tepu, dýchání, pohybu a teploty. REM v definici PSG je stav mozku (EEG, EOG, EMG).
2. **Okno, ne bod.** Ukazuj „pravděpodobné REM okno“ s neostrými okraji, ne přesné časy začátku a konce.
3. **Kategorie, ne desetiny.** Pravděpodobnost zaokrouhli na desítky procent, v textu použij slovní kategorii a strop zobrazení **90 %**. Ani nejlepší studie nemá PPV nad 0,79.
4. **Trend, ne noc.** REM minuty za jednu noc mohou být o hodinu mimo. Srovnávej týdenní průměry, ne dvě noci.
5. **Přiznej shodu i neshodu zařízení**, ale nevydávej shodu za jistotu.
6. **Žádná diagnostika.** Nehodnoť „málo REM“ jako problém.

### 2.2 Slovník a formulace (tykání)

| Situace | Doporučený text | Pozn. |
|---|---|---|
| Název funkce | „Odhad REM“, „Pravděpodobné REM okno“, „REM mapa noci“ | Ne „REM fáze“ jako fakt |
| Kategorie p ≥ 0,7 | „pravděpodobně REM“ | |
| 0,4 ≤ p < 0,7 | „možná REM“ | |
| 0,2 ≤ p < 0,4 | „spíš ne“ | |
| p < 0,2 | nezobrazovat, nebo „málo pravděpodobné“ | |
| Hlavní věta po noci | „Tvoje spánková data naznačují pravděpodobné REM okno zhruba mezi 4:20 a 4:50. Okraje mohou být posunuté o 5–10 minut.“ | Časy zaokrouhlit na 5 min |
| Obě zařízení souhlasí | „Oura i Garmin se tu shodují. Oba ale měří tep a pohyb, ne mozek, takže je to dobrý odhad, ne jistota.“ | |
| Neshoda | „Tady se zařízení neshodují: Oura hlásí REM, Garmin lehký spánek. Odhad je proto nejistý.“ | Ukaž obě stopy |
| První hodina noci | „První REM bývá krátký a náramky ho často přehlédnou. Na začátku noci se na odhad moc nespoléhej.“ | Opora: latence REM u Garminu +16 až +30 min |
| REM minuty | „REM za noc: asi 1 h 30 min (odhad, může se lišit i o hodinu). Víc řekne týdenní průměr.“ | Zaokrouhlit na 10 min |
| Týdenní trend | „Tento týden v průměru asi 1 h 35 min REM, minulý asi 1 h 25 min. Rozdíl je menší, než kolik zařízení dokáže spolehlivě rozlišit.“ | Rozdíl pod ~30–40 min neinterpretovat (inference) |
| Sen v čase T | „Probudil ses ve 4:52. Podle odhadu jsi těsně předtím byl pravděpodobně v REM.“ | Formulovat jako pravděpodobnost |
| Vysvětlivka (info ikona) | „Odhad vzniká až po noci z dat Oury a Garminu. Ve studiích prsten zachytil zhruba polovinu až tři čtvrtiny REM ze spánkové laboratoře, hodinky Garmin nejvýš asi polovinu.“ | Jedna věta o zdroji: „podle studií 2020–2026“ |
| Po aktualizaci firmwaru | „Oura nebo Garmin změnily algoritmus. Pár nocí může být odhad méně srovnatelný se starými daty.“ | Logovat verze |

### 2.3 Co netvrdit

- „Oura/Garmin **měří** REM.“ Správně je „odhaduje“.
- „Byl jsi v REM **1 h 42 min**“ nebo „REM začal **ve 4:13**“. To je falešná přesnost, rozlišení dat je 5 min a chyba nočního součtu desítky minut.
- „Tvůj sen **byl** v REM“ nebo „lucidní sen se odehrál v REM“. Data to nedokážou, sny bývají i mimo REM.
- „**Detekujeme REM v reálném čase**“ nebo „podnět přijde přesně do REM“. Data přicházejí až po synchronizaci a algoritmy počítají přes celou noc.
- „Obě zařízení se shodla, **takže je to jisté**.“
- „Přesnost **79 %** / **95 %**.“ To jsou firemní čísla pro čtyři fáze nebo pro spánek/bdění, ne pro REM okna. V srpnu 2026 byla proti Ouře kvůli takovým tvrzením podána hromadná žaloba (zatím nerozhodnutá).
- „Málo REM = špatný spánek“, „REM pod normou“. Žádná diagnostika.
- „Dnes víc REM než včera“ při rozdílu pod zhruba hodinu.
- Hodnoty REM latence jako fakt.
- Srovnání přes výměnu zařízení nebo aktualizaci algoritmu bez upozornění.

### 2.4 Jak to ukázat (vizuální specifikace)

- **Pás pravděpodobnosti (REM mapa noci).**
  - Vodorovná osa od usnutí po probuzení, 5min sloupce.
  - Výška nebo krytí výplně = posteriorní p (0–0,9).
  - Den: akcent #FF5F1F na panelu #0C1222. Noc: jen #FF3B2F / #B3261E / #5A120D na černé.
- **Jádro a okraje.**
  - Úseky s p ≥ 0,5 orámovat tenkou linkou s rohovými značkami (styl Program 2026).
  - Navazující úseky s 0,3 ≤ p < 0,5 přerušovanou linkou („okraj“).
- **Stopy zařízení.**
  - Pod pásem dvě tenké stopy „OURA“ a „GARMIN“ (JetBrains Mono, verzálky): krátké čárky tam, kde dané zařízení hlásí REM.
  - Vpravo ukazatel shody: „●● SHODA“, „●○ JEN OURA“, „○● JEN GARMIN“.
- **Sny.** Svislá čárka v čase probuzení se snem z deníku. Popisek „před probuzením: pravděpodobně REM / možná REM“.
- **Popisek okna.** `PRAVDĚPODOBNÉ REM OKNO 04:20–04:50 · OKRAJE ±5 MIN`.
- **Legenda vždy viditelná:** „Odhad z tepu a pohybu, ne z mozku.“
- **Bez ostrých bloků.** Nekreslit klasický hypnogram s ostrými schody jako „pravdu“. Surový hypnogram zařízení schovat do detailu („Surová data Oura“).
- **Plánování (budoucí noci).** Osobní křivka P(REM | čas od usnutí) z posledních 14 nocí jako pás: medián a 25.–75. percentil. Text: „V 9 ze 14 nocí jsi měl pravděpodobné REM okno mezi 4:10 a 5:00.“

```
 23:30        01:00        02:30        04:00        05:30   06:40
   |            |            |            |            |        |
   .  ..        .:::.         ..:::::.       .:::::::::.   ..::.     <- pás p(REM)
                              [----]        [==========]             <- okraj / jádro
 OURA   |     |||        |||||          ||||||||||||    |||
 GARMIN       | |        ||   ||       |||  ||||||  |   ||  |
                                                   ▲ sen 05:12
 PRAVDĚPODOBNÉ REM OKNO 04:20–04:50 · OKRAJE ±5 MIN   ●● SHODA
 Odhad z tepu a pohybu, ne z mozku.
```

---

## 3. Jak vážit shodu Oury a Garminu

### 3.1 Data a předzpracování

1. **Společná mřížka 5 min** od usnutí do probuzení (hypnogram Oury je v 5min oknech).
2. Pro každé zařízení d a epochu t spočítej **podíl REM v okně** φ_d,t ∈ [0, 1]. Když zařízení nemá data, epochu pro něj vynech.
3. **Zarovnání hodin.**
   - Křížovou korelací minutového tepu z obou zařízení odhadni posun v okně ±3 min a posun odečti.
   - Postup odpovídá zarovnání podle tepu (Garmin 2019) a CCF zarovnání (Topalidis 2025).
4. **Bdění z appky má přednost.** Intervaly, kdy appka ví, že uživatel byl vzhůru (vypnutý budík, zápis do deníku, WBTB, MILD v posteli), nastav jako „ne-REM“ s vysokou jistotou.
   - Důvod: všechna zařízení zčásti řadí nehybné bdění jako spánek (Willoughby 2024).
   - **Inference:** tiché ležení při WBTB s vyšším tepem může obě zařízení svést k „REM“.
5. **Uložit verze** aplikace, firmwaru a algoritmu (Oura, Garmin) ke každé noci.

### 3.2 Model

**a) Prior podle času od usnutí** τ (v hodinách). Je to heuristika: tvar odpovídá známému nárůstu REM k ránu, průměr je kalibrovaný na přibližně 22 % REM.
- PSG v citovaných studiích: Robbins 96 / 430 min, Mouritzen 98 / 415 min, Schyvens 92 min; latence REM v PSG 73–112 min.

| τ (h) | 0–0,75 | 0,75–1 | 1–2 | 2–3 | 3–4 | 4–5 | 5–6 | > 6 |
|---|---|---|---|---|---|---|---|---|
| π(τ) | 0,02 (pevně) | 0,05 | 0,15 | 0,18 | 0,22 | 0,26 | 0,30 | 0,33 |

**Zmírnění prioru (β).** Oura už čas v noci používá jako znak (Altini 2021), takže plný prior by tuto informaci započítal dvakrát. Proto od 0,75 h:

`logit π_eff(τ) = logit π̄ + β · (logit π(τ) − logit π̄)`, kde π̄ = 0,22 a β = 0,5.

Po 7–14 nocích nahradit osobní křivkou. Navazuje na `algoritmus_rem_cyklu.md`.

**b) Model senzoru s podmíněnou závislostí chyb.** Pro binární výstup O (Oura hlásí REM) a G (Garmin hlásí REM):

```
Při skutečném REM (R = 1):
  P(O=1, G=1 | R=1) = s_O·s_G + ρ·√(s_O(1−s_O)·s_G(1−s_G))
  P(O=1, G=0 | R=1) = s_O − P(1,1|R=1)
  P(O=0, G=1 | R=1) = s_G − P(1,1|R=1)
  P(O=0, G=0 | R=1) = 1 − s_O − s_G + P(1,1|R=1)
Při ne-REM (R = 0): totéž s f_O a f_G (falešně pozitivní míry) místo s_O a s_G.
```

- s = senzitivita, f = 1 − specificita.
- ρ je podmíněná korelace chyb (klasický model kombinace dvou diagnostických testů se závislostí, Vacek 1985; Gardner a kol. 2000). ρ = 0 znamená naivní Bayes (nezávislé chyby).
- **Podmínka:** všechny buňky ≥ 0. Pokud ne, zmenši ρ.
- **Měkké štítky:** pro φ mezi 0 a 1 použij bilineární směs
  `E_t(r) = Σ_{a,b∈{0,1}} w_O(a)·w_G(b)·P(O=a, G=b | R=r)`, kde w_d(1) = φ_d,t a w_d(0) = 1 − φ_d,t.
- **Jen jedno zařízení:** E_t(r) = φ·P(D=1|r) + (1 − φ)·P(D=0|r).

**c) Časové vyhlazení: dvoustavový skrytý Markovův model** (REM / ne-REM) na 5min epochách.
- Setrvání v REM: `a_RR(τ) = 1 − 5 / L(τ)`. Střední délka REM období L = 15 min do 2 h, 25 min ve 2–5 h a 30 min po 5 h. Učebnicová heuristika: REM periody se k ránu prodlužují.
- Přechod do REM: `h(τ) = π_eff(τ)·(1 − a_RR) / (1 − π_eff(τ))`, aby stacionární podíl REM odpovídal prioru.
- **Zmírněné emise:** `E_t(r)^γ` s γ = 0,5. Chyby zařízení jsou v čase autokorelované (klouzavá okna, celonoční normalizace), takže sousední epochy nejsou nezávislá svědectví. Bez γ je model přehnaně jistý (v testu až 0,99).
- Výstup: posterior `p_t = P(R_t = 1 | všechna data noci)` z dopředně-zpětného algoritmu.

**d) Z posteriorů k oknům.**
- Jádro = souvislý úsek s p ≥ 0,5. Okraj = navazující epochy s p ≥ 0,3.
- Jádra kratší než 10 min nezobrazovat jako okno, jen jako „možná REM“.
- Zobrazení: min(p, 0,9) zaokrouhlit na 0,1 a převést na kategorii (2.2).
- Odhad REM minut za noc = 5 · Σ p_t. Ukazovat zaokrouhleně na 10 min s textovou výhradou z 2.2.

### 3.3 Výchozí parametry

| Parametr | Výchozí | Rozsah pro citlivostní analýzu | Zdroj / zdůvodnění |
|---|---|---|---|
| s_O, Oura Gen3/Gen4 | **0,70** | 0,55–0,76 | Lee 0,71; Topalidis 0,73; Robbins 0,76; Herberger 0,55 |
| f_O, Oura Gen3/Gen4 | **0,10** | 0,05–0,18 | Robbins ≈ 0,05 (odv.); Chinoy 2022 0,08; Lee 0,13; Herberger ≈ 0,18 (odv.) |
| s_O / f_O, Oura Gen2 | 0,52 / 0,08 | 0,39–0,61 / 0,05–0,10 | Miller 2022; Chinoy 2021; Chinoy 2022 |
| s_G, Garmin výchozí | **0,50** | 0,49–0,54 (výrobce 0,70) | Chinoy 2021; Miller 2022; Topalidis 2025 |
| f_G, Garmin výchozí | **0,15** | 0,11–0,19 | Chinoy 0,16–0,18; Miller ≈ 0,19 (odv.); Schyvens ≈ 0,11 (odv.) |
| s_G / f_G, Vivosmart 4 (pesimisticky) | 0,33 / 0,12 | 0,33–0,34 / 0,11–0,12 | Mouritzen 2020; Schyvens 2025 |
| ρ | **0,3** | 0–0,5 | Přímá data pro dvojici Oura + Garmin chybí. Oba používají PPG a akcelerometr, oba přidávají čas v noci a oba přesouvají REM do lehkého spánku (inference) |
| γ | **0,5** | 0,3–1 | Autokorelace chyb (Altini 2021: klouzavá okna, normalizace na noc) |
| β | **0,5** | 0–1 | Dvojí započtení času v noci (Altini 2021) |
| L(τ) | 15 / 25 / 30 min | ±5 min | heuristika |
| Strop zobrazení | **0,9** | 0,8–0,9 | PPV ≤ 0,79 i v nejlepší studii |
| Mřížka | 5 min | | rozlišení Oury |

### 3.4 Jak shoda a neshoda mění důvěru

Výpočet bez časového vyhlazení. Výchozí parametry: s_O 0,70, f_O 0,10, s_G 0,50, f_G 0,15.

Samostatně: Oura „REM“ má LR+ 7,0 a LR− 0,33, Garmin „REM“ má LR+ 3,3 a LR− 0,59.

| Prior | Pouze Oura REM | Pouze Oura ne-REM | Pouze Garmin REM | Pouze Garmin ne-REM |
|---|---|---|---|---|
| 0,25 (pozdní noc) | 0,70 | 0,10 | 0,53 | 0,16 |
| 0,05 (začátek noci) | 0,27 | 0,02 | 0,15 | 0,03 |

| Prior | ρ | Oba REM | Oura REM, Garmin ne | Oura ne, Garmin REM | Oba ne |
|---|---|---|---|---|---|
| 0,25 | 0 (naivní Bayes) | 0,89 (LR 23,3) | 0,58 (LR 4,1) | 0,27 (LR 1,1) | 0,06 (LR 0,20) |
| 0,25 | **0,3 (výchozí)** | **0,75** (LR 8,9) | **0,64** (LR 5,3) | **0,21** (LR 0,79) | **0,08** (LR 0,27) |
| 0,25 | 0,5 | 0,69 (LR 6,8) | 0,71 (LR 7,5) | 0,13 (LR 0,44) | 0,10 (LR 0,32) |
| 0,05 | 0 | 0,55 | 0,18 | 0,06 | 0,01 |
| 0,05 | 0,3 | 0,32 | 0,22 | 0,04 | 0,01 |
| 0,05 | 0,5 | 0,26 | 0,28 | 0,02 | 0,02 |

**Čtení tabulky:**
- **Shoda „REM“** zvyšuje důvěru oproti samotné Ouře jen mírně (z 0,70 na 0,75 při ρ = 0,3). Naivní násobení by dalo 0,89, což je falešná jistota.
- **Neshoda** podle toho, kdo hlásí REM:
  - Když REM hlásí Oura, odhad zůstává „možná REM“ (0,64).
  - Když REM hlásí jen Garmin, výsledek je pod priorem (0,21), protože Garmin má hodně falešných REM a Oura „ne“ je silnější svědectví.
- **Při ρ ≈ 0,5** druhé zařízení po pozitivní Ouře nepřidává skoro nic. Shoda obou je dokonce o chlup slabší než samotná Oura, protože při silně korelovaných chybách se falešné REM obou zařízení objevují spolu.
- **Na začátku noci** ani shoda obou neznamená „pravděpodobně REM“ (0,32). Odpovídá to fyziologii: REM v první hodině je u zdravých vzácný.

### 3.5 Proč shoda zařízení není přesnost

Očekávané κ mezi Ourou a Garminem pro REM při podílu REM 20 % a výchozích s a f:

| ρ | P(oba REM) | Očekávané κ (Oura vs Garmin) |
|---|---|---|
| 0 | 0,082 | **0,20** |
| 0,3 | 0,121 | 0,43 |
| 0,5 | 0,148 | 0,58 |

Důsledky:
- **Nízká shoda** zařízení (κ ≈ 0,2) je normální i u zařízení s „literárními“ parametry. Není to porucha.
- **Vysoká shoda** (κ > 0,5) může znamenat korelované chyby, nebo zařízení přesnější než literatura. Bez EEG referenční noci se tyto možnosti nedají odlišit.
- Bezpečná volba je předpokládat korelované chyby. Model pak bude spíš opatrný než přehnaně jistý.

### 3.6 Odhad ρ a personalizace

1. **Hrubý odhad z dat uživatele.** Po ≥ 7 nocích s oběma zařízeními spočítej pozorované κ_OG na 5min mřížce. Zvol ρ̂ tak, aby očekávané κ_OG (vzorec v 3.5) odpovídalo pozorovanému, a omez ho na [0, 0,5].
2. **Pokročile: bayesovský model latentních tříd** (paradigma Hui–Walter).
   - Strata podle hodiny noci mají různou prevalenci REM.
   - Beta priory na s a f z tabulky 3.3 (např. s_O ~ Beta(14, 6), f_O ~ Beta(2, 18)) a slabý prior na ρ.
   - S ρ > 0 není model bez informativních priorů identifikovatelný. Data tedy hlavně zužují rozsahy, „pravdu“ nenajdou.
3. **Zlatá cesta: 1–3 referenční noci s EEG čelenkou** (např. ZMax) nebo ve spánkové laboratoři. Z nich se přímo odhadnou s, f a ρ pro daného člověka.
4. **Ruční záznamy** „probudil jsem se ze snu v čase T“ jsou slabé svědectví o REM v posledních minutách před T. Model popisuje `algoritmus_rem_cyklu.md`.
5. **Po změně firmwaru nebo algoritmu** vrátit parametry na výchozí a personalizaci začít znovu.

### 3.7 Modelový příklad (pozdní noc, 4:00–5:15)

Parametry výchozí, prior po zmírnění 0,25, L = 25 min (a_RR = 0,80, h = 0,067), ρ = 0,3, γ = 0,5.

| Čas | Oura REM | Garmin REM | p bez vyhlazení | p s HMM | Kategorie |
|---|---|---|---|---|---|
| 04:00 | 0 | 0 | 0,08 | 0,14 | málo pravděpodobné |
| 04:05 | 0 | 0 | 0,08 | 0,16 | málo pravděpodobné |
| 04:10 | 0 | 0 | 0,08 | 0,25 | spíš ne |
| 04:15 | 0 | 1 | 0,21 | 0,47 | možná REM (okraj) |
| 04:20 | 1 | 1 | 0,75 | 0,76 | pravděpodobně REM |
| 04:25 | 1 | 1 | 0,75 | 0,87 | pravděpodobně REM |
| 04:30 | 1 | 0 | 0,64 | 0,90 | pravděpodobně REM |
| 04:35 | 1 | 1 | 0,75 | 0,90 | pravděpodobně REM |
| 04:40 | 1 | 1 | 0,75 | 0,84 | pravděpodobně REM |
| 04:45 | 1 | 0 | 0,64 | 0,67 | možná REM |
| 04:50 | 0 | 0 | 0,08 | 0,31 | spíš ne (okraj) |
| 04:55 | 0 | 0 | 0,08 | 0,16 | málo pravděpodobné |
| 05:00 | 0 | 0 | 0,08 | 0,10 | málo pravděpodobné |
| 05:05 | 0 | 0 | 0,08 | 0,08 | málo pravděpodobné |
| 05:10 | 0 | 1 | 0,21 | 0,09 | málo pravděpodobné (osamocený Garmin) |
| 05:15 | 0 | 0 | 0,08 | 0,09 | málo pravděpodobné |

**Výsledek a text v appce:**
- Jádro (p ≥ 0,5) je 4:20–4:50 a okraj (p ≥ 0,3) 4:15–4:55.
- Text: „Pravděpodobné REM okno zhruba 4:20–4:50, okraje ±5 min. Oura i Garmin se tu z větší části shodují.“
- Osamocený Garminův REM v 5:10 vyhlazení potlačí (0,21 → 0,09).
- Epochy uvnitř okna, kde Garmin hlásí „ne“, zůstávají vysoko, protože okolní svědectví je silné.
- Odhad REM v tomto úseku: 5 · Σ p ≈ 30 min.

### 3.8 Pseudokód

```text
input: sleep_onset, wake_time, hypnogram_oura (5 min), hypnogram_garmin (segmenty),
       app_awake_intervals, params (tab. 3.3)

grid = 5min epochy od sleep_onset do wake_time
shift = argmax_lag xcorr(hr_oura_1min, hr_garmin_1min, lag in [-3, +3] min)
for t in grid:
    phiO[t] = podil REM Oury v okne t (nebo MISSING)
    phiG[t] = podil REM Garminu v okne t posunuteho o shift (nebo MISSING)
    tau = hodiny od sleep_onset
    piEff[t] = tau < 0.75 ? 0.02 : temper(priorTable(tau), base = 0.22, beta = 0.5)
    L = tau < 2 ? 15 : (tau < 5 ? 25 : 30)
    aRR[t] = 1 - 5 / L
    h[t] = piEff[t] * (1 - aRR[t]) / (1 - piEff[t])
    for r in {0, 1}:
        E[t][r] = emission(phiO[t], phiG[t], r, sO, fO, sG, fG, rho) ^ gamma
    if t in app_awake_intervals: E[t][1] = 1e-3 * E[t][1]
p = forward_backward(E, transitions(h, aRR), init = piEff[0])
display = round(min(p, 0.9), 1)
windows = runs(p >= 0.5, min_len = 10 min) extended by neighbours with p >= 0.3
rem_minutes = round(5 * sum(p), to = 10)
log(device_versions, params, rho_hat)
```

### 3.9 Jak model ověřit (stručně)

1. **Kontroly rozumnosti:**
   - Podíl noci s p ≥ 0,5 by měl být zhruba 15–30 %.
   - Jádra by se neměla objevovat v prvních 45 min.
   - Počet oken za noc by měl být 3–6.
2. **Citlivostní analýza:** okna při ρ ∈ {0; 0,3; 0,5} a γ ∈ {0,3; 0,5; 1}. Když se okno posune o víc než 10 min, zobrazit ho jako „nejisté“.
3. **Referenční noci s EEG** (pokud je uživatel má): kalibrace p proti EEG ve skupinách po 0,1 a Brierovo skóre.
4. **Vnitřní validita:**
   - Probuzení se snem z deníku by mělo mít vyšší p v posledních 10 min než probuzení bez snu.
   - Obrácený výsledek naznačuje chybu modelu nebo dat.

---

## 4. Limity a otevřené otázky

1. **Oura Gen4 a Ring 5 nemají PSG validaci určování fází.** Platí jen nepřímý předpoklad, že běží stejný algoritmus z roku 2023 jako u Gen3 (podle Oury) s lepším signálem HRV (Dial 2025).
2. **Současné Garminy** (Venu 3, Vivoactive 5/6, Fenix 7/8, Forerunner 265/965, Index Sleep Monitor) nemají recenzovanou PSG validaci. Jediný zdroj je preprint s COI a optimistickým zarovnáním (Topalidis 2025). Firemní validace je z roku 2019 a jde o křížovou validaci vývojových dat.
3. **Asymetrie COI.**
   - Nejlepší čísla Oury pocházejí z prací financovaných nebo spoluautorovaných Ourou (Altini 2021, Robbins 2024, částečně Svensson 2024).
   - Nezávislé klinické vzorky dávají výrazně méně (Herberger 2025, Lee 2023).
   - Studie Garminu jsou převážně nezávislé, a proto možná „férověji nízké“ (inference).
4. **Populace.** Většina studií měří mladé zdravé lidi v laboratoři po jednu noc. U starších lidí, při apnoe a u nočních s vysokým WASO je chyba větší (Searles 2026, Herberger 2025, Topalidis 2025).
5. **Rozlišení.** Validace jsou ve 30s epochách, appka dostane 5 min (Oura). Metriky na 5min mřížce jsou neznámé a pravděpodobně horší (Herberger 2025).
6. **Časování jednotlivých REM období** (začátek a konec, chyba v minutách) nikdo nevalidoval. To je hlavní mezera pro chytrý budík WBTB.
7. **Korelace chyb Oura + Garmin (ρ)** není změřena. Výchozí 0,3 je odhad.
8. **Lucidní snění a WBTB.** Zařízení nebyla validována během lucidních snů, po nočním probuzení ani při ležení v klidu s mentálním cvičením (MILD). Nehybné bdění se zčásti řadí jako spánek (Willoughby 2024).
9. **Algoritmy se mění bez ohlášení.** De Zambotti 2025 výslovně upozorňuje, že validace zaostávají za verzemi. Není jasné, zda Oura po aktualizaci přepočítává historické noci (neověřeno).
10. **Reálný čas.** Ani jedno zařízení nedává REM během noci přes veřejné API. Odhad výskytu REM pro plánování je proto vždy předpověď z minulých nocí.
11. **Otevřené otázky pro vlastní měření:**
    - Jak velké je ρ u konkrétní dvojice?
    - O kolik minut se liší začátky REM oken mezi Ourou a Garminem po zarovnání podle tepu?
    - Dá se první REM odhadnout lépe z prioru než ze zařízení?

---

## 5. Zdroje

| Autor, rok | Časopis | DOI / URL | Financování / COI |
|---|---|---|---|
| de Zambotti M, Rosas L, Colrain IM, Baker FC, 2019 | Behav Sleep Med 17(2) | 10.1080/15402002.2017.1300587 | NIH (NIAAA). De Zambotti později zaměstnanec Oury |
| Mouritzen NJ, Larsen LH, Lauritzen MH, Kjær TW, 2020 | PLoS One 15:e0243214 | 10.1371/journal.pone.0243214 | Hodinky zapůjčil Garmin |
| Altini M, Kinnunen H, 2021 | Sensors 21:4302 | 10.3390/s21134302 | Kinnunen zaměstnanec Oury, Altini poradce Oury |
| Chee NIYN a kol., 2021 | Nat Sci Sleep 13:177 | 10.2147/NSS.S286070 | NMRC; prsteny dodala Oura |
| Chinoy ED a kol., 2021 | Sleep 44(5):zsaa291 | 10.1093/sleep/zsaa291 | Office of Naval Research; bez COI |
| Chinoy ED, Cuellar JA, Jameson JT, Markwald RR, 2022 | Nat Sci Sleep 14:493 | 10.2147/NSS.S348795 | Office of Naval Research; autoři zaměstnanci Leidos; bez vazby na výrobce |
| Ghorbani S a kol., 2022 | Nat Sci Sleep 14:645–660 | 10.2147/NSS.S359789 | Patent Z3Score (Chee, Ong); nespecifikované „other conflicts“ |
| Miller DJ, Sargent C, Roach GD, 2022 | Sensors 22:6317 | 10.3390/s22166317 | Laboratoř podporuje WHOOP |
| Budig M, Stoohs R, Keiner M, 2022 | Sensors 22:9540 | 10.3390/s22239540 | Bez COI |
| Lee T a kol., 2023 | JMIR mHealth uHealth 11:e50983 | 10.2196/50983 | Akcie Asleep (SleepRoutine) |
| Kainec KA a kol., 2024 | Sensors 24:635 | 10.3390/s24020635 | Grant UMass; bez COI |
| Robbins R a kol., 2024 | Sensors 24:6532 | 10.3390/s24206532 | Financovala Oura; Robbins v poradním sboru Oury |
| Svensson T a kol., 2024 | Sleep Med 115:251 | 10.1016/j.sleep.2024.01.020 (komentář Lolli 10.1016/j.sleep.2024.03.013) | Částečně Oura (blog Oura, 12. 2. 2024) |
| Ong JL a kol., 2024 | Sleep Health | 10.1016/j.sleh.2023.11.005 | Neověřeno (abstrakt) |
| Willoughby AR a kol., 2024 | Sleep Health | 10.1016/j.sleh.2024.02.007 | Neověřeno (abstrakt) |
| Schyvens AM a kol., 2024 | JMIR mHealth uHealth 12:e52192 | 10.2196/52192 | |
| Schyvens AM a kol., 2025 | Sleep Adv 6:zpaf021 | 10.1093/sleepadvances/zpaf021 | VLAIO; bez COI |
| Herberger S a kol., 2025 | Sci Rep 15:9461 | 10.1038/s41598-025-93774-z | Bez COI |
| Khan S a kol., 2025 | OTO Open | 10.1002/oto2.70181 | |
| Lee YJ a kol., 2025 | J Clin Sleep Med 21(3):573 | 10.5664/jcsm.11460 | |
| de Zambotti M, Vallat R, Pho G, Goldstein C, Patel S, 2025 | Sleep Adv | 10.1093/sleepadvances/zpaf063 | 4 z 5 autorů zaměstnanci Oury |
| Dial MB a kol., 2025 | Physiol Rep | 10.14814/phy2.70527 | AFRL; bez COI |
| Chee MW a kol. (World Sleep Society), 2025 | Sleep Med 131:106506 | 10.1016/j.sleep.2025.106506 | |
| Topalidis P a kol., 2025/2026 | preprint PsyArXiv / Research Square | 10.31234/osf.io/27wun_v1; 10.21203/rs.3.rs-8419739/v1 | Schabus spoluzakladatel, Topalidis zaměstnanec NUKKUAA (sleep²) |
| Searles ME a kol., 2026 | Sleep Adv | 10.1093/sleepadvances/zpag006 | NIH; bez COI |
| Jin Y a kol., 2026 | J Transl Med | 10.1186/s12967-026-08214-x | |
| Agostinho M a kol., 2026 | Behav Sleep Med | 10.1080/15402002.2026.2673893 | |
| Saliba CT a kol., 2026 | Front Psychiatry | 10.3389/fpsyt.2026.1767216 | |
| Burgett S a kol. (Garmin, KUMC), 2019 | poster AAN, firemní blog | https://www.garmin.com/en-GB/blog/?p=6904 | Výrobce |
| Apple, 2025 | White paper „Estimating Sleep Stages from Apple Watch“ | https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf | Výrobce |
| Oura, 2026 | Blog „Standing Behind Our Science“ (23. 8. 2026) a podpora „Sleep Graphs“ (5min hypnogram) | https://ouraring.com/blog/how-oura-measures-sleep-and-validates-accuracy/ ; https://support.ouraring.com/hc/en-us/articles/4403155260307 | Výrobce |
| Žaloba Surber v. Oura, 2026 (N.D. Cal., podána 20. 8. 2026) | zpravodajství | https://www.mddionline.com/wearable-medical-devices/oura-faces-class-action-over-sleep-tracking-claims | Nerozhodnuto |
| NCT06174558, 2023 | ClinicalTrials.gov | https://clinicaltrials.gov/study/NCT06174558 | Výsledky nejsou |
| Vacek PM, 1985; Gardner IA a kol., 2000; Hui SL, Walter SD, 1980 | Biometrics 41(4):959–968; Prev Vet Med 45(1–2):107–122; Biometrics 36(1):167–171 | 10.2307/2530967; 10.1016/S0167-5877(00)00119-7; 10.2307/2530508 | metodika: závislé diagnostické testy, latentní třídy |

*Pozn.: Ong 2024, Willoughby 2024 a Svensson 2024 jsem četl jen v abstraktu. Hodnoty „odv.“ jsou mé výpočty z matic chyb a nejsou publikované.*
