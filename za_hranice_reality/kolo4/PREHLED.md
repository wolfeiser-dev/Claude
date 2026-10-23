# Kolo 4: přehled

Všechno je ve větvi `claude/lucidni-sneni-vyzkum-bxf3tp`, složka `za_hranice_reality/kolo4/`. Pořadí A → B → C. Ověřeno v cloudu na Dart 3.6.2 (Flutter 3.27.4); obrazové výstupy navíc v Chromiu.

## A) Ikony (`A/`)
| Soubor | Co je v něm |
|---|---|
| `mission_icons_new.dart` | 10 nových hodnot `MissionGlyph` (v komentovaném bloku ENUM, přidat za `cycle,`) a mapa `_glyphsNew`: `intention`, `alarm`, `emotion`, `lesson`, `starMap`, `dreamYoga`, `falseAwakening`, `nightmare`, `lucidity`, `realityExplore`. Vložení: mapu pod `_glyphs` a do `_glyphs` jako poslední položku `..._glyphsNew,` (nebo položky zkopírovat přímo). Na konci český komentář k 14 ikonám, které už máte (beze změny). |
| `ikony_pouziti.md` | 20 míst v appce (obrazovka, prvek, velikost, akcent) a varování na záměnu (budík × wbtb, lucidita × oko). |
| `ikony_preview.html` | Mřížka staré a nové sady ve 24 a 48 px, den a noc, srovnávací dvojice a plné řetězce cest. Bez skriptů. |
| `gen_ikony_preview.py` | Generuje náhled ze stejných řetězců jako Dart (parsuje `ZADANI.md` a `mission_icons_new.dart`, vyhodnocuje `_circle()`/`_rect()` s formátováním čísel jako Dart). |
| `A_notes.md` | Postup a ověření. |

**Ověřeno**
- **Dart:** `dart analyze` bez chyb, všechna těla `if`/`for` ve `{ }`.
- **Parser:** vlastní minimální parser M L H V C S Q A Z (velká i malá písmena) přečte všech 18 glyfů beze zbytku a 6 schválně chybných odmítne.
- **Struktura glyfů:** každý nový glyf má právě 1 část v akcentu a se šířkou čáry zůstává v 0–24.
- **Shoda s Dartem:** řetězce z Dartu za běhu se znak po znaku shodují s náhledem.
- **Věrnost převodu:** pixelové srovnání s originály z kola 1 neukázalo žádný rozdíl nad 64/255.

**Upozornění**
- **Zkrácená stará sada:** ze staré sady jsou v zadání jen glyfy `today` až `ssild` (zadání je zkrácené). Náhled ukazuje jen je a žádný jsem si nevymýšlel.
- **Glyf `mild`** ve vaší sadě má dvě části s `accent: true`, takže porušuje pravidlo jednoho akcentu.
- **Možné duplicity:** `lesson`, `starMap` a `dreamYoga` se můžou překrývat s `book`, `constellation` a `yoga`, jejichž řetězce v zadání nebyly. Kde co volit, říká komentář v Dartu.
- **Noční barvy:** návrh je linka #B3261E a akcent #FF3B2F. Pokud má váš noční skin `text` #FF3B2F, je potřeba v `MissionIcon` barvy v noci prohodit.
- **Malování výplně:** předpokládám, že váš painter maluje `fill: true` jako čistou výplň s kulatými konci čar (jeho kód v zadání nebyl).

## B) Model výskytu REM v2 (`B/`)
| Soubor | Co je v něm |
|---|---|
| `rem_types.dart` | Vaše typy přesně podle zadání (`SleepStage`, `SleepSource`, `SleepSegment`, `SleepNight`, `RemLevel`, `RemWindow`) + `RemMark` a `Predictor`. V appce nahraďte import svými typy. |
| `rem_model_v2.dart` | Bayesovský model: cyklický HSMM na mřížce 5 min od usnutí, matice záměn Oura a Garmin, korelace chyb ρ, tlumení γ/β, pojistka „zařízení minulo celé REM“, ruční značky s časovým jádrem a omezenou vahou, „nic si nepamatuju“ LR 0,4, osobní prior (Kalman), nejistota. `remWindowsV2` má přesně vaši signaturu (+ volitelná `RemV2Cache`) a vrací `RemWindowV2 extends RemWindow` s poli `probability`, `probabilityLow/High`, `deviceProbability` a celou křivkou, takže stávající UI funguje beze změny. |
| `rem_backtest.dart` | Walk-forward harness `backtest(nights, marks, Predictor)`: log skóre a Brier po 5 min, podíl REM v úrovních, pokrytí `high`, zásah `bestRemWindow`, kalibrace v decilech, párové srovnání s bootstrap intervalem. Pravda: Oura, jinak Garmin; varianta „jen kde se zařízení shodnou“. |
| `rem_baseline.dart` | Jednoduchý průměr hypnogramů podle popisu vašeho dnešního modelu (60 nocí, poločas 30 dní, populační šablona, ruční značky) pro srovnání. |
| `rem_synth.dart` | Generátor syntetických nocí (cyklus ~95 min SD 12, první REM 75–110 min, REM k ránu delší, hluboký spánek v první třetině, krátká probuzení, chyby zařízení podle rešerše, korelované chyby, ruční značky zkreslené k ránu ±15 min). |
| `rem_synth_report.dart` | Navíc: přegeneruje všechny tabulky ze `self_check_b.md`. |
| `rem_v2_test.dart` | 23 testů (package:test). |
| `self_check_b.md` | Příkazy, výstupy, tabulky syntetického backtestu, limity. |
| `doporuceni_parametru.md` | Výchozí parametry a proč, co ladit na skutečných datech a v jakých mezích, protokol srovnání. |

**Ověřeno**
- **Kontroly kódu:** `dart analyze` bez chyb, žádné tělo bez `{ }`, knihovna importuje jen `dart:math`.
- **Testy:** 23/23 zelené v časových pásmech UTC, Europe/Prague, America/New_York a Australia/Lord_Howe (změna času o 30 min). Krajní případy: jen jedno zařízení, žádné noci, noc přes půlnoc, změna času, překryvy a mezery v úsecích, ruční záznamy, determinismus, walk-forward bez nahlédnutí do budoucnosti.
- **Výsledky backtestu na 400 syntetických nocích** (v2 proti průměru hypnogramů, logaritmická ztráta, nižší = lepší):

  | Pravda | v2 | průměr | rozdíl (95% CI) |
  |---|---|---|---|
  | Oura, jinak Garmin | 0,4559 | 0,4691 | −0,013 (−0,017 až −0,010) |
  | Jen kde se zařízení shodnou | 0,3320 | 0,3430 | −0,011 |
  | Skrytá skutečná noc | 0,4097 | 0,4289 | −0,019 |

- **Další výsledky:**
  - v2 je lepší asi v 70 % nocí;
  - podíl REM klesá od `high` k `unlikely` (43,5 / 32,7 / 17,7 / 3,9 %);
  - `high` pokrývá v průměru 9,8 % noci;
  - vlastní pravděpodobnost v2 je dobře kalibrovaná (ECE 0,009 proti štítku zařízení);
  - v2 je lepší ve všech 15 bězích (5 seedů × 3 varianty pravdy) i v 9 dalších scénářích.

**Upozornění**
- **Syntetika není realita.** Syntetická zařízení zhruba odpovídají předpokladům modelu, takže na vašich skutečných datech bude zisk nejspíš menší. Rozhodne až váš backtest proti skutečnému `remWindows` (protokol v `doporuceni_parametru.md`):
  - ladit jen na starších nocích,
  - parametry zmrazit,
  - jednou otestovat na posledních 120 nocích,
  - jedna předem určená metrika.
- **Nejlepší okno:** podle „≥ 10 min REM v okně“ vychází lépe průměr (59 % proti 51 %), protože jeho okna jsou delší (30 proti 20 min). v2 má okna hustší. Podle středu okna jsou oba vyrovnané (44 % proti 43 %).
- **Prahy úrovní:** v2 má výchozí prahy 0,30 / 0,55 / 0,80. Pro férové srovnání je nastavte na hodnoty z vašeho `RemProbabilityParams`.
- **Krátké latence:** krátkou latenci prvního REM (65–75 min) model nadhodnocuje o 7–16 min. Ruční značky predikci mění jen málo a interval kolem `pRem` je přibližný.
- **Výkon:** na VM asi 2 ms na noc, 0,25 s na volání bez cache a 6 ms s cache. Na telefonu počítejte s 2–4× víc; pouštějte to v `Isolate.run` a cache držte v paměti.

## C) Laboratoř s WBTB (`C/`)
| Soubor | Co je v něm |
|---|---|
| `nof1_wbtb.dart` | `wbtbArmFor` přesně podle signatury ze zadání, nad ním `wbtbNightPlan` se stavem (scheduled, recorded, wbtbNotAllowed, experimentDone, pastNight, conflictingRecord), pořadím noci a texty. Dál `wbtbNeedsOf(template)` a `validateWbtbPlan`. `nof1.dart` z kola 3 zůstává beze změny. |
| `nof1_wbtb_test.dart` | 15 testů včetně simulace (300 seedů × 20/25/50 % špatných nocí, 10 % vynechaných nocí, oba WBTB experimenty). |
| `laborator_texty_wbtb.json` | 7 nových klíčů `lab.wbtb.*` (stavy, `sleepFirst`, `bothArmsWait`). |
| `C_notes.md` | Pravidlo, zdůvodnění, simulace, jak to napojit. |

**Pravidlo vyváženosti: obě varianty čekají na stejné noci.**
- **Které noci se počítají:** noc patří do experimentu jen tehdy, když by v ní WBTB bylo povolené, a to platí i pro variantu bez WBTB. Jinak `arm == null` a appka ukáže „dnes mimo experiment“. Rozpis se neposune, n-tá noc experimentu dostane n-tou položku.
- **Proč ne volněji:** zadání dovolovalo pustit variantu bez WBTB i do ostatních nocí. Ty ale jsou po špatném spánku, den po probuzení nebo v týdnu, kde už dvě WBTB proběhla. Simulace ukázala, že by pak 26 % nocí varianty A bylo po špatné noci (u B 0 %) a 62 % den po WBTB (u B 0 %). To je zkreslení, které kovariáta neopraví.
- **Cena pravidla:** asi 5–9 dní navíc na 20 nocí experimentu. Vyváženost zůstává přesně podle rozpisu: rozdíl nejvýš 1 u střídání, nejvýš 2 u bloků po 4.

**Ověřeno**
- **Kontroly kódu:** `dart analyze` bez chyb, žádné tělo bez `{ }`.
- **Testy:** 46/46 zelené (31 původních testů `nof1` a 15 nových) v časových pásmech UTC, Europe/Prague a America/Sao_Paulo.
- **Simulace:** pravidla WBTB se nikdy neporuší (kontroluje nezávisle `validateWbtbPlan`) a pořadí vždy sedí na `planned`.
- **Texty:** test pokrytí ověřuje, že všechny klíče, které kód vrací, existují spolu s texty z kola 3, žádný se nepřepisuje a zástupné symboly sedí.

**Upozornění**
- **Týdenní limit WBTB** vidí jen noci experimentu. Dokud běží experiment s WBTB, appka nesmí nabízet WBTB nikde jinde.
- **Ukládání do `past`:** zapisujte až ráno, vynechanou noc nezapisujte a chybějící hodnocení spánku předejte jako `lastNightGood: false`.
