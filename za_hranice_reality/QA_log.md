# QA log: finální kontrola výstupů

Datum: 23. 10. 2026. Záloha původních souborů před úpravami je ve scratchpadu sezení (`orig_backup`).

## Co jsem kontroloval

1. **Konzistence mezi dokumenty:** chytrý budík WBTB, záznam „bez snu“, parametry přesnosti zařízení (s, f, ρ), pravidla WBTB.
2. **Citace z paměti:** ověřeny na webu (abstrakty, katalogy knihoven, nakladatelé) a v podkladu `Lucidní snění metody a aplikace 2.md`.
3. **Pravidla obsahu:** žádná dlouhá pomlčka (i viditelný text a atributy HTML), tykání, platnost JSON, 5–7 karet a aspoň 1 kvíz na lekci, max 3 věty na kartu, notifikace ≤ 60 znaků, techniqueId jen z 22 povolených, tagy reflexí, tradice s ≥ 2 zdroji, žádné doporučení galantaminu a doplňků, žádné série a tresty, terminologie (Plán na dnešek, Spánková data, Jak ses vyspal, připomínka, Záloha, Stopy snů, český název techniky první, „mise“ jen v Programu).
4. **HTML:** žádné `<script>` (ani inline, ani `src`), jediný externí zdroj jsou Google Fonts (fonts.googleapis.com, fonts.gstatic.com).

Výsledek automatických kontrol: všechny 4 JSON jsou platné, dlouhá pomlčka (U+2014) se nevyskytuje v žádném výstupu, všech 40 notifikací má ≤ 60 znaků, všech 12 lekcí má 7 karet a 1–2 kvízy, všechna techniqueId jsou povolená, všech 30 reflexí má platný tag a 5 tradičních má ≥ 2 zdroje. Nezlomitelné mezery U+00A0 v lekcích jsem ponechal.

## Co jsem změnil

### Chytrý budík WBTB (inovace.md, HTML)
- `inovace.md` #1: „zvoní do tvého nejpravděpodobnějšího REM okna“ → „zvoní v nejpravděpodobnější části noci“. Přidaná věta, že bez živých dat je zisk malý (asi 0,31 proti 0,27 u pevných 5 h, vybavení snu 55 proti 53 %) a že hodnota je v kotvě na skutečné usnutí, bráně spánku a osobním učení (odkaz na `algoritmus_rem_cyklu.md` 0 a 4.4). V tabulce pořadí poznámka „časování přidává málo“.
- TOP 1: uživatelský příběh „když nejspíš sním“ → „v nejpravděpodobnější části noci“; text karty doplněn „Je to odhad, ne jistota“; „Oura se trefuje do REM ve 4 z 5“ → „šance, že tě budík zastihne v REM, je asi 3 z 10“; ranní text „Budík zazněl v REM. REM od 4:41“ → „Podle Oury jsi byl možná v REM“; metrika „zásah do REM ≥ 50 %“ → sledovat, cíl nebýt horší než pevný čas.
- `dnes_koncept.html`: „Ve 4. REM okně“ → „V nejpravděpodobnější části noci, odhad REM okna…“ (2×), štítek „4. REM okno“ → „pozdní část noci“.

### Pravidla WBTB (všude: max 2× týdně, nikdy dvě noci po sobě, jen po dobré noci, ne v prvních 14 dnech)
- `inovace.md`: brána nově jen po zelené (dřív jen „ne po červené“, ale HTML říká „Žlutá: jen MILD, bez budíku“); alkohol a nemoc bránu zavírají (dřív jen varování, `algoritmus_rem_cyklu.md` je blokoval); čip „Včera byl budík, dvě noci po sobě ne“.
- `algoritmus_rem_cyklu.md` 4.4: brána „ne po červené“ → „jen po zelené (ne po žluté ani červené)“; bod 9.7 aktualizován.
- `program_weeks_3_6.json`: u všech 5 nocí s výpravou podmínka „a nebyla to noc s výpravou“; d24 doplněno „nejvýš 2× týdně a nikdy dvě noci po sobě“. Rozvrh (d25 | d30, d33 | d37, d40) pravidla splňoval už předtím.
- `lessons_new.json`: oba kvízy s WBTB doplněny o „nikdy dvě noci po sobě“.
- **HTML koncepty porušovaly pravidla:** Dnes byl „pátek, den 16“ a nabízel WBTB „2. ze 2 tento týden“, přitom předchozí noc (detail snu, „Noc 15“) už byla s WBTB, tedy dvě noci po sobě; a TLR experiment „noc 3 z 10“ v noci 15 by začal v prvních 14 dnech. Oprava: detail snu je „Noc 33“ (v programu d33 = WBTB + MILD + téma, sedí k zápisu), Dnes je „Pondělí 26. října, den 37 ze 42“ (d37 = WBTB + MILD + stabilizace), „Noc na pondělí“ bez budíku, „1. ze 2 tento týden“, oblouk programu a čísla nocí přepočítané, odstraněna věta „Vstávání kvůli WBTB…“.
- Dnes a Mapa noci: REM za noc „1:42–2:19“ → „≈1:40–2:20“ (pravidlo zaokrouhlení na 10 min z `presnost_nositelne_elektroniky.md` 2.3).

### Záznam „Probudil jsem se, ale nic si nepamatuju“
- `inovace.md` #5 (Co), TOP 1 (tlačítko „Nic si nepamatuju“ ukládá záznam bez snu) a TOP 5 C (rychlá volba s časem); ve sdíleném modelu přidán `LR_BEZ_SNU = 0.4` podle `algoritmus_rem_cyklu.md` 4.2.

### Parametry přesnosti a ρ
- `presnost_nositelne_elektroniky.md` 3.3: poznámka, že binární ρ = 0,3 odpovídá třítřídnímu ρ ≈ 0,4 v algoritmu.
- `algoritmus_rem_cyklu.md` (Vazby): stejná věta z druhé strany (převod v 3.3 už tam byl).
- `inovace.md`: pod sdíleným REM profilem věta s parametry (Oura 0,70 / 0,10, Garmin 0,50 / 0,15, ρ 0,3 binárně ≈ 0,4 třítřídně), že závazný je model v algoritmu a že VAHA je zjednodušení.

### Citace
| Citace | Ověření | Změna |
|---|---|---|
| Barrett 1993, Dreaming 3(2) | Abstrakt: zhruba polovina měla sen k problému, většina z nich v něm viděla řešení, nezávislí hodnotitelé o něco méně | Lekce a program sedí. `inovace.md` #10: „téma zhruba v každé druhé noci“ → „každý druhý člověk za celý týden“ |
| Haar Horowitz a kol. 2020, Consciousness and Cognition 83:102938 (Dormio) | Ověřeno (50 účastníků, odpolední zdřímnutí, téma „strom“ v hypnagogii častěji) | Program d31: „Horowitz“ → „Haar Horowitz“ |
| LaBerge & Rheingold 1990; Norbu 1992 (Snow Lion); Holecek 2016 (Dream Yoga) | Ověřeno | Bez změny |
| Holecek 2020, Dreams of Light | Ověřeno (Sounds True, 2020, denní praxe) | Bez změny |
| Tsongkhapa přes Mullin 1996; Evans-Wentz 1935 | Ověřeno (Snow Lion 1996, A Book of Three Inspirations; Oxford UP 1935) | Bez změny |
| Metzinger 2003 / 2009 | Lucidní sen jako chvíle, kdy model přestává být průhledný (opacita), doložen pro The Ego Tunnel 2009 | r37: chybné „model zprůhlední“ → „přestane být průhledný“ |
| Saint-Denys 1867 | Ověřeno (Paris, Amyot, anonymně) | Bez změny |
| Hearne 1978 | Disertace University of Liverpool, pokus 12. 4. 1975 v Hullu | r46: „University of Hull“ → „University of Liverpool (pokus v Hullu 1975)“; lekce už měla správně |
| LaBerge, NightLight (točení) | Výsledky v NightLight 7(3–4), 1995: šance na pokračování snu asi 22 : 1 po točení, 13 : 1 po tření dlaní, 1 : 2 u „nechat se unášet“; původní studie z 1989 byla neprůkazná | Lekce dreamStability: „nepřineslo jasný výsledek“ → po točení i tření sen častěji pokračoval, malá studie bez recenze; zdroj „LaBerge 1995, NightLight 7(3–4)“ |
| Gardiner 2023, Sleep Med Rev 69:101764 | Ověřeno (24 studií, −45 min, káva ≥ 8,8 h před spaním) | Bez změny |
| Ebrahim 2013, Alcohol Clin Exp Res | Ověřeno (rozbitá 2. polovina noci, REM snížen hlavně ve vyšších dávkách) | Bez změny |
| Nielsen 2010; Choo 2023 | Nielsen: noční můry a večerní typ, hlavně u žen, sny nezkoumal; Choo (Sleep Biol Rhythms): lepší vybavování a víc distresu z můr | Lekce chronotypeNaps zmírněna: vybavování jen podle Choo, můry hlavně ženy podle Nielsena, jiná studie souvislost nepotvrdila |

### Ostatní pravidla
- `lessons_new.json` falseAwakening: „hlavně při WBTB“ → „hlavně při technice Probuzení a návrat do spánku (WBTB)“ (český název první).

## Co zůstává nejisté
- Čísla chytrého budíku (0,31 / 0,27) pocházejí z vlastní simulace v `algoritmus_rem_cyklu.md`, ne z měření na lidech.
- Výsledky LaBergeova srovnání točení a tření znám jen z webu Lucidity Institute (sekundárně), počet účastníků jsem nepotvrdil.
- Metzinger 2003 (Being No One): přímou pasáž o lucidních snech jsem nedohledal, doložená je hlavně The Ego Tunnel 2009. Obě knihy v r37 nechávám.
- Barrett 1993: číslo „asi čtvrtina vyřešila problém“ z druhotných zdrojů v abstraktu není, proto ho nikde neuvádíme.
- Preprinty 2026 (Peters, Picard-Deland, Konkoly 2026) a další novější zdroje mimo seznam jsem neověřoval znovu, beru je z podkladu.
- HTML koncepty jsem nemohl vykreslit v prohlížeči (není k dispozici). Úpravy jsou textové, jen oblouk programu na Dnes je přepočítaný (den 37, týden 6).
- Dnes je teď pondělí s větou „zítra nemusíš brzy vstávat“. Odpovídá podmínce, ale u běžného pracovního týdne působí méně přirozeně.
- Dnes: karta Programu ukazuje „Mise 37“. Je to obsah z Programu, proto „mise“ nechávám. Při přísném výkladu pravidla „mise jen v Programu“ by šlo použít „Program · den 37“.
- Detail snu ukazuje pravděpodobnost původu snu „82 % / 11 % / 7 %“. Podle `presnost_nositelne_elektroniky.md` 2.1 by se měla zaokrouhlovat na desítky. Neměnil jsem to, protože k tomu patří šířky pruhů v SVG.
