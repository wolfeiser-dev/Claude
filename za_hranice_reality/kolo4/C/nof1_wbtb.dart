/// Osobní laboratoř: rozpis experimentů s Probuzením a návratem do spánku (WBTB).
///
/// Čistý Dart 3.6, jen `nof1.dart` (ten jen `dart:math`). Žádné I/O, žádné
/// `DateTime.now()`: o tom, která noc je „dnes“, rozhoduje volající.
///
/// ## Pravidlo vyváženosti: společná způsobilost (obě varianty čekají)
///
/// Noc patří experimentu, jen když by na ni šlo WBTB podle [wbtbIssues]
/// (po 14. dni programu, po dobré noci, ne den po noci s WBTB, nejvýš 2 noci
/// s WBTB v libovolných 7 nocích). Platí to **pro obě varianty**, tedy
/// i pro variantu bez WBTB. Jinak noc dostane `arm == null` („dnes mimo
/// experiment“) a pořadí rozpisu čeká: n-tá noc experimentu vždy dostane
/// n-tou položku [planned].
///
/// Varianta bez WBTB se do limitu nepočítá (noc A u `wbtbVsMorning` neblokuje
/// následující noc ani týdenní limit), ale na nocích, kdy WBTB nejde, se
/// v experimentu nespouští. Důvody:
///
/// 1. **Výběrové zkreslení a chybějící překryv.** Noci, kdy WBTB nejde, jsou
///    systematicky jiné: po špatné noci, den po probuzení (únava, odraz REM)
///    nebo v týdnu, kde už dvě probuzení byla. Kdyby na nich běžela varianta
///    bez WBTB, měla by jen ona noci po špatném spánku a po probuzení,
///    varianta s WBTB nikdy. Rozdíl variant by se smíchal s kvalitou
///    předchozí noci. Opravit to kovariátou nejde: varianta s WBTB na takových
///    nocích nemá ani jedno pozorování (porušená pozitivita), model by musel
///    extrapolovat.
/// 2. **Přenos.** Den po noci s WBTB nejde žádná noc experimentu, takže každá
///    noc experimentu (A i B) má aspoň jednu noc odstupu od posledního
///    probuzení. Bez toho by noci A hned po B nesly část účinku B.
/// 3. **Rozhodnutí nezávisí na losu.** Zda noc patří experimentu, se pozná
///    dřív, než se podíváme, která varianta je na řadě. Volba nocí tak nemůže
///    zvýhodnit žádnou variantu (test „rozhodnutí je slepé k variantě“).
/// 4. **Vyváženost počtů zůstává z rozpisu.** Protože se pořadí nikdy
///    nepřeskakuje, má každý začátek experimentu stejnou nerovnováhu jako
///    začátek rozpisu: u `alternating` nejvýš 1, u bloků po 4 nejvýš 2,
///    v každém celém bloku 2× A a 2× B. Žádný čítač dluhu není potřeba.
///
/// Cena je malá: úzkým hrdlem je beztak varianta s WBTB (nejvýš 2 za 7 nocí),
/// noci A se vejdou mezi ni (viz `C_notes.md`, simulace).
///
/// Odhad tak odpovídá na otázku, kterou si člověk opravdu klade: „Na noci,
/// kdy bych WBTB mohl udělat, vyplatí se ho udělat?“
///
/// ## Data
/// * Noci se porovnávají jako kalendářní data (rok, měsíc, den), nezávisle
///   na čase, časovém pásmu a letním čase. Předávej datum večera
///   (jako `Dream.nightDate`), ne čas po půlnoci.
/// * [past] jsou noci, které už spotřebovaly položku rozpisu (zapisuj je až
///   ráno po noci). Duplicity stejného data se počítají jednou. Jiný štítek
///   než "A"/"B" (např. vyřazená noc) položku spotřebuje a pro limit WBTB se
///   bere opatrně jako noc s WBTB.
library;

import 'nof1.dart';

/// Proč noc dostala, nebo nedostala variantu.
enum WbtbNightStatus {
  /// Noc patří experimentu a dostala další položku rozpisu.
  scheduled,

  /// Noc už je v `past` zapsaná, vrací se zapsaná varianta.
  recorded,

  /// WBTB dnes nejde (`issues` neprázdné). Mimo experiment je dnes i varianta bez WBTB.
  wbtbNotAllowed,

  /// Rozpis je vyčerpaný, experiment skončil.
  experimentDone,

  /// Noc je starší než poslední zapsaná noc experimentu. Zpětně se nepřiřazuje,
  /// pořadí rozpisu by se rozhodilo.
  pastNight,

  /// U téhle noci jsou v `past` dvě různé varianty.
  conflictingRecord,
}

/// Výsledek pro jednu noc. [arm] == null: dnes noc mimo experiment.
class WbtbNightPlan {
  const WbtbNightPlan({
    required this.status,
    required this.recordedNights,
    required this.totalNights,
    required this.mixedArms,
    this.arm,
    this.issues = const [],
    this.nightNumber,
    this.armNeedsWbtb = false,
  });

  final WbtbNightStatus status;

  /// "A" / "B" u [WbtbNightStatus.scheduled]; zapsaný štítek u [WbtbNightStatus.recorded]; jinak null.
  final String? arm;

  /// Důvody z [wbtbIssues], neprázdné jen u [WbtbNightStatus.wbtbNotAllowed].
  final List<WbtbIssue> issues;

  /// Pořadí noci v experimentu (1 = první), jen když [arm] != null.
  final int? nightNumber;

  /// Kolik různých nocí experimentu je zapsaných v `past`.
  final int recordedNights;

  /// Délka rozpisu (`planned.length`).
  final int totalNights;

  /// Dnešní varianta má budík (WBTB).
  final bool armNeedsWbtb;

  /// Jedna varianta je s WBTB a druhá bez (např. `wbtbVsMorning`).
  final bool mixedArms;

  bool get inExperiment => arm != null;

  /// Řádky textu `lab.wbtb.*`. `{arm}` je id varianty ("A"/"B"); appka ho
  /// nahradí popiskem varianty ze šablony, stejně jako u verdiktu.
  List<Nof1Line> get copy => switch (status) {
        WbtbNightStatus.scheduled => [
            Nof1Line('lab.wbtb.status.scheduled', {'arm': arm!}),
            if (armNeedsWbtb) const Nof1Line('lab.wbtb.sleepFirst'),
          ],
        WbtbNightStatus.recorded => [Nof1Line('lab.wbtb.status.recorded', {'arm': arm!})],
        WbtbNightStatus.wbtbNotAllowed => [
            const Nof1Line('lab.wbtb.notTonight'),
            for (final i in issues) Nof1Line('lab.wbtb.${i.name}'),
            if (mixedArms) const Nof1Line('lab.wbtb.bothArmsWait'),
          ],
        WbtbNightStatus.experimentDone => const [Nof1Line('lab.wbtb.status.experimentDone')],
        WbtbNightStatus.pastNight => const [Nof1Line('lab.wbtb.status.pastNight')],
        WbtbNightStatus.conflictingRecord => const [Nof1Line('lab.wbtb.status.conflictingRecord')],
      };

  @override
  String toString() => 'WbtbNightPlan(${status.name}, arm: $arm, issues: $issues, night: $nightNumber)';
}

/// Která varianta patří na noc [night], když už proběhly [past] noci experimentu.
/// arm == null: dnes noc mimo experiment, [issues] říká proč (prázdné =
/// experiment skončil, noc je v minulosti nebo má sporný záznam; podrobně
/// [wbtbNightPlan]).
///
/// [planned] je rozpis (`fullSchedule`), n-tá noc experimentu dostane n-tou
/// položku. [lastNightGood]: noc před [night] nebyla špatná (při nejistotě
/// `false`, spánek má přednost). [armANeedsWbtb] / [armBNeedsWbtb]: varianta
/// obsahuje noční probuzení (viz [wbtbNeedsOf]).
({String? arm, List<WbtbIssue> issues}) wbtbArmFor({
  required DateTime night,
  required List<({DateTime night, String arm})> past,
  required List<String> planned,
  required DateTime programStart,
  required bool lastNightGood,
  required bool armANeedsWbtb,
  required bool armBNeedsWbtb,
}) {
  final p = wbtbNightPlan(
    night: night,
    past: past,
    planned: planned,
    programStart: programStart,
    lastNightGood: lastNightGood,
    armANeedsWbtb: armANeedsWbtb,
    armBNeedsWbtb: armBNeedsWbtb,
  );
  return (arm: p.arm, issues: p.issues);
}

/// Stejné rozhodnutí jako [wbtbArmFor], navíc stav, pořadí noci a texty.
WbtbNightPlan wbtbNightPlan({
  required DateTime night,
  required List<({DateTime night, String arm})> past,
  required List<String> planned,
  required DateTime programStart,
  required bool lastNightGood,
  required bool armANeedsWbtb,
  required bool armBNeedsWbtb,
}) {
  for (final item in planned) {
    if (item != 'A' && item != 'B') {
      throw ArgumentError.value(item, 'planned', 'Jen "A" nebo "B"');
    }
  }
  bool needs(String arm) => switch (arm) {
        'A' => armANeedsWbtb,
        'B' => armBNeedsWbtb,
        // Neznámý štítek: nevíme, jestli WBTB proběhlo. Opatrně ano, pokud ho některá varianta má.
        _ => armANeedsWbtb || armBNeedsWbtb,
      };

  // Zapsané noci podle kalendářního data; duplicity se slijí.
  final armsByDay = <int, Set<String>>{};
  final dateByDay = <int, DateTime>{};
  for (final e in past) {
    final k = _day(e.night);
    armsByDay.putIfAbsent(k, () => <String>{}).add(e.arm);
    dateByDay.putIfAbsent(k, () => e.night);
  }
  final days = armsByDay.keys.toList()..sort();
  final recorded = days.length;
  final mixed = armANeedsWbtb != armBNeedsWbtb;
  final d = _day(night);

  WbtbNightPlan plan(WbtbNightStatus s, {String? arm, List<WbtbIssue> issues = const [], int? number}) =>
      WbtbNightPlan(
        status: s,
        arm: arm,
        issues: List.unmodifiable(issues),
        nightNumber: number,
        recordedNights: recorded,
        totalNights: planned.length,
        armNeedsWbtb: arm != null && needs(arm),
        mixedArms: mixed,
      );

  final here = armsByDay[d];
  if (here != null) {
    if (here.length > 1) {
      return plan(WbtbNightStatus.conflictingRecord);
    }
    return plan(WbtbNightStatus.recorded, arm: here.single, number: days.indexOf(d) + 1);
  }
  if (days.isNotEmpty && days.last > d) {
    return plan(WbtbNightStatus.pastNight);
  }
  if (recorded >= planned.length) {
    return plan(WbtbNightStatus.experimentDone);
  }
  if (armANeedsWbtb || armBNeedsWbtb) {
    // Společná způsobilost: kontrola proběhne dřív, než se podíváme na planned[recorded].
    final wbtbPast = [
      for (final k in days)
        if (armsByDay[k]!.any(needs)) dateByDay[k]!,
    ];
    final issues = wbtbIssues(night, wbtbPast, programStart: programStart, lastNightGood: lastNightGood);
    if (issues.isNotEmpty) {
      return plan(WbtbNightStatus.wbtbNotAllowed, issues: issues);
    }
  }
  return plan(WbtbNightStatus.scheduled, arm: planned[recorded], number: recorded + 1);
}

/// Které varianty šablony obsahují noční probuzení. Šablona sama to nemá
/// v poli, proto je to tady výslovně; neznámá šablona s `wbtb` v
/// `techniqueIds` se bere opatrně jako WBTB v obou variantách.
({bool a, bool b}) wbtbNeedsOf(Nof1Template t) =>
    wbtbArmNeeds[t.id] ?? (t.needsWbtbNights ? (a: true, b: true) : (a: false, b: false));

/// `wbtbVsMorning`: A = jen ranní probuzení bez budíku, B = WBTB.
/// `wbtbMildVsSsild`: obě varianty po stejném WBTB, liší se technika.
const Map<String, ({bool a, bool b})> wbtbArmNeeds = {
  'wbtbVsMorning': (a: false, b: true),
  'wbtbMildVsSsild': (a: true, b: true),
};

/// Všechny klíče `lab.wbtb.*`, které tenhle soubor může vrátit
/// (část z nich už je v `laborator_texty.json` z kola 3).
List<String> nof1WbtbCopyKeys() => [
      'lab.wbtb.notTonight',
      for (final w in WbtbIssue.values) 'lab.wbtb.${w.name}',
      for (final s in WbtbNightStatus.values)
        if (s != WbtbNightStatus.wbtbNotAllowed) 'lab.wbtb.status.${s.name}',
      'lab.wbtb.sleepFirst',
      'lab.wbtb.bothArmsWait',
    ];

/// Den jako celé číslo nezávislé na čase, pásmu a letním čase (stejně jako v nof1.dart).
int _day(DateTime d) => DateTime.utc(d.year, d.month, d.day).millisecondsSinceEpoch ~/ 86400000;
