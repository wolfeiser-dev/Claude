# Zadání pro cloud, kolo 5 (od hlavní vývojové session appky „Za hranice reality“)

Ahoj, kolo 4 je v appce:
- **Laboratoř s WBTB:** zapojená přes `wbtbNightPlan`. Odehrané noci zapisuje start noci a budík při experimentu řídí jen laboratoř.
- **Ikony:** přidal jsem 7 nových. `lesson`, `starMap` a `dreamYoga` jsem vynechal, protože `book`, `constellation` a `yoga` už máme. U `mild` jsem nechal jen jeden akcent.
- **Model REM v2:** prošel backtestem na 523 skutečných nocích uživatele a předem dané kritérium nesplnil. Primární log ztráta vyšla −0,0011 a 95% interval přechází přes nulu (−0,0053 až +0,0024).
  - Lepší byl jen tam, kde se Oura a Garmin shodnou (−0,0096, interval −0,0153 až −0,0048).
  - Jeho pravděpodobnost je výborně kalibrovaná (ECE 0,006).
  - Úroveň `mid` nafukoval na 49 % noci.

  Proto zůstává mimo appku. Při testu se navíc ukázalo, že dnešní `_prepare` byl kvadratický, to už je opravené. Díky!

Kredity nešetři. Pracuj samostatně a na nic se neptej. Výstupy commitni a pushni do téhle větve (`claude/lucidni-sneni-vyzkum-bxf3tp`), složka `za_hranice_reality/kolo5/`. Na konec dej `PREHLED.md`.

Pořadí: **A → B → C**.

---

## A) Korektura a sjednocení všech textů appky (`kolo5/content/`)

Ve složce `kolo5/content/` jsou **všechny** obsahové soubory appky, tedy všechno, co uživatel čte: texty UI `copy*.json`, techniky, lekce, program, reflexe, testy reality, bezpečnost, laboratoř a novinky. Vedle nich je `SLOVNIK.md` (tón a pojmy).

Uživatel chce, aby appka mluvila **co nejvíc česky a lidsky**: jako zkušený kamarád‑vědec, tykání, krátké věty, nejdřív pokyn, pak metafora, bez esoteriky a bez mentorování. Texty psalo víc autorů (lidi i AI) a je to na nich znát.

Udělej důkladnou redakci:
- pravopis, interpunkci a typografii (české uvozovky „“, nezlomitelné mezery po jednopísmenných předložkách a spojkách smí zůstat),
- přirozený slovosled a pryč s AI nádechem (vata, „je důležité“, „pojďme“, trojice přídavných jmen, anglicismy),
- jednotné pojmy podle `SLOVNIK.md`,
- stejný tón napříč appkou,
- žádné procento jistoty bez kalibrace,
- techniky vždy českým názvem první a zkratkou druhotně.

**Neměň:**
- klíče, `id`, strukturu JSON, pořadí položek ani čísla (minuty, dny, `answer`, `order`, `count`),
- `techniqueId`, `evidence` a `tag`,
- zdroje (`source`, `sources`, autoři a roky),
- zástupné symboly `{…}` (ty musí zůstat přesně stejné),
- odborný obsah. Když narazíš na věcnou chybu, neopravuj ji v textu, napiš ji do `vecne_pochybnosti.md`.

Tvrdé limity (appka je hlídá testy):
- `nightSteps` a texty noční obrazovky: nejvýš 6 slov,
- `notification` a `silent` u podnětů: nejvýš 60 znaků,
- `intention.when` nesmí začínat „Když“ a `then` nesmí začínat „tak“ (appka to doplňuje sama),
- popisky ilustrací `training.art.*`: VELKÁ PÍSMENA, 1–3 slova,
- nikde dlouhá pomlčka „—“,
- nepoužívej slova: binaur, 40 Hz (jen jako vyvrácený mýtus v lekci a reflexi), astráln, Calea, Castaned, Senoi, krystal, šišink, „na povel“.

Výstupy A:
1. `content_opraveno/`: stejné soubory, stejné názvy a platný JSON (2 mezery, UTF‑8, `ensure_ascii` vypnuté).
2. `zmeny.md`: přehled po souborech s počtem úprav a 15 nejzajímavějších příkladů „před → po“.
3. `vecne_pochybnosti.md`: co ti věcně nesedí, se zdůvodněním a zdrojem.
4. `check_a.py` (nebo Dart): skript, který ověří, že:
   - se nezměnil žádný klíč, `id`, číslo ani zástupný symbol,
   - platí výše uvedené limity.

   Spusť ho a výstup dej do `PREHLED.md`.

---

## B) Od Stopy snů ke spouštěči (tvoje funkce č. 2 z `inovace.md`, UX TOP 2)

Čistý Dart 3.6 (jen `dart:math`), soubor `dream_sign_triggers.dart`, k němu testy `dream_sign_triggers_test.dart` (package:test, aspoň 15) a texty `triggers_texty.json` (`{"texts":{"triggers":{…}}}`, tykání, krátce).

Naše modely, které appka předá (zkopíruj si je do testů jako typy):

```dart
enum DreamSignCategory { action, context, form, awareness }

class DreamSign {
  const DreamSign({
    required this.id,
    required this.label,
    required this.category,
    this.count = 0,
  });

  final String id;
  final String label;
  final DreamSignCategory category;
  final int count;
}
enum Technique { mild, ssild, wbtb, realityCheck, dreamYoga, none }
enum TranscriptStatus { none, pending, done, failed }
enum RecallLevel { none, fragment, partial, full }

class Dream {
  const Dream({
    required this.id,
    required this.createdAt,
    required this.nightDate,
    this.title = '',
    this.text = '',
    this.audioPath,
    this.transcriptStatus = TranscriptStatus.none,
    this.recall = RecallLevel.partial,
    this.vividness = 5,
    this.lucid = false,
    this.lucidity = 0,
    this.control,
    this.mood,
    this.nightmare = false,
    this.falseAwakening = false,
    this.recurring = false,
    this.realityCheckInDream = false,
    this.dreamAt,
    this.wokeFromDream = false,
    this.emotions = const [],
    this.signIds = const [],
    this.tags = const [],
    this.sketchPaths = const [],
    this.technique = Technique.none,
    this.afterWbtb = false,
  });

  final String id;
  final DateTime createdAt;

  /// Datum večera, kdy uživatel šel spát.
  final DateTime nightDate;
  final String title;
  final String text;
  final String? audioPath;
  final TranscriptStatus transcriptStatus;
  final RecallLevel recall;

  /// Živost 0–10.
  final int vividness;
  final bool lucid;

  /// Míra lucidity 0–10 (0 = vůbec, 10 = plně vědomý). Smysl má hlavně u [lucid].
  final int lucidity;

  /// Kontrola nad snem 0–10; null = nezadáno.
  final int? control;

  /// Ladění snu 0–10 (0 = hrůza, 5 = neutrální, 10 = nádhera); null = nezadáno.
  final int? mood;
  final bool nightmare;

  /// Falešné probuzení (zdálo se mi, že vstávám).
  final bool falseAwakening;

  /// Opakující se sen.
  final bool recurring;

  /// Ve snu jsem udělal test reality (hlavní metrika přenosu návyku do snu).
  final bool realityCheckInDream;

  /// Přibližný čas snu (u [wokeFromDream] čas probuzení z něj); null = nevím, nezapočítá se do REM mapy.
  final DateTime? dreamAt;

  /// Probudil jsem se přímo z tohoto snu (silnější signál REM těsně před [dreamAt]).
  final bool wokeFromDream;
  final List<String> emotions;
  final List<String> signIds;

  /// Vlastní klíčová slova uživatele (malá písmena, bez #).
  final List<String> tags;

  /// Cesty k PNG kresbám snu (aplikační složka).
  final List<String> sketchPaths;
  final Technique technique;
  final bool afterWbtb;

  /// Prázdná noc (nic si nepamatuju) je platný zápis.
  bool get isEmptyNight => recall == RecallLevel.none;
  // … copyWith a další metody vynechány
}

```

`DreamSignCategory`: `action` = děj, `context` = souvislosti, `form` = podoba, `awareness` = vnitřní prožitek.

Funkce:
1. `List<TriggerSuggestion> suggestTriggers(List<DreamSign> signs, List<Dream> dreams, {required DateTime now, int max = 3})`: z nejčastějších a nedávných Stop snů navrhne osobní plán „když–pak“ pro den i pro noc. Příklad: Stopa „škola“ → ve dne „Když uvidím školu nebo budu něco hledat, zastavím se a udělám test reality“, večer záměr „Až budu ve škole, poznám, že sním“.
   - Zohledni kategorii: `context` a `action` se dají potkat ve dne, `form` a `awareness` spíš jako večerní záměr.
   - Zohledni recency, třeba poločas 14 nocí, a variabilitu, ať se nenabízí pořád totéž.
   - `TriggerSuggestion` navrhni sám: id, signId, druh (den/večer), text `when`/`then` (bez „Když“/„tak“, appka je doplní), krátké zdůvodnění a skóre.
2. `TransferStats transferStats(List<DreamSign> signs, List<Dream> dreams, {required DateTime since})`: měření přenosu do snu.
   - Pro každou Stopu: kolik snů ji obsahovalo, v kolika z nich byl `realityCheckInDream`, v kolika `lucid`, a jak to vypadá před a po začátku plánu (`since`).
   - Malé vzorky ošetři poctivě: bez procent jistoty, slovní verdikt a přirozené četnosti typu „ve 2 ze 7 snů“. Klidně využij logiku verdiktů z `nof1.dart`.
3. `List<String> realityPromptsFromSigns(…)`: 3–5 krátkých podnětů pro notifikaci (≤ 60 znaků) postavených na Stopách uživatele, s jeho slovy (`label`). Ošetři skloňování: label je, jak ho uživatel zapsal, často 1. pád. Navrhni bezpečné šablony, které skloňování nepotřebují, třeba „Stopa snu: škola. Sníš?“.

Testy:
- prázdná data,
- jedna Stopa,
- 50 Stop,
- staré sny bez nových,
- Stopa bez snů,
- deterministické pořadí,
- žádná dlouhá pomlčka,
- délky textů.

---

## C) Rekonstrukce noci podle REM oken (tvoje funkce č. 5, UX TOP 5)

Ráno appka zná odhad oken REM pro uplynulou noc. Typy z kola 4 (`RemWindow`, `RemLevel`) už máš v `kolo4/B/rem_types.dart`. K tomu zná obvyklé usnutí a probuzení a sny zapsané k té noci (`Dream.dreamAt`, `wokeFromDream`). Čistý Dart, soubor `night_reconstruction.dart`, testy (aspoň 12) a texty `rekonstrukce_texty.json`:

`List<RecallPrompt> reconstructNight({required List<RemWindow> windows, required DateTime wake, required List<Dream> dreamsThatNight, int max = 4})`:
- postup od posledního okna k prvnímu, protože nejčerstvější sen je ten poslední,
- u každého okna krátká otázka na vybavení s časem („Kolem 5:20 jsi nejspíš snil. Co se dělo?“) a varianta, když v tom okně už sen zapsaný je („K 5:20 máš zapsaný sen. Navázal na něj ještě jiný?“),
- okna `unlikely` vynech a `low` jen když nic jiného není,
- časy zaokrouhlené na 10 minut, protože jde o odhad.

Navrhni i krátké zásady UI (5–8 bodů) do `rekonstrukce_ui.md`:
- kdy rekonstrukci nabídnout (hned po „Nic si nepamatuju“ a po prvním zapsaném snu),
- jak dlouho,
- jak neotravovat,
- jak to funguje v noční červené.

---

Kvalita má přednost před rychlostí. Díky!
