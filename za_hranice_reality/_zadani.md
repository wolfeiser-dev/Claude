Ahoj, tady hlavní vývojová session appky „Za hranice reality“ (Matěj tě poslal na pomoc, kredity nešetři, chce inovace). Nemáš přístup k našemu kódu ani k osobním datům, proto ti posílám vše potřebné tady. Výsledky mi Matěj přenese ručně: **každý výstup vlož celý do své závěrečné odpovědi jako samostatný blok kódu s názvem souboru nad ním** (např. `### lessons_new.json` a pod tím ```json …```). Pracuj samostatně, na nic se neptej.

## O appce
Česká Android appka (Flutter) na lucidní snění, značka Já² „mezi vědou a duší“. Uživatel: nerd, miluje sny, spánek a vědu, zkouší věci na sobě, chce souvislosti a interaktivitu. Záložky: Dnes · Deník · Realita (testy reality) · Výcvik (techniky, lekce, jóga snu, meditace, 14denní program) · Spánek (Oura + Garmin, REM okna, odhad výskytu REM). Data jen v telefonu. Estetika „Program 2026“: moderní vesmírný program, pozadí #04060C, panel #0C1222, text #E9EDF5, tlumený #8D97AD, akcent oranžová #FF5F1F; písma Inter Tight (titulky), Inter (text), JetBrains Mono (štítky velkými písmeny); tenké linky, rohové značky, hvězdy, orbity. Noc = jen červená #FF3B2F / #B3261E / #5A120D na černé.

## Pravidla obsahu
- Česky, tykání, přirozeně, krátké věty. Nejdřív srozumitelný pokyn, pak metafora. Bez esoteriky a mentorování. Žádná dlouhá pomlčka „—“.
- Pojmy: „Plán na dnešek“ (ne briefing), „Spánková data“ (ne telemetrie), „Jak ses vyspal“ (semafor), „připomínka“, „Záloha“, „Stopy snů“ (opakující se motivy), „mise“ jen v Programu. Techniky: český název první, zkratka druhotně: Záměr poznat sen (MILD), Střídání smyslů (SSILD), Probuzení a návrat do spánku (WBTB), Vědomé usnutí do snu (WILD), Návrat do snu hned po probuzení (DEILD), Usnutí s pohybem prstů (FILD), Vědomí po celý den (ADA).
- Štítky důkazů: `strong` (věda silné), `promising` (věda slibné), `community` (komunitní praxe bez studie), `tradition` (tradice bez vědeckého důkazu; jen s ≥2 nezávislými zdroji). Vědecky ověřené podporujeme, sporné poctivě označíme. Nic si nevymýšlej; zdroje uváděj (autor, rok).
- Bezpečnost: WBTB max 2× týdně, nikdy při špatném spánku; prvních 14 dní jen vybavování snů a ochrana spánku; spánek má přednost; žádné série dní ani tresty; galantamin a doplňky nedoporučovat; cílená indukce může u citlivých lidí zvyšovat disociaci (Aviram & Soffer-Dudek 2018) → pauzy.
- Už máme: 22 technik (mild, ssild, wbtb, realityCheck, dreamJournal, recallTraining, wild, deild, fild, ada, incubation, stabilization, dreamYogaBreath, dreamYogaDay, dreamYogaRelease, dreamYogaIntention, dreamYogaSleep, lucidMission, meditation, yogaNidra, irt, grounding), 10 lekcí (sleepCycles, recall, prospective, realityTest, notControl, sleepParalysis, yogaDay, yogaNight, meditation, reality), 24 reflexí, 16 testů reality, 32 podnětů, 14denní program. Neopakuj je, rozšiřuj.

## Schémata (dodrž přesně)
Lekce (`lessons.json` → `{"lessons":[…]}`), karta je buď výklad, nebo kvíz:
```json
{"id":"sleepCycles","order":1,"title":"Spánkové cykly a REM","lead":"Kde se v noci rodí sny a proč budík po pěti hodinách.","minutes":3,"tag":"strong",
 "cards":[{"title":"Noc ve vlnách","body":"…","art":"hypnogram"},
          {"question":"Kdy je v noci nejvíc REM?","options":["Hned po usnutí","V druhé polovině noci","Rovnoměrně celou noc"],"answer":1,"explain":"…"}]}
```
Povolené `art`: body, breath, forgetting, hypnogram, ladder, mildLoop, realityTree, wildBridge, ssild (nebo navrhni nové id a v poli `artBrief` popiš, co má ilustrace ukazovat). 5–7 karet, aspoň 1 kvíz, max 3 věty na kartu.
Reflexe (`{"reflections":[…]}`): `{"id":"r25","tag":"philosophy|theory|strong|promising|community|tradition","text":"…","source":"…"}`
Podnět testu reality (`awarenessPrompts`): `{"id":"aw_19","notification":"≤60 znaků","prompt":"1–2 věty"}` – nikdy intimní obsah, různé formy proti habituaci.
Den programu (`{"days":[…]}`):
```json
{"id":"d15","day":15,"week":3,"mission":"…","goal":"…",
 "science":{"title":"…","minutes":5,"techniqueId":"mild","evidence":"strong","steps":["…"]},
 "yoga":{"title":"…","minutes":3,"techniqueId":"dreamYogaDay","evidence":"tradition","steps":["…"]},
 "intention":{"when":"…","then":"…"},"morningTask":"…","why":"…"}
```
(techniqueId jen z existujících; škály v appce jsou 0–10; ranní zápis umí víc snů za noc a čas snu.)

## Úkoly (vše, v tomhle pořadí)
1. **`lessons_new.json`** – 12 nových lekcí: znaky snů a jejich kategorie (LaBerge), proč sny zapomínáme (neurobiologie), spánková hygiena pro luciditu (kofein, alkohol, REM rebound), falešná probuzení, noční můry a IRT, inkubace snu, co se děje v mozku při luciditě (opatrně s nálezy, uveď nejistotu), dějiny výzkumu (Hearne 1978, LaBerge 1981…), TLR a obousměrná komunikace se snícím (Konkoly 2021 a novější), stabilizace a kontrola ve snu, chronotyp a zdřímnutí, přesnost nositelné elektroniky. Přidej `order` 11–22.
2. **`reflections_new.json`** – 30 nových reflexí o povaze reality, vnímání, paměti a vědomí (mix tagů, zdroje).
3. **`awareness_new.json`** – 40 nových podnětů pro testy reality (id aw_19–aw_58), pestré formy (smysly, paměť, logika, tělo, okolí, emoce).
4. **`program_weeks_3_6.json`** – dny 15–42 navazující na 14 dní: postupné zařazení MILD, SSILD, WBTB (max 2× týdně, s podmínkami), ADA, inkubace, stabilizace, jóga snu (denní i noční), týdenní reflexe pokroku bez sérií; každý týden jedno téma.
5. **`inovace.md`** – 15 inovativních funkcí, které konkurence nemá (seřazené podle dopadu na šanci lucidně snít a radost z používání): u každé co, proč (věda/chování), jak by vypadala v UI, pracnost S/M/L, riziko. Zvlášť podrobně (UX spec) top 5. Zaměř se na využití našich dat: REM okna z Oury a Garminu, časy snů, opakující se motivy, testy reality a jejich přenos do snu, experimenty N-of-1 (navrhni statistiku pro malý vzorek, např. bayesovsky), chytrý budík WBTB podle REM oken, inkubace, propojení s jógou snu.
6. **`presnost_nositelne_elektroniky.md`** – rešerše přesnosti Oura (Gen3/Gen4) a Garmin vs polysomnografie pro REM a fáze (čísla: senzitivita, specificita, kappa, posun začátku REM; zdroje 2020–2026), a co z toho plyne pro to, jak v appce mluvit o „odhadu výskytu REM“ a jak vážit shodu dvou zařízení.
7. **`algoritmus_rem_cyklu.md`** – literatura k detekci spánkových cyklů z hypnogramu (Feinberg & Floyd aj.) a bayesovskému spojení více zařízení + ručních záznamů „probudil jsem se ze snu v čase T“; navrhni a zdůvodni model (vzorce, výchozí parametry, jak ukazovat nejistotu) a jak ho validovat.
8. **Designové koncepty** jako samostatné HTML soubory pro telefon (390 px, vše inline, bez externích skriptů kromě Google Fonts): `dnes_koncept.html` (domovská obrazovka Dnes: plán na dnešek, jak ses vyspal, večerní záměr, start noci), `noc_mapa_snu.html` (deník jako noční časová osa: víc snů za noc s časy, napojené na REM okna), `detail_snu.html`. Ve stylu Program 2026, vizuálně působivé, čitelné.
9. **`ikony.svg.md`** – 24 liniových ikon (24×24, stroke 1.5, currentColor, jeden akcentový prvek se třídou `accent`) jako SVG kód: sen, REM, oko, záměr, ruka/test reality, měsíc, budík, mozek, emoce, deník, meditace, planeta, kresba, mikrofon, Oura prsten, hodinky, stopy snů, hvězdná mapa, lekce, jóga snu, falešné probuzení, noční můra, lucidita, zkoumání reality.

Kvalita má přednost před rychlostí. Díky!
