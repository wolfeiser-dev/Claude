/// Jednoduchý průměr hypnogramů: napodobenina dnešního `remWindows` pro srovnání.
///
/// Podle popisu ze zadání kola 4: vážený průměr hypnogramů za posledních
/// 60 nocí (poločas 30 dní), doplněný populační šablonou a ručními značkami
/// „probudil jsem se ze snu“. Skutečný dnešní model se v detailech může
/// lišit (prahy, váhy značek); v backtestu na skutečných datech ho nahraď
/// skutečnou funkcí appky.
///
/// Výpočet po 5 min od usnutí:
/// * noc n: podíl REM v epoše, průměr přes zařízení, která epochu pokrývají
///   (Oura i Garmin se počítají stejně, ruční záznamy ne);
/// * hodnota = (w_pop · šablona + Σ w_n · podíl_n + značky) / (w_pop + Σ w_n + váhy značek),
///   w_n = 0,5^(stáří ve dnech / 30), šablona π(τ) z `presnost_nositelne_elektroniky.md` 3.2;
/// * značka se snem přidá „pseudonoc s REM“ s Gaussovým jádrem σ = 15 min
///   (s probuzením váha 1, bez probuzení 0,5);
/// * úrovně a okna stejnými pravidly jako v2 (`remLevelRuns`).
library;

import 'dart:math' as math;

import 'rem_model_v2.dart';
import 'rem_types.dart';

class RemBaselineParams {
  const RemBaselineParams({
    this.lookbackNights = 60,
    this.halfLifeDays = 30,
    this.populationWeight = 3,
    this.markWeightWoke = 1.0,
    this.markWeightDream = 0.5,
    this.markSigmaMinutes = 15,
    this.levelLow = 0.30,
    this.levelMid = 0.55,
    this.levelHigh = 0.80,
    this.maxHighShare = 0.15,
    this.minWindowMinutes = 10,
    this.defaultNightMinutes = 480,
    this.maxNightMinutes = 780,
    this.untilWake = true,
  });

  static const defaults = RemBaselineParams();

  final int lookbackNights;
  final double halfLifeDays;

  /// Váha populační šablony v počtu nocí.
  final double populationWeight;
  final double markWeightWoke, markWeightDream, markSigmaMinutes;
  final double levelLow, levelMid, levelHigh, maxHighShare;
  final int minWindowMinutes, defaultNightMinutes, maxNightMinutes;

  /// `true`: noc, která v čase t už skončila, se počítá jako „bez REM“
  /// (průměr přes všechny noci). `false`: průměr jen přes noci, které v čase t trvají.
  final bool untilWake;
}

/// Populační šablona P(REM) podle hodin od usnutí (`presnost_nositelne_elektroniky.md` 3.2).
double remPopulationTemplate(double hours) {
  if (hours < 0.75) {
    return 0.02;
  }
  if (hours < 1) {
    return 0.05;
  }
  if (hours < 2) {
    return 0.15;
  }
  if (hours < 3) {
    return 0.18;
  }
  if (hours < 4) {
    return 0.22;
  }
  if (hours < 5) {
    return 0.26;
  }
  if (hours < 6) {
    return 0.30;
  }
  return 0.33;
}

/// REM okna podle průměru hypnogramů (stejné rozhraní jako `remWindowsV2`).
List<RemWindow> remWindowsBaseline(
  List<SleepNight> nights, {
  List<RemMark> marks = const [],
  required DateTime onset,
  required DateTime tonight,
  RemBaselineParams params = RemBaselineParams.defaults,
}) {
  final p = params;
  final tonightKey = remNightKey(tonight);
  final tonightDay = remDayNumber(tonightKey);
  final anchor = remRoundTo5(onset);
  final groups = remGroupNights(nights.where((n) => remNightKey(n.nightDate) < tonightKey));
  final keys = groups.keys.toList()..sort();
  final data = <RemNightData>[];
  for (var i = keys.length - 1; i >= 0 && data.length < p.lookbackNights; i--) {
    final d = remNightData(groups[keys[i]]!);
    if (d != null) {
      data.add(d);
    }
  }
  var horizon = (p.defaultNightMinutes / 5).round();
  if (data.isNotEmpty) {
    final lens = data.map((d) => d.epochs).toList()..sort();
    horizon = lens[((lens.length - 1) * 0.9).round()] + 6;
  }
  horizon = horizon.clamp(72, (p.maxNightMinutes / 5).floor());

  final numer = List<double>.generate(horizon, (t) => p.populationWeight * remPopulationTemplate((t * 5 + 2.5) / 60));
  final den = List<double>.filled(horizon, p.populationWeight);
  final cover = List<double>.filled(horizon, 0.0);
  var weightSum = 0.0;
  final weightOf = <int, double>{};
  for (final d in data) {
    final w = math.pow(0.5, (tonightDay - remDayNumber(d.key)) / p.halfLifeDays).toDouble();
    weightOf[d.key] = w;
    weightSum += w;
    final tMax = math.min(horizon, d.epochs);
    for (var t = 0; t < tMax; t++) {
      cover[t] += w;
    }
    if (p.untilWake) {
      for (var t = tMax; t < horizon; t++) {
        den[t] += w;
      }
    }
    for (var t = 0; t < tMax; t++) {
      final fo = d.oura?[t], fg = d.garmin?[t];
      if (fo == null && fg == null) {
        if (p.untilWake) {
          den[t] += w;
        }
        continue;
      }
      final r = fo != null && fg != null ? (fo[2] + fg[2]) / 2 : (fo ?? fg)![2];
      numer[t] += w * r;
      den[t] += w;
    }
  }
  // Ruční značky: pseudonoc s REM kolem času značky.
  final byKey = {for (final d in data) d.key: d};
  final countMarks = <({double offset, bool woke})>[];
  for (final m in marks) {
    final k = remNightKey(m.nightDate);
    final d = byKey[k];
    if (d == null || m.at == null || m.emptyNight) {
      continue;
    }
    var off = m.at!.difference(d.anchor).inMicroseconds / 6e7;
    if (off < -60) {
      off += 24 * 60;
    }
    if (off < -60 || off > d.epochs * 5 + 120) {
      continue;
    }
    countMarks.add((offset: off, woke: m.woke));
    final w = weightOf[k]! * (m.woke ? p.markWeightWoke : p.markWeightDream);
    for (var t = 0; t < horizon; t++) {
      final z = (t * 5 + 2.5 - off) / p.markSigmaMinutes;
      final kk = math.exp(-0.5 * z * z);
      if (kk < 1e-4) {
        continue;
      }
      numer[t] += w * kk;
      den[t] += w * kk;
    }
  }
  final values = [for (var t = 0; t < horizon; t++) numer[t] / den[t]];
  final rules = RemLevelRules(
    levelLow: p.levelLow,
    levelMid: p.levelMid,
    levelHigh: p.levelHigh,
    maxHighShare: p.maxHighShare,
    minWindowMinutes: p.minWindowMinutes,
  );
  final recent = data.where((d) => tonightDay - remDayNumber(d.key) <= 30).toList();
  final out = <RemWindow>[];
  var expected = 0.0;
  for (var t = 0; t < horizon; t++) {
    expected += p.untilWake && weightSum > 0 ? cover[t] / weightSum : 1.0;
  }
  for (final run in remLevelRuns(values, rules, shareBase: p.untilWake ? expected : null)) {
    var both = 0, oOnly = 0, gOnly = 0;
    for (final d in recent) {
      var o = false, g = false;
      for (var i = run.from; i < math.min(run.to, d.epochs); i++) {
        o = o || d.ouraRem[i];
        g = g || d.garminRem[i];
      }
      if (o && g) {
        both++;
      } else if (o) {
        oOnly++;
      } else if (g) {
        gOnly++;
      }
    }
    var dream = 0, woke = 0;
    for (final m in countMarks) {
      if (m.offset >= run.from * 5 && m.offset < run.to * 5) {
        if (m.woke) {
          woke++;
        } else {
          dream++;
        }
      }
    }
    out.add(RemWindow(
      from: anchor.add(Duration(minutes: run.from * 5)),
      to: anchor.add(Duration(minutes: run.to * 5)),
      fromOffset: run.from * 5,
      toOffset: run.to * 5,
      level: run.level,
      peak: run.peak,
      recentNights: recent.length,
      bothNights: both,
      ouraOnlyNights: oOnly,
      garminOnlyNights: gOnly,
      dreamMarks: dream,
      wokeMarks: woke,
    ));
  }
  return out;
}
