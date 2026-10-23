// Testy pro night_reconstruction.dart (kolo 5, část C).
// V appce uprav importy na umístění night_reconstruction.dart a typů appky.
// Texty hledá v RECON_DATA/rekonstrukce_texty.json, jinak v pracovní složce
// a o složku výš.
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:recon_pkg/dream_types.dart';
import 'package:recon_pkg/night_reconstruction.dart';
import 'package:recon_pkg/rem_window_types.dart';
import 'package:test/test.dart';

// ---------------------------------------------------------------------------
// Pomocníci
// ---------------------------------------------------------------------------

final night = DateTime(2026, 10, 23);
final onset = DateTime(2026, 10, 23, 23, 30);
final wake = DateTime(2026, 10, 24, 6, 30);

DateTime at(int h, int m, {int day = 24, int s = 0}) => DateTime(2026, 10, day, h, m, s);

RemWindow win(DateTime from, DateTime to, RemLevel level, {double peak = 0.6}) => RemWindow(
      from: from,
      to: to,
      fromOffset: from.difference(onset).inMinutes,
      toOffset: to.difference(onset).inMinutes,
      level: level,
      peak: peak,
      recentNights: 14,
      bothNights: 3,
      ouraOnlyNights: 5,
      garminOnlyNights: 1,
      dreamMarks: 0,
      wokeMarks: 0,
    );

Dream dream(String id, DateTime? when, {bool woke = false, RecallLevel recall = RecallLevel.partial}) => Dream(
      id: id,
      createdAt: DateTime(2026, 10, 24, 7, 0),
      nightDate: night,
      dreamAt: when,
      wokeFromDream: woke,
      recall: recall,
    );

/// Typická noc: čtyři REM periody, každá rozdělená na mid/high/mid jako z modelu kola 4.
List<RemWindow> typicalNight() => [
      win(at(0, 50), at(1, 0), RemLevel.unlikely, peak: 0.1),
      win(at(1, 0), at(1, 15), RemLevel.low, peak: 0.35),
      win(at(2, 40), at(2, 50), RemLevel.mid),
      win(at(2, 50), at(3, 5), RemLevel.high, peak: 0.85),
      win(at(3, 5), at(3, 15), RemLevel.mid),
      win(at(3, 40), at(3, 55), RemLevel.unlikely, peak: 0.2),
      win(at(4, 10), at(4, 40), RemLevel.mid),
      win(at(5, 15), at(5, 25), RemLevel.mid),
      win(at(5, 25), at(5, 45), RemLevel.high, peak: 0.95),
      win(at(5, 45), at(5, 55), RemLevel.mid),
    ];

Map<String, Object?> loadTexts() {
  final env = Platform.environment['RECON_DATA'];
  final candidates = [
    if (env != null) '$env/rekonstrukce_texty.json',
    'rekonstrukce_texty.json',
    '../rekonstrukce_texty.json',
  ];
  for (final c in candidates) {
    final f = File(c);
    if (f.existsSync()) {
      return jsonDecode(f.readAsStringSync()) as Map<String, Object?>;
    }
  }
  throw StateError('rekonstrukce_texty.json nenalezen (nastav RECON_DATA)');
}

/// Všechny listy JSON jako tečkové klíče.
Map<String, String> leaves(Object? node, [String prefix = '']) {
  final out = <String, String>{};
  if (node is Map) {
    for (final e in node.entries) {
      out.addAll(leaves(e.value, prefix.isEmpty ? '${e.key}' : '$prefix.${e.key}'));
    }
  } else if (node is String) {
    out[prefix] = node;
  } else {
    throw StateError('Nečekaný typ u $prefix: ${node.runtimeType}');
  }
  return out;
}

List<String> placeholders(String s) => [for (final m in RegExp(r'\{(\w+)\}').allMatches(s)) m.group(1)!]..sort();

int words(String s) => s.trim().split(RegExp(r'\s+')).length;

String render(Map<String, Object?> json, String key, Map<String, String> args) {
  final t = lookupReconstructionText(json, key);
  expect(t, isNotNull, reason: 'chybí text $key');
  return fillReconstructionText(t!, args);
}

/// Shrnutí výsledku pro porovnání.
List<String> summary(List<RecallPrompt> ps) => [
      for (final p in ps)
        '${p.id}|${p.order}|${p.windowNumber}|${p.timeLabel}|${p.level.name}|${p.kind.name}|'
            '${p.textKey}|${p.dreamIds.join(',')}|${p.labelKey}|${p.labelArgs}',
    ];

void main() {
  final texts = loadTexts();

  group('Pořadí a výběr oken', () {
    test('od posledního okna k prvnímu, čísla oken chronologicky', () {
      final ps = reconstructNight(windows: typicalNight(), wake: wake, dreamsThatNight: const []);
      expect(ps.map((p) => p.timeLabel), ['5:40', '4:30', '3:00']);
      expect(ps.map((p) => p.order), [0, 1, 2]);
      expect(ps.map((p) => p.windowNumber), [3, 2, 1]);
      for (var i = 1; i < ps.length; i++) {
        expect(ps[i].at.isBefore(ps[i - 1].at), isTrue);
      }
      expect(ps.first.kind, RecallKind.ask);
      expect(ps.first.textKey, 'reconstruction.ask.neutral');
      expect(ps.first.labelKey, 'reconstruction.label.window');
      expect(ps.first.labelArgs, {'cislo': '3', 'od': '5:20', 'do': '5:50'});
      expect(ps.first.id, 'recall-${_utc(ps.first.at)}');
    });

    test('sousední okna mid, high, mid jsou jedna epizoda s nejvyšší úrovní', () {
      final ps = reconstructNight(windows: typicalNight(), wake: wake, dreamsThatNight: const []);
      final last = ps.first;
      expect(last.windows, hasLength(3));
      expect(last.level, RemLevel.high);
      expect(last.from, at(5, 15));
      expect(last.to, at(5, 55));
      // Mezera 10 min ještě spojuje, 15 min už ne.
      final gap10 = reconstructNight(
        windows: [win(at(4, 0), at(4, 20), RemLevel.mid), win(at(4, 30), at(4, 50), RemLevel.mid)],
        wake: wake,
        dreamsThatNight: const [],
      );
      expect(gap10, hasLength(1));
      final gap15 = reconstructNight(
        windows: [win(at(4, 0), at(4, 20), RemLevel.mid), win(at(4, 35), at(4, 55), RemLevel.mid)],
        wake: wake,
        dreamsThatNight: const [],
      );
      expect(gap15, hasLength(2));
    });

    test('okna unlikely se vynechávají vždy', () {
      final onlyUnlikely = [
        win(at(2, 0), at(2, 30), RemLevel.unlikely),
        win(at(5, 0), at(5, 40), RemLevel.unlikely, peak: 0.29),
      ];
      expect(reconstructNight(windows: onlyUnlikely, wake: wake, dreamsThatNight: const []), isEmpty);
      final ps = reconstructNight(windows: typicalNight(), wake: wake, dreamsThatNight: const []);
      for (final p in ps) {
        expect(p.windows.where((w) => w.level == RemLevel.unlikely), isEmpty);
      }
    });

    test('low jen když není nic jiného, pak opatrnější otázka', () {
      final mixed = [
        win(at(1, 0), at(1, 20), RemLevel.low),
        win(at(3, 0), at(3, 20), RemLevel.mid),
        win(at(6, 0), at(6, 20), RemLevel.low),
      ];
      final ps = reconstructNight(windows: mixed, wake: wake, dreamsThatNight: const []);
      expect(ps.map((p) => p.timeLabel), ['3:10']);
      expect(ps.single.level, RemLevel.mid);

      final lowOnly = [win(at(1, 0), at(1, 20), RemLevel.low), win(at(6, 0), at(6, 20), RemLevel.low)];
      final low = reconstructNight(windows: lowOnly, wake: wake, dreamsThatNight: const []);
      expect(low.map((p) => p.timeLabel), ['6:10', '1:10']);
      expect(low.every((p) => p.level == RemLevel.low), isTrue);
      expect(low.first.textKey, 'reconstruction.askLow.neutral');
      expect(render(texts, low.first.textKey, low.first.args), 'Kolem 6:10 se ti možná něco zdálo. Vybavíš si to?');

      // Okno mid až po probuzení se nepočítá, takže low zůstane jako nouzové.
      final midAfterWake = [...lowOnly, win(at(6, 40), at(7, 0), RemLevel.high)];
      expect(
        reconstructNight(windows: midAfterWake, wake: wake, dreamsThatNight: const []).map((p) => p.level),
        [RemLevel.low, RemLevel.low],
      );
    });
  });

  group('Čas otázky', () {
    test('střed epizody zaokrouhlený na 10 minut, polovina nahoru', () {
      String label(DateTime from, DateTime to) =>
          reconstructNight(windows: [win(from, to, RemLevel.mid)], wake: wake, dreamsThatNight: const [])
              .single
              .timeLabel;
      expect(label(at(4, 0), at(4, 28)), '4:10'); // střed 4:14
      expect(label(at(4, 0), at(4, 30)), '4:20'); // střed 4:15, polovina nahoru
      expect(label(at(4, 3), at(4, 7)), '4:10'); // střed 4:05
      expect(label(at(4, 0), at(4, 9)), '4:00'); // střed 4:04:30
      expect(roundToMinutes(at(4, 14, s: 59), 10), at(4, 10));
      expect(roundToMinutes(at(4, 15), 10), at(4, 20));
      expect(roundToMinutes(at(4, 20), 10), at(4, 20));
      expect(roundToMinutes(at(23, 56, day: 23), 10), at(0, 0));
      for (final p in reconstructNight(windows: typicalNight(), wake: wake, dreamsThatNight: const [])) {
        expect(p.at.minute % 10, 0);
        expect(p.at.second, 0);
      }
    });

    test('okna po probuzení se ignorují, okno přes probuzení se ořízne', () {
      final windows = [
        win(at(5, 0), at(5, 20), RemLevel.mid),
        win(at(6, 10), at(6, 50), RemLevel.high), // přes probuzení 6:30
        win(at(6, 30), at(7, 0), RemLevel.high), // začíná v probuzení
        win(at(7, 10), at(7, 40), RemLevel.high), // celé po probuzení
      ];
      final ps = reconstructNight(windows: windows, wake: wake, dreamsThatNight: const []);
      expect(ps.map((p) => p.timeLabel), ['6:20', '5:10']);
      expect(ps.first.to, wake);
      expect(ps.first.windows, hasLength(1));
      expect(ps.every((p) => !p.at.isAfter(wake)), isTrue);

      // Zaokrouhlení by padlo za probuzení: vezme se násobek pod ním.
      final late = reconstructNight(
        windows: [win(at(6, 20), at(6, 50), RemLevel.high)],
        wake: at(6, 32),
        dreamsThatNight: const [],
      );
      expect(late.single.timeLabel, '6:30'); // střed 6:26 → 6:30, ještě před 6:32
      final later = reconstructNight(
        windows: [win(at(6, 26), at(6, 50), RemLevel.high)],
        wake: at(6, 33),
        dreamsThatNight: const [],
      );
      expect(later.single.timeLabel, '6:30'); // střed 6:29:30 → 6:30, před 6:33
      final clipped = reconstructNight(
        windows: [win(at(6, 26), at(6, 50), RemLevel.high)],
        wake: at(6, 34),
        dreamsThatNight: const [],
      );
      expect(clipped.single.timeLabel, '6:30'); // střed 6:30 přesně
      final edge = reconstructNight(
        windows: [win(at(6, 21), at(6, 50), RemLevel.high)],
        wake: at(6, 29),
        dreamsThatNight: const [],
      );
      expect(edge.single.timeLabel, '6:20'); // střed 6:25 → 6:30 je po 6:29 → 6:20
    });

    test('epizody se stejným zaokrouhleným časem jsou jedna otázka', () {
      // Oddělené epizody (mezera víc než 10 min) se střetnou jen u probuzení:
      // střed poslední 6:18:30 → 6:20 je po probuzení 6:19, takže 6:10, a to je i čas předchozí (6:06 → 6:10).
      final windows = [
        win(at(6, 5), at(6, 7), RemLevel.mid),
        win(at(6, 18), at(6, 40), RemLevel.high, peak: 0.9),
      ];
      final ps = reconstructNight(
        windows: windows,
        wake: at(6, 19),
        dreamsThatNight: [dream('a', at(6, 6)), dream('b', at(6, 18, s: 30))],
      );
      expect(ps, hasLength(1));
      final p = ps.single;
      expect(p.timeLabel, '6:10');
      expect(p.level, RemLevel.high);
      expect(p.windows, hasLength(2));
      expect(p.dreamIds, ['a', 'b']);
      expect(p.from, at(6, 5));
      expect(p.to, at(6, 19));
      expect(p.labelKey, 'reconstruction.label.windowPoint');
      expect(p.labelArgs, {'cislo': '1', 'cas': '6:10'});

      // Kousek dál od probuzení se nestřetnou: dvě otázky.
      expect(
        reconstructNight(windows: windows, wake: at(6, 40), dreamsThatNight: const []).map((p) => p.timeLabel),
        ['6:30', '6:10'],
      );
    });

    test('duplicitní a překryvná okna jsou jedna epizoda s nejvyšší úrovní', () {
      final windows = [
        win(at(5, 0), at(5, 20), RemLevel.mid),
        win(at(5, 0), at(5, 20), RemLevel.high, peak: 0.9),
        win(at(5, 0), at(5, 20), RemLevel.mid),
        win(at(4, 50), at(5, 6), RemLevel.mid),
      ];
      final ps = reconstructNight(windows: windows, wake: wake, dreamsThatNight: [dream('a', at(5, 5))]);
      expect(ps, hasLength(1));
      expect(ps.single.level, RemLevel.high);
      expect(ps.single.windows, hasLength(4));
      expect(ps.single.dreamIds, ['a']);
      expect(ps.single.timeLabel, '5:10'); // 4:50–5:20, střed 5:05 → 5:10
    });
  });

  group('Zapsané sny', () {
    test('sen s dreamAt v okně dá variantu se zapsaným snem', () {
      final ps = reconstructNight(
        windows: typicalNight(),
        wake: wake,
        dreamsThatNight: [dream('d1', at(4, 20))],
      );
      final w = ps.firstWhere((p) => p.timeLabel == '4:30');
      expect(w.kind, RecallKind.continueRecorded);
      expect(w.textKey, 'reconstruction.continue.one');
      expect(w.nightTextKey, 'reconstruction.night.continue');
      expect(w.dreamIds, ['d1']);
      expect(render(texts, w.textKey, w.args), 'Kolem 4:30 máš zapsaný sen. Navázal na něj ještě jiný?');
      expect(ps.where((p) => p != w).every((p) => p.kind == RecallKind.ask), isTrue);
    });

    test('probuzení ze snu těsně po konci okna, víc snů, sny bez času a prázdná noc', () {
      final ps = reconstructNight(
        windows: typicalNight(),
        wake: wake,
        dreamsThatNight: [
          dream('woke', at(6, 5), woke: true), // 10 min po konci 5:55
          dream('woke2', at(6, 8), woke: true), // 13 min po konci
          dream('far', at(3, 35), woke: true), // 20 min po konci 3:15: mimo toleranci
          dream('notWoke', at(3, 20)), // 5 min po konci, ale bez probuzení: mimo
          dream('noTime', null, woke: true),
          dream('empty', at(5, 30), recall: RecallLevel.none),
        ],
      );
      final last = ps.first;
      expect(last.kind, RecallKind.continueRecorded);
      expect(last.dreamIds, ['woke', 'woke2']);
      expect(last.textKey, 'reconstruction.continue.many');
      expect(render(texts, last.textKey, last.args), 'Kolem 5:40 máš zapsané sny. Navázal na ně ještě jiný?');
      final early = ps.firstWhere((p) => p.timeLabel == '3:00');
      expect(early.kind, RecallKind.ask);
      expect(early.dreamIds, isEmpty);
      expect(ps.expand((p) => p.dreamIds), isNot(contains('noTime')));
      expect(ps.expand((p) => p.dreamIds), isNot(contains('empty')));

      // Ranní sen s probuzením v okně přes probuzení.
      final morning = reconstructNight(
        windows: [win(at(6, 0), at(6, 45), RemLevel.high)],
        wake: wake,
        dreamsThatNight: [dream('m', wake, woke: true)],
      );
      expect(morning.single.kind, RecallKind.continueRecorded);
      expect(morning.single.timeLabel, '6:20'); // střed 6:15 oříznutého okna 6:00–6:30
    });
  });

  group('Limit, půlnoc, letní čas, prázdné vstupy', () {
    test('max omezí počet otázek a bere nejpozdější okna', () {
      final windows = [for (var h = 0; h < 7; h++) win(at(h, 0), at(h, 20), RemLevel.mid)];
      final all = reconstructNight(windows: windows, wake: at(7, 30), dreamsThatNight: const [], max: 10);
      expect(all, hasLength(7));
      final four = reconstructNight(windows: windows, wake: at(7, 30), dreamsThatNight: const []);
      expect(four.map((p) => p.timeLabel), ['6:10', '5:10', '4:10', '3:10']);
      expect(four.map((p) => p.windowNumber), [7, 6, 5, 4]);
      expect(reconstructNight(windows: windows, wake: at(7, 30), dreamsThatNight: const [], max: 1), hasLength(1));
      expect(reconstructNight(windows: windows, wake: at(7, 30), dreamsThatNight: const [], max: 0), isEmpty);
      expect(reconstructNight(windows: windows, wake: at(7, 30), dreamsThatNight: const [], max: -3), isEmpty);
    });

    test('noc přes půlnoc: pořadí podle okamžiku, popisky 23:50 a 0:00', () {
      final windows = [
        win(at(0, 30), at(0, 50), RemLevel.mid), // 0:40
        win(at(23, 40, day: 23), at(0, 0), RemLevel.mid), // 23:50
        win(at(23, 50, day: 24), at(0, 10, day: 25), RemLevel.high), // příští noc, po probuzení
      ];
      final ps = reconstructNight(windows: windows, wake: wake, dreamsThatNight: const []);
      expect(ps.map((p) => p.timeLabel), ['0:40', '23:50']);
      expect(ps.map((p) => p.windowNumber), [2, 1]);
      final cross = reconstructNight(
        windows: [win(at(23, 50, day: 23), at(0, 10), RemLevel.mid)],
        wake: wake,
        dreamsThatNight: [dream('x', at(23, 55, day: 23))],
      );
      expect(cross.single.timeLabel, '0:00');
      expect(cross.single.labelArgs, {'cislo': '1', 'od': '23:50', 'do': '0:10'});
      expect(cross.single.kind, RecallKind.continueRecorded);
    });

    test('letní čas Europe/Prague: počítá se na okamžicích, ciferník podle pásma', () {
      // Podzim: 25. 10. 2026 ve 3:00 SELČ zpět na 2:00 SEČ (01:00 UTC).
      final a = DateTime.utc(2026, 10, 25, 0, 20).toLocal(); // 2:20 SELČ v Praze
      final b = DateTime.utc(2026, 10, 25, 1, 20).toLocal(); // 2:20 SEČ v Praze
      final fallWake = DateTime.utc(2026, 10, 25, 5, 0).toLocal(); // 6:00 SEČ
      final fall = reconstructNight(
        windows: [
          win(a, a.add(const Duration(minutes: 20)), RemLevel.mid),
          win(b, b.add(const Duration(minutes: 20)), RemLevel.mid),
        ],
        wake: fallWake,
        dreamsThatNight: const [],
      );
      expect(fall, hasLength(2), reason: 'stejný ciferník, jiný okamžik: nesloučit');
      // Střed v UTC 01:30 a 00:30; zaokrouhluje se na ciferníku (v pásmu +5:45 to je jiný okamžik).
      expect(fall[0].at, roundToMinutes(DateTime.utc(2026, 10, 25, 1, 30).toLocal(), 10));
      expect(fall[1].at, roundToMinutes(DateTime.utc(2026, 10, 25, 0, 30).toLocal(), 10));
      expect(fall[0].at.difference(fall[1].at), const Duration(hours: 1));
      expect(fall[0].id, isNot(fall[1].id));
      expect(fall[0].timeLabel, formatClock(roundToMinutes(DateTime.utc(2026, 10, 25, 1, 30).toLocal(), 10)));

      // Jaro: 29. 3. 2026 ve 2:00 SEČ na 3:00 SELČ (01:00 UTC). Okno 1:40 SEČ až 3:20 SELČ trvá 40 min.
      final from = DateTime.utc(2026, 3, 29, 0, 40).toLocal();
      final to = DateTime.utc(2026, 3, 29, 1, 20).toLocal();
      final spring = reconstructNight(
        windows: [win(from, to, RemLevel.high)],
        wake: DateTime.utc(2026, 3, 29, 4, 30).toLocal(),
        dreamsThatNight: [dream('s', DateTime.utc(2026, 3, 29, 1, 5).toLocal())],
      );
      expect(spring.single.at, roundToMinutes(DateTime.utc(2026, 3, 29, 1, 0).toLocal(), 10));
      expect(spring.single.kind, RecallKind.continueRecorded);

      final prague = DateTime(2026, 10, 25, 1).timeZoneOffset != DateTime(2026, 10, 25, 4).timeZoneOffset &&
          DateTime(2026, 10, 25, 4).timeZoneOffset == const Duration(hours: 1);
      if (prague) {
        expect(fall.map((p) => p.timeLabel), ['2:30', '2:30']);
        expect(spring.single.timeLabel, '3:00', reason: 'naivní střed ciferníku 2:30 v Praze neexistuje');
        expect(spring.single.labelArgs, {'cislo': '1', 'od': '1:40', 'do': '3:20'});
      }
    });

    test('prázdné a vadné vstupy', () {
      expect(reconstructNight(windows: const [], wake: wake, dreamsThatNight: const []), isEmpty);
      expect(
        reconstructNight(windows: const [], wake: wake, dreamsThatNight: [dream('a', at(5, 0))]),
        isEmpty,
      );
      final broken = [
        win(at(5, 0), at(5, 0), RemLevel.high), // nulová délka
        win(at(5, 30), at(5, 10), RemLevel.high), // obrácené
      ];
      expect(reconstructNight(windows: broken, wake: wake, dreamsThatNight: const []), isEmpty);
      expect(
        reconstructNight(windows: typicalNight(), wake: at(0, 30), dreamsThatNight: const []),
        isEmpty,
        reason: 'probuzení před všemi okny',
      );
    });
  });

  group('Rod, determinismus, texty', () {
    test('výchozí znění je neutrální, mužské a ženské na přání', () {
      final windows = [win(at(5, 10), at(5, 30), RemLevel.high)];
      final n = reconstructNight(windows: windows, wake: wake, dreamsThatNight: const []).single;
      expect(n.textKey, 'reconstruction.ask.neutral');
      expect(render(texts, n.textKey, n.args), 'Kolem 5:20 se ti nejspíš něco zdálo. Co to bylo?');
      expect(n.followUpKeys.first, 'reconstruction.followUp.where.neutral');
      final m = reconstructNight(
        windows: windows,
        wake: wake,
        dreamsThatNight: const [],
        gender: RecallGender.masculine,
      ).single;
      expect(render(texts, m.textKey, m.args), 'Kolem 5:20 jsi nejspíš snil. Co se dělo?');
      expect(render(texts, m.followUpKeys.first, const {}), 'Kde jsi byl?');
      final f = reconstructNight(
        windows: windows,
        wake: wake,
        dreamsThatNight: const [],
        gender: RecallGender.feminine,
      ).single;
      expect(render(texts, f.textKey, f.args), 'Kolem 5:20 jsi nejspíš snila. Co se dělo?');
      expect(render(texts, f.followUpKeys[2], const {}), 'Co jsi dělala?');
      // Varianta se zapsaným snem je pro všechny rody stejná.
      for (final g in RecallGender.values) {
        final r = reconstructNight(
          windows: windows,
          wake: wake,
          dreamsThatNight: [dream('x', at(5, 15))],
          gender: g,
        ).single;
        expect(r.textKey, 'reconstruction.continue.one');
      }
      // Neutrální texty nemají tvary minulého času s rodem.
      final neutral =
          leaves(texts['texts']).entries.where((e) => !e.key.endsWith('masculine') && !e.key.endsWith('feminine'));
      for (final e in neutral) {
        expect(e.value, isNot(matches(RegExp(r'\b(snil|snila|byl jsi|jsi byl|jsi byla|dělal|dělala)\b'))),
            reason: e.key);
      }
    });

    test('determinismus: zamíchaný vstup dá stejný výsledek, vstupy se nemění', () {
      final windows = List<RemWindow>.unmodifiable(typicalNight());
      final dreams =
          List<Dream>.unmodifiable([dream('b', at(4, 20)), dream('a', at(4, 30)), dream('c', at(6, 0), woke: true)]);
      final base = summary(reconstructNight(windows: windows, wake: wake, dreamsThatNight: dreams));
      final rnd = math.Random(5);
      for (var i = 0; i < 50; i++) {
        final w = [...windows]..shuffle(rnd);
        final d = [...dreams]..shuffle(rnd);
        expect(summary(reconstructNight(windows: w, wake: wake, dreamsThatNight: d)), base);
      }
      expect(base[1], contains('|a,b|'), reason: 'sny podle createdAt a id');
    });

    test('náhodné noci: invarianty platí vždy', () {
      final rnd = math.Random(2026);
      for (var n = 0; n < 400; n++) {
        final windows = <RemWindow>[];
        var t = onset.add(Duration(minutes: rnd.nextInt(60)));
        final count = rnd.nextInt(12);
        for (var i = 0; i < count; i++) {
          t = t.add(Duration(minutes: rnd.nextInt(50)));
          final len = 1 + rnd.nextInt(40);
          windows.add(win(t, t.add(Duration(minutes: len)), RemLevel.values[rnd.nextInt(4)], peak: rnd.nextDouble()));
          t = t.add(Duration(minutes: len));
        }
        final w = onset.add(Duration(minutes: 240 + rnd.nextInt(360)));
        final dreamCount = rnd.nextInt(4);
        final dreams = [
          for (var i = 0; i < dreamCount; i++)
            dream('d$i', rnd.nextBool() ? null : onset.add(Duration(minutes: rnd.nextInt(600))), woke: rnd.nextBool()),
        ];
        final max = 1 + rnd.nextInt(5);
        final ps = reconstructNight(windows: windows, wake: w, dreamsThatNight: dreams, max: max);
        expect(ps.length, lessThanOrEqualTo(max));
        final before = windows.where((x) => x.from.isBefore(w) && x.to.isAfter(x.from));
        final hasStrong = before.any((x) => x.level == RemLevel.mid || x.level == RemLevel.high);
        for (var i = 0; i < ps.length; i++) {
          final p = ps[i];
          expect(p.order, i);
          expect(p.at.isAfter(w), isFalse);
          expect(p.at.minute % 10, 0);
          expect(p.level, isNot(RemLevel.unlikely));
          if (hasStrong) {
            expect(p.level, isNot(RemLevel.low));
          }
          expect(p.to.isAfter(w), isFalse);
          if (i > 0) {
            expect(p.at.isBefore(ps[i - 1].at), isTrue);
            expect(p.windowNumber, ps[i - 1].windowNumber - 1);
          }
          expect(p.kind == RecallKind.continueRecorded, p.dreamIds.isNotEmpty);
          for (final key in [p.textKey, p.nightTextKey, p.labelKey, ...p.followUpKeys]) {
            final s = render(texts, key, {...p.args, ...p.labelArgs});
            expect(s, isNot(contains('{')), reason: key);
          }
        }
        if (ps.isNotEmpty) {
          expect(ps.first.windowNumber, greaterThanOrEqualTo(ps.length));
        }
        if (before.where((x) => x.level != RemLevel.unlikely).isNotEmpty) {
          expect(ps, isNotEmpty);
        }
      }
    });

    test('texty: klíče přesně podle kódu, zástupné symboly, délky, bez dlouhé pomlčky a procent', () {
      final all = leaves(texts['texts']);
      expect(all.keys.toSet(), reconstructionTextKeys.keys.toSet());
      expect(all.keys.every((k) => k.startsWith('reconstruction.')), isTrue);
      for (final e in reconstructionTextKeys.entries) {
        final s = all[e.key]!;
        expect(placeholders(s), [...e.value]..sort(), reason: e.key);
        expect(s, isNot(contains('—')), reason: e.key);
        expect(s, isNot(contains('%')), reason: e.key);
        expect(s, isNot(contains('"')), reason: '${e.key}: české uvozovky');
        expect(s.trim(), s, reason: e.key);
        expect(s, isNot(contains('  ')), reason: e.key);
        expect(s, isNot(matches(RegExp(r'\b(vy|vás|vám|jste)\b', caseSensitive: false))), reason: '${e.key}: tykání');
      }
      for (final e in all.entries.where((e) => e.key.startsWith('reconstruction.night.'))) {
        expect(words(e.value), lessThanOrEqualTo(6), reason: e.key);
      }
      for (final e in all.entries.where((e) => e.key.startsWith('reconstruction.label.'))) {
        final bare = e.value.replaceAll(RegExp(r'\{\w+\}'), '');
        expect(bare, bare.toUpperCase(), reason: '${e.key}: štítky velkými písmeny');
      }
      expect(all['reconstruction.offer.notification']!.length, lessThanOrEqualTo(60));
      for (final e in all.entries.where((e) => e.key.contains('.ask') || e.key.contains('.continue.'))) {
        expect(words(fillReconstructionText(e.value, const {'cas': '5:20'})), lessThanOrEqualTo(12), reason: e.key);
      }
      expect(reconstructionDoneKey(0), 'reconstruction.done.none');
      expect(reconstructionDoneKey(1), 'reconstruction.done.one');
      expect(reconstructionDoneKey(3), 'reconstruction.done.few');
      expect(reconstructionDoneKey(5), 'reconstruction.done.many');
      expect(fillReconstructionText(all[reconstructionDoneKey(3)]!, const {'pocet': '3'}), 'Hotovo. K noci máš 3 sny.');
      expect(lookupReconstructionText(texts, 'reconstruction.ask'), isNull);
      expect(lookupReconstructionText(texts, 'reconstruction.nope'), isNull);
    });
  });
}

String _utc(DateTime t) {
  final u = t.toUtc();
  String two(int v) => v.toString().padLeft(2, '0');
  return '${u.year}-${two(u.month)}-${two(u.day)}T${two(u.hour)}:${two(u.minute)}Z';
}
