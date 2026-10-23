# Společné pokyny pro autory ilustrací (kolo 3, část A)

Zadání: `za_hranice_reality/kolo3/_zadani.md`, sekce A (smlouva `_Art`, AppSkin, vzor `_Forgetting`, popisy technik a karet).
Minulé ilustrace pro srovnání stylu a kvality: `za_hranice_reality/ilustrace/lesson_art.dart`, PNG v `za_hranice_reality/ilustrace/parts/a_png/` a `b_png/`, náhled `lesson_art_preview.html`.
Texty lekcí: `za_hranice_reality/lessons_new.json`; podklad výzkumu: `reports/Lucidní snění metody a aplikace 2.md`.

## Nové oproti minulému kolu
1. **Každé tělo `if`, `for`, `while`, `else` ve složených závorkách `{ }`**, i jednořádkové. Kontrola: `python3 -I /tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/tools/brace_fix.py <soubor> --check` musí hlásit 0. (Collection-for v literálu `[for ...]` je v pořádku.)
2. **Víc detailu a vědecké / anatomické přesnosti** (přání uživatele), ale pořád tenké linky 1–1,5 px, čitelné při 176 px a nic přeplácaného:
   - Spánek: realistická architektura noci (cyklus ~90 min, 4–6 cyklů, hluboký spánek N3 hlavně v první třetině, REM se k ránu prodlužuje, první REM ~70–90 min po usnutí, krátká probuzení jsou normální). Hypnagogie = přechod bdění → N1.
   - Tělo: anatomicky věrné proporce a polohy (např. lví poloha na pravém boku: pravá ruka pod tváří, levá podél těla, kolena mírně pokrčená; páteř, bránice a plíce u dechu; ruka se správným počtem článků prstů a směrem ohybu).
   - Mozek: profil s rozumnými proporcemi (čelní, temenní, spánkový, týlní lalok, mozeček, mozkový kmen), oblasti na správném místě (prefrontální kůra vpředu, precuneus mediálně nahoře vzadu: v bočním pohledu jen naznačit, thalamus hluboko uprostřed, mozkový kmen dole).
   - Kde je obraz schematický nebo zjednodušený, přidej drobný popisek PRINCIP, NE MĚŘENÍ (nebo SCHÉMA).
   - Tradice (jóga snu): kresli jen to, co je v textech doložené (viz karty lekcí `yogaDay`, `yogaNight` a popisy technik); žádná vymyšlená barevná či číselná schémata čaker.
3. Skutečný `AppSkin.mono` má `letterSpacing: size * tracking` a `height: 1.3` (maketa je upravená).

## Prostředí a ověření (stejné jako minule)
- Flutter 3.27.4 / Dart 3.6.2: `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/sdk/flutter/bin/flutter`.
- Základ makety: `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/kolo3_base/` (AppSkin den/noc, `paintText`, `_Art`, všech 21 stávajících tříd z minula je v `lib/lesson_art.g.dart` jen pro 12 nových + `_Forgetting`; lint vč. curly braces). **Zkopíruj si ho do vlastní složky** (název níže), nepracuj přímo v něm.
- Přísné testy a SVG export z minula převezmi: `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/art_harness_a/test/art_test.dart` + `svg_canvas.dart` a `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/art_harness_b/` (kontroly: nic mimo plochu, popisky uvnitř, nepřekrývají se, žádná čára přes popisek, jen barvy skinu, výplně alpha ≤ 0,2, klíče textů 1–3 slova verzálkami, bez „—“; animace t = 0–40 s; šířky 320, 358, 390, 430; den i noc). Font JetBrains Mono z `/usr/share/fonts/truetype/jetbrains-mono/`.
- `flutter analyze` 0 problémů, `flutter test` zelený, PNG si prohlédni (Read) a iteruj, dokud to není propracované.
- SVG náhledu exportuj záznamovým plátnem ze stejného `paint()` na šířce 358 (statický snímek), den i noc.

## Výstupy každého autora do `za_hranice_reality/kolo3/parts/<prefix>/`
- `<prefix>_classes.dart` (jen třídy, bez importů, `///` jedna věta nad každou),
- `<prefix>_copy.json` (`{"texts":{"training":{"art":{...}}}}`),
- `<prefix>_switch.txt` (řádky switch + ids + výška, pokud > 176, max 230),
- `svg/<id>_day.svg`, `svg/<id>_night.svg`, `png/<id>_day@2x.png`, `png/<id>_night@2x.png`,
- `<prefix>_notes.md` (co a jak ověřeno, rozhodnutí, vědecké podklady k anatomii/spánku, limity).
Texty česky, popisky VELKÝMI písmeny, 1–3 slova, bez dlouhé pomlčky. Jen barvy ze skinu. Nesahej na soubory jiných autorů.
