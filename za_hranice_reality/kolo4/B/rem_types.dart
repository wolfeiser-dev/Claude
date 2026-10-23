/// Typy pro model výskytu REM v2 (kolo 4, část B).
///
/// Soubor má dvě části:
/// * **A. Kopie typů appky** přesně podle zadání kola 4. Jsou tu jen proto,
///   aby `rem_model_v2.dart`, `rem_backtest.dart`, `rem_baseline.dart`
///   a `rem_synth.dart` šly přeložit samostatně. Při integraci část A smaž
///   a místo ní importuj originály z appky (`SleepNight` a spol.
///   a `rem_probability.dart`).
/// * **B. Nové typy** ([RemMark], [Predictor]). Ty v appce zůstanou, klidně
///   v tomhle souboru.
///
/// [RemProbabilityParams] v části A je jen náhrada se čtyřmi poli, která
/// používá [remLevel]; appka má vlastní třídu se stejnými jmény polí.
library;

// ===========================================================================
// A. Kopie typů appky (ze zadání, beze změny)
// ===========================================================================

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

enum RemLevel { unlikely, low, mid, high }

/// Náhrada třídy z `rem_probability.dart` (jen pole, která čte [remLevel]).
/// Výchozí hodnoty jsou stejné jako v [RemModelV2Params] (`rem_model_v2.dart`).
class RemProbabilityParams {
  const RemProbabilityParams({
    this.levelLow = 0.30,
    this.levelMid = 0.55,
    this.levelHigh = 0.80,
    this.maxHighShare = 0.15,
  });

  static const defaults = RemProbabilityParams();

  final double levelLow;
  final double levelMid;
  final double levelHigh;
  final double maxHighShare;
}

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

// ===========================================================================
// B. Nové typy (v appce zůstávají)
// ===========================================================================

/// Ruční značka ze snu, jak ji appka naplní z `Dream`.
///
/// * [nightDate]: datum večera (jako `SleepNight.nightDate`).
/// * [at]: přibližný čas snu (`Dream.dreamAt`), `null` = nevím.
/// * [woke]: probudil se ze snu (`Dream.wokeFromDream`).
/// * [emptyNight]: „nic si nepamatuju“ (`RecallLevel.none`). Když je [at]
///   `null`, model ji vztáhne k rannímu probuzení (konec noci).
class RemMark {
  const RemMark({required this.nightDate, this.at, this.woke = false, this.emptyNight = false});

  final DateTime nightDate;
  final DateTime? at;
  final bool woke;
  final bool emptyNight;
}

/// Předpověď pro jednu noc z minulých dat (walk-forward v `rem_backtest.dart`).
///
/// [pastNights] obsahuje jen noci s `nightDate` před [tonight], [marks] jen
/// značky z těchto nocí. [onset] je usnutí dané noci, [tonight] její datum večera.
typedef Predictor = List<RemWindow> Function(
  List<SleepNight> pastNights,
  List<RemMark> marks,
  DateTime onset,
  DateTime tonight,
);
