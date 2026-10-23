# Zadání pro cloud, kolo 4 (od hlavní vývojové session appky „Za hranice reality“)

Ahoj, kolo 3 je v appce celé:
- 29 ilustrací technik a lekcí,
- Osobní laboratoř s tvým `nof1.dart`, 10 šablonami a texty. Obrazovku jsem postavil a testy prošly.

Přibyl i popisek po klepnutí do grafů spánku. Kredity nešetři. Pracuj samostatně a na nic se neptej.

Výstupy commitni a pushni do téhle větve (`claude/lucidni-sneni-vyzkum-bxf3tp`), složka `za_hranice_reality/kolo4/`. Na konec dej `PREHLED.md`: co je kde, co jsi ověřil a upozornění.

Pořadí: **A → B → C**. A a C jsou menší, B je hlavní.

---

## A) Tvých 24 ikon do našeho formátu (`ikony.svg.md` z kola 1)

Naše ikony jsou řetězce cest SVG:
- mřížka 24, linka 1,5,
- právě jeden prvek v akcentu (`_Part(d, accent: true)`),
- malý parser zvládá příkazy M L H V C S Q A Z, velká i malá písmena,
- žádné `<circle>` ani `<rect>`, na ty jsou pomocníci `_circle()` a `_rect()`.

```dart

import 'package:flutter/widgets.dart';

import '../skin.dart';

/// Piktogramy z návrhu (Design/Výcvik – varianty.html): mřížka 24, linka 1,5, právě jeden signální prvek v akcentu.
enum MissionGlyph {
  today,
  journal,
  voice,
  night,
  wbtb,
  realityTest,
  mild,
  ssild,
  yoga,
  oura,
  watch,
  dreamSign,
  vault,
  path,
  person,
  dream,
  rem,
  eye,
  brain,
  heart,
  book,
  meditation,
  planet,
  drawing,
  constellation,
  cycle,
}

/// Obrysová ikona mise. [accent] = false nakreslí i signální prvek barvou [color].
class MissionIcon extends StatelessWidget {
  const MissionIcon(this.glyph, {super.key, this.size = 24, this.color, this.accentColor, this.accent = true});

  final MissionGlyph glyph;
  final double size;
  final Color? color;
  final Color? accentColor;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    final skin = AppSkin.of(context);
    final c = color ?? skin.text;
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(painter: _GlyphPainter(glyph, c, accent ? (accentColor ?? skin.accent) : c)),
    );
  }
}

class _Part {
  const _Part(this.d, {this.accent = false, this.fill = false});

  final String d;
  final bool accent;
  final bool fill;
}

String _circle(double cx, double cy, double r) =>
    'M${cx - r} ${cy}a$r $r 0 1 0 ${2 * r} 0a$r $r 0 1 0 ${-2 * r} 0z';

String _rect(double x, double y, double w, double h, double r) =>
    'M${x + r} ${y}h${w - 2 * r}a$r $r 0 0 1 $r ${r}v${h - 2 * r}a$r $r 0 0 1 ${-r} $r'
    'h${-(w - 2 * r)}a$r $r 0 0 1 ${-r} ${-r}v${-(h - 2 * r)}a$r $r 0 0 1 $r ${-r}z';

final Map<MissionGlyph, List<_Part>> _glyphs = {
  MissionGlyph.today: const [
    _Part('M3 17h18M7 17a5 5 0 0 1 10 0M5.6 8.6l1.8 1.8M18.4 8.6l-1.8 1.8'),
    _Part('M12 5v3', accent: true),
  ],
  MissionGlyph.journal: [
    _Part(_rect(5, 3, 14, 18, 2.5)),
    const _Part('M9 3v18'),
    const _Part('M13.5 3v6.5l2-1.5 2 1.5V3', accent: true),
  ],
  MissionGlyph.voice: const [
    _Part('M12 3a3 3 0 0 1 3 3v5a3 3 0 0 1-6 0V6a3 3 0 0 1 3-3zM6 11a6 6 0 0 0 12 0M12 17v4M9 21h6'),
    _Part('M2.5 9.5v3M21.5 9.5v3', accent: true),
  ],
  MissionGlyph.night: [
    const _Part('M14.5 3.5a8.5 8.5 0 1 0 6 13.6 7 7 0 0 1-6-13.6z'),
    _Part(_circle(18.5, 6, 1.4), accent: true, fill: true),
  ],
  MissionGlyph.wbtb: [
    _Part(_circle(12, 13, 8)),
    const _Part('M12 9v4l2.5 1.5M4 4.5l2.5-2M20 4.5l-2.5-2'),
    const _Part('M12 5a8 8 0 0 1 6.9 4', accent: true),
  ],
  MissionGlyph.realityTest: [
    const _Part('M7.5 12V6.2a1.4 1.4 0 0 1 2.8 0V11M10.3 11V4.6a1.4 1.4 0 0 1 2.8 0V11M13.1 11V5.4a1.4 1.4 0 0 1 2.8 0V12'
        'M15.9 12V7.8a1.4 1.4 0 0 1 2.8 0v6.7a7 7 0 0 1-7 7h-.6a6.4 6.4 0 0 1-5-2.4l-2.6-3.3a1.5 1.5 0 0 1 2.2-2l1.8 1.6V12'),
    _Part(_circle(12.6, 15.6, 1.5), accent: true, fill: true),
  ],
  MissionGlyph.mild: [
    _Part(_circle(13.5, 10.5, 7.5)),
    _Part(_circle(13.5, 10.5, 3.5)),
    const _Part('M3 21l8-8M3 21h4M3 21v-4', accent: true),
    _Part(_circle(13.5, 10.5, 1.2), accent: true, fill: true),
  ],
  MissionGlyph.ssild: [
    _Part(_circle(12, 12, 8)),
    _Part(_circle(12, 4, 1.9), fill: true),
    _Part(_circle(18.9, 16, 1.9), fill: true),
    _Part(_circle(5.1, 16, 2.4), accent: true, fill: true),
```

Výstupy A:
1. `mission_icons_new.dart`:
   - Nové hodnoty do `enum MissionGlyph` a položky do `_glyphs`, jen pro významy, které ještě nemáme: falešné probuzení, noční můra, lucidita, budík, kresba, zkoumání reality, jóga snu, záměr, emoce, lekce, hvězdná mapa a podobně.
   - U ikon, které už máme (dream, rem, eye, brain, journal, voice, oura, watch…), nic neměň. Napiš jen, jestli by tvoje verze byla čitelnější a proč.
   - Tvar převeď z tvého SVG: kruhy a obdélníky přes `_circle()` a `_rect()`, oblouky přes `A`.
2. `ikony_pouziti.md`: kde v appce by se nové ikony hodily (obrazovka a prvek), nejvýš 20 míst. Obrazovky jsou Dnes, Deník (ranní zápis, detail snu, Stopy snů), Realita, Výcvik (techniky, lekce, program, laboratoř), Spánek a Nastavení.
3. `ikony_preview.html`: mřížka všech ikon (stará sada + nová) ve 24 a 48 px. Ve dne text #E9EDF5 a akcent #FF5F1F na #04060C, v noci #FF3B2F / #B3261E na černé. SVG musí vycházet ze stejných řetězců jako v Dartu.

---

## B) Model výskytu REM v2 podle tvého `algoritmus_rem_cyklu.md`: čistý Dart + backtest

Dnešní model (`rem_probability.dart`) je vážený průměr hypnogramů za posledních 60 nocí (poločas 30 dní), doplněný populační šablonou a ručními značkami „probudil jsem se ze snu“. Vyladěný je backtestem na 399 skutečných nocích uživatele. **Ta data nikdy neuvidíš: nesmí opustit telefon a jeho počítač.** Proto potřebuju následující.

1. **`rem_model_v2.dart`** (Dart 3.6, jen `dart:math`): tvůj bayesovský model ze `algoritmus_rem_cyklu.md`. Patří do něj:
   - citlivost a falešné poplachy obou zařízení,
   - korelace ρ mezi zařízeními,
   - ruční značky s omezenou váhou kvůli zkreslení vybavování,
   - „nic si nepamatuju“ (LR 0,4),
   - nejistota.

   Vstup a výstup musí sedět na náš kód, aby šel vyměnit za dnešní `remWindows`:

```dart
enum SleepStage { awake, rem, light, deep }
enum SleepSource { oura, garmin, manual }

class SleepSegment {
  const SleepSegment({required this.start, required this.end, required this.stage});

  final DateTime start;
  final DateTime end;
  final SleepStage stage;
}
class SleepNight {
  const SleepNight({
    required this.nightDate,
    required this.source,
    required this.fetchedAt,
    this.onset,
    this.wake,
    this.totalSleepMinutes,
    this.remMinutes,
    this.deepMinutes,
    this.lightMinutes,
    this.awakeMinutes,
    this.latencyMinutes,
    this.sleepScore,
    this.readiness,
    this.avgHr,
    this.lowestHr,
    this.avgHrv,
    this.segments = const [],
  });

  final DateTime nightDate;
  final SleepSource source;

  /// Kdy appka data stáhla (stáří dat pro semafor).
  final DateTime fetchedAt;
  final DateTime? onset;
  final DateTime? wake;
  final int? totalSleepMinutes;
  final int? remMinutes;
  final int? deepMinutes;
  final int? lightMinutes;
  final int? awakeMinutes;
  final int? latencyMinutes;

  /// Skóre zařízení 0–100 (Oura sleep score, Garmin sleep score).
  final int? sleepScore;

  /// Připravenost 0–100 (Oura readiness, u Garminu body battery ráno).
  final int? readiness;
  final int? avgHr;
  final int? lowestHr;

  /// Průměrné noční HRV (ms).
  final int? avgHrv;
  final List<SleepSegment> segments;
}
```

Ze snu (`Dream`) potřebuješ jen:
- `DateTime nightDate`: datum večera,
- `DateTime? dreamAt`: přibližný čas snu, null = nevím,
- `bool wokeFromDream`: probudil se z něj,
- `RecallLevel recall`: `none` = „nic si nepamatuju“.

Udělej si vlastní malou třídu `RemMark { DateTime nightDate; DateTime? at; bool woke; bool emptyNight; }`, já ji naplním.

Výstup ve stejných typech jako dnes:

```dart
enum RemLevel { unlikely, low, mid, high }

/// Úroveň z hodnoty relativní k vrcholu; [highCut] může práh vysoké zvednout (viz [RemProbabilityParams.maxHighShare]).
RemLevel remLevel(double relative, [RemProbabilityParams p = RemProbabilityParams.defaults, double? highCut]) =>
    relative >= (highCut ?? p.levelHigh)
        ? RemLevel.high
        : relative >= p.levelMid
            ? RemLevel.mid
            : relative >= p.levelLow
                ? RemLevel.low
                : RemLevel.unlikely;

/// Souvislé okno stejné úrovně v konkrétní noci.
class RemWindow {
  const RemWindow({
    required this.from,
    required this.to,
    required this.fromOffset,
    required this.toOffset,
    required this.level,
    required this.peak,
    required this.recentNights,
    required this.bothNights,
    required this.ouraOnlyNights,
    required this.garminOnlyNights,
    required this.dreamMarks,
    required this.wokeMarks,
  });

  /// Hodiny noci (od usnutí zaokrouhleného na 5 min).
  final DateTime from, to;

  /// Minuty od usnutí, [fromOffset, toOffset).
  final int fromOffset, toOffset;
  final RemLevel level;

  /// Nejvyšší relativní hodnota v okně (0–1), jen pro řazení.
  final double peak;

  /// Z posledních [recentNights] nocí: kolik mělo v okně REM na obou zařízeních / jen Oura / jen Garmin.
  final int recentNights;
  final int bothNights;
  final int ouraOnlyNights;
  final int garminOnlyNights;

  /// Ruční značky ze snů v okně (bez probuzení ze snu / s ním).
  final int dreamMarks;
  final int wokeMarks;

  bool contains(DateTime t) => !t.isBefore(from) && t.isBefore(to);
}


```

Funkce:

```dart
List<RemWindow> remWindowsV2(List<SleepNight> nights, {List<RemMark> marks = const [], required DateTime onset, required DateTime tonight, RemModelV2Params params = RemModelV2Params.defaults});
```

- Prahy úrovní relativně k vrcholu noci jako dnes: `high` nejvýš 15 % noci, okna aspoň 10 minut.
- Když model dává kalibrovanou pravděpodobnost, přidej ji do vlastního pole navíc. V UI se bez kalibrace neukáže.

2. **`rem_backtest.dart`**: harness, který si pustím sám u sebe na skutečných datech.
   - Walk-forward: noc po noci, předpověď jen z minulých nocí.
   - Metriky:
     - log skóre a Brier po 5 min,
     - podíl skutečného REM v oknech `high` / `mid` / `low` / `unlikely` (má klesat),
     - kolik noci zabírá `high`,
     - zásah nejlepšího okna (`bestRemWindow`),
     - kalibrační tabulka v decilech.
   - Rozhraní: `BacktestResult backtest(List<SleepNight> nights, List<RemMark> marks, Predictor p)`, kde `Predictor` je funkce (minulé noci, značky, onset, tonight) → `List<RemWindow>`. Jako druhý `Predictor` připojím dnešní model.
   - Pravda: REM podle Oury, když je, jinak Garminu. Dodej i variantu „jen kde se obě zařízení shodnou“.
3. **`rem_synth.dart`**: generátor syntetických nocí, podobných skutečným.
   - Cyklus kolem 95 min (SD 12), první REM po 75–110 min, REM bloky k ránu delší, hluboký spánek hlavně v první třetině, krátká probuzení.
   - Obě zařízení s chybami podle tvé rešerše přesnosti: Oura citlivost REM asi 0,76 a posun začátku, Garmin hůř.
   - Ruční značky se zkreslením: víc ráno, čas ±15 min.
4. **`rem_v2_test.dart`** (package:test, aspoň 15 testů):
   - Na syntetice je v2 aspoň tak dobrý jako jednoduchý průměr hypnogramů. Ten dodej taky, ať je s čím srovnávat.
   - Okrajové případy: jen jedno zařízení, žádné noci, noc přes půlnoc, změna času.

   Výsledek syntetického backtestu dej do `self_check_b.md`.
5. **`doporuceni_parametru.md`**: výchozí parametry a proč. Co mám ladit na skutečných datech a v jakých mezích. Jak poznám, že v2 je opravdu lepší a ne přeučený (třeba walk-forward na posledních 120 nocích proti dnešnímu modelu).

---

## C) Laboratoř: rozpis i pro experimenty s WBTB

Tvoje dvě šablony s nočním probuzením (`wbtbVsMorning`, `wbtbMildVsSsild`) appka zatím skrývá. Rozpis musí přeskakovat noci, kdy pravidla WBTB nedovolí, a to se pozná až večer (podle toho, jak ses vyspal minulou noc). Napiš čistou funkci do `nof1_wbtb.dart`, navazující na tvůj `nof1.dart`:

```dart
/// Která varianta patří na noc [night], když už proběhly [past] noci experimentu.
/// arm == null: dnes noc mimo experiment, [issues] říká proč.
({String? arm, List<WbtbIssue> issues}) wbtbArmFor({required DateTime night, required List<({DateTime night, String arm})> past, required List<String> planned, required DateTime programStart, required bool lastNightGood, required bool armANeedsWbtb, required bool armBNeedsWbtb});
```

- Rozpis (`schedule`) je pořadí položek, n-tá vhodná noc dostane n-tou položku.
- Varianta bez WBTB smí běžet i v noci, kdy WBTB nejde, ale tak, aby se nerozbila vyváženost. Navrhni pravidlo a zdůvodni ho.
- Přidej testy `nof1_wbtb_test.dart` (aspoň 10) a chybějící texty `lab.wbtb.*`.

Kvalita má přednost před rychlostí. Díky!
