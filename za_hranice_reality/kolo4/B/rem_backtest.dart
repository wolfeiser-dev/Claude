/// Walk-forward backtest předpovědí REM oken (kolo 4, část B).
///
/// Čistý Dart 3.6, jen `dart:math`. Pustíš si ho u sebe na skutečných nocích:
///
/// ```dart
/// final v2 = RemV2Cache();
/// List<RemWindow> modelV2(List<SleepNight> past, List<RemMark> m, DateTime onset, DateTime tonight) =>
///     remWindowsV2(past, marks: m, onset: onset, tonight: tonight, cache: v2);
/// List<RemWindow> today(List<SleepNight> past, List<RemMark> m, DateTime onset, DateTime tonight) =>
///     remWindows(...); // dnešní model appky
/// final a = backtest(nights, marks, modelV2, label: 'v2');
/// final b = backtest(nights, marks, today, label: 'dnes');
/// print(backtestMarkdown([a, b]));
/// print(comparePaired(a, b).toMarkdownRow());
/// ```
///
/// **Postup (walk-forward):** noci se seřadí podle data večera. Pro každou
/// hodnocenou noc dostane prediktor jen záznamy a značky s dřívějším datem,
/// usnutí té noci (kotva jako v modelu: Oura `onset`, jinak Garmin, jinak
/// první trvalý spánek) a její datum. Nic z hodnocené noci ani z budoucnosti.
///
/// **Pravda po 5 min** (mřížka od usnutí do konce posledního spánku):
/// * [BacktestTruth.primary]: REM podle Oury, když noc Ouru má, jinak Garminu
///   (epocha je REM, když ho zařízení ukazuje aspoň polovinu jejího času);
/// * [BacktestTruth.agree]: jen noci s oběma zařízeními a jen epochy, kde se
///   shodnou (obě REM = 1, obě ne-REM = 0), ostatní se vynechají;
/// * [BacktestTruth.reference]: volitelný referenční hypnogram (PSG, EEG
///   čelenka, nebo skrytá pravda syntetiky) na stejné mřížce.
///
/// **Pravděpodobnost pro log skóre a Brier.** Okna nesou jen úroveň, ne
/// pravděpodobnost. Proto dvě rodiny metrik:
/// * „podle úrovní“ (pro každý prediktor, i dnešní): p = četnost REM v epochách
///   dané úrovně z **dříve** vyhodnocených nocí téhož prediktoru (Beta prior
///   se středem [BacktestOptions.levelPriorMean] a silou
///   [BacktestOptions.levelPriorStrength] epoch, stejný pro všechny úrovně
///   a prediktory). Učí se walk-forward, bez pohledu do hodnocené noci.
///   Prvních [BacktestOptions.rateWarmupNights] nocí před první hodnocenou
///   jen zahřívá tyto četnosti. Měří, jak dobře úrovně třídí noc.
/// * „vlastní pravděpodobnost“: když prediktor vrací [RemWindowV2], bere se
///   jeho křivka po 5 min bez úprav (primary: `pDevice`, agree: `pAgree`,
///   reference: `pRem`). Měří kalibraci modelu samotného.
/// Obojí oříznuté do [BacktestOptions.clip, 1 − clip]. Pro měřítko je
/// u každé metriky i klimatologie: stálá walk-forward četnost REM bez času.
///
/// **Nejlepší okno** ([bestRemWindow]): okno s nejvyšším `peak` (při shodě
/// vyšší úroveň, delší, dřívější). Hlavní zásah = **střed okna padne do
/// skutečného REM** (5min epocha uprostřed). Proč: nejlepší okno slouží
/// k budíku WBTB nebo Zvukovému klíči, které míří doprostřed okna, a tohle
/// kritérium nezvýhodňuje dlouhá okna. Vedlejší zásahy: v okně je aspoň
/// [BacktestOptions.bestHitMinutes] (10) min REM (nejkratší REM perioda,
/// kterou 5min data spolehlivě odliší, pravidlo F5), a jakýkoli překryv.
/// Ty se ale s délkou okna snadno zlepší, proto se hlásí i délka okna,
/// hustota REM v něm (podíl epoch s REM) a její poměr k průměru noci (lift).
library;

import 'dart:math' as math;

import 'rem_model_v2.dart';
import 'rem_types.dart';

enum BacktestTruth { primary, agree, reference }

class BacktestOptions {
  const BacktestOptions({
    this.minPastNights = 14,
    this.rateWarmupNights = 30,
    this.lastNights,
    this.levelPriorMean = 0.2,
    this.levelPriorStrength = 20,
    this.bestHitMinutes = 10,
    this.clip = 0.01,
  });

  /// Hodnotí se jen noci, před kterými je aspoň tolik nocí s daty.
  final int minPastNights;

  /// Kolik nocí před první hodnocenou jen zahřívá četnosti úrovní.
  final int rateWarmupNights;

  /// Hodnotit jen posledních N způsobilých nocí (např. 120), `null` = všechny.
  final int? lastNights;
  final double levelPriorMean, levelPriorStrength;
  final int bestHitMinutes;
  final double clip;
}

/// Koš kalibrační tabulky [lo, hi).
class CalibrationBin {
  const CalibrationBin(this.lo, this.hi, this.count, this.meanPredicted, this.observed);
  final double lo, hi;
  final int count;
  final double meanPredicted, observed;
}

/// Kolik epoch měla úroveň a kolik z nich bylo REM.
class LevelStats {
  const LevelStats(this.epochs, this.remEpochs, this.totalEpochs, this.totalRem);
  final int epochs, remEpochs, totalEpochs, totalRem;

  /// Hustota REM v oknech této úrovně (má klesat od high k unlikely).
  double get density => epochs == 0 ? double.nan : remEpochs / epochs;

  /// Podíl noci, který úroveň zabírá.
  double get shareOfNight => totalEpochs == 0 ? 0 : epochs / totalEpochs;

  /// Podíl všeho skutečného REM, který padl do této úrovně.
  double get shareOfRem => totalRem == 0 ? 0 : remEpochs / totalRem;
}

class BestWindowStats {
  const BestWindowStats({
    required this.nights,
    required this.centerHits,
    required this.hits,
    required this.anyOverlap,
    required this.meanDensity,
    required this.meanMinutes,
    required this.meanLift,
  });

  /// [centerHits]: střed okna v REM; [hits]: aspoň 10 min REM; [anyOverlap]: aspoň 5 min.
  final int nights, centerHits, hits, anyOverlap;
  final double meanDensity, meanMinutes, meanLift;

  /// Podíl nocí, kdy střed nejlepšího okna padl do REM (hlavní zásah).
  double get centerRate => nights == 0 ? double.nan : centerHits / nights;
  double get hitRate => nights == 0 ? double.nan : hits / nights;
  double get anyRate => nights == 0 ? double.nan : anyOverlap / nights;
}

/// Skóre jedné noci (součty přes epochy; pro párové srovnání).
class NightScore {
  const NightScore({
    required this.key,
    required this.epochs,
    required this.remEpochs,
    required this.logLossLevel,
    required this.brierLevel,
    required this.logLossClim,
    required this.brierClim,
    this.logLossProb,
    this.brierProb,
    required this.bestHit,
    required this.highShare,
  });

  final int key, epochs, remEpochs;
  final double logLossLevel, brierLevel, logLossClim, brierClim;
  final double? logLossProb, brierProb;
  final bool? bestHit;
  final double highShare;
}

/// Metriky pro jednu variantu pravdy.
class BacktestMetrics {
  BacktestMetrics({
    required this.truth,
    required this.perNight,
    required this.levels,
    required this.best,
    required this.calibrationLevel,
    required this.calibrationProb,
    required this.highShareMax,
    required this.probFallbackEpochs,
  });

  final BacktestTruth truth;
  final List<NightScore> perNight;
  final Map<RemLevel, LevelStats> levels;
  final BestWindowStats best;
  final List<CalibrationBin> calibrationLevel;
  final List<CalibrationBin>? calibrationProb;
  final double highShareMax;

  /// Epochy mimo křivku prediktoru (za jeho horizontem), kde se vzala četnost úrovně.
  final int probFallbackEpochs;

  int get nights => perNight.length;
  int get epochs => perNight.fold(0, (a, n) => a + n.epochs);
  int get remEpochs => perNight.fold(0, (a, n) => a + n.remEpochs);
  double get remRate => epochs == 0 ? double.nan : remEpochs / epochs;

  double _mean(double Function(NightScore) f) =>
      epochs == 0 ? double.nan : perNight.fold(0.0, (a, n) => a + f(n)) / epochs;

  /// Log ztráta = −průměr ln p(skutečnost) po 5 min (nižší je lepší; log skóre = −log ztráta).
  double get logLossLevel => _mean((n) => n.logLossLevel);
  double get brierLevel => _mean((n) => n.brierLevel);
  double get logLossClim => _mean((n) => n.logLossClim);
  double get brierClim => _mean((n) => n.brierClim);
  double? get logLossProb => perNight.any((n) => n.logLossProb == null) ? null : _mean((n) => n.logLossProb!);
  double? get brierProb => perNight.any((n) => n.brierProb == null) ? null : _mean((n) => n.brierProb!);

  /// Skill proti klimatologii: 1 − ztráta / ztráta klimatologie.
  double get logSkillLevel => 1 - logLossLevel / logLossClim;
  double get brierSkillLevel => 1 - brierLevel / brierClim;
  double? get logSkillProb => logLossProb == null ? null : 1 - logLossProb! / logLossClim;
  double? get brierSkillProb => brierProb == null ? null : 1 - brierProb! / brierClim;

  double get highShareMean => nights == 0 ? double.nan : perNight.fold(0.0, (a, n) => a + n.highShare) / nights;

  /// Klesá hustota REM od high přes mid a low k unlikely (prázdné úrovně se přeskočí)?
  bool get densityDecreasing {
    var last = double.infinity;
    for (final l in [RemLevel.high, RemLevel.mid, RemLevel.low, RemLevel.unlikely]) {
      final d = levels[l]!.density;
      if (d.isNaN) {
        continue;
      }
      if (d > last + 1e-12) {
        return false;
      }
      last = d;
    }
    return true;
  }

  double get eceLevel => _ece(calibrationLevel);
  double? get eceProb => calibrationProb == null ? null : _ece(calibrationProb!);

  static double _ece(List<CalibrationBin> bins) {
    final n = bins.fold(0, (a, b) => a + b.count);
    if (n == 0) {
      return double.nan;
    }
    return bins.fold(0.0, (a, b) => b.count == 0 ? a : a + b.count * (b.meanPredicted - b.observed).abs()) / n;
  }
}

class BacktestResult {
  BacktestResult({
    required this.label,
    required this.predictions,
    required this.elapsed,
    required this.primary,
    required this.agree,
    required this.reference,
  });

  final String label;

  /// Kolik volání prediktoru proběhlo (zahřívací + hodnocené noci).
  final int predictions;
  final Duration elapsed;
  final BacktestMetrics primary;
  final BacktestMetrics? agree, reference;

  BacktestMetrics? metrics(BacktestTruth t) => switch (t) {
        BacktestTruth.primary => primary,
        BacktestTruth.agree => agree,
        BacktestTruth.reference => reference,
      };
}

/// Okno s nejvyšším `peak`; při shodě vyšší úroveň, delší, dřívější. `null` bez oken.
RemWindow? bestRemWindow(List<RemWindow> windows) {
  RemWindow? best;
  for (final w in windows) {
    if (best == null) {
      best = w;
      continue;
    }
    final c = _compareBest(w, best);
    if (c > 0) {
      best = w;
    }
  }
  return best;
}

int _compareBest(RemWindow a, RemWindow b) {
  if (a.peak != b.peak) {
    return a.peak > b.peak ? 1 : -1;
  }
  if (a.level != b.level) {
    return a.level.index > b.level.index ? 1 : -1;
  }
  final la = a.toOffset - a.fromOffset, lb = b.toOffset - b.fromOffset;
  if (la != lb) {
    return la > lb ? 1 : -1;
  }
  return a.fromOffset < b.fromOffset ? 1 : (a.fromOffset > b.fromOffset ? -1 : 0);
}

class _Acc {
  _Acc(this.truth, this.opts) {
    for (final l in RemLevel.values) {
      rateRem[l] = 0;
      rateAll[l] = 0;
      lvEpochs[l] = 0;
      lvRem[l] = 0;
    }
  }

  final BacktestTruth truth;
  final BacktestOptions opts;
  final Map<RemLevel, int> rateRem = {}, rateAll = {}, lvEpochs = {}, lvRem = {};
  int climRem = 0, climAll = 0;
  final List<NightScore> nights = [];
  final List<int> calLvN = List<int>.filled(10, 0), calPrN = List<int>.filled(10, 0);
  final List<double> calLvP = List<double>.filled(10, 0), calLvY = List<double>.filled(10, 0);
  final List<double> calPrP = List<double>.filled(10, 0), calPrY = List<double>.filled(10, 0);
  bool anyProb = false, allProb = true;
  int fallback = 0;
  int bestNights = 0, bestHits = 0, bestAny = 0, bestCenter = 0;
  double bestDensity = 0, bestMinutes = 0, bestLift = 0;
  int bestLiftN = 0;
  double highMax = 0;

  double _rate(int rem, int all) {
    final a = opts.levelPriorMean * opts.levelPriorStrength;
    return (a + rem) / (opts.levelPriorStrength + all);
  }

  double _clip(double p) => p.clamp(opts.clip, 1 - opts.clip).toDouble();

  void night(int key, List<int> y, List<RemLevel> lv, List<double?>? prob, RemWindow? best, bool scored) {
    var n = 0, rem = 0, high = 0;
    var llL = 0.0, brL = 0.0, llC = 0.0, brC = 0.0, llP = 0.0, brP = 0.0;
    final climP = _clip(_rate(climRem, climAll));
    final rates = {for (final l in RemLevel.values) l: _clip(_rate(rateRem[l]!, rateAll[l]!))};
    for (var i = 0; i < y.length; i++) {
      final yi = y[i];
      if (yi < 0) {
        continue;
      }
      n++;
      rem += yi;
      final l = lv[i];
      if (l == RemLevel.high) {
        high++;
      }
      if (scored) {
        final pl = rates[l]!;
        llL += _ll(pl, yi);
        brL += (pl - yi) * (pl - yi);
        llC += _ll(climP, yi);
        brC += (climP - yi) * (climP - yi);
        _cal(calLvN, calLvP, calLvY, pl, yi);
        lvEpochs[l] = lvEpochs[l]! + 1;
        lvRem[l] = lvRem[l]! + yi;
        if (prob != null) {
          var pp = prob[i];
          if (pp == null) {
            fallback++;
            pp = pl;
          }
          pp = _clip(pp);
          llP += _ll(pp, yi);
          brP += (pp - yi) * (pp - yi);
          _cal(calPrN, calPrP, calPrY, pp, yi);
        }
      }
    }
    if (n == 0) {
      return;
    }
    if (scored) {
      bool? hit;
      if (best != null) {
        var bn = 0, br = 0;
        final ci = ((best.fromOffset + best.toOffset) / 2 / 5).floor();
        bestCenter += ci >= 0 && ci < y.length && y[ci] == 1 ? 1 : 0;
        for (var i = 0; i < y.length; i++) {
          final mid = i * 5 + 2.5;
          if (y[i] < 0 || mid < best.fromOffset || mid >= best.toOffset) {
            continue;
          }
          bn++;
          br += y[i];
        }
        hit = br * 5 >= opts.bestHitMinutes;
        bestNights++;
        bestHits += hit ? 1 : 0;
        bestAny += br > 0 ? 1 : 0;
        bestMinutes += best.toOffset - best.fromOffset;
        if (bn > 0) {
          final dens = br / bn;
          bestDensity += dens;
          if (rem > 0) {
            bestLift += dens / (rem / n);
            bestLiftN++;
          }
        }
      }
      final hs = high / n;
      highMax = math.max(highMax, hs);
      if (prob != null) {
        anyProb = true;
      } else {
        allProb = false;
      }
      nights.add(NightScore(
        key: key,
        epochs: n,
        remEpochs: rem,
        logLossLevel: llL,
        brierLevel: brL,
        logLossClim: llC,
        brierClim: brC,
        logLossProb: prob == null ? null : llP,
        brierProb: prob == null ? null : brP,
        bestHit: hit,
        highShare: hs,
      ));
    }
    // Walk-forward učení četností až po vyhodnocení noci.
    for (var i = 0; i < y.length; i++) {
      if (y[i] < 0) {
        continue;
      }
      rateAll[lv[i]] = rateAll[lv[i]]! + 1;
      rateRem[lv[i]] = rateRem[lv[i]]! + y[i];
      climAll++;
      climRem += y[i];
    }
  }

  static double _ll(double p, int y) => y == 1 ? -math.log(p) : -math.log(1 - p);

  static void _cal(List<int> cn, List<double> cp, List<double> cy, double p, int y) {
    final b = math.min(9, (p * 10).floor());
    cn[b]++;
    cp[b] += p;
    cy[b] += y;
  }

  BacktestMetrics build() {
    final totalE = lvEpochs.values.fold(0, (a, b) => a + b);
    final totalR = lvRem.values.fold(0, (a, b) => a + b);
    List<CalibrationBin> bins(List<int> cn, List<double> cp, List<double> cy) => [
          for (var b = 0; b < 10; b++)
            CalibrationBin(b / 10, (b + 1) / 10, cn[b], cn[b] == 0 ? double.nan : cp[b] / cn[b],
                cn[b] == 0 ? double.nan : cy[b] / cn[b]),
        ];
    return BacktestMetrics(
      truth: truth,
      perNight: nights,
      levels: {for (final l in RemLevel.values) l: LevelStats(lvEpochs[l]!, lvRem[l]!, totalE, totalR)},
      best: BestWindowStats(
        nights: bestNights,
        centerHits: bestCenter,
        hits: bestHits,
        anyOverlap: bestAny,
        meanDensity: bestNights == 0 ? double.nan : bestDensity / bestNights,
        meanMinutes: bestNights == 0 ? double.nan : bestMinutes / bestNights,
        meanLift: bestLiftN == 0 ? double.nan : bestLift / bestLiftN,
      ),
      calibrationLevel: bins(calLvN, calLvP, calLvY),
      calibrationProb: anyProb && allProb ? bins(calPrN, calPrP, calPrY) : null,
      highShareMax: highMax,
      probFallbackEpochs: fallback,
    );
  }
}

/// Walk-forward backtest prediktoru [p] na nocích [nights] se značkami [marks].
///
/// [reference]: volitelný referenční hypnogram podle data večera (PSG,
/// skrytá pravda syntetiky); přidá variantu [BacktestTruth.reference].
BacktestResult backtest(
  List<SleepNight> nights,
  List<RemMark> marks,
  Predictor p, {
  BacktestOptions options = const BacktestOptions(),
  Map<DateTime, List<SleepSegment>>? reference,
  String label = '',
}) {
  final sw = Stopwatch()..start();
  final o = options;
  // Stabilní řazení podle data večera.
  final entries = [for (var i = 0; i < nights.length; i++) (k: remNightKey(nights[i].nightDate), i: i)]
    ..sort((a, b) => a.k != b.k ? a.k.compareTo(b.k) : a.i.compareTo(b.i));
  final sortedNights = [for (final e in entries) nights[e.i]];
  final entryKeys = [for (final e in entries) e.k];
  final mk = [for (var i = 0; i < marks.length; i++) (k: remNightKey(marks[i].nightDate), i: i)]
    ..sort((a, b) => a.k != b.k ? a.k.compareTo(b.k) : a.i.compareTo(b.i));
  final sortedMarks = [for (final e in mk) marks[e.i]];
  final markKeys = [for (final e in mk) e.k];
  final refByKey = reference == null ? null : {for (final e in reference.entries) remNightKey(e.key): e.value};

  final groups = remGroupNights(sortedNights);
  final keys = groups.keys.toList()..sort();
  final datas = <int, RemNightData>{};
  for (final k in keys) {
    final d = remNightData(groups[k]!);
    if (d != null) {
      datas[k] = d;
    }
  }
  final eligible = keys.where(datas.containsKey).toList();
  var scored = <int>[];
  for (var i = 0; i < eligible.length; i++) {
    if (i >= o.minPastNights) {
      scored.add(i);
    }
  }
  if (o.lastNights != null && scored.length > o.lastNights!) {
    scored = scored.sublist(scored.length - o.lastNights!);
  }
  final scoredSet = scored.toSet();
  final firstScored = scored.isEmpty ? eligible.length : scored.first;
  final runIdx = <int>[
    for (var i = math.max(1, firstScored - o.rateWarmupNights); i < firstScored; i++) i,
    ...scored,
  ];

  final accs = {for (final t in BacktestTruth.values) t: _Acc(t, o)};
  var calls = 0;
  var ePtr = 0, mPtr = 0;
  for (final idx in runIdx) {
    final key = eligible[idx];
    final data = datas[key]!;
    while (ePtr < entryKeys.length && entryKeys[ePtr] < key) {
      ePtr++;
    }
    while (mPtr < markKeys.length && markKeys[mPtr] < key) {
      mPtr++;
    }
    final past = List<SleepNight>.unmodifiable(sortedNights.sublist(0, ePtr));
    final pastMarks = List<RemMark>.unmodifiable(sortedMarks.sublist(0, mPtr));
    final windows = [...p(past, pastMarks, data.anchor, data.nightDate)]
      ..sort((a, b) => a.fromOffset.compareTo(b.fromOffset));
    calls++;
    final tT = data.epochs;
    final lv = List<RemLevel>.filled(tT, RemLevel.unlikely);
    RemCurveV2? curve;
    var wi = 0;
    for (var i = 0; i < tT; i++) {
      final mid = i * 5 + 2.5;
      while (wi < windows.length && windows[wi].toOffset <= mid) {
        wi++;
      }
      if (wi < windows.length && windows[wi].fromOffset <= mid) {
        lv[i] = windows[wi].level;
      }
    }
    for (final w in windows) {
      if (w is RemWindowV2) {
        curve = w.curve;
        break;
      }
    }
    final best = bestRemWindow(windows);
    final isScored = scoredSet.contains(idx);

    List<double?>? probs(List<double> Function(RemCurveV2) f) {
      final c = curve;
      if (c == null) {
        return null;
      }
      final arr = f(c);
      final shift = _minutes(c.onset, data.anchor) / 5;
      return [
        for (var i = 0; i < tT; i++)
          () {
            final j = (i + shift).round();
            return j >= 0 && j < arr.length ? arr[j] : null;
          }(),
      ];
    }

    // primary
    final dev = data.hasOura ? 0 : 1;
    final yP = [
      for (var i = 0; i < tT; i++)
        data.covered(dev, i) ? ((dev == 0 ? data.ouraRem[i] : data.garminRem[i]) ? 1 : 0) : -1,
    ];
    accs[BacktestTruth.primary]!.night(key, yP, lv, probs((c) => c.pDevice), best, isScored);
    if (data.hasOura && data.hasGarmin) {
      final yA = [
        for (var i = 0; i < tT; i++)
          !data.covered(0, i) || !data.covered(1, i) || data.ouraRem[i] != data.garminRem[i]
              ? -1
              : (data.ouraRem[i] ? 1 : 0),
      ];
      accs[BacktestTruth.agree]!.night(key, yA, lv, probs((c) => c.pAgree), best, isScored);
    }
    final ref = refByKey?[key];
    if (ref != null) {
      final yR = _referenceTruth(ref, data);
      accs[BacktestTruth.reference]!.night(key, yR, lv, probs((c) => c.pRem), best, isScored);
    }
  }
  final agree = accs[BacktestTruth.agree]!.build();
  final refM = accs[BacktestTruth.reference]!.build();
  return BacktestResult(
    label: label,
    predictions: calls,
    elapsed: sw.elapsed,
    primary: accs[BacktestTruth.primary]!.build(),
    agree: agree.nights == 0 ? null : agree,
    reference: refM.nights == 0 ? null : refM,
  );
}

double _minutes(DateTime a, DateTime b) => (b.microsecondsSinceEpoch - a.microsecondsSinceEpoch) / 6e7;

/// Referenční REM na mřížce noci (REM aspoň polovinu pokrytého času epochy).
List<int> _referenceTruth(List<SleepSegment> segs, RemNightData data) {
  final tT = data.epochs;
  final rem = List<double>.filled(tT, 0), cov = List<double>.filled(tT, 0);
  for (final s in segs) {
    final a = math.max(0.0, _minutes(data.anchor, s.start));
    final b = math.min(tT * 5.0, _minutes(data.anchor, s.end));
    if (b <= a) {
      continue;
    }
    for (var i = (a / 5).floor(); i < math.min(tT, (b / 5).ceil()); i++) {
      final ov = math.min(b, i * 5.0 + 5) - math.max(a, i * 5.0);
      if (ov > 0) {
        cov[i] += ov;
        if (s.stage == SleepStage.rem) {
          rem[i] += ov;
        }
      }
    }
  }
  return [
    for (var i = 0; i < tT; i++) cov[i] >= 2.5 ? (rem[i] / cov[i] >= 0.5 ? 1 : 0) : -1,
  ];
}

// ===========================================================================
// Párové srovnání dvou prediktorů (bootstrap po blocích nocí)
// ===========================================================================

enum BacktestMetric { logLossLevel, brierLevel, logLossProb, brierProb }

class PairedComparison {
  const PairedComparison({
    required this.metric,
    required this.truth,
    required this.nights,
    required this.meanA,
    required this.meanB,
    required this.diff,
    required this.ciLow,
    required this.ciHigh,
    required this.shareABetter,
    required this.labelA,
    required this.labelB,
  });

  final BacktestMetric metric;
  final BacktestTruth truth;
  final int nights;
  final String labelA, labelB;

  /// Průměrná ztráta po 5 min: A, B a rozdíl A − B (záporný = A lepší) s 95% intervalem.
  final double meanA, meanB, diff, ciLow, ciHigh;

  /// Podíl nocí, ve kterých měl A nižší ztrátu.
  final double shareABetter;

  String toMarkdownRow() => '| ${metric.name} | ${truth.name} | $nights | ${_f(meanA)} | ${_f(meanB)} | '
      '${_f(diff)} | ${_f(ciLow)} až ${_f(ciHigh)} | ${(100 * shareABetter).toStringAsFixed(0)} % |';
}

/// Párové srovnání A − B po nocích se stejným datem. Interval z bootstrapu
/// po blocích [block] po sobě jdoucích nocí (noci nejsou nezávislé), [resamples] opakování.
PairedComparison comparePaired(
  BacktestResult a,
  BacktestResult b, {
  BacktestTruth truth = BacktestTruth.primary,
  BacktestMetric metric = BacktestMetric.logLossLevel,
  int resamples = 2000,
  int block = 7,
  int seed = 20261023,
}) {
  final ma = a.metrics(truth), mb = b.metrics(truth);
  if (ma == null || mb == null) {
    throw ArgumentError('Varianta ${truth.name} chybí v jednom z výsledků.');
  }
  double? val(NightScore n) => switch (metric) {
        BacktestMetric.logLossLevel => n.logLossLevel,
        BacktestMetric.brierLevel => n.brierLevel,
        BacktestMetric.logLossProb => n.logLossProb,
        BacktestMetric.brierProb => n.brierProb,
      };
  final byKey = {for (final n in mb.perNight) n.key: n};
  final da = <double>[], db = <double>[], ep = <int>[];
  for (final n in ma.perNight) {
    final m = byKey[n.key];
    final va = val(n);
    final vb = m == null ? null : val(m);
    if (m == null || va == null || vb == null || m.epochs != n.epochs) {
      continue;
    }
    da.add(va);
    db.add(vb);
    ep.add(n.epochs);
  }
  final nN = da.length;
  if (nN == 0) {
    throw ArgumentError('Žádné společné noci pro ${metric.name}.');
  }
  double meanOf(List<double> v, List<int> idx) {
    var s = 0.0, e = 0;
    for (final i in idx) {
      s += v[i];
      e += ep[i];
    }
    return s / e;
  }

  final all = List<int>.generate(nN, (i) => i);
  final diffs = [for (var i = 0; i < nN; i++) da[i] - db[i]];
  final rng = _Rng(seed);
  final bl = math.max(1, math.min(block, nN));
  final stats = <double>[];
  for (var r = 0; r < resamples; r++) {
    final idx = <int>[];
    while (idx.length < nN) {
      final s = rng.nextInt(nN - bl + 1);
      for (var i = s; i < s + bl && idx.length < nN; i++) {
        idx.add(i);
      }
    }
    stats.add(meanOf(diffs, idx));
  }
  stats.sort();
  final better = [for (var i = 0; i < nN; i++) da[i] < db[i]].where((x) => x).length;
  return PairedComparison(
    metric: metric,
    truth: truth,
    nights: nN,
    meanA: meanOf(da, all),
    meanB: meanOf(db, all),
    diff: meanOf(diffs, all),
    ciLow: stats[(0.025 * (resamples - 1)).round()],
    ciHigh: stats[(0.975 * (resamples - 1)).round()],
    shareABetter: better / nN,
    labelA: a.label,
    labelB: b.label,
  );
}

// ===========================================================================
// Výpis
// ===========================================================================

String _f(double? x, [int digits = 4]) => x == null || x.isNaN ? 'n/a' : x.toStringAsFixed(digits);
String _pc(double x) => x.isNaN ? 'n/a' : '${(100 * x).toStringAsFixed(1)} %';

/// Tabulky v Markdownu pro výsledky [results] (jedna varianta pravdy na tabulku).
String backtestMarkdown(List<BacktestResult> results, {List<BacktestTruth>? truths}) {
  final sb = StringBuffer();
  for (final t in truths ?? BacktestTruth.values) {
    final rows = [
      for (final r in results)
        if (r.metrics(t) != null) (r, r.metrics(t)!),
    ];
    if (rows.isEmpty) {
      continue;
    }
    sb
      ..writeln('#### Pravda: ${t.name}')
      ..writeln()
      ..writeln('| prediktor | nocí | epoch | REM | log ztráta (úrovně) | Brier (úrovně) | log ztráta (vlastní p) | '
          'Brier (vlastní p) | ECE (vlastní p) | klimatologie log / Brier | high podíl noci (max) | '
          'nejlepší okno: střed v REM / ≥ 10 min REM / překryv / délka / hustota / lift |')
      ..writeln('|---|---|---|---|---|---|---|---|---|---|---|---|');
    for (final (r, m) in rows) {
      sb.writeln('| ${r.label} | ${m.nights} | ${m.epochs} | ${_pc(m.remRate)} | ${_f(m.logLossLevel)} | '
          '${_f(m.brierLevel)} | ${_f(m.logLossProb)} | ${_f(m.brierProb)} | ${_f(m.eceProb, 3)} | '
          '${_f(m.logLossClim)} / ${_f(m.brierClim)} | ${_pc(m.highShareMean)} (${_pc(m.highShareMax)}) | '
          '${_pc(m.best.centerRate)} / ${_pc(m.best.hitRate)} / ${_pc(m.best.anyRate)} / '
          '${m.best.meanMinutes.toStringAsFixed(0)} min / '
          '${_pc(m.best.meanDensity)} / ${_f(m.best.meanLift, 2)} |');
    }
    sb
      ..writeln()
      ..writeln('| prediktor | hustota REM high / mid / low / unlikely | podíl noci high / mid / low / unlikely | '
          'podíl všeho REM high / mid / low / unlikely | klesá? |')
      ..writeln('|---|---|---|---|---|');
    for (final (r, m) in rows) {
      final ls = [RemLevel.high, RemLevel.mid, RemLevel.low, RemLevel.unlikely].map((l) => m.levels[l]!).toList();
      sb.writeln('| ${r.label} | ${ls.map((s) => _pc(s.density)).join(' / ')} | '
          '${ls.map((s) => _pc(s.shareOfNight)).join(' / ')} | ${ls.map((s) => _pc(s.shareOfRem)).join(' / ')} | '
          '${m.densityDecreasing ? 'ano' : 'ne'} |');
    }
    sb.writeln();
  }
  return sb.toString();
}

/// Kalibrační tabulka v decilech (vlastní pravděpodobnost, jinak podle úrovní).
String calibrationMarkdown(BacktestMetrics m, {bool own = true}) {
  final bins = own && m.calibrationProb != null ? m.calibrationProb! : m.calibrationLevel;
  final sb = StringBuffer()
    ..writeln('| koš p | epoch | průměr p | skutečně REM |')
    ..writeln('|---|---|---|---|');
  for (final b in bins) {
    if (b.count == 0) {
      continue;
    }
    sb.writeln('| ${b.lo.toStringAsFixed(1)}–${b.hi.toStringAsFixed(1)} | ${b.count} | ${_f(b.meanPredicted, 3)} | '
        '${_f(b.observed, 3)} |');
  }
  return sb.toString();
}

// ---------------------------------------------------------------------------
// Generátor pro bootstrap (Mulberry32, deterministický)
// ---------------------------------------------------------------------------

int _imul32(int a, int b) {
  final ah = (a >>> 16) & 0xFFFF, al = a & 0xFFFF;
  final bh = (b >>> 16) & 0xFFFF, bl = b & 0xFFFF;
  return ((al * bl) + ((((ah * bl) + (al * bh)) & 0xFFFF) << 16)) & 0xFFFFFFFF;
}

class _Rng {
  _Rng(int seed) : _s = seed & 0xFFFFFFFF;
  int _s;

  int nextUint32() {
    _s = (_s + 0x6D2B79F5) & 0xFFFFFFFF;
    var t = _s;
    t = _imul32(t ^ (t >>> 15), t | 1);
    t = (t ^ (t + _imul32(t ^ (t >>> 7), t | 61))) & 0xFFFFFFFF;
    return (t ^ (t >>> 14)) & 0xFFFFFFFF;
  }

  int nextInt(int max) => (nextUint32() / 4294967296.0 * max).floor();
}
