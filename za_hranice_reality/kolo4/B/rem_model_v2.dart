/// Model výskytu REM v2: bayesovský odhad podle `algoritmus_rem_cyklu.md`.
///
/// Čistý Dart 3.6, jen `dart:math`. Bez I/O, bez náhody, deterministický.
///
/// Jak to počítá (podrobnosti v `doporuceni_parametru.md`):
/// 1. **Každá minulá noc zvlášť: skrytý semi-Markovův model (HSMM)** cyklů
///    N1 → R1 → (W1) → N2 → R2 … na 5min mřížce od usnutí (kap. 3.2–3.4).
///    Emise spojují Ouru a Garmin přes matice záměn (citlivost, falešné
///    poplachy) s korelací chyb ρ se zachovanými marginálami (kap. 3.3),
///    zmírněné γ kvůli autokorelaci, s prioritou délek zmírněnou β (dvojí
///    započtení času v noci) a s pojistkou „zařízení celou REM periodu
///    přehlédlo“. Ruční značky vstupují jako slabé svědectví s časovým
///    jádrem (věrohodnostní poměr 2, sen bez probuzení 1,5, „nic si
///    nepamatuju“ 0,4; logaritmický pool z kap. 4.2). Výsledek je
///    posterior P(REM v epoše | data noci).
/// 2. **Osobní prior** (kap. 3.5): Kalmanův filtr místní úrovně pro latenci
///    prvního REM, délku NREM periody a délku REM period, z posteriorů nocí.
/// 3. **Předpověď na dnešní noc** (data z téže noci appka nemá): osobní
///    prior predictive z HSMM (β = 1) jako apriorní křivka se silou
///    [RemModelV2Params.priorNights] nocí, k ní vážený (poločas) součet
///    posteriorů minulých nocí. Po 5 min tak vzniká Beta posterior
///    dlouhodobé četnosti REM: střed je [RemCurveV2.pRem], 80% interval
///    [RemCurveV2.pRemLow]–[RemCurveV2.pRemHigh]. Stejně složená
///    [RemCurveV2.pDevice] předpovídá štítek zařízení (to jde ověřit na
///    skutečných datech) a [RemCurveV2.pAsleep] šanci, že v tu dobu ještě spíš.
/// 4. **Úrovně a okna** stejně jako dnešní `remWindows`: relativně k vrcholu
///    noci, `high` nejvýš 15 % očekávané délky spánku, okna aspoň 10 min.
///    Úrovně podle P(REM | v tu dobu spíš); `peak` (řazení oken, nejlepší
///    okno) podle P(REM) · P(ještě spíš), aby nejlepší okno nepadlo na dobu,
///    kdy už obvykle nespíš.
///
/// Výstup je `List<RemWindow>` (prvky jsou [RemWindowV2] s pravděpodobností
/// navíc), takže jde přímo vyměnit za dnešní `remWindows`.
///
/// Cena: posterior jedné noci asi 2 ms (Dart VM), volání bez [RemV2Cache]
/// zpracuje asi 120 nocí (0,3 s), s cache 10 ms. Na telefonu počítej 2–4×
/// víc a pouštěj to v `Isolate.run`.
library;

import 'dart:math' as math;

import 'rem_types.dart';

// ===========================================================================
// Parametry
// ===========================================================================

/// Parametry modelu v2. Výchozí hodnoty a jejich zdroje: `doporuceni_parametru.md`.
class RemModelV2Params {
  const RemModelV2Params({
    this.levelLow = 0.30,
    this.levelMid = 0.55,
    this.levelHigh = 0.80,
    this.maxHighShare = 0.15,
    this.minWindowMinutes = 10,
    this.ouraSensitivity = 0.70,
    this.ouraFalsePositive = 0.10,
    this.garminSensitivity = 0.50,
    this.garminFalsePositive = 0.15,
    this.ouraWakeRow = const [0.60, 0.30, 0.10],
    this.garminWakeRow = const [0.50, 0.35, 0.15],
    this.ouraRemAsWake = 0.03,
    this.garminRemAsWake = 0.04,
    this.nremAsWake = 0.05,
    this.rho = 0.4,
    this.gamma = 0.5,
    this.beta = 0.5,
    this.ouraMissFirst = 0.25,
    this.ouraMissLater = 0.10,
    this.garminMissFirst = 0.50,
    this.garminMissLater = 0.25,
    this.remInRemPeriod = 0.85,
    this.wakeInRemPeriod = 0.05,
    this.remInNremPeriod = 0.02,
    this.wakeInNremPeriod = 0.04,
    this.wakeInWakePeriod = 0.90,
    this.latencyMedian = 80,
    this.skipShare = 0.10,
    this.skipPriorStrength = 20,
    this.nremMedian = 68,
    this.nremLogSd = 0.25,
    this.nremWithinNightLogSd = 0.22,
    this.nremAfterWakeMedian = 35,
    this.nremAfterWakeLogSd = 0.6,
    this.remMedians = const [10, 17, 22, 26, 28],
    this.remLogSd = 0.5,
    this.wakeMedian = 10,
    this.wakeLogSd = 0.8,
    this.maxCycles = 9,
    this.latencyTau = 0.15,
    this.latencySigmaW = 0.25,
    this.nremTau = 0.065,
    this.nremSigmaW = 0.10,
    this.remScaleTau = 0.20,
    this.remScaleSigmaW = 0.25,
    this.driftPerDay = 0.0005,
    this.learnNights = 120,
    this.markWokeLr = 2.0,
    this.markDreamLr = 1.5,
    this.markEmptyLr = 0.4,
    this.markSigmaMinutes = 15,
    this.markDreamSigmaMinutes = 30,
    this.emptyNightSigmaMinutes = 10,
    this.markLrCap = 10,
    this.lookbackDays = 90,
    this.halfLifeDays = 30,
    this.priorNights = 8,
    this.countDays = 30,
    this.intervalMass = 0.8,
    this.minNightMinutes = 180,
    this.maxNightMinutes = 780,
    this.defaultNightMinutes = 480,
    this.nightLengthMedian = 450,
    this.nightLengthSd = 60,
    this.nightPriorNights = 3,
    this.asleepWeight = 0.0,
    this.peakAsleepWeight = 1.0,
  });

  static const defaults = RemModelV2Params();

  // --- Úrovně (stejná logika jako remLevel a RemProbabilityParams) ---

  /// Prahy relativně k vrcholu noci: low ≥ 0,30, mid ≥ 0,55, high ≥ 0,80.
  final double levelLow, levelMid, levelHigh;

  /// Úroveň `high` nejvýš na tomto podílu noci (práh se případně zvedne).
  final double maxHighShare;

  /// Nejkratší okno (min). Kratší úseky se sloučí se sousedem.
  final int minWindowMinutes;

  // --- Zařízení (presnost_nositelne_elektroniky.md 1.4 a 3.3) ---

  /// Citlivost a falešně pozitivní míra REM po 5 min.
  final double ouraSensitivity, ouraFalsePositive, garminSensitivity, garminFalsePositive;

  /// Řádek matice záměn pro skutečné bdění: P(štítek W, N, R | bdění).
  final List<double> ouraWakeRow, garminWakeRow;

  /// P(štítek bdění | REM) a P(štítek bdění | NREM).
  final double ouraRemAsWake, garminRemAsWake, nremAsWake;

  /// Korelace chyb Oura–Garmin, třítřídní vazba se zachovanými marginálami.
  /// 0,4 odpovídá binárnímu ρ′ = 0,3 (algoritmus_rem_cyklu.md 3.3).
  final double rho;

  /// Zmírnění emisí na 5min epochu (autokorelace chyb zařízení).
  final double gamma;

  /// Zmírnění prioru délek při zpětném výpočtu noci (zařízení už čas v noci znají).
  final double beta;

  /// Pojistka „zařízení přehlédlo celou REM periodu“: první REM / další.
  final double ouraMissFirst, ouraMissLater, garminMissFirst, garminMissLater;

  // --- Mikrostav uvnitř period (kap. 3.3) ---
  final double remInRemPeriod, wakeInRemPeriod, remInNremPeriod, wakeInNremPeriod, wakeInWakePeriod;

  // --- Populační prior cyklů (kap. 3.2, minuty, log-normální délky) ---

  /// Medián latence prvního REM od usnutí.
  final double latencyMedian;

  /// Podíl nocí s vynechaným prvním REM a síla jeho Beta prioru (počet nocí).
  final double skipShare, skipPriorStrength;

  /// NREM perioda k ≥ 2: medián a log-SD v modelu jedné noci; log-SD uvnitř
  /// noci pro předpověď (mezi nocemi se přidá [nremSigmaW]).
  final double nremMedian, nremLogSd, nremWithinNightLogSd;

  /// NREM perioda po dlouhém bdění (krátká latence REM, Barbato 2002).
  final double nremAfterWakeMedian, nremAfterWakeLogSd;

  /// Mediány REM period R1, R2, … (poslední platí i pro další) a jejich log-SD.
  final List<double> remMedians;
  final double remLogSd;

  /// Dlouhé bdění (≥ 5 min) uvnitř noci.
  final double wakeMedian, wakeLogSd;

  /// Nejvíc cyklů za noc v modelu.
  final int maxCycles;

  // --- Osobní prior, Kalmanův filtr místní úrovně (kap. 3.5) ---
  final double latencyTau, latencySigmaW, nremTau, nremSigmaW, remScaleTau, remScaleSigmaW;

  /// Drift osobní úrovně (rozptyl na log škále za den).
  final double driftPerDay;

  /// Kolik posledních nocí vstupuje do učení osobního prioru.
  final int learnNights;

  // --- Ruční značky (kap. 4.2) ---

  /// Věrohodnostní poměr: probudil se ze snu / sen bez probuzení / „nic si nepamatuju“.
  final double markWokeLr, markDreamLr, markEmptyLr;

  /// Nejistota času značky (SD, min): se snem / sen bez probuzení / prázdná noc bez času.
  final double markSigmaMinutes, markDreamSigmaMinutes, emptyNightSigmaMinutes;

  /// Strop součinu věrohodnostních poměrů v jedné epoše.
  final double markLrCap;

  // --- Předpověď ---

  /// Okno minulých nocí pro průměr posteriorů (dny) a jejich poločas.
  final int lookbackDays;
  final double halfLifeDays;

  /// Síla osobní apriorní křivky (prior predictive) v počtu nocí.
  final double priorNights;

  /// Počty nocí a značek v oknech (`recentNights` atd.) za posledních N dní.
  final int countDays;

  /// Pravděpodobnostní hmota intervalu (0,8 = 10.–90. percentil).
  final double intervalMass;

  // --- Noc ---
  final int minNightMinutes, maxNightMinutes, defaultNightMinutes;

  /// Populační délka spánku od usnutí do probuzení (min) a síla tohoto prioru
  /// v nocích; z toho P(ještě spíš v čase t), viz [RemCurveV2.pAsleep].
  final double nightLengthMedian, nightLengthSd, nightPriorNights;

  /// Exponent α u P(ještě spíš) v hodnotě pro úrovně: pRem · pAsleep^α.
  /// 0 (výchozí) = úrovně podle P(REM | v tu dobu spíš), to je přesně to, co
  /// měří hodnocení po 5 min. 1 = podle P(REM v čase t) včetně šance, že už nespíš.
  final double asleepWeight;

  /// Totéž pro `peak` (řazení oken, nejlepší okno). Výchozí 1: nejlepší okno
  /// má být tam, kde je REM pravděpodobný **a** obvykle ještě spíš.
  final double peakAsleepWeight;

  RemModelV2Params copyWith({
    double? levelLow,
    double? levelMid,
    double? levelHigh,
    double? maxHighShare,
    int? minWindowMinutes,
    double? ouraSensitivity,
    double? ouraFalsePositive,
    double? garminSensitivity,
    double? garminFalsePositive,
    double? rho,
    double? gamma,
    double? beta,
    double? ouraMissFirst,
    double? ouraMissLater,
    double? garminMissFirst,
    double? garminMissLater,
    double? latencyMedian,
    double? nremMedian,
    List<double>? remMedians,
    double? markWokeLr,
    double? markDreamLr,
    double? markEmptyLr,
    double? markSigmaMinutes,
    int? lookbackDays,
    double? halfLifeDays,
    double? priorNights,
    int? learnNights,
    double? driftPerDay,
    int? countDays,
    double? asleepWeight,
    double? peakAsleepWeight,
  }) =>
      RemModelV2Params(
        levelLow: levelLow ?? this.levelLow,
        levelMid: levelMid ?? this.levelMid,
        levelHigh: levelHigh ?? this.levelHigh,
        maxHighShare: maxHighShare ?? this.maxHighShare,
        minWindowMinutes: minWindowMinutes ?? this.minWindowMinutes,
        ouraSensitivity: ouraSensitivity ?? this.ouraSensitivity,
        ouraFalsePositive: ouraFalsePositive ?? this.ouraFalsePositive,
        garminSensitivity: garminSensitivity ?? this.garminSensitivity,
        garminFalsePositive: garminFalsePositive ?? this.garminFalsePositive,
        ouraWakeRow: ouraWakeRow,
        garminWakeRow: garminWakeRow,
        ouraRemAsWake: ouraRemAsWake,
        garminRemAsWake: garminRemAsWake,
        nremAsWake: nremAsWake,
        rho: rho ?? this.rho,
        gamma: gamma ?? this.gamma,
        beta: beta ?? this.beta,
        ouraMissFirst: ouraMissFirst ?? this.ouraMissFirst,
        ouraMissLater: ouraMissLater ?? this.ouraMissLater,
        garminMissFirst: garminMissFirst ?? this.garminMissFirst,
        garminMissLater: garminMissLater ?? this.garminMissLater,
        remInRemPeriod: remInRemPeriod,
        wakeInRemPeriod: wakeInRemPeriod,
        remInNremPeriod: remInNremPeriod,
        wakeInNremPeriod: wakeInNremPeriod,
        wakeInWakePeriod: wakeInWakePeriod,
        latencyMedian: latencyMedian ?? this.latencyMedian,
        skipShare: skipShare,
        skipPriorStrength: skipPriorStrength,
        nremMedian: nremMedian ?? this.nremMedian,
        nremLogSd: nremLogSd,
        nremWithinNightLogSd: nremWithinNightLogSd,
        nremAfterWakeMedian: nremAfterWakeMedian,
        nremAfterWakeLogSd: nremAfterWakeLogSd,
        remMedians: remMedians ?? this.remMedians,
        remLogSd: remLogSd,
        wakeMedian: wakeMedian,
        wakeLogSd: wakeLogSd,
        maxCycles: maxCycles,
        latencyTau: latencyTau,
        latencySigmaW: latencySigmaW,
        nremTau: nremTau,
        nremSigmaW: nremSigmaW,
        remScaleTau: remScaleTau,
        remScaleSigmaW: remScaleSigmaW,
        driftPerDay: driftPerDay ?? this.driftPerDay,
        learnNights: learnNights ?? this.learnNights,
        markWokeLr: markWokeLr ?? this.markWokeLr,
        markDreamLr: markDreamLr ?? this.markDreamLr,
        markEmptyLr: markEmptyLr ?? this.markEmptyLr,
        markSigmaMinutes: markSigmaMinutes ?? this.markSigmaMinutes,
        markDreamSigmaMinutes: markDreamSigmaMinutes,
        emptyNightSigmaMinutes: emptyNightSigmaMinutes,
        markLrCap: markLrCap,
        lookbackDays: lookbackDays ?? this.lookbackDays,
        halfLifeDays: halfLifeDays ?? this.halfLifeDays,
        priorNights: priorNights ?? this.priorNights,
        countDays: countDays ?? this.countDays,
        intervalMass: intervalMass,
        minNightMinutes: minNightMinutes,
        maxNightMinutes: maxNightMinutes,
        defaultNightMinutes: defaultNightMinutes,
        nightLengthMedian: nightLengthMedian,
        nightLengthSd: nightLengthSd,
        nightPriorNights: nightPriorNights,
        asleepWeight: asleepWeight ?? this.asleepWeight,
        peakAsleepWeight: peakAsleepWeight ?? this.peakAsleepWeight,
      );

  /// Pravidla úrovní pro [remLevelRuns].
  RemLevelRules get levelRules => RemLevelRules(
        levelLow: levelLow,
        levelMid: levelMid,
        levelHigh: levelHigh,
        maxHighShare: maxHighShare,
        minWindowMinutes: minWindowMinutes,
      );
}

// ===========================================================================
// Výstup
// ===========================================================================

/// Celá předpověď noci po 5 min (sdílená všemi okny jedné noci).
///
/// Index `i` odpovídá minutám od usnutí [5 i, 5 i + 5).
class RemCurveV2 {
  const RemCurveV2({
    required this.onset,
    required this.pRem,
    required this.pRemLow,
    required this.pRemHigh,
    required this.pDevice,
    required this.pAgree,
    required this.pPrior,
    required this.pAsleep,
    required this.relative,
    required this.usedNights,
    required this.weightSum,
    required this.effectiveNights,
    required this.priorNights,
    required this.latencyMedianMinutes,
    required this.nremMedianMinutes,
  });

  static const int stepMinutes = 5;

  /// Usnutí zaokrouhlené na 5 min (kotva mřížky).
  final DateTime onset;

  /// P(skutečný REM v epoše), dlouhodobá četnost podle modelu (střed Beta posterioru).
  final List<double> pRem;

  /// 80% interval (výchozí [RemModelV2Params.intervalMass]) pro [pRem].
  final List<double> pRemLow, pRemHigh;

  /// P(hlavní zařízení ukáže REM) (Oura, když ji noc má, jinak Garmin).
  /// Prior je model ([pRem] přes matice záměn a pojistku přehlédnutí,
  /// síla [priorNights] nocí), aktualizovaný skutečnými štítky minulých nocí
  /// se stejnými vahami. Tohle jde ověřit backtestem proti štítkům zařízení.
  final List<double> pDevice;

  /// P(obě zařízení ukážou REM | obě se shodnou), stejně složené; pro variantu „shoda“.
  final List<double> pAgree;

  /// Osobní apriorní křivka (prior predictive HSMM) bez průměru nocí.
  final List<double> pPrior;

  /// P(v čase t ještě spíš) z délek minulých nocí (s populačním priorem).
  /// [pRem] a ostatní pravděpodobnosti platí „když v té době spíš“.
  final List<double> pAsleep;

  /// Hodnota pro úrovně: [pRem] · [pAsleep]^α ([RemModelV2Params.asleepWeight],
  /// výchozí α = 0, tedy jen [pRem]) vydělená vrcholem noci.
  final List<double> relative;

  /// Očekávaná délka spánku v epochách (Σ [pAsleep]); z ní se počítá strop `high`.
  double get expectedEpochs => pAsleep.fold(0.0, (a, b) => a + b);

  /// Počet minulých nocí v průměru, součet jejich vah (poločas) a efektivní
  /// počet nocí (Σw)² / Σw².
  final int usedNights;
  final double weightSum, effectiveNights;

  /// Síla apriorní křivky v nocích (pro poměr „kolik je z tvých dat“).
  final double priorNights;

  /// Osobní medián latence prvního REM a délky NREM periody (min).
  final double latencyMedianMinutes, nremMedianMinutes;

  int get epochs => pRem.length;

  /// Váha vlastních nocí v předpovědi (0–1), zbytek je osobní apriorní křivka.
  double get dataWeight => weightSum <= 0 ? 0 : weightSum / (weightSum + priorNights);

  /// Index epochy pro minuty od usnutí, nebo `null` mimo křivku.
  int? indexOf(int offsetMinutes) {
    if (offsetMinutes < 0) {
      return null;
    }
    final i = offsetMinutes ~/ stepMinutes;
    return i < pRem.length ? i : null;
  }
}

/// [RemWindow] s kalibrovatelnou pravděpodobností navíc. Konstruktor předka
/// zůstává stejný, takže stávající UI s tím pracuje beze změny.
class RemWindowV2 extends RemWindow {
  const RemWindowV2({
    required super.from,
    required super.to,
    required super.fromOffset,
    required super.toOffset,
    required super.level,
    required super.peak,
    required super.recentNights,
    required super.bothNights,
    required super.ouraOnlyNights,
    required super.garminOnlyNights,
    required super.dreamMarks,
    required super.wokeMarks,
    required this.probability,
    required this.probabilityLow,
    required this.probabilityHigh,
    required this.deviceProbability,
    required this.curve,
  });

  /// Průměrná P(REM) v okně (model) a její 80% interval.
  final double probability, probabilityLow, probabilityHigh;

  /// Průměrná P(hlavní zařízení ukáže REM) v okně.
  final double deviceProbability;

  /// Celá křivka noci (pro detail a backtest po 5 min).
  final RemCurveV2 curve;
}

/// Mezipaměť posteriorů minulých nocí mezi voláními (výsledek nemění, jen
/// zrychluje: posterior noci závisí jen na jejích datech, značkách a parametrech).
class RemV2Cache {
  final Map<String, RemNightPosterior?> _posteriors = {};
  Object? _params;
  int hits = 0, misses = 0;

  int get size => _posteriors.length;

  void clear() {
    _posteriors.clear();
    hits = 0;
    misses = 0;
  }
}

// ===========================================================================
// Hlavní funkce
// ===========================================================================

/// REM okna pro noc [tonight] s usnutím [onset] z minulých nocí [nights]
/// a ručních značek [marks]. Noci a značky s datem [tonight] a pozdějším se
/// ignorují (předpověď jen z minulosti).
///
/// [cache] je volitelná (stejné výsledky, rychlejší opakované volání).
List<RemWindow> remWindowsV2(
  List<SleepNight> nights, {
  List<RemMark> marks = const [],
  required DateTime onset,
  required DateTime tonight,
  RemModelV2Params params = RemModelV2Params.defaults,
  RemV2Cache? cache,
}) {
  final pr = _predictV2(nights, marks, onset, tonight, params, cache);
  return _windowsFromCurve(pr.curve, pr.counts, params);
}

/// Jen křivka noci po 5 min (bez oken), pro detail a testy.
RemCurveV2 remCurveV2(
  List<SleepNight> nights, {
  List<RemMark> marks = const [],
  required DateTime onset,
  required DateTime tonight,
  RemModelV2Params params = RemModelV2Params.defaults,
  RemV2Cache? cache,
}) =>
    _predictV2(nights, marks, onset, tonight, params, cache).curve;

({RemCurveV2 curve, _CountData counts}) _predictV2(
  List<SleepNight> nights,
  List<RemMark> marks,
  DateTime onset,
  DateTime tonight,
  RemModelV2Params p,
  RemV2Cache? cache,
) {
  if (cache != null && !identical(cache._params, p)) {
    cache.clear();
    cache._params = p;
  }
  final tonightKey = remNightKey(tonight);
  final tonightDay = _dayNumber(tonightKey);
  final anchor = remRoundTo5(onset);

  // Minulé noci po datech, nejstarší první.
  final groups = remGroupNights(nights.where((n) => remNightKey(n.nightDate) < tonightKey));
  final keys = groups.keys.toList()..sort();
  final marksByKey = <int, List<RemMark>>{};
  for (final m in marks) {
    final k = remNightKey(m.nightDate);
    if (k < tonightKey) {
      (marksByKey[k] ??= []).add(m);
    }
  }

  // Posteriory: pro učení stačí posledních learnNights nocí, pro průměr lookbackDays.
  final posts = <RemNightPosterior>[];
  for (var i = keys.length - 1; i >= 0; i--) {
    final k = keys[i];
    final age = tonightDay - _dayNumber(k);
    if (posts.length >= p.learnNights && age > p.lookbackDays) {
      break;
    }
    final post = _posteriorCached(groups[k]!, marksByKey[k] ?? const [], p, cache);
    if (post != null) {
      posts.add(post);
    }
  }
  final chrono = posts.reversed.toList();
  final learn = chrono.length > p.learnNights ? chrono.sublist(chrono.length - p.learnNights) : chrono;
  final prior = remPersonalPrior(learn, tonightDay: tonightDay, params: p);

  // Noci v okně průměru a jejich váhy.
  final blend = <RemNightPosterior>[];
  final weights = <double>[];
  for (final post in chrono) {
    final age = tonightDay - _dayNumber(post.night.key);
    if (age >= 1 && age <= p.lookbackDays) {
      blend.add(post);
      weights.add(math.pow(0.5, age / p.halfLifeDays).toDouble());
    }
  }

  // Horizont: 90. percentil délky minulých nocí + 30 min.
  var horizon = (p.defaultNightMinutes / _step).round();
  if (blend.isNotEmpty) {
    final lens = blend.map((b) => b.night.epochs).toList()..sort();
    final q90 = lens[((lens.length - 1) * 0.9).round()];
    horizon = q90 + 6;
  }
  horizon = horizon.clamp(72, (p.maxNightMinutes / _step).floor());

  final pred = _priorPredictive(prior, horizon, p, beta: 1.0);
  final k0 = p.priorNights;
  final aW = List<double>.generate(horizon, (t) => k0 * pred.pW[t]);
  final aN = List<double>.generate(horizon, (t) => k0 * pred.pN[t]);
  final aR = List<double>.generate(horizon, (t) => k0 * pred.pR[t]);
  // Štítky zařízení minulých nocí (pro pDevice a pAgree): hlavní zařízení noci a shoda obou.
  final devA = List<double>.filled(horizon, 0.0), devN = List<double>.filled(horizon, 0.0);
  final agA = List<double>.filled(horizon, 0.0), agN = List<double>.filled(horizon, 0.0);
  var wSum = 0.0, w2Sum = 0.0;
  for (var n = 0; n < blend.length; n++) {
    final post = blend[n];
    final night = post.night;
    final w = weights[n];
    wSum += w;
    w2Sum += w * w;
    final tMax = math.min(horizon, night.epochs);
    final dev = night.hasOura ? 0 : 1;
    final flags = dev == 0 ? night.ouraRem : night.garminRem;
    final both = night.hasOura && night.hasGarmin;
    for (var t = 0; t < tMax; t++) {
      aW[t] += w * post.pWake[t];
      aN[t] += w * post.pNrem[t];
      aR[t] += w * post.pRem[t];
      if (night.covered(dev, t)) {
        devN[t] += w;
        devA[t] += flags[t] ? w : 0.0;
      }
      if (both && night.covered(0, t) && night.covered(1, t) && night.ouraRem[t] == night.garminRem[t]) {
        agN[t] += w;
        agA[t] += night.ouraRem[t] ? w : 0.0;
      }
    }
  }
  final effective = w2Sum > 0 ? wSum * wSum / w2Sum : 0.0;

  // P(ještě spíš v epoše t): populační délka noci + vážené délky minulých nocí.
  final kn = p.nightPriorNights;
  final asleep = List<double>.generate(
      horizon, (t) => kn * (1 - _normCdf((t * _step + _step / 2 - p.nightLengthMedian) / p.nightLengthSd)));
  for (var n = 0; n < blend.length; n++) {
    final tMax = math.min(horizon, blend[n].night.epochs);
    for (var t = 0; t < tMax; t++) {
      asleep[t] += weights[n];
    }
  }
  for (var t = 0; t < horizon; t++) {
    asleep[t] /= kn + wSum;
  }

  // Podíl nocí s Ourou (posledních 14 nocí s daty) pro „hlavní zařízení“.
  var ouraShare = 1.0;
  if (chrono.isNotEmpty) {
    final recent = chrono.length > 14 ? chrono.sublist(chrono.length - 14) : chrono;
    ouraShare = recent.where((r) => r.night.hasOura).length / recent.length;
  }
  final dm = _DeviceModel(p);
  final lowQ = (1 - p.intervalMass) / 2, highQ = 1 - lowQ;
  final pRem = List<double>.filled(horizon, 0.0);
  final pLow = List<double>.filled(horizon, 0.0);
  final pHigh = List<double>.filled(horizon, 0.0);
  final pDev = List<double>.filled(horizon, 0.0);
  final pAgr = List<double>.filled(horizon, 0.0);
  for (var t = 0; t < horizon; t++) {
    final tot = aW[t] + aN[t] + aR[t];
    final r = tot > 0 ? aR[t] / tot : 0.0;
    final w = tot > 0 ? aW[t] / tot : 0.0;
    final nn = tot > 0 ? aN[t] / tot : 1.0;
    pRem[t] = r;
    final rest = aW[t] + aN[t];
    if (aR[t] < 1e-9) {
      pLow[t] = 0;
      pHigh[t] = r;
    } else if (rest < 1e-9) {
      pLow[t] = r;
      pHigh[t] = 1;
    } else {
      pLow[t] = math.min(r, _betaQuantile(aR[t], rest, lowQ));
      pHigh[t] = math.max(r, _betaQuantile(aR[t], rest, highQ));
    }
    final f1 = pred.firstShare[t];
    final mapDev = ouraShare * dm.labelRem(0, w, nn, r, f1) + (1 - ouraShare) * dm.labelRem(1, w, nn, r, f1);
    pDev[t] = (k0 * mapDev + devA[t]) / (k0 + devN[t]);
    pAgr[t] = (k0 * dm.agreeRem(w, nn, r, f1) + agA[t]) / (k0 + agN[t]);
  }
  final rank = [
    for (var t = 0; t < horizon; t++) p.asleepWeight == 0 ? pRem[t] : pRem[t] * math.pow(asleep[t], p.asleepWeight),
  ];
  var peak = 0.0;
  for (final v in rank) {
    peak = math.max(peak, v);
  }
  final rel = [for (final v in rank) peak > 0 ? v / peak : 0.0];

  final curve = RemCurveV2(
    onset: anchor,
    pRem: pRem,
    pRemLow: pLow,
    pRemHigh: pHigh,
    pDevice: pDev,
    pAgree: pAgr,
    pPrior: pred.pR,
    pAsleep: asleep,
    relative: rel,
    usedNights: blend.length,
    weightSum: wSum,
    effectiveNights: effective,
    priorNights: k0,
    latencyMedianMinutes: math.exp(prior.latencyLog),
    nremMedianMinutes: math.exp(prior.nremLog),
  );

  // Podklady pro počty v oknech: noci a značky za posledních countDays dní.
  final countNights = <RemNightData>[];
  final countMarks = <({double offset, bool woke})>[];
  final byKey = {for (final post in chrono) post.night.key: post.night};
  for (final post in chrono) {
    final age = tonightDay - _dayNumber(post.night.key);
    if (age >= 1 && age <= p.countDays) {
      countNights.add(post.night);
    }
  }
  for (final e in marksByKey.entries) {
    final age = tonightDay - _dayNumber(e.key);
    final night = byKey[e.key];
    if (age < 1 || age > p.countDays || night == null) {
      continue;
    }
    for (final m in e.value) {
      if (m.emptyNight || m.at == null) {
        continue;
      }
      final off = _markOffset(m.at!, night);
      if (off != null) {
        countMarks.add((offset: off, woke: m.woke));
      }
    }
  }
  return (curve: curve, counts: _CountData(countNights, countMarks));
}

/// Podklady pro počty nocí a značek v oknech (interní, vrací [remCurveV2]).
class _CountData {
  _CountData(this.nights, this.marks);
  final List<RemNightData> nights;
  final List<({double offset, bool woke})> marks;
}

List<RemWindow> _windowsFromCurve(RemCurveV2 curve, _CountData counts, RemModelV2Params p) {
  final runs = remLevelRuns(curve.relative, p.levelRules, shareBase: curve.expectedEpochs);
  final peakRank = [
    for (var t = 0; t < curve.epochs; t++) curve.pRem[t] * math.pow(curve.pAsleep[t], p.peakAsleepWeight),
  ];
  final peakMax = peakRank.fold(0.0, math.max);
  final out = <RemWindow>[];
  for (final run in runs) {
    var both = 0, oOnly = 0, gOnly = 0;
    for (final n in counts.nights) {
      var o = false, g = false;
      final hi = math.min(run.to, n.epochs);
      for (var i = run.from; i < hi; i++) {
        o = o || n.ouraRem[i];
        g = g || n.garminRem[i];
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
    for (final m in counts.marks) {
      if (m.offset >= run.from * _step && m.offset < run.to * _step) {
        if (m.woke) {
          woke++;
        } else {
          dream++;
        }
      }
    }
    var prob = 0.0, lo = 0.0, hi = 0.0, dev = 0.0;
    for (var i = run.from; i < run.to; i++) {
      prob += curve.pRem[i];
      lo += curve.pRemLow[i];
      hi += curve.pRemHigh[i];
      dev += curve.pDevice[i];
    }
    final len = run.to - run.from;
    out.add(RemWindowV2(
      from: curve.onset.add(Duration(minutes: run.from * _step)),
      to: curve.onset.add(Duration(minutes: run.to * _step)),
      fromOffset: run.from * _step,
      toOffset: run.to * _step,
      level: run.level,
      peak: peakMax <= 0 ? 0.0 : [for (var i = run.from; i < run.to; i++) peakRank[i] / peakMax].reduce(math.max),
      recentNights: counts.nights.length,
      bothNights: both,
      ouraOnlyNights: oOnly,
      garminOnlyNights: gOnly,
      dreamMarks: dream,
      wokeMarks: woke,
      probability: prob / len,
      probabilityLow: lo / len,
      probabilityHigh: hi / len,
      deviceProbability: dev / len,
      curve: curve,
    ));
  }
  return out;
}

RemNightPosterior? _posteriorCached(
    List<SleepNight> entries, List<RemMark> marks, RemModelV2Params p, RemV2Cache? cache) {
  if (cache == null) {
    final data = remNightData(entries, params: p);
    return data == null ? null : remNightPosterior(data, marks: marks, params: p);
  }
  final key = '${remNightKey(entries.first.nightDate)}|${_nightFingerprint(entries)}|${_marksFingerprint(marks)}';
  if (cache._posteriors.containsKey(key)) {
    cache.hits++;
    return cache._posteriors[key];
  }
  cache.misses++;
  final data = remNightData(entries, params: p);
  final post = data == null ? null : remNightPosterior(data, marks: marks, params: p);
  cache._posteriors[key] = post;
  return post;
}

String _nightFingerprint(List<SleepNight> entries) {
  final sorted = [...entries]..sort((a, b) => a.source.index.compareTo(b.source.index));
  final sb = StringBuffer();
  for (final e in sorted) {
    var h = 17;
    for (final s in e.segments) {
      h = _mix(h, s.start.microsecondsSinceEpoch);
      h = _mix(h, s.end.microsecondsSinceEpoch);
      h = _mix(h, s.stage.index);
    }
    sb
      ..write(e.source.index)
      ..write(':')
      ..write(e.onset?.microsecondsSinceEpoch ?? -1)
      ..write(':')
      ..write(e.wake?.microsecondsSinceEpoch ?? -1)
      ..write(':')
      ..write(e.segments.length)
      ..write(':')
      ..write(h)
      ..write(';');
  }
  return sb.toString();
}

String _marksFingerprint(List<RemMark> marks) {
  final parts = [
    for (final m in marks) '${m.at?.microsecondsSinceEpoch ?? -1}/${m.woke ? 1 : 0}/${m.emptyNight ? 1 : 0}',
  ]..sort();
  return parts.join(',');
}

int _mix(int h, int v) => (h * 31 + v) % 9007199254740881;

// ===========================================================================
// Noc: seskupení, kotva, mřížka
// ===========================================================================

const int _step = 5;

/// Klíč noci z data večera (rok, měsíc, den), nezávisle na UTC / místním čase.
int remNightKey(DateTime d) => d.year * 10000 + d.month * 100 + d.day;

int _dayNumber(int key) => DateTime.utc(key ~/ 10000, (key ~/ 100) % 100, key % 100).millisecondsSinceEpoch ~/ 86400000;

/// Pořadové číslo dne pro klíč [remNightKey] (rozdíl dvou = počet dní, bez vlivu změny času).
int remDayNumber(int key) => _dayNumber(key);

/// Záznamy seskupené podle data večera.
Map<int, List<SleepNight>> remGroupNights(Iterable<SleepNight> nights) {
  final out = <int, List<SleepNight>>{};
  for (final n in nights) {
    (out[remNightKey(n.nightDate)] ??= []).add(n);
  }
  return out;
}

/// Zaokrouhlí okamžik na 5 min (zachová UTC / místní). Pásma jsou násobky
/// 5 min, takže to odpovídá zaokrouhlení hodin na ciferníku.
DateTime remRoundTo5(DateTime t) {
  const step = _step * 60 * 1000000;
  final us = t.microsecondsSinceEpoch + step ~/ 2;
  final r = us - us % step;
  return DateTime.fromMicrosecondsSinceEpoch(r, isUtc: t.isUtc);
}

double _minutesBetween(DateTime a, DateTime b) => (b.microsecondsSinceEpoch - a.microsecondsSinceEpoch) / 6e7;

/// Jedna noc na 5min mřížce od usnutí: podíly W/N/R po epochách pro každé zařízení.
class RemNightData {
  RemNightData._({
    required this.key,
    required this.nightDate,
    required this.anchor,
    required this.epochs,
    required this.oura,
    required this.garmin,
  })  : ouraRem = [for (var i = 0; i < epochs; i++) (oura?[i]?[2] ?? 0) >= 0.5],
        garminRem = [for (var i = 0; i < epochs; i++) (garmin?[i]?[2] ?? 0) >= 0.5];

  final int key;
  final DateTime nightDate;

  /// Usnutí zaokrouhlené na 5 min: Oura `onset`, jinak Garmin, jinak první
  /// úsek trvalého spánku (≥ 8 z 10 min) z jejich úseků.
  final DateTime anchor;

  /// Počet 5min epoch od kotvy do konce posledního spánku.
  final int epochs;

  /// Podíly [bdění, NREM, REM] po epochách, `null` = zařízení v epoše nemá data.
  final List<List<double>?>? oura, garmin;

  /// Epocha, kde zařízení ukazuje REM aspoň polovinu pokrytého času.
  final List<bool> ouraRem, garminRem;

  bool get hasOura => oura != null;
  bool get hasGarmin => garmin != null;

  /// Pokrytí epochy daty zařízení (0 Oura, 1 Garmin).
  bool covered(int device, int i) => (device == 0 ? oura : garmin)?[i] != null;
}

/// Mřížka noci ze záznamů jednoho data. `null`, když chybí spánek z Oury
/// i Garminu nebo je noc kratší než [RemModelV2Params.minNightMinutes].
/// Ruční záznamy (`manual`) se do REM nepočítají: nemají senzor.
RemNightData? remNightData(List<SleepNight> entries, {RemModelV2Params params = RemModelV2Params.defaults}) {
  if (entries.isEmpty) {
    return null;
  }
  final ouraSegs = <SleepSegment>[];
  final garminSegs = <SleepSegment>[];
  DateTime? ouraOnset, garminOnset;
  for (final e in entries) {
    if (e.source == SleepSource.oura) {
      ouraSegs.addAll(e.segments);
      ouraOnset ??= e.onset;
    } else if (e.source == SleepSource.garmin) {
      garminSegs.addAll(e.segments);
      garminOnset ??= e.onset;
    }
  }
  final ouraSleep = _hasSleep(ouraSegs);
  final garminSleep = _hasSleep(garminSegs);
  if (!ouraSleep && !garminSleep) {
    return null;
  }
  final primary = ouraSleep ? ouraSegs : garminSegs;
  final raw = _saneOnset(ouraSleep ? ouraOnset : garminOnset, primary) ?? _derivedOnset(primary);
  final anchor = remRoundTo5(raw);
  var endMin = 0.0;
  for (final s in [...ouraSegs, ...garminSegs]) {
    if (s.stage != SleepStage.awake) {
      endMin = math.max(endMin, _minutesBetween(anchor, s.end));
    }
  }
  endMin = math.min(endMin, params.maxNightMinutes.toDouble());
  final epochs = (endMin / _step - 1e-9).ceil();
  if (epochs * _step < params.minNightMinutes) {
    return null;
  }
  return RemNightData._(
    key: remNightKey(entries.first.nightDate),
    nightDate: entries.first.nightDate,
    anchor: anchor,
    epochs: epochs,
    oura: ouraSleep ? _fractions(ouraSegs, anchor, epochs) : null,
    garmin: garminSleep ? _fractions(garminSegs, anchor, epochs) : null,
  );
}

bool _hasSleep(List<SleepSegment> segs) => segs.any((s) => s.stage != SleepStage.awake && s.end.isAfter(s.start));

DateTime? _saneOnset(DateTime? onset, List<SleepSegment> segs) {
  if (onset == null) {
    return null;
  }
  var first = segs.first.start, last = segs.first.end;
  for (final s in segs) {
    if (s.start.isBefore(first)) {
      first = s.start;
    }
    if (s.end.isAfter(last)) {
      last = s.end;
    }
  }
  final ok = !onset.isBefore(first.subtract(const Duration(minutes: 60))) && onset.isBefore(last);
  return ok ? onset : null;
}

/// První začátek spánkového úseku, po kterém je ≥ 8 z 10 min spánek.
DateTime _derivedOnset(List<SleepSegment> segs) {
  final sleep = segs.where((s) => s.stage != SleepStage.awake && s.end.isAfter(s.start)).toList()
    ..sort((a, b) => a.start.compareTo(b.start));
  for (final c in sleep) {
    final lo = c.start.microsecondsSinceEpoch;
    final hi = lo + 10 * 60 * 1000000;
    var us = 0;
    for (final s in sleep) {
      final a = math.max(lo, s.start.microsecondsSinceEpoch);
      final b = math.min(hi, s.end.microsecondsSinceEpoch);
      if (b > a) {
        us += b - a;
      }
      if (s.start.microsecondsSinceEpoch >= hi) {
        break;
      }
    }
    if (us >= 8 * 60 * 1000000) {
      return c.start;
    }
  }
  return sleep.first.start;
}

/// Podíly tříd po 5min epochách. Překryvy se sečtou a znormují, mezery = chybí.
List<List<double>?> _fractions(List<SleepSegment> segs, DateTime anchor, int epochs) {
  final acc = List<double>.filled(3 * epochs, 0.0);
  final limit = epochs * _step.toDouble();
  for (final s in segs) {
    var a = _minutesBetween(anchor, s.start);
    var b = _minutesBetween(anchor, s.end);
    if (a < 0) {
      a = 0;
    }
    if (b > limit) {
      b = limit;
    }
    if (b <= a) {
      continue;
    }
    final z = s.stage == SleepStage.awake
        ? 0
        : s.stage == SleepStage.rem
            ? 2
            : 1;
    final iEnd = math.min(epochs, (b / _step).ceil());
    for (var i = (a / _step).floor(); i < iEnd; i++) {
      final lo = math.max(a, i * _step.toDouble());
      final hi = math.min(b, (i + 1) * _step.toDouble());
      if (hi > lo) {
        acc[3 * i + z] += hi - lo;
      }
    }
  }
  return [
    for (var i = 0; i < epochs; i++)
      if (acc[3 * i] + acc[3 * i + 1] + acc[3 * i + 2] >= _step / 2)
        [
          for (var z = 0; z < 3; z++) acc[3 * i + z] / (acc[3 * i] + acc[3 * i + 1] + acc[3 * i + 2]),
        ]
      else
        null,
  ];
}

/// Minuty od kotvy noci pro čas značky; `null`, když do noci nepatří.
/// Častá chyba „čas snu s datem večera“ (05:10 téhož data) se opraví o +1 den.
double? _markOffset(DateTime at, RemNightData night) {
  final end = night.epochs * _step.toDouble();
  bool inside(double m) => m >= -60 && m <= end + 120;
  final m = _minutesBetween(night.anchor, at);
  if (inside(m)) {
    return m;
  }
  if (m < 0) {
    // Stejný čas na ciferníku o kalendářní den později (ne +24 h: noc změny času má 23 nebo 25 h).
    final next = at.isUtc
        ? DateTime.utc(at.year, at.month, at.day + 1, at.hour, at.minute, at.second)
        : DateTime(at.year, at.month, at.day + 1, at.hour, at.minute, at.second);
    final m2 = _minutesBetween(night.anchor, next);
    if (inside(m2)) {
      return m2;
    }
  }
  return null;
}

// ===========================================================================
// Model zařízení
// ===========================================================================

/// Matice záměn obou zařízení a jejich vazba (kap. 3.3). Emisní třídy:
/// 0 bdění, 1 NREM, 2–5 REM v režimech přehlédnutí (bit 0 Oura, bit 1 Garmin).
class _DeviceModel {
  _DeviceModel(RemModelV2Params p)
      : rho = p.rho,
        missO = [p.ouraMissFirst, p.ouraMissLater],
        missG = [p.garminMissFirst, p.garminMissLater] {
    rowO = [
      p.ouraWakeRow,
      [p.nremAsWake, 1 - p.nremAsWake - p.ouraFalsePositive, p.ouraFalsePositive],
      [p.ouraRemAsWake, 1 - p.ouraRemAsWake - p.ouraSensitivity, p.ouraSensitivity],
    ];
    rowG = [
      p.garminWakeRow,
      [p.nremAsWake, 1 - p.nremAsWake - p.garminFalsePositive, p.garminFalsePositive],
      [p.garminRemAsWake, 1 - p.garminRemAsWake - p.garminSensitivity, p.garminSensitivity],
    ];
    clsO = [rowO[0], rowO[1], for (var m = 0; m < 4; m++) (m & 1) == 1 ? rowO[1] : rowO[2]];
    clsG = [rowG[0], rowG[1], for (var m = 0; m < 4; m++) (m & 2) == 2 ? rowG[1] : rowG[2]];
    joint = [for (var c = 0; c < 6; c++) remCoupledJoint(clsO[c], clsG[c], rho)];
  }

  final double rho;
  final List<double> missO, missG;
  late final List<List<double>> rowO, rowG, clsO, clsG;
  late final List<List<List<double>>> joint;

  /// P(pozorování | emisní třída c) pro měkké štítky obou zařízení.
  double lik(int c, List<double>? fo, List<double>? fg) {
    if (fo == null && fg == null) {
      return 1.0;
    }
    if (fg == null) {
      final r = clsO[c];
      return fo![0] * r[0] + fo[1] * r[1] + fo[2] * r[2];
    }
    if (fo == null) {
      final r = clsG[c];
      return fg[0] * r[0] + fg[1] * r[1] + fg[2] * r[2];
    }
    final j = joint[c];
    var s = 0.0;
    for (var a = 0; a < 3; a++) {
      final fa = fo[a];
      if (fa == 0) {
        continue;
      }
      final row = j[a];
      s += fa * (fg[0] * row[0] + fg[1] * row[1] + fg[2] * row[2]);
    }
    return s;
  }

  /// Váhy režimů přehlédnutí pro REM periodu (k = 1 první, jinak další).
  List<double> modeWeights(bool first) {
    final po = first ? missO[0] : missO[1];
    final pg = first ? missG[0] : missG[1];
    return [(1 - po) * (1 - pg), po * (1 - pg), (1 - po) * pg, po * pg];
  }

  /// P(zařízení d ukáže REM) z rozdělení skutečného stavu (w, n, r) a podílu
  /// první REM periody f1 (ta se přehlíží častěji).
  double labelRem(int device, double w, double n, double r, double f1) {
    final row = device == 0 ? rowO : rowG;
    final miss = device == 0 ? missO : missG;
    final pm = f1 * miss[0] + (1 - f1) * miss[1];
    return w * row[0][2] + n * row[1][2] + r * ((1 - pm) * row[2][2] + pm * row[1][2]);
  }

  /// P(obě REM | obě se shodnou) z rozdělení skutečného stavu.
  double agreeRem(double w, double n, double r, double f1) {
    double rr(int c) => joint[c][2][2];
    double nn(int c) => 1 - clsO[c][2] - clsG[c][2] + joint[c][2][2];
    final wf = modeWeights(true), wl = modeWeights(false);
    var rrR = 0.0, nnR = 0.0;
    for (var m = 0; m < 4; m++) {
      final wm = f1 * wf[m] + (1 - f1) * wl[m];
      rrR += wm * rr(2 + m);
      nnR += wm * nn(2 + m);
    }
    final numer = w * rr(0) + n * rr(1) + r * rrR;
    final den = numer + w * nn(0) + n * nn(1) + r * nnR;
    return den > 0 ? numer / den : 0.0;
  }
}

/// Sdružené rozdělení štítků dvou zařízení se zachovanými marginálami [a], [b]
/// a vazbou [rho] (0 nezávislé chyby, 1 Fréchetova horní mez). Nikdy záporné.
List<List<double>> remCoupledJoint(List<double> a, List<double> b, double rho) {
  final m = [for (var i = 0; i < 3; i++) math.min(a[i], b[i])];
  final mm = m[0] + m[1] + m[2];
  return [
    for (var i = 0; i < 3; i++)
      [
        for (var k = 0; k < 3; k++)
          (1 - rho) * a[i] * b[k] +
              rho * ((i == k ? m[i] : 0.0) + (mm < 1 - 1e-12 ? (a[i] - m[i]) * (b[k] - m[k]) / (1 - mm) : 0.0)),
      ],
  ];
}

// ===========================================================================
// Segmenty HSMM (kap. 3.2)
// ===========================================================================

const int _tN = 0, _tR = 1, _tW = 2;

class _Segs {
  final List<int> type = [];
  final List<int> cycle = [];
  final List<bool> afterWake = [];
  final List<bool> absorbing = [];
  final List<bool> bonusStart = [];
  final List<List<double>> pmf = [];
  final List<List<double>> surv = [];
  final List<int> dMin = [];
  final List<int> dMax = [];
  final List<double> logMedian = [];
  final List<List<double>> modeW = [];
  final List<List<int>> pred = [];
  final List<List<double>> predP = [];
  final List<List<int>> succ = [];
  final List<List<double>> succP = [];

  int get n => type.length;

  int add({
    required int type,
    required int cycle,
    required List<double> pmf,
    required int dMin,
    required int dMax,
    double logMedian = 0,
    bool afterWake = false,
    bool absorbing = false,
    bool bonusStart = false,
    List<double> modeW = const [1, 0, 0, 0],
  }) {
    this.type.add(type);
    this.cycle.add(cycle);
    this.afterWake.add(afterWake);
    this.absorbing.add(absorbing);
    this.bonusStart.add(bonusStart);
    this.pmf.add(pmf);
    final sv = List<double>.filled(dMax + 2, 0.0);
    if (absorbing) {
      sv.fillRange(0, dMax + 2, 1.0);
    } else {
      var acc = 0.0;
      for (var d = dMax; d >= 0; d--) {
        acc += d >= 1 ? pmf[d] : 0.0;
        sv[d] = math.min(1.0, acc);
      }
    }
    surv.add(sv);
    this.dMin.add(dMin);
    this.dMax.add(dMax);
    this.logMedian.add(logMedian);
    this.modeW.add(modeW);
    pred.add([]);
    predP.add([]);
    succ.add([]);
    succP.add([]);
    return this.type.length - 1;
  }

  void link(int from, int to, double p) {
    succ[from].add(to);
    succP[from].add(p);
    pred[to].add(from);
    predP[to].add(p);
  }
}

/// Diskretizovaná log-normální délka v epochách [dMin, dMax]. Každá složka
/// směsi se umocní β a znormuje zvlášť, váhy směsi zůstanou (β zplošťuje tvar
/// času v noci, ne podíl nocí s vynechaným prvním REM).
List<double> _lnPmf(List<({double weight, double median, double sd})> mix, int dMin, int dMax, double beta) {
  final out = List<double>.filled(dMax + 1, 0.0);
  for (final c in mix) {
    if (c.weight <= 0) {
      continue;
    }
    final comp = List<double>.filled(dMax + 1, 0.0);
    var tot = 0.0;
    for (var d = dMin; d <= dMax; d++) {
      var p = math.max(_lnCdf(_step * d.toDouble(), c.median, c.sd) - _lnCdf(_step * (d - 1.0), c.median, c.sd), 1e-12);
      if (beta != 1) {
        p = math.pow(p, beta).toDouble();
      }
      comp[d] = p;
      tot += p;
    }
    for (var d = dMin; d <= dMax; d++) {
      out[d] += c.weight * comp[d] / tot;
    }
  }
  final tot = out.fold(0.0, (a, b) => a + b);
  for (var d = dMin; d <= dMax; d++) {
    out[d] /= tot;
  }
  return out;
}

double _lnCdf(double x, double median, double sd) => x <= 0 ? 0.0 : _normCdf((math.log(x) - math.log(median)) / sd);

/// Řetězec segmentů N1, R1, W1, N2, N2′, R2, … podle [RemModelV2Params].
_Segs _buildSegs({
  required RemModelV2Params p,
  required double latencyMedian,
  required double latencySd,
  required double skip,
  required double nremMedian,
  required double nremSd,
  required double remScale,
  required double beta,
  required int maxEpochs,
}) {
  final g = _Segs();
  final dm = _DeviceModel(p);
  final skipMedian = latencyMedian + nremMedian + 20;
  final n1 = g.add(
    type: _tN,
    cycle: 1,
    pmf: _lnPmf([
      (weight: 1 - skip, median: latencyMedian, sd: latencySd),
      (weight: skip, median: skipMedian, sd: 0.2),
    ], 3, 60, beta),
    dMin: 3,
    dMax: 60,
  );
  var prevN = [n1];
  final kMax = p.maxCycles;
  for (var k = 1; k <= kMax; k++) {
    final remMed = p.remMedians[math.min(k - 1, p.remMedians.length - 1)] * remScale;
    final rMax = k == 1 ? 12 : 15;
    final r = g.add(
      type: _tR,
      cycle: k,
      pmf: _lnPmf([(weight: 1, median: remMed, sd: p.remLogSd)], 1, rMax, beta),
      dMin: 1,
      dMax: rMax,
      logMedian: math.log(remMed),
      modeW: dm.modeWeights(k == 1),
    );
    for (final pn in prevN) {
      g.link(pn, r, 1.0);
    }
    final w = g.add(
      type: _tW,
      cycle: k,
      pmf: _lnPmf([(weight: 1, median: p.wakeMedian, sd: p.wakeLogSd)], 1, 24, beta),
      dMin: 1,
      dMax: 24,
      bonusStart: true,
    );
    final pw = math.min(0.25, 0.05 + 0.04 * (k - 1));
    g.link(r, w, pw);
    if (k < kMax) {
      final nk = g.add(
        type: _tN,
        cycle: k + 1,
        pmf: _lnPmf([(weight: 1, median: nremMedian, sd: nremSd)], 3, 40, beta),
        dMin: 3,
        dMax: 40,
        bonusStart: true,
      );
      final nw = g.add(
        type: _tN,
        cycle: k + 1,
        pmf: _lnPmf([(weight: 1, median: p.nremAfterWakeMedian, sd: p.nremAfterWakeLogSd)], 1, 40, beta),
        dMin: 1,
        dMax: 40,
        afterWake: true,
      );
      g.link(r, nk, 1 - pw);
      g.link(w, nw, 1.0);
      prevN = [nk, nw];
    } else {
      final end = g.add(
        type: _tN,
        cycle: k + 1,
        pmf: List<double>.filled(maxEpochs + 1, 0.0),
        dMin: 1,
        dMax: maxEpochs,
        absorbing: true,
        bonusStart: true,
      );
      g.link(r, end, 1 - pw);
      g.link(w, end, 1.0);
    }
  }
  return g;
}

// ===========================================================================
// Posterior jedné noci
// ===========================================================================

/// Posterior jedné minulé noci z HSMM (populační prior zmírněný β).
class RemNightPosterior {
  RemNightPosterior._({
    required this.night,
    required this.pRem,
    required this.pNrem,
    required this.pWake,
    required this.pRemPeriod,
    required this.logLikelihood,
    required this.logLikelihoodBackward,
    required this.latencyMass,
    required this.latencyLogMean,
    required this.latencyLogVar,
    required this.skipMass,
    required this.nremMass,
    required this.nremLogMean,
    required this.nremLogVar,
    required this.remMass,
    required this.remLogMean,
    required this.remLogVar,
  });

  final RemNightData night;

  /// P(skutečný stav v epoše | data noci): REM, NREM, bdění (součet 1).
  final List<double> pRem, pNrem, pWake;

  /// P(probíhá REM perioda v epoše | data) (REM perioda smí obsahovat krátké bdění).
  final List<double> pRemPeriod;

  /// log P(data noci) z dopředného a zpětného průchodu (kontrola, mají se shodovat).
  final double logLikelihood, logLikelihoodBackward;

  /// Souhrny pro osobní prior: latence prvního REM do 150 min (log min),
  /// hmota „první REM vynechán nebo chybí“, NREM periody k ≥ 2, REM periody
  /// (log poměr k populačnímu mediánu).
  final double latencyMass, latencyLogMean, latencyLogVar, skipMass;
  final double nremMass, nremLogMean, nremLogVar;
  final double remMass, remLogMean, remLogVar;
}

/// Posterior noci [night] s ručními značkami [marks] této noci.
RemNightPosterior remNightPosterior(
  RemNightData night, {
  List<RemMark> marks = const [],
  RemModelV2Params params = RemModelV2Params.defaults,
}) {
  final p = params;
  final tT = night.epochs;
  final dm = _DeviceModel(p);

  // Lokální věrohodnosti po třídách a emisní hodnoty typů segmentů.
  final lik = List.generate(6, (_) => List<double>.filled(tT, 1.0));
  for (var t = 0; t < tT; t++) {
    final fo = night.oura?[t];
    final fg = night.garmin?[t];
    if (fo == null && fg == null) {
      continue;
    }
    for (var c = 0; c < 6; c++) {
      lik[c][t] = dm.lik(c, fo, fg);
    }
  }
  final muN = [p.wakeInNremPeriod, 1 - p.wakeInNremPeriod - p.remInNremPeriod, p.remInNremPeriod];
  final muR = [p.wakeInRemPeriod, 1 - p.wakeInRemPeriod - p.remInRemPeriod, p.remInRemPeriod];
  final muW = [p.wakeInWakePeriod, 1 - p.wakeInWakePeriod, 0.0];
  final mark = _markFactors(night, marks, p);
  final em = List.generate(6, (_) => List<double>.filled(tT, 1.0));
  var logC = 0.0;
  final g = p.gamma;
  for (var t = 0; t < tT; t++) {
    final l0 = lik[0][t], l1 = lik[1][t];
    final eW = math.pow(muW[0] * l0 + muW[1] * l1, g).toDouble();
    final eN = math.pow(muN[0] * l0 + muN[1] * l1 + muN[2] * lik[2][t], g).toDouble();
    var c = math.max(eW, eN);
    em[0][t] = eW;
    em[1][t] = eN;
    for (var m = 0; m < 4; m++) {
      final eR = math.pow(muR[0] * l0 + muR[1] * l1 + muR[2] * lik[2 + m][t], g).toDouble() * mark[t];
      em[2 + m][t] = eR;
      c = math.max(c, eR);
    }
    for (var k = 0; k < 6; k++) {
      em[k][t] /= c;
    }
    logC += math.log(c);
  }

  final segs = _buildSegs(
    p: p,
    latencyMedian: p.latencyMedian,
    latencySd: math.sqrt(p.latencySigmaW * p.latencySigmaW + p.latencyTau * p.latencyTau),
    skip: p.skipShare,
    nremMedian: p.nremMedian,
    nremSd: p.nremLogSd,
    remScale: 1.0,
    beta: p.beta,
    maxEpochs: tT,
  );
  final res = _runHsmm(segs, tT, em, mark);

  // Mikrostav: P(z | segment, pozorování) se zmírněnou lokální věrohodností.
  final pRem = List<double>.filled(tT, 0.0);
  final pNrem = List<double>.filled(tT, 0.0);
  final pWake = List<double>.filled(tT, 0.0);
  for (var t = 0; t < tT; t++) {
    final lw = math.pow(lik[0][t], g).toDouble();
    final ln = math.pow(lik[1][t], g).toDouble();
    final lr = math.pow(lik[2][t], g).toDouble();
    var w = 0.0, n = 0.0, r = 0.0;
    for (var ty = 0; ty < 3; ty++) {
      final mu = ty == _tN
          ? muN
          : ty == _tR
              ? muR
              : muW;
      final a = mu[0] * lw, b = mu[1] * ln, cc = mu[2] * lr;
      final s = a + b + cc;
      if (s <= 0) {
        continue;
      }
      final o = res.occ[ty][t];
      w += o * a / s;
      n += o * b / s;
      r += o * cc / s;
    }
    final tot = w + n + r;
    pWake[t] = tot > 0 ? w / tot : 0;
    pNrem[t] = tot > 0 ? n / tot : 1;
    pRem[t] = tot > 0 ? r / tot : 0;
  }
  final pRemPeriod = [for (var t = 0; t < tT; t++) res.occ[_tR][t].clamp(0.0, 1.0).toDouble()];
  double mean(_Moments m) => m.mass > 0 ? m.m1 / m.mass : 0.0;
  double variance(_Moments m) => m.mass > 0 ? math.max(0.0, m.m2 / m.mass - math.pow(m.m1 / m.mass, 2)) : 0.0;
  return RemNightPosterior._(
    night: night,
    pRem: pRem,
    pNrem: pNrem,
    pWake: pWake,
    pRemPeriod: pRemPeriod,
    logLikelihood: res.logZs + logC,
    logLikelihoodBackward: res.logZb + logC,
    latencyMass: res.lat.mass,
    latencyLogMean: mean(res.lat),
    latencyLogVar: variance(res.lat),
    skipMass: res.latSkip,
    nremMass: res.nrem.mass,
    nremLogMean: mean(res.nrem),
    nremLogVar: variance(res.nrem),
    remMass: res.rem.mass,
    remLogMean: mean(res.rem),
    remLogVar: variance(res.rem),
  );
}

/// Součin věrohodnostních poměrů značek po epochách (logaritmický pool, kap. 4.2).
List<double> _markFactors(RemNightData night, List<RemMark> marks, RemModelV2Params p) {
  final tT = night.epochs;
  final logF = List<double>.filled(tT, 0.0);
  for (final m in marks) {
    double? center;
    double sigma, lr;
    if (m.emptyNight) {
      lr = p.markEmptyLr;
      if (m.at == null) {
        center = tT * _step.toDouble();
        sigma = p.emptyNightSigmaMinutes;
      } else {
        center = _markOffset(m.at!, night);
        sigma = p.markSigmaMinutes;
      }
    } else if (m.at == null) {
      continue;
    } else {
      center = _markOffset(m.at!, night);
      lr = m.woke ? p.markWokeLr : p.markDreamLr;
      sigma = m.woke ? p.markSigmaMinutes : p.markDreamSigmaMinutes;
    }
    if (center == null) {
      continue;
    }
    final w = List<double>.filled(tT, 0.0);
    var tot = 0.0;
    for (var t = 0; t < tT; t++) {
      final z = (t * _step + _step / 2 - center) / sigma;
      w[t] = math.exp(-0.5 * z * z);
      tot += w[t];
    }
    if (tot <= 0) {
      continue;
    }
    final ll = math.log(lr);
    for (var t = 0; t < tT; t++) {
      logF[t] += ll * w[t] / tot;
    }
  }
  final cap = math.log(p.markLrCap);
  return [for (final v in logF) math.exp(v.clamp(-cap, cap))];
}

class _Moments {
  double mass = 0, m1 = 0, m2 = 0;

  void add(double w, double x) {
    mass += w;
    m1 += w * x;
    m2 += w * x * x;
  }
}

class _HsmmResult {
  _HsmmResult(this.occ, this.logZs, this.logZb, this.lat, this.latSkip, this.nrem, this.rem);
  final List<List<double>> occ;
  final double logZs, logZb;
  final _Moments lat, nrem, rem;
  final double latSkip;
}

/// Dopředný a zpětný průchod HSMM ve škálovaných pravděpodobnostech.
///
/// [em]: emise po epochách vydělené měřítkem epochy (0 bdění, 1 NREM,
/// 2–5 REM v režimech přehlédnutí). [bonus]: faktor značky pro první epochu
/// segmentu hned po REM periodě (okno 5 min po konci REM, kap. 4.2).
_HsmmResult _runHsmm(_Segs g, int tT, List<List<double>> em, List<double> bonus) {
  final nJ = g.n;
  final fB = List.generate(nJ, (_) => List<double>.filled(tT, 0.0));
  final fE = List.generate(nJ, (_) => List<double>.filled(tT, 0.0));
  final first = List<int>.filled(nJ, tT);
  fB[0][0] = 1.0;
  first[0] = 0;

  List<double> emOf(int j) => g.type[j] == _tN ? em[1] : em[0];

  for (var t = 0; t < tT; t++) {
    if (t > 0) {
      for (var j = 1; j < nJ; j++) {
        final pr = g.pred[j], pp = g.predP[j];
        var acc = 0.0;
        for (var q = 0; q < pr.length; q++) {
          acc += fE[pr[q]][t - 1] * pp[q];
        }
        if (acc > 0) {
          fB[j][t] = acc;
          if (first[j] > t) {
            first[j] = t;
          }
        }
      }
    }
    for (var j = 0; j < nJ; j++) {
      if (g.absorbing[j] || first[j] > t) {
        continue;
      }
      final f = first[j];
      final dHi = math.min(g.dMax[j], t + 1);
      final dMin = g.dMin[j];
      final pmf = g.pmf[j];
      final bj = fB[j];
      var acc = 0.0;
      if (g.type[j] == _tR) {
        final w = g.modeW[j];
        final e2 = em[2], e3 = em[3], e4 = em[4], e5 = em[5];
        var p0 = 1.0, p1 = 1.0, p2 = 1.0, p3 = 1.0;
        for (var d = 1; d <= dHi; d++) {
          final s = t - d + 1;
          if (s < f) {
            break;
          }
          p0 *= e2[s];
          p1 *= e3[s];
          p2 *= e4[s];
          p3 *= e5[s];
          if (d >= dMin) {
            final b = bj[s];
            if (b > 0) {
              acc += b * pmf[d] * (w[0] * p0 + w[1] * p1 + w[2] * p2 + w[3] * p3);
            }
          }
        }
      } else {
        final ee = emOf(j);
        final bon = g.bonusStart[j];
        var pr = 1.0;
        for (var d = 1; d <= dHi; d++) {
          final s = t - d + 1;
          if (s < f) {
            break;
          }
          pr *= ee[s];
          if (d >= dMin) {
            final b = bj[s];
            if (b > 0) {
              acc += b * pmf[d] * pr * (bon ? bonus[s] : 1.0);
            }
          }
        }
      }
      fE[j][t] = acc;
    }
  }

  // Konec záznamu: běžící segment je cenzurovaný (přežití místo délky).
  var zs = 0.0;
  for (var j = 0; j < nJ; j++) {
    if (first[j] >= tT) {
      continue;
    }
    final isR = g.type[j] == _tR;
    final w = g.modeW[j];
    final ee = emOf(j);
    final bon = g.bonusStart[j];
    var p0 = 1.0, p1 = 1.0, p2 = 1.0, p3 = 1.0, pr = 1.0;
    for (var s = tT - 1; s >= first[j]; s--) {
      final d = tT - s;
      if (!g.absorbing[j] && d > g.dMax[j]) {
        break;
      }
      double e;
      if (isR) {
        p0 *= em[2][s];
        p1 *= em[3][s];
        p2 *= em[4][s];
        p3 *= em[5][s];
        e = w[0] * p0 + w[1] * p1 + w[2] * p2 + w[3] * p3;
      } else {
        pr *= ee[s];
        e = pr * (bon ? bonus[s] : 1.0);
      }
      final b = fB[j][s];
      if (b > 0) {
        zs += b * g.surv[j][d] * e;
      }
    }
  }

  // Zpětný průchod spojený s posteriorem segmentů.
  final bS = List.generate(nJ, (_) => List<double>.filled(tT + 1, 0.0));
  final bE = List.generate(nJ, (_) => List<double>.filled(tT, 0.0));
  final diff = List.generate(3, (_) => List<double>.filled(tT + 1, 0.0));
  final lat = _Moments(), nrem = _Moments(), rem = _Moments();
  var latSkip = 0.0;
  final invZ = zs > 0 ? 1 / zs : 0.0;
  for (var s = tT - 1; s >= 0; s--) {
    if (s <= tT - 2) {
      for (var j = 0; j < nJ; j++) {
        final sc = g.succ[j], sp = g.succP[j];
        var acc = 0.0;
        for (var q = 0; q < sc.length; q++) {
          acc += sp[q] * bS[sc[q]][s + 1];
        }
        bE[j][s] = acc;
      }
    }
    for (var j = 0; j < nJ; j++) {
      final b = fB[j][s];
      if (b <= 0) {
        continue;
      }
      final ty = g.type[j];
      final isR = ty == _tR;
      final abs = g.absorbing[j];
      final eHi = abs ? tT - 1 : math.min(tT - 1, s + g.dMax[j] - 1);
      final dMin = g.dMin[j];
      final pmf = g.pmf[j];
      final sv = g.surv[j];
      final w = g.modeW[j];
      final ee = emOf(j);
      final bonF = g.bonusStart[j] ? bonus[s] : 1.0;
      final bej = bE[j];
      final dj = diff[ty];
      final cyc = g.cycle[j];
      final aw = g.afterWake[j];
      final lm = g.logMedian[j];
      var p0 = 1.0, p1 = 1.0, p2 = 1.0, p3 = 1.0, pr = 1.0;
      var acc = 0.0;
      for (var e = s; e <= eHi; e++) {
        double ev;
        if (isR) {
          p0 *= em[2][e];
          p1 *= em[3][e];
          p2 *= em[4][e];
          p3 *= em[5][e];
          ev = w[0] * p0 + w[1] * p1 + w[2] * p2 + w[3] * p3;
        } else {
          pr *= ee[e];
          ev = pr * bonF;
        }
        final d = e - s + 1;
        if (e <= tT - 2) {
          if (abs || d < dMin) {
            continue;
          }
          final term = pmf[d] * ev * bej[e];
          if (term <= 0) {
            continue;
          }
          acc += term;
          final xi = b * term * invZ;
          dj[s] += xi;
          dj[e + 1] -= xi;
          final lnD = math.log(_step * d.toDouble());
          if (j == 0) {
            if (_step * d <= 150) {
              lat.add(xi, lnD);
            } else {
              latSkip += xi;
            }
          } else if (ty == _tN && cyc >= 2 && !aw && !abs) {
            nrem.add(xi, lnD);
          } else if (isR) {
            rem.add(xi, lnD - lm);
          }
        } else {
          final term = sv[d] * ev;
          if (term <= 0) {
            continue;
          }
          acc += term;
          final xi = b * term * invZ;
          dj[s] += xi;
          dj[tT] -= xi;
          if (j == 0) {
            latSkip += xi;
          }
        }
      }
      bS[j][s] = acc;
    }
  }
  final occ = List.generate(3, (_) => List<double>.filled(tT, 0.0));
  for (var ty = 0; ty < 3; ty++) {
    var run = 0.0;
    for (var t = 0; t < tT; t++) {
      run += diff[ty][t];
      occ[ty][t] = run;
    }
  }
  final zb = bS[0][0];
  return _HsmmResult(
    occ,
    zs > 0 ? math.log(zs) : double.negativeInfinity,
    zb > 0 ? math.log(zb) : double.negativeInfinity,
    lat,
    latSkip,
    nrem,
    rem,
  );
}

// ===========================================================================
// Osobní prior (kap. 3.5)
// ===========================================================================

/// Osobní parametry cyklu pro dnešní noc (log minuty, rozptyl odhadu).
class RemPersonalPrior {
  const RemPersonalPrior({
    required this.latencyLog,
    required this.latencyVar,
    required this.nremLog,
    required this.nremVar,
    required this.remScaleLog,
    required this.remScaleVar,
    required this.skipShare,
    required this.nights,
  });

  final double latencyLog, latencyVar, nremLog, nremVar, remScaleLog, remScaleVar, skipShare;

  /// Kolik nocí přispělo do učení.
  final int nights;
}

class _LocalLevel {
  _LocalLevel(this.mu, double tau, this.sigmaW, this.q) : pVar = tau * tau;
  final double mu, sigmaW, q;
  double b = 0, pVar;

  void drift(double days) {
    pVar += q * math.max(0.0, days);
  }

  void update(double y, double v) {
    var rn = sigmaW * sigmaW + v;
    final innov = y - mu - b;
    if (innov * innov > 9 * (pVar + rn)) {
      rn *= 4;
    }
    final k = pVar / (pVar + rn);
    b += k * innov;
    pVar = (1 - k) * pVar;
  }
}

/// Kalmanův filtr místní úrovně přes posteriory nocí (nejstarší první).
RemPersonalPrior remPersonalPrior(
  List<RemNightPosterior> chronological, {
  required int tonightDay,
  RemModelV2Params params = RemModelV2Params.defaults,
}) {
  final p = params;
  final lat = _LocalLevel(math.log(p.latencyMedian), p.latencyTau, p.latencySigmaW, p.driftPerDay);
  final nr = _LocalLevel(math.log(p.nremMedian), p.nremTau, p.nremSigmaW, p.driftPerDay);
  final rs = _LocalLevel(0.0, p.remScaleTau, p.remScaleSigmaW, p.driftPerDay);
  final latPriorVar = (p.latencySigmaW * p.latencySigmaW + p.latencyTau * p.latencyTau) / p.beta;
  var skipA = p.skipShare * p.skipPriorStrength;
  var skipB = (1 - p.skipShare) * p.skipPriorStrength;
  int? lastDay;
  for (final post in chronological) {
    final day = _dayNumber(post.night.key);
    if (lastDay != null) {
      final dd = (day - lastDay).toDouble();
      lat.drift(dd);
      nr.drift(dd);
      rs.drift(dd);
    }
    lastDay = day;
    final tot = post.latencyMass + post.skipMass;
    if (tot > 0.5) {
      final ps = post.skipMass / tot;
      skipA += ps;
      skipB += 1 - ps;
      if (post.latencyMass / tot >= 0.5) {
        // Posterior noci už obsahuje populační prior latence (zmírněný β).
        // Ten se gaussovsky vydělí (posterior / prior = věrohodnost), jinak by
        // filtr táhl k populaci dvakrát. Noc bez informace (posterior skoro
        // tak široký jako prior) se přeskočí.
        final v = math.max(post.latencyLogVar, 1e-4);
        if (v < 0.9 * latPriorVar) {
          final prec = 1 / v - 1 / latPriorVar;
          lat.update((post.latencyLogMean / v - lat.mu / latPriorVar) / prec, 1 / prec);
        }
      }
    }
    if (post.nremMass >= 0.8) {
      nr.update(post.nremLogMean, post.nremLogVar / post.nremMass);
    }
    if (post.remMass >= 0.8) {
      rs.update(post.remLogMean, post.remLogVar / post.remMass);
    }
  }
  if (lastDay != null) {
    final dd = (tonightDay - lastDay).toDouble();
    lat.drift(dd);
    nr.drift(dd);
    rs.drift(dd);
  }
  return RemPersonalPrior(
    latencyLog: lat.mu + lat.b,
    latencyVar: lat.pVar,
    nremLog: nr.mu + nr.b,
    nremVar: nr.pVar,
    remScaleLog: rs.mu + rs.b,
    remScaleVar: rs.pVar,
    skipShare: skipA / (skipA + skipB),
    nights: chronological.length,
  );
}

// ===========================================================================
// Prior predictive (kap. 3.6): P(stav v čase t) bez dat dané noci
// ===========================================================================

class _Predictive {
  _Predictive(this.pW, this.pN, this.pR, this.firstShare);
  final List<double> pW, pN, pR, firstShare;
}

/// Přesná obsazenost segmentů bez pozorování; nejistota mezinočního faktoru
/// délky NREM periody přes 3 body Gauss–Hermite (cykly téže noci jsou spolu svázané).
_Predictive _priorPredictive(RemPersonalPrior prior, int horizon, RemModelV2Params p, {double beta = 1.0}) {
  final pW = List<double>.filled(horizon, 0.0);
  final pN = List<double>.filled(horizon, 0.0);
  final pR = List<double>.filled(horizon, 0.0);
  final r1 = List<double>.filled(horizon, 0.0);
  final rAll = List<double>.filled(horizon, 0.0);
  final latSd = math.sqrt(p.latencySigmaW * p.latencySigmaW + prior.latencyVar);
  final nightSd = math.sqrt(p.nremSigmaW * p.nremSigmaW + prior.nremVar);
  const nodes = [-1.7320508075688772, 0.0, 1.7320508075688772];
  const nodeW = [1 / 6, 2 / 3, 1 / 6];
  final muN = [p.wakeInNremPeriod, 1 - p.wakeInNremPeriod - p.remInNremPeriod, p.remInNremPeriod];
  final muR = [p.wakeInRemPeriod, 1 - p.wakeInRemPeriod - p.remInRemPeriod, p.remInRemPeriod];
  final muW = [p.wakeInWakePeriod, 1 - p.wakeInWakePeriod, 0.0];
  for (var q = 0; q < 3; q++) {
    final g = _buildSegs(
      p: p,
      latencyMedian: math.exp(prior.latencyLog),
      latencySd: latSd,
      skip: prior.skipShare,
      nremMedian: math.exp(prior.nremLog + nightSd * nodes[q]),
      nremSd: p.nremWithinNightLogSd,
      remScale: math.exp(prior.remScaleLog),
      beta: beta,
      maxEpochs: horizon,
    );
    final occ = _occupancy(g, horizon);
    for (var t = 0; t < horizon; t++) {
      var w = 0.0, n = 0.0, r = 0.0;
      for (var j = 0; j < g.n; j++) {
        final o = occ[j][t];
        if (o == 0) {
          continue;
        }
        final mu = g.type[j] == _tN
            ? muN
            : g.type[j] == _tR
                ? muR
                : muW;
        w += o * mu[0];
        n += o * mu[1];
        r += o * mu[2];
        if (g.type[j] == _tR) {
          rAll[t] += nodeW[q] * o;
          if (g.cycle[j] == 1) {
            r1[t] += nodeW[q] * o;
          }
        }
      }
      final tot = w + n + r;
      if (tot > 0) {
        pW[t] += nodeW[q] * w / tot;
        pN[t] += nodeW[q] * n / tot;
        pR[t] += nodeW[q] * r / tot;
      } else {
        pN[t] += nodeW[q];
      }
    }
  }
  final f1 = [for (var t = 0; t < horizon; t++) rAll[t] > 0 ? r1[t] / rAll[t] : 0.0];
  return _Predictive(pW, pN, pR, f1);
}

/// occ[j][t] = P(segment j běží v epoše t) bez pozorování.
List<List<double>> _occupancy(_Segs g, int horizon) {
  final nJ = g.n;
  final start = List.generate(nJ, (_) => List<double>.filled(horizon, 0.0));
  final occ = List.generate(nJ, (_) => List<double>.filled(horizon, 0.0));
  start[0][0] = 1.0;
  for (var j = 0; j < nJ; j++) {
    final st = start[j];
    if (j > 0) {
      final pr = g.pred[j], pp = g.predP[j];
      for (var q = 0; q < pr.length; q++) {
        final endI = _endDist(g, pr[q], start[pr[q]], horizon);
        for (var s = 1; s < horizon; s++) {
          st[s] += pp[q] * endI[s - 1];
        }
      }
    }
    final sv = g.surv[j];
    final abs = g.absorbing[j];
    final dMax = g.dMax[j];
    final oc = occ[j];
    for (var s = 0; s < horizon; s++) {
      final b = st[s];
      if (b <= 1e-15) {
        continue;
      }
      final tHi = abs ? horizon - 1 : math.min(horizon - 1, s + dMax - 1);
      for (var t = s; t <= tHi; t++) {
        oc[t] += b * sv[t - s + 1];
      }
    }
  }
  return occ;
}

List<double> _endDist(_Segs g, int j, List<double> st, int horizon) {
  final out = List<double>.filled(horizon, 0.0);
  if (g.absorbing[j]) {
    return out;
  }
  final pmf = g.pmf[j];
  final dMin = g.dMin[j], dMax = g.dMax[j];
  for (var s = 0; s < horizon; s++) {
    final b = st[s];
    if (b <= 1e-15) {
      continue;
    }
    for (var d = dMin; d <= dMax; d++) {
      final e = s + d - 1;
      if (e >= horizon) {
        break;
      }
      out[e] += b * pmf[d];
    }
  }
  return out;
}

// ===========================================================================
// Úrovně a okna (sdílené s baseline)
// ===========================================================================

/// Pravidla úrovní: prahy relativně k vrcholu, strop `high`, nejkratší okno.
class RemLevelRules {
  const RemLevelRules({
    required this.levelLow,
    required this.levelMid,
    required this.levelHigh,
    required this.maxHighShare,
    required this.minWindowMinutes,
    this.stepMinutes = 5,
  });

  final double levelLow, levelMid, levelHigh, maxHighShare;
  final int minWindowMinutes, stepMinutes;

  /// Stejná logika jako [remLevel] z appky (bez závislosti na její třídě parametrů).
  RemLevel levelOf(double relative, [double? highCut]) => relative >= (highCut ?? levelHigh)
      ? RemLevel.high
      : relative >= levelMid
          ? RemLevel.mid
          : relative >= levelLow
              ? RemLevel.low
              : RemLevel.unlikely;
}

/// Souvislý úsek stejné úrovně v epochách [from, to).
class RemLevelRun {
  const RemLevelRun(this.from, this.to, this.level, this.peak);
  final int from, to;
  final RemLevel level;
  final double peak;
}

/// Úrovně z hodnot po epochách (stejně jako [remLevel]):
/// 1. relativně k vrcholu, práh `high` zvednutý tak, aby `high` mělo nejvýš
///    [RemLevelRules.maxHighShare] epoch;
/// 2. úseky kratší než [RemLevelRules.minWindowMinutes] se sloučí se
///    sousedem s nejbližší úrovní (při shodě s nižší);
/// 3. když by `high` po sloučení přesáhlo strop, sníží se nejkratší úsek `high` na `mid`.
///
/// [shareBase]: počet epoch, ke kterým se vztahuje strop `high` (výchozí
/// délka [values]; v2 dává očekávanou délku spánku).
List<RemLevelRun> remLevelRuns(List<double> values, RemLevelRules r, {double? shareBase}) {
  final n = values.length;
  if (n == 0) {
    return const [];
  }
  var peak = 0.0;
  for (final v in values) {
    peak = math.max(peak, v);
  }
  final rel = [for (final v in values) peak > 0 ? v / peak : 0.0];
  final allowed = (r.maxHighShare * math.min(n.toDouble(), shareBase ?? n.toDouble()) + 1e-9).floor();
  double? highCut;
  final above = rel.where((v) => v >= r.levelHigh).length;
  if (above > allowed) {
    final sorted = [...rel]..sort((a, b) => b.compareTo(a));
    if (allowed == 0) {
      highCut = 2.0;
    } else {
      final v = sorted[allowed];
      highCut = 2.0;
      for (var i = allowed - 1; i >= 0; i--) {
        if (sorted[i] > v) {
          highCut = sorted[i];
          break;
        }
      }
    }
  }
  final lv = [for (final v in rel) r.levelOf(v, highCut)];

  // Úseky.
  final runs = <List<int>>[]; // [from, to, levelIndex]
  for (var i = 0; i < n; i++) {
    if (runs.isNotEmpty && runs.last[2] == lv[i].index) {
      runs.last[1] = i + 1;
    } else {
      runs.add([i, i + 1, lv[i].index]);
    }
  }
  final minLen = (r.minWindowMinutes / r.stepMinutes).ceil();
  while (runs.length > 1) {
    var idx = -1;
    for (var i = 0; i < runs.length; i++) {
      final len = runs[i][1] - runs[i][0];
      if (len >= minLen) {
        continue;
      }
      if (idx < 0) {
        idx = i;
        continue;
      }
      final best = runs[idx][1] - runs[idx][0];
      if (len < best || (len == best && runs[i][2] < runs[idx][2])) {
        idx = i;
      }
    }
    if (idx < 0) {
      break;
    }
    final me = runs[idx][2];
    int target;
    if (idx == 0) {
      target = 1;
    } else if (idx == runs.length - 1) {
      target = idx - 1;
    } else {
      final dl = (runs[idx - 1][2] - me).abs(), dr = (runs[idx + 1][2] - me).abs();
      if (dl != dr) {
        target = dl < dr ? idx - 1 : idx + 1;
      } else {
        target = runs[idx - 1][2] <= runs[idx + 1][2] ? idx - 1 : idx + 1;
      }
    }
    final lvl = runs[target][2];
    runs[idx][2] = lvl;
    _mergeRuns(runs);
  }
  // Strop high po sloučení.
  int highCount() => runs.where((u) => u[2] == RemLevel.high.index).fold(0, (a, u) => a + u[1] - u[0]);
  while (highCount() > allowed) {
    var idx = -1;
    for (var i = 0; i < runs.length; i++) {
      if (runs[i][2] != RemLevel.high.index) {
        continue;
      }
      if (idx < 0 || runs[i][1] - runs[i][0] < runs[idx][1] - runs[idx][0]) {
        idx = i;
      }
    }
    runs[idx][2] = RemLevel.mid.index;
    _mergeRuns(runs);
  }
  return [
    for (final u in runs)
      RemLevelRun(u[0], u[1], RemLevel.values[u[2]], [for (var i = u[0]; i < u[1]; i++) rel[i]].reduce(math.max)),
  ];
}

void _mergeRuns(List<List<int>> runs) {
  var i = 1;
  while (i < runs.length) {
    if (runs[i][2] == runs[i - 1][2]) {
      runs[i - 1][1] = runs[i][1];
      runs.removeAt(i);
    } else {
      i++;
    }
  }
}

// ===========================================================================
// Matematika
// ===========================================================================

/// Φ(x), přes erfc z Numerical Recipes (relativní chyba < 1,2e-7).
double _normCdf(double x) => 0.5 * _erfc(-x / math.sqrt2);

double _erfc(double x) {
  const c = [
    -1.26551223,
    1.00002368,
    0.37409196,
    0.09678418,
    -0.18628806,
    0.27886807,
    -1.13520398,
    1.48851587,
    -0.82215223,
    0.17087277,
  ];
  final z = x.abs();
  final t = 1 / (1 + 0.5 * z);
  var poly = 0.0;
  for (var i = c.length - 1; i >= 0; i--) {
    poly = c[i] + t * poly;
  }
  final r = t * math.exp(-z * z + poly);
  return x >= 0 ? r : 2 - r;
}

double _lnGamma(double x) {
  const g = [
    76.18009172947146,
    -86.50532032941677,
    24.01409824083091,
    -1.231739572450155,
    0.1208650973866179e-2,
    -0.5395239384953e-5,
  ];
  var y = x;
  var tmp = x + 5.5;
  tmp -= (x + 0.5) * math.log(tmp);
  var ser = 1.000000000190015;
  for (final c in g) {
    y += 1;
    ser += c / y;
  }
  return -tmp + math.log(2.5066282746310005 * ser / x);
}

/// Regularizovaná neúplná beta I_x(a, b) (řetězový zlomek, Numerical Recipes).
double remBetaInc(double a, double b, double x) {
  if (x <= 0) {
    return 0;
  }
  if (x >= 1) {
    return 1;
  }
  final lbt = _lnGamma(a + b) - _lnGamma(a) - _lnGamma(b) + a * math.log(x) + b * math.log(1 - x);
  if (x < (a + 1) / (a + b + 2)) {
    return math.exp(lbt) * _betaCf(a, b, x) / a;
  }
  return 1 - math.exp(lbt) * _betaCf(b, a, 1 - x) / b;
}

double _betaCf(double a, double b, double x) {
  const fpmin = 1e-300;
  final qab = a + b, qap = a + 1, qam = a - 1;
  var c = 1.0;
  var d = 1 - qab * x / qap;
  if (d.abs() < fpmin) {
    d = fpmin;
  }
  d = 1 / d;
  var h = d;
  for (var m = 1; m <= 300; m++) {
    final m2 = 2 * m;
    var aa = m * (b - m) * x / ((qam + m2) * (a + m2));
    d = 1 + aa * d;
    if (d.abs() < fpmin) {
      d = fpmin;
    }
    c = 1 + aa / c;
    if (c.abs() < fpmin) {
      c = fpmin;
    }
    d = 1 / d;
    h *= d * c;
    aa = -(a + m) * (qab + m) * x / ((a + m2) * (qap + m2));
    d = 1 + aa * d;
    if (d.abs() < fpmin) {
      d = fpmin;
    }
    c = 1 + aa / c;
    if (c.abs() < fpmin) {
      c = fpmin;
    }
    d = 1 / d;
    final del = d * c;
    h *= del;
    if ((del - 1).abs() < 3e-12) {
      break;
    }
  }
  return h;
}

/// Kvantil Beta(a, b) bisekcí (40 kroků, přesnost ~1e-12).
double _betaQuantile(double a, double b, double q) {
  var lo = 0.0, hi = 1.0;
  for (var i = 0; i < 40; i++) {
    final mid = (lo + hi) / 2;
    if (remBetaInc(a, b, mid) < q) {
      lo = mid;
    } else {
      hi = mid;
    }
  }
  return (lo + hi) / 2;
}
