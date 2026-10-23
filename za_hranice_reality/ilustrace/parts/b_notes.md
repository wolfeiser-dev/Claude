# Sdíl B: seedMoon, cueWave, timeline, eyeSignal, chronoDial, twoHypnograms

## Co je v této složce
- `b_classes.dart`: 6 tříd (`_SeedMoon`, `_CueWave`, `_Timeline`, `_EyeSignal`, `_ChronoDial`, `_TwoHypnograms`). Nejsou v něm importy a vkládá se za stávající třídy. Každá třída `extends _Art`, má konstruktor `(super.skin, super.l, super.clock)` a nad sebou jednovětý `///` komentář.
- `b_copy.json`: texty `training.art.<id>.<klíč>` pro všech 6 id.
- `b_switch.txt`: řádky do `switch (id)` a do `ids`. Výška všude zůstává 176.
- `b_svg/<id>_day.svg`, `b_svg/<id>_night.svg`: statický snímek (live = false), 358 × 176.
- `b_png/<id>_day.png`, `b_png/<id>_night.png`: Flutter render statického snímku ve 358 px (1×), k tomu `@2x` pro detail.

## Ověření
Harness je v `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/art_harness_b/`.
- Je to minimální Flutter projekt, Flutter 3.27.4 / Dart 3.6.2.
- `tool/gen.sh` skládá `lib/lesson_art.dart` z `tool/header.dart` a beze změny přiloženého `parts/b_classes.dart`. Hlavička obsahuje maketu `AppSkin` (denní a noční skin podle zadání), `paintText` se svislým středem v `at.dy` a `_Art` doslova ze zadání. Přidává i `buildArt` se stejnými řádky switche jako `b_switch.txt`.
- Lint: `flutter_lints` 5.0.0 a navíc `prefer_const_constructors`, `prefer_final_locals`, `avoid_redundant_argument_values`, `unnecessary_parenthesis`.
- `flutter analyze` → **No issues found!** Kontroluje vložené třídy i harness.
- `flutter test` → **All tests passed!** (6 testů ilustrací, jeden na id, a diagnostický `test/gap_test.dart`). Test dělá toto:
  - Načte skutečný font JetBrains Mono Medium přes `FontLoader` (`/usr/share/fonts/truetype/jetbrains-mono/`), takže popisky nejsou Ahem obdélníky.
  - Texty bere z `b_copy.json`. Chybějící klíč shodí test a nepoužitý klíč se hlásí jako chyba.
  - Kreslí každé id v obou skinech, na šířkách 320, 358, 390 a 430 a ve výšce 176. Pokaždé statický snímek (clock null) a živý snímek (`ValueNotifier(3.7)`), oba uloží jako PNG ve 2×.
  - Kreslí totéž i do záznamového plátna (`lib/svg_canvas.dart`, `implements Canvas`) a programově kontroluje:
    1. žádný tah, výplň ani tečka nepřesahuje plochu (tolerance 0,5 px);
    2. každý text leží celý uvnitř plochy;
    3. žádné dva texty se nepřekrývají (rámeček glyfů + 1,5 px);
    4. žádná čára ani tečka nevede přes text (výplně s nízkou průhledností pod textem povolené jsou);
    5. nikde není dlouhá pomlčka.
  - Pohyb kontroluje zvlášť: body 1 až 4 i pro `t` = 0 až 40 s po 0,9 s na všech čtyřech šířkách.
- Kontrola mi při ladění opravdu našla chybu: skenovací linka v `twoHypnograms` přejížděla popisek „ODHAD ZAŘÍZENÍ“. Linku jsem rozdělil na dva úseky, jen přes grafy.
- PNG jsem si prohlížel na všech šířkách ve dne i v noci, statické i živé, a podle toho jsem upravoval tvar lístku, velikost vlnek, podobu signálu očí a odlišení REM v noci.
- Shoda SVG s Dartem: SVG jsem vykreslil v Chromiu (Playwright, 2×) a porovnal po pixelech s Flutter PNG. Průměrný rozdíl je 0,4 až 1,5 z 255 a nad 64 se liší 0,1 až 0,9 % pixelů. Rozdíl je jen v antialiasingu a o 0,5 px posunuté sazbě písma.
- Příkazy:
  ```
  cd …/scratchpad/art_harness_b && ./tool/gen.sh
  …/sdk/flutter/bin/flutter analyze
  …/sdk/flutter/bin/flutter test
  ```

## Jak vznikla SVG
SVG nejsou psaná ručně. Zapisuje je záznamové plátno ze stejných volání `Canvas` jako Dart, tedy se stejnými souřadnicemi a vzorci, takže se nemůžou rozejít s kódem.
- Úsečky, kruhy a obdélníky jsou přímo `<line>`, `<circle>` a `<rect>`.
- `Path` (oblouky, Bézierovy křivky, `Path.combine` u měsíce) je navzorkovaná po 0,5 px a zjednodušená s tolerancí 0,04 px. Proto je v SVG jako lomená čára.
- Čárky orbit jsou sloučené do jedné cesty.
- Text: `font-family="'JetBrains Mono', monospace"`, `letter-spacing="0.06em"`, velká písmena jsou už v textech. Účaří a ukotvení (`start`/`middle`/`end`) odpovídá `align`.
- Barvy jsou hex hodnoty skinu den/noc, průhlednost přes `fill-opacity`/`stroke-opacity`. Každé SVG má jako první obdélník pozadí `bg`.

## Návrh po ilustracích
Společné pro všechny:
- Linky 1 až 1,5 px, akcentová linka nejvýš 2 px.
- Výplně jen s alpha ≤ 0,2 přes `.withValues(alpha: …)`.
- Jen barvy skinu, žádná natvrdo zadaná barva.
- Popisky jen přes `label()`. Čísla ciferníku (0, 6, 12, 18) jdou přes `paintText` jako osy ve vzoru.
- Animace jen při `live`, pomalá. Statický snímek je úplný.

### seedMoon (176)
- Vlevo VEČER: tenký srpek měsíce (`Path.combine` dvou kruhů) s pár hvězdami. Z měsíce vede čárkovaná linka se šipkou dolů k semínku v zemi, jako poslední myšlenka dne.
- Vpravo RÁNO: malé slunce a ze semínka stonek. Stonek a lístek dohromady tvoří otazník, semínko pod zemí je jeho tečka.
- Lístek je zúžený pás podél oblouku: úzký řapík, nejširší za polovinou, špička na konci. Je to jediný oranžový tvar, i popisek „CO VYKLÍČILO“ je proto v barvě `text`, ne v akcentu.
- Mezi fázemi je čárkovaná dráha noci se šipkou.
- Živě: po dráze putuje tečka a lístek se jemně houpe (±0,06 rad).
- Klíče: `evening` VEČER, `morning` RÁNO, `seed` TÉMA, `sprout` CO VYKLÍČILO.

### cueWave (176)
- Stylizovaná noc (430 min), REM bloky k ránu delší.
- Nad 4. REM blokem (druhá polovina noci) je jemný akcentový sloupec, nad ním reproduktor a tři tóny jako soustředné oblouky. Oblouky míří šikmo vzhůru a slábnou (alpha 1 → 0,4).
- Kolem tónů je čárkovaná orbita s tečkou a ke sloupci vede čárkovaná vodicí linka.
- Živě: tóny se pomalu šíří ven (perioda 2,6 s) a tečka obíhá.
- Klíče: `caption` PRINCIP, NE MĚŘENÍ; `cue` ZVUKOVÝ PODNĚT; `rem` REM; `start` USNUTÍ; `end` RÁNO.

### timeline (176)
- Výsek orbity (kruhový oblouk), sedm zastávek v pořadí, ne v měřítku. Mezi antikou a rokem 1867 je zlom „//“ a čárkovaný úsek. Od 1867 je oblouk plný.
- Rok 1975 má oranžový bod s halem a pod ním oko.
- Popisky se střídají nad a pod obloukem: liché zastávky nahoře, sudé dole. Krajní jsou zarovnané ke kraji, aby se vešly i na 320 px.
- Rok/období je `muted` 9,5, jméno `faint` 8,5, rok 1975 `accentText`.
- Živě: halo dýchá a zornice se pohybuje vlevo a vpravo jako signál LRLR.
- Klíče:
  - `antiquity` ANTIKA, `aristotle` ARISTOTELÉS
  - `y1867` 1867, `saintDenys` SAINT-DENYS
  - `y1913` 1913, `vanEeden` VAN EEDEN
  - `y1968` 1968, `green` GREEN
  - `y1975` 1975, `hearne` HEARNE
  - `y1981` 1981, `laberge` LABERGE
  - `y2021` 2021, `konkoly` KONKOLY

### eyeSignal (176)
- Záznam očí je klidná tlumená linka (drobný šum) a uprostřed oranžový signál. Signál tvoří čtyři sakády: rychlý skok do krajní polohy a krátké podržení. Podobá se skutečným záznamům LRLR: L nahoru, R dolů, písmena u každého výkyvu.
- Pod tím je pás hypnogramu: lehký, hluboký, dlouhý REM (akcent a jemná výplň), lehký. Čárkované svislice na okrajích REM sahají až k signálu, takže je vidět, že signál padl do REM.
- Ilustrace sedí k oběma kartám (Hull 1975 i rozhovor 2021).
- Živě: po záznamu jede čtecí tečka.
- Klíče: `eyes` POHYB OČÍ; `caption` PRINCIP, NE MĚŘENÍ; `left` L; `right` R; `stages` FÁZE SPÁNKU; `rem` REM.

### chronoDial (176)
- Ciferník 24 h jako orbita: 0 nahoře, ryska po hodině, každých 6 h delší ryska s číslem. Měsíc je u půlnoci, slunce u poledne.
- Vně ciferníku jsou dvě dráhy spánku (tence). Ranní typ spí 23 až 7 h a jeho REM okno 4:30 až 6:30 je oranžové. Večerní typ spí 1 až 9 h a jeho okno 6:00 až 8:00 je tlumené, tedy o 1,5 h později. Tečka značí usnutí a okna mají jemný 0,2 podklad.
- Vpravo je legenda. Skupina ciferník + legenda je vodorovně vystředěná.
- Živě: po ciferníku obíhá tečka „teď“.
- Klíče: `windows` REM OKNO, `early` RANNÍ TYP, `late` VEČERNÍ TYP.

### twoHypnograms (176)
- Nahoře POLYSOMNOGRAFIE linkou `text` (světlou), dole ODHAD ZAŘÍZENÍ linkou `muted`.
- REM bloky jsou oranžová linka a výplň 0,16, takže jsou rozlišitelné i v noci, kde `text` = `accent`.
- Odhad vychází z `presnost_nositelne_elektroniky.md`:
  - první REM zařízení přehlédne a ohlásí ho o 19 min později (Garmin +16 až +30 min);
  - druhý REM začne o 8 min pozdě, což je chyba na okraji periody;
  - třetí sedí;
  - uprostřed čtvrtého je úsek označený jako lehký (REM → lehký je nejčastější chyba);
  - poslední je mírně delší.
- Chyby jsou tedy lokální, ne konstantní posun (Mouritzen 2020). Hluboký spánek se také mírně liší.
- Pod odhadem jsou drobné závorky odchylek. Dvě mají popisek POZDĚ a JAKO LEHKÝ.
- Živě: oběma grafy současně pomalu jede srovnávací linka.
- Klíče: `caption` PRINCIP, NE MĚŘENÍ; `psg` POLYSOMNOGRAFIE; `device` ODHAD ZAŘÍZENÍ; `rem` REM; `late` POZDĚ; `asLight` JAKO LEHKÝ.

## Známá omezení a poznámky
- `Path.combine` (srpek měsíce v `seedMoon` a `chronoDial`) nepodporuje jen starý webový HTML renderer. Na mobilu, ve Skia, Impelleru i CanvasKit funguje.
- Malá pomocná metoda `_dashed` je kvůli pravidlu „jen třídy“ zkopírovaná ve čtyřech třídách. Pokud má aplikace v `paint_utils.dart` vlastní čárkování, dá se nahradit.
- V maketě `AppSkin.mono` znamená `tracking` em (`letterSpacing = size × tracking`). Pokud skutečný skin počítá jinak, popisky budou o něco užší nebo širší.
- Popisky u okrajů jsou jako ve vzoru přichycené k okraji (x = 0 nebo šířka, zarovnání 0 nebo 1), takže nepřetečou ani při jiné šířce písma.
- Nejmenší vodorovná mezera mezi popisky na 320 px: `timeline` 30 px, `chronoDial` 64 px (číslo 6 a legenda), `eyeSignal` 79 px, `seedMoon` 98 px, `twoHypnograms` 113 px, `cueWave` 216 px. Změřil to diagnostický test `test/gap_test.dart`.
- Výrazně delší texty v copy by tedy nejdřív narazily u `timeline`.
- Ilustrace počítají se šířkou plochy 320 až 430 px. Pod 300 px se ciferník přestane centrovat a drží levý okraj.
- Zelená/modrá barva důkazů ani jiné barvy mimo skin se nepoužívají. Noc je jen červená, protože ji dodá skin.
