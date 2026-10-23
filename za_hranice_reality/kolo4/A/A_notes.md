# A: ikony do formátu MissionGlyph, co je hotové a ověřené

## Soubory

- `mission_icons_new.dart`: 10 nových hodnot enumu (blok ENUM v komentáři) a mapa `_glyphsNew`. Vložení: hodnoty za `cycle,`, mapu pod `_glyphs` a do `_glyphs` přidat `..._glyphsNew,`. Na konci komentář k 14 ikonám, které appka už má (nic neměněno).
- `ikony_pouziti.md`: 20 míst v appce.
- `ikony_preview.html`: statická stránka bez skriptů, den, noc a noc s opačným přiřazením, 48 a 24 px, srovnání s appkou, výpis řetězců.
- `gen_ikony_preview.py`: generátor náhledu (`python3 -I gen_ikony_preview.py`).

## Nové hodnoty

`intention`, `alarm`, `emotion`, `lesson`, `starMap`, `dreamYoga`, `falseAwakening`, `nightmare`, `lucidity`, `realityExplore`.

Nepřidal jsem `sketch`, protože enum už má `drawing`, a Stopy snů, které odpovídají `dreamSign`. `starMap`, `lesson` a `dreamYoga` jsem přidal, protože je zadání výslovně uvádí jako nové významy. Mohou se ale překrývat s `constellation`, `book` a `yoga`, jejichž řetězce v zadání chybí (víc v komentáři v Dartu).

## Ověřeno

1. **Dart, Flutter 3.27.4 (Dart 3.6.2).** Malý balíček ve scratchpadu (`icons4/pkg`). Knihovnu `build_mock.py` skládá ze zadání: enum, `_Part`, `_circle`, `_rect` a staré `_glyphs` jsou převzaté doslova, nové hodnoty enumu se berou z bloku ENUM a `mission_icons_new.dart` se připojí beze změny.
   - `dart analyze` (flutter_lints 5 + curly_braces, strict-casts): 0 issues.
   - `brace_fix.py --check`: 0 u `mission_icons_new.dart` i u souborů kontroly.
   - Parser zvládá jen M L H V C S Q A Z, velká i malá písmena, příznaky oblouku 0/1, implicitní opakování a A s rotací. Všech 18 glyfů (8 starých ze zadání + 10 nových) projde bez zbytku tokenů. Negativní testy (T, chybí M, zbylé číslo, špatný příznak, cizí znak, neúplné C) parser správně odmítne.
   - Každý nový glyf má právě jeden `accent: true` a žádný implicitně opakovaný příkaz.
   - Kresba i s půlkou tahu leží v 0..24 (nové ikony zhruba 2,0 až 22,0).
   - Řetězce, které vrátí Dart (`_circle()` a `_rect()` vyhodnocené za běhu), se shodují znak po znaku s těmi, které vyrobí Python generátor. Shoda platí i pro `12.0` a pro `2.6999999999999997` u ssild.
2. **Věrnost převodu.** Originál z `ikony.svg.md` a převod jsem vykreslil v Chromiu 1194 přes Playwright, vedle sebe ve 96 a 24 px, a prohlédl. Pak jsem každou z 10 ikon vykreslil jednobarevně ve 192 px a porovnal po pixelech: 0 pixelů s rozdílem nad 64/255, největší odchylka 56/255 v antialiasingu kruhu. Tečky (kruh r 0,5 až 0,75 s tahem) jsou převedené na plný kruh r + 0,75.
3. **Náhled.** V Chromiu ve 1120 a 390 px: bez vodorovného posuvu, 0 skriptů, bez chyb v konzoli, fonty Google se načtou. Stránku jsem prohlédl na snímcích.

## Upozornění

- Kód appky v zadání je useknutý po `ssild` (a z `ssild` jsou vidět jen 4 části). Ve staré sadě náhledu je proto jen today až ssild. Ostatní staré ikony jsem nevymýšlel a hodnocení čitelnosti u nich je jen popis mé verze.
- Předpokládám, že painter kreslí `fill: true` jen výplní, s kulatými konci a spoji. Jeho kód v zadání chybí.
- Noc: linka #B3261E, akcent #FF3B2F (kontrast na černé 3,2 : 1 a 5,9 : 1). Zdůvodnění je v náhledu. Pokud noční skin dává `text` #FF3B2F, je potřeba barvy v `MissionIcon` v noci prohodit.
- Postřeh: stará `mild` má dva `_Part` s `accent: true`.
- Nic jsem necommitoval.
