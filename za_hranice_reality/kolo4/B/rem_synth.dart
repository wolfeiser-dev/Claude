/// Generátor syntetických nocí pro backtest modelu REM v2 (kolo 4, část B).
///
/// Čistý Dart 3.6, jen `dart:math`, vlastní generátor Mulberry32 s pevným
/// seedem (stejná data na každém počítači).
///
/// Pravda se generuje **jinak, než model počítá** (aby test nebyl kruhový):
/// * začátky REM tvoří mřížku s chvěním (Schulz 1980): s_k = L + (k − 1)·C + η_k,
///   η_k = 0,5·η_{k−1} + šum, takže interval mezi REM má SD asi 12 min,
///   cyklus kolem 95 min (model počítá s obnovovacím procesem a 68 + REM min);
/// * první REM po 75–110 min (osobní průměr 82–100, mezi nocemi SD 10),
///   8 % nocí s vynechaným prvním REM, 5 % „alkoholových“ nocí s pozdním REM;
/// * REM bloky k ránu delší (12, 19, 24, 28, 31, 33 min, rozptyl gama),
///   hluboký spánek hlavně v prvních dvou cyklech (první třetina noci),
///   krátká probuzení (často hned po REM) a občas dlouhé bdění;
/// * zařízení: chyby lokální a korelované. Společné přehlédnutí celé REM
///   periody (hlavně první), vlastní přehlédnutí, posun začátku a konce
///   (Oura začíná REM o pár minut dřív, Garmin o 7 min později), výpadky
///   uvnitř REM po 3min blocích, falešné REM bloky v lehkém spánku (společné
///   i vlastní), Garmin často označí krátké bdění jako REM. Oura je
///   agregovaná na 5 min, Garmin po minutách. Realizovaná přesnost po minutách
///   vychází zhruba: Oura citlivost 0,76 a falešné poplachy 0,08, Garmin
///   citlivost 0,47 a falešné poplachy 0,14 (viz [SynthData.deviceStats]);
/// * ruční značky: hlavně ranní probuzení a poslední 3 h, z REM se sen
///   pamatuje častěji (0,65) než z NREM (0,25), čas ±15 min (SD), 15–20 %
///   bez času, prázdné noci „nic si nepamatuju“.
library;

import 'dart:math' as math;

import 'rem_types.dart';

/// Nastavení generátoru. Výchozí hodnoty odpovídají zadání kola 4.
class SynthConfig {
  const SynthConfig({
    this.nights = 120,
    this.seed = 1,
    this.startYear = 2026,
    this.startMonth = 1,
    this.startDay = 5,
    this.localTime = false,
    this.ouraProbability = 0.95,
    this.garminProbability = 0.85,
    this.latencyMean,
    this.latencyNightSd = 10,
    this.cycleMean = 95,
    this.cycleSd = 12,
    this.cycleNightSd = 5,
    this.skipFirstRem = 0.08,
    this.alcoholNights = 0.05,
    this.remScale = 1.0,
    this.marks = true,
    this.markTimeSd = 15,
    this.ouraSharedMissFirst = 0.15,
    this.ouraMissFirst = 0.10,
    this.garminMissFirst = 0.30,
  });

  final int nights;
  final int seed;
  final int startYear, startMonth, startDay;

  /// `true`: časy v místním pásmu (DateTime bez UTC), jinak UTC.
  final bool localTime;

  /// Pravděpodobnost, že noc má data z Oury / Garminu.
  final double ouraProbability, garminProbability;

  /// Osobní průměr latence prvního REM (min); `null` = losuje se 82–100.
  final double? latencyMean;
  final double latencyNightSd;

  /// Cyklus (interval mezi začátky REM): průměr, SD uvnitř noci, SD průměru mezi nocemi.
  final double cycleMean, cycleSd, cycleNightSd;
  final double skipFirstRem, alcoholNights, remScale;
  final bool marks;
  final double markTimeSd;

  /// Přehlédnutí první REM periody: společné oběma / jen Oura / jen Garmin.
  final double ouraSharedMissFirst, ouraMissFirst, garminMissFirst;
}

/// Jedna syntetická noc se skrytou pravdou po minutách od ulehnutí.
class SynthNight {
  SynthNight({
    required this.nightDate,
    required this.bedtime,
    required this.onset,
    required this.wake,
    required this.truth,
    required this.oura,
    required this.garmin,
  });

  final DateTime nightDate;
  final DateTime bedtime, onset, wake;

  /// Stav po minutách od ulehnutí: 0 bdění, 1 lehký, 2 hluboký, 3 REM.
  final List<int> truth;

  /// Štítky zařízení po minutách (Oura už po 5min blocích), `null` = zařízení chybí.
  final List<int>? oura, garmin;
}

/// Výsledek generátoru.
class SynthData {
  SynthData(this.nights, this.marks, this.truth, this.raw);

  /// Záznamy jako v appce (Oura, Garmin, případně ruční noc bez úseků).
  final List<SleepNight> nights;
  final List<RemMark> marks;

  /// Skutečný hypnogram po datech večera (klíč = `nightDate`).
  final Map<DateTime, List<SleepSegment>> truth;
  final List<SynthNight> raw;

  /// Realizovaná citlivost a falešně pozitivní míra REM po minutách spánkové
  /// periody (od usnutí do probuzení) a binární korelace chyb (phi).
  ({double ouraSens, double ouraFpr, double garminSens, double garminFpr, double errorCorrelation}) deviceStats() {
    var oR = 0, oRR = 0, oN = 0, oNR = 0, gR = 0, gRR = 0, gN = 0, gNR = 0;
    var both = 0, e11 = 0, e10 = 0, e01 = 0;
    for (final n in raw) {
      final s = n.onset.difference(n.bedtime).inMinutes;
      final e = n.wake.difference(n.bedtime).inMinutes;
      for (var i = s; i < e && i < n.truth.length; i++) {
        final isR = n.truth[i] == 3;
        final o = n.oura?[i];
        final g = n.garmin?[i];
        if (o != null) {
          if (isR) {
            oR++;
            oRR += o == 3 ? 1 : 0;
          } else {
            oN++;
            oNR += o == 3 ? 1 : 0;
          }
        }
        if (g != null) {
          if (isR) {
            gR++;
            gRR += g == 3 ? 1 : 0;
          } else {
            gN++;
            gNR += g == 3 ? 1 : 0;
          }
        }
        if (o != null && g != null) {
          both++;
          final eo = (o == 3) != isR, eg = (g == 3) != isR;
          if (eo && eg) {
            e11++;
          } else if (eo) {
            e10++;
          } else if (eg) {
            e01++;
          }
        }
      }
    }
    final pA = (e11 + e10) / math.max(1, both), pB = (e11 + e01) / math.max(1, both);
    final cov = e11 / math.max(1, both) - pA * pB;
    final phi = cov / math.sqrt(math.max(1e-12, pA * (1 - pA) * pB * (1 - pB)));
    return (
      ouraSens: oRR / math.max(1, oR),
      ouraFpr: oNR / math.max(1, oN),
      garminSens: gRR / math.max(1, gR),
      garminFpr: gNR / math.max(1, gN),
      errorCorrelation: phi,
    );
  }
}

const int _w = 0, _l = 1, _d = 2, _r = 3;

/// Vygeneruje [SynthConfig.nights] nocí jedné osoby.
SynthData generateSynthData([SynthConfig c = const SynthConfig()]) {
  final rng = _Rng(c.seed);
  final latMean = c.latencyMean ?? 82 + 18 * rng.nextDouble();
  final cycMean = c.cycleMean + 3 * rng.nextNormal();
  var latDrift = 0.0;
  final out = <SleepNight>[];
  final marks = <RemMark>[];
  final truthMap = <DateTime, List<SleepSegment>>{};
  final raw = <SynthNight>[];
  for (var n = 0; n < c.nights; n++) {
    final date = c.localTime
        ? DateTime(c.startYear, c.startMonth, c.startDay + n)
        : DateTime.utc(c.startYear, c.startMonth, c.startDay + n);
    final weekend = date.weekday == DateTime.friday || date.weekday == DateTime.saturday;
    latDrift = 0.97 * latDrift + 0.8 * rng.nextNormal();

    // Ulehnutí, usínání, délka spánku (min).
    final bedOffset = (22 * 60 + 45 + 30 * rng.nextNormal() + (weekend ? 45 : 0)).round();
    final bedtime = (c.localTime ? DateTime(date.year, date.month, date.day) : date).add(Duration(minutes: bedOffset));
    final sol = (12 * math.exp(0.6 * rng.nextNormal())).clamp(3, 60).round();
    final sleepLen = (450 + 40 * rng.nextNormal() + (weekend ? 40 : 0)).clamp(300, 620).round();
    final tail = 2 + rng.nextInt(9);
    final len = sol + sleepLen + tail;
    final z = List<int>.filled(len, _l);
    for (var i = 0; i < sol; i++) {
      z[i] = _w;
    }
    for (var i = sol + sleepLen; i < len; i++) {
      z[i] = _w;
    }
    final sleepEnd = sol + sleepLen;

    // Začátky a délky REM (minuty od usnutí).
    final alcohol = rng.nextDouble() < c.alcoholNights;
    final cn = cycMean + c.cycleNightSd * rng.nextNormal();
    var lat = latMean + latDrift + c.latencyNightSd * rng.nextNormal() + (alcohol ? 35 : 0);
    lat = lat.clamp(55, 170).toDouble();
    final skip = rng.nextDouble() < c.skipFirstRem;
    final xiSd = c.cycleSd / math.sqrt(4 / 3);
    const remMeans = [12.0, 19.0, 24.0, 28.0, 31.0, 33.0, 34.0];
    final rems = <List<int>>[]; // [start, end) v minutách od ulehnutí
    var eta = 0.0;
    var prevEnd = 0.0;
    for (var k = 1; k <= 12; k++) {
      if (k > 1) {
        eta = 0.5 * eta + xiSd * rng.nextNormal();
      }
      var s = lat + (k - 1) * cn + (k > 1 ? eta : 0);
      if (k > 1) {
        s = math.max(s, prevEnd + 20);
      }
      final mean = remMeans[math.min(k - 1, remMeans.length - 1)] * c.remScale * (alcohol && k == 1 ? 0.5 : 1);
      final dur = math.max(3.0, mean * rng.nextGamma(4) / 4);
      prevEnd = s + dur;
      if (k == 1 && skip) {
        continue;
      }
      final a = sol + s.round(), b = math.min(sleepEnd, sol + (s + dur).round());
      if (a >= sleepEnd) {
        break;
      }
      if (b > a) {
        rems.add([a, b]);
      }
    }
    // NREM periody: hluboký spánek hlavně v prvních cyklech.
    const deepShare = [0.42, 0.28, 0.12, 0.04, 0.02];
    var nStart = sol;
    for (var k = 0; k <= rems.length; k++) {
      final nEnd = k < rems.length ? rems[k][0] : sleepEnd;
      final nl = nEnd - nStart;
      if (nl > 10) {
        final share = deepShare[math.min(k, deepShare.length - 1)] * (0.7 + 0.6 * rng.nextDouble());
        final ds = nStart + (0.2 * nl).round();
        final de = math.min(nEnd, ds + (share * nl).round());
        for (var i = ds; i < de; i++) {
          z[i] = _d;
        }
      }
      if (k < rems.length) {
        for (var i = rems[k][0]; i < rems[k][1]; i++) {
          z[i] = _r;
        }
        nStart = rems[k][1];
      }
    }
    // Krátká probuzení: po REM (35 %) a náhodně v NREM (0,5 za hodinu).
    for (final r in rems) {
      if (rng.nextDouble() < 0.35 && r[1] < sleepEnd - 3) {
        final wl = 1 + rng.nextInt(3);
        for (var i = r[1]; i < r[1] + wl; i++) {
          z[i] = _w;
        }
      }
    }
    final brief = rng.nextPoisson(0.5 * sleepLen / 60);
    for (var q = 0; q < brief; q++) {
      final at = sol + 20 + rng.nextInt(math.max(1, sleepLen - 40));
      if (z[at] == _l) {
        final wl = 1 + rng.nextInt(3);
        for (var i = at; i < math.min(sleepEnd, at + wl); i++) {
          z[i] = _w;
        }
      }
    }
    // Občas dlouhé bdění po REM ve druhé polovině noci.
    if (rng.nextDouble() < 0.12 && rems.length >= 3) {
      final r = rems[rems.length ~/ 2 + rng.nextInt(rems.length - rems.length ~/ 2)];
      final wl = 8 + rng.nextInt(18);
      for (var i = r[1]; i < math.min(sleepEnd, r[1] + wl); i++) {
        z[i] = _w;
      }
    }

    // Zařízení.
    final hasO = rng.nextDouble() < c.ouraProbability;
    final hasG = rng.nextDouble() < c.garminProbability;
    final dev = _devices(z, rems, sol, sleepEnd, rng, c);
    final o = hasO ? _aggregate5(dev.$1) : null;
    final g = hasG ? dev.$2 : null;

    final onset = bedtime.add(Duration(minutes: sol));
    final wake = bedtime.add(Duration(minutes: sleepEnd));
    raw.add(SynthNight(nightDate: date, bedtime: bedtime, onset: onset, wake: wake, truth: z, oura: o, garmin: g));
    truthMap[date] = _segments(z, bedtime);
    if (o != null) {
      out.add(_night(date, SleepSource.oura, o, bedtime, rng));
    }
    if (g != null) {
      out.add(_night(date, SleepSource.garmin, g, bedtime, rng));
    }
    if (o == null && g == null) {
      out.add(SleepNight(
        nightDate: date,
        source: SleepSource.manual,
        fetchedAt: wake.add(const Duration(hours: 1)),
        onset: onset.add(Duration(minutes: (15 * rng.nextNormal()).round())),
        wake: wake.add(Duration(minutes: (10 * rng.nextNormal()).round())),
      ));
    }
    if (c.marks) {
      marks.addAll(_marks(date, z, rems, sol, sleepEnd, bedtime, rng, c));
    }
  }
  return SynthData(out, marks, truthMap, raw);
}

/// Štítky Oury a Garminu po minutách z pravdy [z].
(List<int>, List<int>) _devices(List<int> z, List<List<int>> rems, int sol, int sleepEnd, _Rng rng, SynthConfig c) {
  final o = [...z];
  final g = [...z];
  bool sleepNonRem(int i) => i >= sol && i < sleepEnd && (z[i] == _l || z[i] == _d);
  // Sloučené REM periody (mezera < 15 min) a jejich pořadí.
  final periods = <List<int>>[];
  for (final r in rems) {
    if (periods.isNotEmpty && r[0] - periods.last[1] < 15) {
      periods.last[1] = r[1];
    } else {
      periods.add([r[0], r[1]]);
    }
  }
  for (var k = 0; k < periods.length; k++) {
    final a = periods[k][0], b = periods[k][1];
    final first = k == 0;
    var missO = false, missG = false;
    if (rng.nextDouble() < (first ? c.ouraSharedMissFirst : 0.04)) {
      missO = true;
      missG = true;
    } else {
      missO = rng.nextDouble() < (first ? c.ouraMissFirst : 0.03);
      missG = rng.nextDouble() < (first ? c.garminMissFirst : 0.10);
    }
    void relabel(
        List<int> lab, bool miss, double startMean, double startSd, double endMean, double endSd, double drop) {
      if (miss) {
        for (var i = a; i < b; i++) {
          if (lab[i] == _r) {
            lab[i] = _l;
          }
        }
        return;
      }
      final sh = (startMean + startSd * rng.nextNormal()).round();
      if (sh < 0) {
        for (var i = math.max(sol, a + sh); i < a; i++) {
          if (lab[i] != _w) {
            lab[i] = _r;
          }
        }
      } else {
        for (var i = a; i < math.min(b, a + sh); i++) {
          if (lab[i] == _r) {
            lab[i] = _l;
          }
        }
      }
      final eh = (endMean + endSd * rng.nextNormal()).round();
      if (eh > 0) {
        for (var i = b; i < math.min(sleepEnd, b + eh); i++) {
          if (lab[i] != _w) {
            lab[i] = _r;
          }
        }
      } else {
        for (var i = math.max(a, b + eh); i < b; i++) {
          if (lab[i] == _r) {
            lab[i] = _l;
          }
        }
      }
      for (var i = a; i < b; i += 3) {
        if (rng.nextDouble() < drop) {
          for (var u = i; u < math.min(b, i + 3); u++) {
            if (lab[u] == _r) {
              lab[u] = _l;
            }
          }
        }
      }
    }

    relabel(o, missO, -3, 4, 0, 4, 0.03);
    relabel(g, missG, 5, 6, -2, 5, 0.08);
  }
  // Falešné REM bloky v lehkém spánku (aspoň 45 min po usnutí, 10 min od REM).
  bool nearRem(int i) {
    for (final p in periods) {
      if (i > p[0] - 10 && i < p[1] + 10) {
        return true;
      }
    }
    return false;
  }

  final hours = (sleepEnd - sol) / 60;
  void fake(List<List<int>> labs, double perHour, int minLen, int maxLen) {
    final count = rng.nextPoisson(perHour * hours);
    for (var q = 0; q < count; q++) {
      final at = sol + 45 + rng.nextInt(math.max(1, sleepEnd - sol - 60));
      if (!sleepNonRem(at) || nearRem(at)) {
        continue;
      }
      final fl = minLen + rng.nextInt(maxLen - minLen + 1);
      for (var i = at; i < math.min(sleepEnd, at + fl); i++) {
        if (z[i] == _l) {
          for (final lab in labs) {
            lab[i] = _r;
          }
        }
      }
    }
  }

  fake([o, g], 0.20, 8, 18);
  fake([o], 0.10, 5, 12);
  fake([g], 0.95, 6, 15);
  // Krátké bdění ve spánku: Oura často „lehký“, Garmin i „REM“.
  for (var i = sol; i < sleepEnd; i++) {
    if (z[i] != _w || (i > sol && z[i - 1] == _w)) {
      continue;
    }
    var j = i;
    while (j < sleepEnd && z[j] == _w) {
      j++;
    }
    if (j - i <= 5) {
      final uo = rng.nextDouble(), ug = rng.nextDouble();
      for (var u = i; u < j; u++) {
        if (uo < 0.5) {
          o[u] = _l;
        }
        if (ug < 0.45) {
          g[u] = _r;
        } else if (ug < 0.75) {
          g[u] = _l;
        }
      }
    }
  }
  // Hluboký vs lehký po 3min blocích (na REM nemá vliv, jen realističtější hypnogram).
  for (var i = sol; i < sleepEnd; i += 3) {
    final uo = rng.nextDouble(), ug = rng.nextDouble();
    for (var u = i; u < math.min(sleepEnd, i + 3); u++) {
      if (o[u] == _d && uo < 0.25) {
        o[u] = _l;
      } else if (o[u] == _l && uo > 0.95) {
        o[u] = _d;
      }
      if (g[u] == _d && ug < 0.35) {
        g[u] = _l;
      } else if (g[u] == _l && ug > 0.92) {
        g[u] = _d;
      }
    }
  }
  // Konec usínání zařízení občas počítají jako spánek.
  if (rng.nextDouble() < 0.5) {
    final k = 3 + rng.nextInt(6);
    for (var i = math.max(0, sol - k); i < sol; i++) {
      o[i] = _l;
    }
  }
  return (o, g);
}

/// Oura: 5min bloky od ulehnutí, štítek = nejčastější v bloku (při shodě prostřední minuta).
List<int> _aggregate5(List<int> lab) {
  final out = [...lab];
  for (var b = 0; b < lab.length; b += 5) {
    final e = math.min(lab.length, b + 5);
    final cnt = List<int>.filled(4, 0);
    for (var i = b; i < e; i++) {
      cnt[lab[i]]++;
    }
    var best = lab[(b + e - 1) ~/ 2];
    for (var s = 0; s < 4; s++) {
      if (cnt[s] > cnt[best]) {
        best = s;
      }
    }
    for (var i = b; i < e; i++) {
      out[i] = best;
    }
  }
  return out;
}

const _stageOf = [SleepStage.awake, SleepStage.light, SleepStage.deep, SleepStage.rem];

List<SleepSegment> _segments(List<int> lab, DateTime start) {
  final out = <SleepSegment>[];
  var i = 0;
  while (i < lab.length) {
    var j = i;
    while (j < lab.length && lab[j] == lab[i]) {
      j++;
    }
    out.add(SleepSegment(
      start: start.add(Duration(minutes: i)),
      end: start.add(Duration(minutes: j)),
      stage: _stageOf[lab[i]],
    ));
    i = j;
  }
  return out;
}

SleepNight _night(DateTime date, SleepSource src, List<int> lab, DateTime bedtime, _Rng rng) {
  // Usnutí podle zařízení: první minuta, po které je ≥ 8 z 10 min spánek.
  var on = 0;
  for (var i = 0; i < lab.length; i++) {
    if (lab[i] == _w) {
      continue;
    }
    var s = 0;
    for (var u = i; u < math.min(lab.length, i + 10); u++) {
      s += lab[u] == _w ? 0 : 1;
    }
    if (s >= 8) {
      on = i;
      break;
    }
  }
  var last = lab.length;
  while (last > 0 && lab[last - 1] == _w) {
    last--;
  }
  final cnt = List<int>.filled(4, 0);
  for (var i = on; i < last; i++) {
    cnt[lab[i]]++;
  }
  final wake = bedtime.add(Duration(minutes: last));
  return SleepNight(
    nightDate: date,
    source: src,
    fetchedAt: wake.add(const Duration(hours: 1)),
    onset: bedtime.add(Duration(minutes: on)),
    wake: wake,
    totalSleepMinutes: cnt[_l] + cnt[_d] + cnt[_r],
    remMinutes: cnt[_r],
    deepMinutes: cnt[_d],
    lightMinutes: cnt[_l],
    awakeMinutes: cnt[_w],
    latencyMinutes: on,
    sleepScore: 60 + rng.nextInt(31),
    segments: _segments(lab, bedtime),
  );
}

List<RemMark> _marks(
  DateTime date,
  List<int> z,
  List<List<int>> rems,
  int sol,
  int sleepEnd,
  DateTime bedtime,
  _Rng rng,
  SynthConfig c,
) {
  final out = <RemMark>[];
  bool remBefore(int i) {
    for (var u = math.max(0, i - 5); u < i; u++) {
      if (z[u] == _r) {
        return true;
      }
    }
    return i < z.length && z[i] == _r;
  }

  DateTime? timeAt(double minute, double sd) {
    if (rng.nextDouble() < 0.15) {
      return null;
    }
    return bedtime.add(Duration(minutes: (minute + sd * rng.nextNormal()).round()));
  }

  // Ranní probuzení.
  final fromRem = remBefore(sleepEnd);
  if (rng.nextDouble() < (fromRem ? 0.65 : 0.25)) {
    out.add(RemMark(nightDate: date, at: timeAt(sleepEnd.toDouble(), 5), woke: true));
  }
  // Probuzení v noci (≥ 2 min bdění), vzpomínka slábne s časem do rána.
  var i = sol + 1;
  while (i < sleepEnd - 5) {
    if (z[i] == _w && z[i - 1] != _w) {
      var j = i;
      while (j < sleepEnd && z[j] == _w) {
        j++;
      }
      if (j - i >= 2) {
        final decay = math.exp(-(sleepEnd - i) / 60 / 4);
        final pr = (remBefore(i) ? 0.65 : 0.25) * decay * (j - i >= 5 ? 1.0 : 0.5);
        if (rng.nextDouble() < pr) {
          out.add(RemMark(nightDate: date, at: timeAt(i.toDouble(), c.markTimeSd), woke: true));
        }
      }
      i = j;
    } else {
      i++;
    }
  }
  // Sny bez probuzení z posledních 3 h (vybavení zkreslené k ránu).
  for (final r in rems) {
    if (r[0] < sleepEnd - 180 || r[1] >= sleepEnd - 2) {
      continue;
    }
    if (rng.nextDouble() < 0.15) {
      final m = r[0] + rng.nextDouble() * (r[1] - r[0]);
      out.add(RemMark(nightDate: date, at: timeAt(m, c.markTimeSd), woke: false));
    }
  }
  if (out.isEmpty && rng.nextDouble() < 0.35) {
    out.add(RemMark(
      nightDate: date,
      at: rng.nextDouble() < 0.3 ? bedtime.add(Duration(minutes: sleepEnd)) : null,
      emptyNight: true,
    ));
  }
  return out;
}

// ---------------------------------------------------------------------------
// Generátor náhodných čísel (Mulberry32, stejný jako v nof1.dart)
// ---------------------------------------------------------------------------

int _imul32(int a, int b) {
  final ah = (a >>> 16) & 0xFFFF, al = a & 0xFFFF;
  final bh = (b >>> 16) & 0xFFFF, bl = b & 0xFFFF;
  return ((al * bl) + ((((ah * bl) + (al * bh)) & 0xFFFF) << 16)) & 0xFFFFFFFF;
}

class _Rng {
  _Rng(int seed) : _s = seed & 0xFFFFFFFF;

  int _s;
  double? _spare;

  int nextUint32() {
    _s = (_s + 0x6D2B79F5) & 0xFFFFFFFF;
    var t = _s;
    t = _imul32(t ^ (t >>> 15), t | 1);
    t = (t ^ (t + _imul32(t ^ (t >>> 7), t | 61))) & 0xFFFFFFFF;
    return (t ^ (t >>> 14)) & 0xFFFFFFFF;
  }

  double nextDouble() => nextUint32() / 4294967296.0;

  int nextInt(int max) => (nextDouble() * max).floor();

  double nextNormal() {
    final s = _spare;
    if (s != null) {
      _spare = null;
      return s;
    }
    final u1 = 1 - nextDouble();
    final u2 = nextDouble();
    final r = math.sqrt(-2 * math.log(u1));
    _spare = r * math.sin(2 * math.pi * u2);
    return r * math.cos(2 * math.pi * u2);
  }

  double nextGamma(double shape) {
    final d = shape - 1 / 3;
    final c = 1 / math.sqrt(9 * d);
    while (true) {
      double x, v;
      do {
        x = nextNormal();
        v = 1 + c * x;
      } while (v <= 0);
      v = v * v * v;
      final u = 1 - nextDouble();
      if (u < 1 - 0.0331 * x * x * x * x || math.log(u) < 0.5 * x * x + d * (1 - v + math.log(v))) {
        return d * v;
      }
    }
  }

  int nextPoisson(double lambda) {
    final l = math.exp(-lambda);
    var k = 0;
    var p = 1.0;
    do {
      k++;
      p *= nextDouble();
    } while (p > l);
    return k - 1;
  }
}
