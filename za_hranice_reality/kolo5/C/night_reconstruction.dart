/// Rekonstrukce noci podle REM oken (kolo 5, část C; `inovace.md`, funkce 5).
///
/// Ráno projde odhadnutá REM okna uplynulé noci **od posledního k prvnímu**
/// a ke každému vrátí jednu krátkou otázku na vybavení. Nejčerstvější je
/// poslední sen, proto se začíná u konce noci.
///
/// Čistý Dart 3.6, bez závislostí. Texty jsou v `rekonstrukce_texty.json`
/// pod `texts.reconstruction`. Funkce vrací jen klíče a argumenty, nikdy
/// hotové věty, takže texty jdou upravit bez zásahu do kódu.
///
/// ## Pravidla
///
/// 1. **Jen okna před probuzením.** Okno, které začíná v [wake] nebo později,
///    se zahodí. Okno přes [wake] se ořízne na `[from, wake)`.
/// 2. **Úrovně.** `unlikely` nikdy. `low` jen tehdy, když před probuzením
///    není žádné okno `mid` ani `high`. Pak má otázka opatrnější znění
///    („možná“ místo „nejspíš“).
/// 3. **Okna → epizody.** Model z kola 4 dělí jednu REM periodu na souvislé
///    úseky stejné úrovně (třeba `mid`, `high`, `mid`). Ptát se třikrát na
///    jednu periodu by otravovalo, a tak se vybraná okna, která se dotýkají
///    nebo je dělí nejvýš [reconstructionMergeGap], spojí do jedné epizody.
///    Úroveň epizody je nejvyšší úroveň jejích oken.
/// 4. **Čas otázky = střed epizody** (po oříznutí na [wake]), zaokrouhlený na
///    10 minut na ciferníku. Proč střed:
///    * okno je pásmo odhadu a obě jeho hrany jsou stejně nejisté (model
///      vyhlazuje přes 15 minut, okna se kreslí s měkkým okrajem). Střed je
///      bod s nejmenší nejhorší chybou, nejvýš polovina šířky okna,
///    * u typické periody `mid`, `high`, `mid` padne střed do jádra `high`,
///    * konec okna by u poslední epizody splynul s probuzením. Otázka by pak
///      zněla jako „co se ti zdálo, když ses budil“, a na to už odpověděl
///      ranní zápis,
///    * začátek by u dlouhých ranních period (30 až 60 minut) mířil na
///      okraj, kde REM teprve začíná.
///
///    Zaokrouhluje se na nejbližší násobek 10 minut (polovina nahoru). Když
///    by zaokrouhlený čas padl za [wake], vezme se násobek pod ním.
/// 5. **Zapsaný sen.** Sen s `dreamAt` uvnitř epizody (`[from, to)` před
///    oříznutím) z ní udělá variantu „navázal na něj ještě jiný?“. Sen
///    s `wokeFromDream` patří k epizodě i tehdy, když `dreamAt` padne do
///    [reconstructionWokeTolerance] po jejím konci, protože se člověk budí
///    na konci REM a zařízení probuzení často značí posunutě. Sny bez
///    `dreamAt` se k oknům nepřiřazují. Prázdná noc („Nic si nevybavuju“,
///    `RecallLevel.none`) není zapsaný sen.
/// 6. **Stejný čas.** Dvě epizody se stejným zaokrouhleným časem se sloučí
///    do jedné otázky (vyšší úroveň, sny obou). Porovnává se okamžik, ne
///    text na ciferníku: při přechodu na zimní čas jsou 2:30 a 2:30 o hodinu
///    později dvě různé chvíle a zůstanou obě.
/// 7. **Pořadí a limit.** Od posledního k prvnímu, nejvýš [max] otázek.
///    Číslo okna ([RecallPrompt.windowNumber]) se počítá chronologicky od
///    začátku noci, takže poslední okno má nejvyšší číslo („OKNO 4“).
///
/// Půlnoc ani letní čas nevadí: všechno se počítá na okamžicích
/// (`DateTime.difference`, `add`), jen zaokrouhlení a popisek čtou ciferník
/// v pásmu, ve kterém přišly vstupy (appka předává místní čas).
library;

import 'dream_types.dart';
import 'rem_window_types.dart';

/// Krok zaokrouhlení času otázky (minuty).
const reconstructionRoundMinutes = 10;

/// Okna, mezi kterými je mezera nejvýš tahle, jsou jedna REM epizoda.
const reconstructionMergeGap = Duration(minutes: 10);

/// Jak dlouho po konci epizody ještě patří k ní sen s `wokeFromDream`.
const reconstructionWokeTolerance = Duration(minutes: 15);

/// Druh otázky.
enum RecallKind {
  /// V epizodě zatím žádný sen není: „Co to bylo?“
  ask,

  /// V epizodě už sen zapsaný je: „Navázal na něj ještě jiný?“
  continueRecorded,
}

/// Mluvnický rod oslovení. Výchozí je [neutral], protože „snil“ i „byl“
/// jsou v minulém čase mužský rod. Mužská a ženská varianta jsou volitelné
/// (třeba podle nastavení profilu).
enum RecallGender { neutral, masculine, feminine }

/// Jedna otázka průvodce rekonstrukcí.
class RecallPrompt {
  const RecallPrompt({
    required this.id,
    required this.order,
    required this.windowNumber,
    required this.windows,
    required this.from,
    required this.to,
    required this.at,
    required this.level,
    required this.kind,
    required this.dreamIds,
    required this.textKey,
    required this.nightTextKey,
    required this.followUpKeys,
    required this.labelKey,
    required this.labelArgs,
  });

  /// Stabilní id podle zaokrouhleného okamžiku v UTC, např. `recall-2026-10-24T03:20Z`.
  final String id;

  /// Pořadí v průvodci, 0 = první otázka (poslední okno noci).
  final int order;

  /// Číslo okna v noci, chronologicky od 1 (poslední okno má nejvyšší číslo).
  final int windowNumber;

  /// Původní okna, ze kterých epizoda vznikla (seřazená podle začátku).
  final List<RemWindow> windows;

  /// Začátek epizody a její konec oříznutý na probuzení.
  final DateTime from, to;

  /// Čas otázky: střed epizody zaokrouhlený na 10 minut, nikdy po probuzení.
  final DateTime at;

  /// Nejvyšší úroveň v epizodě (`low` jen v nouzovém případě).
  final RemLevel level;
  final RecallKind kind;

  /// Id snů zapsaných v epizodě, podle `createdAt` a `id`.
  final List<String> dreamIds;

  /// Klíč hlavní otázky v `rekonstrukce_texty.json`, argumenty [args].
  final String textKey;

  /// Klíč krátké otázky pro noční červený režim (nejvýš 6 slov), argumenty [args].
  final String nightTextKey;

  /// Obecné doplňující otázky k epizodě (bez argumentů), v pořadí zobrazení.
  final List<String> followUpKeys;

  /// Klíč štítku okna („OKNO 4 · 5:20–5:50“) a jeho argumenty.
  final String labelKey;
  final Map<String, String> labelArgs;

  /// Čas otázky na ciferníku, např. `5:20`.
  String get timeLabel => formatClock(at);

  /// Argumenty pro [textKey] a [nightTextKey].
  Map<String, String> get args => {'cas': timeLabel};

  @override
  String toString() => 'RecallPrompt($id, #$windowNumber, $timeLabel, ${level.name}, ${kind.name})';
}

/// Otázky k REM oknům uplynulé noci od posledního k prvnímu.
///
/// * [windows]: odhad REM oken pro tuhle noc (pořadí ani duplicity nevadí),
/// * [wake]: ranní probuzení (u nočního režimu „teď“),
/// * [dreamsThatNight]: sny zapsané k téhle noci,
/// * [max]: nejvýš kolik otázek (0 nebo méně = žádná),
/// * [gender]: rod oslovení, výchozí neutrální.
///
/// Vstupy se nemění. Stejné vstupy dají vždy stejný výsledek.
List<RecallPrompt> reconstructNight({
  required List<RemWindow> windows,
  required DateTime wake,
  required List<Dream> dreamsThatNight,
  int max = 4,
  RecallGender gender = RecallGender.neutral,
}) {
  if (max <= 0) {
    return const [];
  }

  // 1. a 2. Okna před probuzením a výběr úrovní.
  final valid = [
    for (final w in windows)
      if (w.level != RemLevel.unlikely && w.to.isAfter(w.from) && w.from.isBefore(wake)) w,
  ];
  final strong = [
    for (final w in valid)
      if (w.level == RemLevel.mid || w.level == RemLevel.high) w,
  ];
  final pool = strong.isNotEmpty ? strong : valid;
  if (pool.isEmpty) {
    return const [];
  }
  pool.sort(_compareWindows);

  // 3. Spojení sousedních oken do epizod.
  final episodes = <_Episode>[];
  for (final w in pool) {
    final last = episodes.isEmpty ? null : episodes.last;
    if (last != null && !w.from.isAfter(last.rawTo.add(reconstructionMergeGap))) {
      last.absorb(w);
    } else {
      episodes.add(_Episode(w));
    }
  }

  // 4. Čas otázky.
  for (final e in episodes) {
    e.to = e.rawTo.isAfter(wake) ? wake : e.rawTo;
    final mid = e.from.add(e.to.difference(e.from) ~/ 2);
    var at = roundToMinutes(mid, reconstructionRoundMinutes);
    if (at.isAfter(wake)) {
      at = at.subtract(const Duration(minutes: reconstructionRoundMinutes));
    }
    e.at = at;
  }

  // 5. Zapsané sny.
  final dreams = [
    for (final d in dreamsThatNight)
      if (d.dreamAt != null && !d.isEmptyNight) d,
  ]..sort(_compareDreams);
  for (final d in dreams) {
    final e = _episodeFor(d, episodes);
    if (e != null) {
      e.dreams.add(d);
    }
  }

  // 6. Stejný zaokrouhlený okamžik = jedna otázka.
  final byAt = <int, _Episode>{};
  for (final e in episodes) {
    final key = e.at.microsecondsSinceEpoch;
    final other = byAt[key];
    if (other == null) {
      byAt[key] = e;
    } else {
      other.mergeSameTime(e);
    }
  }
  final merged = byAt.values.toList()..sort((a, b) => a.at.compareTo(b.at));

  // 7. Číslování od začátku noci, výstup od konce.
  final out = <RecallPrompt>[];
  for (var i = merged.length - 1; i >= 0 && out.length < max; i--) {
    out.add(merged[i].toPrompt(order: out.length, number: i + 1, gender: gender));
  }
  return out;
}

/// Zaokrouhlí [t] na nejbližší násobek [minutes] na ciferníku (polovina nahoru).
///
/// Čte minuty a sekundy v pásmu [t] a posouvá okamžik, takže výsledek je
/// správný i u přechodu na letní a zimní čas (posun je vždy menší než
/// [minutes] a přechody leží na celé hodině).
DateTime roundToMinutes(DateTime t, int minutes) {
  final stepUs = minutes * Duration.microsecondsPerMinute;
  final intoUs = (t.minute % minutes) * Duration.microsecondsPerMinute +
      t.second * Duration.microsecondsPerSecond +
      t.millisecond * Duration.microsecondsPerMillisecond +
      t.microsecond;
  final down = t.subtract(Duration(microseconds: intoUs));
  return intoUs * 2 >= stepUs ? down.add(Duration(minutes: minutes)) : down;
}

/// Čas na ciferníku bez úvodní nuly u hodin: `5:20`, `0:10`, `23:40`.
String formatClock(DateTime t) => '${t.hour}:${t.minute.toString().padLeft(2, '0')}';

/// Najde text podle tečkového klíče v rozparsovaném `rekonstrukce_texty.json`
/// (kořen s `texts`). Vrátí `null`, když klíč chybí.
String? lookupReconstructionText(Map<String, Object?> json, String key) {
  Object? node = json['texts'];
  for (final part in key.split('.')) {
    if (node is Map && node.containsKey(part)) {
      node = node[part];
    } else {
      return null;
    }
  }
  return node is String ? node : null;
}

/// Doplní zástupné symboly `{jmeno}` z [args]. Neznámé symboly nechá být.
String fillReconstructionText(String template, Map<String, String> args) => template.replaceAllMapped(
      RegExp(r'\{(\w+)\}'),
      (m) => args[m.group(1)] ?? m.group(0)!,
    );

/// Všechny klíče textů rekonstrukce a jejich zástupné symboly.
///
/// Klíče z kódu (otázky, štítky, doplňující otázky, noční režim) i klíče,
/// které čte jen UI (nabídka, průvodce, konec). Test hlídá, že sedí na
/// `rekonstrukce_texty.json` přesně, bez chybějících i bez navíc.
const Map<String, List<String>> reconstructionTextKeys = {
  // Hlavní otázka, okno bez zapsaného snu (mid, high).
  'reconstruction.ask.neutral': ['cas'],
  'reconstruction.ask.masculine': ['cas'],
  'reconstruction.ask.feminine': ['cas'],
  // Nouzově z oken low: opatrnější znění.
  'reconstruction.askLow.neutral': ['cas'],
  'reconstruction.askLow.masculine': ['cas'],
  'reconstruction.askLow.feminine': ['cas'],
  // Okno se zapsaným snem (podmět je sen, rod netřeba).
  'reconstruction.continue.one': ['cas'],
  'reconstruction.continue.many': ['cas'],
  // Doplňující obecné otázky (nikdy obsahové).
  'reconstruction.followUp.where.neutral': [],
  'reconstruction.followUp.where.masculine': [],
  'reconstruction.followUp.where.feminine': [],
  'reconstruction.followUp.who': [],
  'reconstruction.followUp.doing.neutral': [],
  'reconstruction.followUp.doing.masculine': [],
  'reconstruction.followUp.doing.feminine': [],
  'reconstruction.followUp.feeling': [],
  'reconstruction.followUp.light': [],
  // Štítek okna.
  'reconstruction.label.window': ['cislo', 'od', 'do'],
  'reconstruction.label.windowPoint': ['cislo', 'cas'],
  'reconstruction.label.estimate': [],
  // Noční červený režim: nejvýš 6 slov.
  'reconstruction.night.ask': ['cas'],
  'reconstruction.night.continue': ['cas'],
  'reconstruction.night.voice': [],
  'reconstruction.night.skip': [],
  'reconstruction.night.sleep': [],
  // Nabídka (UI).
  'reconstruction.offer.afterEmpty': [],
  'reconstruction.offer.afterFirst': [],
  'reconstruction.offer.start': [],
  'reconstruction.offer.later': [],
  'reconstruction.offer.never': [],
  'reconstruction.offer.notification': [],
  // Průvodce (UI).
  'reconstruction.flow.firstUse': [],
  'reconstruction.flow.intro': ['cas'],
  'reconstruction.flow.estimate': [],
  'reconstruction.flow.between': [],
  'reconstruction.flow.sure': [],
  'reconstruction.flow.maybe': [],
  'reconstruction.flow.nothing': [],
  'reconstruction.flow.skip': [],
  'reconstruction.flow.stop': [],
  'reconstruction.flow.timeUp': [],
  'reconstruction.flow.keepGoing': [],
  'reconstruction.flow.noWindows': [],
  'reconstruction.flow.privacy': [],
  // Konec (UI), tvar podle počtu snů k noci.
  'reconstruction.done.none': [],
  'reconstruction.done.one': [],
  'reconstruction.done.few': ['pocet'],
  'reconstruction.done.many': ['pocet'],
};

/// Klíč konce průvodce podle počtu snů k noci (0, 1, 2–4, 5 a víc).
String reconstructionDoneKey(int dreams) => dreams <= 0
    ? 'reconstruction.done.none'
    : dreams == 1
        ? 'reconstruction.done.one'
        : dreams <= 4
            ? 'reconstruction.done.few'
            : 'reconstruction.done.many';

// ---------------------------------------------------------------------------

class _Episode {
  _Episode(RemWindow w)
      : from = w.from,
        rawTo = w.to,
        to = w.to,
        at = w.from,
        level = w.level,
        windows = [w];

  DateTime from;

  /// Konec před oříznutím na probuzení (pro přiřazení snů).
  DateTime rawTo;
  DateTime to;
  DateTime at;
  RemLevel level;
  final List<RemWindow> windows;
  final List<Dream> dreams = [];

  void absorb(RemWindow w) {
    windows.add(w);
    if (w.to.isAfter(rawTo)) {
      rawTo = w.to;
    }
    if (w.level.index > level.index) {
      level = w.level;
    }
  }

  void mergeSameTime(_Episode o) {
    if (o.from.isBefore(from)) {
      from = o.from;
    }
    if (o.rawTo.isAfter(rawTo)) {
      rawTo = o.rawTo;
    }
    if (o.to.isAfter(to)) {
      to = o.to;
    }
    if (o.level.index > level.index) {
      level = o.level;
    }
    windows
      ..addAll(o.windows)
      ..sort(_compareWindows);
    dreams
      ..addAll(o.dreams)
      ..sort(_compareDreams);
  }

  bool get _isLow => level == RemLevel.low;

  RecallPrompt toPrompt({required int order, required int number, required RecallGender gender}) {
    final recorded = dreams.isNotEmpty;
    final od = roundToMinutes(from, reconstructionRoundMinutes);
    var doo = roundToMinutes(to, reconstructionRoundMinutes);
    if (doo.isAfter(to)) {
      doo = doo.subtract(const Duration(minutes: reconstructionRoundMinutes));
    }
    final point = !doo.isAfter(od);
    final g = gender.name;
    return RecallPrompt(
      id: 'recall-${_utcId(at)}',
      order: order,
      windowNumber: number,
      windows: List.unmodifiable(windows),
      from: from,
      to: to,
      at: at,
      level: level,
      kind: recorded ? RecallKind.continueRecorded : RecallKind.ask,
      dreamIds: List.unmodifiable([for (final d in dreams) d.id]),
      textKey: recorded
          ? (dreams.length > 1 ? 'reconstruction.continue.many' : 'reconstruction.continue.one')
          : (_isLow ? 'reconstruction.askLow.$g' : 'reconstruction.ask.$g'),
      nightTextKey: recorded ? 'reconstruction.night.continue' : 'reconstruction.night.ask',
      followUpKeys: List.unmodifiable([
        'reconstruction.followUp.where.$g',
        'reconstruction.followUp.who',
        'reconstruction.followUp.doing.$g',
        'reconstruction.followUp.feeling',
        'reconstruction.followUp.light',
      ]),
      labelKey: point ? 'reconstruction.label.windowPoint' : 'reconstruction.label.window',
      labelArgs: Map.unmodifiable(point
          ? {'cislo': '$number', 'cas': formatClock(at)}
          : {'cislo': '$number', 'od': formatClock(od), 'do': formatClock(doo)}),
    );
  }
}

/// Epizoda pro zapsaný sen, nebo `null`.
_Episode? _episodeFor(Dream d, List<_Episode> episodes) {
  final t = d.dreamAt!;
  for (final e in episodes) {
    if (!t.isBefore(e.from) && t.isBefore(e.rawTo)) {
      return e;
    }
  }
  if (!d.wokeFromDream) {
    return null;
  }
  _Episode? best;
  for (final e in episodes) {
    final after = t.difference(e.rawTo);
    if (!after.isNegative && after <= reconstructionWokeTolerance) {
      if (best == null || e.rawTo.isAfter(best.rawTo)) {
        best = e;
      }
    }
  }
  return best;
}

int _compareWindows(RemWindow a, RemWindow b) {
  var c = a.from.compareTo(b.from);
  if (c != 0) {
    return c;
  }
  c = a.to.compareTo(b.to);
  if (c != 0) {
    return c;
  }
  c = b.level.index.compareTo(a.level.index);
  if (c != 0) {
    return c;
  }
  return b.peak.compareTo(a.peak);
}

int _compareDreams(Dream a, Dream b) {
  final c = a.createdAt.compareTo(b.createdAt);
  return c != 0 ? c : a.id.compareTo(b.id);
}

String _utcId(DateTime t) {
  final u = t.toUtc();
  String two(int v) => v.toString().padLeft(2, '0');
  return '${u.year}-${two(u.month)}-${two(u.day)}T${two(u.hour)}:${two(u.minute)}Z';
}
