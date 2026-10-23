# Self-check A: ilustrace technik a starších lekcí

## Shrnutí
- **17 nových ilustrací**: 11 technik (A1) a 6 nových pro karty starších lekcí (A2: `fourPreps`, `lucidityAxes`, `paralysisWave`, `postureVariants`, `butterfly`, `predictionLoop`). Limit 6 nových je dodržený.
- Všech 17 má výchozí výšku **176 px**, řádek s výškou se nemění.
- `technique_art.dart` obsahuje kromě 17 tříd také **mixin `_T1Ink on _Art`** (sdílené kreslení: čárkovaná a hladká křivka, hlava z profilu, ležící postava) a **pomocnou třídu `_T2Geo`** (jen statické metody). Obojí je potřeba vložit spolu s třídami.
- Mapování: `art_mapping.json` (11 technik a 22 karet). Karty používají nové i stávající ilustrace.

## Ověření (Flutter 3.27.4 / Dart 3.6.2, maketa `_Art`, `AppSkin`, `paintText`)
1. **Složené závorky:** skript `brace_fix.py --check` hlásí 0 těl `if`, `for`, `while`, `else` bez `{ }` v `technique_art.dart`. Opravil jsem i minulý `lesson_art.dart` (10 jednořádkových `if` dostalo `{ }`, commit ve složce `ilustrace/`). V lintu je navíc zapnuté `curly_braces_in_flow_control_structures`.
2. **`flutter analyze`** na spojeném projektu (12 ilustrací z minula, 17 nových, vzor `_Forgetting` a switch s 29 id): **No issues found.**
3. **Spojený `flutter test`:** **10 672 snímků** (29 id × den a noc × šířky 320, 358, 390, 430 × statický snímek a 45 živých časů t = 0–39,6 s). Bez výjimky, `missing={}`, `unused={}`, sada id v textech sedí na switch.
4. **Přísné testy u autorů** (každá ze tří částí zvlášť, den i noc, všechny šířky, celá animace):
   - nic se nekreslí mimo plochu;
   - popisky leží uvnitř a nepřekrývají se;
   - žádná čára ani tečka nevede přes popisek;
   - jen barvy ze skinu, plošné výplně alpha ≤ 0,2;
   - klíče textů verzálkami, 1–3 slova, bez dlouhé pomlčky, žádný chybějící ani nepoužitý.

   Vše zelené, popisky se vykreslovaly skutečným fontem JetBrains Mono. PNG si autoři prohlíželi a ladili je zhruba ve třech kolech.
5. **Náhled** `technique_art_preview.html`: SVG jsou exportovaná záznamovým plátnem ze stejných `paint()` (statický snímek, 358 px). V Chromiu se liší od Flutter PNG jen antialiasingem. Stránka nemá skripty, v konzoli jsou 0 chyb a nic nepřetéká do šířky.
6. **Maketa `AppSkin.mono`** odpovídá vašemu kódu: `letterSpacing: size * tracking`, `height: 1.3`.

## Vědecká a anatomická přesnost (na přání)
- **Spánek (`deild`):**
  - hluboký spánek hlavně v první třetině noci;
  - první REM v 76. minutě, REM bloky se k ránu prodlužují z 10 na 42 min;
  - jedno normální krátké probuzení.

  Výřez ukazuje konec pozdního REM, tříminutové probuzení a návrat. Označeno jako PRINCIP, NE MĚŘENÍ.
- **FILD:** hřbet pravé ruky dlaní dolů. Tři články u prstů, dva u palce, rýhy kloubů, nehty a šlachy. Úzké okno hypnagogie asi 30 s.
- **Postavy:**
  - stojící asi 7,5 hlavy, sedící asi 3,9 hlavy;
  - páteř s krční, hrudní a bederní křivkou;
  - bránice klesá při nádechu.
- **`yogaNidra`:** pohled shora na ležícího, pravá strana těla je vlevo v obraze. Pořadí 1–8 přesně podle kroků techniky, delší výdech než nádech.
- **`paralysisWave`:** atonie REM. Oči a bránice fungují, mysl bdí, malíček se může pohnout. Plíce, srdce a obě klenby bránice jsou na správném místě. Průběh epizody je SCHÉMA.
- **`predictionLoop`:** mozek z boku s laloky, mozečkem a kmenem. Bdění: predikce a chyba predikce. Sen: smyčka bez vnějšího vstupu. Označeno jako TEORIE, NE FAKT.
- **Jóga snu:** jen to, co stojí v kartách lekcí a v popisech technik (Wangyal, Norbu, kagjü). Žádná vymyšlená barevná ani číselná schémata čaker. `postureVariants` nese štítek NETESTOVÁNO, `fourPreps` štítek TRADICE.

## Na co si dát pozor
- **Malé postavy:** postavy v `postureVariants` a ležící postavy jsou malé (hlava 15–17 px). Čtou se jako profil, ne jako detailní obličej. Ruka pod tváří u lví polohy je jen naznačená.
- **Profil Zhuang Zhoua** v `butterfly` je nejméně vyladěný; motýl (žilnatina, tykadla, článkované zadeček) je propracovanější.
- **`grounding`:** číslované jsou jen kroky 5–4–3 podle vašich kroků techniky (bez čichu a chuti). Pokud chcete klasické 5–4–3–2–1, je potřeba doplnit dva kroky.
- **Písmeno A** v `postureVariants` je latinkou, font nemá tibetský glyf.
- **Interpretace autora:** umístění 2. přípravy (lpění a odpor) mezi odpoledne a večer na kruhu `fourPreps` je výklad autora. Zvýraznění hrudi v `dreamYogaRelease` je jen příklad.
- **Měření textu:** `_LucidMission` a `_Meditation` měří šířku textu přes `TextPainter` v `paint()`; náklad je zanedbatelný.
- **Mapování na stejnou ilustraci:** `sleepParalysis` karty 1 a 3 sdílejí `paralysisWave` (karta 3 o narkolepsii jen obecně). `dreamYogaDay` je použitá u `yogaDay` karty 2 i `reality` karty 2 (Diamantová sútra jako východisko praxe „den jako sen“).
- **Skutečný projekt:** ověřeno na maketě, ne ve vašem projektu s Riverpodem. Kód nepoužívá nic kromě `_Art`, `AppSkin`, `paintText`, `dart:math` a `package:flutter`.
