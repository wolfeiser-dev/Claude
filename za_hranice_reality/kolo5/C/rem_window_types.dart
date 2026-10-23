/// Kopie typů appky pro samostatný překlad (kolo 5, část C).
///
/// [RemLevel] a [RemWindow] beze změny z `kolo4/B/rem_types.dart` (část A,
/// kopie typů appky). V appce tenhle soubor smaž a v
/// `night_reconstruction.dart` importuj `rem_probability.dart`.
library;

enum RemLevel { unlikely, low, mid, high }

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
