// Typy appky „Za hranice reality“, zkopírované ze zadání kola 5 (část B).
// V appce tenhle soubor nepoužívej a importuj místo něj vlastní modely.
// copyWith a další metody jsou vynechané.

enum DreamSignCategory { action, context, form, awareness }

class DreamSign {
  const DreamSign({
    required this.id,
    required this.label,
    required this.category,
    this.count = 0,
  });

  final String id;
  final String label;
  final DreamSignCategory category;
  final int count;
}

enum Technique { mild, ssild, wbtb, realityCheck, dreamYoga, none }

enum TranscriptStatus { none, pending, done, failed }

enum RecallLevel { none, fragment, partial, full }

class Dream {
  const Dream({
    required this.id,
    required this.createdAt,
    required this.nightDate,
    this.title = '',
    this.text = '',
    this.audioPath,
    this.transcriptStatus = TranscriptStatus.none,
    this.recall = RecallLevel.partial,
    this.vividness = 5,
    this.lucid = false,
    this.lucidity = 0,
    this.control,
    this.mood,
    this.nightmare = false,
    this.falseAwakening = false,
    this.recurring = false,
    this.realityCheckInDream = false,
    this.dreamAt,
    this.wokeFromDream = false,
    this.emotions = const [],
    this.signIds = const [],
    this.tags = const [],
    this.sketchPaths = const [],
    this.technique = Technique.none,
    this.afterWbtb = false,
  });

  final String id;
  final DateTime createdAt;

  /// Datum večera, kdy uživatel šel spát.
  final DateTime nightDate;
  final String title;
  final String text;
  final String? audioPath;
  final TranscriptStatus transcriptStatus;
  final RecallLevel recall;

  /// Živost 0–10.
  final int vividness;
  final bool lucid;

  /// Míra lucidity 0–10 (0 = vůbec, 10 = plně vědomý). Smysl má hlavně u [lucid].
  final int lucidity;

  /// Kontrola nad snem 0–10; null = nezadáno.
  final int? control;

  /// Ladění snu 0–10 (0 = hrůza, 5 = neutrální, 10 = nádhera); null = nezadáno.
  final int? mood;
  final bool nightmare;

  /// Falešné probuzení (zdálo se mi, že vstávám).
  final bool falseAwakening;

  /// Opakující se sen.
  final bool recurring;

  /// Ve snu jsem udělal test reality (hlavní metrika přenosu návyku do snu).
  final bool realityCheckInDream;

  /// Přibližný čas snu (u [wokeFromDream] čas probuzení z něj); null = nevím, nezapočítá se do REM mapy.
  final DateTime? dreamAt;

  /// Probudil jsem se přímo z tohoto snu (silnější signál REM těsně před [dreamAt]).
  final bool wokeFromDream;
  final List<String> emotions;
  final List<String> signIds;

  /// Vlastní klíčová slova uživatele (malá písmena, bez #).
  final List<String> tags;

  /// Cesty k PNG kresbám snu (aplikační složka).
  final List<String> sketchPaths;
  final Technique technique;
  final bool afterWbtb;

  /// Prázdná noc (nic si nepamatuju) je platný zápis.
  bool get isEmptyNight => recall == RecallLevel.none;
}
