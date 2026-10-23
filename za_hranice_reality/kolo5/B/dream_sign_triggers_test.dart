// Testy funkce „Od Stopy snů ke spouštěči“. Spuštění: `dart test`.
// V appce uprav importy na umístění souborů a typy nahraď vlastními modely.
// Test JSON hledá triggers_texty.json v proměnné prostředí TRIGGERS_TEXTY,
// jinak v ., test/, assets/ a ../B.
import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:triggers_pkg/dream_sign_triggers.dart';
import 'package:triggers_pkg/dream_types.dart';

final _now = DateTime(2026, 10, 23, 7, 30);

DreamSign _sign(String id, String label, DreamSignCategory cat, {int count = 0}) =>
    DreamSign(id: id, label: label, category: cat, count: count);

int _seq = 0;

/// Sen [ago] nocí před [_now] (nightDate = večer před probuzením).
Dream _dream(
  int ago,
  List<String> signIds, {
  String? id,
  bool rc = false,
  bool lucid = false,
  int lucidity = 0,
  bool nightmare = false,
  String text = '',
  RecallLevel recall = RecallLevel.partial,
  DateTime? from,
}) {
  final base = from ?? _now;
  final night = DateTime(base.year, base.month, base.day - ago);
  return Dream(
    id: id ?? 'd${_seq++}',
    createdAt: night.add(const Duration(hours: 31)),
    nightDate: night,
    signIds: signIds,
    realityCheckInDream: rc,
    lucid: lucid,
    lucidity: lucidity,
    nightmare: nightmare,
    text: text,
    recall: recall,
  );
}

final _skola = _sign('skola', 'škola', DreamSignCategory.context, count: 5);
final _telefon = _sign('telefon', 'telefon nejde vytočit', DreamSignCategory.action, count: 4);
final _pes = _sign('pes', 'pes mluví', DreamSignCategory.form, count: 2);
final _spech = _sign('spech', 'musím stihnout', DreamSignCategory.awareness, count: 3);

List<Dream> _journal() => [
      for (final a in [1, 4, 9, 20, 40]) _dream(a, ['skola']),
      for (final a in [2, 6, 15]) _dream(a, ['telefon'], text: 'Telefon nešel vytočit.'),
      for (final a in [3, 30]) _dream(a, ['pes']),
      for (final a in [5, 12, 25]) _dream(a, ['spech', 'skola']),
    ];

List<String> _allOutputs(List<TriggerSuggestion> s, List<String> prompts, TransferStats? t) => [
      for (final x in s) ...[x.when, x.then, x.reason, x.sentence(), x.label],
      ...prompts,
      if (t != null)
        for (final r in [...t.signs, t.anySign]) ...[
          r.funnelAfter,
          r.realityCheck.title,
          r.realityCheck.body,
          r.lucid.title,
          r.lucid.body,
        ],
    ];

bool _hasLoneSurrogate(String s) {
  for (var i = 0; i < s.length; i++) {
    final c = s.codeUnitAt(i);
    if (c >= 0xD800 && c <= 0xDBFF) {
      if (i + 1 >= s.length) {
        return true;
      }
      final d = s.codeUnitAt(i + 1);
      if (d < 0xDC00 || d > 0xDFFF) {
        return true;
      }
      i++;
    } else if (c >= 0xDC00 && c <= 0xDFFF) {
      return true;
    }
  }
  return false;
}

Map<String, String> _flatten(Object? node, [String prefix = '']) {
  final out = <String, String>{};
  if (node is Map) {
    for (final e in node.entries) {
      out.addAll(_flatten(e.value, prefix.isEmpty ? '${e.key}' : '$prefix.${e.key}'));
    }
  } else if (node is String) {
    out[prefix] = node;
  } else {
    throw StateError('Neočekávaný typ u $prefix: $node');
  }
  return out;
}

File? _findJson() {
  final env = Platform.environment['TRIGGERS_TEXTY'];
  final candidates = [
    if (env != null) env,
    'triggers_texty.json',
    'test/triggers_texty.json',
    'assets/triggers_texty.json',
    '../B/triggers_texty.json',
  ];
  for (final c in candidates) {
    final f = File(c);
    if (f.existsSync()) {
      return f;
    }
  }
  return null;
}

void main() {
  group('prázdná a okrajová data', () {
    test('prázdná data nic nevymyslí', () {
      expect(suggestTriggers(const [], const [], now: _now), isEmpty);
      expect(realityPromptsFromSigns(const [], const [], now: _now), isEmpty);
      final t = transferStats(const [], const [], since: _now);
      expect(t.signs, isEmpty);
      expect(t.dreamsBefore + t.dreamsAfter, 0);
      expect(t.anySign.realityCheck.verdict, TransferVerdict.noDreams);
    });

    test('max 0 vrátí prázdný seznam', () {
      expect(suggestTriggers([_skola], _journal(), now: _now, max: 0), isEmpty);
    });

    test('jedna Stopa: plán na den i na večer, max 1 podle kategorie', () {
      final s = suggestTriggers([_skola], _journal(), now: _now);
      expect(s, hasLength(2));
      expect(s.map((x) => x.kind).toSet(), {TriggerKind.day, TriggerKind.evening});
      expect(s.every((x) => x.signId == 'skola'), isTrue);
      expect(s.first.kind, TriggerKind.day, reason: 'prostředí se dá potkat ve dne');
      expect(s.map((x) => x.id).toSet(), hasLength(2));

      for (final (sign, kind) in [
        (_skola, TriggerKind.day),
        (_telefon, TriggerKind.day),
        (_pes, TriggerKind.evening),
        (_spech, TriggerKind.evening),
      ]) {
        final one = suggestTriggers([sign], _journal(), now: _now, max: 1);
        expect(one.single.kind, kind, reason: sign.category.name);
      }
    });

    test('Stopa bez snů: návrh se zdůvodněním, přenos noDreams', () {
      final lonely = _sign('more', 'moře', DreamSignCategory.context);
      final s = suggestTriggers([lonely], const [], now: _now);
      expect(s, isNotEmpty);
      expect(s.first.reason, startsWith(czechTriggerText('triggers.reason.none', const {})));
      expect(s.first.lastSeenNightsAgo, isNull);
      expect(realityPromptsFromSigns([lonely], const [], now: _now), isNotEmpty);
      final t = transferStats([lonely], _journal(), since: _now);
      expect(t.signs.single.realityCheck.verdict, TransferVerdict.noDreams);
      expect(t.signs.single.lucid.verdict, TransferVerdict.noDreams);
    });

    test('Stopa jen s počtem z deníku má malé skóre a zdůvodnění z počtu', () {
      final old = _sign('les', 'les', DreamSignCategory.context, count: 6);
      final s = suggestTriggers([old], const [], now: _now, max: 1).single;
      expect(s.reason, startsWith('V deníku 6×.'));
      expect(s.score, greaterThan(0));
      final withRecent = suggestTriggers([old, _skola], _journal(), now: _now, max: 1).single;
      expect(withRecent.signId, 'skola');
    });

    test('staré sny bez nových: návrh zůstane, přenos je zatím brzy', () {
      final old = [for (final a in [200, 230, 260]) _dream(a, ['skola'])];
      final s = suggestTriggers([_skola], old, now: _now);
      expect(s, isNotEmpty);
      expect(s.first.nights30, 0);
      expect(s.first.reason, contains('před víc než 3 měsíci'));
      expect(s.first.weightedNights, lessThan(0.01));
      final t = transferStats([_skola], old, since: _now.subtract(const Duration(days: 21)));
      expect(t.signs.single.before.dreams, 3);
      expect(t.signs.single.after.dreams, 0);
      expect(t.signs.single.realityCheck.verdict, TransferVerdict.tooEarly);
      expect(t.signs.single.realityCheck.body, contains('v žádném snu'));
    });

    test('50 Stop: nejvýš 3 různé Stopy, den i večer, rychle', () {
      final cats = DreamSignCategory.values;
      final signs = [
        for (var i = 0; i < 50; i++) _sign('s$i', 'stopa $i', cats[i % cats.length], count: i % 7),
      ];
      final dreams = [
        for (var i = 0; i < 200; i++) _dream(i % 60, ['s${i % 50}', 's${(i * 7) % 50}']),
      ];
      final sw = Stopwatch()..start();
      final s = suggestTriggers(signs, dreams, now: _now);
      final p = realityPromptsFromSigns(signs, dreams, now: _now, max: 9);
      final t = transferStats(signs, dreams, since: _now.subtract(const Duration(days: 20)));
      sw.stop();
      expect(s, hasLength(3));
      expect(s.map((x) => x.signId).toSet(), hasLength(3));
      expect(s.map((x) => x.kind).toSet(), {TriggerKind.day, TriggerKind.evening});
      expect(p, hasLength(5), reason: 'max se ořízne na 5');
      expect(p.toSet(), hasLength(5));
      expect(t.signs, hasLength(50));
      expect(sw.elapsedMilliseconds, lessThan(2000));
    });
  });

  group('skóre, rotace a determinismus', () {
    test('poločas 14 nocí: sen před 14 nocemi váží polovinu', () {
      final s = suggestTriggers([_skola], [_dream(14, ['skola'])], now: _now, max: 1).single;
      expect(s.weightedNights, closeTo(0.5, 1e-9));
      final two = suggestTriggers([_skola], [_dream(0, ['skola']), _dream(0, ['skola'])], now: _now, max: 1).single;
      expect(two.weightedNights, closeTo(1.0, 1e-9), reason: 'počítají se noci, ne zmínky');
    });

    test('nedávné vyhrává nad dávným, i když dávných je víc', () {
      final a = _sign('a', 'výtah', DreamSignCategory.context);
      final b = _sign('b', 'nádraží', DreamSignCategory.context);
      final dreams = [
        for (final x in [1, 3, 5]) _dream(x, ['a']),
        for (final x in [60, 62, 64, 66, 68]) _dream(x, ['b']),
      ];
      final s = suggestTriggers([b, a], dreams, now: _now, max: 1);
      expect(s.single.signId, 'a');
    });

    test('stejný vstup = stejný výstup, nezávisle na pořadí vstupu', () {
      final signs = [_skola, _telefon, _pes, _spech];
      final dreams = _journal();
      final a = suggestTriggers(signs, dreams, now: _now);
      final b = suggestTriggers(signs.reversed.toList(), dreams.reversed.toList(), now: _now);
      expect([for (final x in b) '${x.id}|${x.when}|${x.then}|${x.score}'],
          [for (final x in a) '${x.id}|${x.when}|${x.then}|${x.score}']);
      expect(realityPromptsFromSigns(signs, dreams, now: _now),
          realityPromptsFromSigns(signs.reversed.toList(), dreams.reversed.toList(), now: _now));
    });

    test('rovnost skóre rozhodne počet, label a id', () {
      final x = _sign('x', 'dveře', DreamSignCategory.context, count: 1);
      final y = _sign('y', 'okno', DreamSignCategory.context, count: 1);
      final s1 = suggestTriggers([x, y], const [], now: _now, max: 2);
      final s2 = suggestTriggers([y, x], const [], now: _now, max: 2);
      expect([for (final s in s1) s.id], [for (final s in s2) s.id]);
    });

    test('rotace: v rámci týdne stejný plán, napříč týdny se mění', () {
      final signs = [
        for (var i = 0; i < 8; i++) _sign('r$i', 'motiv $i', DreamSignCategory.values[i % 4]),
      ];
      Set<String> plan(DateTime now) {
        final dreams = [
          for (var i = 0; i < 8; i++) _dream(2, ['r$i'], from: now),
        ];
        return {for (final s in suggestTriggers(signs, dreams, now: now)) s.id};
      }

      final weekStart = DateTime(2026, 10, 22); // čtvrtek, začátek bloku dayIndex ~/ 7
      final sameWeek = DateTime(2026, 10, 23);
      expect(plan(sameWeek), plan(weekStart));
      final weeks = {for (var w = 0; w < 12; w++) plan(weekStart.add(Duration(days: 7 * w))).join(',')};
      expect(weeks.length, greaterThan(1));
    });

    test('podněty se střídají po dnech a forma se v jednom dni neopakuje', () {
      final signs = [_skola, _telefon, _pes];
      final days = {
        for (var d = 0; d < 10; d++) realityPromptsFromSigns(signs, _journal(), now: _now.add(Duration(days: d))).join('|'),
      };
      expect(days.length, greaterThan(1));
      final p = realityPromptsFromSigns(signs, _journal(), now: _now, max: 3);
      expect(p, hasLength(3));
      final starts = p.map((x) => x.split(':').first).toSet();
      expect(starts.length, greaterThan(1));
    });

    test('vyřazené, duplicitní a noční můry', () {
      final dupId = _sign('skola', 'jiná škola', DreamSignCategory.context);
      final dupLabel = _sign('skola2', 'Škola', DreamSignCategory.context);
      final scary = _sign('tma', 'tma', DreamSignCategory.context, count: 9);
      final dreams = [
        ..._journal(),
        _dream(1, ['tma'], nightmare: true),
        _dream(2, ['tma'], nightmare: true),
        _dream(3, ['tma']),
        _dream(1, ['skola'], id: 'dup'),
        _dream(1, ['skola'], id: 'dup'),
      ];
      final s = suggestTriggers([_skola, dupId, dupLabel, scary, _pes], dreams, now: _now, max: 5);
      final ids = s.map((x) => x.signId).toSet();
      expect(ids, isNot(contains('tma')), reason: 'z noční můry spouštěč nedělám');
      expect(ids, isNot(contains('skola2')), reason: 'stejný label jen jednou');
      expect(s.where((x) => x.signId == 'skola').every((x) => x.label == 'škola'), isTrue);
      final p = realityPromptsFromSigns([scary, _skola], dreams, now: _now);
      expect(p.any((x) => x.contains('tma')), isFalse);

      final ex = suggestTriggers([_skola, _pes], _journal(), now: _now, excludeSignIds: {'skola'});
      expect(ex.map((x) => x.signId).toSet(), {'pes'});
      final t = transferStats([_skola, dupId], dreams, since: _now.subtract(const Duration(days: 10)));
      expect(t.signs, hasLength(1));
    });
  });

  group('texty', () {
    test('when a then nezačínají „Když“ ani „tak“ a nekončí tečkou', () {
      final labels = ['škola', 'telefon nejde vytočit', '🏫', 'a' * 120];
      for (final cat in DreamSignCategory.values) {
        for (final label in labels) {
          for (final withTest in [false, true]) {
            for (var w = 0; w < 6; w++) {
              final sign = _sign('x', label, cat);
              final now = _now.add(Duration(days: 7 * w));
              for (final s in suggestTriggers([sign], [_dream(1, ['x'], from: now)], now: now, withTest: withTest)) {
                for (final t in [s.when, s.then]) {
                  expect(t, isNot(matches(RegExp(r'^\s*(když|tak)\b', caseSensitive: false))), reason: t);
                  expect(t, isNot(endsWith('.')));
                  expect(t, isNot(startsWith(' ')));
                }
                expect(s.sentence(), startsWith('Když '));
                expect(s.sentence(), contains(', tak '));
                expect(s.label.length, lessThanOrEqualTo(triggerLabelMax));
              }
            }
          }
        }
      }
    });

    test('všechny šablony when a then (obě varianty, všechny kategorie) jsou v pořádku', () {
      final keys = triggerTextKeys().where((k) => k.endsWith('.when') || k.endsWith('.then') || k.endsWith('thenTest'));
      expect(keys.length, greaterThanOrEqualTo(4 * 2 * 2 + 4 + 2 + 1));
      for (final k in keys) {
        final t = triggerTextsCs[k]!;
        expect(t, isNot(matches(RegExp(r'^(když|tak)\b', caseSensitive: false))), reason: k);
        expect(t, isNot(endsWith('.')), reason: k);
      }
    });

    test('příklad ze zadání: škola ve dne a večer', () {
      final s = suggestTriggers([_skola], _journal(), now: _now);
      final day = s.firstWhere((x) => x.kind == TriggerKind.day);
      final eve = s.firstWhere((x) => x.kind == TriggerKind.evening);
      expect(day.when, contains('„škola“'));
      expect(day.then, contains('jestli sním'));
      expect(eve.then, startsWith('poznám, že'));
      expect(day.reason, contains('za 30 dní'));
      expect(day.reason, contains('naposledy minulou noc'));
      final test = suggestTriggers([_skola], _journal(), now: _now, withTest: true);
      expect(test.firstWhere((x) => x.kind == TriggerKind.day).then, contains('test reality'));
      expect(test.firstWhere((x) => x.kind == TriggerKind.evening).withTest, isFalse);
    });

    test('podněty ≤ 60 znaků, label doslova, dlouhé zkrátí, prázdné přeskočí', () {
      final signs = [
        _sign('a', 'škola', DreamSignCategory.context),
        _sign('b', 'x' * 100, DreamSignCategory.action),
        _sign('c', 'velmi dlouhý popis místa, kde jsem byl s babičkou na chalupě u lesa', DreamSignCategory.form),
        _sign('d', '   ', DreamSignCategory.context),
        _sign('e', '', DreamSignCategory.context),
        _sign('f', '?!…', DreamSignCategory.awareness),
        _sign('g', '👩‍👩‍👧' * 20, DreamSignCategory.awareness),
        _sign('h', '🇨🇿' * 30, DreamSignCategory.context),
      ];
      final dreams = [for (final id in ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']) _dream(1, [id])];
      for (var d = 0; d < 14; d++) {
        final now = _now.add(Duration(days: d));
        final p = realityPromptsFromSigns(signs, dreams, now: now, max: 5);
        expect(p, hasLength(5));
        for (final x in p) {
          expect(x.length, lessThanOrEqualTo(promptMaxLength), reason: x);
          expect(_hasLoneSurrogate(x), isFalse, reason: x);
          expect(x, isNot(contains('….')));
          expect(x.trim(), x);
        }
        expect(p.any((x) => x.contains('?!')), isFalse, reason: 'label bez písmen se přeskočí');
      }
      final short = realityPromptsFromSigns([signs.first], dreams, now: _now, max: 3);
      expect(short, hasLength(3), reason: 'jedna Stopa, tři formy');
      expect(short.every((x) => x.contains('škola')), isTrue);
      expect(short.toSet(), hasLength(3));
    });

    test('label se uklidí: mezery, zalomení, uvozovky, složené závorky', () {
      final odd = _sign('o', '  „tma\n\tv  lese“  ', DreamSignCategory.context);
      final brace = _sign('b', '{label} a {pocet}', DreamSignCategory.context);
      final s = suggestTriggers([odd], [_dream(1, ['o'])], now: _now, max: 1).single;
      expect(s.label, 'tma v lese');
      expect(s.when, contains('„tma v lese“'));
      final p = realityPromptsFromSigns([brace], [_dream(1, ['b'])], now: _now);
      expect(p.every((x) => x.contains('{label} a {pocet}')), isTrue);
    });

    test('nikde dlouhá pomlčka, procenta ani zakázaná slova', () {
      final dash = _sign('d', 'běh \u2014 na místě', DreamSignCategory.action);
      final signs = [_skola, _telefon, _pes, _spech, dash];
      final dreams = [..._journal(), _dream(1, ['d'], rc: true)];
      final outs = _allOutputs(
        suggestTriggers(signs, dreams, now: _now, max: 5),
        realityPromptsFromSigns(signs, dreams, now: _now, max: 5),
        transferStats(signs, dreams, since: _now.subtract(const Duration(days: 10))),
      );
      final texts = [...outs, ...triggerTextsCs.values];
      final banned = RegExp(r'binaur|40 Hz|astráln|Calea|Castaned|Senoi|krystal|šišink|na povel', caseSensitive: false);
      for (final t in texts) {
        expect(t, isNot(contains('\u2014')), reason: t);
        expect(t, isNot(contains('%')), reason: t);
        expect(banned.hasMatch(t), isFalse, reason: t);
      }
    });

    test('JSON: stejné klíče i texty jako v kódu, platné zástupné symboly', () {
      final f = _findJson();
      expect(f, isNotNull, reason: 'triggers_texty.json nenalezen (TRIGGERS_TEXTY)');
      final json = jsonDecode(f!.readAsStringSync()) as Map<String, dynamic>;
      expect(json.keys, ['texts']);
      expect((json['texts'] as Map).keys, ['triggers']);
      final flat = _flatten(json['texts']);
      expect(flat.keys.toSet(), triggerTextKeys().toSet());
      for (final k in triggerTextKeys()) {
        expect(flat[k], triggerTextsCs[k], reason: k);
      }
      final allowed = {
        'when', 'then', 'label', 'pocet', 'kdy', 'v', 'k', 'z', 'n', 'snu', 'snech', //
        'stopa', 'test', 'lucid', 'co', 'Co', 'pred', 'po', 'nPred', 'nPo', 'min',
      };
      for (final e in flat.entries) {
        for (final m in RegExp(r'\{([^}]*)\}').allMatches(e.value)) {
          expect(allowed, contains(m.group(1)), reason: '${e.key}: ${m.group(0)}');
        }
      }
      final fromJson = triggerTextFromJson(json);
      expect(fromJson('triggers.prompt.ask', {'label': 'škola'}), 'Stopa snů: škola. Sníš?');
      final partial = triggerTextFromJson({'texts': <String, dynamic>{}});
      expect(partial('triggers.prompt.ask', {'label': 'pes'}), 'Stopa snů: pes. Sníš?');
    });

    test('kód sahá jen na existující klíče', () {
      final keys = triggerTextKeys().toSet();
      for (final cat in DreamSignCategory.values) {
        for (final v in ['a', 'b']) {
          expect(keys, contains('triggers.day.${cat.name}.$v.when'));
          expect(keys, contains('triggers.evening.${cat.name}.$v.when'));
          expect(keys, contains('triggers.evening.$v.then'));
        }
        expect(keys, contains('triggers.day.${cat.name}.then'));
        expect(keys, contains('triggers.prompt.${cat.name}'));
      }
      for (final k in TriggerKind.values) {
        expect(keys, containsAll(['triggers.kind.${k.name}.label', 'triggers.kind.${k.name}.note']));
      }
      for (final v in TransferVerdict.values) {
        expect(keys, containsAll(['triggers.verdict.${v.name}.title', 'triggers.verdict.${v.name}.body']));
      }
      for (final m in TransferMetric.values) {
        expect(keys, contains('triggers.metric.${m.name}'));
      }
      // Vlastní texty projdou celým kódem: neznámý klíč by se ukázal jako klíč.
      final seen = <String>{};
      String spy(String key, Map<String, String> args) {
        seen.add(key);
        return czechTriggerText(key, args);
      }

      final signs = [_skola, _telefon, _pes, _spech];
      suggestTriggers(signs, _journal(), now: _now, text: spy, max: 4);
      realityPromptsFromSigns(signs, _journal(), now: _now, text: spy, max: 5);
      transferStats(signs, _journal(), since: _now.subtract(const Duration(days: 10)), text: spy);
      expect(keys, containsAll(seen));
    });
  });

  group('přenos do snu', () {
    test('počty před a po, prázdné noci, lucidita ≥ 5, duplicitní sny', () {
      final since = DateTime(2026, 10, 10);
      final dreams = [
        _dream(20, ['skola'], rc: true), // před
        _dream(19, ['skola']),
        _dream(18, ['skola'], lucidity: 6),
        _dream(13, ['skola'], rc: true, id: 'po1'), // 10. 10. = první den plánu
        _dream(13, ['skola'], rc: true, id: 'po1'), // duplicitní zápis
        _dream(5, ['skola', 'pes'], lucid: true),
        _dream(4, ['pes']),
        _dream(3, [], recall: RecallLevel.none), // prázdná noc
        _dream(2, []),
      ];
      final t = transferStats([_skola, _pes], dreams, since: since);
      final s = t.signs.first;
      expect(s.before.dreams, 3);
      expect(s.before.realityChecks, 1);
      expect(s.before.lucid, 1);
      expect(s.after.dreams, 2);
      expect(s.after.realityChecks, 1);
      expect(s.after.lucid, 1);
      expect(s.total.dreams, 5);
      expect(s.funnelAfter, 'Stopa ve snu 2× · test ve snu 1× · lucidita 1×');
      expect(s.realityCheck.verdict, TransferVerdict.tooEarly);
      expect(t.anySign.after.dreams, 3);
      expect(t.dreamsBefore, 3);
      expect(t.dreamsAfter, 4);
    });

    test('verdikty a prahy', () {
      TransferVerdict v(int kb, int nb, int ka, int na) => classifyTransfer(kb, nb, ka, na).verdict;
      expect(v(0, 0, 0, 0), TransferVerdict.noDreams);
      expect(v(0, 10, 2, 2), TransferVerdict.tooEarly);
      expect(v(0, 2, 2, 5), TransferVerdict.noBaseline);
      expect(v(0, 8, 0, 6), TransferVerdict.noEventsYet);
      expect(v(1, 5, 1, 4), TransferVerdict.noChangeYet);
      expect(v(0, 5, 2, 5), TransferVerdict.noChangeYet, reason: 'malé „před“, skeptický prior');
      expect(v(1, 10, 4, 8), TransferVerdict.possiblyMore);
      expect(v(0, 10, 3, 6), TransferVerdict.clearlyMore);
      expect(v(0, 10, 3, 3), TransferVerdict.clearlyMore);
      expect(v(5, 10, 0, 10), TransferVerdict.fewer);
      expect(v(0, 10, 1, 10), TransferVerdict.noChangeYet, reason: 'jeden šťastný sen nestačí');
    });

    test('model: shoda dává 0,5, víc událostí po nikdy nesníží P(po > před)', () {
      expect(betaComparison(3, 10, 3, 10).pMore, closeTo(0.5, 1e-6));
      var last = 0.0;
      for (var ka = 0; ka <= 10; ka++) {
        final p = classifyTransfer(2, 10, ka, 10).comparison!.pMore;
        expect(p, greaterThanOrEqualTo(last));
        last = p;
      }
    });

    test('slovní verdikt s přirozenými četnostmi, bez procent', () {
      final since = _now.subtract(const Duration(days: 30));
      final dreams = [
        for (var i = 0; i < 10; i++) _dream(40 + i, ['skola']),
        for (var i = 0; i < 6; i++) _dream(1 + i, ['skola'], rc: i < 3),
      ];
      final r = transferStats([_skola], dreams, since: since).signs.single.realityCheck;
      expect(r.verdict, TransferVerdict.clearlyMore);
      expect(r.body, contains('Test ve snu před plánem: v žádném z 10 snů.'));
      expect(r.body, contains('Od začátku plánu: ve 3 ze 6 snů.'));
      expect(r.title, czechTriggerText('triggers.verdict.clearlyMore.title', const {}));
      expect(r.titleKey, 'triggers.verdict.clearlyMore.title');
    });

    test('české předložky a tvary u čísel', () {
      expect(naturalFrequency(2, 7), 've 2 ze 7 snů');
      expect(naturalFrequency(1, 5), 'v 1 z 5 snů');
      expect(naturalFrequency(4, 12), 've 4 ze 12 snů');
      expect(naturalFrequency(6, 8), 'v 6 z 8 snů');
      expect(naturalFrequency(0, 7), 'v žádném ze 7 snů');
      expect(naturalFrequency(1, 1), 'v tom jednom snu ano');
      expect(naturalFrequency(0, 1), 'v tom jednom snu ne');
      expect(naturalFrequency(0, 0), 'zatím bez snů');
      expect(dreamCount(1), 'v 1 snu');
      expect(dreamCount(2), 've 2 snech');
      expect(dreamCount(5), 'v 5 snech');
      expect(dreamCount(0), 'v žádném snu');
      expect([for (final n in [3, 4, 6, 7, 10, 11, 12, 13, 14, 17, 20, 50, 60, 100, 1000, 2000]) czechPrepZ(n)],
          ['ze', 'ze', 'ze', 'ze', 'z', 'z', 'ze', 'ze', 'ze', 'ze', 'ze', 'z', 'ze', 'ze', 'z', 'ze']);
      expect([for (final n in [1, 2, 5, 6, 7, 12, 20, 22, 40, 100, 200]) czechPrepV(n)],
          ['v', 've', 'v', 'v', 'v', 've', 've', 've', 've', 've', 've']);
    });
  });
}
