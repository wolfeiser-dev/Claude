# Za hranice reality: 15 inovací, které konkurence nemá

Podklad pro vývoj (Flutter, Android) · 23. 10. 2026 · úkol 5

## Jak číst tento dokument

- **Pořadí:** rozhoduje odhadovaný dopad na šanci lucidně snít. Při podobném dopadu rozhoduje radost z používání. Dopad je odhad z literatury, ne změřená veličina. Právě proto je v appce Osobní laboratoř (funkce 4).
- **Štítky důkazů:** `strong`, `promising`, `community`, `tradition`. Když se funkce skládá z více dílů, má štítek každý díl. `strong` tu znamená opakované terénní studie (NALDIS, ILDIS) nebo silnou obecnou psychologii. Velké preregistrované RCT na indukci LD neexistují.
- **Pracnost** (jeden Flutter vývojář, bez tvorby obsahu): S do 1 týdne, M 2–4 týdny, L 1–3 měsíce.
- **Soukromí:** všechno běží v telefonu. Síť používá jen volitelné stažení Spánkových dat přímo z Oura API do telefonu. Žádný vlastní server.
- **Texty v minulém čase** mají variantu podle oslovení (vyspal / vyspala). Níže je mužský tvar, stejně jako „Jak ses vyspal“.

## Pevné hranice, na kterých návrhy stojí (ověřeno 23. 10. 2026)

| # | Ověřený fakt | Co z toho plyne pro návrh |
|---|---|---|
| 1 | **REM v reálném čase nedá nikdo.** Health Connect ukládá spánek jako `SleepSessionRecord` se stádii až po relaci. Oura API výslovně píše, že spánková data se nahrají, až uživatel otevře aplikaci Oura (Oura API v2, specifikace 1.42). | REM okna jsou vždy **předpověď z minulých nocí**. Nikdy je neprodáváme jako živé měření. |
| 2 | **Oura API v2**, `/v2/usercollection/sleep`: `sleep_phase_5_min` a nově i `sleep_phase_30_sec` (1 hluboký, 2 lehký, 3 REM, 4 bdění), `movement_30_sec`, `heart_rate` (vzorky), `latency`, `bedtime_start/end`, `type` (`long_sleep`, `sleep`, `late_nap`, `rest`). Jen OAuth2, s PKCE i čistě z klienta. Osobní tokeny zrušeny v prosinci 2025. Nová aplikace má limit 10 uživatelů do schválení Ourou. Bez aktivního členství vrací 403. Pole `app_sleep_phase_5_min` bude odstraněno. | 30s hypnogram je nejlepší vstup pro latenci usnutí a REM okna. Před veřejným spuštěním je nutné schválení u Oury. |
| 3 | **Health Connect:** Oura (od 2023) i Garmin Connect (od 2025) zapisují spánek se stádii. Čtení na pozadí vyžaduje `READ_HEALTH_DATA_IN_BACKGROUND`. Data starší než 30 dní před udělením oprávnění jen s `PERMISSION_READ_HEALTH_DATA_HISTORY`. | Hlavní cesta pro Garmin a záloha pro Ouru. Při připojení požádat i o historii, jinak REM profil startuje jen z 30 nocí. |
| 4 | **Garmin Connect Developer Program** (znovu otevřen 21. 10. 2026): úroveň Personal dává jen vlastní data a jen pull, Starter jen push (potřebuje server), Enterprise je placený. | Bez serveru je pro Garmin jediná čistá cesta Health Connect. Osobní klíč jako „režim pro nadšence“ jen po ověření podmínek. |
| 5 | **Connect IQ:** aplikace na hodinkách v popředí čte tep, intervaly mezi údery a akcelerometr (`Sensor.registerSensorDataListener`) a umí vibrovat (`Attention.vibrate`). Úlohy na pozadí nejčastěji po 5 min. Stádia spánku v reálném čase API nemá, `registerForSleepEvent` jen spouští nastavený čas spánku. | Haptický podnět z hodinek je proveditelný. „Detekce REM“ na hodinkách by byl náš vlastní nevalidovaný odhad. |
| 6 | **Android budíky:** `SCHEDULE_EXACT_ALARM` je u nových instalací od Androidu 14 ve výchozím stavu zamítnuté. `USE_EXACT_ALARM` jen pro skutečné budíky. Full-screen intent jen pro volání a budíky. Bez oprávnění lze přes `AlarmClock.ACTION_SET_ALARM` nastavit budík v systémových Hodinách. | Vysvětlující obrazovka před žádostí o oprávnění a záložní cesta přes Hodiny. |
| 7 | **Celonoční zvuk:** FGS `mediaPlayback` spuštěná uživatelem, deklarace s videem v Play Console. Akcelerometr jen jako pojistka pauzy (jako Konkoly 2024). | Zvukový klíč a jemná ťuknutí poběží jako uživatelem spuštěné noční přehrávání. |
| 8 | **Přesnost:** Oura Gen3 REM citlivost 76 %, přesnost 79 % (Robbins 2024, n = 35, jedna noc, financováno Oura). Shoda množství REM za noc slabá (ICC 0,27–0,37). Garmin Vivosmart 4 zachytil 33 % REM (Schyvens 2025). Novější Garminy bez PSG validace. | Garmin vážit méně. Okna kreslit jako pásmo pravděpodobnosti, nikdy jako ostrou čáru. |
| 9 | **Podnět ≈ falešný podnět:** v laboratoři 38,3 vs 28,3 % SVLD, n.s. (MC v2 2026, preprint). Domácí TLR jen ve 2. noci, celkově n.s. (Konkoly 2024). | Každá noční „chytrá“ funkce má v sobě měření, jestli pomáhá právě tobě. |

## Pořadí 15 funkcí

| # | Funkce | Dopad na LD | Radost | Pracnost | Důkazy |
|---|---|---|---|---|---|
| 1 | **Chytré probuzení do snu** (WBTB podle REM oken a brány spánku) | vysoký | střední | M | strong (WBTB + MILD), promising (časování) |
| 2 | **Od Stopy snů ke spouštěči** (osobní plán „když–pak“ a měření přenosu do snu) | střední až vysoký | vysoká | M | strong (implementační záměry obecně), promising, community |
| 3 | **Zvukový klíč** (TLR podle Konkolyho pro Android) | střední, nejistý | vysoká | L | promising |
| 4 | **Osobní laboratoř** (experimenty N-of-1, bayesovsky) | nepřímý, dlouhodobě vysoký | velmi vysoká | M | strong (metoda), promising (pro LD) |
| 5 | **Rekonstrukce noci podle REM oken** | střední (přes vybavování) | vysoká | M | strong (REM a vybavení), promising, community |
| 6 | **Test reality při každém probuzení** (falešná probuzení) | střední | střední | S | promising, community |
| 7 | **Jemné ťuknutí v pozdním REM okně** (DEILD bez vstávání) | střední | střední | S–M | community, promising |
| 8 | **Zápis poslepu** (hlas, zavřené oči, čeština offline) | nízký až střední | vysoká | M | promising, community |
| 9 | **Český průvodce s tvými Stopami snů** (MILD, SSILD) | střední | vysoká | M | strong (MILD), promising (SSILD), community (vlastní hlas) |
| 10 | **Záměr na noc s ranním ověřením** (inkubace + plánovaná akce) | nízký až střední | vysoká | S | promising |
| 11 | **Jóga snu napojená na Stopy snů a emoce** | nízký až střední | vysoká pro část lidí | S–M | tradition, promising |
| 12 | **Bezpečnostní štít** | ochranný, podmínka pro 1, 3, 7 | střední (důvěra) | S–M | promising, strong (prevalence paralýzy) |
| 13 | **Haptický klíč z Garmin hodinek** (Connect IQ) | nejistý | střední | L | promising, community |
| 14 | **Hvězdná mapa: den a sen** (souvislosti s dnem) | nízký | velmi vysoká | M | promising |
| 15 | **Usínací inkubace** (zdřímnutí ve stylu Dormio) | žádný přímý (není to LD) | vysoká | M | promising |

Štít (12) je níž jen proto, že luciditu sám nezvyšuje. Vychází spolu s funkcemi 1, 3 a 7 a bez něj se nespouští.

---

## 15 funkcí podrobně

### 1. Chytré probuzení do snu: Probuzení a návrat do spánku (WBTB) podle tvých REM oken

**Co:** Budík WBTB nezvoní pevně „5 h po ulehnutí“. Zvoní do tvého nejpravděpodobnějšího pozdního REM okna 4,5–6,5 h po **skutečném** usnutí, spočítaného z historie Oury nebo Garminu a z časů snů v ranním zápisu. Spouští se jen přes bránu spánku: max 2× týdně, ne dvě noci po sobě, ne po červené ve „Jak ses vyspal“, ne při spánkovém dluhu. Ráno z hypnogramu ukáže, jak rychle jsi po technice znovu usnul, a podle toho upraví délku bdění.

**Proč:**
- WBTB + Záměr poznat sen (MILD) nebo Střídání smyslů (SSILD) je nejlépe doložená domácí kombinace: 17,4 % nocí v NALDIS (Aspy 2017), 16,5–16,9 % v ILDIS (Aspy 2020). `strong` v měřítku oboru.
- V laboratoři budili po ≥ 5 h 40 min po 10–15 min nepřerušeného REM (Erlacher & Stumbrys 2020). Probuzení po 4,5 h vyšlo hůř, ale jen v mezistudiovém srovnání (Erlacher 2022). `promising`
- Probuzení z REM dává vybavený sen v ~82 % případů, z NREM v ~43 % (Nielsen 2000). MILD začíná právě vybavením snu. `strong`
- Usnutí do 10 min po technice je jediný replikovaný behaviorální prediktor (ILDIS: 18,3 vs 11,1 %, p = 0,037). `promising`
- Personalizované časování podle wearables nikdo netestoval. `promising`, hypotéza, kterou funkce sama měří.
- Konkurence: Shape (jen iOS) odhaduje „špičku snění“ z Apple Health. Na Androidu s Ourou a Garminem, s branou spánku a se zpětnou vazbou usnutí nic.

**Jak v UI:** Karta v Plánu na dnešek „Probuzení do snu · okno 4:35–5:05“, detail s noční orbitou a pásmem REM, červená noční obrazovka, ráno výsledek „Usnul jsi zpátky za 5–10 min“. Podrobně v UX specifikaci.

**Pracnost:** M (model oken S, brána S, budík a noční tok M, ranní latence S).

**Riziko:** Fragmentace spánku (Vallat & Ruby 2019) řeší brána a rozpočet probuzení. Falešná přesnost: REM z wearables má přesnost ~79 % jen v nejlepší studii, proto pásmo a štítek ODHAD. Habituace na buzení: max 2× týdně. Soukromí: hypnogram zůstává v telefonu.

### 2. Od Stopy snů ke spouštěči

**Co:** Pipeline v pěti krocích: opakující se motivy z deníku (Stopy snů) → zařazení do čtyř kategorií znaků snů (vnitřní prožitek, děj, podoba, prostředí) → návrh osobního plánu „když–pak“ pro den (situace v bdění, která Stopu připomíná) → stejná Stopa jako cíl nočního Záměru poznat sen → ranní měření přenosu: Stopa ve snu → všiml sis → test ve snu → lucidita.

**Proč:**
- MILD je strukturálně implementační záměr. Ty mají d = 0,27–0,66, víc při formátu „když–pak“, vysoké motivaci a opakování (Sheeran, Listrom & Gollwitzer 2024; Gollwitzer & Sheeran 2006). `strong` obecně.
- Prospektivní paměť spouštěná událostí funguje spolehlivěji než spouštěná časem (Einstein & McDaniel 1990; McDaniel & Einstein 2000). `strong` obecně, pro LD netestováno.
- Znaky snů a jejich kategorie jako cíl záměru a testu: LaBerge & Rheingold 1990. `community`, přímý test chybí.
- Pozor: samotné testy reality nefungují (NALDIS 8,1 → 7,6 %; Schredl 2025) a v ILDIS vyšel MILD + testy hůř než MILD bez nich (12,1 vs 19,4 %, p = 0,052). Proto je spouštěč ve výchozím stavu lehký („všimni si a zeptej se“) a plný test je volitelný a měřený.
- Konkurence: MILD Trainer má denní „události“, Reality Check propojuje včerejší testy s nocí. Nikdo netěží spouštěče z tvých vlastních snů a nikdo neměří přenos do snu.

**Jak v UI:** Čip po uložení snu „Tohle se ti zdálo už potřetí“, obrazovka Stopy snů jako souhvězdí, návrh spouštěče, max 3 aktivní, ranní otázky o přenosu, týdenní trychtýř. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Habituace na připomínky (max 3 spouštěče, rotace forem, revize po 21 dnech). Intimní a traumatické motivy nikdy v připomínkách. Falešná přesnost automatického rozpoznání: uživatel vždy potvrzuje. Zátěž: účastníci ILDIS vnímali testy jako zátěž.

### 3. Zvukový klíč: TLR podle Konkolyho pro Android

**Co:** Publikovaný domácí protokol TLR (Konkoly 2024, parametry exp. 2) česky: ~20min večerní trénink, kalibrace prahu slyšitelnosti a rozlišení, podněty nejdřív 6 h po tréninku a jen v tvých pozdních REM oknech, náběh hlasitosti od prahu rozlišení, strop, pauza po pohybu z akcelerometru, tlačítko „Probudilo mě to“, jemný režim a skryté kontrolní noci (cizí zvuk, ticho).

**Proč:**
- Princip stojí na reaktivaci naučené asociace ve spánku (Rudoy 2009; Oudiette & Paller 2013). `strong` pro paměť.
- Pro LD: laboratorní zdřímnutí 50 vs 17 % SVLD (Carr 2023). Doma bez kontroly 0,74 → 2,11 LD týdně, s kontrolou rozdíl jen ve 2. noci, v celém vzorku n.s. (Konkoly 2024). Replikace přes Oniri nulová (Genc 2025). Podnět ≈ falešný podnět (MC v2 2026). `promising`, poctivě slabé.
- Efekt TLR se ukázal jen u lidí, kteří si vybavili sny aspoň ve 2 nocích (Konkoly 2024), proto vstupní brána na vybavování.
- Konkurence: Lucyd kopíruje protokol jen na iOS. Výzkumná aplikace Paller lab už není dostupná, nástupce z MIT je jen pro účastníky studie v USA.

**Jak v UI:** Výcvik › Zvukový klíč: úvod se souhlasem s kontrolními nocemi, kalibrace, trénink s českým hlasem, temná noční obrazovka, ranní otázky. Podrobně v UX specifikaci.

**Pracnost:** L.

**Riziko:** Probouzení (pohyb po podnětu 0,19 vs 0,10 bez podnětu, Konkoly 2024), zkrácení REM a efektivity spánku pod podněty (MC v2), partner v posteli, baterie, falešná hlášení „slyšel jsem zvuk“ (15,3 % ve falešných probuzeních, MC v2). Řeší strop, okna, jemný režim, pauzy a Štít.

### 4. Osobní laboratoř: experimenty N-of-1

**Co:** Malé randomizované experimenty na sobě. Noci se losují do variant (Záměr poznat sen vs Střídání smyslů při ranním probuzení, Zvukový klíč vs cizí zvuk vs ticho, dny se spouštěči vs bez nich, chytré okno vs pevných 5 h). Vyhodnocení bayesovsky (beta-binomický model s priorem z literatury, oblast praktické shody ROPE, kontrolní body) a s poctivým „zatím nevíme“.

**Proč:**
- N-of-1 je zavedená metoda personalizované medicíny (Kravitz & Duan 2014; Schork 2015). Mikrorandomizace pro často opakovaná rozhodnutí (Klasnja 2015). `strong` jako metoda.
- V LD chybí experimentální manipulace očekávání i osobní data „co funguje mně“. Laboratorní kontext sám vyrábí vysoká čísla (Peters 2026). `promising`
- Zpětná vazba je jediný herní prvek s doloženým efektem (Yu 2025). `promising`
- Pravděpodobnost ve formě přirozených četností („3 noci ze 100“) lidé chápou lépe než procenta (Gigerenzer & Hoffrage 1995). `strong`
- Konkurence: nikdo.

**Jak v UI:** Výcvik › Osobní laboratoř: šablony experimentů, průvodce, průběh jako orbita s počtem nocí, výsledek jako dvě křivky a jedna věta. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Falešná přesnost na malých číslech (LD je vzácná událost, viz výpočet síly ve specifikaci), průběžné nahlížení, honba za výsledky (experiment nikdy nezvyšuje rozpočet probuzení), očekávání u variant, které nejdou zaslepit.

### 5. Rekonstrukce noci podle REM oken

**Co:** Ráno po zápisu tě appka provede nocí pozpátku po REM oknech („Okno 4 · 5:20–5:45 · Kde jsi byl?“) jen obecnými otázkami a každý sen přiřadí k oknu s pravděpodobností. Přiřazené časy snů zpětně zpřesňují REM okna pro funkce 1, 3 a 7.

**Proč:**
- Vybavování je prerekvizita lucidity: v LD nocích 2,8 vs 1,7 vybavených snů (ILDIS), efekt TLR jen u lidí s vybavením (Konkoly 2024). `promising`
- Zájem o sny a pozornost k nim vybavování zvyšují (Schredl 2003; Consc Cogn 2012). `promising`
- Vybavování pozpátku od posledního snu: LaBerge & Rheingold 1990. `community`
- Sen při probuzení je důkaz pro REM, ale jen mírný: věrohodnostní poměr ~1,9 (82 vs 43 % vybavení, Nielsen 2000). `strong`
- Konkurence: deníky mají čas zápisu, ne noc s okny.

**Jak v UI:** Svislá noční osa s oranžovými oblouky REM oken, kartičky snů přichycené k času, krokování pozpátku. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Sugesce a konfabulace (otázky jen obecné, nikdy obsahové, rozlišení „jistě“ a „možná“). Prodloužení rána (limit 3 min, kdykoli přeskočit). Falešná přesnost přiřazení (vždy s procenty).

### 6. Test reality při každém probuzení

**Co:** Každé probuzení s appkou (budík WBTB, jemné ťuknutí, ranní otevření) začíná třísekundovým testem se zavřenýma očima: „Sním? Zkus se nadechnout se zavřenými ústy.“ Teprve pak zápis. Ranní zápis má pole „Bylo to falešné probuzení?“ a „Poznal jsi ho?“.

**Proč:** Falešná probuzení jsou při buzení častá: v laboratoři 23,1 % snů a 17 ze 121 snů se stalo lucidními po falešném probuzení (Peters 2026, preprint) `promising`. Návyk vázaný na stálou situaci se automatizuje lépe než návyk na náhodné připomínky (Lally 2010; Wood & Rünger 2016) `strong` obecně. Test dechem se zavřenými ústy používal ILDIS. Komunitní varování „připomínky tě naučí testovat, jen když zazvoní telefon“ tu neplatí, protože probuzení je přesně situace, která se ve snu opakuje `community`. Konkurence: nikdo neváže test na každé probuzení.

**Jak v UI:** První obrazovka po budíku: černá, červený kruh, text „Sním?“, krátká vibrace. Po 3 s „Ne? Tak co se ti zdálo?“. Lze vypnout v Nastavení › Noc. V týdenním přehledu: „Falešná probuzení: 2 · poznal jsi 1“.

**Pracnost:** S.

**Riziko:** Zdržení zápisu o 3 s (zanedbatelné, test je bez otevření očí). U citlivých lidí může častá otázka „sním?“ přiživovat derealizaci, proto ji Štít při zhoršení vypne.

### 7. Jemné ťuknutí v pozdním REM okně

**Co:** Místo celého WBTB 1–2 krátké samovypínací podněty (tichý tón 3 s nebo vibrace telefonu) do pozdních REM oken po 6,5 h spánku. Cíl: na chvilku se vynořit, nehýbat se a zkusit Návrat do snu hned po probuzení (DEILD) nebo dvouminutový záměr vleže. Bez rozsvícení a bez vstávání.

**Proč:** Samovypínací budíky jsou komunitní požadavek č. 2 („skvělé na snadné WILD“, Reddit 2024) `community`. Fyziologicky ověřené přechody z bdění do REM souvisely s LD (Gott 2020) `promising`. DEILD je bez dat `community`. Konkurence: LDAlarm a Lucidity (Curtis) mají samovypínací budíky s pevným časem, na iOS. Na Androidu podle osobních REM oken a s rozpočtem probuzení nikdo.

**Jak v UI:** Přepínač v detailu noci „Jemné ťuknutí“, na orbitě malé body v oknech. Po ťuknutí se nic nerozsvítí. Ráno: „Vzbudilo tě ťuknutí? Ano / Ne / Nevím“ a „Vrátil ses do snu?“.

**Pracnost:** S–M (sdílí model oken a audio s funkcemi 1 a 3).

**Riziko:** Fragmentace: počítá se do rozpočtu probuzení (max 2 ťuknutí za noc, max 3 noci týdně, nikdy v noci s WBTB, nikdy po červené). Spánková paralýza u DEILD a WILD (normalizační karta ze Štítu). U narkolepsie a poruchy spánkové paralýzy vypnuto.

### 8. Zápis poslepu

**Co:** Ranní i noční záznam bez dívání na displej. Po budíku stačí podržet kdekoli na obrazovce a mluvit se zavřenýma očima, haptika potvrdí začátek a uložení. Appka nejdřív chce 3 klíčová slova, pak volné vyprávění. Přepis do češtiny přímo v telefonu (např. whisper.cpp), červený režim, uložení hned do lokální databáze a do Zálohy.

**Proč:** Model aktivace a vybavení předpovídá, že rušení hned po probuzení vybavování snižuje (Koulack & Goodenough 1976) `promising`. Nejdřív klíčová slova, pak detaily je praxe deníků `community`. Ztráta dat je nejsilnější negativní sentiment komunity (Reddit o Awoken) `community`. Konkurence: hlasové zápisy jsou běžné (Lucidity, Lucyd), ale bez toku poslepu a bez offline češtiny.

**Jak v UI:** Celá obrazovka je jedno tlačítko. Hlas: „Řekni tři slova.“ Tři krátké vibrace = uloženo. Pak „Teď celý sen. Pusť tlačítko, až skončíš.“ Přepis se dopočítá později a v deníku je štítek PŘEPIS · ZKONTROLUJ.

**Pracnost:** M (model přepisu, výkon, baterie, testy šepotu).

**Riziko:** Kvalita přepisu šeptané češtiny (změřit chybovost slov na 50 nahrávkách). Soukromí: zvuk nikdy neopouští telefon, volba „smazat nahrávku po přepisu“. Partner v posteli (šepot, vibrace místo zvuku).

### 9. Český průvodce s tvými Stopami snů

**Co:** Audio Záměr poznat sen (MILD) a Střídání smyslů (SSILD) česky, které do vizualizace vloží tvoji aktivní Stopu a plánovanou akci: „Až uvidíš telefon, který nejde vytočit, poznáš, že sníš. Pak se podíváš na ruce.“ Volitelně vlastní hlas: větu záměru si nahraješ sám.

**Proč:** MILD je nejlépe doložená technika (Tan & Fan 2023; ILDIS) `strong`. Protokol: záměr, vizualizace návratu do snu a „všimnutí si něčeho neobvyklého“, předem zvolená akce (LaBerge 2018; ILDIS), aspoň 10 min, bez vnuceného počtu opakování `strong`. SSILD ve znění ILDIS: 4 rychlé a 4–6 pomalých cyklů, celé ~5–7 min, delší technika mírně horší `promising`. Hybrid SSILD a MILD vyšel nejhůř, proto dvě oddělená audia `promising`. Vlastní hlas `community`, bez dat. Žádná z top aplikací nemá doložené české protokolové audio (inference z průzkumu trhu).

**Jak v UI:** Přehrávač s volbou „Záměr poznat sen · 10 min“ a „Střídání smyslů · 6 min“, karta „Dnešní Stopa: telefon“, hlas: ženský, mužský, tvůj. Žádné počítadlo opakování.

**Pracnost:** M (nahrané segmenty, české TTS jen pro název Stopy, skládání stopy).

**Riziko:** Syntetická čeština zní uměle, proto nahrané věty a TTS jen pro jedno slovo. Dlouhé audio prodlužuje usínání: MILD nejvýš 10 min aktivního vedení, SSILD nejvýš 7 min, pak ticho.

### 10. Záměr na noc s ranním ověřením

**Co:** Večer si vybereš, o čem chceš snít (místo, otázka, člověk) a co uděláš, až budeš lucidní. Ráno appka ověří: objevilo se téma? provedl jsi akci? a položí 5 otázek náhledu podle škály LuCiD. Ověřený lucidní sen = provedená plánovaná akce, ne jen pocit.

**Proč:** Inkubace: zhruba polovina studentů si vybavila sen související se zadaným problémem (Barrett 1993) `promising`. Plánovaná akce jako validace bez EEG (LaBerge 2018; Konkoly 2024 s 5 položkami náhledu z LuCiD, Voss 2013) `promising`. Lucidita a kontrola jsou odlišné dimenze, proto zvlášť (Voss 2013). Konkurence: nikdo neváže inkubaci na ověření lucidity.

**Jak v UI:** Večerní karta „Dnešní záměr“ se dvěma poli: „O čem?“ a „Co uděláš, až to poznáš?“. Ráno 3 přepínače a 5 posuvníků 0–10. Štítek OVĚŘENO jen v deníku, žádné body.

**Pracnost:** S.

**Riziko:** Zklamání, když se téma neobjeví. Text: „I ve studii se téma ukázalo zhruba v každé druhé noci.“ Inkubace noční můry se přesměruje na přepis noční můry (IRT).

### 11. Jóga snu napojená na Stopy snů a emoce

**Co:** Denní praxe „Tohle je jako sen“ (20–60 s) se spouští ve chvílích, které odpovídají tvým Stopám (prostředí, děj), a při silné emoci (vnitřní prožitek). Večer krátké „den jako sen“ a záměr, ráno radost z pokroku bez sebekritiky. Vždy s tlačítkem Uzemnit se.

**Proč:** Wangyalovy čtyři základní praxe: změna stop, odstranění lpění a averze, posílení záměru, paměť a radostné úsilí (Wangyal 1998; Norbu 1992; Holecek 2016) `tradition`. Kategorie „vnitřní prožitek“ u LaBerge se kryje s Wangyalovou prací s reakcemi: emoce je zároveň znak snu i předmět praxe `tradition`, `community`. Meditace a LD jen slabá korelace, osmitýdenní MBSR bez efektu (Baird 2019; Gerhardt & Baird 2024) `promising`. Konkurence: jóga snu v aplikacích chybí, nebo je oddělená od deníku.

**Jak v UI:** Výcvik › Jóga snu › „Napojeno na Stopy“. Mini karta při spouštěči: „PROSTŘEDÍ · OBCHOD · Rozhlédni se. Tohle je jako sen.“ Tři kroky: dívej se, poslouchej, vnímej tělo. Tlačítko „Uzemnit se“ (5 věcí vidíš, 4 slyšíš, 3 cítíš).

**Pracnost:** S–M (staví na funkcích 2 a 12 a na existující technice dreamYogaDay).

**Riziko:** Derealizace u zranitelných (Lindahl 2017; Aviram & Soffer-Dudek 2018): formulace „jako sen“, nikdy „nic není skutečné“, max 5× denně, týdenní kontrola Štítu, pauza při zhoršení. Kulturní respekt: „inspirováno bönskou a tibetskou jógou snu“, zdroje, bez vizualizací, které tradice váže na zmocnění.

### 12. Bezpečnostní štít

**Co:** Tichá vrstva, která hlídá spánek a duševní pohodu a sama ubírá intenzitu: rozpočet probuzení (WBTB, ťuknutí, Zvukový klíč), spánkový dluh ze Spánkových dat, týdenní check-in derealizace a depersonalizace (dvě otázky, adaptace CDS-2), automatická sedmidenní pauza indukce, karta ke spánkové paralýze, kontakty na pomoc. Žádné série, žádné tresty.

**Proč:** Záměrně navozené LD predikovaly za 2 měsíce nárůst disociace (β = 0,26) a depersonalizace (β = 0,25), spontánní ne (Aviram & Soffer-Dudek 2018) `promising`. Fragmentace spánku je teoretická obava (Vallat & Ruby 2019; Soffer-Dudek 2020) `promising`. Negativní zážitky se pojí s neúspěšnými pokusy, ne s LD (Mallett 2022) `promising`. CDS-2: dvě položky, při hranici ≥ 3 citlivost 78,9 % a specificita 85,7 % (Michal 2010, malý klinický vzorek, není to diagnóza) `promising`. Spánkovou paralýzu zažije aspoň jednou ~7,6 % lidí (Sharpless & Barber 2011) `strong`. Vynechaný den návyk neruší (Lally 2010), proto žádné série. Konkurence: nikdo nemá automatické snižování intenzity.

**Jak v UI:** Ve Spánku malý štít „Rozpočet probuzení: 1 ze 2 tento týden“. V neděli večer dvě otázky 0–10. Při pauze karta: „Dáme si týden klidu. Vybavování snů a relaxace zůstávají.“ Kontakt: Linka první psychické pomoci 116 123, nonstop, zdarma.

**Pracnost:** S–M.

**Riziko:** Přehnaná medikalizace (krátký jazyk, žádné diagnózy). Obcházení (dovolit vypnutí, ale s potvrzením a bez výčitek). Falešné poplachy (CDS-2 je screening, ne diagnóza).

### 13. Haptický klíč z Garmin hodinek (Connect IQ)

**Co:** Malá Connect IQ aplikace: večer trénink se stejnou vibrací jako klíč, v noci vibrace jen v oknech poslaných z telefonu, pauza při pohybu z akcelerometru hodinek, stisk tlačítka = „Probudilo mě to“. Experimentálně a ve výchozím stavu vypnuto: brána podle tepu (krátkodobá variabilita tepu nad tvou NREM úrovní), se zveřejněnou nejistotou.

**Proč:** Vibrace je jedna z modalit MC v2 (na čele) `promising`. Haptika v Peters 2026 nic nepřidala `promising`, negativní nález. REM z tepu je nejistý (Garmin REM citlivost 33 %, Schyvens 2025). Komunita chce jemný podnět z hodinek a Sleep as Android s Garminem hlásí nefunkční vibrace `community`. Konkurence: Lucid Wake (Wear OS) dělá prahy z HR a RMSSD, na Garminu nic.

**Jak v UI:** Spánek › Zařízení › Garmin › „Haptický klíč“. Na hodinkách jedna černá obrazovka s červeným časem a jedno tlačítko.

**Pracnost:** L (Monkey C, Connect IQ Mobile SDK pro Android, testy na 3–4 modelech).

**Riziko:** Baterie (aplikace v popředí celou noc), možné ovlivnění vestavěného měření spánku Garminem (ověřit na zařízení), vibrace budí, falešná přesnost „detekce REM“.

### 14. Hvězdná mapa: den a sen

**Co:** Volitelný večerní zápis 1–3 událostí dne a toho, jak silně tě zasáhly. Appka hledá, kdy se motivy dne vracejí ve snech: hned (1–2 dny) a se zpožděním 5–7 dní, a kreslí to jako souhvězdí. Výraznou událost nabídne jako možnou budoucí Stopu do večerního záměru.

**Proč:** Kontinuita bdění a snu (Schredl & Hofmann 2003) `promising`. Efekt zpoždění 5–7 dní byl replikován (Nielsen 2004; Blagrove 2011) `promising`. Míra začlenění je nízká a nepředvídatelná, proto vždy „možná“. Konkurence: AI výklady symbolů, ne souvislosti z vlastních dat.

**Jak v UI:** Deník › Hvězdná mapa: vlevo dny, vpravo noci, linky mezi hvězdami. Každá linka má štítek SHODA · 1 DEN nebo SHODA · 6 DNÍ a ukazatel „čekaná náhoda“.

**Pracnost:** M.

**Riziko:** Citlivý obsah (denní zápis je deník života): šifrovat, nikdy v připomínkách. Apofenie: náhodné shody vypadají jako souvislosti, proto permutační kontrola (kolik shod by vyšlo při zamíchání dnů) a zobrazení jen nad touto hladinou.

### 15. Usínací inkubace (zdřímnutí)

**Co:** Režim pro odpolední zdřímnutí ve stylu Dormio: appka připomene téma, při usínání (telefon volně v ruce, změna úchopu z akcelerometru, nebo pevný interval) se tiše zeptá „Co se ti teď honí hlavou?“, nahraje zamumlanou odpověď a pošle tě zpátky. 3–4 kola, pak budík.

**Proč:** Cílená inkubace v usínání zvýšila začlenění tématu a výkon v testech kreativity (Haar Horowitz 2020; Haar Horowitz 2023, Sci Rep, n = 49) `promising`. Pro luciditu netestováno. Pozorování hypnagogie je zároveň průprava pro Vědomé usnutí do snu (WILD) `community`. Konkurence: Dormio je výzkumná rukavice, ne aplikace.

**Jak v UI:** Výcvik › Usínací inkubace: pole „Téma“, délka 20–45 min, volba „telefon v ruce / pevné intervaly“. Ráno, tedy po zdřímnutí, se nahrávky seřadí jako „hypnagogický deník“.

**Pracnost:** M.

**Riziko:** Ruší usínání, proto jen zdřímnutí, nikdy noční spánek. Spánková paralýza u citlivých. Nahrávky citlivé, jen lokálně.

---

## UX specifikace TOP 5

### Společné prvky pro všech pět

**Styl Program 2026.** Den: pozadí #04060C, panel #0C1222, text #E9EDF5, tlumený #8D97AD, akcent #FF5F1F. Titulky Inter Tight, text Inter, štítky JetBrains Mono velkými písmeny (OKNO REM 3 · 04:40–05:05). Karty s rohovými značkami, noc jako oběžná dráha, REM okna jako oranžové oblouky s měkkým okrajem podle nejistoty. Noc: jen #FF3B2F (text, hlavní akce), #B3261E (sekundární), #5A120D (linky, plochy) na čisté černé, bez oranžové a bez bílé, jas displeje minimální.

**Sdílený model: REM profil** (podrobné odvození patří do `algoritmus_rem_cyklu.md`, tady jen to, co potřebují funkce):

```
// p_rem[b] = pravděpodobnost REM v binu b (5 min) od skutečného usnutí, b = 0..120 (0–10 h)
NOCI   = posledních 28 nocí: Oura type == "long_sleep", jinak relace ≥ 4 h
VAHA   = {oura30s: 1.0, oura5min: 0.9, garminHC: 0.5, jinyHC: 0.6}
K0     = 5        // síla populačního prioru p0 v "nocích"
LR_SEN = 1.9      // sen při probuzení: 82 % vs 43 % vybavení (Nielsen 2000)
SIGMA  = {presne: 5, zhruba: 20, nevim: 60}   // minuty, nejistota času snu

pro noc n v NOCI:
  onset = první epocha spánku, po které následuje ≥ 10 min spánku   // ne bedtime_start
  pro bin b: dev[n][b] = podíl epoch REM v binu (pokud zařízení pro noc existuje)
  pro sen s v n s časem T a jistotou j:
     pro b: k = exp(-((b*5 - (T - onset))^2) / (2*SIGMA[j]^2))
            logit(dev[n][b] nebo p0[b]) += k * ln(LR_SEN)     // jen mírný posun
  // dvě zařízení pro stejnou noc: obě noci zvlášť, váhy se sčítají

rem[b]    = Σ_n VAHA[n] * dev[n][b]
celkem[b] = Σ_n VAHA[n]
p_rem[b]  = (rem[b] + K0 * p0[b]) / (celkem[b] + K0)
p_rem     = klouzavý průměr přes 15 min
pas[b]    = 80% interval Beta(rem[b] + K0*p0[b] + 0.5, celkem[b] - rem[b] + K0*(1-p0[b]) + 0.5)
p0        = populační křivka: REM periody zhruba po 90 min, prodlužují se k ránu
```

**Rozpočet probuzení** (hlídá Štít, sdílí 1, 3, 7): WBTB nejvýš 2× za 7 dní a nikdy dvě noci po sobě. Ťuknutí nejvýš 2 za noc a 3 noci za 7 dní, nikdy v noci s WBTB. Dvě hlášení „Probudilo mě to“ za 7 dní přepnou Zvukový klíč do jemného režimu.

---

### TOP 1: Chytré probuzení do snu (WBTB podle REM oken)

**Uživatelský příběh.** Jako nerd s Ourou chci, aby mě budík na Probuzení a návrat do spánku vzbudil, když nejspíš sním, a jen v noci, kdy si to můj spánek může dovolit. Chci si pamatovat živý sen pro Záměr poznat sen, rychle zase usnout a ráno vidět, jestli to vyšlo.

**Vstupní body.**
1. Plán na dnešek: karta „Probuzení do snu“ (jen pokud je den programu ≥ 15 a brána je otevřená).
2. Spánek › REM okna › tlačítko „Naplánovat probuzení“.
3. Večerní „Start noci“ (Dnes): přepínač „Probuzení do snu“.
4. Program: dny s WBTB předvyplní plán, brána ale platí vždy.

**Obrazovky a stavy.**

*A. Karta v Plánu na dnešek*

| Stav | Štítek | Titulek | Text | Akce |
|---|---|---|---|---|
| Povoleno, s daty | DNES MŮŽEŠ · PROBUZENÍ | Probuzení do snu | Tvoje REM okno vychází mezi 4:35 a 5:05. Budík zazní uprostřed. | Naplánovat · Dnes ne |
| Povoleno, bez dat (prázdný) | OBECNÉ OKNO | Probuzení do snu | Tvoje REM okna zatím neznám. Budík dám 5 h po usnutí a za pár nocí to zpřesním. | Naplánovat · Připojit Spánková data |
| Brána zavřená | SPÁNEK PRVNÍ | Dnes bez probouzení | Důvod v čipu, např. „Tento týden už 2×“, „Včera jsi spal 5 h 40 min“, „Ráno červená“. | Záměr ráno, bez budíku |
| Prvních 14 dní | CHRÁNÍME SPÁNEK | Probuzení přijde později | Prvních 14 dní jen vybavování snů. Od 15. dne ti budík nabídnu. | (žádná) |
| Varování (ne zákaz) | POZOR | Po alkoholu bývá REM rozházený | Klidně to zkus, ale okno může sedět hůř. | Naplánovat · Dnes ne |

*B. První použití (jednou, tři řádky a jedno tlačítko)*
- „Budík jen 2× týdně.“
- „Jen když ses vyspal dobře.“
- „Vzbudíš se, vybavíš si sen, 10–20 minut technika a zpátky spát.“
- Tlačítko: „Rozumím“. Pod ním odkaz „Proč zrovna REM?“ (lekce sleepCycles).

*C. Detail plánu (spodní panel)*
- Noční orbita: ulehnutí, odhad usnutí, oblouky REM oken s pásmem nejistoty, značka budíku. Štítek ODHAD · NE MĚŘENÍ.
- Volby: „Technika: Záměr poznat sen (MILD) / Střídání smyslů (SSILD)“, „Bdění: 10 / 20 / 30 min“, „Jemný náběh 30 s“, „Nejpozději v 5:30“.
- Text pod orbitou: „Okno je spočítané z 23 nocí. Oura se trefuje do REM zhruba ve 4 případech z 5.“

*D. Start noci*
- Tlačítko „Jdu spát“ uloží kotvu usnutí. Potvrzení: „Budík kolem 4:50. Posunu ho podle toho, kdy usneš.“
- Když uživatel appku znovu otevře do 2 h: „Ještě nespíš? Posunula jsem budík na 5:10.“ (rod appky podle hlasu značky, jinak neosobně „Budík je posunutý na 5:10.“)

*E. Probuzení (noční režim, jen červená)*
1. Budík s náběhem 30 s, vibrace. Obrazovka: „Sním?“ (funkce 6, 3 s).
2. „Nehýbej se. Co se ti zdálo?“ Tlačítka: „Mám sen“ (otevře Zápis poslepu) · „Nic“.
3. Po zápisu: „Teď Záměr poznat sen. 10 minut, pak usni.“ Spustí se audio (funkce 9).
4. Konec audia: „Zhasni. Usni do 10 minut, bez snahy.“ Tlačítko „Jdu spát“ uloží čas návratu.
5. Probudil se sám do 30 min před budíkem a otevřel appku: „Probudil ses sám. Chceš teď udělat záměr? Budík zruším.“

*F. Ráno (v toku Jak ses vyspal)*
- S daty: „Usnul jsi zpátky asi za 6 min.“ a „Budík zazněl v REM. Podle Oury REM od 4:41.“
- Data ještě nejsou: „Až otevřeš aplikaci Oura, doplním, jak rychle jsi usnul.“
- Pomalý návrat: „Usínal jsi přes 20 minut. Příště zkrátím bdění na 10 minut a necháme zhasnuto.“

*G. Chybové stavy*

| Situace | Text | Akce |
|---|---|---|
| Chybí oprávnění přesných budíků | Bez povolení přesných budíků může budík zazvonit pozdě. Povol je, nebo ho nastavím v Hodinách. | Povolit · Použít Hodiny |
| Budík nezazvonil (telefon vypnutý, úspora) | Budík v noci nezazvonil. Telefon ho nejspíš uspal. | Vypnout optimalizaci baterie |
| Zaspal jsi budík | Budík jsi zaspal. Nevadí, tahle noc se do rozpočtu nepočítá. | (žádná) |
| Zařízení si odporují | Oura a Garmin se neshodnou. Ukazuju obě a okno beru z Oury. | Ukázat obě |
| Oura vrací 403 | Oura neposílá data. Zkontroluj členství nebo přepni na Health Connect. | Přepnout |

**Datový model.**

```
SleepNight {
  id, localDate, tzOffsetMin,
  source: oura30s | oura5min | garminHC | otherHC | manual,
  bedtimeStart, onsetAt, wakeAt, tstMin, efficiency, ouraType,
  hypnogram: { resolutionSec: 30 | 300, stages: "4442233…" },   // 1 hluboký, 2 lehký, 3 REM, 4 bdění
  quality: green | amber | red,           // Jak ses vyspal
  tags: [alkohol, nemoc, cesta, …]
}
WbtbPlan {
  id, nightId, createdAt,
  gate: { open: bool, reasons: [code], warnings: [code] },
  profileNights: int, mode: personal | generic,
  targetOffsetMin, windowStartMin, windowEndMin, pRemAtTarget,
  onsetAnchorAt, onsetEstimateAt, latestAt, alarmAt, alarmChannel: exact | clockApp,
  technique: mild | ssild, wakeDurationMin, rampSec,
  // noc
  firedAt, dismissedAt, recallAtWake: yes | no | skipped, backToBedAt, audioCompletedPct,
  // ráno
  remHit: bool?, stageAtAlarm: 1..4?, returnLatencyMin?, latencyBucket: lt5 | 5to10 | 10to20 | gt20?,
  ldThatNight: bool?, experimentArm?
}
WakeBudget { weekStart, wbtbUsed, tapsUsed, tlrWokeMe, pausedUntil? }
```

**Algoritmus.**

```
funkce brana(dnes):
  duvody = []
  pokud denProgramu < 15:                      duvody += PRVNICH_14
  pokud wbtbZa7Dni >= 2:                       duvody += TYDEN_PLNY
  pokud vcera WBTB nebo ťuknutí:               duvody += VCERA_BUZENI
  pokud jakSesVyspal(dnes) == red:             duvody += CERVENA
  pokud tst(vcera) < 6 h:                      duvody += MALO_SPANKU
  pokud prumerTst(7 dní) < 6.5 h:              duvody += DLUH
  pokud planovanyBudik - planovaneUlehnuti < 7.5 h: duvody += KRATKA_NOC
  pokud bezpecnost.bezProbouzeni:              duvody += BEZPECI
  pokud stit.pauzaDo >= dnes:                  duvody += KLIDOVY_TYDEN
  varovani = []
  pokud "alkohol" v tagyDne:                   varovani += ALKOHOL   // REM rozházený (Ebrahim 2013)
  vrať (duvody.prazdne, duvody, varovani)

funkce cilovyCas(profil):
  pokud profil.noci < 5: vrať (300, generic)            // 5 h, obecné okno
  pro t v 270..390 krok 5:                             // 4,5–6,5 h
     skore[t] = průměr(p_rem[t-10..t]) - 0.15 * p_hluboky[t]   // aspoň 10 min REM, nebudit z hlubokého
  t* = argmax skore
  pokud skore[t*] < 0.30: vrať (300, generic)
  okno = [t* - max(10, sdZacatkuRem), t* + max(10, sdZacatkuRem)]
  vrať (t*, personal, okno)

pri "Jdu spát":
  usnutiOdhad = ted + clamp(median(latenceVecer, 14 nocí), 5, 45 min)
  alarm = min(usnutiOdhad + t*, ranniBudik - 90 min, uzivatelNejpozdeji)
  naplánuj setAlarmClock(alarm) nebo AlarmClock.ACTION_SET_ALARM
pri dalším otevření appky do 2 h: usnutiOdhad = ted + median; přeplánuj

rano po příchodu hypnogramu:
  remHit = REM ≥ 5 min v 10 min před firedAt
  start = backToBedAt (nebo konec audia + 1 min)
  usnul = první okamžik po start, od kterého trvá spánek ≥ 3 min
  latence = usnul - start
  zobrazení: 30s data → „asi N min“, 5min data → koš (do 5, 5–10, 10–20, přes 20)
  adaptace (ILDIS: úprava podle bdělosti):
     latence > 20 min ve 2 ze 3 posledních → wakeDuration = max(5, wakeDuration - 10), bez světla, bez vstávání
     latence < 2 min a bez vybavení ve 2 ze 3 → nabídni delší bdění nebo pár minut světla
  přidej noc do REM profilu (uzavřená smyčka)
```

**Okrajové případy.**
- Pozdní ulehnutí: alarm se posouvá od kotvy, ale nikdy pod 90 min před ranním budíkem. Když nevyjde, plán se zruší: „Dnes by na návrat nezbyl čas. Probuzení přesouvám.“
- Zdřímnutí a rozdělená noc: do profilu jen `long_sleep` nebo relace ≥ 4 h.
- Změna času a cestování: všechny časy v UTC plus offset noci. První 3 noci po změně pásma o ≥ 2 h jen obecné okno.
- Probudil se sám dřív: nabídka záměru a zrušení budíku, noc se počítá do rozpočtu.
- Dvě zařízení: profil z obou s vahami, ranní kontrola zásahu podle zařízení s vyšší vahou.
- Směnný provoz, těhotenství, řízení ráno: v bezpečnostní úrovni „bez probouzení“.
- Oura data dorazí až večer: ranní karta se doplní později, nečeká se.

**Metriky úspěchu.**
- Vybavení snu při buzení: cíl ≥ 70 %.
- Zásah do REM podle zařízení: cíl ≥ 50 % (pevný čas typicky zasáhne zhruba čtvrtinu až třetinu, ověřit na vlastních datech).
- Návrat do spánku do 10 min: cíl ≥ 60 % WBTB nocí.
- LD na WBTB noc: sledovat, nikdy neslibovat (benchmark studií 16–20 %).
- Bezpečnost: 0 porušení rozpočtu. „Jak ses vyspal“ po WBTB nocích v průměru nejvýš o 1 bod horší (0–10) než jindy. Podíl lidí, kteří WBTB vypnou kvůli únavě.

**Jak validovat.**
1. **Zpětné přehrání:** na historických hypnogramech vynechat vždy jednu noc a předpovědět REM v okně. Kalibrační graf (předpověď 40 % ≈ skutečnost 40 %?) a Brierovo skóre proti modelu „pevných 5 h“.
2. **Randomizace v appce** (šablona E7 v Osobní laboratoři): na způsobilých nocích chytré okno vs pevných 5 h. Uživatel vidí jen „mezi 4:20 a 5:30“, takže je zaslepený. Primární výstup: vybavení snu při buzení (častá událost, dobrá síla). Sekundární: zásah do REM, LD.
3. **Malá EEG kontrola:** 2–3 testeři, 5–10 nocí s čelenkou (např. ZMax) proti Ouře a Garminu.

---

### TOP 2: Od Stopy snů ke spouštěči

**Uživatelský příběh.** Opakovaně se mi zdá o škole a o telefonu, který nejde vytočit. Chci, aby z toho appka udělala můj osobní spouštěč na den a cíl Záměru poznat sen na noc a aby mi ukázala, jestli se to do snu opravdu přenáší.

**Vstupní body.**
1. Deník: po uložení snu čip „Tohle se ti zdálo už potřetí“.
2. Deník › Stopy snů (souhvězdí motivů).
3. Realita › Moje spouštěče.
4. Plán na dnešek: „Dnešní Stopa: telefon“.
5. Audio Záměr poznat sen vloží aktivní Stopu (funkce 9).

**Kategorie znaků snů v appce** (podle LaBerge & Rheingold 1990):

| Kategorie | Co sem patří | Příklad Stopy | Šablona spouštěče „když–pak“ |
|---|---|---|---|
| Vnitřní prožitek | emoce, myšlenky, tělesné pocity | panika, spěch, „musím stihnout“ | Když ucítím spěch, zastavím se a zeptám se: Sním? |
| Děj | co se děje a nejde, nemožné akce | telefon nejde vytočit, běh na místě | Když mi něco nefunguje, zeptám se: Sním? |
| Podoba | zvláštní tvary, osoby, předměty | dům se mění, pes mluví | Když uvidím psa, podívám se na něj dvakrát. |
| Prostředí | místo a situace | škola, dětský pokoj | Když vejdu do budovy, rozhlédnu se: Sním? |

**Obrazovky a stavy.**

*A. Stopy snů (souhvězdí)*
- Běžný stav: hvězdy = motivy, velikost = počet nocí za 30 dní, barva okraje = kategorie, linka = motivy ze stejného snu. Štítek u hvězdy: TELEFON · 4 NOCI · DĚJ.
- Prázdný: „Stopy snů se objeví po pár zápisech. Zapiš aspoň 5 snů a já hledám, co se opakuje.“
- První použití: „Stopa snu je motiv, který se ti vrací. Když ho poznáš, poznáš sen.“ Tlačítko „Ukaž mi kategorie“.
- Soukromá Stopa: hvězda se zámkem, „Soukromá. Nikdy v připomínkách.“

*B. Návrh spouštěče (karta)*
- Štítek: STOPA · TELEFON NEJDE VYTOČIT · 4× ZA 30 DNÍ
- Otázka: „Jak často to potkáš ve dne?“ Volby: „Denně“ · „Občas“ · „Nikdy“.
- Návrh: „Když mi v bdění něco nefunguje (telefon, dveře, světlo), zastavím se a zeptám se: Sním?“
- Akce volitelně: „Přidat test: nadechni se se zavřenými ústy.“ (výchozí vypnuto, viz ILDIS)
- Tlačítka: „Přijmout“ · „Upravit“ · „Jiný návrh“.
- Při plných 3: „Máš 3 aktivní spouštěče. Víc jich mozek neudrží. Vyměň jeden.“

*C. Den*
- Rychlá dlaždice v panelu rychlého nastavení a widget „Udělal jsem test“ (jedno klepnutí, bez otevření appky).
- Připomínka je nácvik plánu, ne náhodný test: 1× ráno, volitelně 1× odpoledne. Příklady (≤ 60 znaků, střídají se formy):
  - „Dnes hledej: něco, co nefunguje.“
  - „Kde dnes potkáš svou Stopu?“
  - „Když něco zadrhne, zeptej se: Sním?“

*D. Večer*
- V Záměru poznat sen: „Dnes v noci hledej: telefon, který nejde vytočit.“

*E. Ráno, v zápisu snu*
- Pokud text obsahuje kmen motivu, appka předvyplní: „Objevil se telefon?“ Ano / Ne.
- Při Ano: „Všiml sis, že je to divné?“ → „Udělal jsi ve snu test?“ → „Byl jsi lucidní?“
- Bez shody v textu se neptá (žádné návodné otázky).

*F. Přenos do snu (týdenní pohled)*
- Trychtýř: „Za 30 dní: Stopa ve snu 6× · všiml sis 2× · test ve snu 1× · lucidita 1×.“
- U spouštěče po 21 dnech: „Telefon se ve snech za 3 týdny neobjevil. Vyměníme ho?“

*G. Chybové stavy*

| Situace | Text |
|---|---|
| Zápisy příliš krátké | Ze tří slov Stopy nenajdu. Zkus přidat místo a jednu věc, která byla divná. |
| Připomínky zakázané v systému | Připomínky jsou vypnuté. Spouštěč pořád funguje, jen ti ho nepřipomenu. |
| Motiv z noční můry | Tohle vypadá jako noční můra. Spouštěč z ní nedělám. Chceš ji přepsat? (vede na IRT) |

**Datový model.**

```
DreamSign {
  id, label, category: inner | action | form | context,
  stems: [String], mergedFrom: [id], private: bool, fromNightmare: bool,
  firstSeen, lastSeen, nights30d, distinctWeeks30d, oddity: 0..1,
  score, status: candidate | active | retired | dismissed
}
Trigger {
  id, dreamSignId, ifText, thenText, withTest: bool,
  wakingFrequency: daily | sometimes | never, analogOf?: String,
  activatedAt, reviewAt (= +21 dní), reminderPlan: { morning: bool, afternoon: bool },
  status: active | paused | retired
}
TriggerLog { id, triggerId?, at, kind: noticed | test | reminderOpened }
SignOccurrence {
  dreamId, dreamSignId, confirmedByUser: bool,
  noticedOddity: yes | no | unsure, testInDream: bool, ledToLucidity: bool
}
```

**Algoritmus.**

```
// 1) kandidáti
termy = štítky uživatele (váha 1.0) ∪ podstatná jména z textu po lehkém českém
        stemmingu (Dolamic & Savoy 2009) a odstranění stop slov (váha 0.6)
sloučit synonyma podle uživatelských sloučení

// 2) skóre za 30 dní (počítají se noci, ne zmínky)
noci_w(m) = Σ přes noci s m: 0.5^(stáří_dny / 14)            // poločas 14 dní
oddity(m) = podíl snů s m, kde uživatel označil "divné" nebo text obsahuje
            {nešlo, najednou, nemohl, změnil se, létal}
skore(m)  = noci_w(m) * (1 + 0.5 * oddity(m)) * (kategorie ∈ {action, form} ? 1.2 : 1.0)
kandidát, když nocí30d ≥ 3 a distinctWeeks30d ≥ 2 a nejde o soukromou ani o noční můru

// 3) návrh spouštěče
šablona podle kategorie, doplní se label
pokud wakingFrequency == never: spouštěč z obecnější analogie (škola → "budova",
   dětský pokoj → "dveře doma"), Stopa zůstává jen cílem nočního záměru

// 4) aktivace a revize
max 3 aktivní; reviewAt = +21 dní
při revizi: objevení ve snech == 0 → navrhni výměnu
            objevení ≥ 1 a všimnutí ≥ 1 → ponech
            objevení ≥ 3 a všimnutí == 0 → navrhni silnější plán (přidat test, přidat do audia)

// 5) přenos (bayesovsky, Beta(1,1) pro každý krok trychtýře)
p_vsimnuti = Beta(1 + všiml sis, 1 + objevila se - všiml sis)
zobraz medián a 80% interval až od 3 objevení ve snech
```

**Okrajové případy.**
- Intimní a sexuální motivy: automaticky soukromé, nikdy v připomínce ani na zamčené obrazovce.
- Jména osob: v připomínce jen iniciála nebo obecně („někdo blízký“).
- Trauma a noční můry: nikdy spouštěč, nabídka IRT.
- Málo zápisů: návrhy až po 5 snech a 2 týdnech.
- Slovní tvary a překlepy: stemming a ruční sloučení („telefon“, „mobil“, „telefonu“).
- Spouštěč v kombinaci se Záměrem poznat sen: výchozí bez testu. Varianta s testem je experiment E4.

**Metriky úspěchu.**
- Podíl lidí s ≥ 1 aktivním spouštěčem do 21. dne (cíl ≥ 50 % aktivních uživatelů).
- Přijetí nebo úprava návrhu (cíl ≥ 70 %, měří kvalitu rozpoznání motivů).
- Míra všimnutí si Stopy ve snu: trend za 4 týdny nahoru.
- Podíl LD, které začaly poznáním Stopy.
- Zátěž: „Jak moc tě spouštěče obtěžují?“ 0–10, cíl medián ≤ 3. Míra odmítnutí připomínek ≤ 30 %.

**Jak validovat.**
1. **Přesnost rozpoznání:** 20 testerů ručně označí Stopy v 30 snech, srovnat s automatikou (přesnost, úplnost).
2. **Mikrorandomizace připomínek** (Klasnja 2015): každá plánovaná připomínka se losuje odeslat / neodeslat a forma A / B. Blízký výstup: zaznamenaný test nebo všimnutí do 2 h. Dat je dost (desítky rozhodnutí týdně).
3. **Vzdálený výstup** (všimnutí ve snu, LD): experiment E4 v Osobní laboratoři, dny se spouštěčem vs bez, bloky po týdnech kvůli přenosu mezi dny.

---

### TOP 3: Zvukový klíč (TLR podle Konkolyho pro Android)

**Uživatelský příběh.** Chci vyzkoušet TLR podle publikované studie, česky, s jistotou, že mě to nebude budit víc, než musí. A chci vědět, jestli mi zvuk opravdu pomáhá, nebo jen věřím, že pomáhá.

**Vstupní body.** Výcvik › Techniky › Zvukový klíč (TLR). Plán na dnešek: „Dnes noc se Zvukovým klíčem“. Start noci: přepínač.

**Vstupní podmínky.** Den programu ≥ 15. Vybavený sen aspoň ve 2 ze 7 posledních nocí (Konkoly 2024). Bezpečnostní úroveň povoluje noční podněty. Ne po červené. Souhlas s kontrolními nocemi.

**Parametry** (výchozí = Konkoly 2024 exp. 2, [V] ověřeno v plném textu, [N] náš návrh):

| Parametr | Hodnota |
|---|---|
| Podnět | harfová melodie ~3 s s náběhem a doznivem; kontrolní „cizí zvuk“ = druhá melodie z testu rozlišení [V] |
| Trénink 1. noc | 4× podnět + výzva, pak 12 podnětů v intervalech 45, 70, 55, 65, 70, 80, 65, 60, 75, 75, 90, 120 s [V] |
| Trénink další noci | výzva jen po prvním podnětu, pak 12 podnětů [V pro výzvu, N pro opakování 12] |
| Kalibrace | 1. noc práh slyšitelnosti a práh rozlišení, telefon displejem dolů u polštáře, systémová hlasitost médií na maximum [V] |
| Začátek | nejdřív 6 h po konci tréninku [V]; s REM profilem jen v oknech s p_rem ≥ 0,35 [N] |
| Interval | náhodně 20–40 s [V] |
| Náběh | +0,16 % maximální hlasitosti přehrávače na podnět od prahu rozlišení, jemný režim +0,08 % se stropem na prahu rozlišení [V, jednotka N] |
| Strop | úroveň, při které jsi hlásil zvuk ve snu nebo LD [V] |
| Pauza po pohybu | do 1 min klidu, pak znovu od prahu rozlišení [V] |
| Probudilo mě to | pauza 45 min, v jemném režimu konec na celou noc [V] |
| Konec | 30 min před plánovaným budíkem nebo po 300 podnětech [N] |
| Noc s WBTB | zkrácený trénink po návratu do postele (výzva + 6 podnětů), podněty nejdřív 25 min po „Jdu spát“, jen v oknech [N] |
| Kontrolní noci | bloky po 4 nocích: klíč, klíč, cizí zvuk, ticho, náhodně zamíchané, uživatel neví [V pro design] |

**Obrazovky a stavy.**

*A. Úvod (první použití)*
- „Naučíš se jeden zvuk. Večer ho spojíš s bdělostí. V noci ho potichu pustím do tvých pozdních REM oken.“
- „Někdy tě vzbudí. Proto má strop, pauzy a tlačítko Probudilo mě to.“
- Důkazy, štítek PROMISING: „Ve studii doma pomohl jen ve druhé noci, celkově rozdíl jistý nebyl. Zjistíme, jak funguje u tebe.“
- Souhlas: „Některé noci bude hrát jiný zvuk nebo nic. Nebudeš vědět které. Jen tak poznáme, jestli pomáhá právě tobě.“ Přepínač „Souhlasím“.

*B. Kalibrace (1. noc, vleže, ~3 min)*
- „Polož telefon displejem dolů vedle polštáře.“
- Práh slyšitelnosti (schodiště hlasitosti): „Slyšíš tón?“ Slyším / Neslyším.
- Práh rozlišení: „Jsou ty dva zvuky stejné?“ Stejné / Jiné.
- Hotovo: „Hotovo. Teď trénink, asi 20 minut. Klidně při něm usni.“

*C. Trénink (český hlas, tykání, překlad výzvy Konkoly 2024)*
> „Až uslyšíš tenhle zvuk, staň se lucidním. Obrať pozornost ke svým myšlenkám a všimni si, kam mysl odběhla. (pauza) Teď vnímej tělo, vjemy a pocity. (pauza) Vnímej dech. (pauza) Zůstaň lucidní a kriticky bdělý. Všímej si, čím se tenhle zážitek liší od běžného bdění.“ (45 s ticho)
>
> „Zvuky teď budou pokračovat bez slov. Klidně usni. Při každém zvuku trénuj bdělost.“

*D. Noc (jen červená)*
- Displej zhasne. Trvalé oznámení noční služby: „Zvukový klíč běží · start po 4:10“ s tlačítky „Probudilo mě to“ a „Ukončit“.
- Zvednutí telefonu: noční obrazovka nad zámkem (showWhenLocked): „Probudil tě zvuk?“ Ano / Ne / Nevím. Pak „Spát dál“ / „Vstávám“. Při „Spát dál“ krátký zápis poslepu, pokud byl sen.

*E. Ráno*
- „Slyšel jsi zvuk ve snu?“ Ano / Ne / Nevím.
- „Proměnil se v něco?“ (volné pole, volitelné)
- Lucidita 0–10, kontrola 0–10, plánovaná akce ano / ne, 5 otázek náhledu.
- Kontrolní noc se neprozradí. Odhalení až v kontrolním bodě laboratoře.

*F. Chybové stavy*

| Situace | Text | Akce |
|---|---|---|
| Systém ukončil službu | Noc se přerušila ve 2:14. Telefon ukončil přehrávání. | Vypnout optimalizaci baterie |
| Baterie pod 30 % při startu | Baterie má 24 %. Připoj nabíječku, ať noc vydrží. | Spustit i tak |
| Odpojená sluchátka | Sluchátka se odpojila. Pokračuju přes reproduktor, nebo končím? | Reproduktor · Konec |
| Systémová hlasitost změněna | Hlasitost se v noci změnila. Kalibraci ráno zopakujeme. | (žádná) |
| Režim Nerušit tlumí média | Režim Nerušit ztlumil zvuk. Povol média v Nerušit. | Otevřít nastavení |
| Žádné vybavení 5 nocí | Pět nocí bez vzpomínky na sen. Dáme Zvukovému klíči pauzu a zaměříme se na vybavování. | Rozumím |

**Datový model.**

```
TlrProfile {
  cueSoundId, controlSoundId, hearThreshold: 0..1, discrimThreshold: 0..1,
  cap: 0..1?, rampPerCue: 0.0016 | 0.0008, gentleMode: bool, calibratedAt
}
TlrNight {
  id, nightId, condition: cue | control | silence, blindRevealed: bool,
  trainingStart, trainingEnd, trainingCompletedPct,
  earliestStart, windows: [{start, end, pRem}],
  cues: [{at, level, soundId}],          // u ticha se loguje "virtuální" plán bez zvuku
  movementPauses: [{start, end}], wokeMe: [{at, answer: yes | no | unsure}],
  endReason: plannedEnd | maxCues | wokeMeGentle | userStop | systemKill,
  morning: { heardCue: yes | no | unsure, incorporationText?, lucidity, control,
             plannedActionDone, insight: [5 × 0..10], guessCondition?: cue | other | unsure }
}
```

**Algoritmus.**

```
startNoci():
  podminky = vstupniPodminky() ; pokud ne: zobraz důvod, konec
  podminka = experiment.pridel(noc)                 // klíč / cizí zvuk / ticho, skrytě
  spusť FGS mediaPlayback + PARTIAL_WAKE_LOCK, akcelerometr ~5 Hz
  trenink(prvniNoc ? plny : kratky)                  // vždy stejný, i v kontrolní noci
  earliest = trainingEnd + 6 h
  okna = profil.noci ≥ 5 ? oknaNad(p_rem, 0.35, od=earliest, do=budik-30min)
                         : [earliest, budik-30min]

  hlasitost = discrimThreshold ; pocet = 0
  smyčka dokud ted < budik - 30 min a pocet < 300:
     pokud ted mimo okna: spi do začátku dalšího okna ; hlasitost = discrimThreshold ; pokračuj
     pokud pohybOdPoslednihoPodnetu(): čekej, dokud 60 s bez pohybu ; hlasitost = discrimThreshold ; pokračuj
     pokud wokeMe(): pokud gentleMode: konec noci, jinak čekej 45 min od "Spát dál" ; hlasitost = discrimThreshold
     zvuk = podminka == cue ? cueSound : podminka == control ? controlSound : NIC
     přehraj(zvuk, hlasitost) ; loguj(ted, hlasitost) ; pocet += 1
     strop = gentleMode ? discrimThreshold : (cap ?? 1.0)
     hlasitost = min(hlasitost + rampPerCue, strop)
     čekej náhodně 20–40 s

detekce pohybu:
  první 10 min klidu po tréninku → šum = medián |a - g|, MAD
  pohyb = |a - g| > medián + 6 * MAD po dobu ≥ 1 s

ráno, učení stropu (jen v nocích s klíčem):
  pokud heardCue == yes a (lucidita ≥ 5 nebo incorporationText):
     cap = úroveň posledního podnětu před časem probuzení ze snu (z ranního zápisu),
           jinak 80. percentil úrovní té noci
  pokud wokeMe == yes: cap = 0.8 * úroveň při probuzení
  pokud wokeMe ≥ 2 za 7 dní: gentleMode = true (Štít)
```

**Okrajové případy.**
- Partner v posteli: volba sluchátek do spánku s varováním, že tlačí. Nebo jen Haptický klíč (funkce 13).
- Tinnitus nebo citlivost na zvuk: kalibrace jinými tóny, možnost vypnout.
- Telefon spadne z postele: pohyb → pauza, náraz → ranní dotaz.
- Hluk okolí, šum ventilátoru: kalibrovat v obvyklém prostředí. Volitelná tichá zvuková kulisa, nikdy tichá smyčka.
- Noc s WBTB: zkrácený trénink a pozdější start, rozpočet se nepočítá dvakrát.
- Noc ticha: služba běží stejně, loguje pohyb, uživatel pozná rozdíl jen sluchem v bdění. Proto ranní tip podmínky (kontrola zaslepení).

**Metriky úspěchu.**
- „Probudilo mě to“: cíl ≤ 0,2 hlášení na noc.
- Pohyb po podnětu vs v noci ticha: rozdíl menší než v Konkoly 2024 (0,19 vs 0,10).
- Hlášení „slyšel jsem zvuk ve snu“: v nocích s klíčem vs ticha (rozdíl = skutečné začlenění, ticho = falešná hlášení).
- LD: klíč vs kontroly (Osobní laboratoř, šablona E3).
- Retence 7 nocí: cíl nad 12 % z Konkoly 2024.
- Spánek: „Jak ses vyspal“ v nocích s klíčem nejvýš o 1 bod horší než v nocích ticha.

**Jak validovat.**
1. Vestavěný zaslepený design (bloky klíč, klíč, cizí zvuk, ticho). Výsledek po 10 a 20 nocích na podmínku.
2. Kontrola zaslepení: podíl správných ranních tipů. Nad 70 % = zaslepení nefunguje, výsledek ber s rezervou.
3. Agregace dobrovolných exportů od beta testerů (ruční export ze Zálohy, anonymizovaný) proti benchmarkům Konkoly 2024.
4. Technický test 30 nocí na 5 telefonech: přežití služby, baterie, přesnost intervalů.

---

### TOP 4: Osobní laboratoř (experimenty N-of-1)

**Uživatelský příběh.** Jsem nerd a nechci věřit fórům. Chci si na sobě poctivě ověřit, jestli mi víc sedí Záměr poznat sen, nebo Střídání smyslů, a jestli Zvukový klíč dělá něco víc než moje očekávání. Chci výsledek, kterému můžu věřit, i když to bude „zatím nevíme“.

**Vstupní body.** Výcvik › Osobní laboratoř. Plán na dnešek po 21. dni: „Chceš zjistit, co ti sedí víc?“ Zvukový klíč (automaticky šablona E3). Týdenní přehled (stav běžících experimentů).

**Šablony experimentů.**

| Id | Otázka | Varianty | Způsobilé noci | Slepé? | Primární výstup |
|---|---|---|---|---|---|
| E1 | MILD, nebo SSILD při ranním probuzení? | Záměr poznat sen / Střídání smyslů | každá noc | ne | LD noc |
| E2 | MILD, nebo SSILD po WBTB? | totéž po WBTB | jen WBTB noci (pomalé) | ne | LD noc |
| E3 | Pomáhá mi Zvukový klíč? | klíč / cizí zvuk / ticho | noci se Zvukovým klíčem | ano | LD noc, začlenění zvuku |
| E4 | Pomáhají mi denní spouštěče? | dny se spouštěči / bez | týdenní bloky | ne | všimnutí Stopy ve snu, LD |
| E5 | Kolik bdění při WBTB? | 10 / 30 min | jen WBTB noci | ne | návrat do 10 min, LD |
| E6 | Která forma připomínky? | forma A / B (mikrorandomizace) | každé rozhodnutí | ano | test do 2 h |
| E7 | Chytré okno, nebo pevných 5 h? | chytré / pevné | jen WBTB noci | ano | vybavení snu při buzení |

**Statistika (jádro funkce).**

*Model.* Pro každou variantu c: y_c = počet nocí s LD, n_c = počet provedených nocí. Lucidní noc = lucidita ≥ 5 na škále 0–10 nebo provedená plánovaná akce (víc LD za noc se počítá jako jedna noc, počet se ukládá zvlášť).

- Prior pro obě varianty stejný: **Beta(1, 9)**. Průměr 10 %, váha 10 nocí, 95% interval zhruba 0,3–34 %. Odpovídá literatuře: spontánně ~4 % nocí (LaBerge 2018), nejlepší domácí kombinace 16–20 % (NALDIS, ILDIS), TLR doma ~10–15 % (odhad autora studie). Rozsah 5–15 % LD nocí u praktikujících tedy pokrývá střed prioru.
- Personalizace: po výchozím týdnu (7 nocí bez techniky, jako NALDIS a ILDIS) se střed prioru m posune na tvůj odhad, váha zůstává 10: α0 = 10m, β0 = 10(1 − m), m oříznuté na 3–25 %. Stejný prior pro obě varianty znamená, že nic nezvýhodňuje a jen tlumí náhodné rozdíly.
- Posterior: p_c ~ Beta(α0 + y_c, β0 + n_c − y_c).
- Rozdíl d = p_A − p_B. **ROPE = ±0,05** (5 nocí ze 100, tedy 1 LD za 20 nocí). Menší rozdíl na jednom člověku nepoznáme a pro rozhodnutí nemá cenu (Kruschke 2018).
- Výpočet: P(d > 0), P(d > 0,05) a P(|d| < 0,05) Monte Carlem (20 000 dvojic tahů Beta přes dva tahy Gamma, pevný seed, na telefonu milisekundy). Pro celočíselné parametry jde i přesný vzorec pro P(p_B > p_A) jako součet beta funkcí.

*Rozhodovací pravidla v kontrolních bodech* (10, 20, 30, 40 nocí na variantu, mezi nimi se nic nevyhodnocuje):

| Stav | Pravidlo | Text v appce |
|---|---|---|
| Sbíráme | < 10 nocí na variantu | Sbíráme data. 7 z 10 nocí. Výsledek ukážu po 10. |
| Zatím nevíme | žádné pravidlo níž | Zatím nevíme. Rozdíl může být oběma směry. |
| Naznačení | P(d > 0) ≥ 0,80 | Naznačení: spíš Střídání smyslů. Pozor, zhruba jedno ze šesti takových naznačení je náhoda. |
| Vychází lépe | P(d > 0) ≥ 0,90 a P(d > 0,05) ≥ 0,70 | Střídání smyslů ti vychází lépe. Rozdíl nejspíš 3 až 22 lucidních nocí ze 100. |
| Prakticky stejné | P(\|d\| < 0,05) ≥ 0,80 | Obě varianty ti fungují prakticky stejně. Vyber, co tě baví. |
| Nerozhodnuto | 40 nocí na variantu bez verdiktu | Rozdíl je menší, než umíme poznat. Vyber tu, která tě baví a míň ruší spánek. |

*Kolik nocí je potřeba* (vlastní simulace, 1 500–2 000 opakování, prior Beta(1, 9)):

| Skutečný stav | 12 nocí na variantu | 20 nocí | 30 nocí | 45 nocí |
|---|---|---|---|---|
| 20 % vs 8 % LD nocí: šance na „vychází lépe“ (P ≥ 0,90) | 25 % | 40 % | 51 % | 63 % |
| 17 % vs 5 % | 22 % | 41 % | 58 % | 71 % |
| 15 % vs 10 % | 11 % | 19 % | 23 % | 28 % |
| 12 % vs 12 % (žádný rozdíl): falešný verdikt | 5 % | 9 % | 8 % | 9 % |
| 12 % vs 12 %: falešné „naznačení“ (P ≥ 0,80) | 13–16 % | 18 % | 18 % | 18 % |

Pracovní příklad: 4 LD ze 15 nocí vs 1 z 15 dá P(d > 0) = 0,91, P(d > 0,05) = 0,78, 90% interval rozdílu −3 až +28 bodů. Verdikt „vychází lépe“, ale s širokým rozptylem. 2 z 10 vs 2 z 10 dá P(d > 0) = 0,50: zatím nevíme.

*Poctivý závěr pro UI:* na lucidní noc jako jediný výstup N-of-1 pozná jen velké rozdíly, a i ty často až po 30–45 nocích na variantu. Proto:
- **Pomocné výstupy s větší silou** (vždy vedle hlavního, nikdy místo něj): vybavené sny za noc (model Gamma-Poisson, prior Gamma(2, 1)), „záblesk lucidity“ (lucidita ≥ 2 z 10, častější událost), všimnutí si Stopy ve snu, návrat do spánku do 10 min. Při rozdílu 40 vs 20 % nocí se zábleskem dá 20 nocí na variantu šanci ~70 % na P ≥ 0,80.
- **Mikrorandomizace** tam, kde je hodně rozhodnutí: formy připomínek (E6) mají desítky rozhodnutí týdně a blízký výstup (test do 2 h), takže výsledek přijde do 2–3 týdnů. Přidělování Thompsonovým výběrem s podlahou 20 % pro každou formu, aby se nepřestala zkoušet.
- **Rozhodnutí při shodě:** když data nerozhodnou, rozhoduje radost a dopad na spánek. To je platný výsledek, ne selhání.

*Randomizace a návrh.*

```
pridel(noc, experiment):
  pokud noc nezpůsobilá (šablona, Štít, brána WBTB): žádné přidělení
  vrstva = víkend ? "vikend" : "vsedni"           // stratifikace: víkendy spíš delší spánek
  blok = experiment.bloky[vrstva].aktualni
  pokud blok prázdný:
     blok = zamichej(varianty × opakovani, seed = hash(experimentId, vrstva, cisloBloku))
     // E1, E2, E5, E7: blok 2 nocí (AB nebo BA); E3: blok 4 nocí (klíč, klíč, cizí, ticho)
  varianta = blok.pop()
  uloz NightAssignment(skryto = experiment.slepy)
  vrať varianta
```

*Přenos mezi nocemi (carryover).*
- **Spánek:** WBTB nikdy dvě noci po sobě. Noc po WBTB nese příznak a v citlivostní analýze se vynechá. Experimenty o WBTB porovnávají jen WBTB noci mezi sebou.
- **Učení:** techniky se zlepšují praxí, takže efekt není vratný. Bloky po 2 nocích zajistí, že obě varianty pokrývají stejné období. Kontrola trendu: srovnání první a druhé poloviny. Když se směr otočí, štítek „Výsledek se mění v čase“.
- **Asociace u Zvukového klíče:** trénink probíhá každou noc stejně, kontrolní noci tedy měří efekt samotného zvuku ve spánku nad tréninkem (stejná logika jako Konkoly 2024).
- **Denní spouštěče (E4):** přenos mezi dny je pravděpodobný, proto týdenní bloky a první den bloku se nepočítá.

*Očekávání.*
- Každý večer jedna otázka: „Jak moc věříš, že dnes budeš lucidní? 0–10.“ Když se průměr mezi variantami liší o ≥ 2 body, výsledek dostane štítek „Může jít o očekávání“.
- Slepé experimenty (E3, E6, E7): ranní tip „Myslíš, že dnes hrál tvůj klíč?“ Podíl správných tipů nad 70 % = zaslepení nefunguje.
- Varianty, které zaslepit nejde (E1, E2, E4, E5): výsledek vždy s poznámkou „Věděl jsi, co děláš. Část rozdílu může být víra.“
- Průběžné výsledky se nezobrazují mezi kontrolními body. Brání to motivačnímu driftu i honbě za „vítězem“.

*Dodržení.* Noc se počítá, když varianta proběhla (audio dokončeno ≥ 80 % nebo potvrzení). Vedle toho pohled „včetně vynechaných“ (záměr léčit). Když vypadne víc než 30 % přidělených nocí: „Hodně vynechaných nocí. Výsledek bude slabší.“

**Obrazovky a stavy.**
- *Prázdný:* „Laboratoř je prázdná. Vyber otázku, kterou chceš na sobě ověřit.“ Pod tím 3 šablony.
- *Průvodce:* Otázka → Varianty → Co budeme měřit → Jak dlouho (odhad týdnů podle způsobilých nocí) → Souhlas. Text délky: „Na rozdíl jedné lucidní noci z deseti potřebuješ zhruba 30–45 nocí na každou variantu. Menší rozdíl na sobě nepoznáš.“
- *Běží:* orbita s body nocí (vyplněné = provedené, prázdné = vynechané), „12 / 20 nocí na variantu“, „Další výsledek po 20. noci“.
- *Výsledek:* dvě křivky hustoty (oranžová a tlumená), pod nimi jedna věta podle tabulky pravidel a řádek četností: „Ze 100 nocí: Střídání smyslů asi 23, Záměr poznat sen asi 10.“ Odkaz „Jak to počítám“ (prior, ROPE, simulace).
- *Chyba:* „Tenhle experiment potřebuje noci s probuzením. Ty máš teď v klidovém týdnu. Pokračujeme po něm.“ a „Změnil jsi techniku uprostřed noci. Tuhle noc nepočítám.“

**Datový model.**

```
Experiment {
  id, templateId, question, arms: [ArmId], blinded: bool, stratifyWeekend: bool,
  blockSize, prior: {alpha0, beta0}, rope: 0.05, primaryOutcome, secondaryOutcomes: [..],
  checkpoints: [10, 20, 30, 40], maxNightsPerArm: 40,
  startedAt, status: running | paused | finished | abandoned, seedBase
}
NightAssignment {
  experimentId, nightId, stratum, blockIndex, arm, hidden: bool, revealedAt?,
  eligible: bool, adhered: bool, adherenceSource: audio | manual,
  expectancy: 0..10, guessArm?: arm | unsure, carryoverFlag: bool
}
Outcome { nightId, ld: bool, ldCount, glimpse: bool, recallCount, signNoticed: bool?, returnLatencyBucket? }
CheckpointResult {
  experimentId, at, nPerArm, pAgtB, pAgtBplusRope, pEquivalent, d90: [lo, hi],
  verdict: collecting | unknown | hint | better | equivalent | undecided, flags: [expectancy, trend, blindingBroken, lowAdherence]
}
```

**Okrajové případy.** Nemoc, cesta, alkohol: noc se označí a volitelně vyřadí (rozhodnutí před odhalením). Uživatel chce nakouknout dřív: dovoleno jen se štítkem „Předčasný pohled, zvyšuje riziko omylu“. Dva experimenty najednou: jen pokud se varianty nepletou (E1 a E6 ano, E1 a E2 ne). Smazání nocí: experiment se přepočítá, smazání se loguje. Víc LD za noc: binární výstup 1, počet zvlášť.

**Metriky úspěchu.** Podíl spuštěných experimentů, které dojdou do 2. kontrolního bodu (cíl ≥ 40 %). Pochopení: 5 testerů vlastními slovy vysvětlí obrazovku výsledku (cíl 4 z 5 správně). Zaslepení: správné tipy blízko náhody. Spokojenost: „Dozvěděl ses o sobě něco?“ 0–10.

**Jak validovat.**
1. **Simulace v CI:** při nulovém rozdílu nesmí verdikt „vychází lépe“ přesáhnout 10 % napříč kontrolními body. Při 20 vs 8 % a 30 nocích musí síla vyjít kolem 50 %.
2. **Jednotkové testy** posteriorů proti známým hodnotám Beta rozdělení.
3. **Test srozumitelnosti** se 5–8 lidmi: tři varianty výsledkové obrazovky (procenta, četnosti, křivky).

---

### TOP 5: Rekonstrukce noci podle REM oken

**Uživatelský příběh.** Ráno si pamatuju jen poslední sen. Chci, aby mě appka provedla nocí pozpátku po REM oknech, abych si vybavil víc, a aby každý sen dostal svůj čas. Chci, aby se tím moje REM okna zpřesňovala.

**Vstupní body.**
1. Po ranním zápisu v toku Jak ses vyspal: „Projít noc“.
2. Deník › den › Mapa noci.
3. Jedna připomínka denně nejvýš, když dorazí data: „Noc je nahraná. Chceš ji projít?“

**Obrazovky a stavy.**

*A. Mapa noci (běžný stav)*
- Svislá osa od ulehnutí po probuzení. REM okna jako oranžové oblouky, šířka podle nejistoty. Hypnogram jako tenká stopa (dvě stopy, když jsou dvě zařízení).
- Kartičky snů přichycené k času: „SEN 2 · 04:55 ± 20 MIN · NEJSPÍŠ OKNO 3 (72 %)“.
- Značky událostí: budík WBTB, ťuknutí, Zvukový klíč, „Probudilo mě to“.

*B. Krokování pozpátku (průvodce, max 3 min)*
- Start: „Začneme od konce. Poslední okno bylo 5:20–5:45.“
- Pro každé okno od posledního: „OKNO 4 · 05:20–05:45. Kde jsi byl?“ Pak „Kdo tam byl?“, „Co jsi dělal?“, „Jak ti bylo?“, „Jaké tam bylo světlo?“. Každá otázka má „Nic“ a „Přeskočit“.
- Odpovědi: „Jistě“ · „Možná“. Ke snu se uloží s touto jistotou.
- Mezi okny: „Co bylo těsně před tím?“
- Konec: „Hotovo. Dnes 3 sny, minulý týden v průměru 1,4.“

*C. Čas snu v zápisu*
- „Kdy ses z něj probudil?“ Čipy: „Teď ráno“ · „Při budíku“ · „V noci kolem…“ (kolečko po 15 min) · „Nevím“.
- Jistota: „Přesně“ · „Zhruba“ · „Nevím“ (5, 20, 60 min).
- Předvyplnění z událostí appky (budík WBTB, „Probudilo mě to“, otevření appky v noci). Jiná data telefonu se nečtou.

*D. Stavy*

| Stav | Text |
|---|---|
| Prázdný (bez Spánkových dat) | Bez Spánkových dat ukážu obecné cykly po 90 minutách. Je to šablona, ne tvoje noc. |
| První použití | Projdeme noc od konce. Ptám se jen obecně, abych ti nic nevnutil. |
| Data ještě nejsou | Čekám na data z Oury. Otevři aplikaci Oura, pak se noc nakreslí. |
| Zařízení si odporují | Oura a Garmin vidí noc jinak. Ukazuju obě stopy. |
| Žádný sen | Dnes nic. To je normální, i nic je záznam. Zítra večer si řekni, že si sen zapamatuješ. |
| Chyba dat | Noc z Oury je kratší než 3 hodiny. Okna z ní nekreslím. |

**Datový model.**

```
DreamEntry (rozšíření) {
  id, nightId, order, wokeAt?, wokeAtSource: user | wbtbAlarm | tapEvent | tlrWokeMe | appOpen,
  timeConfidence: exact | rough | unknown, sigmaMin,
  recallMode: freeLog | guidedWindow, windowId?, items: [{prompt, text, certainty: sure | maybe}],
  falseAwakening: bool, recognisedFalseAwakening: bool?,
  lucidity: 0..10, control: 0..10, plannedActionDone: bool?, heardCue?: yes | no | unsure
}
NightMap {
  nightId, windows: [{id, start, end, pRemPeak, band80: [lo, hi], source}],
  assignments: [{dreamId, windowId?, prob, method: timeOnly | timeAndProfile}],
  guidedSession: { startedAt, finishedAt, windowsVisited, itemsAdded, skipped }
}
```

**Algoritmus.**

```
okna noci:
  s hypnogramem: souvislé úseky REM ≥ 5 min, úseky blíž než 10 min sloučit
  bez hypnogramu: okna z REM profilu (p_rem ≥ 0.35), štítek "odhad"
  bez profilu: šablona cyklů po 90 min, štítek "šablona"

přiřazení snu k oknu:
  pro okno w: l(w) = N(wokeAt; konec(w), sigma)        // sen se vybaví z REM těsně před probuzením
  prior(w) = délka(w) / Σ délek                         // delší ranní okna častěji
  prob(w) = l(w) * prior(w) / Σ_v l(v) * prior(v)
  pokud max prob < 0.5: "nejisté přiřazení", bez okna
  probuzení bez REM okna blízko (zařízení říká lehký spánek): přiřadit "mimo REM", i to je informace

zpětná vazba do REM profilu:
  každý sen s časem → důkaz LR_SEN = 1.9 kolem wokeAt (viz společný model)
  snům s certainty "maybe" poloviční váha

průvodce pozpátku:
  okna seřadit od posledního; max 4 okna; max 5 obecných otázek na okno
  časový limit 3 min, pak "Chceš pokračovat?"
  zákaz obsahových otázek: nikdy nenabízet motivy ze Stop snů ani z minulých snů
```

**Okrajové případy.**
- Falešné probuzení (sen o probuzení): čas probuzení je nejistý, výchozí jistota „Nevím“.
- Několik snů z jednoho probuzení: pořadí uvnitř okna, všem stejný čas.
- Sen z WBTB probuzení, zařízení ukazuje bdění: přiřadit k oknu před budíkem, zařízení často značí probuzení posunutě.
- Zdřímnutí: vlastní malá mapa, do nočního profilu nepatří.
- Uživatel zapisuje až odpoledne: průvodce nenabízet (vzpomínky po hodinách slábnou a roste riziko domýšlení), jen přiřazení času.

**Metriky úspěchu.**
- Vybavené sny za ráno: nárůst proti vlastnímu výchozímu týdnu.
- Podíl snů s časem: cíl ≥ 60 %.
- Doba průvodce: medián ≤ 3 min. Podíl přeskočení.
- Kalibrace REM profilu: chyba předpovědi času REM oken klesá s počtem přiřazených snů.
- Radost: „Bavilo tě projít noc?“ 0–10.

**Jak validovat.**
1. **Mikrorandomizace rán:** ráno se losuje „nabídnout průvodce“ vs „běžný zápis“. Výstup: počet vybavených snů (Gamma-Poisson). Počet položek se štítkem „Možná“ jako ukazatel rizika domýšlení.
2. **Kvalita přiřazení:** u testerů s 30s hypnogramem srovnat přiřazení z času probuzení s okny ze zařízení (podíl snů s prob ≥ 0,5).
3. **Kvalitativně:** 5 rozhovorů o tom, jestli otázky působí návodně.

---

## Co tyhle funkce nesmí slibovat (pravidla textů)

- Nikdy „lucidní sen na povel“, „dnes v noci určitě“ ani procenta ze studií bez kontextu. Správně: „Ve studiích vycházela nejlepší kombinace zhruba na 1 noc z 5–6, u začátečníků spíš za týdny.“
- REM okna jsou vždy „odhad“. Nikdy „Oura ví, kdy sníš“.
- Zvukový klíč: „slibné, doma zatím nepotvrzené“. Kontrolní noci jsou součást poctivosti, ne skrytý trik.
- Žádné série, žádné body za probuzení, žádná doporučení léků a doplňků.
- Jóga snu: „jako sen“, nikdy „nic není skutečné“. Zdroje uvést, nevydávat za předání tradice.

## Zdroje

- Aspy D. a kol. 2017, Dreaming (NALDIS), doi:10.1037/drm0000059
- Aspy D. 2020, Front Psychol (ILDIS), PMC7379166
- Aviram L., Soffer-Dudek N. 2018, Front Psychol, PMC5875414
- Baird B. a kol. 2019, Sci Rep, PMC6490164
- Barrett D. 1993, Dreaming 3(2):115–122 (The committee of sleep)
- Blagrove M. a kol. 2011, PLoS One 6:e25121 a Conscious Cogn (efekt zpoždění snů)
- Carr M. a kol. 2023, Psychology of Consciousness 10(4):413–430
- Dolamic L., Savoy J. 2009, Information Processing & Management (český stemming)
- Ebrahim I. O. a kol. 2013, Alcohol Clin Exp Res (alkohol a spánek)
- Einstein G. O., McDaniel M. A. 1990, J Exp Psychol Learn Mem Cogn; McDaniel M. A., Einstein G. O. 2000, Appl Cogn Psychol
- Erlacher D., Stumbrys T. 2020, Front Psychol; Erlacher D. a kol. 2022, PMC9149976
- Genc 2025, magisterská práce UNIGE (TLR přes Oniri)
- Gerhardt, Baird 2024, PMC11120098
- Gigerenzer G., Hoffrage U. 1995, Psychol Rev (přirozené četnosti)
- Gollwitzer P. M., Sheeran P. 2006, Adv Exp Soc Psychol; Sheeran P., Listrom O., Gollwitzer P. M. 2024, Eur Rev Soc Psychol
- Gott J. a kol. 2020, PubMed 32768920
- Haar Horowitz A. a kol. 2020, Conscious Cogn (Dormio); Haar Horowitz A. a kol. 2023, Sci Rep, PMID 37188795
- Holecek A. 2016, Dream Yoga; Norbu N. 1992, Dream Yoga and the Practice of Natural Light; Wangyal T. 1998, The Tibetan Yogas of Dream and Sleep
- Klasnja P. a kol. 2015, Health Psychol, PMID 26651463 (mikrorandomizované studie)
- Konkoly K. a kol. 2021, Curr Biol, PMC8162929; Konkoly K. a kol. 2024, Conscious Cogn, PMC11542932
- Koulack D., Goodenough D. R. 1976, Psychol Bull, doi:10.1037/0033-2909.83.5.975
- Kravitz R. L., Duan N. (eds.) 2014, Design and Implementation of N-of-1 Trials, AHRQ
- Kruschke J. K. 2018, Adv Methods Pract Psychol Sci (ROPE)
- LaBerge S., Rheingold H. 1990, Exploring the World of Lucid Dreaming
- LaBerge S., LaMarca K., Baird B. 2018, PLoS One
- Lally P. a kol. 2010, Eur J Soc Psychol, doi:10.1002/ejsp.674
- Lindahl J. R. a kol. 2017, PLoS One, PMC5443484
- Mallett R. a kol. 2022, PMC10104404
- Michal M. a kol. 2010, Psychother Psychosom Med Psychol 60(5):175–179 (CDS-2)
- Nielsen T. A. 2000, Behav Brain Sci 23:851–866 (vybavení z REM a NREM)
- Nielsen T. A. a kol. 2004, J Sleep Res (efekt zpoždění snů)
- Oudiette D., Paller K. A. 2013, Trends Cogn Sci; Rudoy J. D. a kol. 2009, Science (cílená reaktivace paměti)
- Peters a kol. 2026, bioRxiv (preprint, falešná probuzení a lucidita)
- Picard-Deland C. a kol. 2026, bioRxiv v2 (MC v2, preprint)
- Robbins R. a kol. 2024, Sensors 24(20):6532, PMC11511193
- Schork N. J. 2015, Nature (one-person trials)
- Schredl M. 2003 (vybavování snů); Schredl M., Hofmann F. 2003, Conscious Cogn (kontinuita); Schredl 2025, IJoDR
- Schyvens A.-M. a kol. 2025, Sleep Advances, PMC12038347
- Sharpless B. A., Barber J. P. 2011, Sleep Med Rev (prevalence spánkové paralýzy)
- Soffer-Dudek N. 2020, PMC6993576; Vallat R., Ruby P. 2019, PMC6874013
- Tan S., Fan J. 2023, J Sleep Res, doi:10.1111/jsr.13786
- Voss U. a kol. 2013, Conscious Cogn (LuCiD), doi:10.1016/j.concog.2012.11.001
- Wood W., Rünger D. 2016, Annu Rev Psychol (návyky)
- Yu a kol. 2025, PMC11806271 (zpětná vazba jako herní prvek)
- Technické: Oura API v2, specifikace OpenAPI 1.42 a stránka Authentication (cloud.ouraring.com, staženo 23. 10. 2026); Android Developers: Health Connect Read data, Android 14 behavior changes, AlarmClock; Garmin Developers: Connect Developer Program Overview, Connect IQ API Toybox.Background, Toybox.Sensor, Toybox.Attention; DC Rainmaker 21. 10. 2026 (nové úrovně Garmin API); Google Android Developers Blog 2023 a Notebookcheck 2025 (Oura a Garmin v Health Connect); Linka první psychické pomoci 116 123 (MV ČR).
