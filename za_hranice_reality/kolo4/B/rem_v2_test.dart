// Testy modelu REM v2, backtestu, baseline a generátoru (kolo 4, část B).
//
// V appce uprav importy `package:rem_pkg/...` na skutečné umístění souborů.
// Změnu času nejlépe ověříš i během v pásmu Prahy: `TZ=Europe/Prague dart test`.
import 'dart:math' as math;

import 'package:rem_pkg/rem_backtest.dart';
import 'package:rem_pkg/rem_baseline.dart';
import 'package:rem_pkg/rem_model_v2.dart';
import 'package:rem_pkg/rem_synth.dart';
import 'package:rem_pkg/rem_types.dart';
import 'package:test/test.dart';

/// Ruční noc: od [onset] lehký spánek, REM v blocích [rem] (minuty od usnutí), bdění v [awake].
SleepNight makeNight(
  DateTime onset,
  SleepSource source, {
  List<List<int>> rem = const [],
  List<List<int>> awake = const [],
  int length = 450,
  DateTime? nightDate,
}) {
  final stage = List<SleepStage>.filled(length, SleepStage.light);
  for (final r in rem) {
    for (var i = r[0]; i < math.min(length, r[1]); i++) {
      stage[i] = SleepStage.rem;
    }
  }
  for (final a in awake) {
    for (var i = a[0]; i < math.min(length, a[1]); i++) {
      stage[i] = SleepStage.awake;
    }
  }
  final segs = <SleepSegment>[];
  var i = 0;
  while (i < length) {
    var j = i;
    while (j < length && stage[j] == stage[i]) {
      j++;
    }
    segs.add(SleepSegment(
      start: onset.add(Duration(minutes: i)),
      end: onset.add(Duration(minutes: j)),
      stage: stage[i],
    ));
    i = j;
  }
  final date = nightDate ??
      (onset.isUtc ? DateTime.utc(onset.year, onset.month, onset.day) : DateTime(onset.year, onset.month, onset.day));
  return SleepNight(
    nightDate: date,
    source: source,
    fetchedAt: onset.add(Duration(minutes: length + 60)),
    onset: onset,
    wake: onset.add(Duration(minutes: length)),
    segments: segs,
  );
}

const typicalRem = [
  [95, 110],
  [190, 210],
  [285, 310],
  [380, 410],
];

/// Společné kontroly tvaru výstupu: souvislá okna od 0, násobky 5 min, ≥ 10 min, high ≤ 15 %.
void checkShape(List<RemWindow> ws) {
  expect(ws, isNotEmpty);
  expect(ws.first.fromOffset, 0);
  for (var i = 0; i < ws.length; i++) {
    final w = ws[i];
    expect(w.fromOffset % 5, 0);
    expect(w.toOffset % 5, 0);
    expect(w.toOffset - w.fromOffset, greaterThanOrEqualTo(10));
    expect(w.to.difference(w.from).inMinutes, w.toOffset - w.fromOffset);
    expect(w.peak, inInclusiveRange(0, 1));
    if (i > 0) {
      expect(w.fromOffset, ws[i - 1].toOffset);
      expect(w.level, isNot(ws[i - 1].level));
    }
    if (w is RemWindowV2) {
      expect(w.probabilityLow, lessThanOrEqualTo(w.probability + 1e-12));
      expect(w.probabilityHigh, greaterThanOrEqualTo(w.probability - 1e-12));
      expect(w.probability, inInclusiveRange(0, 1));
      expect(w.deviceProbability, inInclusiveRange(0, 1));
    }
  }
  final v2 = ws.first;
  if (v2 is RemWindowV2) {
    final high = ws.where((w) => w.level == RemLevel.high).fold(0, (a, w) => a + w.toOffset - w.fromOffset);
    expect(high, lessThanOrEqualTo(0.15 * v2.curve.expectedEpochs * 5 + 1e-9));
  }
}

List<RemWindow> v2Of(List<SleepNight> past, List<RemMark> marks, DateTime onset, DateTime tonight) =>
    remWindowsV2(past, marks: marks, onset: onset, tonight: tonight);

void main() {
  group('úrovně a okna', () {
    test('logika úrovní je stejná jako remLevel z appky', () {
      const rules =
          RemLevelRules(levelLow: 0.3, levelMid: 0.55, levelHigh: 0.8, maxHighShare: 0.15, minWindowMinutes: 10);
      for (var v = 0.0; v <= 1.0001; v += 0.01) {
        for (final cut in [null, 0.85, 0.95]) {
          expect(rules.levelOf(v, cut), remLevel(v, RemProbabilityParams.defaults, cut));
        }
      }
    });

    test('remLevelRuns: high nejvýš 15 %, žádné okno kratší než 10 min, souvislé pokrytí', () {
      final rnd = math.Random(5);
      const rules =
          RemLevelRules(levelLow: 0.3, levelMid: 0.55, levelHigh: 0.8, maxHighShare: 0.15, minWindowMinutes: 10);
      for (var rep = 0; rep < 200; rep++) {
        final n = 20 + rnd.nextInt(140);
        final vals = [for (var i = 0; i < n; i++) rnd.nextDouble() * (0.3 + 0.7 * math.sin(i / 9).abs())];
        final runs = remLevelRuns(vals, rules);
        expect(runs.first.from, 0);
        expect(runs.last.to, n);
        var high = 0;
        for (var i = 0; i < runs.length; i++) {
          expect(runs[i].to - runs[i].from, greaterThanOrEqualTo(2));
          if (i > 0) {
            expect(runs[i].from, runs[i - 1].to);
          }
          if (runs[i].level == RemLevel.high) {
            high += runs[i].to - runs[i].from;
          }
        }
        expect(high, lessThanOrEqualTo((0.15 * n).floor()));
      }
    });
  });

  group('okrajové případy', () {
    test('žádné noci: okna z populačního prioru', () {
      final ws = remWindowsV2(const [], onset: DateTime.utc(2026, 5, 10, 23, 7), tonight: DateTime.utc(2026, 5, 10));
      checkShape(ws);
      expect(ws.first.from, DateTime.utc(2026, 5, 10, 23, 5));
      expect(ws.every((w) => w.recentNights == 0 && w.bothNights == 0 && w.dreamMarks == 0), isTrue);
      final c = (ws.first as RemWindowV2).curve;
      expect(c.usedNights, 0);
      expect(c.dataWeight, 0);
      // Na začátku noci REM skoro není, k ránu přibývá.
      expect(c.pRem[2], lessThan(0.05));
      expect(c.pRem[80], greaterThan(0.2));
      expect(ws.first.level, RemLevel.unlikely);
    });

    test('jen Oura / jen Garmin: počty podle zařízení, Garmin méně jistý', () {
      final base = DateTime.utc(2026, 3, 1, 22, 30);
      final oura = [
        for (var d = 0; d < 20; d++) makeNight(base.add(Duration(days: d)), SleepSource.oura, rem: typicalRem)
      ];
      final garmin = [
        for (var d = 0; d < 20; d++) makeNight(base.add(Duration(days: d)), SleepSource.garmin, rem: typicalRem)
      ];
      final tonight = DateTime.utc(2026, 3, 21);
      final onset = DateTime.utc(2026, 3, 21, 22, 30);
      final wo = v2Of(oura, const [], onset, tonight);
      final wg = v2Of(garmin, const [], onset, tonight);
      checkShape(wo);
      checkShape(wg);
      expect(wo.every((w) => w.garminOnlyNights == 0 && w.bothNights == 0), isTrue);
      expect(wg.every((w) => w.ouraOnlyNights == 0 && w.bothNights == 0), isTrue);
      expect(wo.any((w) => w.ouraOnlyNights > 0), isTrue);
      expect(wg.any((w) => w.garminOnlyNights > 0), isTrue);
      // Stejné štítky ze slabšího zařízení dávají méně vyhraněný posterior noci.
      final po = remNightPosterior(remNightData([oura.first])!);
      final pg = remNightPosterior(remNightData([garmin.first])!);
      double spread(RemNightPosterior p) => p.pRem.reduce(math.max) - p.pRem.reduce(math.min);
      expect(spread(pg), lessThan(spread(po)));
      // Okno high leží v REM bloku z historie.
      final hi = wo.firstWhere((w) => w.level == RemLevel.high);
      expect(typicalRem.any((r) => hi.fromOffset < r[1] && hi.toOffset > r[0]), isTrue);
    });

    test('ruční záznamy (manual) se do REM nepočítají', () {
      final base = DateTime.utc(2026, 3, 1, 22, 30);
      final oura = [
        for (var d = 0; d < 10; d++) makeNight(base.add(Duration(days: d)), SleepSource.oura, rem: typicalRem)
      ];
      final manual = [
        for (var d = 0; d < 10; d++)
          makeNight(base.add(Duration(days: d)), SleepSource.manual, rem: const [
            [0, 450],
          ]),
      ];
      final tonight = DateTime.utc(2026, 3, 11);
      final onset = DateTime.utc(2026, 3, 11, 22, 30);
      expect(remNightData([manual.first]), isNull);
      final a = remCurveV2(oura, onset: onset, tonight: tonight);
      final b = remCurveV2([...oura, ...manual], onset: onset, tonight: tonight);
      expect(b.pRem, a.pRem);
      checkShape(v2Of(manual, const [], onset, tonight));
    });

    test('noc přes půlnoc: časy oken jdou přes půlnoc, offsety od usnutí', () {
      final onset = DateTime.utc(2026, 2, 3, 22, 40);
      final past = [
        for (var d = 0; d < 15; d++)
          makeNight(onset.subtract(Duration(days: 15 - d)), SleepSource.oura, rem: typicalRem),
      ];
      final ws = v2Of(past, const [], onset, DateTime.utc(2026, 2, 3));
      checkShape(ws);
      final after = ws.firstWhere((w) => w.fromOffset >= 120);
      expect(after.from.day, 4);
      expect(after.from, onset.add(Duration(minutes: after.fromOffset)));
      expect(after.contains(after.from), isTrue);
      expect(after.contains(after.to), isFalse);
      // Data minulé noci leží přes půlnoc a posterior najde REM bloky na správných místech.
      final post = remNightPosterior(remNightData([past.first])!);
      expect(post.pRem[100 ~/ 5], greaterThan(0.4));
      expect(post.pRem[150 ~/ 5], lessThan(0.15));
    });

    test('změna času (Praha, poslední neděle října a března): offsety podle uplynulého času', () {
      // Ověření kalendáře: 25. 10. 2026 a 29. 3. 2026 jsou poslední neděle.
      expect(DateTime.utc(2026, 10, 25).weekday, DateTime.sunday);
      expect(DateTime.utc(2026, 11, 1).weekday, DateTime.sunday);
      expect(DateTime.utc(2026, 3, 29).weekday, DateTime.sunday);
      expect(DateTime.utc(2026, 4, 5).weekday, DateTime.sunday);
      for (final (dstOnset, plainOnset) in [
        // 23:00 SELČ 24. 10. = 21:00 UTC, ráno už SEČ (noc má na ciferníku o hodinu víc).
        (DateTime.utc(2026, 10, 24, 21), DateTime.utc(2026, 10, 17, 21)),
        // 23:00 SEČ 28. 3. = 22:00 UTC, ráno už SELČ.
        (DateTime.utc(2026, 3, 28, 22), DateTime.utc(2026, 3, 21, 22)),
      ]) {
        final dstNight = makeNight(dstOnset, SleepSource.oura, rem: typicalRem, length: 510);
        final plainNight = makeNight(plainOnset, SleepSource.oura, rem: typicalRem, length: 510);
        final a = v2Of([dstNight], const [], dstOnset.add(const Duration(days: 1)),
            dstNight.nightDate.add(const Duration(days: 1)));
        final b = v2Of([plainNight], const [], plainOnset.add(const Duration(days: 1)),
            plainNight.nightDate.add(const Duration(days: 1)));
        expect([for (final w in a) '${w.fromOffset}-${w.toOffset}-${w.level}'],
            [for (final w in b) '${w.fromOffset}-${w.toOffset}-${w.level}']);
        expect(remNightData([dstNight])!.epochs, 102);
        // Stejná noc zadaná v místním čase (při TZ=Europe/Prague přes skutečnou změnu času).
        final localOnset = dstOnset.toLocal();
        final localNight =
            makeNight(localOnset, SleepSource.oura, rem: typicalRem, length: 510, nightDate: dstNight.nightDate);
        final c = v2Of([localNight], const [], localOnset.add(const Duration(days: 1)),
            dstNight.nightDate.add(const Duration(days: 1)));
        expect([for (final w in c) w.toOffset], [for (final w in a) w.toOffset]);
        for (final w in c) {
          expect(w.from.isUtc, isFalse);
          expect(w.to.difference(localOnset.add(const Duration(days: 1))).inMinutes, w.toOffset);
        }
      }
    });

    test('místní čas vs UTC: stejná syntetická data dají stejná okna', () {
      final u = generateSynthData(const SynthConfig(nights: 40, seed: 9));
      final local = [
        for (final n in u.nights)
          SleepNight(
            nightDate: DateTime(n.nightDate.year, n.nightDate.month, n.nightDate.day),
            source: n.source,
            fetchedAt: n.fetchedAt.toLocal(),
            onset: n.onset?.toLocal(),
            wake: n.wake?.toLocal(),
            segments: [
              for (final s in n.segments) SleepSegment(start: s.start.toLocal(), end: s.end.toLocal(), stage: s.stage)
            ],
          ),
      ];
      final marks = [
        for (final m in u.marks)
          RemMark(
            nightDate: DateTime(m.nightDate.year, m.nightDate.month, m.nightDate.day),
            at: m.at?.toLocal(),
            woke: m.woke,
            emptyNight: m.emptyNight,
          ),
      ];
      final onset = DateTime.utc(2026, 2, 14, 22, 50);
      final a = v2Of(u.nights, u.marks, onset, DateTime.utc(2026, 2, 14));
      final b = v2Of(local, marks, onset.toLocal(), DateTime(2026, 2, 14));
      expect(b.length, a.length);
      for (var i = 0; i < a.length; i++) {
        expect(b[i].fromOffset, a[i].fromOffset);
        expect(b[i].level, a[i].level);
        expect(b[i].from.isAtSameMomentAs(a[i].from), isTrue);
        expect((b[i] as RemWindowV2).probability, closeTo((a[i] as RemWindowV2).probability, 1e-12));
        expect(b[i].wokeMarks, a[i].wokeMarks);
      }
    });

    test('překryvy a mezery v úsecích, neseřazené úseky', () {
      final onset = DateTime.utc(2026, 4, 1, 23);
      final n = makeNight(onset, SleepSource.oura, rem: typicalRem);
      final dup = SleepNight(
        nightDate: n.nightDate,
        source: SleepSource.oura,
        fetchedAt: n.fetchedAt,
        onset: n.onset,
        segments: [...n.segments.reversed, ...n.segments],
      );
      final a = remNightData([n])!, b = remNightData([dup])!;
      for (var i = 0; i < a.epochs; i++) {
        expect(b.oura![i], a.oura![i]);
      }
      // Hodinová mezera bez dat: epochy chybí, posterior tam stojí na prioru.
      final gap = SleepNight(
        nightDate: n.nightDate,
        source: SleepSource.oura,
        fetchedAt: n.fetchedAt,
        onset: n.onset,
        segments: n.segments
            .where((s) => s.end.difference(onset).inMinutes <= 180 || s.start.difference(onset).inMinutes >= 240)
            .toList(),
      );
      final g = remNightData([gap])!;
      // Odstraněné úseky pokrývaly 110–285 min.
      expect(g.oura![150 ~/ 5], isNull);
      expect(g.oura![250 ~/ 5], isNull);
      expect(g.oura![100 ~/ 5], isNotNull);
      expect(g.oura![300 ~/ 5], isNotNull);
      final post = remNightPosterior(g);
      for (var t = 0; t < g.epochs; t++) {
        expect(post.pRem[t] + post.pNrem[t] + post.pWake[t], closeTo(1, 1e-9));
      }
      // Oura a Garmin s mírně jiným usnutím: kotva je usnutí Oury.
      final gar = makeNight(onset.add(const Duration(minutes: 7)), SleepSource.garmin, rem: typicalRem);
      expect(remNightData([gar, n])!.anchor, onset);
    });
  });

  group('ruční značky', () {
    final onset = DateTime.utc(2026, 5, 2, 23);
    // Jen Garmin a REM jen v prvních dvou cyklech: pozdní REM model nevidí.
    final night = makeNight(onset, SleepSource.garmin, rem: const [
      [95, 110],
      [190, 210],
    ]);
    final data = remNightData([night])!;
    final plain = remNightPosterior(data);

    test('„probudil jsem se ze snu“ v čase T zvedne REM kolem T, bez času nic nemění', () {
      final at = onset.add(const Duration(minutes: 300));
      final woke = remNightPosterior(data, marks: [RemMark(nightDate: night.nightDate, at: at, woke: true)]);
      final dream = remNightPosterior(data, marks: [RemMark(nightDate: night.nightDate, at: at)]);
      final untimed = remNightPosterior(data, marks: [RemMark(nightDate: night.nightDate, woke: true)]);
      final i = 300 ~/ 5;
      expect(woke.pRem[i], greaterThan(plain.pRem[i] * 1.2));
      expect(dream.pRem[i], greaterThan(plain.pRem[i]));
      expect(dream.pRem[i], lessThan(woke.pRem[i]));
      expect(untimed.pRem, plain.pRem);
      // Omezená váha: ani lucidně silná značka nepřebije data (strop LR 10).
      expect(woke.pRem[i], lessThan(0.9));
    });

    test('„nic si nepamatuju“ sníží REM u ranního probuzení (LR 0,4)', () {
      final empty = remNightPosterior(data, marks: [RemMark(nightDate: night.nightDate, emptyNight: true)]);
      final last = data.epochs - 1;
      expect(empty.pRem[last], lessThan(plain.pRem[last]));
      expect(empty.pRem[20], closeTo(plain.pRem[20], 0.02));
    });

    test('čas snu s datem večera se posune o den, značky se počítají v oknech', () {
      // 04:00 téhož data jako večer (typická chyba) = 04:00 dalšího dne.
      final wrong = DateTime.utc(2026, 5, 2, 4);
      final fixed = remNightPosterior(data, marks: [RemMark(nightDate: night.nightDate, at: wrong, woke: true)]);
      final right = remNightPosterior(data,
          marks: [RemMark(nightDate: night.nightDate, at: DateTime.utc(2026, 5, 3, 4), woke: true)]);
      expect(fixed.pRem, right.pRem);
      final ws = remWindowsV2([
        night
      ], marks: [
        RemMark(nightDate: night.nightDate, at: DateTime.utc(2026, 5, 3, 4), woke: true),
        RemMark(nightDate: night.nightDate, at: DateTime.utc(2026, 5, 3, 4, 2)),
        RemMark(nightDate: night.nightDate, emptyNight: true),
      ], onset: DateTime.utc(2026, 5, 3, 23), tonight: DateTime.utc(2026, 5, 3));
      final w = ws.firstWhere((w) => w.fromOffset <= 300 && w.toOffset > 300);
      expect(w.wokeMarks, 1);
      expect(w.dreamMarks, 1);
      expect(ws.fold(0, (a, w) => a + w.wokeMarks + w.dreamMarks), 2);
    });
  });

  group('model', () {
    test('HSMM: log P(data) dopředu = dozadu, stavy se sčítají na 1, latence se pozná', () {
      final onset = DateTime.utc(2026, 6, 1, 22);
      for (final n in [
        [makeNight(onset, SleepSource.oura, rem: typicalRem)],
        [makeNight(onset, SleepSource.oura, rem: typicalRem), makeNight(onset, SleepSource.garmin, rem: typicalRem)],
        [
          makeNight(onset, SleepSource.garmin, rem: const [], awake: const [
            [200, 230],
          ])
        ],
      ]) {
        final post = remNightPosterior(remNightData(n)!);
        expect(post.logLikelihood, closeTo(post.logLikelihoodBackward, 1e-8));
        for (var t = 0; t < post.pRem.length; t++) {
          expect(post.pRem[t] + post.pNrem[t] + post.pWake[t], closeTo(1, 1e-9));
          expect(post.pRemPeriod[t], inInclusiveRange(0, 1));
        }
      }
      final post = remNightPosterior(remNightData([makeNight(onset, SleepSource.oura, rem: typicalRem)])!);
      expect(math.exp(post.latencyLogMean), closeTo(95, 12));
    });

    test('prior predictive bez dat: asi 21 % REM za 8 h a vlny prvních cyklů', () {
      final c = remCurveV2(const [], onset: DateTime.utc(2026, 1, 1, 23), tonight: DateTime.utc(2026, 1, 1));
      final first8h = c.pPrior.sublist(0, 96);
      final mean = first8h.reduce((a, b) => a + b) / first8h.length;
      expect(mean, inInclusiveRange(0.17, 0.24));
      // První REM kolem 80–100 min, mezi prvním a druhým cyklem údolí.
      expect(c.pPrior[18], greaterThan(c.pPrior[26]));
      expect(c.pPrior[8], lessThan(0.05));
    });

    test('korelace chyb ρ: shoda obou zařízení není dvojnásobný důkaz; vazba drží marginály', () {
      final a = [0.03, 0.27, 0.70], b = [0.04, 0.46, 0.50];
      for (final rho in [0.0, 0.4, 1.0]) {
        final j = remCoupledJoint(a, b, rho);
        for (var i = 0; i < 3; i++) {
          expect(j[i].reduce((x, y) => x + y), closeTo(a[i], 1e-12));
          expect(j[0][i] + j[1][i] + j[2][i], closeTo(b[i], 1e-12));
          for (var k = 0; k < 3; k++) {
            expect(j[i][k], greaterThanOrEqualTo(0));
          }
        }
      }
      final onset = DateTime.utc(2026, 6, 1, 22);
      final n = [
        makeNight(onset, SleepSource.oura, rem: typicalRem),
        makeNight(onset, SleepSource.garmin, rem: typicalRem)
      ];
      final naive = remNightPosterior(remNightData(n)!, params: RemModelV2Params.defaults.copyWith(rho: 0));
      final coupled = remNightPosterior(remNightData(n)!);
      expect(naive.pRem[295 ~/ 5], greaterThan(coupled.pRem[295 ~/ 5]));
      expect(naive.pRem[150 ~/ 5], lessThan(coupled.pRem[150 ~/ 5]));
    });

    test('osobní prior se učí latenci prvního REM (Kalman, pořadí lidí sedí)', () {
      double learned(double lat, int seed) {
        final d = generateSynthData(SynthConfig(nights: 60, seed: seed, latencyMean: lat, marks: false));
        final c = remCurveV2(d.nights, onset: DateTime.utc(2026, 3, 6, 23), tonight: DateTime.utc(2026, 3, 6));
        expect(c.dataWeight, greaterThan(0.7));
        return c.latencyMedianMinutes;
      }

      for (final seed in [4, 5]) {
        final early = learned(68, seed), late = learned(105, seed);
        // Dlouhou latenci se naučí skoro přesně, krátkou jen částečně (krátký první REM je slabé svědectví).
        expect(late, greaterThan(95));
        expect(late, lessThan(115));
        expect(late - early, greaterThan(15));
      }
    });

    test('bez dat se posterior noci přesně shoduje s apriorní obsazeností (nezávislý výpočet)', () {
      // Parametry, při kterých je model noci a předpověď tentýž (β = 1, bez mezinočního faktoru).
      const p = RemModelV2Params(beta: 1, nremSigmaW: 0, nremTau: 0, nremWithinNightLogSd: 0.25);
      final on = DateTime.utc(2026, 3, 1, 22);
      // Dva úseky po 2 min: noc má délku 8 h, ale žádná epocha nemá data (pokrytí < 2,5 min).
      final night = SleepNight(
          nightDate: DateTime.utc(2026, 3, 1),
          source: SleepSource.oura,
          fetchedAt: on,
          onset: on,
          segments: [
            SleepSegment(start: on, end: on.add(const Duration(minutes: 2)), stage: SleepStage.light),
            SleepSegment(
                start: on.add(const Duration(minutes: 478)),
                end: on.add(const Duration(minutes: 480)),
                stage: SleepStage.light),
          ]);
      final data = remNightData([night], params: p)!;
      expect(data.epochs, 96);
      expect(data.covered(0, 0), isFalse);
      final post = remNightPosterior(data, params: p);
      final c = remCurveV2(const [], onset: on, tonight: DateTime.utc(2026, 3, 1), params: p);
      for (var t = 0; t < 96; t++) {
        expect(post.pRem[t], closeTo(c.pPrior[t], 1e-9));
      }
    });

    test('determinismus: stejný vstup dá stejný výstup, cache výsledek nemění', () {
      final d1 = generateSynthData(const SynthConfig(nights: 50, seed: 21));
      final d2 = generateSynthData(const SynthConfig(nights: 50, seed: 21));
      expect(d1.nights.length, d2.nights.length);
      expect(d1.marks.length, d2.marks.length);
      expect(d1.raw.last.oura, d2.raw.last.oura);
      final onset = DateTime.utc(2026, 2, 24, 23, 12);
      final tonight = DateTime.utc(2026, 2, 24);
      final cache = RemV2Cache();
      final a = remWindowsV2(d1.nights, marks: d1.marks, onset: onset, tonight: tonight);
      final b = remWindowsV2(d2.nights, marks: d2.marks, onset: onset, tonight: tonight, cache: cache);
      final c = remWindowsV2(d2.nights, marks: d2.marks, onset: onset, tonight: tonight, cache: cache);
      expect(cache.hits, greaterThan(0));
      String sig(List<RemWindow> ws) => ws
          .map((w) => '${w.fromOffset}/${w.toOffset}/${w.level.name}/${w.peak}/${(w as RemWindowV2).probability}/'
              '${w.bothNights}/${w.ouraOnlyNights}/${w.garminOnlyNights}/${w.dreamMarks}/${w.wokeMarks}')
          .join(';');
      expect(sig(b), sig(a));
      expect(sig(c), sig(a));
      // Noci a značky z dneška a budoucnosti se ignorují.
      final future = [...d1.nights, makeNight(DateTime.utc(2026, 2, 24, 23), SleepSource.oura, rem: typicalRem)];
      expect(sig(remWindowsV2(future, marks: d1.marks, onset: onset, tonight: tonight)), sig(a));
    });
  });

  group('backtest', () {
    test('walk-forward: prediktor nevidí hodnocenou noc ani budoucnost', () {
      final d = generateSynthData(const SynthConfig(nights: 40, seed: 7));
      final groups = remGroupNights(d.nights);
      var calls = 0;
      List<RemWindow> spy(List<SleepNight> past, List<RemMark> marks, DateTime onset, DateTime tonight) {
        calls++;
        final k = remNightKey(tonight);
        expect(past.every((n) => remNightKey(n.nightDate) < k), isTrue);
        expect(marks.every((m) => remNightKey(m.nightDate) < k), isTrue);
        expect(onset, remNightData(groups[k]!)!.anchor);
        expect(() => past.add(past.first), throwsUnsupportedError);
        return remWindowsBaseline(past, marks: marks, onset: onset, tonight: tonight);
      }

      final r =
          backtest(d.nights, d.marks, spy, options: const BacktestOptions(minPastNights: 10, rateWarmupNights: 5));
      expect(calls, r.predictions);
      expect(r.primary.nights, greaterThan(20));
      expect(r.primary.logLossProb, isNull);
    });

    test('metriky sedí: kalibrace a úrovně sečtou epochy, párové srovnání se sebou je nula', () {
      final d = generateSynthData(const SynthConfig(nights: 45, seed: 8));
      final cache = RemV2Cache();
      List<RemWindow> v2(List<SleepNight> past, List<RemMark> m, DateTime onset, DateTime tonight) =>
          remWindowsV2(past, marks: m, onset: onset, tonight: tonight, cache: cache);
      final a = backtest(d.nights, d.marks, v2, reference: d.truth, label: 'a');
      final b = backtest(d.nights, d.marks, v2, reference: d.truth, label: 'b');
      for (final m in [a.primary, a.agree!, a.reference!]) {
        expect(m.calibrationLevel.fold(0, (s, c) => s + c.count), m.epochs);
        expect(m.calibrationProb!.fold(0, (s, c) => s + c.count), m.epochs);
        expect(m.levels.values.fold(0, (s, l) => s + l.epochs), m.epochs);
        expect(m.levels.values.fold(0.0, (s, l) => s + l.shareOfRem), closeTo(1, 1e-9));
        expect(m.logLossLevel, lessThan(m.logLossClim));
      }
      final cmp = comparePaired(a, b);
      expect(cmp.diff, 0);
      expect(cmp.ciLow, 0);
      expect(cmp.ciHigh, 0);
      expect(backtestMarkdown([a, b]), contains('| a |'));
    });

    test('bestRemWindow: nejvyšší peak, při shodě vyšší úroveň, delší, dřívější', () {
      RemWindow w(int from, int to, RemLevel l, double peak) => RemWindow(
            from: DateTime.utc(2026),
            to: DateTime.utc(2026),
            fromOffset: from,
            toOffset: to,
            level: l,
            peak: peak,
            recentNights: 0,
            bothNights: 0,
            ouraOnlyNights: 0,
            garminOnlyNights: 0,
            dreamMarks: 0,
            wokeMarks: 0,
          );
      expect(bestRemWindow(const []), isNull);
      expect(bestRemWindow([w(0, 10, RemLevel.high, 0.9), w(10, 20, RemLevel.mid, 0.95)])!.fromOffset, 10);
      expect(bestRemWindow([w(0, 10, RemLevel.mid, 1), w(10, 20, RemLevel.high, 1)])!.fromOffset, 10);
      expect(bestRemWindow([w(0, 10, RemLevel.high, 1), w(10, 30, RemLevel.high, 1)])!.fromOffset, 10);
      expect(bestRemWindow([w(0, 10, RemLevel.high, 1), w(20, 30, RemLevel.high, 1)])!.fromOffset, 0);
    });

    test('syntetika: v2 je aspoň tak dobrý jako průměr hypnogramů', () {
      var centerA = 0, centerB = 0, bestN = 0;
      for (final seed in [1, 2]) {
        final d = generateSynthData(SynthConfig(nights: 100, seed: seed));
        final cache = RemV2Cache();
        List<RemWindow> v2(List<SleepNight> past, List<RemMark> m, DateTime onset, DateTime tonight) =>
            remWindowsV2(past, marks: m, onset: onset, tonight: tonight, cache: cache);
        List<RemWindow> base(List<SleepNight> past, List<RemMark> m, DateTime onset, DateTime tonight) =>
            remWindowsBaseline(past, marks: m, onset: onset, tonight: tonight);
        final a = backtest(d.nights, d.marks, v2, reference: d.truth, label: 'v2');
        final b = backtest(d.nights, d.marks, base, reference: d.truth, label: 'baseline');
        for (final t in BacktestTruth.values) {
          final ma = a.metrics(t)!, mb = b.metrics(t)!;
          expect(ma.logLossLevel, lessThanOrEqualTo(mb.logLossLevel), reason: 'log seed $seed ${t.name}');
          expect(ma.brierLevel, lessThanOrEqualTo(mb.brierLevel), reason: 'Brier seed $seed ${t.name}');
          expect(ma.densityDecreasing, isTrue, reason: 'hustota seed $seed ${t.name}');
          expect(ma.highShareMean, lessThanOrEqualTo(0.15));
          if (t == BacktestTruth.primary) {
            centerA += ma.best.centerHits;
            centerB += mb.best.centerHits;
            bestN += ma.best.nights;
          }
          // Vlastní pravděpodobnost v2 je použitelně kalibrovaná a lepší než klimatologie.
          expect(ma.eceProb!, lessThan(0.06));
          expect(ma.logLossProb!, lessThan(ma.logLossClim));
        }
        final cmp = comparePaired(a, b);
        expect(cmp.diff, lessThan(0));
        expect(cmp.ciHigh, lessThan(0));
      }
      // Nejlepší okno: střed padne do REM aspoň stejně často (tolerance na šum 5 p. b.).
      expect(centerA / bestN, greaterThanOrEqualTo(centerB / bestN - 0.05));
    });

    test('generátor: přesnost zařízení podle rešerše, značky zkreslené k ránu', () {
      final d = generateSynthData(const SynthConfig(nights: 120, seed: 3));
      final s = d.deviceStats();
      expect(s.ouraSens, inInclusiveRange(0.70, 0.82));
      expect(s.ouraFpr, inInclusiveRange(0.05, 0.12));
      expect(s.garminSens, inInclusiveRange(0.38, 0.58));
      expect(s.garminFpr, inInclusiveRange(0.10, 0.18));
      expect(s.garminSens, lessThan(s.ouraSens));
      expect(s.errorCorrelation, inInclusiveRange(0.15, 0.45));
      // Značky s časem: většina ve druhé polovině noci.
      var late = 0, timed = 0;
      for (final m in d.marks.where((m) => m.at != null && !m.emptyNight)) {
        final n = d.raw.firstWhere((r) => remNightKey(r.nightDate) == remNightKey(m.nightDate));
        final frac = m.at!.difference(n.onset).inMinutes / n.wake.difference(n.onset).inMinutes;
        timed++;
        late += frac > 0.5 ? 1 : 0;
      }
      expect(timed, greaterThan(30));
      expect(late / timed, greaterThan(0.7));
      expect(d.marks.any((m) => m.emptyNight), isTrue);
      expect(d.marks.any((m) => m.at == null && !m.emptyNight), isTrue);
    });
  });
}
