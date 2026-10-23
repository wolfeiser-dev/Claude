// Testy rozpisu experimentů s WBTB. Spuštění: `dart test`.
// V appce uprav importy na umístění nof1.dart a nof1_wbtb.dart.
// Testy obsahu hledají experiments.json a laborator_texty.json v NOF1_DATA
// (jinak ., test/, assets/, ../kolo3) a laborator_texty_wbtb.json v NOF1_WBTB_DATA
// (jinak ., test/, assets/, ../kolo4/C); když je nenajdou, přeskočí se.
import 'dart:convert';
import 'dart:io';

import 'package:nof1_pkg/nof1.dart';
import 'package:nof1_pkg/nof1_wbtb.dart';
import 'package:test/test.dart';

typedef _Past = List<({DateTime night, String arm})>;

final _start = DateTime(2026, 3, 1);

/// Noc [n] programu (1 = programStart), kalendářně bezpečně i přes letní čas.
DateTime _day(int n, [int hour = 0]) => DateTime(_start.year, _start.month, _start.day + n - 1, hour);

int _dayIndex(DateTime d) => DateTime.utc(d.year, d.month, d.day).millisecondsSinceEpoch ~/ 86400000;

WbtbNightPlan _plan(
  int n,
  _Past past,
  List<String> planned, {
  bool good = true,
  bool a = false,
  bool b = true,
}) =>
    wbtbNightPlan(
      night: _day(n),
      past: past,
      planned: planned,
      programStart: _start,
      lastNightGood: good,
      armANeedsWbtb: a,
      armBNeedsWbtb: b,
    );

/// Největší rozdíl počtů A − B přes všechny začátky seznamu.
int _maxPrefixImbalance(List<String> arms) {
  var diff = 0, worst = 0;
  for (final x in arms) {
    diff += x == 'A' ? 1 : -1;
    if (diff.abs() > worst) {
      worst = diff.abs();
    }
  }
  return worst;
}

class _SimRun {
  final past = <({DateTime night, String arm})>[];
  final wbtbDays = <int>{};
  final poorDays = <int>{};
  final afterPoor = <String, int>{'A': 0, 'B': 0};
  final afterWbtb = <String, int>{'A': 0, 'B': 0};
  final denseWeek = <String, int>{'A': 0, 'B': 0};
  bool done = false;
  int lastDay = 0;
}

/// Simulace večer po večeru. [pBad] = šance na špatnou noc (po noci s WBTB o 0,15 víc),
/// [pSkip] = šance, že člověk vhodnou noc experimentu vynechá (nezapíše ji).
/// [relaxed]: srovnávací volné pravidlo (varianta bez WBTB běží i v noci, kdy WBTB nejde,
/// kromě prvních 14 dní). V nof1_wbtb.dart není, slouží jen k ukázce zkreslení.
_SimRun _simulate({
  required List<String> planned,
  required bool a,
  required bool b,
  required int seed,
  required double pBad,
  double pSkip = 0,
  bool relaxed = false,
  int horizon = 420,
}) {
  final rng = Nof1Random(seed);
  final r = _SimRun();
  for (var i = 1; i <= horizon; i++) {
    // Čas večera se mění, data jdou přes oba přechody letního času.
    final night = _day(i, rng.nextInt(2) == 0 ? 0 : 22);
    final good = !r.poorDays.contains(i - 1);
    final p = wbtbNightPlan(
      night: night,
      past: r.past,
      planned: planned,
      programStart: _start,
      lastNightGood: good,
      armANeedsWbtb: a,
      armBNeedsWbtb: b,
    );
    if (p.status == WbtbNightStatus.experimentDone) {
      r.done = true;
      break;
    }
    var arm = p.arm;
    if (relaxed && arm == null && !p.issues.contains(WbtbIssue.inFirst14Days)) {
      final next = planned[r.past.length];
      if (!(next == 'A' ? a : b)) {
        arm = next;
      }
    }
    var wbtbTonight = false;
    if (arm != null && rng.nextDouble() >= pSkip) {
      r.past.add((night: night, arm: arm));
      r.lastDay = i;
      if (!good) {
        r.afterPoor[arm] = r.afterPoor[arm]! + 1;
      }
      if (r.wbtbDays.contains(i - 1)) {
        r.afterWbtb[arm] = r.afterWbtb[arm]! + 1;
      }
      if ([for (var j = i - 6; j < i; j++) j].where(r.wbtbDays.contains).length >= 2) {
        r.denseWeek[arm] = r.denseWeek[arm]! + 1;
      }
      wbtbTonight = arm == 'A' ? a : b;
      if (wbtbTonight) {
        r.wbtbDays.add(i);
      }
    }
    if (rng.nextDouble() < pBad + (wbtbTonight ? 0.15 : 0)) {
      r.poorDays.add(i);
    }
  }
  return r;
}

Directory? _findDir(String? env, List<String> fallbacks, List<String> files) {
  for (final c in [if (env != null) env, ...fallbacks]) {
    if (files.every((f) => File('$c/$f').existsSync())) {
      return Directory(c);
    }
  }
  return null;
}

String? _lookup(Map<String, dynamic> texts, String key) {
  Object? node = texts;
  for (final part in key.split('.')) {
    if (node is! Map<String, dynamic>) {
      return null;
    }
    node = node[part];
  }
  return node is String ? node : null;
}

/// Všechny listové klíče stromu textů.
Iterable<String> _leafKeys(Map<String, dynamic> m, [String prefix = '']) sync* {
  for (final e in m.entries) {
    final k = prefix.isEmpty ? e.key : '$prefix.${e.key}';
    if (e.value is Map<String, dynamic>) {
      yield* _leafKeys(e.value as Map<String, dynamic>, k);
    } else {
      yield k;
    }
  }
}

/// Šablony s WBTB: z experiments.json, když je k dispozici, jinak záložní kopie (id, rozpis, délka).
List<Nof1Template> _wbtbTemplates(Directory? data) {
  if (data != null) {
    final list = (jsonDecode(File('${data.path}/experiments.json').readAsStringSync()) as Map)['experiments'] as List;
    return [
      for (final e in list.cast<Map<String, dynamic>>())
        if (Nof1Template.fromJson(e).needsWbtbNights) Nof1Template.fromJson(e),
    ];
  }
  Nof1Template t(String id, String design, List<String> tech) => Nof1Template(
      id: id, design: design, nights: 20, minNightsPerArm: 8, outcomes: const ['lucid'], primary: 'lucid', techniqueIds: tech);
  return [t('wbtbVsMorning', 'randomBlocks', ['wbtb', 'mild']), t('wbtbMildVsSsild', 'alternating', ['wbtb', 'mild', 'ssild'])];
}

void main() {
  final data = _findDir(Platform.environment['NOF1_DATA'], ['.', 'test', 'assets', '../kolo3'],
      ['experiments.json', 'laborator_texty.json']);
  final wbtbData =
      _findDir(Platform.environment['NOF1_WBTB_DATA'], ['.', 'test', 'assets', '../kolo4/C'], ['laborator_texty_wbtb.json']);

  group('Pravidlo pro jednu noc', () {
    test('n-tá vhodná noc dostane n-tou položku rozpisu', () {
      const planned = ['B', 'A', 'A', 'B'];
      final past = <({DateTime night, String arm})>[];
      final got = <String>[];
      final numbers = <int>[];
      for (var n = 15; n <= 40 && got.length < planned.length; n++) {
        final p = _plan(n, past, planned);
        if (p.arm != null) {
          got.add(p.arm!);
          numbers.add(p.nightNumber!);
          past.add((night: _day(n), arm: p.arm!));
        }
      }
      expect(got, planned);
      expect(numbers, [1, 2, 3, 4]);
      // Noc 15 = B (WBTB), 16 mimo (po sobě), 17 = A, 18 = A (noc A se nepočítá), 19 = B.
      expect([for (final e in past) _dayIndex(e.night) - _dayIndex(_start) + 1], [15, 17, 18, 19]);
    });

    test('prvních 14 dní je mimo experiment pro obě varianty', () {
      for (final first in ['A', 'B']) {
        final p = _plan(14, [], [first, 'B']);
        expect(p.arm, isNull);
        expect(p.issues, [WbtbIssue.inFirst14Days]);
        expect(p.status, WbtbNightStatus.wbtbNotAllowed);
      }
      expect(_plan(15, [], ['A', 'B']).arm, 'A');
    });

    test('po špatné noci čeká i varianta bez WBTB (společná způsobilost)', () {
      for (final next in ['A', 'B']) {
        final r = wbtbArmFor(
            night: _day(20),
            past: const [],
            planned: [next],
            programStart: _start,
            lastNightGood: false,
            armANeedsWbtb: false,
            armBNeedsWbtb: true);
        expect(r.arm, isNull, reason: 'planned $next');
        expect(r.issues, [WbtbIssue.afterPoorSleep]);
      }
      final p = _plan(20, [], ['A'], good: false);
      expect(p.copy.map((l) => l.key), ['lab.wbtb.notTonight', 'lab.wbtb.afterPoorSleep', 'lab.wbtb.bothArmsWait']);
      // U šablony, kde mají WBTB obě varianty, se věta o čekání varianty bez budíku neukazuje.
      expect(_plan(20, [], ['A'], good: false, a: true).copy.map((l) => l.key), isNot(contains('lab.wbtb.bothArmsWait')));
    });

    test('noc A se do limitu nepočítá, noc s WBTB ano; den po WBTB nejde nic', () {
      // wbtbVsMorning: včera A → dnes cokoli.
      expect(_plan(21, [(night: _day(20), arm: 'A')], ['A', 'B']).arm, 'B');
      // Včera B → dnes mimo experiment i pro plánovanou A (odstup od probuzení).
      final afterB = _plan(21, [(night: _day(20), arm: 'B')], ['B', 'A']);
      expect(afterB.arm, isNull);
      expect(afterB.issues, [WbtbIssue.consecutiveNights]);
      // Dvě B za posledních 7 nocí → třetí nejde, ani když jsou mezi nimi noci A.
      final two = <({DateTime night, String arm})>[
        (night: _day(15), arm: 'B'),
        (night: _day(16), arm: 'A'),
        (night: _day(17), arm: 'B'),
        (night: _day(18), arm: 'A'),
      ];
      final p = _plan(19, two, ['B', 'A', 'B', 'A', 'A', 'B']);
      expect(p.arm, isNull);
      expect(p.issues, [WbtbIssue.moreThanTwoPerWeek]);
      expect(_plan(22, two, ['B', 'A', 'B', 'A', 'A', 'B']).arm, 'A');
      // wbtbMildVsSsild: obě varianty mají WBTB, takže i noc A blokuje další noc.
      expect(_plan(21, [(night: _day(20), arm: 'A')], ['A', 'B'], a: true).issues, [WbtbIssue.consecutiveNights]);
    });

    test('rozhodnutí, zda noc patří experimentu, je slepé k plánované variantě', () {
      final rng = Nof1Random(4242);
      for (var rep = 0; rep < 3000; rep++) {
        final past = <({DateTime night, String arm})>[];
        var day = 1 + rng.nextInt(20);
        final count = rng.nextInt(8);
        for (var k = 0; k < count; k++) {
          past.add((night: _day(day), arm: rng.nextInt(2) == 0 ? 'A' : 'B'));
          day += 1 + rng.nextInt(3);
        }
        final tonight = day + rng.nextInt(3);
        final base = [for (var k = 0; k < count + 1; k++) rng.nextInt(2) == 0 ? 'A' : 'B'];
        final flipped = [...base]..[count] = base[count] == 'A' ? 'B' : 'A';
        final good = rng.nextDouble() < 0.7;
        for (final needs in [(a: false, b: true), (a: true, b: true)]) {
          final x = _plan(tonight, past, base, good: good, a: needs.a, b: needs.b);
          final y = _plan(tonight, past, flipped, good: good, a: needs.a, b: needs.b);
          expect(x.inExperiment, y.inExperiment);
          expect(x.issues, y.issues);
          expect(x.status, y.status);
        }
      }
    });

    test('zapsaná noc, sporný záznam, noc v minulosti a konec rozpisu', () {
      final past = <({DateTime night, String arm})>[
        (night: _day(15), arm: 'B'),
        (night: _day(17), arm: 'A'),
      ];
      final again = _plan(17, past, ['B', 'A', 'B'], good: false);
      expect(again.status, WbtbNightStatus.recorded);
      expect(again.arm, 'A');
      expect(again.nightNumber, 2);
      expect(again.copy.single.args, {'arm': 'A'});

      final conflict = _plan(17, [...past, (night: _day(17, 22), arm: 'B')], ['B', 'A', 'B']);
      expect(conflict.status, WbtbNightStatus.conflictingRecord);
      expect(conflict.arm, isNull);

      final old = _plan(16, past, ['B', 'A', 'B']);
      expect(old.status, WbtbNightStatus.pastNight);
      expect(old.arm, isNull);
      expect(old.issues, isEmpty);

      final done = _plan(20, past, ['B', 'A']);
      expect(done.status, WbtbNightStatus.experimentDone);
      expect(done.arm, isNull);
      expect(done.issues, isEmpty);
      expect(_plan(20, const [], const []).status, WbtbNightStatus.experimentDone);
      // Konec rozpisu má přednost před pravidly WBTB (po skončení nic nehlásí).
      expect(_plan(18, past, ['B', 'A'], good: false).status, WbtbNightStatus.experimentDone);
    });

    test('duplicity a pořadí v past výsledek nemění, vstupy zůstanou nedotčené', () {
      final past = List<({DateTime night, String arm})>.unmodifiable([
        (night: _day(15), arm: 'B'),
        (night: _day(18), arm: 'A'),
        (night: _day(19), arm: 'B'),
      ]);
      const planned = ['B', 'A', 'B', 'A', 'B'];
      final plannedView = List<String>.unmodifiable(planned);
      final base = _plan(21, past, plannedView);
      final messy = List<({DateTime night, String arm})>.unmodifiable([
        past[2],
        (night: _day(15, 23), arm: 'B'),
        past[0],
        (night: DateTime.utc(2026, 3, 18, 6), arm: 'A'),
        past[1],
      ]);
      final again = _plan(21, messy, plannedView);
      expect(base.status, WbtbNightStatus.scheduled);
      expect(again.arm, base.arm);
      expect(again.nightNumber, 4);
      expect(again.recordedNights, 3);
      // Opakované volání dá totéž (bez skrytého stavu).
      for (var k = 0; k < 5; k++) {
        expect(_plan(21, messy, plannedView).toString(), base.toString());
      }
      expect(past.length, 3);
      expect(plannedView, planned);
    });

    test('kalendářní data: čas noci, UTC proti místnímu času, přechody letního času', () {
      // Večer 22:30 a půlnoc stejného data jsou tatáž noc.
      final p1 = wbtbNightPlan(
          night: DateTime(2026, 3, 20, 22, 30),
          past: [(night: DateTime.utc(2026, 3, 19, 23, 59), arm: 'B')],
          planned: const ['B', 'A'],
          programStart: DateTime.utc(2026, 3, 1, 18),
          lastNightGood: true,
          armANeedsWbtb: false,
          armBNeedsWbtb: true);
      expect(p1.issues, [WbtbIssue.consecutiveNights]);
      // Přechod na letní čas (29. 3. 2026) a zpět (25. 10. 2026): sousední data jsou pořád „po sobě“.
      for (final (y, m, d) in [(2026, 3, 29), (2026, 10, 25)]) {
        final start = DateTime(y, m, d - 30);
        final r = wbtbArmFor(
            night: DateTime(y, m, d + 1, 0, 30),
            past: [(night: DateTime(y, m, d, 23, 30), arm: 'B')],
            planned: const ['B', 'B'],
            programStart: start,
            lastNightGood: true,
            armANeedsWbtb: false,
            armBNeedsWbtb: true);
        expect(r.issues, [WbtbIssue.consecutiveNights], reason: '$y-$m-$d');
        final ok = wbtbArmFor(
            night: DateTime(y, m, d + 2, 21),
            past: [(night: DateTime(y, m, d, 23, 30), arm: 'B')],
            planned: const ['B', 'B'],
            programStart: start,
            lastNightGood: true,
            armANeedsWbtb: false,
            armBNeedsWbtb: true);
        expect(ok.arm, 'B', reason: '$y-$m-$d');
      }
      // 14 dní se počítá v kalendářních dnech i přes změnu času (program od 15. 3., den 15 = 29. 3.).
      final s = DateTime(2026, 3, 15, 21);
      expect(wbtbArmFor(
              night: DateTime(2026, 3, 28, 23),
              past: const [],
              planned: const ['A'],
              programStart: s,
              lastNightGood: true,
              armANeedsWbtb: false,
              armBNeedsWbtb: true)
          .issues, [WbtbIssue.inFirst14Days]);
      expect(wbtbArmFor(
              night: DateTime(2026, 3, 29, 1),
              past: const [],
              planned: const ['A'],
              programStart: s,
              lastNightGood: true,
              armANeedsWbtb: false,
              armBNeedsWbtb: true)
          .arm, 'A');
    });

    test('bez WBTB v obou variantách běží každá noc v pořadí rozpisu', () {
      final planned = schedule('randomBlocks', 12, 3);
      final past = <({DateTime night, String arm})>[];
      for (var n = 1; n <= 12; n++) {
        final p = _plan(n, past, planned, good: n.isEven, a: false, b: false);
        expect(p.issues, isEmpty);
        expect(p.arm, planned[n - 1]);
        expect(p.armNeedsWbtb, isFalse);
        past.add((night: _day(n), arm: p.arm!));
      }
      expect(_plan(13, past, planned, a: false, b: false).status, WbtbNightStatus.experimentDone);
    });

    test('neplatný rozpis vyhodí chybu, neznámý štítek v past se bere opatrně jako WBTB', () {
      expect(() => _plan(20, const [], const ['A', 'C']), throwsArgumentError);
      // Vyřazená noc "X" spotřebuje položku a blokuje další noc i u varianty B.
      final p = _plan(21, [(night: _day(20), arm: 'X')], ['A', 'B']);
      expect(p.issues, [WbtbIssue.consecutiveNights]);
      final q = _plan(22, [(night: _day(20), arm: 'X')], ['A', 'B']);
      expect(q.arm, 'B');
      expect(q.nightNumber, 2);
    });

    test('wbtbArmFor vrací totéž co wbtbNightPlan; texty mají správné argumenty', () {
      final rng = Nof1Random(99);
      final seen = <WbtbNightStatus>{};
      for (var rep = 0; rep < 2000; rep++) {
        final past = <({DateTime night, String arm})>[];
        var day = 10 + rng.nextInt(10);
        for (var k = rng.nextInt(5); k > 0; k--) {
          past.add((night: _day(day), arm: ['A', 'B', 'B'][rng.nextInt(3)]));
          day += rng.nextInt(3);
        }
        final planned = [for (var k = rng.nextInt(6); k > 0; k--) rng.nextInt(2) == 0 ? 'A' : 'B'];
        final tonight = day - 1 + rng.nextInt(4);
        final good = rng.nextDouble() < 0.7;
        final a = rng.nextInt(2) == 0;
        final p = _plan(tonight, past, planned, good: good, a: a);
        final r = wbtbArmFor(
            night: _day(tonight),
            past: past,
            planned: planned,
            programStart: _start,
            lastNightGood: good,
            armANeedsWbtb: a,
            armBNeedsWbtb: true);
        expect(r.arm, p.arm);
        expect(r.issues, p.issues);
        expect(p.issues.isNotEmpty, p.status == WbtbNightStatus.wbtbNotAllowed);
        expect(p.inExperiment, p.status == WbtbNightStatus.scheduled || p.status == WbtbNightStatus.recorded);
        seen.add(p.status);
        for (final line in p.copy) {
          expect(nof1WbtbCopyKeys(), contains(line.key));
          final wantsArm = line.key.startsWith('lab.wbtb.status.scheduled') || line.key.startsWith('lab.wbtb.status.recorded');
          expect(line.args.keys.toSet(), wantsArm ? {'arm'} : <String>{});
        }
      }
      expect(seen, WbtbNightStatus.values.toSet());
    });
  });

  group('Simulace', () {
    final templates = _wbtbTemplates(data);

    test('obě šablony, 300 seedů × 3 úrovně špatných nocí: pravidla, pořadí, vyváženost', () {
      expect(templates.map((t) => t.id), containsAll(['wbtbVsMorning', 'wbtbMildVsSsild']));
      for (final t in templates) {
        final needs = wbtbNeedsOf(t);
        for (final pBad in [0.1, 0.25, 0.5]) {
          for (var s = 0; s < 300; s++) {
            final planned = fullSchedule(t.design, t.nights, seedFrom('${t.id}|$s'));
            final r = _simulate(planned: planned, a: needs.a, b: needs.b, seed: 1000 * s + 7, pBad: pBad, pSkip: 0.1);
            final why = '${t.id} pBad $pBad seed $s';
            expect(r.done, isTrue, reason: '$why: experiment do 420 dní skončí');
            final arms = [for (final e in r.past) e.arm];
            // Pořadí = rozpis, nic se nepřeskočí ani nepřehodí.
            expect(arms, planned, reason: why);
            // Vyváženost: na každém začátku stejná jako v rozpisu (bloky po 4: ≤ 2, střídání: ≤ 1).
            expect(_maxPrefixImbalance(arms), lessThanOrEqualTo(t.design == 'alternating' ? 1 : 2), reason: why);
            if (t.design == 'randomBlocks') {
              for (var k = 0; k + 4 <= t.nights; k += 4) {
                expect(arms.sublist(k, k + 4).where((x) => x == 'A').length, 2, reason: why);
              }
            }
            // Pravidla WBTB nad skutečnými nocemi s probuzením (nezávislá kontrola z nof1.dart).
            final wbtbNights = [
              for (final e in r.past)
                if (e.arm == 'A' ? needs.a : needs.b) e.night,
            ];
            final poor = {for (final d in r.poorDays) _day(d)};
            expect(validateWbtbPlan(wbtbNights, programStart: _start, poorSleepNights: poor), isEmpty, reason: why);
            // Žádná noc experimentu (ani bez WBTB) po špatné noci, den po WBTB, v hustém týdnu ani v prvních 14 dnech.
            expect(r.afterPoor.values, everyElement(0), reason: why);
            expect(r.afterWbtb.values, everyElement(0), reason: why);
            expect(r.denseWeek.values, everyElement(0), reason: why);
            expect(r.past.every((e) => _dayIndex(e.night) - _dayIndex(_start) + 1 > 14), isTrue, reason: why);
            // Data jsou ostře rostoucí (žádná noc dvakrát).
            for (var k = 1; k < r.past.length; k++) {
              expect(_dayIndex(r.past[k].night), greaterThan(_dayIndex(r.past[k - 1].night)), reason: why);
            }
          }
        }
      }
    });

    test('volné pravidlo by srovnání zkreslilo, společná způsobilost ne', () {
      final t = templates.firstWhere((t) => t.id == 'wbtbVsMorning');
      final needs = wbtbNeedsOf(t);
      expect(needs, (a: false, b: true));
      var strictA = 0, relaxedPoorA = 0, relaxedAfterWbtbA = 0, relaxedA = 0, strictDays = 0, relaxedDays = 0;
      for (var s = 0; s < 300; s++) {
        final planned = fullSchedule(t.design, t.nights, seedFrom('${t.id}|$s'));
        final strict = _simulate(planned: planned, a: needs.a, b: needs.b, seed: s, pBad: 0.25);
        final relaxed = _simulate(planned: planned, a: needs.a, b: needs.b, seed: s, pBad: 0.25, relaxed: true);
        expect(strict.afterPoor['A']! + strict.afterPoor['B']!, 0);
        expect(relaxed.afterPoor['B'], 0);
        strictA += strict.past.where((e) => e.arm == 'A').length;
        relaxedA += relaxed.past.where((e) => e.arm == 'A').length;
        relaxedPoorA += relaxed.afterPoor['A']!;
        relaxedAfterWbtbA += relaxed.afterWbtb['A']!;
        strictDays += strict.lastDay;
        relaxedDays += relaxed.lastDay;
      }
      expect(strictA, relaxedA);
      // Volné pravidlo: noci A po špatné noci a hned po probuzení, noci B nikdy → zkreslení.
      expect(relaxedPoorA / relaxedA, greaterThan(0.15));
      expect(relaxedAfterWbtbA / relaxedA, greaterThan(0.4));
      // Cena společné způsobilosti: experiment trvá déle, ale ne dramaticky (do +35 %).
      expect(strictDays, greaterThan(relaxedDays));
      expect(strictDays / relaxedDays, lessThan(1.35));
    });
  });

  group('Obsah', () {
    test('wbtbNeedsOf sedí na varianty v experiments.json', () {
      final list = (jsonDecode(File('${data!.path}/experiments.json').readAsStringSync()) as Map)['experiments'] as List;
      for (final e in list.cast<Map<String, dynamic>>()) {
        final t = Nof1Template.fromJson(e);
        final needs = wbtbNeedsOf(t);
        if (!t.needsWbtbNights) {
          expect(needs, (a: false, b: false), reason: t.id);
          continue;
        }
        expect(wbtbArmNeeds.containsKey(t.id), isTrue, reason: '${t.id}: WBTB šablona musí být v wbtbArmNeeds');
        final arms = (e['arms'] as List).cast<Map<String, dynamic>>();
        for (final (i, flag) in [(0, needs.a), (1, needs.b)]) {
          final text = '${arms[i]['label']} ${arms[i]['instruction']}'.toLowerCase();
          final noAlarm = text.contains('bez budíku');
          final alarm = text.contains('budík') && !noAlarm || text.contains('wbtb');
          expect(flag, alarm, reason: '${t.id} ${arms[i]['id']}: $text');
        }
      }
    }, skip: data == null ? 'experiments.json nenalezen (nastav NOF1_DATA)' : false);

    test('laborator_texty_wbtb.json doplňuje přesně chybějící klíče lab.wbtb.*', () {
      final raw = File('${wbtbData!.path}/laborator_texty_wbtb.json').readAsStringSync();
      final add = (jsonDecode(raw) as Map<String, dynamic>)['texts'] as Map<String, dynamic>;
      final base = data == null
          ? <String, dynamic>{}
          : (jsonDecode(File('${data.path}/laborator_texty.json').readAsStringSync()) as Map<String, dynamic>)['texts']
              as Map<String, dynamic>;
      final addKeys = _leafKeys(add).map((k) => k).toSet();
      final baseKeys = _leafKeys(base).toSet();
      final codeKeys = nof1WbtbCopyKeys().toSet();
      expect(codeKeys.length, nof1WbtbCopyKeys().length, reason: 'bez duplicit');
      expect(addKeys.every((k) => k.startsWith('lab.wbtb.')), isTrue);
      // Nový soubor nic nepřepisuje a nemá nic navíc.
      expect(addKeys.intersection(baseKeys), isEmpty);
      expect(addKeys.difference(codeKeys), isEmpty, reason: 'nepoužité klíče');
      // Každý klíč z kódu je v kolo3 nebo v doplňku.
      for (final k in codeKeys) {
        expect(_lookup(add, k) ?? _lookup(base, k), isNotNull, reason: 'chybí $k');
      }
      if (data != null) {
        // Klíče z kola 3 (WbtbIssue) zůstaly v nof1CopyKeys().
        expect(nof1CopyKeys().toSet().containsAll(codeKeys.difference(addKeys)), isTrue);
      }
      // Styl: bez dlouhé pomlčky, bez sérií a trestů, krátké věty.
      expect(raw.contains('—'), isFalse);
      for (final k in addKeys) {
        final text = _lookup(add, k)!;
        expect(text.length, lessThanOrEqualTo(160), reason: k);
        expect(RegExp(r'séri|řad[auy] noc|streak|trest|selhal|prohr|ztratíš|musíš', caseSensitive: false).hasMatch(text),
            isFalse,
            reason: k);
        final placeholders = RegExp(r'\{(\w+)\}').allMatches(text).map((m) => m.group(1)).toSet();
        final wantsArm = k == 'lab.wbtb.status.scheduled' || k == 'lab.wbtb.status.recorded';
        expect(placeholders, wantsArm ? {'arm'} : <String>{}, reason: k);
      }
    }, skip: wbtbData == null ? 'laborator_texty_wbtb.json nenalezen (nastav NOF1_WBTB_DATA)' : false);
  });
}
