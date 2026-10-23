/// Osobní laboratoř: výpočet experimentů N-of-1 (jedna osoba, dvě varianty A a B).
///
/// Čistý Dart 3.6, jen `dart:math`. Žádný Flutter, žádné I/O. Všechno je
/// deterministické: Monte Carlo i plánovač používají vlastní generátor
/// s pevným seedem a 32bitovou aritmetikou (ověřeno na Dart VM; na webu by
/// měl dát stejnou posloupnost, testované to tam není).
///
/// Přehled modelů (podrobné zdůvodnění v `self_check_b.md`):
/// * `lucid` (ano/ne za noc): beta-binomický model, stejný prior Beta(1, 9)
///   pro obě varianty (průměr 10 %, váha 10 nocí; odpovídá 5–15 % LD nocí
///   u praktikujících a 16–20 % v nejlepších domácích studiích, Aspy 2017, 2020).
///   Rozdíl d = pB − pA a pravděpodobnosti z 20 000 tahů Monte Carlo.
/// * `recall`, `vividness`, `lucidity`, `sleepFeeling`: bayesovský t-model
///   (normální regrese se sdruženým priorem): y = průměr + d · varianta +
///   lineární trend v čase. Na d skeptický prior N(0, σ²/κ0), na rozptyl
///   slabý prior s váhou 2 nocí. Výsledek pro d je Studentovo t, tedy těžší
///   konce při malém vzorku. Trend (učení se) se odečítá, takže rozdíl
///   není zkreslený tím, že se technika časem zlepšuje.
/// * Verdikt slovy, čísla jen v detailu (appka neukazuje procenta jistoty
///   bez kalibrace).
library;

import 'dart:math' as math;

// ---------------------------------------------------------------------------
// Vstup
// ---------------------------------------------------------------------------

/// Jedna noc experimentu. `arm` je "A" nebo "B"; jiné hodnoty se do výpočtu
/// nepočítají (např. noc vyřazená před odhalením). `null` = údaj chybí.
class Nof1Night {
  const Nof1Night({
    required this.night,
    required this.arm,
    this.lucid,
    this.recall,
    this.vividness,
    this.lucidity,
    this.sleepFeeling,
  });

  final DateTime night;
  final String arm;
  final bool? lucid;
  final int? recall;
  final int? vividness;
  final int? lucidity;
  final int? sleepFeeling;

  /// Lucidní noc: explicitní `lucid`, jinak lucidita ≥ 5 z 10 (definice ze specifikace).
  bool? get effectiveLucid {
    final l = lucid;
    if (l != null) {
      return l;
    }
    final s = lucidity;
    if (s == null) {
      return null;
    }
    return s >= 5;
  }

  /// Hodnota výsledku jako číslo (lucid 0/1), oříznutá do platného rozsahu.
  double? value(Nof1Outcome outcome) {
    switch (outcome) {
      case Nof1Outcome.lucid:
        final l = effectiveLucid;
        if (l == null) {
          return null;
        }
        return l ? 1.0 : 0.0;
      case Nof1Outcome.recall:
        return _clampInt(recall, outcome.maxValue);
      case Nof1Outcome.vividness:
        return _clampInt(vividness, outcome.maxValue);
      case Nof1Outcome.lucidity:
        return _clampInt(lucidity, outcome.maxValue);
      case Nof1Outcome.sleepFeeling:
        return _clampInt(sleepFeeling, outcome.maxValue);
    }
  }

  static double? _clampInt(int? v, int max) {
    if (v == null) {
      return null;
    }
    return v.clamp(0, max).toDouble();
  }
}

// ---------------------------------------------------------------------------
// Výsledky (outcomes) a jejich parametry
// ---------------------------------------------------------------------------

/// Měřené výsledky. Vyšší hodnota je vždy lepší.
///
/// `rope` je oblast praktické shody (Kruschke 2018): menší rozdíl na jedné
/// osobě nepoznáme a nemá cenu kvůli němu měnit zvyk.
/// * lucid 0,05: 5 lucidních nocí ze 100, tedy jedna navíc za 20 nocí.
/// * recall 0,3 snu za noc: zhruba 2 vybavené sny týdně navíc.
/// * škály 0–10: 0,5 bodu, pod rozlišením celočíselné škály.
///
/// `minPerArm` je spodní mez nocí s údajem na variantu, pod ní je vždy
/// `tooEarly`. U lucidní noci 10 (vzácná událost, specifikace TOP 4),
/// jinde 5 (pod 5 nocí t-model stojí hlavně na prioru).
///
/// `priorSd` je předběžný odhad kolísání z noci na noc (σ0) pro t-model:
/// u počtu snů 1 sen, u škál 2 body. Váha jen 2 noci, data ho rychle přebijí.
enum Nof1Outcome {
  lucid(rope: 0.05, minPerArm: 10, priorSd: 0.3, maxValue: 1, binary: true),
  recall(rope: 0.3, minPerArm: 5, priorSd: 1.0, maxValue: 10),
  vividness(rope: 0.5, minPerArm: 5, priorSd: 2.0, maxValue: 10),
  lucidity(rope: 0.5, minPerArm: 5, priorSd: 2.0, maxValue: 10),
  sleepFeeling(rope: 0.5, minPerArm: 5, priorSd: 2.0, maxValue: 10);

  const Nof1Outcome({
    required this.rope,
    required this.minPerArm,
    required this.priorSd,
    required this.maxValue,
    this.binary = false,
  });

  final double rope;
  final int minPerArm;
  final double priorSd;
  final int maxValue;
  final bool binary;

  static Nof1Outcome parse(String name) {
    for (final o in Nof1Outcome.values) {
      if (o.name == name) {
        return o;
      }
    }
    throw ArgumentError.value(name, 'outcome', 'Neznámý výsledek');
  }
}

/// Slovní verdikt. Pořadí priorit: clear > noDifference > lean > tooEarly.
enum Nof1Verdict { tooEarly, noDifference, leanA, leanB, clearA, clearB }

/// Proč je verdikt `tooEarly`.
enum Nof1Reason {
  /// Málo nocí s údajem na variantu.
  fewNights,

  /// Nocí je dost, ale data zatím nerozhodla (dá se prodloužit).
  inconclusive,

  /// Poslední kontrolní bod bez verdiktu: rozdíl je menší, než umíme poznat.
  inconclusiveAtMax,
}

/// Štítky k výsledku (texty `lab.flag.<name>`).
enum Nof1Flag {
  /// Rozdíl mezi variantami se v průběhu experimentu výrazně měnil.
  changesOverTime,

  /// Víc než 30 % nocí bez údaje.
  manyMissing,

  /// Varianty jsou nerovnoměrně zastoupené nebo rozložené v čase.
  unbalanced,

  /// Varianta nešla zaslepit: část rozdílu může být očekávání.
  unblinded,

  /// Pohled mimo kontrolní bod: zvyšuje riziko omylu.
  earlyLook,
}

/// Prahy rozhodovacích pravidel.
///
/// Výchozí `standard` je pravidlo ze specifikace TOP 4: „vychází lépe“ jen
/// když P(d > 0) ≥ 0,95 a zároveň P(d > ROPE) ≥ 0,80, „prakticky stejné“
/// když P(|d| < ROPE) ≥ 0,80. Simulace ve specifikaci ukázaly, že jeden
/// pohled s volnějšími prahy (0,90 a 0,70) dává při nulovém rozdílu
/// falešný verdikt až u 30 % lidí, proto se nepoužívají.
///
/// Mezistupeň `leanA` / `leanB` („náznak“) se smí ukázat jen v závěrečném
/// kontrolním bodě (`finalLook`), nikdy průběžně, a vždy se slovem „náznak“:
/// P(d > 0) ≥ 0,90 a odhad je mimo ROPE (P(d > ROPE) ≥ 0,50). Při nulovém
/// rozdílu vychází náznak zhruba u 1 z 10 experimentů, proto ho appka
/// nikdy nepodává jako závěr (míry z simulací v `self_check_b.md`).
class Nof1Thresholds {
  const Nof1Thresholds({
    required this.direction,
    required this.beyondRope,
    required this.equivalence,
    required this.leanDirection,
    required this.leanBeyondRope,
  });

  /// P(d > 0) pro jasný verdikt.
  final double direction;

  /// P(d > ROPE) pro jasný verdikt.
  final double beyondRope;

  /// P(|d| < ROPE) pro „prakticky stejné“.
  final double equivalence;

  /// P(d > 0) pro náznak.
  final double leanDirection;

  /// P(d > ROPE) pro náznak.
  final double leanBeyondRope;

  /// Výchozí pravidlo (specifikace TOP 4).
  static const standard = Nof1Thresholds(
    direction: 0.95,
    beyondRope: 0.80,
    equivalence: 0.80,
    leanDirection: 0.90,
    leanBeyondRope: 0.50,
  );

  /// Přísné pravidlo pro ty, kdo chtějí méně omylů za cenu delšího čekání.
  static const strict = Nof1Thresholds(
    direction: 0.975,
    beyondRope: 0.85,
    equivalence: 0.85,
    leanDirection: 0.95,
    leanBeyondRope: 0.60,
  );
}

// ---------------------------------------------------------------------------
// Výstup
// ---------------------------------------------------------------------------

/// Čísla pro obrazovku „Jak to počítám“. Nikdy je neukazuj jako procenta
/// jistoty: jsou to pravděpodobnosti modelu, ne kalibrovaná četnost.
class Nof1Detail {
  const Nof1Detail({
    required this.model,
    required this.nA,
    required this.nB,
    required this.missing,
    required this.rawMeanA,
    required this.rawMeanB,
    required this.estimateA,
    required this.estimateB,
    required this.effect,
    required this.lower,
    required this.upper,
    required this.probBHigher,
    required this.probBHigherByMargin,
    required this.probAHigherByMargin,
    required this.probPracticallySame,
    required this.rope,
    required this.trendAdjusted,
    required this.minPerArm,
    this.intervalLevel = 0.90,
  });

  /// `betaBinomial` nebo `tModel`.
  final String model;
  final int nA;
  final int nB;

  /// Noci v experimentu bez tohoto údaje.
  final int missing;

  /// Prosté průměry (u lucid podíl lucidních nocí). `null` když varianta nemá data.
  final double? rawMeanA;
  final double? rawMeanB;

  /// Odhad modelu (u lucid střed posterioru, jinak upravený o trend).
  final double? estimateA;
  final double? estimateB;

  /// Odhad rozdílu B − A (medián posterioru).
  final double? effect;

  /// 90% interval rozdílu B − A.
  final double? lower;
  final double? upper;

  /// P(d > 0).
  final double? probBHigher;

  /// P(d > ROPE).
  final double? probBHigherByMargin;

  /// P(d < −ROPE).
  final double? probAHigherByMargin;

  /// P(|d| ≤ ROPE).
  final double? probPracticallySame;
  final double rope;
  final bool trendAdjusted;

  /// Minimum nocí s údajem na variantu, od kterého se vyhodnocuje.
  final int minPerArm;
  final double intervalLevel;

  bool get hasEstimate => effect != null;
}

/// Řádek textu: klíč do `lab.*` a hodnoty pro zástupné symboly `{x}`.
class Nof1Line {
  const Nof1Line(this.key, [this.args = const {}]);

  final String key;
  final Map<String, String> args;

  @override
  String toString() => '$key $args';
}

/// Výsledek jednoho výstupu.
class Nof1OutcomeResult {
  const Nof1OutcomeResult({
    required this.outcome,
    required this.verdict,
    required this.reason,
    required this.flags,
    required this.detail,
  });

  final Nof1Outcome outcome;
  final Nof1Verdict verdict;
  final Nof1Reason? reason;
  final List<Nof1Flag> flags;
  final Nof1Detail detail;

  /// `lab.verdict.<verdict>.title` a `.body`.
  String get titleKey => 'lab.verdict.${verdict.name}.title';
  String get bodyKey => 'lab.verdict.${verdict.name}.body';

  /// Doplňující věta k `tooEarly`, jinak `null`. `{min}` = minimum nocí na variantu.
  String? get reasonKey => reason == null ? null : 'lab.reason.${reason!.name}';

  Nof1Line? get reasonLine =>
      reason == null ? null : Nof1Line('lab.reason.${reason!.name}', {'min': '${detail.minPerArm}'});

  /// Varianta, ke které verdikt míří ("A" / "B"), jinak `null`. Appka jí do
  /// textů verdiktu dosadí `{arm}` (popisek varianty ze šablony).
  String? get favoredArm => switch (verdict) {
        Nof1Verdict.leanA || Nof1Verdict.clearA => 'A',
        Nof1Verdict.leanB || Nof1Verdict.clearB => 'B',
        _ => null,
      };

  /// Čísla se neukazují, dokud nemá každá varianta minimum nocí (brání honbě za výsledkem).
  bool get showsNumbers => detail.hasEstimate && reason != Nof1Reason.fewNights;

  String get _unit => outcome.binary ? 'lucid' : (outcome == Nof1Outcome.recall ? 'recall' : 'scale');

  List<String> get flagKeys => [for (final f in flags) 'lab.flag.${f.name}'];

  /// Lidské vysvětlení odhadu bez procent jistoty. `null`, když zatím není co
  /// vysvětlovat. U lucidní noci přirozené četnosti z modelu („ze 100 nocí“,
  /// Gigerenzer a Hoffrage 1995), u škál a počtů naměřené průměry a pásmo
  /// rozdílu z modelu (model je kvůli skeptickému prioru zpočátku opatrnější
  /// než prostý rozdíl průměrů, proto text říká obojí).
  Nof1Line? get explanation {
    final d = detail;
    if (!showsNumbers || d.estimateA == null || d.estimateB == null) {
      return null;
    }
    if (outcome.binary) {
      return Nof1Line('lab.explain.lucid', {
        'a': formatCz(d.estimateA! * 100, digits: 0),
        'b': formatCz(d.estimateB! * 100, digits: 0),
        'lo': formatCz(d.lower! * 100, digits: 0),
        'hi': formatCz(d.upper! * 100, digits: 0),
      });
    }
    return Nof1Line('lab.explain.${outcome.name}', {
      'a': formatCz(d.rawMeanA!),
      'b': formatCz(d.rawMeanB!),
      'lo': formatCz(d.lower!),
      'hi': formatCz(d.upper!),
    });
  }

  /// Řádky pro detail „Jak to počítám“. Pravděpodobnosti jako desetinné číslo,
  /// vždy s poznámkou `lab.detail.note`.
  List<Nof1Line> get detailLines {
    final d = detail;
    final lines = <Nof1Line>[
      Nof1Line('lab.detail.nights', {'a': '${d.nA}', 'b': '${d.nB}'}),
      if (d.missing > 0) Nof1Line('lab.detail.missing', {'n': '${d.missing}'}),
      Nof1Line('lab.detail.model.${d.model}'),
      Nof1Line(outcome.binary ? 'lab.detail.prior.lucid' : 'lab.detail.prior.scale'),
      if (d.trendAdjusted) const Nof1Line('lab.detail.trendAdjusted'),
      Nof1Line('lab.detail.rope.$_unit',
          {'rope': formatCz(outcome.binary ? d.rope * 100 : d.rope, digits: outcome.binary ? 0 : 1)}),
    ];
    if (showsNumbers) {
      final scale = outcome.binary ? 100.0 : 1.0;
      final digits = outcome.binary ? 0 : 1;
      lines.add(Nof1Line('lab.detail.effect.$_unit', {
        'd': formatCz(d.effect! * scale, digits: digits),
        'lo': formatCz(d.lower! * scale, digits: digits),
        'hi': formatCz(d.upper! * scale, digits: digits),
      }));
      lines.add(Nof1Line('lab.detail.probs', {
        'pB': formatCz(d.probBHigher!, digits: 2),
        'pBm': formatCz(d.probBHigherByMargin!, digits: 2),
        'pAm': formatCz(d.probAHigherByMargin!, digits: 2),
        'pSame': formatCz(d.probPracticallySame!, digits: 2),
      }));
    }
    lines.add(const Nof1Line('lab.detail.note'));
    return lines;
  }
}

/// Výsledek celého experimentu: hlavní výstup a vedlejší.
class Nof1Report {
  const Nof1Report({required this.primary, required this.secondary, required this.nightsA, required this.nightsB});

  final Nof1OutcomeResult primary;

  /// Vedlejší výstupy: jen doplněk, rozhoduje hlavní (víc výstupů = víc náhodných nálezů).
  final List<Nof1OutcomeResult> secondary;
  final int nightsA;
  final int nightsB;
}

// ---------------------------------------------------------------------------
// Analýza
// ---------------------------------------------------------------------------

/// Výchozí seed, aby stejná data dala vždy stejná čísla.
const int nof1DefaultSeed = 20261023;

/// Skeptický prior na rozdíl v t-modelu: d ~ N(0, σ²/κ0), κ0 = 3 „noci“.
/// Ve standardizovaných jednotkách SD 0,58: střední a velké efekty povoluje,
/// náhodné výkyvy malých vzorků tlumí. Vybráno simulací (self_check_b.md):
/// s κ0 = 2 vycházel u šikmých dat (lucidita s mnoha nulami, rozptýlené
/// počty snů) falešný jasný verdikt přes všechny kontrolní body 13–14 %,
/// s κ0 = 3 nejvýš kolem 10 % a na 14 nocích s jedním pohledem asi 2 %.
/// κ0 = 4 by chybovost snížilo jen málo, ale ubralo sílu.
const double nof1EffectPriorNights = 3.0;

/// Váha prioru na rozptyl v t-modelu (počet „nocí“).
const double nof1VariancePriorNights = 2.0;

/// Analyzuje jeden výstup.
///
/// * [minNightsPerArm]: minimum ze šablony; použije se větší z něj a z
///   `outcome.minPerArm`.
/// * [finalLook]: závěrečný kontrolní bod (konec plánu nebo prodloužení).
///   Jen tehdy se smí ukázat náznak (`leanA` / `leanB`).
/// * [canExtend]: jde ještě prodloužit? Rozhoduje mezi `inconclusive` a
///   `inconclusiveAtMax`.
/// * [atCheckpoint]: `false` = předčasný pohled, přidá štítek `earlyLook`.
/// * [blinded]: zaslepený experiment (naše šablony nejsou, přidá se `unblinded`).
/// * [lucidPriorMean]: střed prioru pro lucidní noc (výchozí 10 %); po
///   výchozím týdnu se smí posunout na osobní odhad, ořízne se na 3–25 %.
/// * [seed], [draws]: Monte Carlo pro lucid (deterministické).
Nof1OutcomeResult analyzeOutcome(
  List<Nof1Night> nights,
  Nof1Outcome outcome, {
  int minNightsPerArm = 0,
  Nof1Thresholds thresholds = Nof1Thresholds.standard,
  bool finalLook = true,
  bool canExtend = true,
  bool atCheckpoint = true,
  bool blinded = false,
  bool adjustTrend = true,
  double lucidPriorMean = 0.10,
  double lucidPriorWeight = 10,
  int seed = nof1DefaultSeed,
  int draws = 20000,
}) {
  final obs = <_Obs>[];
  var missing = 0;
  DateTime? first;
  for (final n in nights) {
    if (n.arm != 'A' && n.arm != 'B') {
      continue;
    }
    final day = _dayIndex(n.night);
    if (first == null || day < _dayIndex(first)) {
      first = n.night;
    }
    final v = n.value(outcome);
    if (v == null) {
      missing++;
      continue;
    }
    obs.add(_Obs(day.toDouble(), n.arm == 'B', v));
  }
  final nB = obs.where((o) => o.isB).length;
  final nA = obs.length - nB;
  final floor = math.max(minNightsPerArm, outcome.minPerArm);

  _Post? post;
  if (nA >= 1 && nB >= 1) {
    if (outcome.binary) {
      post = _betaModel(obs, outcome.rope, lucidPriorMean, lucidPriorWeight, seed, draws);
    } else {
      post = _tModel(obs, outcome, adjustTrend: adjustTrend);
    }
  }

  // Verdikt.
  Nof1Verdict verdict;
  Nof1Reason? reason;
  if (nA < floor || nB < floor || post == null) {
    verdict = Nof1Verdict.tooEarly;
    reason = Nof1Reason.fewNights;
  } else {
    final t = thresholds;
    final pSame = post.pSame;
    if (post.pPos >= t.direction && post.pAbove >= t.beyondRope) {
      verdict = Nof1Verdict.clearB;
    } else if (1 - post.pPos >= t.direction && post.pBelow >= t.beyondRope) {
      verdict = Nof1Verdict.clearA;
    } else if (pSame >= t.equivalence) {
      verdict = Nof1Verdict.noDifference;
    } else if (finalLook && post.pPos >= t.leanDirection && post.pAbove >= t.leanBeyondRope) {
      verdict = Nof1Verdict.leanB;
    } else if (finalLook && 1 - post.pPos >= t.leanDirection && post.pBelow >= t.leanBeyondRope) {
      verdict = Nof1Verdict.leanA;
    } else {
      verdict = Nof1Verdict.tooEarly;
      reason = (finalLook && !canExtend) ? Nof1Reason.inconclusiveAtMax : Nof1Reason.inconclusive;
    }
  }

  // Štítky.
  final flags = <Nof1Flag>[];
  if (post != null && post.changesOverTime) {
    flags.add(Nof1Flag.changesOverTime);
  }
  final total = obs.length + missing;
  if (total > 0 && missing / total > 0.30) {
    flags.add(Nof1Flag.manyMissing);
  }
  final lo = math.min(nA, nB), hi = math.max(nA, nB);
  if ((lo > 0 && hi > 1.5 * lo && hi - lo >= 3) || (post != null && post.armTimeCorrelation.abs() > 0.5)) {
    flags.add(Nof1Flag.unbalanced);
  }
  if (!blinded) {
    flags.add(Nof1Flag.unblinded);
  }
  if (!atCheckpoint) {
    flags.add(Nof1Flag.earlyLook);
  }

  double? mean(bool b) {
    final xs = [
      for (final o in obs)
        if (o.isB == b) o.y
    ];
    if (xs.isEmpty) {
      return null;
    }
    return xs.reduce((a, c) => a + c) / xs.length;
  }

  return Nof1OutcomeResult(
    outcome: outcome,
    verdict: verdict,
    reason: reason,
    flags: flags,
    detail: Nof1Detail(
      model: outcome.binary ? 'betaBinomial' : 'tModel',
      nA: nA,
      nB: nB,
      missing: missing,
      rawMeanA: mean(false),
      rawMeanB: mean(true),
      estimateA: post?.estA,
      estimateB: post?.estB,
      effect: post?.effect,
      lower: post?.lo,
      upper: post?.hi,
      probBHigher: post?.pPos,
      probBHigherByMargin: post?.pAbove,
      probAHigherByMargin: post?.pBelow,
      probPracticallySame: post?.pSame,
      rope: outcome.rope,
      trendAdjusted: post?.trendAdjusted ?? false,
      minPerArm: floor,
    ),
  );
}

/// Analyzuje celý experiment. [outcomes] a [primary] jsou názvy ze šablony.
Nof1Report analyzeExperiment(
  List<Nof1Night> nights, {
  required List<String> outcomes,
  required String primary,
  int minNightsPerArm = 0,
  Nof1Thresholds thresholds = Nof1Thresholds.standard,
  bool finalLook = true,
  bool canExtend = true,
  bool atCheckpoint = true,
  bool blinded = false,
  double lucidPriorMean = 0.10,
  int seed = nof1DefaultSeed,
}) {
  Nof1OutcomeResult run(String name) {
    final o = Nof1Outcome.parse(name);
    return analyzeOutcome(
      nights,
      o,
      minNightsPerArm: minNightsPerArm,
      thresholds: thresholds,
      finalLook: finalLook,
      canExtend: canExtend,
      atCheckpoint: atCheckpoint,
      blinded: blinded,
      lucidPriorMean: lucidPriorMean,
      seed: seed + 7919 * o.index,
    );
  }

  final p = run(primary);
  final others = [
    for (final o in outcomes)
      if (o != primary) run(o)
  ];
  return Nof1Report(
    primary: p,
    secondary: others,
    nightsA: nights.where((n) => n.arm == 'A').length,
    nightsB: nights.where((n) => n.arm == 'B').length,
  );
}

// ---------------------------------------------------------------------------
// Kontrolní body
// ---------------------------------------------------------------------------

/// Kontrolní body (počet nocí experimentu celkem), mimo ně se nevyhodnocuje.
///
/// Průběžný pohled v polovině (jen u plánů od 20 nocí), konec plánu a nejvýš
/// dvě prodloužení po 14 nocích. Celkem nejvýš 4 pohledy jako ve specifikaci
/// (10/20/30/40 nocí na variantu): každý pohled navíc zvyšuje šanci na
/// náhodný verdikt, proto jsou prahy přísnější než pro jeden pohled.
List<int> checkpoints(int nights) {
  if (nights < 2) {
    throw ArgumentError.value(nights, 'nights', 'Aspoň 2 noci');
  }
  final looks = <int>[];
  if (nights >= 20) {
    final half = nights ~/ 2;
    looks.add(half.isOdd ? half - 1 : half);
  }
  looks.add(nights);
  for (var k = 1; looks.length < 4 && k <= 2; k++) {
    looks.add(nights + 14 * k);
  }
  return looks;
}

/// Index kontrolního bodu, od kterého je pohled závěrečný (smí ukázat náznak).
int finalCheckpointIndex(int nights) => nights >= 20 ? 1 : 0;

// ---------------------------------------------------------------------------
// Plánovač rozpisu
// ---------------------------------------------------------------------------

/// Rozpis variant pro [nights] nocí experimentu ("A" / "B").
///
/// * `alternating`: ABAB… nebo BABA…, začátek losovaný seedem. Střídání
///   rozloží obě varianty rovnoměrně v čase, takže učení se (trend) zasáhne
///   obě stejně; náhodný začátek zajistí, že ani zbytkový posun o půl noci
///   nemá systematický směr. Perioda 2 se nekryje s týdnem, takže A i B
///   padnou na všechny dny v týdnu.
/// * `randomBlocks`: náhodně zamíchané vyvážené bloky ([blockSize] 4 =
///   dvakrát A a dvakrát B, nebo 2 = AB / BA). Bloky drží rovnováhu v čase
///   jako střídání, ale další noc se nedá tak snadno uhodnout, což tlumí
///   vliv očekávání. Zbytek na konci se doplní blokem 2 a případně jednou
///   losovanou nocí, takže rozdíl počtů je nejvýš 1.
///
/// U experimentů s WBTB se rozpis počítá jen přes noci, které projdou
/// [wbtbIssues] (n-tá vhodná noc dostane n-tou položku rozpisu).
List<String> schedule(String design, int nights, int seed, {int blockSize = 4}) {
  if (nights < 0) {
    throw ArgumentError.value(nights, 'nights', 'Nesmí být záporné');
  }
  final rng = Nof1Random(seed);
  switch (design) {
    case 'alternating':
      final startB = rng.nextInt(2) == 1;
      return [
        for (var i = 0; i < nights; i++) (i.isEven ^ startB) ? 'A' : 'B',
      ];
    case 'randomBlocks':
      if (blockSize != 2 && blockSize != 4) {
        throw ArgumentError.value(blockSize, 'blockSize', 'Jen 2 nebo 4');
      }
      final out = <String>[];
      while (nights - out.length >= blockSize) {
        out.addAll(_shuffledBlock(blockSize, rng));
      }
      if (nights - out.length >= 2) {
        out.addAll(_shuffledBlock(2, rng));
      }
      if (nights - out.length == 1) {
        out.add(rng.nextInt(2) == 0 ? 'A' : 'B');
      }
      return out;
    default:
      throw ArgumentError.value(design, 'design', 'Jen alternating nebo randomBlocks');
  }
}

List<String> _shuffledBlock(int size, Nof1Random rng) {
  final b = [for (var i = 0; i < size; i++) i.isEven ? 'A' : 'B'];
  for (var i = b.length - 1; i > 0; i--) {
    final j = rng.nextInt(i + 1);
    final tmp = b[i];
    b[i] = b[j];
    b[j] = tmp;
  }
  return b;
}

/// Rozpis až do posledního kontrolního bodu: plán a každé prodloužení
/// o 14 nocí jsou samostatné vyvážené úseky (seed + pořadí úseku), takže
/// v každém kontrolním bodě na konci plánu nebo prodloužení mají obě
/// varianty stejně nocí (u sudých délek).
List<String> fullSchedule(String design, int nights, int seed, {int blockSize = 4}) {
  final looks = checkpoints(nights);
  final out = schedule(design, nights, seed, blockSize: blockSize);
  var segment = 1;
  for (final end in looks.where((n) => n > nights)) {
    out.addAll(schedule(design, end - out.length, seed + segment, blockSize: blockSize));
    segment++;
  }
  return out;
}

/// Stabilní seed z textu (např. id experimentu + datum startu), FNV-1a 32 bit.
int seedFrom(String text) {
  var h = 0x811C9DC5;
  for (final c in text.codeUnits) {
    h ^= c;
    h = _imul32(h, 0x01000193);
  }
  return h;
}

// ---------------------------------------------------------------------------
// Pravidla WBTB
// ---------------------------------------------------------------------------

/// Důvody, proč noc nesmí být noc s Probuzením a návratem do spánku (WBTB).
enum WbtbIssue {
  /// Prvních 14 dní programu patří vybavování a ochraně spánku.
  inFirst14Days,

  /// Nikdy dvě noci po sobě.
  consecutiveNights,

  /// Nejvýš 2 noci v libovolných 7 po sobě jdoucích nocích (přísnější než kalendářní týden).
  moreThanTwoPerWeek,

  /// Jen po dobré noci.
  afterPoorSleep,
}

/// Zkontroluje, jestli smí být [night] nocí s WBTB, když už proběhly [previous].
/// [programStart] je noc 1 programu. [lastNightGood]: „Jak ses vyspal“ minulou
/// noc nebylo špatné (při nejistotě předej `false`, spánek má přednost).
/// Prázdný seznam = smí.
List<WbtbIssue> wbtbIssues(
  DateTime night,
  Iterable<DateTime> previous, {
  required DateTime programStart,
  required bool lastNightGood,
}) {
  final issues = <WbtbIssue>[];
  final d = _dayIndex(night);
  if (d - _dayIndex(programStart) + 1 <= 14) {
    issues.add(WbtbIssue.inFirst14Days);
  }
  final prev = {for (final p in previous) _dayIndex(p)}..remove(d);
  if (prev.contains(d - 1) || prev.contains(d + 1)) {
    issues.add(WbtbIssue.consecutiveNights);
  }
  // Každé okno 7 nocí, které obsahuje d, smí mít nejvýš 2 WBTB včetně d.
  for (var start = d - 6; start <= d; start++) {
    var count = 1;
    for (final p in prev) {
      if (p >= start && p <= start + 6) {
        count++;
      }
    }
    if (count > 2) {
      issues.add(WbtbIssue.moreThanTwoPerWeek);
      break;
    }
  }
  if (!lastNightGood) {
    issues.add(WbtbIssue.afterPoorSleep);
  }
  return issues;
}

/// Zkontroluje celý plán WBTB nocí. [poorSleepNights] jsou noci se špatným
/// spánkem; WBTB noc hned po nich je porušení. Vrací porušení pro každou noc.
Map<DateTime, List<WbtbIssue>> validateWbtbPlan(
  List<DateTime> wbtbNights, {
  required DateTime programStart,
  Set<DateTime> poorSleepNights = const {},
}) {
  final poor = {for (final p in poorSleepNights) _dayIndex(p)};
  final out = <DateTime, List<WbtbIssue>>{};
  for (final n in wbtbNights) {
    final others = wbtbNights.where((o) => _dayIndex(o) != _dayIndex(n));
    final issues = wbtbIssues(n, others, programStart: programStart, lastNightGood: !poor.contains(_dayIndex(n) - 1));
    if (issues.isNotEmpty) {
      out[n] = issues;
    }
  }
  return out;
}

// ---------------------------------------------------------------------------
// Šablona z experiments.json
// ---------------------------------------------------------------------------

/// Minimální čtení šablony z `experiments.json` (mapa už dekódovaná appkou).
class Nof1Template {
  const Nof1Template({
    required this.id,
    required this.design,
    required this.nights,
    required this.minNightsPerArm,
    required this.outcomes,
    required this.primary,
    required this.techniqueIds,
  });

  factory Nof1Template.fromJson(Map<String, dynamic> j) => Nof1Template(
        id: j['id'] as String,
        design: j['design'] as String,
        nights: j['nights'] as int,
        minNightsPerArm: j['minNightsPerArm'] as int,
        outcomes: [for (final o in j['outcomes'] as List) o as String],
        primary: j['primary'] as String,
        techniqueIds: [for (final t in j['techniqueIds'] as List) t as String],
      );

  final String id;
  final String design;
  final int nights;
  final int minNightsPerArm;
  final List<String> outcomes;
  final String primary;
  final List<String> techniqueIds;

  /// Experiment s WBTB běží jen na nocích, které projdou [wbtbIssues].
  bool get needsWbtbNights => techniqueIds.contains('wbtb');

  List<int> get checkpointNights => checkpoints(nights);
}

// ---------------------------------------------------------------------------
// Klíče textů (musí sedět s laborator_texty.json)
// ---------------------------------------------------------------------------

/// Všechny klíče `lab.*`, které tenhle kód může vrátit. Test kontroluje,
/// že existují v `laborator_texty.json`.
List<String> nof1CopyKeys() => [
      for (final v in Nof1Verdict.values) ...['lab.verdict.${v.name}.title', 'lab.verdict.${v.name}.body'],
      for (final r in Nof1Reason.values) 'lab.reason.${r.name}',
      for (final f in Nof1Flag.values) 'lab.flag.${f.name}',
      for (final o in Nof1Outcome.values) 'lab.explain.${o.name}',
      for (final o in Nof1Outcome.values) 'lab.outcome.${o.name}',
      for (final w in WbtbIssue.values) 'lab.wbtb.${w.name}',
      'lab.detail.title',
      'lab.detail.nights',
      'lab.detail.missing',
      'lab.detail.model.betaBinomial',
      'lab.detail.model.tModel',
      'lab.detail.prior.lucid',
      'lab.detail.prior.scale',
      'lab.detail.trendAdjusted',
      for (final u in ['lucid', 'recall', 'scale']) ...['lab.detail.rope.$u', 'lab.detail.effect.$u'],
      'lab.detail.probs',
      'lab.detail.note',
      'lab.design.alternating',
      'lab.design.randomBlocks',
    ];

/// Číslo s desetinnou čárkou a typografickým minus.
String formatCz(double x, {int digits = 1}) {
  var s = x.toStringAsFixed(digits);
  if (RegExp(r'^-0(\.0+)?$').hasMatch(s)) {
    s = s.substring(1);
  }
  return s.replaceAll('.', ',').replaceAll('-', '−');
}

// ---------------------------------------------------------------------------
// Modely (interní)
// ---------------------------------------------------------------------------

class _Obs {
  const _Obs(this.t, this.isB, this.y);

  final double t;
  final bool isB;
  final double y;
}

class _Post {
  const _Post({
    required this.effect,
    required this.lo,
    required this.hi,
    required this.pPos,
    required this.pAbove,
    required this.pBelow,
    required this.estA,
    required this.estB,
    required this.trendAdjusted,
    required this.changesOverTime,
    required this.armTimeCorrelation,
  });

  final double effect;
  final double lo;
  final double hi;
  final double pPos;
  final double pAbove;
  final double pBelow;
  final double estA;
  final double estB;
  final bool trendAdjusted;
  final bool changesOverTime;
  final double armTimeCorrelation;

  double get pSame => (1 - pAbove - pBelow).clamp(0.0, 1.0);
}

/// Den jako celé číslo nezávislé na časovém pásmu a letním čase.
int _dayIndex(DateTime d) => DateTime.utc(d.year, d.month, d.day).millisecondsSinceEpoch ~/ 86400000;

/// Beta-binomický model pro lucidní noc. Prior Beta(w·m, w·(1 − m)) pro obě varianty.
_Post _betaModel(List<_Obs> obs, double rope, double priorMean, double priorWeight, int seed, int draws) {
  final m = priorMean.clamp(0.03, 0.25);
  final a0 = priorWeight * m, b0 = priorWeight * (1 - m);
  var yA = 0.0, nA = 0, yB = 0.0, nB = 0;
  for (final o in obs) {
    if (o.isB) {
      yB += o.y;
      nB++;
    } else {
      yA += o.y;
      nA++;
    }
  }
  final aA = a0 + yA, bA = b0 + nA - yA, aB = a0 + yB, bB = b0 + nB - yB;
  final rng = Nof1Random(seed);
  final d = List<double>.filled(draws, 0);
  var pos = 0, above = 0, below = 0;
  for (var i = 0; i < draws; i++) {
    final pa = rng.nextBeta(aA, bA);
    final pb = rng.nextBeta(aB, bB);
    final x = pb - pa;
    d[i] = x;
    if (x > 0) {
      pos++;
    }
    if (x > rope) {
      above++;
    }
    if (x < -rope) {
      below++;
    }
  }
  d.sort();
  double q(double p) => d[((draws - 1) * p).round()];
  final (corr, _) = _armTimeCorr(obs);
  return _Post(
    effect: q(0.5),
    lo: q(0.05),
    hi: q(0.95),
    pPos: pos / draws,
    pAbove: above / draws,
    pBelow: below / draws,
    estA: aA / (aA + bA),
    estB: aB / (aB + bB),
    trendAdjusted: false,
    changesOverTime: _interactionFlag(obs, rope, 0.5),
    armTimeCorrelation: corr,
  );
}

/// Korelace mezi variantou a časem (0 = vyvážené v čase) a rozpětí času.
(double, double) _armTimeCorr(List<_Obs> obs) {
  final n = obs.length;
  if (n < 3) {
    return (0, 0);
  }
  var mt = 0.0, ma = 0.0, tMin = obs.first.t, tMax = obs.first.t;
  for (final o in obs) {
    mt += o.t;
    ma += o.isB ? 1 : 0;
    tMin = math.min(tMin, o.t);
    tMax = math.max(tMax, o.t);
  }
  mt /= n;
  ma /= n;
  var sta = 0.0, stt = 0.0, saa = 0.0;
  for (final o in obs) {
    final dt = o.t - mt, da = (o.isB ? 1 : 0) - ma;
    sta += dt * da;
    stt += dt * dt;
    saa += da * da;
  }
  if (stt == 0 || saa == 0) {
    return (0, tMax - tMin);
  }
  return (sta / math.sqrt(stt * saa), tMax - tMin);
}

/// Bayesovský t-model: y = b0 + d·arm + c·time, arm = ±0,5, time vycentrovaný
/// na rozpětí 1. Prior: plochý na b0 a c, d | σ² ~ N(0, σ²/κ0),
/// σ² ~ Scaled-Inv-χ²(ν0, σ0²). Posterior d ~ t_ν (sdružený prior, přesně).
_Post _tModel(List<_Obs> obs, Nof1Outcome o, {required bool adjustTrend}) {
  final n = obs.length;
  final (corr, range) = _armTimeCorr(obs);
  final useTrend = adjustTrend && range > 0 && n >= 6;
  final mt = obs.map((e) => e.t).reduce((a, b) => a + b) / n;
  List<double> row(_Obs e) => [
        1,
        e.isB ? 0.5 : -0.5,
        if (useTrend) (e.t - mt) / range,
      ];
  final p = useTrend ? 3 : 2;
  final xtx = List.generate(p, (_) => List<double>.filled(p, 0));
  final xty = List<double>.filled(p, 0);
  var yy = 0.0;
  for (final e in obs) {
    final x = row(e);
    for (var i = 0; i < p; i++) {
      xty[i] += x[i] * e.y;
      for (var j = 0; j < p; j++) {
        xtx[i][j] += x[i] * x[j];
      }
    }
    yy += e.y * e.y;
  }
  const kappa = nof1EffectPriorNights;
  const nu0 = nof1VariancePriorNights;
  final a = [
    for (final r in xtx) [...r]
  ];
  a[1][1] += kappa;
  final mVec = _solve(a, xty);
  final e1 = List<double>.filled(p, 0)..[1] = 1;
  final v = _solve(a, e1);
  final vdd = v[1];
  var mam = 0.0;
  for (var i = 0; i < p; i++) {
    mam += mVec[i] * xty[i];
  }
  final nuN = nu0 + n - (p - 1);
  final s2 = math.max((nu0 * o.priorSd * o.priorSd + yy - mam) / nuN, 1e-9);
  final se = math.sqrt(s2 * vdd);
  final d = mVec[1];
  final tq = studentTQuantile(0.95, nuN);
  final rope = o.rope;
  final pPos = 1 - studentTCdf((0 - d) / se, nuN);
  final pAbove = 1 - studentTCdf((rope - d) / se, nuN);
  final pBelow = studentTCdf((-rope - d) / se, nuN);
  final mid = mVec[0];
  return _Post(
    effect: d,
    lo: d - tq * se,
    hi: d + tq * se,
    pPos: pPos,
    pAbove: pAbove,
    pBelow: pBelow,
    estA: (mid - d / 2).clamp(0.0, o.maxValue.toDouble()),
    estB: (mid + d / 2).clamp(0.0, o.maxValue.toDouble()),
    trendAdjusted: useTrend,
    changesOverTime: _interactionFlag(obs, rope, o.priorSd),
    armTimeCorrelation: corr,
  );
}

/// Štítek „mění se v čase“: model s interakcí varianta × čas. Štítek, když
/// je interakce věrohodně nenulová (P ≥ 0,99 jedním směrem; s 0,95 se štítek
/// při nulovém rozdílu ukazoval u 9–13 % experimentů) a rozdíl se mezi
/// první a poslední nocí změní aspoň o 2 ROPE. Potřebuje aspoň 12 nocí.
bool _interactionFlag(List<_Obs> obs, double rope, double priorSd) {
  final n = obs.length;
  if (n < 12) {
    return false;
  }
  final (_, range) = _armTimeCorr(obs);
  if (range <= 0) {
    return false;
  }
  final mt = obs.map((e) => e.t).reduce((a, b) => a + b) / n;
  const p = 4;
  final xtx = List.generate(p, (_) => List<double>.filled(p, 0));
  final xty = List<double>.filled(p, 0);
  var yy = 0.0;
  for (final e in obs) {
    final arm = e.isB ? 0.5 : -0.5;
    final t = (e.t - mt) / range;
    final x = [1.0, arm, t, arm * t];
    for (var i = 0; i < p; i++) {
      xty[i] += x[i] * e.y;
      for (var j = 0; j < p; j++) {
        xtx[i][j] += x[i] * x[j];
      }
    }
    yy += e.y * e.y;
  }
  const nu0 = nof1VariancePriorNights;
  final a = [
    for (final r in xtx) [...r]
  ];
  a[1][1] += nof1EffectPriorNights;
  // Malá regularizace interakce, aby soustava byla vždy řešitelná.
  a[3][3] += 1e-6;
  final m = _solve(a, xty);
  final v = _solve(a, [0, 0, 0, 1]);
  var mam = 0.0;
  for (var i = 0; i < p; i++) {
    mam += m[i] * xty[i];
  }
  final nuN = nu0 + n - 3;
  final s2 = math.max((nu0 * priorSd * priorSd + yy - mam) / nuN, 1e-9);
  final se = math.sqrt(s2 * v[3]);
  final b = m[3];
  final pPos = 1 - studentTCdf(-b / se, nuN);
  return (pPos >= 0.99 || pPos <= 0.01) && b.abs() >= 2 * rope;
}

/// Gaussova eliminace s částečnou pivotací (malé soustavy 2–4).
List<double> _solve(List<List<double>> a0, List<double> b0) {
  final n = b0.length;
  final a = [
    for (final r in a0) [...r]
  ];
  final b = [...b0];
  for (var c = 0; c < n; c++) {
    var piv = c;
    for (var r = c + 1; r < n; r++) {
      if (a[r][c].abs() > a[piv][c].abs()) {
        piv = r;
      }
    }
    if (piv != c) {
      final tr = a[c];
      a[c] = a[piv];
      a[piv] = tr;
      final tb = b[c];
      b[c] = b[piv];
      b[piv] = tb;
    }
    final d = a[c][c];
    if (d.abs() < 1e-12) {
      // Singulární směr (např. žádná variabilita času): ponech nulu.
      continue;
    }
    for (var r = c + 1; r < n; r++) {
      final f = a[r][c] / d;
      if (f == 0) {
        continue;
      }
      for (var k = c; k < n; k++) {
        a[r][k] -= f * a[c][k];
      }
      b[r] -= f * b[c];
    }
  }
  final x = List<double>.filled(n, 0);
  for (var r = n - 1; r >= 0; r--) {
    if (a[r][r].abs() < 1e-12) {
      x[r] = 0;
      continue;
    }
    var s = b[r];
    for (var k = r + 1; k < n; k++) {
      s -= a[r][k] * x[k];
    }
    x[r] = s / a[r][r];
  }
  return x;
}

// ---------------------------------------------------------------------------
// Rozdělení (veřejné kvůli testům)
// ---------------------------------------------------------------------------

/// ln Γ(x), Lanczos (g = 7, n = 9), přesnost ~1e-13 pro x > 0.
double logGamma(double x) {
  const c = [
    0.99999999999980993,
    676.5203681218851,
    -1259.1392167224028,
    771.32342877765313,
    -176.61502916214059,
    12.507343278686905,
    -0.13857109526572012,
    9.9843695780195716e-6,
    1.5056327351493116e-7,
  ];
  if (x < 0.5) {
    return math.log(math.pi / math.sin(math.pi * x)) - logGamma(1 - x);
  }
  final xx = x - 1;
  var s = c[0];
  for (var i = 1; i < 9; i++) {
    s += c[i] / (xx + i);
  }
  final t = xx + 7.5;
  return 0.5 * math.log(2 * math.pi) + (xx + 0.5) * math.log(t) - t + math.log(s);
}

/// Regularizovaná neúplná beta funkce I_x(a, b) (řetězový zlomek, Lentz).
double incompleteBeta(double x, double a, double b) {
  if (x <= 0) {
    return 0;
  }
  if (x >= 1) {
    return 1;
  }
  final lbt = logGamma(a + b) - logGamma(a) - logGamma(b) + a * math.log(x) + b * math.log(1 - x);
  final bt = math.exp(lbt);
  if (x < (a + 1) / (a + b + 2)) {
    return bt * _betacf(x, a, b) / a;
  }
  return 1 - bt * _betacf(1 - x, b, a) / b;
}

double _betacf(double x, double a, double b) {
  const tiny = 1e-300;
  final qab = a + b, qap = a + 1, qam = a - 1;
  var c = 1.0;
  var d = 1 - qab * x / qap;
  if (d.abs() < tiny) {
    d = tiny;
  }
  d = 1 / d;
  var h = d;
  for (var m = 1; m <= 300; m++) {
    final m2 = 2 * m;
    var aa = m * (b - m) * x / ((qam + m2) * (a + m2));
    d = 1 + aa * d;
    if (d.abs() < tiny) {
      d = tiny;
    }
    c = 1 + aa / c;
    if (c.abs() < tiny) {
      c = tiny;
    }
    d = 1 / d;
    h *= d * c;
    aa = -(a + m) * (qab + m) * x / ((a + m2) * (qap + m2));
    d = 1 + aa * d;
    if (d.abs() < tiny) {
      d = tiny;
    }
    c = 1 + aa / c;
    if (c.abs() < tiny) {
      c = tiny;
    }
    d = 1 / d;
    final del = d * c;
    h *= del;
    if ((del - 1).abs() < 1e-14) {
      break;
    }
  }
  return h;
}

/// Distribuční funkce Studentova t s [nu] stupni volnosti.
double studentTCdf(double t, double nu) {
  if (t.isNaN) {
    return 0.5;
  }
  if (t.isInfinite) {
    return t > 0 ? 1 : 0;
  }
  final x = nu / (nu + t * t);
  final tail = 0.5 * incompleteBeta(x, nu / 2, 0.5);
  return t > 0 ? 1 - tail : tail;
}

/// Kvantil Studentova t (bisekce, přesnost 1e-10).
double studentTQuantile(double p, double nu) {
  var lo = -1000.0, hi = 1000.0;
  for (var i = 0; i < 100; i++) {
    final mid = (lo + hi) / 2;
    if (studentTCdf(mid, nu) < p) {
      lo = mid;
    } else {
      hi = mid;
    }
    if (hi - lo < 1e-10) {
      break;
    }
  }
  return (lo + hi) / 2;
}

/// Přesná P(pB > pA) pro pA ~ Beta(aA, bA), pB ~ Beta(aB, bB), celé aB
/// (Miller 2015; kontrola Monte Carla v testech).
double exactProbBGreater(int aA, int bA, int aB, int bB) {
  double lbeta(double x, double y) => logGamma(x) + logGamma(y) - logGamma(x + y);
  var total = 0.0;
  for (var i = 0; i < aB; i++) {
    total += math.exp(lbeta(aA + i.toDouble(), (bA + bB).toDouble()) -
        math.log(bB + i.toDouble()) -
        lbeta(1 + i.toDouble(), bB.toDouble()) -
        lbeta(aA.toDouble(), bA.toDouble()));
  }
  return total;
}

// ---------------------------------------------------------------------------
// Generátor náhodných čísel (deterministický, 32bitový, stejný na VM i webu)
// ---------------------------------------------------------------------------

int _imul32(int a, int b) {
  final ah = (a >>> 16) & 0xFFFF, al = a & 0xFFFF;
  final bh = (b >>> 16) & 0xFFFF, bl = b & 0xFFFF;
  return ((al * bl) + ((((ah * bl) + (al * bh)) & 0xFFFF) << 16)) & 0xFFFFFFFF;
}

/// Mulberry32: malý, rychlý a s pevným seedem opakovatelný generátor.
/// (`dart:math` Random nemá zaručenou stejnou posloupnost napříč platformami.)
class Nof1Random {
  Nof1Random(int seed) : _s = seed & 0xFFFFFFFF;

  int _s;
  double? _spare;

  int nextUint32() {
    _s = (_s + 0x6D2B79F5) & 0xFFFFFFFF;
    var t = _s;
    t = _imul32(t ^ (t >>> 15), t | 1);
    t = (t ^ (t + _imul32(t ^ (t >>> 7), t | 61))) & 0xFFFFFFFF;
    return (t ^ (t >>> 14)) & 0xFFFFFFFF;
  }

  /// Rovnoměrně v [0, 1).
  double nextDouble() => nextUint32() / 4294967296.0;

  /// Celé číslo v [0, max).
  int nextInt(int max) {
    if (max <= 0) {
      throw ArgumentError.value(max, 'max');
    }
    return (nextDouble() * max).floor();
  }

  /// Standardní normální (Box-Muller).
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

  /// Gamma(shape, 1), Marsaglia & Tsang 2000; pro shape < 1 zesílení U^(1/shape).
  double nextGamma(double shape) {
    if (shape < 1) {
      final u = 1 - nextDouble();
      return nextGamma(shape + 1) * math.pow(u, 1 / shape);
    }
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
      if (u < 1 - 0.0331 * x * x * x * x) {
        return d * v;
      }
      if (math.log(u) < 0.5 * x * x + d * (1 - v + math.log(v))) {
        return d * v;
      }
    }
  }

  /// Beta(a, b) přes dva tahy Gamma.
  double nextBeta(double a, double b) {
    final x = nextGamma(a);
    final y = nextGamma(b);
    return x / (x + y);
  }

  /// Poisson(λ) (Knuth, pro malá λ do ~10).
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
