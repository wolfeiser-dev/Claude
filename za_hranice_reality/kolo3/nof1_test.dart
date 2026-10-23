// Testy Osobní laboratoře (N-of-1). Spuštění: `dart test`.
// V appce uprav import na umístění nof1.dart (např. package:za_hranice_reality/lab/nof1.dart).
// Testy JSON hledají experiments.json a laborator_texty.json v proměnné
// prostředí NOF1_DATA, jinak v ., test/, assets/ a ../kolo3; když je nenajdou, přeskočí se.
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:nof1_pkg/nof1.dart';
import 'package:test/test.dart';

final _start = DateTime.utc(2026, 3, 1);

List<Nof1Night> _nights(List<String> arms, Nof1Night Function(int i, String arm) make) =>
    [for (var i = 0; i < arms.length; i++) make(i, arms[i])];

/// Lucidní noci: přesně [yA] z [nA] a [yB] z [nB] (pořadí střídavé).
List<Nof1Night> _lucidCounts(int yA, int nA, int yB, int nB) {
  final out = <Nof1Night>[];
  for (var i = 0; i < nA; i++) {
    out.add(Nof1Night(night: _start.add(Duration(days: 2 * i)), arm: 'A', lucid: i < yA));
  }
  for (var i = 0; i < nB; i++) {
    out.add(Nof1Night(night: _start.add(Duration(days: 2 * i + 1)), arm: 'B', lucid: i < yB));
  }
  return out;
}

bool _isClear(Nof1Verdict v) => v == Nof1Verdict.clearA || v == Nof1Verdict.clearB;

/// Jeden pohled na konci [nights] nocí; vrací podíl jasných verdiktů (A, B).
(double, double) _simulateSingle({
  required Nof1Outcome outcome,
  required int nights,
  required int reps,
  required Nof1Night Function(DateTime night, String arm, Nof1Random rng) gen,
  String design = 'alternating',
}) {
  var a = 0, b = 0;
  for (var r = 0; r < reps; r++) {
    final rng = Nof1Random(9001 + 31 * r);
    final arms = schedule(design, nights, 500 + r);
    final data = [for (var i = 0; i < nights; i++) gen(_start.add(Duration(days: i)), arms[i], rng)];
    final v = analyzeOutcome(data, outcome, draws: 4000, seed: r).verdict;
    if (v == Nof1Verdict.clearA) {
      a++;
    }
    if (v == Nof1Verdict.clearB) {
      b++;
    }
  }
  return (a / reps, b / reps);
}

/// Sekvenčně přes kontrolní body (nocí celkem), zastaví se u jasného verdiktu
/// nebo u shody. Vrací podíl jasných verdiktů (A, B).
(double, double) _simulateLucidSequential(double pA, double pB, List<int> looks, int reps) {
  var a = 0, b = 0;
  for (var r = 0; r < reps; r++) {
    final rng = Nof1Random(424242 + 17 * r);
    final arms = schedule('randomBlocks', looks.last, 900 + r);
    final data = [
      for (var i = 0; i < looks.last; i++)
        Nof1Night(
          night: _start.add(Duration(days: i)),
          arm: arms[i],
          lucid: rng.nextDouble() < (arms[i] == 'B' ? pB : pA),
        ),
    ];
    for (var k = 0; k < looks.length; k++) {
      final v = analyzeOutcome(data.sublist(0, looks[k]), Nof1Outcome.lucid,
              finalLook: k == looks.length - 1, draws: 4000, seed: r * 7 + k)
          .verdict;
      if (v == Nof1Verdict.clearA) {
        a++;
        break;
      }
      if (v == Nof1Verdict.clearB) {
        b++;
        break;
      }
      if (v == Nof1Verdict.noDifference) {
        break;
      }
    }
  }
  return (a / reps, b / reps);
}

Directory? _findData() {
  final env = Platform.environment['NOF1_DATA'];
  final candidates = [if (env != null) env, '.', 'test', 'assets', '../kolo3'];
  for (final c in candidates) {
    if (File('$c/experiments.json').existsSync() && File('$c/laborator_texty.json').existsSync()) {
      return Directory(c);
    }
  }
  return null;
}

const _allowedTechniques = {
  'mild', 'ssild', 'wbtb', 'realityCheck', 'dreamJournal', 'recallTraining', 'wild', 'deild', 'fild', 'ada', //
  'incubation', 'stabilization', 'dreamYogaBreath', 'dreamYogaDay', 'dreamYogaRelease', 'dreamYogaIntention', //
  'dreamYogaSleep', 'lucidMission', 'meditation', 'yogaNidra', 'irt', 'grounding',
};

void main() {
  group('Plánovač', () {
    test('alternating střídá varianty, je vyvážený a deterministický', () {
      for (final n in [0, 1, 2, 13, 14, 28]) {
        final s = schedule('alternating', n, 7);
        expect(s.length, n);
        for (var i = 1; i < n; i++) {
          expect(s[i], isNot(s[i - 1]));
        }
        expect((s.where((x) => x == 'A').length - s.where((x) => x == 'B').length).abs(), lessThanOrEqualTo(1));
        expect(schedule('alternating', n, 7), s);
      }
      // Začátek je losovaný: mezi seedy se objeví oba.
      final starts = {for (var seed = 0; seed < 40; seed++) schedule('alternating', 2, seed).first};
      expect(starts, {'A', 'B'});
    });

    test('randomBlocks: každý blok 4 je 2× A a 2× B, rozdíl počtů nejvýš 1', () {
      for (var seed = 0; seed < 50; seed++) {
        for (final n in [3, 5, 14, 20, 27, 28]) {
          final s = schedule('randomBlocks', n, seed);
          expect(s.length, n);
          for (var b = 0; b + 4 <= n - n % 4; b += 4) {
            expect(s.sublist(b, b + 4).where((x) => x == 'A').length, 2);
          }
          final diff = s.where((x) => x == 'A').length - s.where((x) => x == 'B').length;
          expect(diff.abs(), lessThanOrEqualTo(1));
        }
      }
      expect(schedule('randomBlocks', 28, 11), schedule('randomBlocks', 28, 11));
      expect(schedule('randomBlocks', 28, 11), isNot(schedule('randomBlocks', 28, 12)));
      final orders = {for (var seed = 0; seed < 200; seed++) schedule('randomBlocks', 4, seed).join()};
      expect(orders.length, 6, reason: 'všech 6 vyvážených pořadí AABB');
    });

    test('randomBlocks s blokem 2 a chybné vstupy', () {
      final s = schedule('randomBlocks', 20, 3, blockSize: 2);
      for (var i = 0; i < 20; i += 2) {
        expect(s[i], isNot(s[i + 1]));
      }
      expect(() => schedule('crossover', 10, 1), throwsArgumentError);
      expect(() => schedule('alternating', -1, 1), throwsArgumentError);
      expect(() => schedule('randomBlocks', 10, 1, blockSize: 3), throwsArgumentError);
    });

    test('kontrolní body: nejvýš 4 pohledy, náznak až od konce plánu', () {
      expect(checkpoints(14), [14, 28, 42]);
      expect(checkpoints(20), [10, 20, 34, 48]);
      expect(checkpoints(28), [14, 28, 42, 56]);
      expect(finalCheckpointIndex(14), 0);
      expect(finalCheckpointIndex(28), 1);
      expect(() => checkpoints(1), throwsArgumentError);
    });

    test('fullSchedule: plán i každé prodloužení jsou vyvážené', () {
      for (final n in [14, 20, 28]) {
        for (var seed = 0; seed < 30; seed++) {
          for (final design in ['alternating', 'randomBlocks']) {
            final s = fullSchedule(design, n, seed);
            final looks = checkpoints(n);
            expect(s.length, looks.last);
            expect(s.sublist(0, n), schedule(design, n, seed));
            for (final end in looks.where((x) => x >= n)) {
              expect(s.sublist(0, end).where((x) => x == 'A').length * 2, end, reason: '$design $n do $end');
            }
          }
        }
      }
    });

    test('seedFrom je stabilní', () {
      expect(seedFrom('mildVsJournal|2026-03-01'), seedFrom('mildVsJournal|2026-03-01'));
      expect(seedFrom('a'), isNot(seedFrom('b')));
      expect(seedFrom(''), 0x811C9DC5);
    });
  });

  group('Rozdělení a generátor', () {
    test('Nof1Random je deterministický a rovnoměrný', () {
      final a = Nof1Random(42), b = Nof1Random(42);
      final xs = [for (var i = 0; i < 5; i++) a.nextUint32()];
      expect([for (var i = 0; i < 5; i++) b.nextUint32()], xs);
      final r = Nof1Random(1);
      var sum = 0.0;
      for (var i = 0; i < 100000; i++) {
        final u = r.nextDouble();
        expect(u, inInclusiveRange(0, 1));
        sum += u;
      }
      expect(sum / 100000, closeTo(0.5, 0.005));
    });

    test('Beta sampler má správný průměr a rozptyl', () {
      final r = Nof1Random(3);
      const a = 3.0, b = 7.0;
      var s = 0.0, s2 = 0.0;
      const n = 60000;
      for (var i = 0; i < n; i++) {
        final x = r.nextBeta(a, b);
        s += x;
        s2 += x * x;
      }
      final mean = s / n, variance = s2 / n - mean * mean;
      expect(mean, closeTo(0.3, 0.003));
      expect(variance, closeTo(a * b / ((a + b) * (a + b) * (a + b + 1)), 0.001));
      // Malý tvar (< 1) z personalizovaného prioru.
      var t = 0.0;
      for (var i = 0; i < n; i++) {
        t += r.nextBeta(0.3, 9.7);
      }
      expect(t / n, closeTo(0.03, 0.002));
    });

    test('Studentovo t, neúplná beta a ln Γ proti známým hodnotám', () {
      expect(logGamma(5), closeTo(3.1780538303479458, 1e-10)); // ln 24
      expect(logGamma(0.5), closeTo(0.5723649429247001, 1e-10)); // ln √π
      expect(incompleteBeta(0.5, 2, 2), closeTo(0.5, 1e-12));
      expect(incompleteBeta(0.3, 2, 5), closeTo(0.579825, 1e-6));
      expect(studentTCdf(2.228138852, 10), closeTo(0.975, 1e-6));
      expect(studentTCdf(-1.812461123, 10), closeTo(0.05, 1e-6));
      expect(studentTCdf(0, 3), closeTo(0.5, 1e-12));
      expect(studentTQuantile(0.95, 12), closeTo(1.782287556, 1e-6));
    });

    test('Monte Carlo pro lucidní noc sedí s přesným vzorcem', () {
      // Prior Beta(1, 9): A 1 z 15, B 4 z 15 → A Beta(2, 23), B Beta(5, 20).
      final exact = exactProbBGreater(2, 23, 5, 20);
      final res = analyzeOutcome(_lucidCounts(1, 15, 4, 15), Nof1Outcome.lucid);
      expect(res.detail.probBHigher, closeTo(exact, 0.01));
      expect(exactProbBGreater(3, 9, 3, 9), closeTo(0.5, 1e-9));
    });
  });

  group('Verdikty', () {
    test('pracovní příklady ze specifikace TOP 4', () {
      // 4 z 15 proti 1 z 15: P(d > 0) ≈ 0,91, zatím nevíme.
      final r1 = analyzeOutcome(_lucidCounts(1, 15, 4, 15), Nof1Outcome.lucid);
      expect(r1.detail.probBHigher, closeTo(0.91, 0.02));
      expect(r1.verdict, Nof1Verdict.leanB, reason: 'v závěrečném bodě jen náznak, ne závěr');
      expect(analyzeOutcome(_lucidCounts(1, 15, 4, 15), Nof1Outcome.lucid, finalLook: false).verdict,
          Nof1Verdict.tooEarly);
      // 7 z 20 proti 1 z 20: P(d > 0) ≈ 0,99, P(d > 0,05) ≈ 0,96, vychází lépe.
      final r2 = analyzeOutcome(_lucidCounts(1, 20, 7, 20), Nof1Outcome.lucid);
      expect(r2.detail.probBHigher, greaterThan(0.98));
      expect(r2.detail.probBHigherByMargin, closeTo(0.96, 0.02));
      expect(r2.verdict, Nof1Verdict.clearB);
      expect(r2.favoredArm, 'B');
      // Zrcadlově pro A.
      expect(analyzeOutcome(_lucidCounts(7, 20, 1, 20), Nof1Outcome.lucid).verdict, Nof1Verdict.clearA);
      // 2 z 10 proti 2 z 10: P(d > 0) ≈ 0,5, zatím nevíme.
      final r3 = analyzeOutcome(_lucidCounts(2, 10, 2, 10), Nof1Outcome.lucid);
      expect(r3.detail.probBHigher, closeTo(0.5, 0.02));
      expect(r3.verdict, Nof1Verdict.tooEarly);
      expect(r3.reason, Nof1Reason.inconclusive);
      expect(analyzeOutcome(_lucidCounts(2, 10, 2, 10), Nof1Outcome.lucid, canExtend: false).reason,
          Nof1Reason.inconclusiveAtMax);
    });

    test('málo nocí: tooEarly bez čísel, i když rozdíl vypadá obrovský', () {
      final r = analyzeOutcome(_lucidCounts(0, 7, 7, 7), Nof1Outcome.lucid);
      expect(r.verdict, Nof1Verdict.tooEarly);
      expect(r.reason, Nof1Reason.fewNights);
      expect(r.reasonLine!.args['min'], '10');
      expect(r.showsNumbers, isFalse);
      expect(r.explanation, isNull);
      expect(r.detailLines.map((l) => l.key), isNot(contains('lab.detail.probs')));
      // Minimum ze šablony se použije, když je vyšší než minimum výstupu.
      final s = schedule('alternating', 12, 1);
      final rec =
          _nights(s, (i, a) => Nof1Night(night: _start.add(Duration(days: i)), arm: a, recall: a == 'B' ? 3 : 1));
      expect(analyzeOutcome(rec, Nof1Outcome.recall, minNightsPerArm: 7).reason, Nof1Reason.fewNights);
      expect(analyzeOutcome(rec, Nof1Outcome.recall, minNightsPerArm: 5).verdict, Nof1Verdict.clearB);
    });

    test('jasný rozdíl ve vybavování za 14 nocí dá clearB, opačně clearA', () {
      final s = schedule('alternating', 14, 5);
      final data =
          _nights(s, (i, a) => Nof1Night(night: _start.add(Duration(days: i)), arm: a, recall: a == 'B' ? 3 : 1));
      final r = analyzeOutcome(data, Nof1Outcome.recall);
      expect(r.verdict, Nof1Verdict.clearB);
      // Skeptický prior (κ0 = 3) na 14 nocích stáhne naměřený rozdíl 2 zhruba na polovinu.
      expect(r.detail.effect, inInclusiveRange(0.9, 2.0));
      expect(r.detail.lower, greaterThan(0.3));
      expect(r.explanation!.key, 'lab.explain.recall');
      expect(r.explanation!.args['a'], '1,0', reason: 'text ukazuje naměřené průměry');
      expect(r.explanation!.args['b'], '3,0');
      final flipped =
          _nights(s, (i, a) => Nof1Night(night: _start.add(Duration(days: i)), arm: a, recall: a == 'A' ? 3 : 1));
      expect(analyzeOutcome(flipped, Nof1Outcome.recall).verdict, Nof1Verdict.clearA);
    });

    test('obě varianty bez lucidity po 28 nocích: prakticky stejné', () {
      final s = schedule('randomBlocks', 28, 2);
      final data = _nights(s, (i, a) => Nof1Night(night: _start.add(Duration(days: i)), arm: a, lucidity: 0));
      final r = analyzeOutcome(data, Nof1Outcome.lucidity);
      expect(r.verdict, Nof1Verdict.noDifference);
      expect(r.detail.effect, closeTo(0, 1e-9));
    });

    test('chybějící noci se vynechají a označí, cizí varianty se ignorují', () {
      final s = schedule('alternating', 20, 9);
      final data = [
        ..._nights(
            s,
            (i, a) => Nof1Night(
                  night: _start.add(Duration(days: i)),
                  arm: a,
                  vividness: i % 5 < 2 ? null : (a == 'B' ? 6 : 4),
                )),
        Nof1Night(night: _start.add(const Duration(days: 30)), arm: 'X', vividness: 10),
      ];
      final r = analyzeOutcome(data, Nof1Outcome.vividness);
      expect(r.detail.nA + r.detail.nB, 12);
      expect(r.detail.missing, 8);
      expect(r.flags, contains(Nof1Flag.manyMissing));
      expect(r.flags, contains(Nof1Flag.unblinded));
      expect(r.detail.rawMeanA, 4);
      expect(r.detail.rawMeanB, 6);
      expect(analyzeOutcome(data, Nof1Outcome.vividness, blinded: true).flags, isNot(contains(Nof1Flag.unblinded)));
    });

    test('lucidní noc z lucidity ≥ 5, když chybí lucid; hodnoty mimo rozsah se oříznou', () {
      expect(Nof1Night(night: _start, arm: 'A', lucidity: 5).effectiveLucid, isTrue);
      expect(Nof1Night(night: _start, arm: 'A', lucidity: 4).effectiveLucid, isFalse);
      expect(Nof1Night(night: _start, arm: 'A', lucid: false, lucidity: 9).effectiveLucid, isFalse);
      expect(Nof1Night(night: _start, arm: 'A').effectiveLucid, isNull);
      expect(Nof1Night(night: _start, arm: 'A', vividness: 14).value(Nof1Outcome.vividness), 10);
      expect(Nof1Night(night: _start, arm: 'A', recall: -2).value(Nof1Outcome.recall), 0);
    });

    test('trend v čase (učení) nezkreslí rozdíl ani při pevném pořadí AB', () {
      // Vybavování roste s každou nocí, varianty nemají žádný vliv, A je vždy první.
      final data = [
        for (var i = 0; i < 20; i++)
          Nof1Night(
            night: _start.add(Duration(days: i)),
            arm: i.isEven ? 'A' : 'B',
            vividness: 2 + (i * 0.35).round(),
          ),
      ];
      final r = analyzeOutcome(data, Nof1Outcome.vividness);
      final raw = r.detail.rawMeanB! - r.detail.rawMeanA!;
      expect(raw, greaterThan(0.2), reason: 'bez úpravy by B vypadalo lépe jen díky pořadí');
      expect(r.detail.trendAdjusted, isTrue);
      expect(r.detail.effect!.abs(), lessThan(0.2));
      expect(_isClear(r.verdict), isFalse);
    });

    test('rozdíl, který se v čase otočí, dostane štítek changesOverTime', () {
      final s = schedule('alternating', 28, 4);
      final data = _nights(
        s,
        (i, a) => Nof1Night(
          night: _start.add(Duration(days: i)),
          arm: a,
          vividness: i < 14 ? (a == 'B' ? 8 : 3) : (a == 'B' ? 3 : 8),
        ),
      );
      expect(analyzeOutcome(data, Nof1Outcome.vividness).flags, contains(Nof1Flag.changesOverTime));
    });

    test('stejná data a seed dají stejná čísla, jiný seed skoro stejná', () {
      final d = _lucidCounts(3, 20, 6, 20);
      final a = analyzeOutcome(d, Nof1Outcome.lucid, seed: 1);
      final b = analyzeOutcome(d, Nof1Outcome.lucid, seed: 1);
      final c = analyzeOutcome(d, Nof1Outcome.lucid, seed: 2);
      expect(a.detail.probBHigher, b.detail.probBHigher);
      expect(a.detail.lower, b.detail.lower);
      expect(c.detail.probBHigher, closeTo(a.detail.probBHigher!, 0.015));
    });

    test('přísné pravidlo je vždy aspoň tak opatrné jako výchozí', () {
      for (var y = 0; y <= 12; y++) {
        final d = _lucidCounts(1, 20, y, 20);
        final std = analyzeOutcome(d, Nof1Outcome.lucid).verdict;
        final strict = analyzeOutcome(d, Nof1Outcome.lucid, thresholds: Nof1Thresholds.strict).verdict;
        if (_isClear(strict)) {
          expect(strict, std);
        }
      }
    });

    test('analyzeExperiment, vysvětlení a detail', () {
      final s = schedule('randomBlocks', 28, 8);
      final data = _nights(
        s,
        (i, a) => Nof1Night(
          night: _start.add(Duration(days: i)),
          arm: a,
          lucid: a == 'B' ? i % 3 == 0 : i % 9 == 0,
          lucidity: a == 'B' ? 4 + i % 3 : 1 + i % 2,
          recall: 1 + i % 2,
          sleepFeeling: 7,
        ),
      );
      final rep =
          analyzeExperiment(data, outcomes: ['lucidity', 'lucid', 'recall', 'sleepFeeling'], primary: 'lucidity');
      expect(rep.primary.outcome, Nof1Outcome.lucidity);
      expect(rep.primary.verdict, Nof1Verdict.clearB);
      expect(rep.secondary.map((r) => r.outcome), [Nof1Outcome.lucid, Nof1Outcome.recall, Nof1Outcome.sleepFeeling]);
      expect(rep.nightsA + rep.nightsB, 28);
      final lucid = rep.secondary.first;
      final ex = lucid.explanation!;
      expect(ex.key, 'lab.explain.lucid');
      expect(ex.args.keys, containsAll(['a', 'b', 'lo', 'hi']));
      expect(lucid.detailLines.last.key, 'lab.detail.note');
      expect(lucid.detailLines.map((l) => l.key), contains('lab.detail.effect.lucid'));
      expect(() => analyzeExperiment(data, outcomes: ['dreams'], primary: 'dreams'), throwsArgumentError);
    });

    test('formatCz: desetinná čárka, typografické minus, bez −0', () {
      expect(formatCz(1.26), '1,3');
      expect(formatCz(-1.5), '−1,5');
      expect(formatCz(-0.04), '0,0');
      expect(formatCz(12.4, digits: 0), '12');
    });
  });

  group('Simulace (operační charakteristiky)', () {
    test('nulový rozdíl, 14 nocí, jeden pohled: falešný jasný verdikt vzácně', () {
      final (ra, rb) = _simulateSingle(
        outcome: Nof1Outcome.recall,
        nights: 14,
        reps: 1000,
        gen: (night, arm, rng) => Nof1Night(night: night, arm: arm, recall: rng.nextPoisson(1.2)),
      );
      final (va, vb) = _simulateSingle(
        outcome: Nof1Outcome.vividness,
        nights: 14,
        reps: 1000,
        gen: (night, arm, rng) =>
            Nof1Night(night: night, arm: arm, vividness: (5 + 2 * rng.nextNormal()).round().clamp(0, 10)),
      );
      // ignore: avoid_print
      print('FP 14 nocí: recall clearA ${ra.toStringAsFixed(3)} clearB ${rb.toStringAsFixed(3)}, '
          'vividness clearA ${va.toStringAsFixed(3)} clearB ${vb.toStringAsFixed(3)}');
      expect(ra + rb, lessThan(0.05));
      expect(va + vb, lessThan(0.05));
    });

    test('nulový rozdíl a lucidní noc 12 vs 12 % přes 4 kontrolní body: nejvýš 15 % (CI pojistka ze specifikace)', () {
      const reps = 600;
      final (a, b) = _simulateLucidSequential(0.12, 0.12, [20, 40, 60, 80], reps);
      // ignore: avoid_print
      print('FP lucid 12/12 %, 10/20/30/40 nocí na variantu: ${(a + b).toStringAsFixed(3)}');
      // Hranice 15 % plus dvě směrodatné chyby Monte Carla (3 000 opakování v tool/lucid_seq.dart dává 14,6 %).
      expect(a + b, lessThanOrEqualTo(0.15 + 2 * math.sqrt(0.15 * 0.85 / reps)));
      final (a5, b5) = _simulateLucidSequential(0.05, 0.05, [20, 40, 60, 80], reps);
      expect(a5 + b5, lessThanOrEqualTo(0.08));
    });

    test('B opravdu lepší (lucidní noc 20 vs 8 %): správný verdikt do 40 nocí na variantu kolem poloviny', () {
      final (a, b) = _simulateLucidSequential(0.08, 0.20, [20, 40, 60, 80], 400);
      // ignore: avoid_print
      print(
          'Síla lucid 8 vs 20 %, do 40 nocí na variantu: clearB ${b.toStringAsFixed(3)}, clearA ${a.toStringAsFixed(3)}');
      expect(b, inInclusiveRange(0.35, 0.65));
      expect(a, lessThan(0.01));
    });

    test('B opravdu lepší ve vybavování (1,0 vs 1,6 snu): na 28 nocích častěji clearB, skoro nikdy clearA', () {
      final (a, b) = _simulateSingle(
        outcome: Nof1Outcome.recall,
        nights: 28,
        reps: 800,
        design: 'randomBlocks',
        gen: (night, arm, rng) => Nof1Night(night: night, arm: arm, recall: rng.nextPoisson(arm == 'B' ? 1.6 : 1.0)),
      );
      // ignore: avoid_print
      print(
          'Síla recall 1,0 vs 1,6, 28 nocí, jeden pohled: clearB ${b.toStringAsFixed(3)}, clearA ${a.toStringAsFixed(3)}');
      expect(b, greaterThan(0.15));
      expect(a, lessThan(0.01));
    });

    test('učení se v čase při nulovém rozdílu nezvedne falešné verdikty', () {
      final (a, b) = _simulateSingle(
        outcome: Nof1Outcome.vividness,
        nights: 14,
        reps: 800,
        design: 'randomBlocks',
        gen: (night, arm, rng) {
          final day = night.difference(_start).inDays;
          return Nof1Night(
              night: night, arm: arm, vividness: (3 + 0.25 * day + 2 * rng.nextNormal()).round().clamp(0, 10));
        },
      );
      expect(a + b, lessThan(0.05));
    });
  });

  group('Pravidla WBTB', () {
    final programStart = DateTime(2026, 3, 1);
    DateTime day(int n) => programStart.add(Duration(days: n - 1));

    test('wbtbIssues hlídá 14 dní, po sobě, 2 za 7 nocí a špatný spánek', () {
      expect(wbtbIssues(day(10), [], programStart: programStart, lastNightGood: true), [WbtbIssue.inFirst14Days]);
      expect(wbtbIssues(day(15), [], programStart: programStart, lastNightGood: true), isEmpty);
      expect(wbtbIssues(day(16), [day(15)], programStart: programStart, lastNightGood: true),
          [WbtbIssue.consecutiveNights]);
      expect(wbtbIssues(day(20), [day(15), day(18)], programStart: programStart, lastNightGood: true),
          [WbtbIssue.moreThanTwoPerWeek]);
      expect(wbtbIssues(day(22), [day(15), day(18)], programStart: programStart, lastNightGood: true), isEmpty);
      expect(wbtbIssues(day(22), [], programStart: programStart, lastNightGood: false), [WbtbIssue.afterPoorSleep]);
    });

    test('rozpis experimentu s WBTB přes vhodné noci nikdy neporuší pravidla', () {
      for (var seed = 0; seed < 30; seed++) {
        final rng = Nof1Random(seed);
        final arms = schedule('randomBlocks', 20, seed);
        final wbtb = <DateTime>[];
        final poor = <DateTime>{};
        var k = 0;
        for (var d = 1; d <= 200 && k < arms.length; d++) {
          final night = day(d);
          final good = !poor.contains(day(d - 1));
          if (wbtbIssues(night, wbtb, programStart: programStart, lastNightGood: good).isEmpty) {
            if (arms[k] == 'B') {
              wbtb.add(night);
            }
            k++;
          }
          if (rng.nextDouble() < 0.2) {
            poor.add(night);
          }
        }
        expect(k, arms.length);
        expect(validateWbtbPlan(wbtb, programStart: programStart, poorSleepNights: poor), isEmpty);
      }
      // A plán, který pravidla porušuje, se pozná.
      final bad = validateWbtbPlan([day(12), day(20), day(21), day(23)], programStart: programStart);
      expect(bad[day(12)], contains(WbtbIssue.inFirst14Days));
      expect(bad[day(20)], contains(WbtbIssue.consecutiveNights));
      expect(bad[day(23)], contains(WbtbIssue.moreThanTwoPerWeek));
    });
  });

  final data = _findData();
  final skip = data == null ? 'experiments.json / laborator_texty.json nenalezeny (nastav NOF1_DATA)' : false;

  group('Obsah', () {
    test('experiments.json: 10–12 šablon podle schématu a pravidel', () {
      final raw = File('${data!.path}/experiments.json').readAsStringSync();
      expect(raw.contains('\u2014'), isFalse, reason: 'bez dlouhé pomlčky');
      final list = (jsonDecode(raw) as Map<String, dynamic>)['experiments'] as List;
      expect(list.length, inInclusiveRange(10, 12));
      final ids = <String>{};
      for (final e in list.cast<Map<String, dynamic>>()) {
        final t = Nof1Template.fromJson(e);
        expect(ids.add(t.id), isTrue, reason: 'unikátní id ${t.id}');
        for (final k in ['title', 'question', 'evidence', 'arms', 'safety', 'why']) {
          expect(e[k], isNotNull, reason: '${t.id}.$k');
        }
        expect(['strong', 'promising', 'community', 'tradition'], contains(e['evidence']));
        expect(['alternating', 'randomBlocks'], contains(t.design));
        expect(t.techniqueIds, isNotEmpty);
        expect(_allowedTechniques.containsAll(t.techniqueIds), isTrue, reason: t.id);
        expect([for (final a in e['arms'] as List) (a as Map)['id']], ['A', 'B']);
        for (final o in t.outcomes) {
          Nof1Outcome.parse(o);
        }
        expect(t.outcomes, contains(t.primary));
        final perArm = t.nights ~/ 2;
        expect(perArm, greaterThanOrEqualTo(t.minNightsPerArm), reason: t.id);
        final p = Nof1Outcome.parse(t.primary);
        expect(perArm, greaterThanOrEqualTo(p.minPerArm),
            reason: '${t.id}: hlavní výstup musí jít vyhodnotit na konci plánu');
        expect(schedule(t.design, t.nights, 1).length, t.nights);
        expect(RegExp(r'\(.*\d{4}.*\)').hasMatch(e['why'] as String), isTrue, reason: '${t.id}: zdroj s rokem');
        if (t.needsWbtbNights) {
          final safety = e['safety'] as String;
          expect(safety, contains('14. dni'));
          expect(safety, contains('2 v týdnu'));
          expect(safety, contains('po sobě'));
        }
      }
      expect(list.where((e) => Nof1Template.fromJson(e as Map<String, dynamic>).needsWbtbNights), isNotEmpty);
    }, skip: skip);

    test('laborator_texty.json obsahuje všechny klíče z nof1.dart', () {
      final raw = File('${data!.path}/laborator_texty.json').readAsStringSync();
      expect(raw.contains('\u2014'), isFalse, reason: 'bez dlouhé pomlčky');
      final texts = (jsonDecode(raw) as Map<String, dynamic>)['texts'] as Map<String, dynamic>;
      String? lookup(String key) {
        Object? node = texts;
        for (final part in key.split('.')) {
          if (node is! Map<String, dynamic>) {
            return null;
          }
          node = node[part];
        }
        return node is String ? node : null;
      }

      for (final k in nof1CopyKeys()) {
        expect(lookup(k), isNotNull, reason: 'chybí $k');
      }
      for (final k in ['lab.title', 'lab.intro', 'lab.warning', 'lab.endPrompt']) {
        expect(lookup(k), isNotNull, reason: 'chybí $k');
      }
      for (final v in [Nof1Verdict.leanA, Nof1Verdict.leanB, Nof1Verdict.clearA, Nof1Verdict.clearB]) {
        expect(lookup('lab.verdict.${v.name}.body'), contains('{arm}'));
      }
      expect(lookup('lab.reason.fewNights'), contains('{min}'));
      // Zástupné symboly v textech odpovídají argumentům z kódu.
      final s = schedule('randomBlocks', 28, 8);
      final d = _nights(
          s,
          (i, a) =>
              Nof1Night(night: _start.add(Duration(days: i)), arm: a, lucid: i % 4 == 0, recall: 1, vividness: 5));
      for (final o in [Nof1Outcome.lucid, Nof1Outcome.recall, Nof1Outcome.vividness]) {
        final r = analyzeOutcome(d, o);
        for (final line in [r.explanation!, ...r.detailLines]) {
          final text = lookup(line.key)!;
          final placeholders = RegExp(r'\{(\w+)\}').allMatches(text).map((m) => m.group(1)).toSet();
          expect(placeholders, line.args.keys.toSet(), reason: line.key);
        }
      }
    }, skip: skip);
  });
}
