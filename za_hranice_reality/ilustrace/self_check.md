# Self-check: 12 ilustrací lekcí

## Shrnutí
- Flutter 3.27.4 (stable) / Dart 3.6.2 byl v cloudu skutečně nainstalovaný. `flutter analyze` i `flutter test` proběhly na minimálním projektu s maketou `_Art`, `AppSkin` a `paintText`.
- `flutter analyze` na spojeném `lesson_art.dart` (všech 12 tříd v jedné knihovně se vzorovou `_Forgetting` a se switchem ze `lesson_art_switch.dart`): **No issues found.**
- `flutter test`: vykresleno **4 416 snímků** (12 id × 2 skiny × 4 šířky × statický snímek a 45 živých časů t = 0–39,6 s). Žádná výjimka, žádný chybějící ani nepoužitý klíč textu, sada id v textech přesně odpovídá switchi.
- Obě poloviny prošly navíc přísnějšími testy u autorů, viz níže.
- Všech 12 ilustrací má výchozí výšku 176 px, řádek s výškou zůstává beze změny.

## Co přesně maketa obsahuje
- `_Art` je zkopírovaná doslova ze zadání (`stroke`, `fill`, `mono`, `label`, `arrowHead`, `t`, `live`, `shouldRepaint`).
- `AppSkin` je maketa se všemi poli ze zadání a metodou `mono({size, color, weight, tracking})`. Denní skin: bg #04060C, panel #0C1222, panelAlt #111A2E, line #1E2740, lineStrong #2E3A57, text #E9EDF5, muted #8D97AD, faint #5B6478, accent #FF5F1F, accentText #FF7A45. Noční (`redOnly`): bg #000000, line #3A0C08, lineStrong #5A120D, text a accent #FF3B2F, muted #B3261E, faint #6E1A12.
- `paintText(canvas, text, style, at, {align})` se svislým středem v `at.dy`.
- `TrainingArt` je nahrazený funkcí `buildArt(id, skin, l, clock)` se stejnými řádky switche. Riverpod, `contentProvider` a `DesignMotion` v maketě nejsou, protože nejsou potřeba pro kreslení.
- Lint: `flutter_lints` 5.0.0, navíc `prefer_const_constructors`, `prefer_final_locals`, `avoid_redundant_argument_values`, `unnecessary_parenthesis`, `strict-casts`, `strict-raw-types`.

## Přísnější kontroly u autorů (obě poloviny)
Každé id, oba skiny, šířky 320, 358, 390 a 430, výška 176, statický snímek (`clock == null`) i živé snímky:
1. Nic se nekreslí mimo plochu (render s okrajem 24 px, okraj musí zůstat v barvě pozadí, resp. záznamové plátno s tolerancí 0,5 px).
2. Každý popisek leží celý uvnitř plochy (rámeček glyfů včetně háčků a čárek nad verzálkami).
3. Žádné dva popisky se nepřekrývají.
4. Žádná čára ani tečka nevede přes popisek.
5. Barvy jen ze skinu; výplně širší než 8 px mají alpha ≤ 0,2.
6. Texty: všechny klíče existují, verzálky, 1–3 slova, bez „—“.
- Polovina B kontroluje body 1–4 i pro celou animaci (t = 0–40 s po 0,9 s). Tím se při ladění našla jedna skutečná chyba (skenovací linka v `twoHypnograms` přejížděla popisek), je opravená.
- Popisky se vykreslovaly skutečným fontem JetBrains Mono (FontLoader), ne Ahem obdélníky. PNG jsme prohlíželi na všech šířkách ve dne i v noci.

## Shoda náhledu s Dartem
- SVG v `lesson_art_preview.html` nejsou psaná ručně. Záznamové plátno pustí **stejný Dart `paint()`** na šířce 358 se `clock == null` a zapíše SVG (úsečky, kruhy, obdélníky jako prvky, `Path` navzorkovaný a zjednodušený s tolerancí 0,04 px).
- SVG jsme vykreslili v Chromiu a porovnali po pixelech s Flutter PNG: nad práh 64/255 se liší 0,1–1 % pixelů, jen antialiasing a sazba písma (posun ~0,5 px).
- Náhled nemá žádné skripty, jen Google Fonts. V Chromiu bez chyb v konzoli a bez vodorovného posunu.

## Na co si dát pozor při vložení
- **Prostorování písma:** maketa bere `tracking: 0.06` jako em (0,06 × velikost). Pokud skutečný `skin.mono` počítá jinak, popisky budou o kousek širší nebo užší. Nejtěsnější místo: `timeline` na 320 px má mezi popisky 30 px, `brainMap` má v horní řadě rezervu ~160 px.
- **`Path.combine`** (srpek měsíce v `seedMoon` a `chronoDial`) nepodporuje starý HTML renderer Flutter webu; na Androidu a CanvasKit funguje.
- **Pomocné funkce** (rohové značky, čárkovaná čára) jsou kvůli formátu „jen třídy“ zopakované uvnitř tříd. Pokud `paint_utils.dart` už podobné má, dají se nahradit.
- **Vzorová `_Forgetting` ze zadání** sama hlásí `prefer_const_constructors` na `Offset(left, top - 6)`, pokud máte tento lint zapnutý. Naše třídy ho nehlásí.
- **V noci** splývá `accent` a `text` do stejné červené, proto zvýraznění v nočním režimu nese i tloušťka čáry, halo, výplň a rohové značky, ne jen barva.
- **Precuneus** leží na vnitřní straně hemisféry; v pohledu z boku je to schematický bod (karta to nepopírá, je to princip).
- Maketa nekompiluje skutečný soubor s `flutter_riverpod`, `content.dart` a `design.dart`. Kód ale nepoužívá nic mimo `_Art`, `AppSkin`, `paintText`, `dart:math` a `package:flutter`, takže by se v reálném souboru měl chovat stejně. Poslední jistotu dá `flutter analyze` u vás.

## Spojený test (pro zopakování)
```dart
// test/check_test.dart v maketovém projektu; lib/art.dart = maketa + `part 'lesson_art.g.dart';`
for (final id in artIds) {
  for (final skin in [AppSkin.day, AppSkin.night]) {
    for (final w in [320.0, 358.0, 390.0, 430.0]) {
      for (final t in <double?>[null, for (var i = 0; i < 45; i++) i * 0.9]) {
        final rec = ui.PictureRecorder();
        buildArt(id, skin, l, t == null ? null : ValueNotifier<double>(t))
            .paint(Canvas(rec), Size(w, artHeight(id)));
        rec.endRecording().dispose();
      }
    }
  }
}
// + kontrola: žádný chybějící ani nepoužitý klíč v lesson_art_copy.json, sada id = switch
```
Výsledek: `frames=4416 missing={} unused={}`, `All tests passed!`
