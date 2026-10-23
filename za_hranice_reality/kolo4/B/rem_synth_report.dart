// Syntetický backtest modelu REM v2 proti průměru hypnogramů (kolo 4, část B).
//
// Spuštění v balíčku: `dart run tool/rem_synth_report.dart [main|seeds|scen|params|time|all]`.
// Vypíše tabulky v Markdownu, ze kterých je složený `self_check_b.md`.
import 'package:rem_pkg/rem_backtest.dart';
import 'package:rem_pkg/rem_baseline.dart';
import 'package:rem_pkg/rem_model_v2.dart';
import 'package:rem_pkg/rem_synth.dart';
import 'package:rem_pkg/rem_types.dart';

Predictor v2Predictor([RemModelV2Params p = RemModelV2Params.defaults]) {
  final cache = RemV2Cache();
  return (past, marks, onset, tonight) =>
      remWindowsV2(past, marks: marks, onset: onset, tonight: tonight, params: p, cache: cache);
}

List<RemWindow> baselinePredictor(List<SleepNight> past, List<RemMark> marks, DateTime onset, DateTime tonight) =>
    remWindowsBaseline(past, marks: marks, onset: onset, tonight: tonight);

void main(List<String> args) {
  final what = args.isEmpty ? 'all' : args[0];
  if (what == 'main' || what == 'all') {
    mainBacktest();
  }
  if (what == 'seeds' || what == 'all') {
    seeds();
  }
  if (what == 'scen' || what == 'all') {
    grid(scenarios: true);
  }
  if (what == 'params' || what == 'all') {
    grid(scenarios: false);
  }
  if (what == 'time' || what == 'all') {
    timing();
  }
}

/// 400 nocí (jako 399 skutečných), seed 1: všechny noci od 15. a posledních 120.
void mainBacktest() {
  final d = generateSynthData(const SynthConfig(nights: 400, seed: 1));
  final s = d.deviceStats();
  print('## Hlavní backtest: 400 syntetických nocí, seed 1\n');
  print(
      'Záznamů ${d.nights.length}, značek ${d.marks.length} (s časem ${d.marks.where((m) => m.at != null && !m.emptyNight).length}, '
      '„nic si nepamatuju“ ${d.marks.where((m) => m.emptyNight).length}). Realizovaná přesnost po minutách: '
      'Oura citlivost ${s.ouraSens.toStringAsFixed(3)}, falešné poplachy ${s.ouraFpr.toStringAsFixed(3)}; '
      'Garmin ${s.garminSens.toStringAsFixed(3)} / ${s.garminFpr.toStringAsFixed(3)}; korelace chyb (phi) '
      '${s.errorCorrelation.toStringAsFixed(3)}.\n');
  for (final opts in [const BacktestOptions(), const BacktestOptions(lastNights: 120)]) {
    final a = backtest(d.nights, d.marks, v2Predictor(), reference: d.truth, label: 'v2', options: opts);
    final b = backtest(d.nights, d.marks, baselinePredictor, reference: d.truth, label: 'baseline', options: opts);
    print(
        '### ${opts.lastNights == null ? 'Všechny noci od 15. (walk-forward)' : 'Posledních 120 nocí (walk-forward, 30 nocí zahřátí)'}\n');
    print(
        'Čas: v2 ${a.elapsed.inMilliseconds} ms za ${a.predictions} předpovědí, baseline ${b.elapsed.inMilliseconds} ms.\n');
    print(backtestMarkdown([a, b]));
    print('Párové srovnání v2 − baseline po nocích (bootstrap po blocích 7 nocí, 2000×; záporný rozdíl = v2 lepší):\n');
    print('| metrika | pravda | nocí | v2 | baseline | rozdíl | 95% interval | nocí lepší v2 |');
    print('|---|---|---|---|---|---|---|---|');
    for (final t in BacktestTruth.values) {
      for (final m in [BacktestMetric.logLossLevel, BacktestMetric.brierLevel]) {
        print(comparePaired(a, b, truth: t, metric: m).toMarkdownRow());
      }
    }
    print('\nKalibrace v2 (vlastní pravděpodobnost) proti štítku zařízení (primary):\n');
    print(calibrationMarkdown(a.primary));
    print('Kalibrace v2 (`pRem`) proti skryté pravdě (reference):\n');
    print(calibrationMarkdown(a.reference!));
    print('Kalibrace podle úrovní, baseline (primary):\n');
    print(calibrationMarkdown(b.primary, own: false));
  }
}

/// Průměr přes 5 seedů po 120 nocích.
void seeds() {
  print('## Pět seedů po 120 nocích\n');
  print(
      '| seed | pravda | log v2 | log baseline | Brier v2 | Brier baseline | log v2 vlastní p | rozdíl log (95% CI) |');
  print('|---|---|---|---|---|---|---|---|');
  for (final seed in [1, 2, 3, 4, 5]) {
    final d = generateSynthData(SynthConfig(nights: 120, seed: seed));
    final a = backtest(d.nights, d.marks, v2Predictor(), reference: d.truth, label: 'v2');
    final b = backtest(d.nights, d.marks, baselinePredictor, reference: d.truth, label: 'baseline');
    for (final t in BacktestTruth.values) {
      final ma = a.metrics(t)!, mb = b.metrics(t)!;
      final c = comparePaired(a, b, truth: t);
      print('| $seed | ${t.name} | ${ma.logLossLevel.toStringAsFixed(4)} | ${mb.logLossLevel.toStringAsFixed(4)} | '
          '${ma.brierLevel.toStringAsFixed(4)} | ${mb.brierLevel.toStringAsFixed(4)} | ${ma.logLossProb!.toStringAsFixed(4)} | '
          '${c.diff.toStringAsFixed(4)} (${c.ciLow.toStringAsFixed(4)} až ${c.ciHigh.toStringAsFixed(4)}) |');
    }
  }
  print('');
}

/// Scénáře generátoru (jiná osoba, jiná zařízení) nebo varianty parametrů v2; průměr 5 seedů.
void grid({required bool scenarios}) {
  const d = RemModelV2Params.defaults;
  final scen = <String, SynthConfig Function(int)>{
    'výchozí': (s) => SynthConfig(nights: 120, seed: s),
    if (scenarios) ...{
      'latence 68 min': (s) => SynthConfig(nights: 120, seed: s, latencyMean: 68),
      'latence 110 min': (s) => SynthConfig(nights: 120, seed: s, latencyMean: 110),
      'cyklus 82 min': (s) => SynthConfig(nights: 120, seed: s, cycleMean: 82),
      'cyklus 108 min': (s) => SynthConfig(nights: 120, seed: s, cycleMean: 108),
      'REM periody ×1,3': (s) => SynthConfig(nights: 120, seed: s, remScale: 1.3),
      'jen Garmin': (s) => SynthConfig(nights: 120, seed: s, ouraProbability: 0, garminProbability: 1),
      'jen Oura': (s) => SynthConfig(nights: 120, seed: s, ouraProbability: 1, garminProbability: 0),
      'nový uživatel (noci 4–33)': (s) => SynthConfig(nights: 33, seed: s),
    },
  };
  final pars = <String, RemModelV2Params>{
    'v2 výchozí': d,
    if (!scenarios) ...{
      'γ 0,3': d.copyWith(gamma: 0.3),
      'γ 0,75': d.copyWith(gamma: 0.75),
      'γ 1': d.copyWith(gamma: 1),
      'β 1': d.copyWith(beta: 1),
      'ρ 0': d.copyWith(rho: 0),
      'ρ 0,6': d.copyWith(rho: 0.6),
      'bez pojistky přehlédnutí':
          d.copyWith(ouraMissFirst: 0, ouraMissLater: 0, garminMissFirst: 0, garminMissLater: 0),
      'apriorní síla 2 noci': d.copyWith(priorNights: 2),
      'apriorní síla 20 nocí': d.copyWith(priorNights: 20),
      'poločas 15 dní': d.copyWith(halfLifeDays: 15),
      'poločas 60 dní': d.copyWith(halfLifeDays: 60),
      'okno 60 dní': d.copyWith(lookbackDays: 60),
      'bez značek (LR 1)': d.copyWith(markWokeLr: 1, markDreamLr: 1, markEmptyLr: 1),
      'citlivost zařízení −0,1': d.copyWith(ouraSensitivity: 0.6, garminSensitivity: 0.4),
      'falešné poplachy +0,05': d.copyWith(ouraFalsePositive: 0.15, garminFalsePositive: 0.2),
      'úrovně i peak bez P(spíš)': d.copyWith(peakAsleepWeight: 0),
      'úrovně i peak s P(spíš)': d.copyWith(asleepWeight: 1),
    },
  };
  print(scenarios
      ? '## Scénáře generátoru (průměr 5 seedů po 120 nocích)\n'
      : '## Citlivost na parametry v2 (průměr 5 seedů po 120 nocích)\n');
  print(
      '| scénář | prediktor | log úrovně (primary) | Brier úrovně (primary) | log vlastní p (primary) | ECE (primary) | '
      'log úrovně (reference) | log vlastní p (reference) | ECE (reference) | střed nejl. okna v REM (primary / reference) | '
      '≥ 10 min REM v nejl. okně (primary / reference) | hustota klesá |');
  print('|---|---|---|---|---|---|---|---|---|---|---|---|');
  const seeds = [1, 2, 3, 4, 5];
  for (final sc in scen.entries) {
    final rows = <String, List<double>>{};
    final mono = <String, int>{};
    for (final s in seeds) {
      final data = generateSynthData(sc.value(s));
      final opts = sc.key.startsWith('nový')
          ? const BacktestOptions(minPastNights: 3, rateWarmupNights: 0)
          : const BacktestOptions();
      void add(String k, BacktestResult r) {
        final v = [
          r.primary.logLossLevel,
          r.primary.brierLevel,
          r.primary.logLossProb ?? double.nan,
          r.primary.eceProb ?? double.nan,
          r.reference!.logLossLevel,
          r.reference!.logLossProb ?? double.nan,
          r.reference!.eceProb ?? double.nan,
          r.primary.best.centerRate,
          r.reference!.best.centerRate,
          r.primary.best.hitRate,
          r.reference!.best.hitRate,
        ];
        final acc = rows.putIfAbsent(k, () => List<double>.filled(v.length, 0));
        for (var i = 0; i < v.length; i++) {
          acc[i] += v[i] / seeds.length;
        }
        mono[k] = (mono[k] ?? 0) + (r.primary.densityDecreasing && r.reference!.densityDecreasing ? 1 : 0);
      }

      add('baseline', backtest(data.nights, data.marks, baselinePredictor, reference: data.truth, options: opts));
      for (final pe in pars.entries) {
        add(pe.key, backtest(data.nights, data.marks, v2Predictor(pe.value), reference: data.truth, options: opts));
      }
    }
    String f(double x, [int dg = 4]) => x.isNaN ? 'n/a' : x.toStringAsFixed(dg);
    for (final e in rows.entries) {
      final v = e.value;
      print('| ${sc.key} | ${e.key} | ${f(v[0])} | ${f(v[1])} | ${f(v[2])} | ${f(v[3], 3)} | ${f(v[4])} | ${f(v[5])} | '
          '${f(v[6], 3)} | ${(100 * v[7]).toStringAsFixed(0)} % / ${(100 * v[8]).toStringAsFixed(0)} % | '
          '${(100 * v[9]).toStringAsFixed(0)} % / ${(100 * v[10]).toStringAsFixed(0)} % | ${mono[e.key]}/${seeds.length} |');
    }
  }
  print('');
}

/// Časy výpočtu na tomhle stroji (Dart VM, JIT).
void timing() {
  final d = generateSynthData(const SynthConfig(nights: 400, seed: 1));
  final onset = DateTime.utc(2027, 2, 10, 23);
  final tonight = DateTime.utc(2027, 2, 10);
  final groups = remGroupNights(d.nights);
  final keys = groups.keys.toList()..sort();
  // zahřátí JIT
  for (var i = 0; i < 3; i++) {
    remWindowsV2(d.nights, marks: d.marks, onset: onset, tonight: tonight);
  }
  final sw = Stopwatch()..start();
  var n = 0;
  for (final k in keys.take(100)) {
    final data = remNightData(groups[k]!);
    if (data != null) {
      remNightPosterior(data);
      n++;
    }
  }
  final perNight = sw.elapsedMicroseconds / n / 1000;
  sw.reset();
  const reps = 5;
  for (var i = 0; i < reps; i++) {
    remWindowsV2(d.nights, marks: d.marks, onset: onset, tonight: tonight);
  }
  final cold = sw.elapsedMilliseconds / reps;
  final cache = RemV2Cache();
  remWindowsV2(d.nights, marks: d.marks, onset: onset, tonight: tonight, cache: cache);
  sw.reset();
  for (var i = 0; i < 20; i++) {
    remWindowsV2(d.nights, marks: d.marks, onset: onset, tonight: tonight, cache: cache);
  }
  final warm = sw.elapsedMilliseconds / 20;
  sw.reset();
  for (var i = 0; i < 20; i++) {
    remWindowsBaseline(d.nights, marks: d.marks, onset: onset, tonight: tonight);
  }
  final base = sw.elapsedMilliseconds / 20;
  print('## Výpočetní čas (Dart VM JIT, tento počítač)\n');
  print('| operace | čas |');
  print('|---|---|');
  print('| posterior jedné noci (HSMM, 5 min, obě zařízení) | ${perNight.toStringAsFixed(1)} ms |');
  print('| `remWindowsV2`, historie 400 nocí, bez cache (zpracuje ~120 nocí) | ${cold.toStringAsFixed(0)} ms |');
  print('| `remWindowsV2` s `RemV2Cache` (posteriory už spočítané) | ${warm.toStringAsFixed(1)} ms |');
  print('| `remWindowsBaseline` | ${base.toStringAsFixed(1)} ms |');
  print('');
}
