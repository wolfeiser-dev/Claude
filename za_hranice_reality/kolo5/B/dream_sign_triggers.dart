// Od Stopy snů ke spouštěči (inovace.md, funkce 2, UX TOP 2).
//
// Čistý Dart 3.6, jen dart:math. Tři veřejné funkce:
// * [suggestTriggers]: osobní plán „když–pak“ na den a večerní záměr,
// * [transferStats]: přenos do snu před a po začátku plánu, slovní verdikt,
// * [realityPromptsFromSigns]: krátké podněty do notifikace (≤ 60 znaků).
//
// Texty: všechny šablony jsou v [triggerTextsCs] a zrcadlově v
// `triggers_texty.json` (`texts.triggers.*`). Appka může předat vlastní
// [TriggerText], třeba z načteného JSON přes [triggerTextFromJson].
//
// Skloňování: label je, jak ho uživatel napsal (obvykle 1. pád). Šablony ho
// proto nikdy neskloňují. Stojí buď za dvojtečkou („Stopa snů: škola“),
// nebo v uvozovkách jako jméno za řídícím slovem, které se skloňuje samo
// („Stopu snů „škola““, „něco jako „škola““, „pocit „panika““).
import 'dart:math' as math;

import 'dream_types.dart';

// ---------------------------------------------------------------------------
// Texty
// ---------------------------------------------------------------------------

/// Vrátí text pro klíč a dosadí zástupné symboly `{x}` z [args].
typedef TriggerText = String Function(String key, Map<String, String> args);

/// Výchozí české texty. Musí sedět s `triggers_texty.json` (hlídá test).
const Map<String, String> triggerTextsCs = {
  // Celá věta pro náhled. Appka jinak doplňuje „Když“ a „tak“ sama.
  'triggers.sentence': 'Když {when}, tak {then}.',
  'triggers.kind.day.label': 'Ve dne',
  'triggers.kind.day.note': 'Dá se potkat i ve dne.',
  'triggers.kind.evening.label': 'Večer',
  'triggers.kind.evening.note': 'Hodí se jako večerní záměr.',

  // Den: situace v bdění, která Stopu připomíná. Bez „Když“ a bez „tak“.
  'triggers.day.context.a.when': 'vejdu na místo, které mi připomíná Stopu snů „{label}“',
  'triggers.day.context.b.when': 'uvidím něco, co patří ke Stopě snů „{label}“',
  'triggers.day.context.then': 'udělám pauzu, rozhlédnu se a zkontroluju, jestli sním',
  'triggers.day.action.a.when': 'zažiju něco, co mi připomíná Stopu snů „{label}“',
  'triggers.day.action.b.when': 'mi něco nepůjde jako ve Stopě snů „{label}“',
  'triggers.day.action.then': 'udělám pauzu a zkontroluju, jestli sním',
  'triggers.day.form.a.when': 'uvidím něco, co mi připomíná Stopu snů „{label}“',
  'triggers.day.form.b.when': 'uvidím něco, co patří ke Stopě snů „{label}“',
  'triggers.day.form.then': 'udělám pauzu, podívám se znovu a zkontroluju, jestli sním',
  'triggers.day.awareness.a.when': 'ucítím něco, co mi připomíná Stopu snů „{label}“',
  'triggers.day.awareness.b.when': 'přijde pocit jako ve Stopě snů „{label}“',
  'triggers.day.awareness.then': 'udělám pauzu, nadechnu se a zkontroluju, jestli sním',
  'triggers.day.thenTest': 'udělám pauzu a pak test reality',

  // Večer: cíl Záměru poznat sen.
  'triggers.evening.context.a.when': 'se objeví „{label}“',
  'triggers.evening.context.b.when': 'narazím na Stopu snů „{label}“',
  'triggers.evening.action.a.when': 'se stane něco jako „{label}“',
  'triggers.evening.action.b.when': 'mi něco nepůjde jako ve Stopě snů „{label}“',
  'triggers.evening.form.a.when': 'uvidím něco jako „{label}“',
  'triggers.evening.form.b.when': 'narazím na Stopu snů „{label}“',
  'triggers.evening.awareness.a.when': 'přijde pocit „{label}“',
  'triggers.evening.awareness.b.when': 'ucítím něco jako ve Stopě snů „{label}“',
  'triggers.evening.a.then': 'poznám, že sním',
  'triggers.evening.b.then': 'poznám, že je to sen',

  // Zdůvodnění návrhu.
  'triggers.reason.recent': 'Ve snech {pocet}× za 30 dní, naposledy {kdy}.',
  'triggers.reason.older': 'Ve snech {pocet}×, naposledy {kdy}.',
  'triggers.reason.countOnly': 'V deníku {pocet}×.',
  'triggers.reason.none': 'Ve snech zatím není, máš ji v seznamu.',
  'triggers.ago.lastNight': 'minulou noc',
  'triggers.ago.nights': 'před {pocet} nocemi',
  'triggers.ago.long': 'před víc než 3 měsíci',

  // Podněty do notifikace (≤ 60 znaků i s labelem).
  'triggers.prompt.ask': 'Stopa snů: {label}. Sníš?',
  'triggers.prompt.seek': 'Dnes hledej: {label}.',
  'triggers.prompt.where': 'Kde dnes potkáš Stopu „{label}“?',
  'triggers.prompt.known': 'Znáš „{label}“ ze snů? Sníš teď?',
  'triggers.prompt.context': 'Kde teď jsi? Stopa snů: {label}.',
  'triggers.prompt.action': 'Funguje všechno? Stopa snů: {label}.',
  'triggers.prompt.form': 'Podívej se dvakrát. Stopa snů: {label}.',
  'triggers.prompt.awareness': 'Co teď cítíš? Stopa snů: {label}.',

  // Přenos do snu.
  'triggers.metric.realityCheck': 'test ve snu',
  'triggers.metric.lucid': 'lucidní sen',
  'triggers.freq.some': '{v} {k} {z} {n} {snu}',
  'triggers.freq.none': 'v žádném {z} {n} {snu}',
  'triggers.freq.oneYes': 'v tom jednom snu ano',
  'triggers.freq.oneNo': 'v tom jednom snu ne',
  'triggers.freq.empty': 'zatím bez snů',
  'triggers.count.zero': 'v žádném snu',
  'triggers.count.some': '{v} {n} {snech}',
  'triggers.word.dream.gen': 'snů',
  'triggers.word.dream.loc1': 'snu',
  'triggers.word.dream.loc': 'snech',
  'triggers.funnel': 'Stopa ve snu {stopa}× · test ve snu {test}× · lucidita {lucid}×',
  'triggers.verdict.noDreams.title': 'Zatím ve snech není',
  'triggers.verdict.noDreams.body': 'Stopa se ve snech zatím neobjevila. Počítat začnu, až ji zapíšeš.',
  'triggers.verdict.tooEarly.title': 'Zatím brzy',
  'triggers.verdict.tooEarly.body': 'Od začátku plánu je Stopa {pocet}. Srovnávat začnu od {min} snů.',
  'triggers.verdict.noBaseline.title': 'Zatím bez srovnání',
  'triggers.verdict.noBaseline.body':
      '{Co} od začátku plánu: {po}. Snů se Stopou z doby před plánem je málo, srovnání zatím nemám.',
  'triggers.verdict.noEventsYet.title': 'Zatím ani jednou',
  'triggers.verdict.noEventsYet.body':
      '{Co} zatím v žádném snu se Stopou. Snů se Stopou: před plánem {nPred}, od začátku plánu {nPo}.',
  'triggers.verdict.noChangeYet.title': 'Zatím bez jasné změny',
  'triggers.verdict.noChangeYet.body':
      '{Co} před plánem: {pred}. Od začátku plánu: {po}. Takový rozdíl může být náhoda.',
  'triggers.verdict.possiblyMore.title': 'Náznak zlepšení',
  'triggers.verdict.possiblyMore.body':
      '{Co} před plánem: {pred}. Od začátku plánu: {po}. Vypadá to líp, ale zatím je to jen náznak.',
  'triggers.verdict.clearlyMore.title': 'Častěji než dřív',
  'triggers.verdict.clearlyMore.body':
      '{Co} před plánem: {pred}. Od začátku plánu: {po}. Na náhodu je to velký rozdíl. Jestli ho dělá plán, ukáže experiment v Laboratoři.',
  'triggers.verdict.fewer.title': 'Méně než dřív',
  'triggers.verdict.fewer.body':
      '{Co} před plánem: {pred}. Od začátku plánu: {po}. Teď je to méně. Zkus spouštěč upravit nebo vyměnit Stopu.',
};

/// Všechny klíče, které kód používá (pro kontrolu JSON).
List<String> triggerTextKeys() => triggerTextsCs.keys.toList();

/// Dosadí `{x}` z [args] do [template]. Hodnoty se už dál neprocházejí,
/// takže složená závorka v labelu nic nerozbije.
String fillTemplate(String template, Map<String, String> args) =>
    template.replaceAllMapped(RegExp(r'\{([A-Za-z0-9_]+)\}'), (m) => args[m.group(1)!] ?? m.group(0)!);

/// Výchozí české texty. Neznámý klíč vrátí sám sebe (chyba se hned ukáže).
String czechTriggerText(String key, Map<String, String> args) => fillTemplate(triggerTextsCs[key] ?? key, args);

/// [TriggerText] z načteného `triggers_texty.json` (`{"texts":{"triggers":{…}}}`).
/// Chybějící klíče doplní [fallback].
TriggerText triggerTextFromJson(Map<String, dynamic> json, {TriggerText fallback = czechTriggerText}) {
  final flat = <String, String>{};
  void walk(String prefix, Object? node) {
    if (node is Map) {
      for (final e in node.entries) {
        walk(prefix.isEmpty ? '${e.key}' : '$prefix.${e.key}', e.value);
      }
    } else if (node is String) {
      flat[prefix] = node;
    }
  }

  walk('', json['texts'] ?? json);
  return (key, args) {
    final t = flat[key];
    return t == null ? fallback(key, args) : fillTemplate(t, args);
  };
}

// ---------------------------------------------------------------------------
// Návrh spouštěčů
// ---------------------------------------------------------------------------

/// Den = situace v bdění („když–pak“ pro den), večer = cíl Záměru poznat sen.
enum TriggerKind { day, evening }

/// Návrh jednoho spouštěče. [when] a [then] nezačínají „Když“ ani „tak“,
/// appka je doplní sama. Bez tečky na konci.
class TriggerSuggestion {
  const TriggerSuggestion({
    required this.id,
    required this.signId,
    required this.label,
    required this.category,
    required this.kind,
    required this.variant,
    required this.when,
    required this.then,
    required this.reason,
    required this.score,
    required this.whenKey,
    required this.thenKey,
    required this.weightedNights,
    required this.nights30,
    required this.lastSeenNightsAgo,
    required this.withTest,
  });

  /// Stabilní id: `trg_<signId>_<day|evening>_<a|b>`.
  final String id;
  final String signId;

  /// Label po úklidu (mezery, uvozovky) a případném zkrácení.
  final String label;
  final DreamSignCategory category;
  final TriggerKind kind;

  /// Varianta šablony `a` / `b`, střídá se po týdnech.
  final String variant;
  final String when;
  final String then;

  /// Krátké zdůvodnění: kolikrát a kdy naposledy, proč den nebo večer.
  final String reason;

  /// Pořadové skóre (váha nocí × kategorie × druh × denní rotace).
  final double score;
  final String whenKey;
  final String thenKey;

  /// Součet 0,5^(stáří / 14) přes noci se Stopou.
  final double weightedNights;

  /// Počet nocí se Stopou za posledních 30 dní.
  final int nights30;

  /// Kolik nocí zpátky byla Stopa naposledy (null = ve snech není).
  final int? lastSeenNightsAgo;
  final bool withTest;

  /// Celá věta pro náhled: „Když …, tak ….“
  String sentence([TriggerText text = czechTriggerText]) => text('triggers.sentence', {'when': when, 'then': then});

  @override
  String toString() => '$id ${score.toStringAsFixed(3)}: $when / $then';
}

/// Poločas váhy nocí (spec TOP 2: 14 dní).
const double triggerHalfLifeNights = 14;

/// Amplituda rotace pořadí (± 25 %). Přehází jen blízké kandidáty, slabou
/// Stopu nad silnou nevytáhne. Návrhy plánu rotují po týdnech (plán
/// „když–pak“ potřebuje opakování), podněty do notifikace denně.
const double triggerRotation = 0.25;

/// Nejdelší label v textu spouštěče (delší se zkrátí na hranici slova).
const int triggerLabelMax = 40;

/// Nejdelší podnět do notifikace.
const int promptMaxLength = 60;

/// Kmeny slov, které v textu snu značí „divnost“ (spec TOP 2, oddity).
const List<String> _oddityStems = ['nešl', 'nejde', 'najednou', 'nemohl', 'nemoh', 'změnil', 'létal', 'letěl'];

/// Navrhne až [max] spouštěčů z Stop snů.
///
/// * Skóre Stopy: Σ přes noci se Stopou 0,5^(stáří / 14), k tomu malá váha
///   za [DreamSign.count], který v [dreams] nemá datum (0,02 za výskyt, nejvýš
///   10). Násobí se (1 + 0,5 × divnost) a 1,2 u kategorií děj a podoba.
/// * Druh: den má váhu 1,0 u prostředí a děje, 0,7 u vnitřního prožitku a
///   0,5 u podoby. Večer 1,0 u podoby a vnitřního prožitku, 0,8 u ostatních.
/// * Výběr: [max] nejsilnějších různých Stop, každá svým lepším druhem. Když
///   je Stop méně, doplní se druhým druhem (jedna Stopa = den i večer).
///   Když vyjde všechno jen na den nebo jen na večer, jedna položka se
///   vymění tak, aby plán měl obojí a skóre kleslo co nejméně.
/// * Rotace: skóre se násobí deterministickým faktorem 0,75 až 1,25 podle
///   Stopy a týdne [now] (stejný pro den i večer, o druhu rozhoduje
///   kategorie). Varianta šablony a/b se mění taky po týdnech. „Jiný
///   návrh“ = zavolat znovu s odmítnutou Stopou v [excludeSignIds].
/// * Vynechá Stopy z [excludeSignIds] (soukromé, aktivní, odmítnuté), Stopy
///   bez použitelného labelu a Stopy, které jsou aspoň v polovině svých snů
///   z noční můry (spec: z noční můry spouštěč nedělám).
List<TriggerSuggestion> suggestTriggers(
  List<DreamSign> signs,
  List<Dream> dreams, {
  required DateTime now,
  int max = 3,
  bool withTest = false,
  Set<String> excludeSignIds = const {},
  TriggerText text = czechTriggerText,
}) {
  if (max <= 0) {
    return const [];
  }
  final today = _dayIndex(now);
  final data = _signData(signs, dreams, today: today, exclude: excludeSignIds);

  // Kandidáti po Stopách: nejlepší druh a druhý druh.
  final best = <_Cand>[];
  final second = <String, _Cand>{};
  for (final s in data) {
    // Rotace je na Stopu, ne na druh: o dni a večeru rozhoduje kategorie.
    final jitter = 1 + triggerRotation * (2 * _hash01('${s.sign.id}|plan|w${today ~/ 7}') - 1);
    final both = [
      for (final kind in TriggerKind.values) _Cand(s, kind, s.base * _affinity(s.sign.category, kind) * jitter),
    ]..sort(_compareCand);
    best.add(both.first);
    second[s.sign.id] = both.last;
  }
  best.sort(_compareCand);

  // 1) Nejsilnější různé Stopy, každá svým nejlepším druhem.
  final picked = best.take(max).toList();
  // 2) Málo Stop: doplnit druhým druhem už vybraných (1 Stopa = den i večer).
  for (final c in [for (final p in picked) second[p.data.sign.id]!]..sort(_compareCand)) {
    if (picked.length >= max) {
      break;
    }
    picked.add(c);
  }
  // 3) Plán na den i na noc: když mají všechny stejný druh, vyměň s
  //    nejmenší ztrátou skóre buď druh u jedné vybrané Stopy, nebo poslední
  //    Stopu za nejlepší nevybranou Stopu druhého druhu.
  if (picked.length >= 2 && picked.every((c) => c.kind == picked.first.kind)) {
    var bestLoss = double.infinity;
    var at = -1;
    _Cand? replacement;
    for (var i = 0; i < picked.length; i++) {
      final alt = second[picked[i].data.sign.id]!;
      final loss = picked[i].score - alt.score;
      if (alt.kind != picked[i].kind && loss < bestLoss) {
        bestLoss = loss;
        at = i;
        replacement = alt;
      }
    }
    final pickedIds = {for (final c in picked) c.data.sign.id};
    for (final b in best) {
      if (pickedIds.contains(b.data.sign.id)) {
        continue;
      }
      final alt = b.kind != picked.first.kind ? b : second[b.data.sign.id]!;
      final loss = picked.last.score - alt.score;
      if (loss < bestLoss) {
        bestLoss = loss;
        at = picked.length - 1;
        replacement = alt;
      }
      break; // best je seřazený podle skóre, stačí první nevybraná Stopa
    }
    if (replacement != null) {
      picked[at] = replacement;
    }
  }
  picked.sort(_compareCand);

  return [for (final c in picked) _buildSuggestion(c, today, withTest, text)];
}

double _affinity(DreamSignCategory cat, TriggerKind kind) => switch ((kind, cat)) {
      (TriggerKind.day, DreamSignCategory.context) => 1.0,
      (TriggerKind.day, DreamSignCategory.action) => 1.0,
      (TriggerKind.day, DreamSignCategory.awareness) => 0.7,
      (TriggerKind.day, DreamSignCategory.form) => 0.5,
      (TriggerKind.evening, DreamSignCategory.form) => 1.0,
      (TriggerKind.evening, DreamSignCategory.awareness) => 1.0,
      (TriggerKind.evening, _) => 0.8,
    };

TriggerSuggestion _buildSuggestion(_Cand c, int today, bool withTest, TriggerText text) {
  final s = c.data;
  final cat = s.sign.category.name;
  final variant = _hash01('${s.sign.id}|${c.kind.name}|w${today ~/ 7}') < 0.5 ? 'a' : 'b';
  final label = _truncate(s.label, triggerLabelMax);
  final args = {'label': label};
  final String whenKey;
  final String thenKey;
  if (c.kind == TriggerKind.day) {
    whenKey = 'triggers.day.$cat.$variant.when';
    thenKey = withTest ? 'triggers.day.thenTest' : 'triggers.day.$cat.then';
  } else {
    whenKey = 'triggers.evening.$cat.$variant.when';
    thenKey = 'triggers.evening.$variant.then';
  }

  final String first;
  if (s.lastAge != null) {
    final kdy = s.lastAge! <= 1
        ? text('triggers.ago.lastNight', const {})
        : s.lastAge! > 90
            ? text('triggers.ago.long', const {})
            : text('triggers.ago.nights', {'pocet': '${s.lastAge}'});
    first = s.nights30 > 0
        ? text('triggers.reason.recent', {'pocet': '${s.nights30}', 'kdy': kdy})
        : text('triggers.reason.older', {'pocet': '${s.nightsTotal}', 'kdy': kdy});
  } else if (s.sign.count > 0) {
    first = text('triggers.reason.countOnly', {'pocet': '${s.sign.count}'});
  } else {
    first = text('triggers.reason.none', const {});
  }
  final note = text('triggers.kind.${c.kind.name}.note', const {});

  return TriggerSuggestion(
    id: 'trg_${s.sign.id}_${c.kind.name}_$variant',
    signId: s.sign.id,
    label: label,
    category: s.sign.category,
    kind: c.kind,
    variant: variant,
    when: _noEmDash(text(whenKey, args).trim()),
    then: _noEmDash(text(thenKey, args).trim()),
    reason: _noEmDash('$first $note'),
    score: c.score,
    whenKey: whenKey,
    thenKey: thenKey,
    weightedNights: s.weighted,
    nights30: s.nights30,
    lastSeenNightsAgo: s.lastAge,
    withTest: withTest && c.kind == TriggerKind.day,
  );
}

class _Cand {
  _Cand(this.data, this.kind, this.score);

  final _SignData data;
  final TriggerKind kind;
  final double score;
}

int _compareCand(_Cand a, _Cand b) {
  final byScore = b.score.compareTo(a.score);
  if (byScore != 0) {
    return byScore;
  }
  final byKind = a.kind.index.compareTo(b.kind.index);
  if (byKind != 0) {
    return byKind;
  }
  return _compareData(a.data, b.data);
}

// ---------------------------------------------------------------------------
// Podněty do notifikace
// ---------------------------------------------------------------------------

/// Šablony podnětů podle kategorie. První je vázaná na kategorii, další
/// jsou obecné. U vnitřního prožitku chybí „Dnes hledej“ a „Kde dnes
/// potkáš“, protože hledat paniku nebo spěch nedává smysl.
const Map<DreamSignCategory, List<String>> _promptKeys = {
  DreamSignCategory.context: [
    'triggers.prompt.context',
    'triggers.prompt.ask',
    'triggers.prompt.seek',
    'triggers.prompt.where',
    'triggers.prompt.known',
  ],
  DreamSignCategory.action: [
    'triggers.prompt.action',
    'triggers.prompt.ask',
    'triggers.prompt.seek',
    'triggers.prompt.where',
    'triggers.prompt.known',
  ],
  DreamSignCategory.form: [
    'triggers.prompt.form',
    'triggers.prompt.ask',
    'triggers.prompt.seek',
    'triggers.prompt.where',
    'triggers.prompt.known',
  ],
  DreamSignCategory.awareness: [
    'triggers.prompt.awareness',
    'triggers.prompt.ask',
    'triggers.prompt.known',
  ],
};

/// Krátké podněty do notifikace (každý ≤ 60 znaků v UTF-16, tedy i s emoji)
/// se slovy uživatele.
///
/// * [max] se ořízne na 1 až 5 (výchozí 4). Bez použitelné Stopy vrátí
///   prázdný seznam a appka použije obecné podněty z `reality_prompts.json`.
/// * Pořadí Stop stejné jako u [suggestTriggers] (bez vlivu druhu), s denní
///   rotací. Stopy se střídají dokola, každá s jinou formou podnětu, a forma
///   se mezi podněty pokud možno neopakuje (habituace).
/// * Label se nikdy neskloňuje. Dlouhý label se zkrátí na hranici slova se
///   „…“, label bez písmen, číslic i emoji se přeskočí.
List<String> realityPromptsFromSigns(
  List<DreamSign> signs,
  List<Dream> dreams, {
  required DateTime now,
  int max = 4,
  Set<String> excludeSignIds = const {},
  TriggerText text = czechTriggerText,
}) {
  final target = max.clamp(1, 5);
  final today = _dayIndex(now);
  final data = _signData(signs, dreams, today: today, exclude: excludeSignIds);
  final ranked = [
    for (final s in data) (s, s.base * (1 + triggerRotation * (2 * _hash01('${s.sign.id}|prompt|$today') - 1))),
  ]..sort((a, b) {
      final c = b.$2.compareTo(a.$2);
      return c != 0 ? c : _compareData(a.$1, b.$1);
    });
  final top = [for (final r in ranked.take(target)) r.$1];

  final out = <String>[];
  final usedKeys = <String>{};
  final usedBySign = <String, Set<String>>{};
  var progress = true;
  while (out.length < target && progress) {
    progress = false;
    for (final s in top) {
      if (out.length >= target) {
        break;
      }
      final keys = _promptKeys[s.sign.category]!;
      final start = (_hash01('${s.sign.id}|tpl|$today') * keys.length).floor() % keys.length;
      final order = [for (var i = 0; i < keys.length; i++) keys[(start + i) % keys.length]];
      final mine = usedBySign.putIfAbsent(s.sign.id, () => <String>{});
      final free = order.where((k) => !mine.contains(k)).toList();
      if (free.isEmpty) {
        continue;
      }
      final fresh = free.where((k) => !usedKeys.contains(k)).toList();
      for (final key in [...fresh, ...free.where((k) => usedKeys.contains(k))]) {
        final p = _renderPrompt(key, s.label, text);
        mine.add(key);
        if (p != null && !out.contains(p)) {
          out.add(p);
          usedKeys.add(key);
          progress = true;
          break;
        }
      }
    }
  }
  return out;
}

String? _renderPrompt(String key, String label, TriggerText text) {
  String render(String l) => _noEmDash(text(key, {'label': l}).trim()).replaceAll('….', '…');
  var p = render(label);
  if (p.length <= promptMaxLength) {
    return p;
  }
  final overhead = render('').length;
  final room = promptMaxLength - overhead;
  if (room < 5) {
    return null;
  }
  p = render(_truncate(label, room));
  return p.length <= promptMaxLength ? p : null;
}

// ---------------------------------------------------------------------------
// Přenos do snu
// ---------------------------------------------------------------------------

/// Měřený krok přenosu do snu.
enum TransferMetric {
  /// `realityCheckInDream`: hlavní metrika.
  realityCheck,

  /// Lucidní sen: `lucid`, nebo lucidita ≥ 5 z 10 (stejně jako v Laboratoři).
  lucid,
}

/// Slovní verdikt. Klíče textů `triggers.verdict.<name>.title` a `.body`.
enum TransferVerdict {
  /// Stopa není v žádném snu.
  noDreams,

  /// Od začátku plánu méně než [TransferThresholds.minAfter] snů se Stopou.
  tooEarly,

  /// Po začátku dost snů, před ním málo: srovnání nemám.
  noBaseline,

  /// Před plánem ani po něm ani jednou.
  noEventsYet,

  /// Data zatím nerozhodla.
  noChangeYet,

  /// Náznak: po začátku plánu spíš častěji.
  possiblyMore,

  /// Jasně častěji než před plánem.
  clearlyMore,

  /// Jasně méně často než před plánem.
  fewer,
}

/// Prahy verdiktů a prior. Odůvodnění a simulace v `B_notes.md`.
class TransferThresholds {
  const TransferThresholds({
    this.minAfter = 3,
    this.minBefore = 3,
    this.priorWeight = 4,
    this.margin = 0.10,
    this.clearDirection = 0.95,
    this.clearMargin = 0.80,
    this.possibleDirection = 0.90,
    this.possibleMinEvents = 2,
    this.priorCenter = TransferPriorCenter.before,
  })  : assert(priorWeight >= 0),
        assert(minAfter >= 2 && minBefore >= 1);

  /// Snů se Stopou od začátku plánu, než dám verdikt (spec: od 3 objevení).
  final int minAfter;

  /// Snů se Stopou před plánem, než srovnávám.
  final int minBefore;

  /// Skeptický prior „po = před“: období před plánem má plochý prior
  /// Beta(1, 1), období od začátku plánu Beta(1 + w·m, 1 + w·(1 − m)), kde
  /// m je podíl před plánem a w = [priorWeight] „snů“. Pár snů po začátku
  /// plánu proto výsledek nepřeklopí. Základ Beta(1, 1) drží hustotu bez
  /// pólu na okraji. Varianta [TransferPriorCenter.pooled] centruje oba
  /// prior na společný podíl (víc ztrácí sílu při malém „před“).
  final double priorWeight;

  /// Prakticky významný rozdíl: o 1 z 10 snů víc.
  final double margin;

  /// „Častěji než dřív“: P(po > před) ≥ 0,95 a P(po − před > margin) ≥ 0,80.
  final double clearDirection;
  final double clearMargin;

  /// „Náznak“: P(po > před) ≥ 0,90, po začátku aspoň 2 události a víc než před.
  final double possibleDirection;
  final int possibleMinEvents;
  final TransferPriorCenter priorCenter;
}

/// Kam míří skeptický prior, viz [TransferThresholds.priorWeight].
enum TransferPriorCenter { pooled, before }

/// Počty v jednom období.
class TransferCounts {
  const TransferCounts({this.dreams = 0, this.realityChecks = 0, this.lucid = 0});

  final int dreams;
  final int realityChecks;
  final int lucid;

  int of(TransferMetric m) => m == TransferMetric.realityCheck ? realityChecks : lucid;

  TransferCounts operator +(TransferCounts o) =>
      TransferCounts(dreams: dreams + o.dreams, realityChecks: realityChecks + o.realityChecks, lucid: lucid + o.lucid);

  @override
  String toString() => '($dreams snů, test $realityChecks, lucid $lucid)';
}

/// Verdikt pro jednu metriku s hotovými texty a klíči.
class TransferMetricResult {
  const TransferMetricResult({
    required this.metric,
    required this.verdict,
    required this.args,
    required this.title,
    required this.body,
    this.probMore,
    this.probMoreByMargin,
    this.probLessByMargin,
  });

  final TransferMetric metric;
  final TransferVerdict verdict;

  /// Hodnoty pro zástupné symboly v textech verdiktu.
  final Map<String, String> args;
  final String title;
  final String body;

  /// P(po > před) z modelu. Jen pro ladění a testy, uživateli se neukazuje.
  final double? probMore;
  final double? probMoreByMargin;
  final double? probLessByMargin;

  String get titleKey => 'triggers.verdict.${verdict.name}.title';
  String get bodyKey => 'triggers.verdict.${verdict.name}.body';
}

/// Přenos pro jednu Stopu (nebo pro „jakoukoli Stopu“, pak [signId] je null).
class SignTransfer {
  const SignTransfer({
    required this.signId,
    required this.label,
    required this.category,
    required this.before,
    required this.after,
    required this.realityCheck,
    required this.lucid,
    required this.funnelAfter,
  });

  final String? signId;
  final String label;
  final DreamSignCategory? category;
  final TransferCounts before;
  final TransferCounts after;
  TransferCounts get total => before + after;
  final TransferMetricResult realityCheck;
  final TransferMetricResult lucid;

  /// Trychtýř od začátku plánu: „Stopa ve snu 6× · test ve snu 1× · lucidita 1×“.
  final String funnelAfter;

  TransferMetricResult result(TransferMetric m) => m == TransferMetric.realityCheck ? realityCheck : lucid;
}

class TransferStats {
  const TransferStats({
    required this.since,
    required this.signs,
    required this.anySign,
    required this.dreamsBefore,
    required this.dreamsAfter,
  });

  final DateTime since;

  /// Jedna položka na Stopu, v pořadí vstupu (duplicitní id jen jednou).
  final List<SignTransfer> signs;

  /// Sny s aspoň jednou ze Stop (každý sen jednou).
  final SignTransfer anySign;

  /// Všechny zapsané sny (bez prázdných nocí) před a od začátku plánu.
  final int dreamsBefore;
  final int dreamsAfter;
}

/// Měření přenosu do snu. Před = `nightDate` před dnem [since], po = od něj.
/// Prázdné noci se nepočítají, stejný sen (id) jen jednou.
///
/// Srovnání před a po není experiment: zlepšit se můžeš i bez plánu (víc
/// praxe, lepší vybavování). Proto texty říkají „od začátku plánu“, ne
/// „díky plánu“, a příčinu nechávají na Laboratoři (experiment E4).
TransferStats transferStats(
  List<DreamSign> signs,
  List<Dream> dreams, {
  required DateTime since,
  TransferThresholds thresholds = const TransferThresholds(),
  TriggerText text = czechTriggerText,
}) {
  final sinceDay = _dayIndex(since);
  final unique = _uniqueDreams(dreams);
  var dreamsBefore = 0, dreamsAfter = 0;
  for (final d in unique) {
    if (_dayIndex(d.nightDate) < sinceDay) {
      dreamsBefore++;
    } else {
      dreamsAfter++;
    }
  }

  TransferCounts count(bool Function(Dream d) has, bool after) {
    var n = 0, rc = 0, l = 0;
    for (final d in unique) {
      if ((_dayIndex(d.nightDate) >= sinceDay) != after || !has(d)) {
        continue;
      }
      n++;
      if (d.realityCheckInDream) {
        rc++;
      }
      if (_isLucid(d)) {
        l++;
      }
    }
    return TransferCounts(dreams: n, realityChecks: rc, lucid: l);
  }

  SignTransfer row(String? id, String label, DreamSignCategory? cat, bool Function(Dream d) has) {
    final before = count(has, false);
    final after = count(has, true);
    return SignTransfer(
      signId: id,
      label: label,
      category: cat,
      before: before,
      after: after,
      realityCheck: _verdict(TransferMetric.realityCheck, before, after, thresholds, text),
      lucid: _verdict(TransferMetric.lucid, before, after, thresholds, text),
      funnelAfter: text('triggers.funnel', {
        'stopa': '${after.dreams}',
        'test': '${after.realityChecks}',
        'lucid': '${after.lucid}',
      }),
    );
  }

  final rows = <SignTransfer>[];
  final seen = <String>{};
  for (final s in signs) {
    if (!seen.add(s.id)) {
      continue;
    }
    rows.add(row(s.id, _truncate(_cleanLabel(s.label), triggerLabelMax), s.category, (d) => d.signIds.contains(s.id)));
  }
  final any = row(null, '', null, (d) => d.signIds.any(seen.contains));

  return TransferStats(
    since: since,
    signs: rows,
    anySign: any,
    dreamsBefore: dreamsBefore,
    dreamsAfter: dreamsAfter,
  );
}

bool _isLucid(Dream d) => d.lucid || d.lucidity >= 5;

TransferMetricResult _verdict(
  TransferMetric m,
  TransferCounts before,
  TransferCounts after,
  TransferThresholds t,
  TriggerText text,
) {
  final co = text('triggers.metric.${m.name}', const {});
  final kb = before.of(m), nb = before.dreams, ka = after.of(m), na = after.dreams;
  final args = <String, String>{
    'co': co,
    'Co': _capitalize(co),
    'pred': naturalFrequency(kb, nb, text),
    'po': naturalFrequency(ka, na, text),
    'nPred': '$nb',
    'nPo': '$na',
    'pocet': dreamCount(na, text),
    'min': '${t.minAfter}',
  };

  final c = classifyTransfer(kb, nb, ka, na, thresholds: t);
  final v = c.verdict;
  return TransferMetricResult(
    metric: m,
    verdict: v,
    args: args,
    title: _noEmDash(text('triggers.verdict.${v.name}.title', args)),
    body: _noEmDash(text('triggers.verdict.${v.name}.body', args)),
    probMore: c.comparison?.pMore,
    probMoreByMargin: c.comparison?.pMoreByMargin,
    probLessByMargin: c.comparison?.pLessByMargin,
  );
}

/// Verdikt a (když se počítal) model pro [classifyTransfer].
class TransferClassification {
  const TransferClassification(this.verdict, [this.comparison]);

  final TransferVerdict verdict;
  final BetaComparison? comparison;
}

/// Slovní verdikt z počtů: [kb] událostí v [nb] snech se Stopou před
/// plánem, [ka] v [na] od jeho začátku.
TransferClassification classifyTransfer(
  int kb,
  int nb,
  int ka,
  int na, {
  TransferThresholds thresholds = const TransferThresholds(),
}) {
  final t = thresholds;
  if (nb + na == 0) {
    return const TransferClassification(TransferVerdict.noDreams);
  }
  if (na < t.minAfter) {
    return const TransferClassification(TransferVerdict.tooEarly);
  }
  if (nb < t.minBefore) {
    return const TransferClassification(TransferVerdict.noBaseline);
  }
  if (ka == 0 && kb == 0) {
    return const TransferClassification(TransferVerdict.noEventsYet);
  }
  final BetaComparison post;
  if (t.priorCenter == TransferPriorCenter.pooled) {
    final m = (ka + kb + 0.5) / (na + nb + 1);
    post = betaComparison(ka, na, kb, nb,
        priorA: 1 + t.priorWeight * m, priorB: 1 + t.priorWeight * (1 - m), margin: t.margin);
  } else {
    final m = (kb + 0.5) / (nb + 1);
    post = betaComparison(ka, na, kb, nb,
        priorA: 1 + t.priorWeight * m,
        priorB: 1 + t.priorWeight * (1 - m),
        beforePriorA: 1,
        beforePriorB: 1,
        margin: t.margin);
  }
  final TransferVerdict v;
  if (post.pMore >= t.clearDirection && post.pMoreByMargin >= t.clearMargin) {
    v = TransferVerdict.clearlyMore;
  } else if (1 - post.pMore >= t.clearDirection && post.pLessByMargin >= t.clearMargin) {
    v = TransferVerdict.fewer;
  } else if (post.pMore >= t.possibleDirection && ka >= t.possibleMinEvents && ka * nb > kb * na) {
    v = TransferVerdict.possiblyMore;
  } else {
    v = TransferVerdict.noChangeYet;
  }
  return TransferClassification(v, post);
}

/// Výsledek srovnání dvou beta-binomických podílů.
class BetaComparison {
  const BetaComparison(this.pMore, this.pMoreByMargin, this.pLessByMargin);

  /// P(po > před).
  final double pMore;

  /// P(po − před > margin).
  final double pMoreByMargin;

  /// P(před − po > margin).
  final double pLessByMargin;
}

/// Posterior po = Beta(a + ka, b + na − ka), před = Beta(a + kb, b + nb − kb),
/// srovnání numericky na mřížce 2000 binů (deterministické, chyba < 0,001).
BetaComparison betaComparison(
  int ka,
  int na,
  int kb,
  int nb, {
  double priorA = 1,
  double priorB = 4,
  double? beforePriorA,
  double? beforePriorB,
  double margin = 0.10,
}) {
  const bins = 2000;
  final pa = _betaGrid(priorA + ka, priorB + na - ka, bins);
  final pb = _betaGrid((beforePriorA ?? priorA) + kb, (beforePriorB ?? priorB) + nb - kb, bins);
  final shift = (margin * bins).round();
  return BetaComparison(_pGreater(pa, pb, 0), _pGreater(pa, pb, shift), _pGreater(pb, pa, shift));
}

List<double> _betaGrid(double a, double b, int bins) {
  final logs = List<double>.filled(bins, 0);
  var top = double.negativeInfinity;
  for (var i = 0; i < bins; i++) {
    final x = (i + 0.5) / bins;
    logs[i] = (a - 1) * math.log(x) + (b - 1) * math.log(1 - x);
    top = math.max(top, logs[i]);
  }
  var sum = 0.0;
  final p = List<double>.filled(bins, 0);
  for (var i = 0; i < bins; i++) {
    p[i] = math.exp(logs[i] - top);
    sum += p[i];
  }
  for (var i = 0; i < bins; i++) {
    p[i] /= sum;
  }
  return p;
}

/// P(X > Y + shift / bins); shoda v binu se počítá napůl.
double _pGreater(List<double> px, List<double> py, int shift) {
  final cum = List<double>.filled(py.length + 1, 0);
  for (var j = 0; j < py.length; j++) {
    cum[j + 1] = cum[j] + py[j];
  }
  var s = 0.0;
  for (var i = 0; i < px.length; i++) {
    final j = i - shift;
    if (j < 0) {
      continue;
    }
    s += px[i] * (cum[j] + 0.5 * py[j]);
  }
  return s.clamp(0.0, 1.0);
}

// ---------------------------------------------------------------------------
// Čísla česky
// ---------------------------------------------------------------------------

/// Přirozená četnost „ve 2 ze 7 snů“ (Gigerenzer a Hoffrage 1995).
String naturalFrequency(int k, int n, [TriggerText text = czechTriggerText]) {
  if (n <= 0) {
    return text('triggers.freq.empty', const {});
  }
  if (n == 1) {
    return text(k > 0 ? 'triggers.freq.oneYes' : 'triggers.freq.oneNo', const {});
  }
  final snu = text('triggers.word.dream.gen', const {});
  if (k <= 0) {
    return text('triggers.freq.none', {'z': czechPrepZ(n), 'n': '$n', 'snu': snu});
  }
  return text('triggers.freq.some', {'v': czechPrepV(k), 'k': '$k', 'z': czechPrepZ(n), 'n': '$n', 'snu': snu});
}

/// Počet snů v 6. pádě: „v žádném snu“, „v 1 snu“, „ve 2 snech“.
String dreamCount(int n, [TriggerText text = czechTriggerText]) {
  if (n <= 0) {
    return text('triggers.count.zero', const {});
  }
  final snech = text(n == 1 ? 'triggers.word.dream.loc1' : 'triggers.word.dream.loc', const {});
  return text('triggers.count.some', {'v': czechPrepV(n), 'n': '$n', 'snech': snech});
}

/// „v“ nebo „ve“ před číslem psaným číslicí, podle toho, jak se čte
/// („ve dvou“, „ve třech“, „ve čtyřech“, „ve stu“, jinak „v“).
String czechPrepV(int n) => _startsWithAny(_leadWord(n), const ['dv', 'tř', 'čt', 'st', 'v', 'f']) ? 've' : 'v';

/// „z“ nebo „ze“ před číslem („ze dvou“, „ze tří“, „ze šesti“, „ze sedmi“,
/// „ze sta“, jinak „z“).
String czechPrepZ(int n) =>
    _startsWithAny(_leadWord(n), const ['dv', 'tř', 'čt', 'st', 's', 'š', 'z', 'ž']) ? 'ze' : 'z';

bool _startsWithAny(String w, List<String> prefixes) => prefixes.any(w.startsWith);

const List<String> _units = [
  'nula', 'jedna', 'dva', 'tři', 'čtyři', 'pět', 'šest', 'sedm', 'osm', 'devět', //
  'deset', 'jedenáct', 'dvanáct', 'třináct', 'čtrnáct', 'patnáct', 'šestnáct', 'sedmnáct', 'osmnáct', 'devatenáct',
];
const List<String> _tens = [
  '', '', 'dvacet', 'třicet', 'čtyřicet', 'padesát', 'šedesát', 'sedmdesát', 'osmdesát', 'devadesát', //
];

/// První slovo čísla, jak se čte nahlas.
String _leadWord(int n) {
  n = n.abs();
  if (n >= 1000000) {
    return 'milion';
  }
  if (n >= 1000) {
    final t = n ~/ 1000;
    return t == 1 ? 'tisíc' : _leadWord(t);
  }
  if (n >= 100) {
    final h = n ~/ 100;
    return h == 1 ? 'sto' : _leadWord(h);
  }
  if (n >= 20) {
    return _tens[n ~/ 10];
  }
  return _units[n];
}

// ---------------------------------------------------------------------------
// Společná příprava dat
// ---------------------------------------------------------------------------

class _SignData {
  _SignData(this.sign, this.label);

  final DreamSign sign;
  final String label;
  final Set<int> nights = {};
  double weighted = 0;
  int nights30 = 0;
  int? lastAge;
  int dreams = 0;
  int nightmares = 0;
  int odd = 0;
  double base = 0;

  int get nightsTotal => nights.length;
}

int _compareData(_SignData a, _SignData b) {
  final byCount = b.sign.count.compareTo(a.sign.count);
  if (byCount != 0) {
    return byCount;
  }
  final byLabel = a.label.toLowerCase().compareTo(b.label.toLowerCase());
  if (byLabel != 0) {
    return byLabel;
  }
  return a.sign.id.compareTo(b.sign.id);
}

List<Dream> _uniqueDreams(List<Dream> dreams) {
  final seen = <String>{};
  return [
    for (final d in dreams)
      if (!d.isEmptyNight && seen.add(d.id)) d,
  ];
}

/// Spočítá skóre Stop. Vynechá vyřazené, bez labelu, z nočních můr a
/// duplicity (stejné id nebo stejný label bez ohledu na velikost písmen;
/// zůstane ta se silnějším skóre).
List<_SignData> _signData(List<DreamSign> signs, List<Dream> dreams, {required int today, required Set<String> exclude}) {
  final byId = <String, _SignData>{};
  for (final s in signs) {
    if (exclude.contains(s.id) || byId.containsKey(s.id)) {
      continue;
    }
    final label = _cleanLabel(s.label);
    if (!_usableLabel(label)) {
      continue;
    }
    byId[s.id] = _SignData(s, label);
  }
  for (final d in _uniqueDreams(dreams)) {
    final day = _dayIndex(d.nightDate);
    if (day > today) {
      continue;
    }
    final hay = '${d.title} ${d.text}'.toLowerCase();
    final odd = _oddityStems.any(hay.contains);
    for (final id in d.signIds.toSet()) {
      final s = byId[id];
      if (s == null) {
        continue;
      }
      s.dreams++;
      if (d.nightmare) {
        s.nightmares++;
      }
      if (odd) {
        s.odd++;
      }
      s.nights.add(day);
    }
  }
  final out = <_SignData>[];
  for (final s in byId.values) {
    // Součet v pevném pořadí (od nejnovější noci), ať skóre nezávisí na
    // pořadí vstupu ani v posledním bitu.
    for (final day in s.nights.toList()..sort((a, b) => b.compareTo(a))) {
      final age = today - day;
      s.weighted += math.pow(0.5, age / triggerHalfLifeNights).toDouble();
      if (age < 30) {
        s.nights30++;
      }
      s.lastAge ??= age;
    }
    if (s.dreams > 0 && s.nightmares * 2 >= s.dreams) {
      continue;
    }
    final extra = math.max(0, s.sign.count - s.nightsTotal);
    final oddity = s.dreams == 0 ? 0.0 : s.odd / s.dreams;
    final cat = s.sign.category;
    final catBonus = (cat == DreamSignCategory.action || cat == DreamSignCategory.form) ? 1.2 : 1.0;
    s.base = (s.weighted + 0.02 * math.min(extra, 10)) * (1 + 0.5 * oddity) * catBonus;
    out.add(s);
  }
  out.sort((a, b) {
    final c = b.base.compareTo(a.base);
    return c != 0 ? c : _compareData(a, b);
  });
  final labels = <String>{};
  return [
    for (final s in out)
      if (labels.add(s.label.toLowerCase())) s,
  ];
}

// ---------------------------------------------------------------------------
// Label
// ---------------------------------------------------------------------------

final RegExp _controls = RegExp(r'[\u0000-\u001F\u007F-\u009F​  ﻿]');
final RegExp _quotes = RegExp('[„“”"«»‚‘]');
final RegExp _spaces = RegExp(r'\s+');
final RegExp _edgePunct = RegExp(r'^[\s.,;:!?…\-–]+|[\s.,;:!?…\-–]+$');
final RegExp _meaningful = RegExp(r'[\p{L}\p{N}\p{So}]', unicode: true);

/// Uklidí label: řídicí znaky a zalomení pryč, mezery sloučí, uvozovky
/// odstraní (label se vkládá do „“), dlouhou pomlčku nahradí krátkou a
/// odřízne interpunkci na krajích. Jinak nechá slova uživatele, jak jsou.
String _cleanLabel(String raw) {
  var s = raw.replaceAll(_controls, ' ').replaceAll(_quotes, '');
  s = _noEmDash(s).replaceAll(_spaces, ' ').trim();
  return s.replaceAll(_edgePunct, '');
}

bool _usableLabel(String s) => s.isNotEmpty && _meaningful.hasMatch(s);

String _noEmDash(String s) => s.replaceAll('\u2014', '–');

String _capitalize(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

/// Zkrátí [s] na nejvýš [max] jednotek UTF-16 (jak počítá `String.length`)
/// včetně „…“. Řeže přednostně na mezeře, nikdy uprostřed emoji.
String _truncate(String s, int max) {
  if (s.length <= max) {
    return s;
  }
  final runes = s.runes.toList();
  final budget = max - 1;
  var k = 0, units = 0;
  while (k < runes.length && units + (runes[k] > 0xFFFF ? 2 : 1) <= budget) {
    units += runes[k] > 0xFFFF ? 2 : 1;
    k++;
  }
  // Nekončit před spojovacím znakem nebo modifikátorem emoji, ani po ZWJ.
  while (k > 0 && k < runes.length && (_isExtender(runes[k]) || runes[k - 1] == 0x200D)) {
    k--;
  }
  // Vlajky jsou dvojice regionálních symbolů.
  var ri = 0;
  for (var i = k - 1; i >= 0 && _isRegional(runes[i]); i--) {
    ri++;
  }
  if (ri.isOdd && k < runes.length && _isRegional(runes[k])) {
    k--;
  }
  var cut = String.fromCharCodes(runes.take(k));
  final space = cut.lastIndexOf(' ');
  if (space >= budget * 0.5) {
    cut = cut.substring(0, space);
  }
  cut = cut.replaceAll(_edgePunct, '');
  if (cut.isEmpty) {
    return '…';
  }
  return '$cut…';
}

bool _isExtender(int r) =>
    r == 0x200D ||
    (r >= 0xFE00 && r <= 0xFE0F) ||
    (r >= 0x1F3FB && r <= 0x1F3FF) ||
    (r >= 0x0300 && r <= 0x036F) ||
    (r >= 0xE0020 && r <= 0xE007F) ||
    r == 0x20E3;

bool _isRegional(int r) => r >= 0x1F1E6 && r <= 0x1F1FF;

// ---------------------------------------------------------------------------
// Pomocné
// ---------------------------------------------------------------------------

/// Kalendářní den (podle místních polí data, odolné vůči změně času).
int _dayIndex(DateTime d) => DateTime.utc(d.year, d.month, d.day).difference(DateTime.utc(1970)).inDays;

/// Deterministické číslo 0 až 1 z textu: FNV-1a 32 bit a promíchání bitů
/// z MurmurHash3 (bez něj se poslední znak textu skoro nepromítne do
/// horních bitů). Jen 32bitová aritmetika, takže stejně i na webu.
double _hash01(String text) {
  var h = 0x811C9DC5;
  for (final c in text.codeUnits) {
    h ^= c;
    h = _mul32(h, 0x01000193);
  }
  h ^= h >>> 16;
  h = _mul32(h, 0x85EBCA6B);
  h ^= h >>> 13;
  h = _mul32(h, 0xC2B2AE35);
  h ^= h >>> 16;
  return h / 4294967296.0;
}

int _mul32(int a, int b) {
  final lo = (a * (b & 0xFFFF)) & 0xFFFFFFFF;
  final hi = ((a * (b >>> 16)) & 0xFFFF) << 16;
  return (lo + hi) & 0xFFFFFFFF;
}
