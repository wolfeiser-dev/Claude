# Ilustrace lekcí: výstupy pro hlavní vývojovou session

Každý výstup je celý níže jako samostatný blok kódu s názvem souboru nad ním.

### lesson_art.dart

```dart
/// Čtyři přihrádky znaků snů (prožitek, děj, podoba, souvislosti), hlavní kategorie svítí akcentem.
class _DreamSignGrid extends _Art {
  _DreamSignGrid(super.skin, super.l, super.clock);

  static const _main = 1;
  static const _keys = ['inner', 'action', 'form', 'context'];
  static const _marks = [2, 6, 3, 1];

  @override
  void paint(Canvas c, Size s) {
    const gap = 10.0;
    final w = (s.width - 2 - gap) / 2, h = (s.height - 2 - gap) / 2;
    for (var i = 0; i < 4; i++) {
      final r = Rect.fromLTWH(1 + i % 2 * (w + gap), 1 + i ~/ 2 * (h + gap), w, h);
      final hot = i == _main;
      final ink = hot ? skin.accent : skin.muted;
      if (hot) c.drawRect(r, fill(skin.accent.withValues(alpha: 0.06)));
      c.drawRect(r, stroke(hot ? skin.accent.withValues(alpha: 0.5) : skin.line, 1));
      _corners(c, r, stroke(hot ? skin.accent : skin.lineStrong, 1.5));
      label(c, _keys[i], Offset(r.left + 10, r.top + 13), color: hot ? skin.accentText : skin.muted);
      if (hot) label(c, 'main', Offset(r.right - 10, r.top + 13), align: 1, color: skin.accentText, size: 8.5);

      final tally = stroke(hot ? skin.accent : skin.faint);
      for (var k = 0; k < _marks[i]; k++) {
        final x = r.left + 11 + k ~/ 5 * 26 + k % 5 * 4.5, y = r.bottom - 10;
        if (k % 5 == 4) {
          c.drawLine(Offset(x - 20, y - 1), Offset(x, y - 8), tally);
        } else {
          c.drawLine(Offset(x, y), Offset(x, y - 9), tally);
        }
      }

      final o = Offset(r.left + w * 0.62, r.center.dy + 5);
      final spark = hot ? skin.accentText : skin.text;
      switch (i) {
        case 0:
          _head(c, o, ink, spark);
        case 1:
          _leap(c, o, ink);
        case 2:
          _morph(c, o, ink);
        default:
          _mug(c, o, ink, spark);
      }
    }
  }

  /// Hlava z profilu s jiskrou uvnitř.
  void _head(Canvas c, Offset o, Color ink, Color spark) {
    final p = Path()
      ..moveTo(o.dx - 6, o.dy + 19)
      ..cubicTo(o.dx - 7, o.dy + 12, o.dx - 16, o.dy + 9, o.dx - 15, o.dy - 4)
      ..cubicTo(o.dx - 14, o.dy - 16, o.dx - 2, o.dy - 21, o.dx + 7, o.dy - 18)
      ..cubicTo(o.dx + 13, o.dy - 15, o.dx + 15, o.dy - 10, o.dx + 15, o.dy - 5)
      ..lineTo(o.dx + 19, o.dy + 2)
      ..lineTo(o.dx + 15, o.dy + 3)
      ..lineTo(o.dx + 15, o.dy + 8)
      ..quadraticBezierTo(o.dx + 15, o.dy + 12, o.dx + 10, o.dy + 12)
      ..lineTo(o.dx + 7, o.dy + 12)
      ..lineTo(o.dx + 7, o.dy + 19);
    c.drawPath(p, stroke(ink));
    final r = 5.5 * (live ? 1 + 0.2 * math.sin(t * 1.6) : 1);
    final q = o + const Offset(0, -5);
    final star = Path()..moveTo(q.dx, q.dy - r);
    for (final d in [const Offset(1, 0), const Offset(0, 1), const Offset(-1, 0), const Offset(0, -1)]) {
      star.quadraticBezierTo(q.dx, q.dy, q.dx + d.dx * r, q.dy + d.dy * r);
    }
    c.drawPath(star, stroke(spark, 1));
  }

  /// Postava ve skoku s čárkovaným obloukem pohybu.
  void _leap(Canvas c, Offset o, Color ink) {
    final p = stroke(ink);
    final arc = Path()
      ..moveTo(o.dx - 30, o.dy + 18)
      ..quadraticBezierTo(o.dx - 22, o.dy - 14, o.dx - 3, o.dy - 6);
    _dashed(c, arc, stroke(ink, 1), 2, 3);
    c.drawLine(Offset(o.dx - 37, o.dy + 19), Offset(o.dx - 23, o.dy + 19), stroke(ink, 1));
    c.drawCircle(Offset(o.dx + 13, o.dy - 17), 3.2, p);
    c.drawLine(Offset(o.dx + 10, o.dy - 12), Offset(o.dx + 3, o.dy + 1), p);
    c.drawPath(Path()..addPolygon([Offset(o.dx - 1, o.dy - 13), Offset(o.dx + 9, o.dy - 9), Offset(o.dx + 19, o.dy - 12)], false), p);
    c.drawPath(Path()..addPolygon([Offset(o.dx - 7, o.dy + 2), Offset(o.dx + 3, o.dy + 1), Offset(o.dx + 11, o.dy + 7), Offset(o.dx + 9, o.dy + 15)], false), p);
    if (live) {
      final m = arc.computeMetrics().first;
      final at = m.getTangentForOffset(m.length * ((t / 4) % 1))!.position;
      c.drawCircle(at, 1.8, fill(ink));
    }
  }

  /// Čtverec, který se přes vlnu mění v kruh.
  void _morph(Canvas c, Offset o, Color ink) {
    for (var j = 0; j < 3; j++) {
      final q = o + Offset((j - 1) * 26.0, 0);
      final k = j / 2;
      final p = Path();
      for (var n = 0; n <= 96; n++) {
        final a = n / 96 * 2 * math.pi;
        final sq = 7 / math.max(math.cos(a).abs(), math.sin(a).abs());
        final r = sq + (7.8 - sq) * k + 1.4 * math.sin(k * math.pi) * math.sin(6 * a + (live ? t * 0.9 : 0));
        final pt = q + Offset(math.cos(a), math.sin(a)) * r;
        if (n == 0) {
          p.moveTo(pt.dx, pt.dy);
        } else {
          p.lineTo(pt.dx, pt.dy);
        }
      }
      c.drawPath(p..close(), stroke(ink));
      if (j < 2) arrowHead(c, q + const Offset(16, 0), const Offset(1, 0), stroke(skin.faint, 1), 3);
    }
  }

  /// Obraz s krajinou a hrnek, který z rámu vyčnívá ven.
  void _mug(Canvas c, Offset o, Color ink, Color spark) {
    final p = stroke(ink);
    final f = Rect.fromLTRB(o.dx - 30, o.dy - 17, o.dx + 6, o.dy + 11);
    c.drawPath(
      Path()..addPolygon([Offset(f.right, f.top + 9), f.topRight, f.topLeft, f.bottomLeft, f.bottomRight, Offset(f.right, f.bottom - 3)], false),
      p,
    );
    c.drawPath(
      Path()
        ..addPolygon([
          Offset(f.left + 3, f.bottom - 4),
          Offset(f.left + 12, f.top + 11),
          Offset(f.left + 18, f.top + 17),
          Offset(f.left + 25, f.top + 9),
          Offset(f.right - 3, f.bottom - 4),
        ], false),
      stroke(ink, 1),
    );
    c.drawCircle(Offset(f.left + 8, f.top + 7), 2.4, stroke(ink, 1));
    final m = stroke(spark);
    final body = RRect.fromLTRBAndCorners(o.dx + 1, o.dy - 3, o.dx + 13, o.dy + 9, bottomLeft: const Radius.circular(3), bottomRight: const Radius.circular(3));
    c.drawRRect(body, m);
    c.drawArc(Rect.fromCircle(center: Offset(o.dx + 13, o.dy + 3), radius: 3.5), -math.pi / 2, math.pi, false, m);
    final sway = live ? math.sin(t * 1.2) * 1.2 : 0.0;
    for (final x in [o.dx + 5, o.dx + 9]) {
      c.drawPath(
        Path()
          ..moveTo(x, o.dy - 6)
          ..quadraticBezierTo(x - 2 + sway, o.dy - 9, x, o.dy - 11)
          ..quadraticBezierTo(x + 2 + sway, o.dy - 13, x, o.dy - 15),
        stroke(skin.faint, 1),
      );
    }
  }

  void _corners(Canvas c, Rect r, Paint p, [double k = 8]) {
    for (final (o, dx, dy) in [(r.topLeft, 1.0, 1.0), (r.topRight, -1.0, 1.0), (r.bottomLeft, 1.0, -1.0), (r.bottomRight, -1.0, -1.0)]) {
      c.drawPath(Path()..addPolygon([o + Offset(k * dx, 0), o, o + Offset(0, k * dy)], false), p);
    }
  }

  void _dashed(Canvas c, Path path, Paint p, double on, double off) {
    for (final m in path.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += on + off) {
        c.drawPath(m.extractPath(d, math.min(d + on, m.length)), p);
      }
    }
  }
}

/// Stopa snu po probuzení: bez zápisu řídne do teček a mizí, zachycená tužkou hned pokračuje plnou čarou.
class _FadingTrace extends _Art {
  _FadingTrace(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    const axisY = 24.0, mid = 92.0, up = 60.0, down = 122.0, grab = 0.45;
    final x0 = s.width * 0.28, right = s.width - 14;
    final ph = live ? t * 0.5 : 0.0;
    double x(double m) => x0 + (right - x0) * m / 5;
    double ease(double v) => v <= 0 ? 0 : (v >= 1 ? 1 : v * v * (3 - 2 * v));
    double wave(double px) => math.sin((px - x0) / 9 - ph);
    Offset lost(double m) => Offset(x(m), mid + (up - mid) * ease(m / 0.8) - 5 * math.exp(-1.2 * m) * wave(x(m)));
    Offset kept(double m) => Offset(x(m), mid + (down - mid) * ease(m / 0.8) - 5 * wave(x(m)));
    Path trace(Offset Function(double) f, double a, double b) {
      final n = math.max(1, ((b - a) / 0.04).ceil());
      return Path()..addPolygon([for (var i = 0; i <= n; i++) f(a + (b - a) * i / n)], false);
    }

    c.drawLine(Offset(x(0), axisY), Offset(x(5), axisY), stroke(skin.lineStrong, 1));
    for (var m = 0; m <= 5; m++) {
      final px = x(m.toDouble());
      c.drawLine(Offset(px, axisY), Offset(px, axisY + 4), stroke(skin.lineStrong, 1));
      paintText(c, '$m', mono(size: 9), Offset(px, axisY - 12), align: 0.5);
    }
    label(c, 'axis', Offset(x0 - 12, axisY - 12), align: 1);

    for (var y = axisY + 10; y < s.height - 22; y += 6) {
      c.drawLine(Offset(x0, y), Offset(x0, y + 2.5), stroke(skin.lineStrong, 1));
    }
    label(c, 'wake', Offset(x0, s.height - 10), align: 0.5);

    for (final (u, v) in [(0.05, 44.0), (0.16, 60.0), (0.21, 40.0), (0.09, 128.0), (0.2, 140.0), (0.03, 112.0)]) {
      c.drawCircle(Offset(s.width * u, v), 0.9, fill(skin.muted.withValues(alpha: live ? 0.45 + 0.3 * math.sin(t + v) : 0.6)));
    }
    final dream = [for (var px = 4.0; px <= x0; px += 2) Offset(px, mid - 5 * wave(px))];
    c.drawPath(Path()..addPolygon(dream, false), stroke(skin.text));
    label(c, 'dream', const Offset(4, mid - 20));

    var at = 0.0;
    for (var i = 0; at < 3.3; i++) {
      final f = 1 - at / 3.3;
      final len = 0.32 * f * f;
      final a = live ? f * (0.75 + 0.25 * math.sin(t * 1.1 + i)) : f;
      if (len * (right - x0) / 5 > 1.6) {
        c.drawPath(trace(lost, at, at + len), stroke(skin.muted.withValues(alpha: 0.3 + 0.7 * a)));
      } else {
        c.drawCircle(lost(at), 0.5 + 0.7 * f, fill(skin.muted.withValues(alpha: 0.25 + 0.75 * a)));
      }
      at += len + 0.05 + 0.16 * (1 - f);
    }
    label(c, 'lost', Offset(x(3.45), up), color: skin.faint);

    c.drawPath(trace(kept, 0, grab), stroke(skin.text));
    c.drawPath(trace(kept, grab, 5), stroke(skin.accentText, 2));
    if (live) c.drawCircle(kept(grab + (t * 0.4) % (5 - grab)), 2.4, fill(skin.text));
    label(c, 'kept', Offset(s.width, down + 17), align: 1, color: skin.accentText);

    final tip = kept(grab);
    c.save();
    c.translate(tip.dx, tip.dy);
    c.rotate(-0.95);
    final pen = stroke(skin.accent);
    c.drawPath(Path()..addPolygon(const [Offset(0, 0), Offset(6, -2.6), Offset(24, -2.6), Offset(24, 2.6), Offset(6, 2.6)], true), pen);
    c.drawLine(const Offset(6, -2.6), const Offset(6, 2.6), pen);
    c.drawLine(const Offset(20, -2.6), const Offset(20, 2.6), pen);
    c.restore();
  }
}

/// Mozek z boku jako hvězdná mapa: čelní pól, přední čelní kůra, precuneus a pravé temporoparietální spojení.
class _BrainMap extends _Art {
  _BrainMap(super.skin, super.l, super.clock);

  /// Obrys pravé hemisféry (čelo vpravo) jako kubické úseky v jednotkách plochy mozku.
  static const _outline = [
    [0.00, 0.30, 0.12, 0.08, 0.32, 0.03],
    [0.48, -0.01, 0.62, 0.00, 0.74, 0.05],
    [0.90, 0.11, 1.00, 0.28, 0.99, 0.44],
    [0.99, 0.56, 0.93, 0.62, 0.84, 0.62],
    [0.80, 0.62, 0.77, 0.60, 0.74, 0.61],
    [0.79, 0.63, 0.80, 0.72, 0.75, 0.77],
    [0.70, 0.84, 0.58, 0.88, 0.44, 0.88],
    [0.28, 0.88, 0.10, 0.80, 0.04, 0.68],
    [0.02, 0.64, 0.01, 0.60, 0.01, 0.55],
  ];

  /// Rýhy: Sylviova, centrální, horní spánková a dvě čelní.
  static const _sulci = [
    [0.74, 0.61, 0.62, 0.53, 0.48, 0.50, 0.38, 0.42],
    [0.57, 0.02, 0.51, 0.16, 0.55, 0.30, 0.47, 0.47],
    [0.71, 0.74, 0.58, 0.66, 0.46, 0.62, 0.32, 0.58],
    [0.86, 0.16, 0.78, 0.13, 0.70, 0.14, 0.62, 0.20],
    [0.92, 0.36, 0.84, 0.31, 0.74, 0.32, 0.64, 0.38],
  ];

  /// Mozeček: dva kubické úseky.
  static const _cerebellum = [0.12, 0.78, 0.08, 0.92, 0.26, 1.0, 0.38, 0.97, 0.44, 0.95, 0.45, 0.9, 0.43, 0.88];

  @override
  void paint(Canvas c, Size s) {
    final bh = math.min(math.min(s.height - 50, 126.0), s.width * 0.36), bw = bh * 1.34;
    final ox = (s.width - bw) / 2, oy = (s.height - bh) / 2 + 2;
    Offset p(double u, double v) => Offset(ox + bw * u, oy + bh * v);
    List<Offset> pts(List<double> k) => [for (var i = 0; i < k.length; i += 2) p(k[i], k[i + 1])];
    Path curve(List<double> k) {
      final q = pts(k);
      final path = Path()..moveTo(q[0].dx, q[0].dy);
      for (var i = 1; i + 2 < q.length; i += 3) {
        path.cubicTo(q[i].dx, q[i].dy, q[i + 1].dx, q[i + 1].dy, q[i + 2].dx, q[i + 2].dy);
      }
      return path;
    }

    final brain = curve([0.01, 0.55, for (final k in _outline) ...k]);
    final rnd = math.Random(11);
    for (var i = 0; i < 40; i++) {
      final at = p(rnd.nextDouble(), rnd.nextDouble());
      final a = 0.2 + 0.4 * rnd.nextDouble();
      if (brain.contains(at)) {
        c.drawCircle(at, 0.5 + 0.5 * rnd.nextDouble(), fill(skin.text.withValues(alpha: live ? a * (0.6 + 0.4 * math.sin(t * 0.8 + i)) : a)));
      }
    }
    c.drawPath(brain, stroke(skin.muted));
    for (final k in _sulci) {
      c.drawPath(curve(k), stroke(skin.lineStrong, 1));
    }
    c.drawPath(curve(_cerebellum), stroke(skin.muted));
    for (final (u, v) in [(0.15, 0.86), (0.2, 0.92)]) {
      c.drawLine(p(u, v), p(0.38, v + 0.03), stroke(skin.lineStrong, 1));
    }
    c.drawLine(p(0.47, 0.88), p(0.48, 1.03), stroke(skin.muted));
    c.drawLine(p(0.54, 0.875), p(0.55, 1.03), stroke(skin.muted));

    final pre = p(0.22, 0.2), pfc = p(0.8, 0.22), fp = p(0.95, 0.46), tpj = p(0.34, 0.47);
    final hot = stroke(skin.accent.withValues(alpha: 0.55), 1);
    final faint = stroke(skin.lineStrong, 1);
    for (final (a, b, bend, ink) in [(pre, pfc, -0.22, faint), (pfc, fp, 0.25, faint), (pre, tpj, -0.3, hot), (tpj, pfc, 0.18, hot)]) {
      final m = (a + b) / 2, d = b - a;
      final ctl = m + Offset(d.dy, -d.dx) * bend;
      final arc = Path()
        ..moveTo(a.dx, a.dy)
        ..quadraticBezierTo(ctl.dx, ctl.dy, b.dx, b.dy);
      final shift = live ? (t * 2) % 6 : 0.0;
      for (final mt in arc.computeMetrics()) {
        for (var x = shift - 6; x < mt.length; x += 6) {
          c.drawPath(mt.extractPath(math.max(0, x), math.max(0, x + 2.5)), ink);
        }
      }
    }

    for (final q in [pre, pfc, fp]) {
      c.drawCircle(q, 2, fill(skin.muted));
      c.drawLine(q - const Offset(5, 0), q + const Offset(5, 0), stroke(skin.muted.withValues(alpha: 0.6), 0.6));
      c.drawLine(q - const Offset(0, 5), q + const Offset(0, 5), stroke(skin.muted.withValues(alpha: 0.6), 0.6));
    }
    final glow = live ? 0.14 + 0.05 * math.sin(t * 1.2) : 0.18;
    c.drawCircle(tpj, 9, fill(skin.accent.withValues(alpha: glow)));
    c.drawCircle(tpj, 13, stroke(skin.accent.withValues(alpha: 0.35), 0.8));
    c.drawCircle(tpj, 3.5, fill(skin.accent));

    final lx = 24.0, rx = s.width - 24;
    final lead = stroke(skin.lineStrong, 1);
    void callout(Offset star, double x, double y0, Paint paint) {
      final side = x < star.dx ? -1 : 1;
      c.drawPath(Path()..addPolygon([Offset(x, y0), Offset(x, star.dy), Offset(star.dx + side * 9, star.dy)], false), paint);
    }

    label(c, 'precuneus', const Offset(0, 10));
    callout(pre, lx, 19, lead);
    label(c, 'pfc', Offset(s.width, 10), align: 1);
    callout(pfc, rx, 19, lead);
    label(c, 'tpj', Offset(0, s.height - 23), color: skin.accentText);
    label(c, 'tpjSide', Offset(0, s.height - 10), color: skin.accentText, size: 8.5);
    callout(tpj, lx, s.height - 33, stroke(skin.accent.withValues(alpha: 0.5), 1));
    label(c, 'frontalPole', Offset(s.width, s.height - 10), align: 1);
    callout(fp, rx, s.height - 19, lead);
  }
}

/// REM rebound: po krátké noci s useknutými REM bloky přijde noc s delšími a vyššími REM bloky.
class _RemRebound extends _Art {
  _RemRebound(super.skin, super.l, super.clock);

  /// (začátek v hodinách, stadium): 0 bdění, 1 REM, 2 N1, 3 N2, 4 N3.
  static const _short = [
    (0.0, 0), (0.15, 2), (0.3, 3), (0.7, 4), (1.5, 3), (1.8, 1), (1.92, 3), (2.25, 4), (2.8, 3),
    (3.3, 1), (3.45, 3), (4.2, 2), (4.45, 1), (4.62, 3), (5.15, 1), (5.4, 0),
  ];
  static const _next = [
    (0.0, 0), (0.1, 2), (0.25, 3), (0.6, 4), (1.2, 3), (1.4, 1), (1.8, 3), (2.2, 4), (2.65, 3), (3.0, 1),
    (3.55, 3), (4.3, 1), (4.95, 3), (5.55, 1), (6.3, 2), (6.5, 3), (6.85, 1), (7.6, 0),
  ];

  @override
  void paint(Canvas c, Size s) {
    const left = 26.0, gap = 30.0;
    final w = (s.width - left - 4 - gap) / 2;
    final a0 = left, b0 = left + w + gap;
    double y(int st) => 38.0 + st * 20;
    double xa(double h) => a0 + w * h / 8;
    double xb(double h) => b0 + w * h / 8;

    label(c, 'rem', Offset(0, y(1) - 6), color: skin.faint, size: 8.5);
    _night(c, _short, 5.55, xa, y, 6, skin.muted);
    _night(c, _next, 8, xb, y, 14, skin.accent);

    for (var py = y(0) - 8; py < y(4) + 4; py += 6) {
      c.drawLine(Offset(xa(5.55), py), Offset(xa(5.55), py + 2.5), stroke(skin.lineStrong, 1));
    }
    final ghost = stroke(skin.faint, 1);
    for (final (h0, h1) in [(5.95, 6.55), (7.0, 7.7)]) {
      for (final m in (Path()..addRect(Rect.fromLTRB(xa(h0), y(1) - 14, xa(h1), y(1)))).computeMetrics()) {
        for (var d = 0.0; d < m.length; d += 4) {
          c.drawPath(m.extractPath(d, d + 2), ghost);
        }
      }
    }
    label(c, 'missing', Offset(xa(6.82), y(2) + 2), align: 0.5, color: skin.faint, size: 8.5);

    final from = Offset(xa(6.8), y(1) - 20), to = Offset(xb(1.6), y(1) - 18);
    final ctl = Offset((from.dx + to.dx) / 2, 0);
    final arc = Path()
      ..moveTo(from.dx, from.dy)
      ..quadraticBezierTo(ctl.dx, ctl.dy, to.dx, to.dy);
    c.drawPath(arc, stroke(skin.muted, 1));
    arrowHead(c, to, (to - ctl) / (to - ctl).distance, stroke(skin.muted, 1), 5);
    if (live) {
      final m = arc.computeMetrics().first;
      c.drawCircle(m.getTangentForOffset(m.length * ((t / 6) % 1))!.position, 2, fill(skin.text));
    }
    label(c, 'rebound', Offset((from.dx + 2 * ctl.dx + to.dx) / 4, 9), align: 0.5);

    for (final x in [a0, b0]) {
      c.drawLine(Offset(x, y(4) + 10), Offset(x + w, y(4) + 10), stroke(skin.line, 1));
    }
    label(c, 'night1', Offset(a0, s.height - 30));
    label(c, 'night2', Offset(b0, s.height - 30), color: skin.accentText);
    label(c, 'caption', Offset(s.width, s.height - 9), align: 1, color: skin.faint, size: 8.5);
  }

  void _night(Canvas c, List<(double, int)> segs, double end, double Function(double) x, double Function(int) y, double rem, Color ink) {
    final line = Path()..moveTo(x(0), y(segs.first.$2));
    for (var i = 0; i < segs.length; i++) {
      final (h, st) = segs[i];
      final h1 = i + 1 < segs.length ? segs[i + 1].$1 : end;
      line
        ..lineTo(x(h), y(st))
        ..lineTo(x(h1), y(st));
      if (st == 1) {
        final r = Rect.fromLTRB(x(h), y(1) - rem, x(h1), y(1));
        c.drawRect(r, fill(ink.withValues(alpha: 0.18)));
        c.drawRect(r, stroke(ink, 1));
        c.drawLine(r.topLeft, r.topRight, stroke(ink, 1.5));
      }
    }
    c.drawPath(line, stroke(skin.faint, 1));
  }
}

/// Falešné probuzení: tentýž pokoj ve třech zmenšujících se rámech jako zrcadlo v zrcadle, v nejmenším dlaň.
class _LoopRoom extends _Art {
  _LoopRoom(super.skin, super.l, super.clock);

  /// Poloha zrcadla v pokoji (zlomky rámu); v něm je další, menší kopie pokoje.
  static const _mirror = Rect.fromLTWH(0.42, 0.07, 0.54, 0.54);

  @override
  void paint(Canvas c, Size s) {
    final h = s.height - 28, w = math.min(s.width - 8, h * 1.9);
    var r = Rect.fromLTWH((s.width - w) / 2, 24, w, h);
    const keys = ['wake', 'again', 'check'];
    for (var d = 0; d < 3; d++) {
      _room(c, r, d);
      final ink = d == 2 ? skin.accentText : (d == 0 ? skin.muted : skin.faint);
      label(c, keys[d], Offset(r.left, 10), color: ink);
      if (d > 0) c.drawLine(Offset(r.left, 17), Offset(r.left, r.top - 2), stroke(d == 2 ? skin.accent.withValues(alpha: 0.6) : skin.lineStrong, 1));
      r = Rect.fromLTWH(r.left + r.width * _mirror.left, r.top + r.height * _mirror.top, r.width * _mirror.width, r.height * _mirror.height);
    }
  }

  void _room(Canvas c, Rect r, int depth) {
    Offset p(double u, double v) => Offset(r.left + r.width * u, r.top + r.height * v);
    final k = r.height / 148;
    final ink = stroke(depth == 0 ? skin.muted : skin.faint, depth == 2 ? 0.8 : 1);
    c.drawRect(r, stroke(skin.line, 1));
    final corner = 4 + 8 * k;
    for (final (o, dx, dy) in [(r.topLeft, 1.0, 1.0), (r.topRight, -1.0, 1.0), (r.bottomLeft, 1.0, -1.0), (r.bottomRight, -1.0, -1.0)]) {
      c.drawPath(
        Path()..addPolygon([o + Offset(corner * dx, 0), o, o + Offset(0, corner * dy)], false),
        stroke(depth == 2 ? skin.accent : skin.lineStrong),
      );
    }
    c.drawLine(p(0, 0.86), p(1, 0.86), ink);
    c.drawPath(Path()..addPolygon([p(0.05, 0.86), p(0.05, 0.2), p(0.17, 0.2), p(0.17, 0.86)], false), ink);
    c.drawCircle(p(0.145, 0.55), 0.6 + 1.2 * k, fill(depth == 0 ? skin.muted : skin.faint));
    final win = Rect.fromPoints(p(0.23, 0.14), p(0.37, 0.46));
    c.drawRect(win, ink);
    c.drawLine(win.topCenter, win.bottomCenter, ink);
    c.drawLine(win.centerLeft, win.centerRight, ink);
    if (depth == 0) {
      for (final (u, v) in [(0.26, 0.2), (0.34, 0.25), (0.28, 0.39)]) {
        c.drawCircle(p(u, v), 0.9, fill(skin.text.withValues(alpha: live ? 0.4 + 0.3 * math.sin(t + u * 20) : 0.6)));
      }
    }
    if (depth < 2) {
      c.drawRect(Rect.fromPoints(p(0.915, 0.65), p(0.945, 0.86)), ink);
      c.drawRect(Rect.fromPoints(p(0.47, 0.7), p(0.49, 0.86)), ink);
      c.drawRect(Rect.fromPoints(p(0.49, 0.73), p(0.915, 0.8)), ink);
      c.drawRRect(RRect.fromRectAndRadius(Rect.fromPoints(p(0.82, 0.685), p(0.905, 0.73)), Radius.circular(3 * k)), ink);
      c.drawPath(
        Path()
          ..moveTo(p(0.49, 0.75).dx, p(0.49, 0.75).dy)
          ..quadraticBezierTo(p(0.64, 0.7).dx, p(0.64, 0.7).dy, p(0.78, 0.73).dx, p(0.78, 0.73).dy)
          ..lineTo(p(0.78, 0.8).dx, p(0.78, 0.8).dy),
        ink,
      );
    } else {
      final hand = p(0.69, 0.46);
      final hh = r.height * 0.62;
      c.drawCircle(hand, hh * 0.62, fill(skin.accent.withValues(alpha: live ? 0.1 + 0.05 * math.sin(t * 1.3) : 0.12)));
      _palm(c, hand, hh, stroke(skin.accent));
    }
  }

  /// Otevřená dlaň s prsty nahoru, [h] je celková výška.
  void _palm(Canvas c, Offset o, double h, Paint p) {
    Offset q(double x, double y) => o + Offset(x, y) * h;
    final fw = 0.12, tip = Radius.circular(h * 0.06);
    final path = Path()..moveTo(q(-0.2, 0.5).dx, q(-0.2, 0.5).dy);
    path.lineTo(q(-0.24, 0.14).dx, q(-0.24, 0.14).dy);
    path.lineTo(q(-0.42, -0.04).dx, q(-0.42, -0.04).dy);
    path.arcToPoint(q(-0.34, -0.12), radius: tip);
    path.lineTo(q(-0.22, -0.01).dx, q(-0.22, -0.01).dy);
    for (final (x, top) in [(-0.22, -0.36), (-0.22 + fw, -0.44), (-0.22 + 2 * fw, -0.4), (-0.22 + 3 * fw, -0.3)]) {
      path.lineTo(q(x, top).dx, q(x, top).dy);
      path.arcToPoint(q(x + fw, top), radius: tip);
      path.lineTo(q(x + fw, -0.02).dx, q(x + fw, -0.02).dy);
    }
    path.lineTo(q(0.24, 0.14).dx, q(0.24, 0.14).dy);
    path.lineTo(q(0.18, 0.5).dx, q(0.18, 0.5).dy);
    c.drawPath(path, p);
  }
}

/// Imaginační nácvik: stejný příběh vlevo končí ostrým zubem noční můry, vpravo se ohne do měkkého oblouku.
class _RewriteScript extends _Art {
  _RewriteScript(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    const gap = 50.0, top = 6.0, bottom = 136.0;
    final w = (s.width - 4 - gap) / 2;
    final a = Rect.fromLTRB(2, top, 2 + w, bottom), b = Rect.fromLTRB(s.width - 2 - w, top, s.width - 2, bottom);
    Offset at(Rect r, double u, double dy) => Offset(r.left + 12 + (r.width - 24) * u, r.top + 88 + dy);
    Path story(Rect r) {
      final p = Path()..moveTo(at(r, 0, 0).dx, at(r, 0, 0).dy);
      for (var u = 0.02; u <= 0.581; u += 0.02) {
        final q = at(r, u, -6 * math.sin(u * 9) - 10 * u);
        p.lineTo(q.dx, q.dy);
      }
      return p;
    }

    for (final r in [a, b]) {
      final sheet = Path()..addPolygon([r.topLeft, r.topRight - const Offset(12, 0), r.topRight + const Offset(0, 12), r.bottomRight, r.bottomLeft], true);
      c.drawPath(sheet, fill(skin.text.withValues(alpha: 0.03)));
      c.drawPath(sheet, stroke(skin.lineStrong, 1));
      c.drawPath(Path()..addPolygon([r.topRight - const Offset(12, 0), r.topRight + const Offset(-12, 12), r.topRight + const Offset(0, 12)], false), stroke(skin.lineStrong, 1));
      for (final (row, len) in [(0, 0.45), (1, 0.8), (2, 0.6)]) {
        final y = r.top + 18 + row * 9.0;
        c.drawLine(Offset(r.left + 12, y), Offset(r.left + 12 + (r.width - 24) * len, y), stroke(skin.line, 1.5));
      }
    }

    final end = at(a, 0.58, -6 * math.sin(0.58 * 9) - 5.8);
    final tooth = story(a)
      ..lineTo(at(a, 0.65, -46).dx, at(a, 0.65, -46).dy)
      ..lineTo(at(a, 0.7, 14).dx, at(a, 0.7, 14).dy);
    c.drawPath(tooth, stroke(skin.text)..strokeJoin = StrokeJoin.miter);
    final stop = at(a, 0.7, 14);
    c.drawLine(stop + const Offset(-4, 0), stop + const Offset(4, 0), stroke(skin.text));

    c.drawPath(story(b), stroke(skin.text));
    final ghost = Path()
      ..moveTo(end.dx - a.left + b.left, end.dy)
      ..lineTo(at(b, 0.65, -46).dx, at(b, 0.65, -46).dy)
      ..lineTo(at(b, 0.7, 14).dx, at(b, 0.7, 14).dy);
    for (final m in ghost.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 5) {
        c.drawPath(m.extractPath(d, d + 2), stroke(skin.faint, 1));
      }
    }
    final from = at(b, 0.58, end.dy - at(b, 0, 0).dy);
    final soft = Path()
      ..moveTo(from.dx, from.dy)
      ..cubicTo(at(b, 0.66, -30).dx, at(b, 0.66, -30).dy, at(b, 0.76, -28).dx, at(b, 0.76, -28).dy, at(b, 0.84, -10).dx, at(b, 0.84, -10).dy)
      ..quadraticBezierTo(at(b, 0.9, -2).dx, at(b, 0.9, -2).dy, at(b, 1, -4).dx, at(b, 1, -4).dy);
    c.drawPath(soft, stroke(skin.accentText, 2));
    c.drawCircle(at(b, 1, -4), live ? 2.6 + 0.6 * math.sin(t * 1.4) : 2.6, fill(skin.accentText));

    final wob = live ? Offset(math.sin(t * 1.7) * 1.2, math.cos(t * 1.7) * 0.8) : Offset.zero;
    c.save();
    c.translate(s.width / 2 - 15 + wob.dx, (top + bottom) / 2 + 26 + wob.dy);
    c.rotate(-1.0);
    final pen = stroke(skin.accent);
    final body = Path()..addPolygon(const [Offset(0, 0), Offset(10, -3.5), Offset(46, -3.5), Offset(46, 3.5), Offset(10, 3.5)], true);
    c.drawPath(body, fill(skin.accent.withValues(alpha: 0.12)));
    c.drawPath(body, pen);
    c.drawLine(const Offset(10, -3.5), const Offset(10, 3.5), pen);
    c.drawLine(const Offset(3.2, -1.1), const Offset(3.2, 1.1), pen);
    c.drawRRect(RRect.fromLTRBR(46, -3.5, 55, 3.5, const Radius.circular(2.5)), pen);
    c.drawLine(const Offset(50, -3.5), const Offset(50, 3.5), pen);
    c.restore();

    label(c, 'before', Offset(a.center.dx, s.height - 26), align: 0.5);
    label(c, 'after', Offset(b.center.dx, s.height - 26), align: 0.5, color: skin.accentText);
    label(c, 'rehearse', Offset(b.center.dx, s.height - 10), align: 0.5, color: skin.faint, size: 8.5);
  }
}

/// Inkubace jako semínko: večer pod srpkem měsíce zasazené téma, ráno z něj vyraší lístek ve tvaru otazníku.
class _SeedMoon extends _Art {
  _SeedMoon(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    const sky = 46.0;
    final gy = s.height - 50, xl = s.width * 0.27, xr = s.width * 0.73;
    final seedY = gy + 14;

    // Noc jako čárkovaná dráha od měsíce ke slunci.
    final from = Offset(xl + 24, sky - 4), via = Offset(s.width / 2, sky - 46), to = Offset(xr - 24, sky - 4);
    final night = Path()
      ..moveTo(from.dx, from.dy)
      ..quadraticBezierTo(via.dx, via.dy, to.dx, to.dy);
    _dashed(c, night, stroke(skin.lineStrong, 1));
    arrowHead(c, to, (to - via) / (to - via).distance, stroke(skin.muted, 1));
    if (live) {
      final u = (t / 10) % 1;
      c.drawCircle(from * (1 - u) * (1 - u) + via * 2 * u * (1 - u) + to * u * u, 2, fill(skin.text));
    }

    // Večer: srpek měsíce s hvězdami.
    final m = Offset(xl, sky);
    final moon = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: m, radius: 13)),
      Path()..addOval(Rect.fromCircle(center: m + const Offset(3.4, -2.8), radius: 12.2)),
    );
    c.drawPath(moon, fill(skin.text.withValues(alpha: 0.12)));
    c.drawPath(moon, stroke(skin.text));
    for (final o in const [Offset(-27, -7), Offset(-17, 18), Offset(24, 16)]) {
      c.drawCircle(m + o, 0.9, fill(skin.faint));
    }
    // Poslední myšlenka dne klesá k semínku.
    _dashed(c, Path()..moveTo(xl, sky + 22)..lineTo(xl, gy - 8), stroke(skin.faint, 1));
    arrowHead(c, Offset(xl, gy - 5), const Offset(0, 1), stroke(skin.faint, 1), 4);

    // Ráno: malé slunce.
    final sun = Offset(xr, sky);
    c.drawCircle(sun, 5.5, stroke(skin.muted));
    for (var i = 0; i < 8; i++) {
      final v = Offset(math.cos(i * math.pi / 4), math.sin(i * math.pi / 4));
      c.drawLine(sun + v * 8.5, sun + v * 11.5, stroke(skin.muted, 1));
    }

    // Země s řídkou hlínou a dvě semínka.
    c.drawLine(Offset(12, gy), Offset(s.width - 12, gy), stroke(skin.lineStrong, 1));
    for (var i = 0; i < 24; i++) {
      final x = 16 + (i * 37.0) % (s.width - 32);
      if ((x - xl).abs() > 12 && (x - xr).abs() > 12) {
        c.drawCircle(Offset(x, gy + 6 + (i * 5) % 17), 0.8, fill(skin.faint));
      }
    }
    for (final x in [xl, xr]) {
      final seed = Path()
        ..moveTo(x + 5, seedY - 2.2)
        ..quadraticBezierTo(x + 1.9, seedY + 4.3, x - 5, seedY + 2.2)
        ..quadraticBezierTo(x - 1.9, seedY - 4.3, x + 5, seedY - 2.2)
        ..close();
      c.drawPath(seed, fill(skin.muted.withValues(alpha: 0.15)));
      c.drawPath(seed, stroke(skin.muted));
    }

    // Stonek a lístek ve tvaru otazníku (jediný oranžový tvar).
    final stem = Offset(xr, gy - 24), o = stem + const Offset(-2.5, -23);
    const r = 11.0, a0 = math.pi / 3, sweep = 4 * math.pi / 3;
    final joint = o + Offset(math.cos(a0), math.sin(a0)) * r;
    c.drawPath(
      Path()
        ..moveTo(xr, seedY - 3)
        ..lineTo(stem.dx, stem.dy)
        ..quadraticBezierTo(xr, stem.dy - 8, joint.dx, joint.dy),
      stroke(skin.muted),
    );
    final sway = live ? 0.06 * math.sin(t * 0.9) : 0.0;
    Offset leafAt(double u, double off) {
      final a = a0 - sweep * u;
      final p = o + Offset(math.cos(a), math.sin(a)) * (r + off) - joint;
      return joint +
          Offset(p.dx * math.cos(sway) - p.dy * math.sin(sway), p.dx * math.sin(sway) + p.dy * math.cos(sway));
    }

    final leaf = Path()..moveTo(joint.dx, joint.dy);
    for (var i = 1; i <= 40; i++) {
      final p = leafAt(i / 40, _width(i / 40));
      leaf.lineTo(p.dx, p.dy);
    }
    for (var i = 39; i > 0; i--) {
      final p = leafAt(i / 40, -_width(i / 40));
      leaf.lineTo(p.dx, p.dy);
    }
    leaf.close();
    c.drawPath(leaf, fill(skin.accent.withValues(alpha: 0.18)));
    c.drawPath(leaf, stroke(skin.accent));

    label(c, 'evening', Offset(xl, 12), align: 0.5);
    label(c, 'morning', Offset(xr, 12), align: 0.5);
    label(c, 'seed', Offset(xl, s.height - 12), align: 0.5);
    label(c, 'sprout', Offset(xr, s.height - 12), align: 0.5, color: skin.text);
  }

  /// Poloviční šířka lístku: úzký řapík, nejširší za polovinou, špička na konci.
  static double _width(double u) => 4.6 * math.sin(math.pi * math.pow(u, 1.3));

  void _dashed(Canvas c, Path p, Paint paint) {
    for (final m in p.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 6) {
        c.drawPath(m.extractPath(d, d + 2), paint);
      }
    }
  }
}

/// Tichý zvukový podnět v pozdním REM: hypnogram noci a nad jedním REM blokem tři slábnoucí tóny v jemné orbitě.
class _CueWave extends _Art {
  _CueWave(super.skin, super.l, super.clock);

  /// Noc po úsecích (minuty, fáze): 0 bdění, 1 REM, 2 lehký, 3 hluboký.
  static const _night = [
    (8, 0), (20, 2), (45, 3), (12, 2), (10, 1), (25, 2), (35, 3), (15, 2), (18, 1), (30, 2), //
    (15, 3), (15, 2), (26, 1), (30, 2), (4, 0), (12, 2), (32, 1), (28, 2), (38, 1), (12, 0),
  ];

  @override
  void paint(Canvas c, Size s) {
    const left = 30.0;
    final right = s.width - 12, top = s.height - 82;
    double x(num m) => left + (right - left) * m / 430;
    double y(int k) => top + k * 15;

    final p = Path()..moveTo(x(0), y(0));
    final rem = <(int, int)>[];
    var m = 0;
    for (final (d, k) in _night) {
      p
        ..lineTo(x(m), y(k))
        ..lineTo(x(m + d), y(k));
      if (k == 1) rem.add((m, m + d));
      m += d;
    }

    // Pozdní REM blok, do kterého míří podnět.
    final (cueFrom, cueTo) = rem[3];
    final xc = x((cueFrom + cueTo) / 2);
    c.drawRect(Rect.fromLTRB(x(cueFrom), y(0) - 8, x(cueTo), y(3) + 6), fill(skin.accent.withValues(alpha: 0.1)));
    c.drawPath(p, stroke(skin.muted));
    for (final (a, b) in rem) {
      c.drawLine(Offset(x(a), y(1)), Offset(x(b), y(1)), stroke(skin.accent, 2));
    }

    // Reproduktor, tři tóny a orbita kolem nich.
    final o = Offset(xc, 47), sp = o + const Offset(-9, 4), wc = sp + const Offset(3.5, 0);
    _dashed(c, Path()..moveTo(xc, o.dy + 21)..lineTo(xc, y(0) - 9), stroke(skin.faint, 1));
    const tilt = -0.3;
    Offset ell(double a) {
      final ex = 34 * math.cos(a), ey = 19 * math.sin(a);
      return o + Offset(ex * math.cos(tilt) - ey * math.sin(tilt), ex * math.sin(tilt) + ey * math.cos(tilt));
    }

    final orbit = Path()..moveTo(ell(0).dx, ell(0).dy);
    for (var i = 1; i <= 72; i++) {
      final e = ell(i * math.pi / 36);
      orbit.lineTo(e.dx, e.dy);
    }
    _dashed(c, orbit, stroke(skin.lineStrong, 1));
    c.drawCircle(ell(live ? t / 4 : 2.5), 2, fill(skin.text));

    final box = Path()
      ..moveTo(sp.dx - 6, sp.dy - 3)
      ..lineTo(sp.dx - 2.5, sp.dy - 3)
      ..lineTo(sp.dx + 3, sp.dy - 7.5)
      ..lineTo(sp.dx + 3, sp.dy + 7.5)
      ..lineTo(sp.dx - 2.5, sp.dy + 3)
      ..lineTo(sp.dx - 6, sp.dy + 3)
      ..close();
    c.drawPath(box, fill(skin.text.withValues(alpha: 0.1)));
    c.drawPath(box, stroke(skin.text));
    final phase = live ? (t / 2.6) % 1 : 0.0;
    for (var i = 0; i < 3; i++) {
      final k = i + phase, fade = (1 - k / 3.6) * (live ? math.min(1.0, k * 4) : 1.0);
      c.drawArc(Rect.fromCircle(center: wc, radius: 8 + 6 * k), -1.2, 1.4, false,
          stroke(skin.accent.withValues(alpha: fade), 1.5));
    }

    label(c, 'caption', Offset(s.width, 10), align: 1, color: skin.faint, size: 8.5);
    label(c, 'cue', Offset(o.dx - 42, o.dy), align: 1);
    label(c, 'rem', Offset(0, y(1)), color: skin.accentText);
    label(c, 'start', Offset(left, s.height - 10));
    label(c, 'end', Offset(right, s.height - 10), align: 1);
  }

  void _dashed(Canvas c, Path p, Paint paint) {
    for (final m in p.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 6) {
        c.drawPath(m.extractPath(d, d + 2), paint);
      }
    }
  }
}

/// Cesta lucidního snu do vědy jako výsek orbity od Aristotela po rozhovor ze snu, rok 1975 s okem zvýrazněný.
class _Timeline extends _Art {
  _Timeline(super.skin, super.l, super.clock);

  /// Zastávky: klíč roku a klíč jména.
  static const _stops = [
    ('antiquity', 'aristotle'),
    ('y1867', 'saintDenys'),
    ('y1913', 'vanEeden'),
    ('y1968', 'green'),
    ('y1975', 'hearne'),
    ('y1981', 'laberge'),
    ('y2021', 'konkoly'),
  ];

  @override
  void paint(Canvas c, Size s) {
    const sag = 34.0, x0 = 30.0;
    final cx = s.width / 2, top = s.height * 0.45, x1 = s.width - 30;
    final r = (cx * cx + sag * sag) / (2 * sag);
    double arcY(double x) => top + r - math.sqrt(r * r - (x - cx) * (x - cx));
    Path span(double a, double b) {
      final p = Path()..moveTo(a, arcY(a));
      for (var x = a + 4; x < b; x += 4) {
        p.lineTo(x, arcY(x));
      }
      return p..lineTo(b, arcY(b));
    }

    final pts = [for (var i = 0; i < 7; i++) Offset(x0 + (x1 - x0) * i / 6, arcY(x0 + (x1 - x0) * i / 6))];
    _dashed(c, span(4, s.width - 4), stroke(skin.lineStrong, 1));
    c.drawPath(span(pts[1].dx, pts[6].dx), stroke(skin.lineStrong, 1));

    // Zlom: mezi antikou a rokem 1867 leží přes dva tisíce let.
    final bx = (pts[0].dx + pts[1].dx) / 2, by = arcY(bx);
    for (final d in [-2.5, 2.5]) {
      c.drawLine(Offset(bx + d - 2, by + 5), Offset(bx + d + 2, by - 5), stroke(skin.muted, 1));
    }

    for (var i = 0; i < 7; i++) {
      final p = pts[i], hot = i == 4, dir = i.isOdd ? -1.0 : 1.0, gap = hot ? 14.0 : 0.0;
      if (hot) {
        c.drawCircle(p, 8 + (live ? 1.5 * math.sin(t * 1.3) : 0), fill(skin.accent.withValues(alpha: 0.18)));
        c.drawCircle(p, 3.5, fill(skin.accent));
        final e = p + const Offset(0, 15);
        final eye = Path()
          ..moveTo(e.dx - 7, e.dy)
          ..quadraticBezierTo(e.dx, e.dy - 6.5, e.dx + 7, e.dy)
          ..quadraticBezierTo(e.dx, e.dy + 6.5, e.dx - 7, e.dy)
          ..close();
        c.drawPath(eye, stroke(skin.accent));
        c.drawCircle(e + Offset(live ? 2.4 * math.sin(t * 1.4) : 0, 0), 1.9, fill(skin.accent));
      } else {
        c.drawCircle(p, 2.6, fill(skin.muted));
      }
      final align = switch (i) { 0 => 0.0, 6 => 1.0, _ => 0.5 };
      final ax = p.dx + (align - 0.5) * 12;
      label(c, _stops[i].$1, Offset(ax, p.dy + dir * (15 + gap)), align: align, color: hot ? skin.accentText : null);
      label(c, _stops[i].$2, Offset(ax, p.dy + dir * (27 + gap)), align: align, color: skin.faint, size: 8.5);
    }
  }

  void _dashed(Canvas c, Path p, Paint paint) {
    for (final m in p.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 6) {
        c.drawPath(m.extractPath(d, d + 2), paint);
      }
    }
  }
}

/// Domluvený signál ze snu: v záznamu pohybů očí čtyři ostré výkyvy L R L R, pod ním pás hypnogramu v REM.
class _EyeSignal extends _Art {
  _EyeSignal(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    const left = 16.0, mid = 72.0, amp = 26.0;
    final right = s.width - 16, w = right - left, by = s.height - 48;
    final xs = left + w * 0.38, xe = left + w * 0.7, d = (xe - xs) / 4;
    double noise(double x) => 1.4 * math.sin(x * 0.23) + 0.9 * math.sin(x * 0.57 + 1.1) * math.sin(x * 0.11);

    // Sakády: rychlý skok do krajní polohy, krátké podržení, skok na druhou stranu.
    final knots = [Offset(xs, mid + noise(xs - left))];
    for (var k = 0; k < 4; k++) {
      final x0 = xs + d * k, py = mid + (k.isEven ? -amp : amp);
      knots
        ..add(Offset(x0 + 2.5, py))
        ..add(Offset(x0 + d - 1.5, mid + (py - mid) * 0.9));
    }
    knots.add(Offset(xe + 3, mid + noise(xe + 3 - left)));
    double traceY(double x) {
      if (x <= xs || x >= xe + 3) return mid + noise(x - left);
      var i = 1;
      while (knots[i].dx < x) {
        i++;
      }
      final a = knots[i - 1], b = knots[i];
      return a.dy + (b.dy - a.dy) * (x - a.dx) / (b.dx - a.dx);
    }

    Path calm(double a, double b) {
      final p = Path()..moveTo(a, traceY(a));
      for (var x = a + 2; x < b; x += 2) {
        p.lineTo(x, traceY(x));
      }
      return p..lineTo(b, traceY(b));
    }

    // Pás hypnogramu: REM pod celým signálem.
    final rem = Rect.fromLTRB(left + w * 0.27, by - 4, left + w * 0.82, by + 20);
    c.drawRect(rem, fill(skin.accent.withValues(alpha: 0.1)));
    double stage(int k) => by + (k - 1) * 8;
    const stages = [(0.0, 2), (0.1, 3), (0.2, 2), (0.27, 1), (0.82, 2), (0.9, 3)];
    final band = Path()..moveTo(left, stage(2));
    for (var i = 0; i < stages.length; i++) {
      final (f, k) = stages[i];
      final end = i + 1 < stages.length ? stages[i + 1].$1 : 1.0;
      band
        ..lineTo(left + w * f, stage(k))
        ..lineTo(left + w * end, stage(k));
    }
    c.drawPath(band, stroke(skin.muted));
    c.drawLine(Offset(rem.left, stage(1)), Offset(rem.right, stage(1)), stroke(skin.accent, 2));
    for (final x in [rem.left, rem.right]) {
      _dashed(c, Path()..moveTo(x, rem.top - 2)..lineTo(x, mid - amp), stroke(skin.faint, 1));
    }

    // Záznam očí: klidná linka, uprostřed signál.
    c.drawPath(calm(left, xs), stroke(skin.muted));
    c.drawPath(calm(xe + 3, right), stroke(skin.muted));
    final signal = Path()..moveTo(knots.first.dx, knots.first.dy);
    for (final k in knots.skip(1)) {
      signal.lineTo(k.dx, k.dy);
    }
    c.drawPath(signal, stroke(skin.accent, 2));
    if (live) {
      final x = left + (t * 16) % w;
      c.drawCircle(Offset(x, traceY(x)), 2.5, fill(skin.text));
    }

    label(c, 'eyes', const Offset(0, 10));
    label(c, 'caption', Offset(s.width, 10), align: 1, color: skin.faint, size: 8.5);
    for (var k = 0; k < 4; k++) {
      final up = k.isEven;
      label(c, up ? 'left' : 'right', Offset(xs + d * (k + 0.5), mid + (up ? -amp - 10 : amp + 10)),
          align: 0.5, color: skin.accentText);
    }
    label(c, 'stages', Offset(left, by + 34));
    label(c, 'rem', Offset(rem.center.dx, by + 34), align: 0.5, color: skin.accentText);
  }

  void _dashed(Canvas c, Path p, Paint paint) {
    for (final m in p.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += 6) {
        c.drawPath(m.extractPath(d, d + 2), paint);
      }
    }
  }
}

/// Ciferník 24 hodin jako orbita: ranní REM okno v akcentu a okno večerního typu o hodinu až dvě později.
class _ChronoDial extends _Art {
  _ChronoDial(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final r = math.min(56.0, s.height / 2 - 30);
    final o = Offset(math.max(r + 22, (s.width - 2 * r - 140) / 2 + r + 19), s.height / 2);
    double ang(double h) => -math.pi / 2 + h / 12 * math.pi;
    Offset at(double h, double rr) => o + Offset(math.cos(ang(h)), math.sin(ang(h))) * rr;

    c.drawCircle(o, r, stroke(skin.lineStrong, 1));
    for (var h = 0; h < 24; h++) {
      final major = h % 6 == 0;
      c.drawLine(at(h.toDouble(), r), at(h.toDouble(), r - (major ? 6 : 3)), stroke(major ? skin.muted : skin.faint, 1));
    }
    for (final h in [0, 6, 12, 18]) {
      paintText(c, '$h', mono(size: 8.5, color: skin.faint), at(h.toDouble(), r - 14), align: 0.5);
    }

    // Měsíc u půlnoci, slunce u poledne.
    final m = o + Offset(0, -r * 0.42);
    final moon = Path.combine(
      PathOperation.difference,
      Path()..addOval(Rect.fromCircle(center: m, radius: 6.5)),
      Path()..addOval(Rect.fromCircle(center: m + const Offset(2, -1.6), radius: 6)),
    );
    c.drawPath(moon, fill(skin.text.withValues(alpha: 0.12)));
    c.drawPath(moon, stroke(skin.text, 1));
    final sun = o + Offset(0, r * 0.42);
    c.drawCircle(sun, 3.5, stroke(skin.muted, 1));
    for (var i = 0; i < 8; i++) {
      final v = Offset(math.cos(i * math.pi / 4), math.sin(i * math.pi / 4));
      c.drawLine(sun + v * 5.5, sun + v * 7.5, stroke(skin.muted, 1));
    }

    // Spánek tence, REM okno silně; tečka značí usnutí.
    void track(double from, double to, double a, double b, double rr, Color hot) {
      final rect = Rect.fromCircle(center: o, radius: rr);
      c.drawArc(rect, ang(from), ang(to) - ang(from), false, stroke(skin.lineStrong, 1));
      c.drawArc(rect, ang(a), ang(b) - ang(a), false, stroke(hot.withValues(alpha: 0.2), 7));
      c.drawArc(rect, ang(a), ang(b) - ang(a), false, stroke(hot, 2));
      c.drawCircle(at(from, rr), 2, fill(hot));
    }

    track(-1, 7, 4.5, 6.5, r + 9, skin.accent);
    track(1, 9, 6, 8, r + 17, skin.muted);
    if (live) c.drawCircle(at((t * 0.5) % 24, r), 2, fill(skin.text));

    final lx = o.dx + r + 34;
    label(c, 'windows', Offset(lx, o.dy - 20), color: skin.faint, size: 8.5);
    c.drawLine(Offset(lx, o.dy), Offset(lx + 12, o.dy), stroke(skin.accent, 2));
    label(c, 'early', Offset(lx + 18, o.dy), color: skin.accentText);
    c.drawLine(Offset(lx, o.dy + 18), Offset(lx + 12, o.dy + 18), stroke(skin.muted, 2));
    label(c, 'late', Offset(lx + 18, o.dy + 18));
  }
}

/// Laboratoř proti odhadu prstenu či hodinek: stejná noc, dole REM bloky posunuté, zkrácené nebo přehlédnuté.
class _TwoHypnograms extends _Art {
  _TwoHypnograms(super.skin, super.l, super.clock);

  /// Polysomnografie po úsecích (minuty, fáze): 0 bdění, 1 REM, 2 lehký, 3 hluboký.
  static const _psg = [
    (8, 0), (20, 2), (45, 3), (12, 2), (10, 1), (25, 2), (35, 3), (15, 2), (18, 1), (30, 2), //
    (15, 3), (15, 2), (26, 1), (30, 2), (4, 0), (12, 2), (32, 1), (28, 2), (38, 1), (12, 0),
  ];

  /// Odhad zařízení: první REM pozdě, druhý zkrácený, čtvrtý přerušený lehkým spánkem.
  static const _device = [
    (12, 0), (20, 2), (38, 3), (34, 2), (7, 1), (11, 2), (28, 3), (28, 2), (10, 1), (32, 2), (10, 3), //
    (20, 2), (22, 1), (34, 2), (4, 0), (10, 2), (13, 1), (9, 2), (10, 1), (26, 2), (44, 1), (8, 0),
  ];

  /// Úseky, kde se odhad rozchází s laboratoří (minuty), a klíč popisku.
  static const _off = [(85, 111, 'late'), (170, 178, ''), (333, 342, 'asLight')];

  @override
  void paint(Canvas c, Size s) {
    const left = 30.0, step = 12.0, topA = 28.0, topB = 98.0;
    final right = s.width - 12;
    double x(num m) => left + (right - left) * m / 430;

    void hypno(List<(int, int)> night, double top, Color line) {
      double y(int k) => top + k * step;
      final p = Path()..moveTo(x(0), y(0));
      final rem = <Rect>[];
      var m = 0;
      for (final (d, k) in night) {
        p
          ..lineTo(x(m), y(k))
          ..lineTo(x(m + d), y(k));
        if (k == 1) rem.add(Rect.fromLTRB(x(m), y(1), x(m + d), y(2)));
        m += d;
      }
      for (final r in rem) {
        c.drawRect(r, fill(skin.accent.withValues(alpha: 0.16)));
      }
      c.drawPath(p, stroke(line));
      for (final r in rem) {
        c.drawLine(r.topLeft, r.topRight, stroke(skin.accent, 2));
      }
      label(c, 'rem', Offset(0, y(1)), color: skin.accentText);
    }

    hypno(_psg, topA, skin.text);
    hypno(_device, topB, skin.muted);

    // Drobné značky odchylek pod odhadem.
    const my = topB + 3 * step + 9;
    for (final (a, b, key) in _off) {
      final p = stroke(skin.accentText, 1);
      c.drawLine(Offset(x(a), my), Offset(x(b), my), p);
      c.drawLine(Offset(x(a), my - 3), Offset(x(a), my + 3), p);
      c.drawLine(Offset(x(b), my - 3), Offset(x(b), my + 3), p);
      if (key.isNotEmpty) label(c, key, Offset(x((a + b) / 2), my + 12), align: 0.5, size: 8.5);
    }
    if (live) {
      final xs = x((t * 12) % 430);
      for (final top in [topA, topB]) {
        c.drawLine(Offset(xs, top - 5), Offset(xs, top + 3 * step + 5), stroke(skin.line, 1));
      }
    }

    label(c, 'psg', const Offset(0, 10), color: skin.text);
    label(c, 'caption', Offset(s.width, 10), align: 1, color: skin.faint, size: 8.5);
    label(c, 'device', const Offset(0, topB - 16));
  }
}
```

### lesson_art_switch.dart

```dart
// 1) Do `switch (id)` v TrainingArt.build vlož před výchozí větev `_ => _Ladder(skin, l, clock),`:
      'dreamSignGrid' => _DreamSignGrid(skin, l, clock),
      'fadingTrace' => _FadingTrace(skin, l, clock),
      'brainMap' => _BrainMap(skin, l, clock),
      'remRebound' => _RemRebound(skin, l, clock),
      'loopRoom' => _LoopRoom(skin, l, clock),
      'rewriteScript' => _RewriteScript(skin, l, clock),
      'seedMoon' => _SeedMoon(skin, l, clock),
      'cueWave' => _CueWave(skin, l, clock),
      'timeline' => _Timeline(skin, l, clock),
      'eyeSignal' => _EyeSignal(skin, l, clock),
      'chronoDial' => _ChronoDial(skin, l, clock),
      'twoHypnograms' => _TwoHypnograms(skin, l, clock),

// 2) Do `static const ids = [...]` přidej:
    'dreamSignGrid',
    'fadingTrace',
    'brainMap',
    'remRebound',
    'loopRoom',
    'rewriteScript',
    'seedMoon',
    'cueWave',
    'timeline',
    'eyeSignal',
    'chronoDial',
    'twoHypnograms',

// 3) Výška: všech 12 ilustrací používá výchozích 176 px (ověřeno na šířkách 320, 358, 390 a 430).
//    Řádek `height: height ?? (id == 'realityTree' ? 210 : 176)` zůstává beze změny.
```

### lesson_art_copy.json

```json
{
  "texts": {
    "training": {
      "art": {
        "dreamSignGrid": {
          "inner": "VNITŘNÍ PROŽITEK",
          "action": "DĚJ",
          "form": "PODOBA",
          "context": "SOUVISLOSTI",
          "main": "TVOJE HLAVNÍ"
        },
        "fadingTrace": {
          "axis": "MINUTY",
          "wake": "PROBUZENÍ",
          "dream": "SEN",
          "lost": "ROZPLYNE SE",
          "kept": "ZAPSANÝ SEN"
        },
        "brainMap": {
          "precuneus": "PRECUNEUS",
          "pfc": "PŘEDNÍ ČELNÍ KŮRA",
          "tpj": "TEMPOROPARIETÁLNÍ",
          "tpjSide": "SPOJENÍ VPRAVO",
          "frontalPole": "ČELNÍ PÓL"
        },
        "remRebound": {
          "rem": "REM",
          "missing": "CHYBÍ",
          "rebound": "DOHÁNÍ",
          "night1": "KRÁTKÁ NOC",
          "night2": "DALŠÍ NOC",
          "caption": "PRINCIP, NE MĚŘENÍ"
        },
        "loopRoom": {
          "wake": "PROBUZENÍ",
          "again": "A ZNOVU",
          "check": "TEST REALITY"
        },
        "rewriteScript": {
          "before": "NOČNÍ MŮRA",
          "after": "NOVÝ KONEC",
          "rehearse": "PŘEHRÁVAT DENNĚ"
        },
        "seedMoon": {
          "evening": "VEČER",
          "morning": "RÁNO",
          "seed": "TÉMA",
          "sprout": "CO VYKLÍČILO"
        },
        "cueWave": {
          "caption": "PRINCIP, NE MĚŘENÍ",
          "cue": "ZVUKOVÝ PODNĚT",
          "rem": "REM",
          "start": "USNUTÍ",
          "end": "RÁNO"
        },
        "timeline": {
          "antiquity": "ANTIKA",
          "aristotle": "ARISTOTELÉS",
          "y1867": "1867",
          "saintDenys": "SAINT-DENYS",
          "y1913": "1913",
          "vanEeden": "VAN EEDEN",
          "y1968": "1968",
          "green": "GREEN",
          "y1975": "1975",
          "hearne": "HEARNE",
          "y1981": "1981",
          "laberge": "LABERGE",
          "y2021": "2021",
          "konkoly": "KONKOLY"
        },
        "eyeSignal": {
          "caption": "PRINCIP, NE MĚŘENÍ",
          "eyes": "POHYB OČÍ",
          "left": "L",
          "right": "R",
          "stages": "FÁZE SPÁNKU",
          "rem": "REM"
        },
        "chronoDial": {
          "windows": "REM OKNO",
          "early": "RANNÍ TYP",
          "late": "VEČERNÍ TYP"
        },
        "twoHypnograms": {
          "caption": "PRINCIP, NE MĚŘENÍ",
          "psg": "POLYSOMNOGRAFIE",
          "device": "ODHAD ZAŘÍZENÍ",
          "rem": "REM",
          "late": "POZDĚ",
          "asLight": "JAKO LEHKÝ"
        }
      }
    }
  }
}
```

### lesson_art_preview.html

```html
<!doctype html><html lang="cs"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Ilustrace lekcí: náhled</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&family=Inter+Tight:wght@600&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>
:root{color-scheme:dark}*{box-sizing:border-box}
body{margin:0;background:#020308;color:#E9EDF5;font-family:Inter,system-ui,sans-serif;padding:24px 16px}
h1{font-family:"Inter Tight",Inter,sans-serif;font-weight:600;font-size:22px;margin:0 0 4px;text-align:center}
.lead{color:#8D97AD;font-size:13px;text-align:center;margin:0 0 20px}
.wrap{display:flex;flex-wrap:wrap;gap:24px;justify-content:center;align-items:flex-start}
.phone{width:390px;max-width:100%;border-radius:28px;padding:16px;border:1px solid #2E3A57}
.phone.d{background:#04060C}.phone.n{background:#000;border-color:#5A120D}
header{display:flex;justify-content:space-between;margin:2px 0 14px}
.m{font-family:"JetBrains Mono",ui-monospace,monospace;font-size:10.5px;letter-spacing:.06em;text-transform:uppercase;color:#8D97AD}
.d .acc{color:#FF7A45}.n .m{color:#B3261E}.n .acc{color:#FF3B2F}
.card{border:1px solid #1E2740;border-radius:4px;margin:0 0 14px;background:#0C1222;overflow:hidden}
.n .card{border-color:#3A0C08;background:#0A0202}
.cap{padding:8px 10px 6px}.art{line-height:0}.art svg{display:block;width:100%;height:auto}
.use{margin:0;padding:8px 10px 10px;font-size:12px;color:#8D97AD;line-height:1.45}.n .use{color:#B3261E}
</style></head><body>
<h1>Ilustrace lekcí: náhled</h1>
<p class="lead">12 nových ilustrací, statický snímek (bez animace), plocha 358 × 176 px. SVG jsou exportované z týchž kreslicích volání jako Dart.</p>
<div class="wrap">
<section class="phone d"><header><span class="m">ZA HRANICE REALITY</span><span class="m acc">DENNÍ REŽIM</span></header>
<article class="card"><div class="cap"><span class="m acc">01 · dreamSignGrid</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<rect x="1" y="1" width="173" height="82" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 1L1 1L1 9" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 1L174 1L174 9" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 83L1 83L1 75" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 83L174 83L174 75" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="11" y="17.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">VNITŘNÍ PROŽITEK</text>
<line x1="12" y1="73" x2="12" y2="64" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="16.5" y1="73" x2="16.5" y2="64" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M102.26 66L102.12 65.25L101.84 64.29L101.47 63.36L101.02 62.47L99.96 60.79L97.3 57.16L96.09 55.35L95.03 53.4L94.23 51.46L93.86 50.28L93.58 49.08L93.36 47.81L93.23 46.37L93.18 44.9L93.22 43.59L93.34 42.27L93.54 41.01L93.89 39.57L94.28 38.41L94.77 37.24L95.47 35.93L96.31 34.68L97.12 33.69L97.99 32.78L99.13 31.8L100.14 31.06L101.42 30.29L102.77 29.63L104.18 29.08L105.63 28.67L107.1 28.37L108.6 28.2L109.87 28.15L111.38 28.21L112.62 28.36L114.09 28.66L115.29 29.02L116.68 29.79L118.1 30.79L119.18 31.73L120.23 32.86L120.96 33.86L121.59 34.9L122.04 35.81L122.49 36.98L122.77 37.93L123.03 39.15L123.19 40.39L123.26 41.89L123.33 42.12L127.16 48.83L127.2 49.01L123.33 49.98L123.26 50.18L123.26 54.92L123.21 55.78L123.02 56.55L122.83 57.01L122.57 57.42L122.08 57.94L121.15 58.51L120.48 58.74L119.72 58.9L118.55 59L115.26 59.01L115.26 66" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M108.26 36.5L108.37 37.96L108.62 38.96L109.02 39.83L109.56 40.55L110.43 41.24L111.3 41.64L112.3 41.89L113.76 42L112.57 42.07L111.53 42.29L110.64 42.65L109.71 43.3L109.14 43.98L108.62 45.04L108.37 46.04L108.26 47.5L108.15 46.04L107.9 45.04L107.5 44.17L106.96 43.45L106.09 42.76L105.22 42.36L104.22 42.11L102.76 42L103.95 41.93L104.99 41.71L105.88 41.35L106.81 40.7L107.38 40.02L107.9 38.96L108.15 37.96L108.26 36.5" fill="none" stroke="#E9EDF5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="184" y="1" width="173" height="82" fill="#FF5F1F" fill-opacity="0.06"/>
<rect x="184" y="1" width="173" height="82" fill="none" stroke="#FF5F1F" stroke-opacity="0.5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 1L184 1L184 9" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 1L357 1L357 9" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 83L184 83L184 75" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 83L357 83L357 75" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="194" y="17.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">DĚJ</text>
<text x="347" y="17.17" text-anchor="end" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#FF7A45">TVOJE HLAVNÍ</text>
<line x1="195" y1="73" x2="195" y2="64" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="199.5" y1="73" x2="199.5" y2="64" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="204" y1="73" x2="204" y2="64" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="208.5" y1="73" x2="208.5" y2="64" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="193" y1="72" x2="213" y2="65" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="221" y1="73" x2="221" y2="64" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M261.26 65L261.79 62.96" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M262.63 60.06L263.22 58.23" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.27 55.34L265.03 53.49" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M266.28 50.84L267.27 49.02" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.83 46.59L270.11 44.94" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M272.17 42.86L273.8 41.62" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.42 40.26L278.34 39.69" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M281.29 39.4L283.32 39.57" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M286.17 40.23L288.13 40.94" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="254.26" y1="66" x2="268.26" y2="66" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="304.26" cy="30" r="3.2" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="301.26" y1="35" x2="294.26" y2="48" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.26 34L300.22 37.99L310.26 35" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M284.26 49L294.14 48.01L294.36 48.08L302.11 53.88L302.25 54.05L300.26 62" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="1" y="93" width="173" height="82" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 93L1 93L1 101" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 93L174 93L174 101" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 175L1 175L1 167" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 175L174 175L174 167" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="11" y="109.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">PODOBA</text>
<line x1="12" y1="165" x2="12" y2="156" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="16.5" y1="165" x2="16.5" y2="156" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="21" y1="165" x2="21" y2="156" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M89.26 139L89.26 146L75.26 146L75.26 132L89.26 132L89.26 139Z" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="98.26" y1="139" x2="95.69" y2="140.55" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="98.26" y1="139" x2="95.69" y2="137.45" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M115.66 139L116.19 139.53L116.48 139.93L116.81 140.6L116.87 141.33L116.7 141.8L116.21 142.36L115.8 142.64L114.01 143.51L113.68 143.88L113.46 144.3L113.01 144.5L112.68 144.88L111.96 146.46L111.52 147.07L111.15 147.39L110.68 147.58L110.19 147.6L109.95 147.58L109.27 147.28L108.86 146.99L108.33 146.47L107.36 145.33L106.97 145.03L106.74 144.94L106.25 144.97L104.21 145.91L103.27 146.23L102.54 146.38L101.79 146.4L101.06 146.26L100.97 146.05L100.86 145.31L100.9 144.57L101.06 143.84L101.41 142.91L102.26 141.1L102.34 140.61L102.16 140.16L101.99 139.97L100.86 139L100.33 138.47L100.04 138.07L99.71 137.4L99.65 136.67L99.82 136.2L100.31 135.64L100.94 135.24L102.51 134.49L102.84 134.12L103.06 133.7L103.51 133.5L103.68 133.32L104.06 132.68L104.56 131.54L105 130.93L105.37 130.61L105.84 130.42L106.33 130.4L106.57 130.42L107.25 130.72L107.66 131.01L108.19 131.53L109.16 132.67L109.55 132.97L109.78 133.06L110.27 133.03L112.31 132.09L113.25 131.77L113.98 131.62L114.73 131.6L115.46 131.74L115.55 131.95L115.66 132.69L115.62 133.43L115.46 134.16L115.11 135.09L114.26 136.9L114.18 137.39L114.36 137.84L114.53 138.03L115.66 139Z" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.26" y1="139" x2="121.69" y2="140.55" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.26" y1="139" x2="121.69" y2="137.45" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.06 139L141.92 140.48L141.49 141.91L140.81 143.23L140.37 143.84L139.71 144.58L138.55 145.51L137.23 146.21L135.8 146.64L134.32 146.8L132.84 146.67L131.87 146.42L131.18 146.16L129.87 145.44L128.72 144.49L127.78 143.34L127.07 142.03L126.63 140.6L126.46 139.12L126.49 138.38L126.63 137.4L127.07 135.97L127.78 134.66L128.72 133.51L129.87 132.56L131.18 131.84L131.87 131.58L132.84 131.33L134.32 131.2L135.8 131.36L137.23 131.79L138.55 132.49L139.71 133.42L140.37 134.16L140.81 134.77L141.49 136.09L141.92 137.52L142.06 139Z" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="184" y="93" width="173" height="82" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 93L184 93L184 101" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 93L357 93L357 101" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 175L184 175L184 167" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 175L357 175L357 167" fill="none" stroke="#2E3A57" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="194" y="109.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">SOUVISLOSTI</text>
<line x1="195" y1="165" x2="195" y2="156" fill="none" stroke="#5B6478" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.26 131L297.26 122L261.26 122L261.26 150L297.26 150L297.26 147" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.26 146L273.21 133.07L273.38 133.12L279.2 138.94L279.37 138.87L286.27 131.02L294.26 146" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="269.26" cy="129" r="2.4" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M292.26 145L292.26 136.01L304.23 136L304.25 145.19L304.12 145.92L303.92 146.4L303.45 147.05L303.05 147.41L302.36 147.79L301.87 147.94L301.39 148L295.17 148L294.69 147.95L294.2 147.81L293.73 147.58L293.3 147.27L292.92 146.88L292.63 146.44L292.42 145.96L292.26 145Z" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.26 138.5L304.97 138.57L305.7 138.81L306.38 139.22L306.78 139.57L307.12 139.99L307.5 140.68L307.66 141.17L307.76 141.88L307.71 142.59L307.5 143.32L307.12 144.01L306.78 144.43L306.38 144.78L305.7 145.19L304.97 145.43L304.26 145.5" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M296.26 133L295.82 132.26L295.43 131.32L295.27 130.43L295.31 129.73L295.52 129.03L295.77 128.59L296.68 127.53L296.96 127.09L297.21 126.43L297.26 125.98L297.15 125.32L296.95 124.88L296.26 124" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.26 133L299.82 132.26L299.43 131.32L299.27 130.43L299.31 129.73L299.52 129.03L299.77 128.59L300.68 127.53L300.96 127.09L301.21 126.43L301.26 125.98L301.15 125.32L300.95 124.88L300.26 124" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Znaky snů a jejich čtyři druhy · karta 1: Čtyři přihrádky</p></article>
<article class="card"><div class="cap"><span class="m acc">02 · fadingTrace</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<line x1="100.24" y1="24" x2="344" y2="24" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="24" x2="100.24" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="100.24" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">0</text>
<line x1="148.99" y1="24" x2="148.99" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="148.99" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">1</text>
<line x1="197.74" y1="24" x2="197.74" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="197.74" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">2</text>
<line x1="246.5" y1="24" x2="246.5" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="246.5" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">3</text>
<line x1="295.25" y1="24" x2="295.25" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="295.25" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">4</text>
<line x1="344" y1="24" x2="344" y2="28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="344" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#8D97AD">5</text>
<text x="88.24" y="15.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">MINUTY</text>
<line x1="100.24" y1="34" x2="100.24" y2="36.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="40" x2="100.24" y2="42.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="46" x2="100.24" y2="48.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="52" x2="100.24" y2="54.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="58" x2="100.24" y2="60.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="64" x2="100.24" y2="66.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="70" x2="100.24" y2="72.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="76" x2="100.24" y2="78.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="82" x2="100.24" y2="84.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="88" x2="100.24" y2="90.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="94" x2="100.24" y2="96.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="100" x2="100.24" y2="102.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="106" x2="100.24" y2="108.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="112" x2="100.24" y2="114.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="118" x2="100.24" y2="120.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="124" x2="100.24" y2="126.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="130" x2="100.24" y2="132.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="136" x2="100.24" y2="138.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="142" x2="100.24" y2="144.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="148" x2="100.24" y2="150.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="100.24" y="169.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">PROBUZENÍ</text>
<circle cx="17.9" cy="44" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<circle cx="57.28" cy="60" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<circle cx="75.18" cy="40" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<circle cx="32.22" cy="128" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<circle cx="71.6" cy="140" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<circle cx="10.74" cy="112" r="0.9" fill="#8D97AD" fill-opacity="0.6"/>
<path d="M4 87.23L6.19 87.73L8.08 88.37L9.93 89.14L12.17 90.24L18.09 93.46L20.1 94.48L21.92 95.3L24.03 96.09L25.96 96.6L28.18 96.93L29.93 96.99L31.92 96.82L33.88 96.43L36.02 95.76L38.1 94.91L39.9 94.04L46.05 90.7L48.05 89.67L49.86 88.84L51.96 88.03L53.88 87.48L56.1 87.1L58.09 87.01L60.08 87.16L62.05 87.54L63.96 88.12L66.05 88.95L68.08 89.91L74.01 93.13L76 94.17L78.04 95.12L79.9 95.85L81.81 96.43L84.01 96.87L86.01 97L88 96.89L89.97 96.54L91.89 96L93.99 95.2L96.03 94.25L100 92.13" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="4" y="75.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">SEN</text>
<path d="M100.24 92L102.33 90.64L104.08 89.24L106.12 87.4L110 83.52L115.84 77.38" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M118.28 74.89L121.84 71.45L125.18 68.5L127.11 66.96L128.71 65.79L130.58 64.57" fill="none" stroke="#8D97AD" stroke-opacity="0.92" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M133.89 62.87L135.52 62.29L137.21 61.91L138.69 61.78L141.91 61.78L143.65 61.71" fill="none" stroke="#8D97AD" stroke-opacity="0.85" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.72 61.31L155.47 60.19" fill="none" stroke="#8D97AD" stroke-opacity="0.79" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.21 59.58L163.39 59.29L166.34 59.14" fill="none" stroke="#8D97AD" stroke-opacity="0.74" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.69 59.14L176.51 59.38" fill="none" stroke="#8D97AD" stroke-opacity="0.69" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M182.41 59.81L186.15 60.07" fill="none" stroke="#8D97AD" stroke-opacity="0.64" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192.57 60.38L195.4 60.44" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M202.31 60.38L204.4 60.32" fill="none" stroke="#8D97AD" stroke-opacity="0.56" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="211.79" cy="60.06" r="0.71" fill="#8D97AD" fill-opacity="0.48"/>
<circle cx="221.1" cy="59.81" r="0.67" fill="#8D97AD" fill-opacity="0.44"/>
<circle cx="230.36" cy="59.81" r="0.63" fill="#8D97AD" fill-opacity="0.39"/>
<circle cx="239.68" cy="59.97" r="0.59" fill="#8D97AD" fill-opacity="0.35"/>
<circle cx="249.15" cy="60.1" r="0.55" fill="#8D97AD" fill-opacity="0.31"/>
<circle cx="258.9" cy="60.09" r="0.51" fill="#8D97AD" fill-opacity="0.26"/>
<text x="268.43" y="63.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#5B6478">ROZPLYNE SE</text>
<path d="M100.24 92L102.06 91.19L103.76 90.8L105.76 90.76L107.7 91.2L109.3 91.89L111.2 93.09L113.11 94.7L114.85 96.48L116.61 98.58L118.56 101.18L120.4 103.85L122.18 106.56" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M122.18 106.56L127.96 115.61L129.95 118.49L131.92 121.07L133.75 123.12L135.8 124.96L137.72 126.13L139.63 126.71L141.61 126.96L143.61 126.97L145.59 126.73L147.54 126.28L149.43 125.65L151.27 124.87L153.3 123.89L159.22 120.67L161 119.75L163.04 118.8L164.9 118.08L167.06 117.46L168.78 117.15L170.77 117L172.77 117.1L174.74 117.44L176.66 117.98L178.53 118.69L180.58 119.61L182.36 120.52L188.28 123.75L190.3 124.75L192.14 125.53L194.02 126.19L196.21 126.72L197.94 126.94L199.94 126.98L202.17 126.72L203.88 126.34L206.01 125.63L207.86 124.86L209.65 123.99L217.58 119.73L219.39 118.89L221.25 118.16L223.4 117.51L225.36 117.14L227.11 117.01L229.1 117.09L231.08 117.4L233.01 117.92L234.88 118.61L236.94 119.52L238.94 120.54L244.64 123.65L246.65 124.66L248.72 125.55L250.61 126.21L252.54 126.69L254.53 126.95L256.27 126.98L258.51 126.76L260.46 126.32L262.36 125.71L264.21 124.95L266.23 123.97L272.16 120.75L273.93 119.83L275.97 118.87L277.83 118.14L279.74 117.56L281.7 117.17L283.69 117L285.69 117.09L287.66 117.41L289.59 117.93L291.47 118.61L293.52 119.54L295.52 120.56L301.22 123.67L303.24 124.67L305.07 125.47L306.95 126.14L308.88 126.64L310.86 126.93L312.86 126.99L314.85 126.8L316.8 126.38L318.71 125.78L320.56 125.03L322.59 124.07L328.52 120.85L330.29 119.92L332.32 118.96L334.18 118.21L336.08 117.62L338.04 117.2L340.03 117.01L342.02 117.07L344 117.36" fill="none" stroke="#FF7A45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="142.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">ZAPSANÝ SEN</text>
<path d="M0 0L5.94 -2.57L6.18 -2.6L23.86 -2.6L24 -2.49L24 2.49L23.86 2.6L5.94 2.57L0 0Z" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
<line x1="6" y1="-2.6" x2="6" y2="2.6" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
<line x1="20" y1="-2.6" x2="20" y2="2.6" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
</svg>
</div><p class="use">Proč sny zapomínáme · karta 2: Vločka na dlani</p></article>
<article class="card"><div class="cap"><span class="m acc">03 · brainMap</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<circle cx="185.45" cy="75.4" r="0.61" fill="#E9EDF5" fill-opacity="0.43"/>
<circle cx="118.64" cy="49.46" r="0.78" fill="#E9EDF5" fill-opacity="0.54"/>
<circle cx="224.88" cy="87.05" r="0.98" fill="#E9EDF5" fill-opacity="0.25"/>
<circle cx="111.52" cy="107.88" r="0.81" fill="#E9EDF5" fill-opacity="0.4"/>
<circle cx="108.3" cy="103.86" r="0.81" fill="#E9EDF5" fill-opacity="0.56"/>
<circle cx="117.64" cy="96.04" r="0.96" fill="#E9EDF5" fill-opacity="0.59"/>
<circle cx="172.58" cy="55.62" r="0.67" fill="#E9EDF5" fill-opacity="0.59"/>
<circle cx="209.88" cy="110.59" r="0.88" fill="#E9EDF5" fill-opacity="0.29"/>
<circle cx="113.1" cy="120.43" r="0.98" fill="#E9EDF5" fill-opacity="0.45"/>
<circle cx="133.9" cy="45.67" r="0.92" fill="#E9EDF5" fill-opacity="0.54"/>
<circle cx="170.09" cy="53.25" r="0.89" fill="#E9EDF5" fill-opacity="0.32"/>
<circle cx="197.08" cy="121.3" r="0.84" fill="#E9EDF5" fill-opacity="0.57"/>
<circle cx="161.13" cy="125.36" r="0.73" fill="#E9EDF5" fill-opacity="0.32"/>
<circle cx="178.34" cy="49.64" r="0.71" fill="#E9EDF5" fill-opacity="0.3"/>
<circle cx="123.97" cy="75.75" r="0.76" fill="#E9EDF5" fill-opacity="0.23"/>
<circle cx="148.55" cy="51.02" r="0.56" fill="#E9EDF5" fill-opacity="0.41"/>
<circle cx="194.77" cy="46.3" r="0.58" fill="#E9EDF5" fill-opacity="0.47"/>
<circle cx="170.6" cy="62.94" r="0.73" fill="#E9EDF5" fill-opacity="0.44"/>
<circle cx="136.13" cy="56.9" r="0.74" fill="#E9EDF5" fill-opacity="0.29"/>
<circle cx="122.81" cy="116.84" r="0.68" fill="#E9EDF5" fill-opacity="0.47"/>
<circle cx="187.29" cy="118.07" r="0.83" fill="#E9EDF5" fill-opacity="0.24"/>
<circle cx="127.23" cy="100.04" r="1" fill="#E9EDF5" fill-opacity="0.2"/>
<circle cx="131.02" cy="50.65" r="0.66" fill="#E9EDF5" fill-opacity="0.55"/>
<circle cx="198.42" cy="71.49" r="0.98" fill="#E9EDF5" fill-opacity="0.5"/>
<circle cx="257.96" cy="91.81" r="0.71" fill="#E9EDF5" fill-opacity="0.21"/>
<circle cx="136.5" cy="37.9" r="0.87" fill="#E9EDF5" fill-opacity="0.26"/>
<path d="M96.27 96.3L96.17 93.01L96.23 89.75L96.45 86.52L96.83 83.3L97.38 80.08L98.08 76.91L98.94 73.8L99.89 70.94L100.97 68.13L102.3 65.17L103.77 62.28L105.28 59.68L107.05 56.95L108.81 54.52L110.85 52L112.85 49.77L114.97 47.63L117.19 45.6L119.68 43.55L122.08 41.76L124.6 40.08L127.38 38.41L130.22 36.9L132.94 35.61L135.75 34.44L138.54 33.42L141.6 32.45L144.51 31.67L147.49 31L151.05 30.34L155.33 29.64L159.56 29.06L164.46 28.5L169.1 28.1L173.7 27.83L178.48 27.69L183.17 27.69L187.59 27.83L192.17 28.12L196.67 28.55L201.07 29.13L205.23 29.81L209.46 30.65L213.6 31.63L217.41 32.67L222.93 34.35L226.22 35.53L229.64 36.97L232.84 38.52L235.89 40.2L238.85 42.04L241.74 44.07L244.46 46.22L246.9 48.4L249.21 50.7L251.51 53.28L253.38 55.68L255.22 58.35L256.87 61.14L258.23 63.84L259.38 66.59L260.34 69.44L261.07 72.36L261.57 75.3L261.77 77.3L261.85 79.3L261.67 84.36L261.35 87.3L260.74 90.02L260.28 91.43L259.72 92.8L259.05 94.16L258.29 95.44L257.43 96.66L256.63 97.62L255.59 98.7L254.48 99.69L253.32 100.57L251.87 101.5L250.32 102.32L248.68 103.04L246.94 103.65L245.12 104.16L243.23 104.55L241.26 104.84L238.16 105.09L235.19 105.09L233.61 104.98L231.83 104.77L226.34 103.85L224.11 103.58L222.89 103.51L221.64 103.54L220.64 103.64L219.65 103.83L219.64 103.9L221.13 104.48L222.25 105.11L223.24 105.86L224.29 106.89L225.17 108.09L225.77 109.19L226.23 110.35L226.6 111.8L226.74 113.05L226.73 114.54L226.52 116.03L226.13 117.48L225.55 118.87L224.83 120.17L223.93 121.41L222.96 122.5L222.04 123.36L221.23 124.01L219.45 125.67L218.25 126.61L216.81 127.62L215.14 128.65L213.34 129.63L211.34 130.6L209.28 131.48L206.89 132.38L204.57 133.16L201.91 133.94L199.3 134.62L196.49 135.25L193.58 135.82L190.58 136.32L187.48 136.76L183.03 137.24L178.62 137.58L174.09 137.8L169.45 137.88L165.7 137.83L161.7 137.65L157.7 137.33L153.72 136.88L149.51 136.27L145.31 135.5L141.16 134.6L137.28 133.62L133.41 132.5L129.64 131.26L125.85 129.85L122.39 128.39L119.25 126.92L116.32 125.38L113.55 123.75L111.03 122.1L108.59 120.29L106.54 118.56L104.52 116.61L102.86 114.73L101.41 112.79L99.91 110.38L98.77 108.16L97.84 105.88L97.14 103.57L96.64 101.17L96.35 98.67L96.27 96.3" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M219.52 103.86L216.37 102.35L212.95 100.84L209.25 99.32L205.28 97.81L197.71 95.14L180.59 89.45L176.37 87.96L172.48 86.48L168.68 84.92L165.01 83.26L161.7 81.59L158.74 79.92" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M190.82 29.52L189.28 32.46L188.02 35.4L186.96 38.46L186.04 41.82L185.4 44.72L184.84 47.9L183.32 58.73L182.62 63.08L181.76 67.27L180.72 71.24L179.4 75.2L177.86 78.94L176.02 82.66L173.93 86.22" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M214.46 120.24L207.27 117.09L200.16 114.26L192.9 111.66L185.33 109.22L177.48 106.94L169.04 104.74L159.66 102.51L148.61 100.08" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M239.78 47.16L237.08 46.47L234.63 45.97L231.93 45.54L229.48 45.27L226.73 45.12L224.24 45.11L221.75 45.22L219.26 45.46L216.58 45.86L214.15 46.36L211.71 46.98L209.29 47.73L206.78 48.63L204.27 49.68L201.77 50.87L199.26 52.2" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M249.91 72.36L247.39 71.29L244.8 70.38L242.14 69.64L239.42 69.07L236.75 68.67L233.78 68.41L231.02 68.33L227.96 68.4L225.02 68.63L221.83 69.04L218.86 69.57L215.61 70.32L212.55 71.17L209.25 72.24L205.95 73.48L202.64 74.88" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M114.84 125.28L114.24 127.23L113.95 128.93L113.89 130.68L114.09 132.4L114.55 134.09L115.24 135.7L116.29 137.41L117.5 138.93L118.92 140.35L120.71 141.82L122.71 143.18L124.91 144.43L127.43 145.63L129.95 146.63L132.83 147.58L135.74 148.36L138.91 149.03L142.39 149.56L145.89 149.88L149.13 150.01L152.65 149.93L155.91 149.65L158.81 149.2L160.8 148.62L162.13 148.12L163.33 147.58L164.4 146.99L165.28 146.42L166.15 145.74L166.9 145.04L167.51 144.32L168 143.59L168.37 142.85L168.62 142.1L168.75 141.37L168.72 140.43L168.54 139.7L168.22 139.02L167.77 138.41L167.18 137.88" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="119.91" y1="135.36" x2="158.74" y2="139.14" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128.35" y1="142.92" x2="158.74" y2="146.7" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="173.93" y1="137.88" x2="175.62" y2="156.78" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="185.75" y1="137.25" x2="187.44" y2="156.78" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M131.72 52.2L134.03 53.26" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M137.26 54.67L139.57 55.61" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.81 56.85L145.16 57.69" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M148.51 58.8L150.9 59.53" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M154.25 60.46L156.67 61.07" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.1 61.85L162.55 62.33" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M165.99 62.92L168.46 63.28" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.94 63.69L174.43 63.92" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M177.92 64.14L180.42 64.23" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M183.91 64.27L186.41 64.22" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M189.91 64.07L192.41 63.9" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M195.88 63.56L198.35 63.25" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201.82 62.73L204.3 62.3" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M207.71 61.61L210.13 61.05" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M213.53 60.19L215.96 59.51" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M219.3 58.49L221.65 57.72" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M224.95 56.55L227.3 55.66" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M229.65 54.72L232 55.81" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M235.11 57.48L237.2 58.78" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M240.01 60.81L241.95 62.42" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M244.46 64.84L246.11 66.7" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M248.23 69.46L249.59 71.55" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M251.3 74.65L252.33 76.87" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M253.57 80.1L254.34 82.52" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M131.72 52.2L131.78 54.82" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M132.09 58.35L132.48 60.77" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M133.27 64.12L134.05 66.53" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M135.41 69.75L136.57 71.94" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M138.46 74.84L140.01 76.8" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.44 79.38L144.26 81.02" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M146.97 83.12L149.07 84.53" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M151.99 86.22L153.91 84.53" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.62 82.24L158.59 80.67" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M161.37 78.54L163.38 77.07" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166.23 75.09L168.28 73.74" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.25 71.88L173.42 70.6" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M176.48 68.89L178.7 67.73" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M181.84 66.18L184.1 65.14" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M187.3 63.76L189.61 62.83" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192.88 61.62L195.24 60.81" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M198.58 59.77L200.99 59.08" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M204.39 58.2L206.85 57.63" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M210.25 56.92L212.68 56.48" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M216.1 55.94L218.57 55.62" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M222.07 55.23L224.58 55.02" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M228.14 54.79L229.65 54.72" fill="none" stroke="#FF5F1F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="131.72" cy="52.2" r="2" fill="#8D97AD"/>
<line x1="126.72" y1="52.2" x2="136.72" y2="52.2" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.72" y1="47.2" x2="131.72" y2="57.2" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="229.65" cy="54.72" r="2" fill="#8D97AD"/>
<line x1="224.65" y1="54.72" x2="234.65" y2="54.72" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="229.65" y1="49.72" x2="229.65" y2="59.72" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="254.98" cy="84.96" r="2" fill="#8D97AD"/>
<line x1="249.98" y1="84.96" x2="259.98" y2="84.96" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="254.98" y1="79.96" x2="254.98" y2="89.96" fill="none" stroke="#8D97AD" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="151.99" cy="86.22" r="9" fill="#FF5F1F" fill-opacity="0.18"/>
<circle cx="151.99" cy="86.22" r="13" fill="none" stroke="#FF5F1F" stroke-opacity="0.35" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="151.99" cy="86.22" r="3.5" fill="#FF5F1F"/>
<text x="0" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">PRECUNEUS</text>
<path d="M24 19L24.03 52.2L122.72 52.2" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="13.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">PŘEDNÍ ČELNÍ KŮRA</text>
<path d="M334 19L334 54.7L238.65 54.72" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="156.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">TEMPOROPARIETÁLNÍ</text>
<text x="0" y="169.17" text-anchor="start" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#FF7A45">SPOJENÍ VPRAVO</text>
<path d="M24 143L24 86.33L24.14 86.22L142.99 86.22" fill="none" stroke="#FF5F1F" stroke-opacity="0.5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="169.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">ČELNÍ PÓL</text>
<path d="M334 157L334 85.1L333.89 84.96L263.98 84.96" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Proč sny zapomínáme · karta 4: Obyčejná paměť v nezvyklý čas<br>Mozek v lucidním snu · karta 0: Divák, který si všiml kina<br>Mozek v lucidním snu · karta 2: Co se zatím ukazuje</p></article>
<article class="card"><div class="cap"><span class="m acc">04 · remRebound</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<text x="0" y="55.17" text-anchor="start" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#5B6478">REM</text>
<rect x="59.52" y="52" width="2.23" height="6" fill="#8D97AD" fill-opacity="0.18"/>
<rect x="59.52" y="52" width="2.23" height="6" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="59.52" y1="52" x2="61.76" y2="52" fill="none" stroke="#8D97AD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="87.46" y="52" width="2.79" height="6" fill="#8D97AD" fill-opacity="0.18"/>
<rect x="87.46" y="52" width="2.79" height="6" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="87.46" y1="52" x2="90.26" y2="52" fill="none" stroke="#8D97AD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="108.88" y="52" width="3.17" height="6" fill="#8D97AD" fill-opacity="0.18"/>
<rect x="108.88" y="52" width="3.17" height="6" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="108.88" y1="52" x2="112.05" y2="52" fill="none" stroke="#8D97AD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="121.92" y="52" width="4.66" height="6" fill="#8D97AD" fill-opacity="0.18"/>
<rect x="121.92" y="52" width="4.66" height="6" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="121.92" y1="52" x2="126.58" y2="52" fill="none" stroke="#8D97AD" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M26 38L28.75 38L28.79 38.21L28.79 77.95L28.99 78L31.49 78L31.59 78.15L31.59 97.9L31.73 98L38.98 98L39.04 98.19L39.04 117.94L39.23 118L53.94 117.96L53.97 98L59.47 98L59.53 97.81L59.53 58.07L59.71 58L61.71 58L61.76 58.2L61.76 97.94L61.95 98L67.91 98.04L67.94 118L78.15 117.96L78.18 98L87.43 98L87.46 58.04L90.17 58L90.26 58.17L90.26 97.91L90.41 98L104.16 98L104.22 97.82L104.22 78.07L104.4 78L108.88 77.98L108.9 58L111.9 58L112.05 58.1L112.05 97.84L112.14 98L121.89 98L121.92 58.04L122.13 58L126.37 58L126.57 57.95L126.57 38.21L126.62 38L129.37 38" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="231.07" y="44" width="7.45" height="14" fill="#FF5F1F" fill-opacity="0.18"/>
<rect x="231.07" y="44" width="7.45" height="14" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="231.07" y1="44" x2="238.53" y2="44" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="260.88" y="44" width="10.24" height="14" fill="#FF5F1F" fill-opacity="0.18"/>
<rect x="260.88" y="44" width="10.24" height="14" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="260.88" y1="44" x2="271.12" y2="44" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="285.09" y="44" width="12.11" height="14" fill="#FF5F1F" fill-opacity="0.18"/>
<rect x="285.09" y="44" width="12.11" height="14" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="285.09" y1="44" x2="297.19" y2="44" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="308.37" y="44" width="13.97" height="14" fill="#FF5F1F" fill-opacity="0.18"/>
<rect x="308.37" y="44" width="13.97" height="14" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="308.37" y1="44" x2="322.34" y2="44" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="332.58" y="44" width="13.97" height="14" fill="#FF5F1F" fill-opacity="0.18"/>
<rect x="332.58" y="44" width="13.97" height="14" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="332.58" y1="44" x2="346.55" y2="44" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M205 38L206.75 38L206.86 38.14L206.86 77.89L207 78L209.5 78L209.66 78.09L209.66 97.84L209.75 98L216 98L216.18 98.07L216.18 117.82L216.25 118L227.25 118L227.35 117.85L227.35 98.1L227.5 98L231 98L231.07 97.82L231.07 58.07L231.25 58L238.5 58L238.52 97.98L245.98 98.02L246 118L254.25 118L254.36 117.86L254.36 98.11L254.5 98L260.75 98L260.88 97.88L260.88 58.13L261 58L271 58L271.12 58.13L271.12 97.88L271.25 98L285 98L285.09 97.84L285.09 58.09L285.25 58L297 58L297.19 58.06L297.19 97.81L297.25 98L308.25 98L308.37 97.87L308.37 58.12L308.5 58L322.25 58L322.34 58.16L322.34 77.91L322.5 78L326 78L326.06 78.19L326.06 97.94L326.25 98L332.5 98L332.58 97.83L332.58 58.08L332.75 58L346.5 58L346.55 57.8L346.55 38.05L346.75 38L354 38" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="30" x2="129.37" y2="32.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="36" x2="129.37" y2="38.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="42" x2="129.37" y2="44.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="48" x2="129.37" y2="50.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="54" x2="129.37" y2="56.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="60" x2="129.37" y2="62.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="66" x2="129.37" y2="68.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="72" x2="129.37" y2="74.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="78" x2="129.37" y2="80.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="84" x2="129.37" y2="86.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="90" x2="129.37" y2="92.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="96" x2="129.37" y2="98.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="102" x2="129.37" y2="104.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="108" x2="129.37" y2="110.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="114" x2="129.37" y2="116.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="120" x2="129.37" y2="122.5" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 44L138.82 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M140.82 44L142.82 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M144.82 44L146.82 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 44.83L147.99 46.83" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 48.83L147.99 50.83" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 52.83L147.99 54.83" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 56.83L147.99 57.83L147.92 58L147.17 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M145.17 58L143.17 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M141.17 58L139.17 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M137.17 58L136.92 58L136.82 57.85L136.82 56.35" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 54.35L136.82 52.35" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 50.35L136.82 48.35" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 46.35L136.82 44.35" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 44L158.38 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.38 44L162.38 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.38 44L166.38 44" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M168.38 44L169.38 44L169.41 44.96" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 46.96L169.41 48.96" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 50.96L169.41 52.96" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 54.96L169.41 56.96" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M168.45 58L166.45 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.45 58L162.45 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.45 58L158.45 58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.45 58L156.38 57.83L156.38 56.08" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 54.08L156.38 52.08" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 50.08L156.38 48.08" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 46.08L156.38 44.08" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="153.02" y="83.17" text-anchor="middle" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#5B6478">CHYBÍ</text>
<path d="M152.65 38L155.37 35.57L157.89 33.47L160.42 31.51L162.95 29.7L165.55 27.99L167.94 26.56L170.54 25.15L173.14 23.9L175.74 22.8L178.35 21.86L180.95 21.07L183.56 20.45L186.05 19.99L188.53 19.69L191.02 19.52L193.75 19.5L196.22 19.63L198.94 19.94L201.41 20.37L204.12 21L206.68 21.76L209.25 22.66L211.82 23.72L214.37 24.93L216.92 26.28L219.47 27.79L222.01 29.44L224.56 31.24L227.02 33.13L229.68 35.32L232.33 37.67L234.8 40" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="234.8" y1="40" x2="229.93" y2="38.86" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="234.8" y1="40" x2="233.53" y2="35.16" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="193.72" y="12.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">DOHÁNÍ</text>
<line x1="26" y1="128" x2="175" y2="128" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="205" y1="128" x2="354" y2="128" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="26" y="149.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">KRÁTKÁ NOC</text>
<text x="205" y="149.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">DALŠÍ NOC</text>
<text x="358" y="170.17" text-anchor="end" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#5B6478">PRINCIP, NE MĚŘENÍ</text>
</svg>
</div><p class="use">Káva, alkohol a REM · karta 4: REM rebound: mozek dohání</p></article>
<article class="card"><div class="cap"><span class="m acc">05 · loopRoom</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<rect x="38.4" y="24" width="281.2" height="148" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M50.4 24L38.4 24L38.4 36" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M307.6 24L319.6 24L319.6 36" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M50.4 172L38.4 172L38.4 160" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M307.6 172L319.6 172L319.6 160" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="38.4" y1="151.28" x2="319.6" y2="151.28" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M52.46 151.28L52.47 53.6L86.2 53.6L86.2 151.28" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="79.17" cy="105.4" r="1.8" fill="#8D97AD"/>
<rect x="103.08" y="44.72" width="39.37" height="47.36" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="122.76" y1="44.72" x2="122.76" y2="92.08" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="103.08" y1="68.4" x2="142.44" y2="68.4" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="111.51" cy="53.6" r="0.9" fill="#E9EDF5" fill-opacity="0.6"/>
<circle cx="134.01" cy="61" r="0.9" fill="#E9EDF5" fill-opacity="0.6"/>
<circle cx="117.14" cy="81.72" r="0.9" fill="#E9EDF5" fill-opacity="0.6"/>
<rect x="295.7" y="120.2" width="8.44" height="31.08" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="170.56" y="127.6" width="5.62" height="23.68" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="176.19" y="132.04" width="119.51" height="10.36" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="268.98" y="125.38" width="23.9" height="6.66" rx="3" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M176.19 135L185.88 133.45L195.5 132.22L205.24 131.28L214.7 130.68L219.43 130.5L224.2 130.4L228.96 130.38L233.69 130.44L242.93 130.79L247.42 131.08L252.15 131.47L257.6 132.02L257.74 132.15L257.74 142.4" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="38.4" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">PROBUZENÍ</text>
<rect x="156.5" y="34.36" width="151.85" height="79.92" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.82 34.36L156.63 34.36L156.5 34.48L156.5 42.68" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.03 34.36L308.23 34.36L308.35 34.48L308.35 42.68" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.82 114.28L156.63 114.28L156.5 114.16L156.5 105.96" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.03 114.28L308.23 114.28L308.35 114.16L308.35 105.96" fill="none" stroke="#2E3A57" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156.5" y1="103.09" x2="308.35" y2="103.09" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.1 103.09L164.1 50.36L164.33 50.34L182.32 50.36L182.32 103.09" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="178.52" cy="78.32" r="1.25" fill="#5B6478"/>
<rect x="191.43" y="45.55" width="21.26" height="25.57" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="202.06" y1="45.55" x2="202.06" y2="71.12" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="191.43" y1="58.34" x2="212.69" y2="58.34" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="295.44" y="86.31" width="4.56" height="16.78" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="227.87" y="90.3" width="3.04" height="12.79" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="230.91" y="92.7" width="64.54" height="5.59" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="281.02" y="89.11" width="12.91" height="3.6" rx="1.62" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M230.91 94.3L236.17 93.46L241.4 92.79L246.58 92.29L251.72 91.97L256.96 91.81L261.97 91.84L266.95 92.03L271.88 92.39L274.82 92.69L274.95 92.82L274.95 98.3" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="156.5" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#5B6478">A ZNOVU</text>
<line x1="156.5" y1="17" x2="156.5" y2="32.36" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="220.28" y="39.95" width="82" height="43.16" fill="none" stroke="#1E2740" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M226.61 39.95L220.4 39.95L220.28 40.08L220.28 46.29" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.95 39.95L302.15 39.95L302.28 40.08L302.28 46.29" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M226.61 83.11L220.4 83.11L220.28 82.99L220.28 76.78" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.95 83.11L302.15 83.11L302.28 82.99L302.28 76.78" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="220.28" y1="77.07" x2="302.28" y2="77.07" fill="none" stroke="#5B6478" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M224.38 77.07L224.38 48.65L224.56 48.59L234.04 48.59L234.22 48.65L234.22 77.07" fill="none" stroke="#5B6478" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="232.17" cy="63.69" r="0.95" fill="#5B6478"/>
<rect x="239.14" y="46" width="11.48" height="13.81" fill="none" stroke="#5B6478" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="244.88" y1="46" x2="244.88" y2="59.81" fill="none" stroke="#5B6478" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="239.14" y1="52.9" x2="250.62" y2="52.9" fill="none" stroke="#5B6478" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="276.86" cy="59.81" r="16.59" fill="#FF5F1F" fill-opacity="0.12"/>
<path d="M271.51 73.19L270.41 63.52L265.64 58.76L265.48 58.27L265.5 57.72L265.69 57.22L265.84 57.01L266.23 56.68L266.73 56.47L267 56.44L267.53 56.51L267.77 56.6L270.9 59.47L270.97 59.39L271 49.9L271.18 49.38L271.56 48.93L272.05 48.66L272.32 48.59L272.83 48.59L273.35 48.77L273.8 49.13L273.97 49.37L274.16 49.89L274.18 59.16L274.19 47.92L274.32 47.4L274.63 46.92L275.1 46.59L275.36 46.49L275.88 46.44L276.4 46.56L276.88 46.86L277.23 47.33L277.38 47.85L277.39 59.21L277.4 48.97L277.53 48.45L277.67 48.2L277.86 47.97L278.33 47.64L278.86 47.5L279.37 47.54L279.88 47.76L280.11 47.95L280.3 48.17L280.55 48.67L280.6 49.19L280.6 59.17L280.6 51.88L280.66 51.37L280.75 51.1L281.09 50.63L281.31 50.45L281.82 50.22L282.34 50.18L282.86 50.31L283.34 50.64L283.53 50.86L283.76 51.37L283.82 51.88L283.8 59.37L283.28 63.58L281.68 73.19" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="220.28" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">TEST REALITY</text>
<line x1="220.28" y1="17" x2="220.28" y2="37.95" fill="none" stroke="#FF5F1F" stroke-opacity="0.6" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Falešná probuzení · karta 0: Probuzení, které není</p></article>
<article class="card"><div class="cap"><span class="m acc">06 · rewriteScript</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#04060C" font-family="'JetBrains Mono', ui-monospace, monospace">
<path d="M2 6L141.99 6L154 18.02L153.99 136L2 135.99L2 6Z" fill="#E9EDF5" fill-opacity="0.03"/>
<path d="M2 6L141.99 6L154 18.02L153.99 136L2 135.99L2 6Z" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142 6L142 18L154 18" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="24" x2="71.6" y2="24" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="33" x2="116.4" y2="33" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="42" x2="90.8" y2="42" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M204 6L343.99 6L356 18.02L355.99 136L204 135.99L204 6Z" fill="#E9EDF5" fill-opacity="0.03"/>
<path d="M204 6L343.99 6L356 18.02L355.99 136L204 135.99L204 6Z" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M344 6L344 18L356 18" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="24" x2="273.6" y2="24" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="33" x2="318.4" y2="33" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="42" x2="292.8" y2="42" fill="none" stroke="#1E2740" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M14 94L18.93 91.58L21.66 90.33L24.19 89.26L26.77 88.31L29.16 87.57L31.83 86.91L34.53 86.45L37.02 86.21L39.52 86.16L42.26 86.31L44.74 86.62L47.2 87.07L49.87 87.72L54.9 89.23L62.47 91.79L65.33 92.69L67.73 93.37L70.17 93.94L72.87 94.44L75.35 94.73L77.85 94.86L80.59 94.79L83.32 94.5L85.78 94.06L88.21 93.45L97.21 48.12L103.6 108" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="miter"/>
<line x1="99.6" y1="108" x2="107.6" y2="108" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M216 94L220.94 91.58L223.66 90.32L226.2 89.26L228.78 88.31L231.16 87.57L233.83 86.91L236.54 86.45L239.03 86.21L241.53 86.16L244.28 86.31L246.76 86.62L249.21 87.08L251.64 87.66L254.29 88.4L256.91 89.23L264.49 91.8L267.35 92.7L269.76 93.37L272.19 93.95L274.89 94.45L277.38 94.74L279.87 94.86L282.62 94.79L285.36 94.49L287.57 94.1L290.24 93.44" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.24 93.44L290.63 91.48" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M291.21 88.54L291.59 86.58" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M292.17 83.63L292.56 81.67" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M293.14 78.73L293.53 76.76" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M294.11 73.82L294.5 71.86" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.08 68.92L295.46 66.95" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M296.04 64.01L296.43 62.05" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.01 59.1L297.4 57.14" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.98 54.2L298.36 52.24" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M298.94 49.29L299.2 48.01L299.27 48.68" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M299.59 51.66L299.8 53.65" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.12 56.63L300.33 58.62" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.65 61.6L300.86 63.59" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M301.18 66.58L301.39 68.56" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M301.71 71.55L301.92 73.54" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M302.24 76.52L302.45 78.51" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M302.77 81.49L302.98 83.48" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M303.3 86.46L303.51 88.45" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M303.83 91.44L304.05 93.42" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.36 96.41L304.58 98.4" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.89 101.38L305.11 103.37" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M305.42 106.35L305.6 108" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.24 93.44L292.11 88.47L293.07 86.24L294.13 83.96L295.13 82.03L296.16 80.22L297.33 78.4L298.39 76.92L299.44 75.64L300.67 74.34L301.74 73.4L302.87 72.56L304.02 71.89L305.39 71.3L306.54 70.99L307.76 70.83L308.76 70.83L309.75 70.95L310.74 71.18L311.67 71.49L312.54 71.87L313.63 72.46L314.49 73.03L315.54 73.82L317.46 75.6L319.52 77.97L321.48 80.68L323.52 84L324.81 85.24L325.97 86.2L327.38 87.19L328.66 87.94L330.46 88.79L332.12 89.39L333.78 89.83L335.73 90.18L337.77 90.37L339.7 90.39L341.94 90.26L344 90" fill="none" stroke="#FF7A45" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="344" cy="90" r="2.6" fill="#FF7A45"/>
<path d="M0 0L9.9 -3.47L10.15 -3.5L45.88 -3.5L46 -3.37L46 3.37L45.88 3.5L10.15 3.5L9.9 3.47L0 0Z" fill="#FF5F1F" fill-opacity="0.12" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<path d="M0 0L9.9 -3.47L10.15 -3.5L45.88 -3.5L46 -3.37L46 3.37L45.88 3.5L10.15 3.5L9.9 3.47L0 0Z" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="10" y1="-3.5" x2="10" y2="3.5" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="3.2" y1="-1.1" x2="3.2" y2="1.1" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<rect x="46" y="-3.5" width="9" height="7" rx="2.5" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="50" y1="-3.5" x2="50" y2="3.5" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<text x="78" y="153.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#8D97AD">NOČNÍ MŮRA</text>
<text x="280" y="153.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF7A45">NOVÝ KONEC</text>
<text x="280" y="169.17" text-anchor="middle" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#5B6478">PŘEHRÁVAT DENNĚ</text>
</svg>
</div><p class="use">Noční můry a přepis snu (IRT) · karta 0: Přepiš konec filmu</p></article>
<article class="card"><div class="cap"><span class="m acc">07 · seedMoon</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- seedMoon, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<path d="M120.66 42L122.35 40.8M125.74 38.5L127.43 37.41M130.81 35.33L132.51 34.34M135.94 32.44L137.76 31.49M141.41 29.72L143.24 28.89M146.88 27.36L148.71 26.66M152.5 25.33L154.43 24.72M158.3 23.64L160.23 23.17M164.09 22.37L166.07 22.03M170.05 21.49L172.05 21.3M176.03 21.05L178.02 21.01M182.01 21.06L184 21.15M187.98 21.5L189.97 21.74M193.95 22.38L195.88 22.76M199.74 23.65L201.67 24.17M205.53 25.34L207.46 26M211.15 27.38L212.97 28.12M216.62 29.73L218.44 30.6M222.09 32.46L223.83 33.4M227.22 35.34L228.91 36.37M232.29 38.52L233.99 39.65" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="237.34" y1="42" x2="231.36" y2="41.51" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="237.34" y1="42" x2="234.97" y2="36.49" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M107.88 52.56L106.68 53.45L105.82 53.96L104.91 54.4L103.96 54.76L102.99 55.04L101.5 55.31L100.51 55.39L99.06 55.36L97.59 55.15L96.59 54.9L95.6 54.56L94.26 53.93L92.98 53.13L92.17 52.51L91.42 51.82L90.73 51.07L90.11 50.26L89.56 49.42L88.88 48.09L88.51 47.14L88.22 46.14L87.95 44.66L87.86 43.22L87.9 42.24L88.11 40.75L88.35 39.77L88.68 38.8L89.09 37.86L89.58 36.96L90.44 35.7L91.09 34.93L92.16 33.91L92.18 33.8L90.82 34.39L89.94 34.87L88.29 36.05L87.2 37.08L86.54 37.84L85.4 39.51L84.93 40.4L84.36 41.78L84.07 42.76L83.78 44.25L83.66 45.72L83.71 47.16L83.93 48.64L84.18 49.63L84.51 50.62L85.12 51.99L85.89 53.28L86.49 54.1L87.51 55.23L88.26 55.92L89.06 56.55L90.34 57.36L91.67 58.01L92.65 58.36L93.64 58.64L95.12 58.91L96.09 58.99L97.54 58.97L99.02 58.78L100 58.56L101.46 58.08L102.4 57.66L103.31 57.17L104.59 56.3L105.38 55.65L106.44 54.56L107.07 53.79L107.88 52.56Z" fill="#E9EDF5" fill-opacity="0.12"/>
<path d="M107.88 52.56L106.68 53.45L105.82 53.96L104.91 54.4L103.96 54.76L102.99 55.04L101.5 55.31L100.51 55.39L99.06 55.36L97.59 55.15L96.59 54.9L95.6 54.56L94.26 53.93L92.98 53.13L92.17 52.51L91.42 51.82L90.73 51.07L90.11 50.26L89.56 49.42L88.88 48.09L88.51 47.14L88.22 46.14L87.95 44.66L87.86 43.22L87.9 42.24L88.11 40.75L88.35 39.77L88.68 38.8L89.09 37.86L89.58 36.96L90.44 35.7L91.09 34.93L92.16 33.91L92.18 33.8L90.82 34.39L89.94 34.87L88.29 36.05L87.2 37.08L86.54 37.84L85.4 39.51L84.93 40.4L84.36 41.78L84.07 42.76L83.78 44.25L83.66 45.72L83.71 47.16L83.93 48.64L84.18 49.63L84.51 50.62L85.12 51.99L85.89 53.28L86.49 54.1L87.51 55.23L88.26 55.92L89.06 56.55L90.34 57.36L91.67 58.01L92.65 58.36L93.64 58.64L95.12 58.91L96.09 58.99L97.54 58.97L99.02 58.78L100 58.56L101.46 58.08L102.4 57.66L103.31 57.17L104.59 56.3L105.38 55.65L106.44 54.56L107.07 53.79L107.88 52.56Z" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="69.66" cy="39" r="0.9" fill="#5B6478"/>
<circle cx="79.66" cy="64" r="0.9" fill="#5B6478"/>
<circle cx="120.66" cy="62" r="0.9" fill="#5B6478"/>
<path d="M96.66 68L96.66 70M96.66 74L96.66 76M96.66 80L96.66 82M96.66 86L96.66 88M96.66 92L96.66 94M96.66 98L96.66 100M96.66 104L96.66 106M96.66 110L96.66 112M96.66 116L96.66 118" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="96.66" y1="121" x2="94.6" y2="117.57" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="96.66" y1="121" x2="98.72" y2="117.57" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="261.34" cy="46" r="5.5" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="269.84" y1="46" x2="272.84" y2="46" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="267.35" y1="52.01" x2="269.47" y2="54.13" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="261.34" y1="54.5" x2="261.34" y2="57.5" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="255.33" y1="52.01" x2="253.21" y2="54.13" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="252.84" y1="46" x2="249.84" y2="46" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="255.33" y1="39.99" x2="253.21" y2="37.87" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="261.34" y1="37.5" x2="261.34" y2="34.5" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="267.35" y1="39.99" x2="269.47" y2="37.87" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="12" y1="126" x2="346" y2="126" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="16" cy="132" r="0.8" fill="#5B6478"/>
<circle cx="53" cy="137" r="0.8" fill="#5B6478"/>
<circle cx="127" cy="147" r="0.8" fill="#5B6478"/>
<circle cx="164" cy="135" r="0.8" fill="#5B6478"/>
<circle cx="201" cy="140" r="0.8" fill="#5B6478"/>
<circle cx="238" cy="145" r="0.8" fill="#5B6478"/>
<circle cx="275" cy="133" r="0.8" fill="#5B6478"/>
<circle cx="312" cy="138" r="0.8" fill="#5B6478"/>
<circle cx="23" cy="143" r="0.8" fill="#5B6478"/>
<circle cx="60" cy="148" r="0.8" fill="#5B6478"/>
<circle cx="134" cy="141" r="0.8" fill="#5B6478"/>
<circle cx="171" cy="146" r="0.8" fill="#5B6478"/>
<circle cx="208" cy="134" r="0.8" fill="#5B6478"/>
<circle cx="245" cy="139" r="0.8" fill="#5B6478"/>
<circle cx="282" cy="144" r="0.8" fill="#5B6478"/>
<circle cx="319" cy="132" r="0.8" fill="#5B6478"/>
<circle cx="30" cy="137" r="0.8" fill="#5B6478"/>
<circle cx="67" cy="142" r="0.8" fill="#5B6478"/>
<circle cx="141" cy="135" r="0.8" fill="#5B6478"/>
<circle cx="178" cy="140" r="0.8" fill="#5B6478"/>
<circle cx="215" cy="145" r="0.8" fill="#5B6478"/>
<path d="M101.66 137.8L100.9 139.17L100.05 140.32L98.96 141.34L97.72 142.1L96.34 142.56L95.34 142.69L94.37 142.7L92.93 142.52L91.92 142.28L91.78 141.96L92.55 140.62L93.42 139.52L94.55 138.51L95.82 137.8L97.23 137.4L98.72 137.29L100.14 137.43L101.66 137.8Z" fill="#8D97AD" fill-opacity="0.15"/>
<path d="M101.66 137.8L100.9 139.17L100.05 140.32L98.96 141.34L97.72 142.1L96.34 142.56L95.34 142.69L94.37 142.7L92.93 142.52L91.92 142.28L91.78 141.96L92.55 140.62L93.42 139.52L94.55 138.51L95.82 137.8L97.23 137.4L98.72 137.29L100.14 137.43L101.66 137.8Z" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M266.34 137.8L265.58 139.17L264.73 140.32L263.64 141.34L262.4 142.1L261.02 142.56L260.02 142.69L259.05 142.7L258.1 142.61L256.6 142.28L256.46 141.96L257.23 140.62L258.1 139.52L259.23 138.51L260.5 137.8L261.91 137.4L263.4 137.29L264.82 137.43L266.34 137.8Z" fill="#8D97AD" fill-opacity="0.15"/>
<path d="M266.34 137.8L265.58 139.17L264.73 140.32L263.64 141.34L262.4 142.1L261.02 142.56L260.02 142.69L259.05 142.7L258.1 142.61L256.6 142.28L256.46 141.96L257.23 140.62L258.1 139.52L259.23 138.51L260.5 137.8L261.91 137.4L263.4 137.29L264.82 137.43L266.34 137.8ZM261.34 137L261.34 102.06L261.42 99.44L261.74 96.48L262.34 93.59L263.12 91.18L263.69 89.82L264.34 88.53" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.34 88.53L266.52 87.31L267.33 86.73L268.46 85.74L269.16 85.02L270.08 83.84L270.61 83L271.29 81.66L271.8 80.25L272.15 78.79L272.28 77.8L272.34 76.31L272.23 74.81L271.94 73.34L271.3 71.45L270.64 70.11L269.83 68.85L268.88 67.68L267.81 66.63L266.2 65.46L265.33 64.95L263.97 64.34L262.06 63.74L260.58 63.51L259.08 63.45L257.1 63.63L255.63 63.96L254.23 64.48L252.47 65.43L251.26 66.32L250.53 66.99L249.22 68.5L248.43 69.77L248 70.68L247.8 71.14L247.37 72.57L247.19 73.55L247.08 75.05L247.18 76.54L247.5 78.01L247.82 78.95L248.49 77.7L249.02 76.86L249.64 76.08L250.34 75.36L251.1 74.71L251.92 74.14L252.79 73.65L254.18 73.08L255.14 72.81L256.62 72.57L258.11 72.52L259.11 72.59L260.1 72.72L261.56 73.08L262.49 73.43L263.39 73.87L264.24 74.4L265.02 75.02L265.73 75.72L266.35 76.5L266.88 77.35L267.3 78.26L267.61 79.21L267.87 80.68L267.87 82.18L267.74 83.17L267.49 84.14L267.14 85.07L266.68 85.96L266.12 86.79L265.12 87.9L264.34 88.53Z" fill="#FF5F1F" fill-opacity="0.18"/>
<path d="M264.34 88.53L266.52 87.31L267.33 86.73L268.46 85.74L269.16 85.02L270.08 83.84L270.61 83L271.29 81.66L271.8 80.25L272.15 78.79L272.28 77.8L272.34 76.31L272.23 74.81L271.94 73.34L271.3 71.45L270.64 70.11L269.83 68.85L268.88 67.68L267.81 66.63L266.2 65.46L265.33 64.95L263.97 64.34L262.06 63.74L260.58 63.51L259.08 63.45L257.1 63.63L255.63 63.96L254.23 64.48L252.47 65.43L251.26 66.32L250.53 66.99L249.22 68.5L248.43 69.77L248 70.68L247.8 71.14L247.37 72.57L247.19 73.55L247.08 75.05L247.18 76.54L247.5 78.01L247.82 78.95L248.49 77.7L249.02 76.86L249.64 76.08L250.34 75.36L251.1 74.71L251.92 74.14L252.79 73.65L254.18 73.08L255.14 72.81L256.62 72.57L258.11 72.52L259.11 72.59L260.1 72.72L261.56 73.08L262.49 73.43L263.39 73.87L264.24 74.4L265.02 75.02L265.73 75.72L266.35 76.5L266.88 77.35L267.3 78.26L267.61 79.21L267.87 80.68L267.87 82.18L267.74 83.17L267.49 84.14L267.14 85.07L266.68 85.96L266.12 86.79L265.12 87.9L264.34 88.53Z" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="96.66" y="15.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">VEČER</text>
<text x="261.34" y="15.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">RÁNO</text>
<text x="96.66" y="167.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">TÉMA</text>
<text x="261.34" y="167.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#E9EDF5">CO VYKLÍČILO</text>
</svg>
</div><p class="use">Inkubace snu: zadej si téma · karta 0: Semínko na noc</p></article>
<article class="card"><div class="cap"><span class="m acc">08 · cueWave</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- cueWave, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<rect x="265.16" y="86" width="23.52" height="59" fill="#FF5F1F" fill-opacity="0.1"/>
<path d="M30 94L35.5 94L35.88 94.12L35.88 123.62L36 124L50.5 124L50.58 124.42L50.58 138.92L51 139L83.5 139L83.65 138.65L83.65 124.15L84 124L92.47 123.97L92.5 109L99.5 109L99.81 109.19L99.81 123.69L100 124L118 124L118.19 124.31L118.19 138.81L118.5 139L143.5 139L143.91 138.91L143.91 124.41L144 124L154.5 124L154.93 123.93L154.93 109.43L155 109L168 109L168.16 109.34L168.16 123.84L168.5 124L190 124L190.2 124.3L190.2 138.8L190.5 139L201 139L201.23 138.73L201.23 124.23L201.5 124L212 124L212.25 123.75L212.25 109.25L212.5 109L231 109L231.36 109.14L231.36 123.64L231.5 124L253 124L253.4 123.9L253.4 94.4L253.5 94L256 94L256.34 94.16L256.34 123.66L256.5 124L265 124L265.16 123.66L265.16 109.16L265.5 109L288.5 109L288.68 109.32L288.68 123.82L289 124L309 124L309.26 123.76L309.26 109.26L309.5 109L337 109L337.18 108.68L337.18 94.18L337.5 94L346 94" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="109" x2="99.81" y2="109" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="109" x2="168.16" y2="109" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="212.25" y1="109" x2="231.36" y2="109" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="109" x2="288.68" y2="109" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="309.26" y1="109" x2="337.18" y2="109" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.92 68L276.92 70M276.92 74L276.92 76M276.92 80L276.92 82" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M309.4 36.95L309.79 38.91M309.56 42.88L309.33 43.86L309 44.8M307.24 48.38L306.12 50.03M303.52 53.06L302.08 54.46M298.98 56.98L297.35 58.14M293.95 60.24L292.19 61.19M288.58 62.91L286.73 63.66M282.96 65.01L281.04 65.57M277.16 66.54L275.2 66.91M271.24 67.47L269.25 67.63M265.25 67.73L263.25 67.65M259.28 67.18L257.32 66.79M253.5 65.63L251.67 64.81M248.32 62.65L246.88 61.26M244.77 57.88L244.48 57.14L244.2 55.98M244.09 52L244.54 50.05M246.13 46.39L247.19 44.69M249.7 41.59L251.11 40.17M254.14 37.56L255.74 36.36M259.11 34.21L260.85 33.22M264.44 31.46L266.27 30.66M270.03 29.28L271.93 28.67M275.8 27.66L277.76 27.25M281.71 26.64L283.7 26.44M287.69 26.27L289.69 26.32M293.67 26.67L295.64 27.01M299.49 28.08L301.35 28.82M304.8 30.82L305.6 31.42L306.33 32.11M308.72 35.29L309.4 36.95" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="254.26" cy="65.91" r="2" fill="#E9EDF5"/>
<path d="M261.92 48L265.4 48L270.78 43.61L270.92 43.82L270.92 58.22L270.75 58.36L265.36 54L261.92 53.96L261.92 48Z" fill="#E9EDF5" fill-opacity="0.1"/>
<path d="M261.92 48L265.4 48L270.78 43.61L270.92 43.82L270.92 58.22L270.75 58.36L265.36 54L261.92 53.96L261.92 48Z" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M274.32 43.54L275.61 44.19L276.83 45.1L277.87 46.27L278.44 47.16L278.89 48.13L279.3 49.64L279.42 51.15L279.26 52.59" fill="none" stroke="#FF5F1F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.49 37.95L277.82 38.55L278.69 39.04L279.96 39.91L280.75 40.56L281.81 41.61L282.45 42.38L283.58 44.07L284.05 44.97L284.63 46.37L284.93 47.33L285.25 48.79L285.37 49.81L285.42 51.34L285.36 52.34L285.14 53.78" fill="none" stroke="#FF5F1F" stroke-opacity="0.72" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M278.67 32.36L280.43 33.15L281.74 33.86L283.42 35L284.62 35.97L286.03 37.35L287.02 38.48L288.2 40.11L288.97 41.41L289.65 42.77L290.38 44.64L290.81 46.08L291.2 48.02L291.37 49.55L291.41 51.58L291.31 53.06L291.02 54.97" fill="none" stroke="#FF5F1F" stroke-opacity="0.44" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">PRINCIP, NE MĚŘENÍ</text>
<text x="234.92" y="50.19" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">ZVUKOVÝ PODNĚT</text>
<text x="0" y="112.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">REM</text>
<text x="30" y="169.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">USNUTÍ</text>
<text x="346" y="169.19" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">RÁNO</text>
</svg>
</div><p class="use">Inkubace snu: zadej si téma · karta 3: Hádanky v REM<br>Zvukové podněty a rozhovor se snícím · karta 0: Co je TLR</p></article>
<article class="card"><div class="cap"><span class="m acc">09 · timeline</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- timeline, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<path d="M4 111.64L5.87 110.94M9.62 109.53L11.49 108.84M15.26 107.48L17.14 106.82M20.92 105.51L22.81 104.86M26.61 103.6L28.51 102.98M32.32 101.76L34.23 101.16M38.05 99.99L39.97 99.42M43.81 98.29L45.73 97.75M49.58 96.67L51.51 96.14M55.38 95.11L57.32 94.61M61.19 93.63L63.13 93.15M67.02 92.22L68.97 91.76M72.87 90.88L74.83 90.45M78.74 89.61L80.69 89.2M84.62 88.41L86.58 88.03M90.51 87.29L92.48 86.93M96.42 86.24L98.39 85.91M102.34 85.26L104.31 84.95M108.27 84.35L110.25 84.07M114.21 83.52L116.19 83.26M120.16 82.76L122.15 82.53M126.12 82.08L128.11 81.86M132.09 81.46L134.08 81.28M138.07 80.92L140.06 80.76M144.05 80.45L146.04 80.32M150.03 80.06L152.03 79.95M156.03 79.74L158.02 79.65M162.02 79.5L164.02 79.43M168.02 79.32L170.02 79.29M174.02 79.23L176.02 79.21M180.02 79.2L182.02 79.21M186.02 79.25L188.02 79.28M192.02 79.37L194.02 79.44M198.01 79.57L200.01 79.65M204.01 79.84L206 79.95M210 80.19L211.99 80.32M215.98 80.6L217.98 80.76M221.96 81.1L223.95 81.27M227.94 81.66L229.92 81.87M233.9 82.3L235.89 82.53M239.86 83.01L241.84 83.27M245.81 83.8L247.79 84.07M251.75 84.65L253.72 84.96M257.67 85.58L259.65 85.91M263.59 86.59L265.56 86.94M269.49 87.66L271.46 88.04M275.38 88.81L277.34 89.21M281.25 90.03L283.21 90.45M287.11 91.32L289.06 91.77M292.96 92.69L294.9 93.16M298.78 94.13L300.72 94.62M304.59 95.63L306.52 96.15M310.38 97.21L312.3 97.75M316.15 98.86L318.06 99.43M321.89 100.59L323.81 101.17M327.62 102.37L329.52 102.99M333.32 104.24L335.22 104.87M339 106.17L340.89 106.83M344.66 108.17L346.54 108.85M350.29 110.24L352.16 110.94M79.67 89.41L87.51 87.85L95.87 86.33L103.76 85.03L111.18 83.94L116.14 83.27L124.08 82.3L131.53 81.51L140 80.76L147.48 80.22L155.46 79.77L163.45 79.45L171.95 79.25L179.95 79.2L187.95 79.28L195.94 79.5L203.93 79.84L211.92 80.31L219.89 80.92L227.86 81.65L235.81 82.52L243.74 83.51L251.66 84.64L259.56 85.89L267.44 87.28L275.78 88.89L283.61 90.54L291.89 92.43L299.66 94.35L307.87 96.52L315.57 98.69L328 102.49" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="50.33" y1="100.25" x2="54.33" y2="90.25" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="55.33" y1="100.25" x2="59.33" y2="90.25" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="30" cy="102.49" r="2.6" fill="#8D97AD"/>
<text x="24" y="120.68" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">ANTIKA</text>
<text x="24" y="132.66" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">ARISTOTELÉS</text>
<circle cx="79.67" cy="89.41" r="2.6" fill="#8D97AD"/>
<text x="79.67" y="77.6" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">1867</text>
<text x="79.67" y="65.58" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">SAINT-DENYS</text>
<circle cx="129.33" cy="81.73" r="2.6" fill="#8D97AD"/>
<text x="129.33" y="99.92" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">1913</text>
<text x="129.33" y="111.9" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">VAN EEDEN</text>
<circle cx="179" cy="79.2" r="2.6" fill="#8D97AD"/>
<text x="179" y="67.39" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">1968</text>
<text x="179" y="55.37" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">GREEN</text>
<circle cx="228.67" cy="81.73" r="8" fill="#FF5F1F" fill-opacity="0.18"/>
<circle cx="228.67" cy="81.73" r="3.5" fill="#FF5F1F"/>
<path d="M221.67 96.73L222.49 96.02L223.71 95.11L224.53 94.62L225.39 94.2L226.36 93.84L227.33 93.6L228.79 93.48L230.25 93.65L231.22 93.91L232.19 94.3L233.82 95.25L235.46 96.55L235.46 96.92L235.05 97.28L233.82 98.22L232.6 98.96L231.7 99.37L230.73 99.7L229.76 99.9L228.79 99.98L227.33 99.86L226.36 99.63L225.39 99.27L224.53 98.85L223.71 98.36L222.49 97.45L221.67 96.73Z" fill="none" stroke="#FF5F1F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="228.67" cy="96.73" r="1.9" fill="#FF5F1F"/>
<text x="228.67" y="113.92" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">1975</text>
<text x="228.67" y="125.9" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">HEARNE</text>
<circle cx="278.33" cy="89.41" r="2.6" fill="#8D97AD"/>
<text x="278.33" y="77.6" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">1981</text>
<text x="278.33" y="65.58" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">LABERGE</text>
<circle cx="328" cy="102.49" r="2.6" fill="#8D97AD"/>
<text x="334" y="120.68" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">2021</text>
<text x="334" y="132.66" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">KONKOLY</text>
</svg>
</div><p class="use">Jak věda uvěřila lucidním snům · karta 0: Staré svědectví</p></article>
<article class="card"><div class="cap"><span class="m acc">10 · eyeSignal</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- eyeSignal, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<rect x="104.02" y="124" width="179.3" height="24" fill="#FF5F1F" fill-opacity="0.1"/>
<path d="M16 136L48.5 136L48.6 136.4L48.6 143.9L49 144L81 144L81.2 143.7L81.2 136.2L81.5 136L104 136L104.02 128.02L283 128L283.32 128.18L283.32 135.68L283.5 136L309 136L309.4 136.1L309.4 143.6L309.5 144L342 144" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="104.02" y1="128" x2="283.32" y2="128" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M104.02 122L104.02 120M104.02 116L104.02 114M104.02 110L104.02 108M104.02 104L104.02 102M104.02 98L104.02 96M104.02 92L104.02 90M104.02 86L104.02 84M104.02 80L104.02 78M104.02 74L104.02 72M104.02 68L104.02 66M104.02 62L104.02 60M104.02 56L104.02 54M104.02 50L104.02 48M283.32 122L283.32 120M283.32 116L283.32 114M283.32 110L283.32 108M283.32 104L283.32 102M283.32 98L283.32 96M283.32 92L283.32 90M283.32 86L283.32 84M283.32 80L283.32 78M283.32 74L283.32 72M283.32 68L283.32 66M283.32 62L283.32 60M283.32 56L283.32 54M283.32 50L283.32 48" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M16 72L17.86 72.72L19.84 73L22.33 72.85L23.83 72.94L25.77 73.38L26.27 73.43L27.77 73.4L28.23 73.25L29.95 72.23L31.93 70.71L33.83 70.1L34.31 70.13L35.77 70.5L38.16 71.22L42.14 71.57L44.04 72.18L45.92 72.87L47.91 73.07L49.9 72.9L50.4 72.92L51.89 73.03L53.86 73.4L55.83 73.15L56.28 72.93L59.96 70.36L61.93 70.04L65.72 71.3L66.21 71.4L69.7 71.64L70.19 71.72L73.98 73L75.97 73.13L77.96 72.95L79.96 73.09L81.94 73.33L83.87 72.83L85.91 71.39L88.03 70.08L89.53 70.09L90.03 70.1L91.86 70.9L93.77 71.5L94.26 71.57L95.76 71.6L97.75 71.76L98.24 71.87L102.03 73.13L104.03 73.18L106.02 73L110.02 73.18L111.88 72.46L113.9 70.99L115.68 70.08L116.14 69.94L118.1 70.28L119.9 71.16L121.82 71.68L123.82 71.7L125.81 71.88L128.17 72.68L130.09 73.24L132.09 73.23L134.08 73.02L136.07 73.07L138.07 72.95L139.88 72.1M247.2 72.53L249.14 72.09L253.14 70.06L255.13 70.01L259.12 72.05L261.1 72.2L263.08 71.97L263.57 72.02L265.04 72.27L267.34 73.23L269.28 73.67L271.24 73.32L273.14 72.73L275.1 72.32L277.02 71.81L279.27 70.74L281.11 69.98L283.08 70.2L285.25 71.41L287.08 72.22L287.56 72.26L289.06 72.23L291.04 72.01L291.53 72.07L292.98 72.42L295.27 73.4L297.23 73.72L299.16 73.22L301.04 72.56L304.9 71.55L307.18 70.55L309.09 69.98L309.57 70.04L311.02 70.42L311.46 70.63L313.17 71.67L315.04 72.35L315.53 72.38L319 72.07L319.49 72.14L320.92 72.58L323.2 73.57L325.19 73.73L329.4 72.21L331.34 71.73L333.25 71.17L335.1 70.41L337.05 70.05L337.53 70.14L338.93 70.66L339.38 70.87L341.09 71.9L342 72.3" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M139.88 72.1L142.36 46.25L142.62 46.03L164.44 48.6L168.45 97.86L168.82 97.96L190.14 95.45L190.55 95.3L194.54 46.02L216.34 48.57L216.64 48.82L220.59 97.6L220.71 97.99L242.53 95.42L242.76 95.07L247.2 72.53" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="13.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">POHYB OČÍ</text>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">PRINCIP, NE MĚŘENÍ</text>
<text x="152.92" y="39.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">L</text>
<text x="179" y="111.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">R</text>
<text x="205.08" y="39.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">L</text>
<text x="231.16" y="111.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">R</text>
<text x="16" y="165.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">FÁZE SPÁNKU</text>
<text x="193.67" y="165.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">REM</text>
</svg>
</div><p class="use">Jak věda uvěřila lucidním snům · karta 2: Hull, 12. dubna 1975<br>Zvukové podněty a rozhovor se snícím · karta 3: Rozhovor ze snu</p></article>
<article class="card"><div class="cap"><span class="m acc">11 · chronoDial</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- chronoDial, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<circle cx="128" cy="88" r="56" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="32" x2="128" y2="38" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="142.49" y1="33.91" x2="141.72" y2="36.81" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156" y1="39.5" x2="154.5" y2="42.1" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="167.6" y1="48.4" x2="165.48" y2="50.52" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="176.5" y1="60" x2="173.9" y2="61.5" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="182.09" y1="73.51" x2="179.19" y2="74.28" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="184" y1="88" x2="178" y2="88" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="182.09" y1="102.49" x2="179.19" y2="101.72" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="176.5" y1="116" x2="173.9" y2="114.5" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="167.6" y1="127.6" x2="165.48" y2="125.48" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156" y1="136.5" x2="154.5" y2="133.9" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="142.49" y1="142.09" x2="141.72" y2="139.19" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="144" x2="128" y2="138" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="113.51" y1="142.09" x2="114.28" y2="139.19" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100" y1="136.5" x2="101.5" y2="133.9" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="88.4" y1="127.6" x2="90.52" y2="125.48" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="79.5" y1="116" x2="82.1" y2="114.5" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="73.91" y1="102.49" x2="76.81" y2="101.72" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="72" y1="88" x2="78" y2="88" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="73.91" y1="73.51" x2="76.81" y2="74.28" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="79.5" y1="60" x2="82.1" y2="61.5" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="88.4" y1="48.4" x2="90.52" y2="50.52" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100" y1="39.5" x2="101.5" y2="42.1" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="113.51" y1="33.91" x2="114.28" y2="36.81" fill="none" stroke="#5B6478" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="128" y="49.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">0</text>
<text x="170" y="91.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">6</text>
<text x="128" y="133.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">12</text>
<text x="86" y="91.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">18</text>
<path d="M133.7 67.6L132.86 68.16L131.92 68.56L130.93 68.81L130.42 68.87L129.46 68.86L128.49 68.69L128 68.54L127.05 68.11L126.17 67.5L125.41 66.74L124.79 65.86L124.36 64.91L124.09 63.94L124.01 62.51L124.16 61.52L124.29 61.03L124.69 60.09L125.24 59.23L126.11 58.26L124.76 58.84L123.92 59.42L123.16 60.14L122.82 60.55L122.26 61.43L121.85 62.38L121.53 63.85L121.55 65.28L121.74 66.24L122.1 67.21L122.34 67.68L122.94 68.56L123.69 69.34L124.11 69.68L125.01 70.25L125.97 70.65L127.42 70.95L128.86 70.92L129.84 70.71L130.8 70.35L131.26 70.1L132.11 69.52L132.85 68.81L133.7 67.6Z" fill="#E9EDF5" fill-opacity="0.12"/>
<path d="M133.7 67.6L132.86 68.16L131.92 68.56L130.93 68.81L130.42 68.87L129.46 68.86L128.49 68.69L128 68.54L127.05 68.11L126.17 67.5L125.41 66.74L124.79 65.86L124.36 64.91L124.09 63.94L124.01 62.51L124.16 61.52L124.29 61.03L124.69 60.09L125.24 59.23L126.11 58.26L124.76 58.84L123.92 59.42L123.16 60.14L122.82 60.55L122.26 61.43L121.85 62.38L121.53 63.85L121.55 65.28L121.74 66.24L122.1 67.21L122.34 67.68L122.94 68.56L123.69 69.34L124.11 69.68L125.01 70.25L125.97 70.65L127.42 70.95L128.86 70.92L129.84 70.71L130.8 70.35L131.26 70.1L132.11 69.52L132.85 68.81L133.7 67.6Z" fill="none" stroke="#E9EDF5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="128" cy="111.52" r="3.5" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="133.5" y1="111.52" x2="135.5" y2="111.52" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.89" y1="115.41" x2="133.3" y2="116.82" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="117.02" x2="128" y2="119.02" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.11" y1="115.41" x2="122.7" y2="116.82" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="122.5" y1="111.52" x2="120.5" y2="111.52" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.11" y1="107.63" x2="122.7" y2="106.22" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="106.02" x2="128" y2="104.02" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.89" y1="107.63" x2="133.3" y2="106.22" fill="none" stroke="#8D97AD" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M111.18 25.21L115.47 24.22L119.44 23.57L123.48 23.16L127.92 23L132.45 23.15L136.47 23.55L140.88 24.29L144.79 25.21L148.66 26.37L152.87 27.94L156.97 29.81L160.51 31.71L163.93 33.83L167.6 36.45L171.06 39.31L174 42.08L176.75 45.01L179.59 48.46L181.95 51.74L184.34 55.59L186.42 59.51L188.09 63.22L189.51 66.98L190.79 71.2L191.8 75.57L192.45 79.53L192.88 84.01L193 88.01L192.88 92.01L192.44 96.49L191.8 100.45L190.79 104.82" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M188.05 63.13L189.61 67.27L190.75 71.06L191.76 75.38L192.41 79.27L192.82 83.2L193 87.63L192.87 92.08L192.44 96.48" fill="none" stroke="#FF5F1F" stroke-opacity="0.2" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M188.05 63.13L189.61 67.27L190.75 71.06L191.76 75.38L192.41 79.27L192.82 83.2L193 87.63L192.87 92.08L192.44 96.48" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="111.18" cy="25.21" r="2" fill="#FF5F1F"/>
<path d="M146.89 17.49L149.23 18.16L151.57 18.91L153.92 19.76L156.26 20.69L160.4 22.58L162.58 23.71L164.74 24.92L166.88 26.22L169 27.6L172.67 30.26L174.6 31.81L176.48 33.43L179.76 36.53L182.86 39.84L184.47 41.73L186.01 43.69L187.5 45.7L188.91 47.77L191.28 51.61L193.41 55.58L194.48 57.85L195.47 60.14L196.39 62.46L197.22 64.8L198.52 69.15L199.55 73.54L200 75.98L200.37 78.43L200.82 82.94L200.96 85.46L201 87.96L200.96 90.44L200.84 92.89L200.39 97.43L200.02 99.92L199.57 102.37L199.05 104.77L198.45 107.13L197.76 109.51L196.98 111.88L195.38 116.1L194.38 118.38L193.3 120.63L191.17 124.59L188.78 128.43L187.35 130.5L185.86 132.51L183.01 135.99L181.34 137.84L179.62 139.62" fill="none" stroke="#2E3A57" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201 88L200.96 90.47L200.83 92.94L200.39 97.4L200.03 99.86L199.59 102.3L199.06 104.72L198.45 107.13L197.14 111.41L196.31 113.75L195.4 116.05L193.55 120.13L192.42 122.34L191.22 124.5" fill="none" stroke="#8D97AD" stroke-opacity="0.2" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201 88L200.96 90.47L200.83 92.94L200.39 97.4L200.03 99.86L199.59 102.3L199.06 104.72L198.45 107.13L197.14 111.41L196.31 113.75L195.4 116.05L193.55 120.13L192.42 122.34L191.22 124.5" fill="none" stroke="#8D97AD" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="146.89" cy="17.49" r="2" fill="#8D97AD"/>
<text x="218" y="71.17" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">REM OKNO</text>
<line x1="218" y1="88" x2="230" y2="88" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="236" y="91.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">RANNÍ TYP</text>
<line x1="218" y1="106" x2="230" y2="106" fill="none" stroke="#8D97AD" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="236" y="109.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">VEČERNÍ TYP</text>
</svg>
</div><p class="use">Chronotyp a zdřímnutí · karta 1: Sova, nebo skřivan<br>Jak přesně prsten a hodinky vidí REM · karta 5: Předpověď, ne přímý přenos</p></article>
<article class="card"><div class="cap"><span class="m acc">12 · twoHypnograms</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- twoHypnograms, den, statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#04060C"/>
<rect x="92.47" y="40" width="7.35" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="154.93" y="40" width="13.23" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="212.25" y="40" width="19.11" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="265.16" y="40" width="23.52" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="309.26" y="40" width="27.93" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<path d="M30 28L35.5 28L35.88 28.12L35.88 51.62L36 52L50.5 52L50.58 52.42L50.58 63.92L51 64L83.5 64L83.65 63.65L83.65 52.15L84 52L92.47 51.97L92.5 40L99.5 40L99.81 40.19L99.81 51.69L100 52L118 52L118.19 52.31L118.19 63.81L118.5 64L143.5 64L143.91 63.91L143.91 52.41L144 52L154.5 52L154.93 51.93L154.93 40.43L155 40L168 40L168.16 40.34L168.16 51.84L168.5 52L190 52L190.2 52.3L190.2 63.8L190.5 64L201 64L201.23 63.73L201.23 52.23L201.5 52L212 52L212.25 51.75L212.25 40.25L212.5 40L231 40L231.36 40.14L231.36 51.64L231.5 52L253 52L253.4 51.9L253.4 28.4L253.5 28L256 28L256.34 28.16L256.34 51.66L256.5 52L265 52L265.16 51.66L265.16 40.16L265.5 40L288.5 40L288.68 40.32L288.68 51.82L289 52L309 52L309.26 51.76L309.26 40.26L309.5 40L337 40L337.18 39.68L337.18 28.18L337.5 28L346 28" fill="none" stroke="#E9EDF5" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="40" x2="99.81" y2="40" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="40" x2="168.16" y2="40" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="212.25" y1="40" x2="231.36" y2="40" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="40" x2="288.68" y2="40" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="309.26" y1="40" x2="337.18" y2="40" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="43.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">REM</text>
<rect x="106.43" y="110" width="5.14" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="160.81" y="110" width="7.35" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="213.72" y="110" width="16.17" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="265.16" y="110" width="9.55" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="281.33" y="110" width="7.35" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<rect x="307.79" y="110" width="32.33" height="12" fill="#FF5F1F" fill-opacity="0.16"/>
<path d="M30 98L38.5 98L38.82 98.18L38.82 121.68L39 122L53.5 122L53.52 133.98L54 134L81 134L81.44 133.94L81.44 122.44L81.5 122L106 122L106.43 121.93L106.43 110.43L106.5 110L111.5 110L111.57 110.43L111.57 121.93L112 122L119.5 122L119.66 122.34L119.66 133.84L120 134L140 134L140.23 133.73L140.23 122.23L140.5 122L160.5 122L160.81 121.81L160.81 110.31L161 110L168 110L168.16 110.34L168.16 121.84L168.5 122L191.5 122L191.67 122.33L191.67 133.83L192 134L199 134L199.02 122.02L213.5 122L213.72 121.72L213.72 110.22L214 110L229.5 110L229.89 110.11L229.89 121.61L230 122L254.5 122L254.87 121.87L254.87 98.37L255 98L257.5 98L257.81 98.19L257.81 121.69L258 122L265 122L265.16 121.66L265.16 110.16L265.5 110L274.5 110L274.72 110.28L274.72 121.78L275 122L281 122L281.33 121.83L281.33 110.33L281.5 110L288.5 110L288.68 110.32L288.68 121.82L289 122L307.5 122L307.79 121.79L307.79 110.29L308 110L340 110L340.12 109.62L340.12 98.12L340.5 98L346 98" fill="none" stroke="#8D97AD" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="106.43" y1="110" x2="111.57" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="160.81" y1="110" x2="168.16" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="213.72" y1="110" x2="229.89" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="110" x2="274.72" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="281.33" y1="110" x2="288.68" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="307.79" y1="110" x2="340.12" y2="110" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="113.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF7A45">REM</text>
<line x1="92.47" y1="143" x2="111.57" y2="143" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="140" x2="92.47" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="111.57" y1="140" x2="111.57" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="102.02" y="158.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">POZDĚ</text>
<line x1="154.93" y1="143" x2="160.81" y2="143" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="140" x2="154.93" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="160.81" y1="140" x2="160.81" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="274.72" y1="143" x2="281.33" y2="143" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="274.72" y1="140" x2="274.72" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="281.33" y1="140" x2="281.33" y2="146" fill="none" stroke="#FF7A45" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="278.02" y="158.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">JAKO LEHKÝ</text>
<text x="0" y="13.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#E9EDF5">POLYSOMNOGRAFIE</text>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#5B6478">PRINCIP, NE MĚŘENÍ</text>
<text x="0" y="85.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#8D97AD">ODHAD ZAŘÍZENÍ</text>
</svg>
</div><p class="use">Jak přesně prsten a hodinky vidí REM · karta 0: Světla v oknech<br>Jak přesně prsten a hodinky vidí REM · karta 2: Garmin v číslech</p></article>
</section>
<section class="phone n"><header><span class="m">ZA HRANICE REALITY</span><span class="m acc">NOČNÍ REŽIM</span></header>
<article class="card"><div class="cap"><span class="m acc">01 · dreamSignGrid</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<rect x="1" y="1" width="173" height="82" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 1L1 1L1 9" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 1L174 1L174 9" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 83L1 83L1 75" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 83L174 83L174 75" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="11" y="17.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">VNITŘNÍ PROŽITEK</text>
<line x1="12" y1="73" x2="12" y2="64" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="16.5" y1="73" x2="16.5" y2="64" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M102.26 66L102.12 65.25L101.84 64.29L101.47 63.36L101.02 62.47L99.96 60.79L97.3 57.16L96.09 55.35L95.03 53.4L94.23 51.46L93.86 50.28L93.58 49.08L93.36 47.81L93.23 46.37L93.18 44.9L93.22 43.59L93.34 42.27L93.54 41.01L93.89 39.57L94.28 38.41L94.77 37.24L95.47 35.93L96.31 34.68L97.12 33.69L97.99 32.78L99.13 31.8L100.14 31.06L101.42 30.29L102.77 29.63L104.18 29.08L105.63 28.67L107.1 28.37L108.6 28.2L109.87 28.15L111.38 28.21L112.62 28.36L114.09 28.66L115.29 29.02L116.68 29.79L118.1 30.79L119.18 31.73L120.23 32.86L120.96 33.86L121.59 34.9L122.04 35.81L122.49 36.98L122.77 37.93L123.03 39.15L123.19 40.39L123.26 41.89L123.33 42.12L127.16 48.83L127.2 49.01L123.33 49.98L123.26 50.18L123.26 54.92L123.21 55.78L123.02 56.55L122.83 57.01L122.57 57.42L122.08 57.94L121.15 58.51L120.48 58.74L119.72 58.9L118.55 59L115.26 59.01L115.26 66" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M108.26 36.5L108.37 37.96L108.62 38.96L109.02 39.83L109.56 40.55L110.43 41.24L111.3 41.64L112.3 41.89L113.76 42L112.57 42.07L111.53 42.29L110.64 42.65L109.71 43.3L109.14 43.98L108.62 45.04L108.37 46.04L108.26 47.5L108.15 46.04L107.9 45.04L107.5 44.17L106.96 43.45L106.09 42.76L105.22 42.36L104.22 42.11L102.76 42L103.95 41.93L104.99 41.71L105.88 41.35L106.81 40.7L107.38 40.02L107.9 38.96L108.15 37.96L108.26 36.5" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="184" y="1" width="173" height="82" fill="#FF3B2F" fill-opacity="0.06"/>
<rect x="184" y="1" width="173" height="82" fill="none" stroke="#FF3B2F" stroke-opacity="0.5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 1L184 1L184 9" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 1L357 1L357 9" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 83L184 83L184 75" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 83L357 83L357 75" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="194" y="17.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">DĚJ</text>
<text x="347" y="17.17" text-anchor="end" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#FF3B2F">TVOJE HLAVNÍ</text>
<line x1="195" y1="73" x2="195" y2="64" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="199.5" y1="73" x2="199.5" y2="64" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="204" y1="73" x2="204" y2="64" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="208.5" y1="73" x2="208.5" y2="64" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="193" y1="72" x2="213" y2="65" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="221" y1="73" x2="221" y2="64" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M261.26 65L261.79 62.96" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M262.63 60.06L263.22 58.23" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.27 55.34L265.03 53.49" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M266.28 50.84L267.27 49.02" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M268.83 46.59L270.11 44.94" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M272.17 42.86L273.8 41.62" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.42 40.26L278.34 39.69" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M281.29 39.4L283.32 39.57" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M286.17 40.23L288.13 40.94" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="254.26" y1="66" x2="268.26" y2="66" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="304.26" cy="30" r="3.2" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="301.26" y1="35" x2="294.26" y2="48" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.26 34L300.22 37.99L310.26 35" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M284.26 49L294.14 48.01L294.36 48.08L302.11 53.88L302.25 54.05L300.26 62" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="1" y="93" width="173" height="82" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 93L1 93L1 101" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 93L174 93L174 101" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M9 175L1 175L1 167" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166 175L174 175L174 167" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="11" y="109.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">PODOBA</text>
<line x1="12" y1="165" x2="12" y2="156" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="16.5" y1="165" x2="16.5" y2="156" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="21" y1="165" x2="21" y2="156" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M89.26 139L89.26 146L75.26 146L75.26 132L89.26 132L89.26 139Z" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="98.26" y1="139" x2="95.69" y2="140.55" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="98.26" y1="139" x2="95.69" y2="137.45" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M115.66 139L116.19 139.53L116.48 139.93L116.81 140.6L116.87 141.33L116.7 141.8L116.21 142.36L115.8 142.64L114.01 143.51L113.68 143.88L113.46 144.3L113.01 144.5L112.68 144.88L111.96 146.46L111.52 147.07L111.15 147.39L110.68 147.58L110.19 147.6L109.95 147.58L109.27 147.28L108.86 146.99L108.33 146.47L107.36 145.33L106.97 145.03L106.74 144.94L106.25 144.97L104.21 145.91L103.27 146.23L102.54 146.38L101.79 146.4L101.06 146.26L100.97 146.05L100.86 145.31L100.9 144.57L101.06 143.84L101.41 142.91L102.26 141.1L102.34 140.61L102.16 140.16L101.99 139.97L100.86 139L100.33 138.47L100.04 138.07L99.71 137.4L99.65 136.67L99.82 136.2L100.31 135.64L100.94 135.24L102.51 134.49L102.84 134.12L103.06 133.7L103.51 133.5L103.68 133.32L104.06 132.68L104.56 131.54L105 130.93L105.37 130.61L105.84 130.42L106.33 130.4L106.57 130.42L107.25 130.72L107.66 131.01L108.19 131.53L109.16 132.67L109.55 132.97L109.78 133.06L110.27 133.03L112.31 132.09L113.25 131.77L113.98 131.62L114.73 131.6L115.46 131.74L115.55 131.95L115.66 132.69L115.62 133.43L115.46 134.16L115.11 135.09L114.26 136.9L114.18 137.39L114.36 137.84L114.53 138.03L115.66 139Z" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.26" y1="139" x2="121.69" y2="140.55" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.26" y1="139" x2="121.69" y2="137.45" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.06 139L141.92 140.48L141.49 141.91L140.81 143.23L140.37 143.84L139.71 144.58L138.55 145.51L137.23 146.21L135.8 146.64L134.32 146.8L132.84 146.67L131.87 146.42L131.18 146.16L129.87 145.44L128.72 144.49L127.78 143.34L127.07 142.03L126.63 140.6L126.46 139.12L126.49 138.38L126.63 137.4L127.07 135.97L127.78 134.66L128.72 133.51L129.87 132.56L131.18 131.84L131.87 131.58L132.84 131.33L134.32 131.2L135.8 131.36L137.23 131.79L138.55 132.49L139.71 133.42L140.37 134.16L140.81 134.77L141.49 136.09L141.92 137.52L142.06 139Z" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="184" y="93" width="173" height="82" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 93L184 93L184 101" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 93L357 93L357 101" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192 175L184 175L184 167" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M349 175L357 175L357 167" fill="none" stroke="#5A120D" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="194" y="109.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">SOUVISLOSTI</text>
<line x1="195" y1="165" x2="195" y2="156" fill="none" stroke="#6E1A12" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.26 131L297.26 122L261.26 122L261.26 150L297.26 150L297.26 147" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.26 146L273.21 133.07L273.38 133.12L279.2 138.94L279.37 138.87L286.27 131.02L294.26 146" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="269.26" cy="129" r="2.4" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M292.26 145L292.26 136.01L304.23 136L304.25 145.19L304.12 145.92L303.92 146.4L303.45 147.05L303.05 147.41L302.36 147.79L301.87 147.94L301.39 148L295.17 148L294.69 147.95L294.2 147.81L293.73 147.58L293.3 147.27L292.92 146.88L292.63 146.44L292.42 145.96L292.26 145Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.26 138.5L304.97 138.57L305.7 138.81L306.38 139.22L306.78 139.57L307.12 139.99L307.5 140.68L307.66 141.17L307.76 141.88L307.71 142.59L307.5 143.32L307.12 144.01L306.78 144.43L306.38 144.78L305.7 145.19L304.97 145.43L304.26 145.5" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M296.26 133L295.82 132.26L295.43 131.32L295.27 130.43L295.31 129.73L295.52 129.03L295.77 128.59L296.68 127.53L296.96 127.09L297.21 126.43L297.26 125.98L297.15 125.32L296.95 124.88L296.26 124" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.26 133L299.82 132.26L299.43 131.32L299.27 130.43L299.31 129.73L299.52 129.03L299.77 128.59L300.68 127.53L300.96 127.09L301.21 126.43L301.26 125.98L301.15 125.32L300.95 124.88L300.26 124" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Znaky snů a jejich čtyři druhy · karta 1: Čtyři přihrádky</p></article>
<article class="card"><div class="cap"><span class="m acc">02 · fadingTrace</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<line x1="100.24" y1="24" x2="344" y2="24" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="24" x2="100.24" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="100.24" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">0</text>
<line x1="148.99" y1="24" x2="148.99" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="148.99" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">1</text>
<line x1="197.74" y1="24" x2="197.74" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="197.74" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">2</text>
<line x1="246.5" y1="24" x2="246.5" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="246.5" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">3</text>
<line x1="295.25" y1="24" x2="295.25" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="295.25" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">4</text>
<line x1="344" y1="24" x2="344" y2="28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="344" y="15.18" text-anchor="middle" font-size="9" font-weight="500" letter-spacing="0.54" fill="#B3261E">5</text>
<text x="88.24" y="15.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">MINUTY</text>
<line x1="100.24" y1="34" x2="100.24" y2="36.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="40" x2="100.24" y2="42.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="46" x2="100.24" y2="48.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="52" x2="100.24" y2="54.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="58" x2="100.24" y2="60.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="64" x2="100.24" y2="66.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="70" x2="100.24" y2="72.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="76" x2="100.24" y2="78.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="82" x2="100.24" y2="84.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="88" x2="100.24" y2="90.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="94" x2="100.24" y2="96.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="100" x2="100.24" y2="102.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="106" x2="100.24" y2="108.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="112" x2="100.24" y2="114.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="118" x2="100.24" y2="120.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="124" x2="100.24" y2="126.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="130" x2="100.24" y2="132.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="136" x2="100.24" y2="138.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="142" x2="100.24" y2="144.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100.24" y1="148" x2="100.24" y2="150.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="100.24" y="169.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">PROBUZENÍ</text>
<circle cx="17.9" cy="44" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<circle cx="57.28" cy="60" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<circle cx="75.18" cy="40" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<circle cx="32.22" cy="128" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<circle cx="71.6" cy="140" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<circle cx="10.74" cy="112" r="0.9" fill="#B3261E" fill-opacity="0.6"/>
<path d="M4 87.23L6.19 87.73L8.08 88.37L9.93 89.14L12.17 90.24L18.09 93.46L20.1 94.48L21.92 95.3L24.03 96.09L25.96 96.6L28.18 96.93L29.93 96.99L31.92 96.82L33.88 96.43L36.02 95.76L38.1 94.91L39.9 94.04L46.05 90.7L48.05 89.67L49.86 88.84L51.96 88.03L53.88 87.48L56.1 87.1L58.09 87.01L60.08 87.16L62.05 87.54L63.96 88.12L66.05 88.95L68.08 89.91L74.01 93.13L76 94.17L78.04 95.12L79.9 95.85L81.81 96.43L84.01 96.87L86.01 97L88 96.89L89.97 96.54L91.89 96L93.99 95.2L96.03 94.25L100 92.13" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="4" y="75.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">SEN</text>
<path d="M100.24 92L102.33 90.64L104.08 89.24L106.12 87.4L110 83.52L115.84 77.38" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M118.28 74.89L121.84 71.45L125.18 68.5L127.11 66.96L128.71 65.79L130.58 64.57" fill="none" stroke="#B3261E" stroke-opacity="0.92" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M133.89 62.87L135.52 62.29L137.21 61.91L138.69 61.78L141.91 61.78L143.65 61.71" fill="none" stroke="#B3261E" stroke-opacity="0.85" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.72 61.31L155.47 60.19" fill="none" stroke="#B3261E" stroke-opacity="0.79" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.21 59.58L163.39 59.29L166.34 59.14" fill="none" stroke="#B3261E" stroke-opacity="0.74" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.69 59.14L176.51 59.38" fill="none" stroke="#B3261E" stroke-opacity="0.69" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M182.41 59.81L186.15 60.07" fill="none" stroke="#B3261E" stroke-opacity="0.64" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192.57 60.38L195.4 60.44" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M202.31 60.38L204.4 60.32" fill="none" stroke="#B3261E" stroke-opacity="0.56" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="211.79" cy="60.06" r="0.71" fill="#B3261E" fill-opacity="0.48"/>
<circle cx="221.1" cy="59.81" r="0.67" fill="#B3261E" fill-opacity="0.44"/>
<circle cx="230.36" cy="59.81" r="0.63" fill="#B3261E" fill-opacity="0.39"/>
<circle cx="239.68" cy="59.97" r="0.59" fill="#B3261E" fill-opacity="0.35"/>
<circle cx="249.15" cy="60.1" r="0.55" fill="#B3261E" fill-opacity="0.31"/>
<circle cx="258.9" cy="60.09" r="0.51" fill="#B3261E" fill-opacity="0.26"/>
<text x="268.43" y="63.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#6E1A12">ROZPLYNE SE</text>
<path d="M100.24 92L102.06 91.19L103.76 90.8L105.76 90.76L107.7 91.2L109.3 91.89L111.2 93.09L113.11 94.7L114.85 96.48L116.61 98.58L118.56 101.18L120.4 103.85L122.18 106.56" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M122.18 106.56L127.96 115.61L129.95 118.49L131.92 121.07L133.75 123.12L135.8 124.96L137.72 126.13L139.63 126.71L141.61 126.96L143.61 126.97L145.59 126.73L147.54 126.28L149.43 125.65L151.27 124.87L153.3 123.89L159.22 120.67L161 119.75L163.04 118.8L164.9 118.08L167.06 117.46L168.78 117.15L170.77 117L172.77 117.1L174.74 117.44L176.66 117.98L178.53 118.69L180.58 119.61L182.36 120.52L188.28 123.75L190.3 124.75L192.14 125.53L194.02 126.19L196.21 126.72L197.94 126.94L199.94 126.98L202.17 126.72L203.88 126.34L206.01 125.63L207.86 124.86L209.65 123.99L217.58 119.73L219.39 118.89L221.25 118.16L223.4 117.51L225.36 117.14L227.11 117.01L229.1 117.09L231.08 117.4L233.01 117.92L234.88 118.61L236.94 119.52L238.94 120.54L244.64 123.65L246.65 124.66L248.72 125.55L250.61 126.21L252.54 126.69L254.53 126.95L256.27 126.98L258.51 126.76L260.46 126.32L262.36 125.71L264.21 124.95L266.23 123.97L272.16 120.75L273.93 119.83L275.97 118.87L277.83 118.14L279.74 117.56L281.7 117.17L283.69 117L285.69 117.09L287.66 117.41L289.59 117.93L291.47 118.61L293.52 119.54L295.52 120.56L301.22 123.67L303.24 124.67L305.07 125.47L306.95 126.14L308.88 126.64L310.86 126.93L312.86 126.99L314.85 126.8L316.8 126.38L318.71 125.78L320.56 125.03L322.59 124.07L328.52 120.85L330.29 119.92L332.32 118.96L334.18 118.21L336.08 117.62L338.04 117.2L340.03 117.01L342.02 117.07L344 117.36" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="142.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">ZAPSANÝ SEN</text>
<path d="M0 0L5.94 -2.57L6.18 -2.6L23.86 -2.6L24 -2.49L24 2.49L23.86 2.6L5.94 2.57L0 0Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
<line x1="6" y1="-2.6" x2="6" y2="2.6" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
<line x1="20" y1="-2.6" x2="20" y2="2.6" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.58 -0.81 0.81 0.58 122.18 106.56)"/>
</svg>
</div><p class="use">Proč sny zapomínáme · karta 2: Vločka na dlani</p></article>
<article class="card"><div class="cap"><span class="m acc">03 · brainMap</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<circle cx="185.45" cy="75.4" r="0.61" fill="#FF3B2F" fill-opacity="0.43"/>
<circle cx="118.64" cy="49.46" r="0.78" fill="#FF3B2F" fill-opacity="0.54"/>
<circle cx="224.88" cy="87.05" r="0.98" fill="#FF3B2F" fill-opacity="0.25"/>
<circle cx="111.52" cy="107.88" r="0.81" fill="#FF3B2F" fill-opacity="0.4"/>
<circle cx="108.3" cy="103.86" r="0.81" fill="#FF3B2F" fill-opacity="0.56"/>
<circle cx="117.64" cy="96.04" r="0.96" fill="#FF3B2F" fill-opacity="0.59"/>
<circle cx="172.58" cy="55.62" r="0.67" fill="#FF3B2F" fill-opacity="0.59"/>
<circle cx="209.88" cy="110.59" r="0.88" fill="#FF3B2F" fill-opacity="0.29"/>
<circle cx="113.1" cy="120.43" r="0.98" fill="#FF3B2F" fill-opacity="0.45"/>
<circle cx="133.9" cy="45.67" r="0.92" fill="#FF3B2F" fill-opacity="0.54"/>
<circle cx="170.09" cy="53.25" r="0.89" fill="#FF3B2F" fill-opacity="0.32"/>
<circle cx="197.08" cy="121.3" r="0.84" fill="#FF3B2F" fill-opacity="0.57"/>
<circle cx="161.13" cy="125.36" r="0.73" fill="#FF3B2F" fill-opacity="0.32"/>
<circle cx="178.34" cy="49.64" r="0.71" fill="#FF3B2F" fill-opacity="0.3"/>
<circle cx="123.97" cy="75.75" r="0.76" fill="#FF3B2F" fill-opacity="0.23"/>
<circle cx="148.55" cy="51.02" r="0.56" fill="#FF3B2F" fill-opacity="0.41"/>
<circle cx="194.77" cy="46.3" r="0.58" fill="#FF3B2F" fill-opacity="0.47"/>
<circle cx="170.6" cy="62.94" r="0.73" fill="#FF3B2F" fill-opacity="0.44"/>
<circle cx="136.13" cy="56.9" r="0.74" fill="#FF3B2F" fill-opacity="0.29"/>
<circle cx="122.81" cy="116.84" r="0.68" fill="#FF3B2F" fill-opacity="0.47"/>
<circle cx="187.29" cy="118.07" r="0.83" fill="#FF3B2F" fill-opacity="0.24"/>
<circle cx="127.23" cy="100.04" r="1" fill="#FF3B2F" fill-opacity="0.2"/>
<circle cx="131.02" cy="50.65" r="0.66" fill="#FF3B2F" fill-opacity="0.55"/>
<circle cx="198.42" cy="71.49" r="0.98" fill="#FF3B2F" fill-opacity="0.5"/>
<circle cx="257.96" cy="91.81" r="0.71" fill="#FF3B2F" fill-opacity="0.21"/>
<circle cx="136.5" cy="37.9" r="0.87" fill="#FF3B2F" fill-opacity="0.26"/>
<path d="M96.27 96.3L96.17 93.01L96.23 89.75L96.45 86.52L96.83 83.3L97.38 80.08L98.08 76.91L98.94 73.8L99.89 70.94L100.97 68.13L102.3 65.17L103.77 62.28L105.28 59.68L107.05 56.95L108.81 54.52L110.85 52L112.85 49.77L114.97 47.63L117.19 45.6L119.68 43.55L122.08 41.76L124.6 40.08L127.38 38.41L130.22 36.9L132.94 35.61L135.75 34.44L138.54 33.42L141.6 32.45L144.51 31.67L147.49 31L151.05 30.34L155.33 29.64L159.56 29.06L164.46 28.5L169.1 28.1L173.7 27.83L178.48 27.69L183.17 27.69L187.59 27.83L192.17 28.12L196.67 28.55L201.07 29.13L205.23 29.81L209.46 30.65L213.6 31.63L217.41 32.67L222.93 34.35L226.22 35.53L229.64 36.97L232.84 38.52L235.89 40.2L238.85 42.04L241.74 44.07L244.46 46.22L246.9 48.4L249.21 50.7L251.51 53.28L253.38 55.68L255.22 58.35L256.87 61.14L258.23 63.84L259.38 66.59L260.34 69.44L261.07 72.36L261.57 75.3L261.77 77.3L261.85 79.3L261.67 84.36L261.35 87.3L260.74 90.02L260.28 91.43L259.72 92.8L259.05 94.16L258.29 95.44L257.43 96.66L256.63 97.62L255.59 98.7L254.48 99.69L253.32 100.57L251.87 101.5L250.32 102.32L248.68 103.04L246.94 103.65L245.12 104.16L243.23 104.55L241.26 104.84L238.16 105.09L235.19 105.09L233.61 104.98L231.83 104.77L226.34 103.85L224.11 103.58L222.89 103.51L221.64 103.54L220.64 103.64L219.65 103.83L219.64 103.9L221.13 104.48L222.25 105.11L223.24 105.86L224.29 106.89L225.17 108.09L225.77 109.19L226.23 110.35L226.6 111.8L226.74 113.05L226.73 114.54L226.52 116.03L226.13 117.48L225.55 118.87L224.83 120.17L223.93 121.41L222.96 122.5L222.04 123.36L221.23 124.01L219.45 125.67L218.25 126.61L216.81 127.62L215.14 128.65L213.34 129.63L211.34 130.6L209.28 131.48L206.89 132.38L204.57 133.16L201.91 133.94L199.3 134.62L196.49 135.25L193.58 135.82L190.58 136.32L187.48 136.76L183.03 137.24L178.62 137.58L174.09 137.8L169.45 137.88L165.7 137.83L161.7 137.65L157.7 137.33L153.72 136.88L149.51 136.27L145.31 135.5L141.16 134.6L137.28 133.62L133.41 132.5L129.64 131.26L125.85 129.85L122.39 128.39L119.25 126.92L116.32 125.38L113.55 123.75L111.03 122.1L108.59 120.29L106.54 118.56L104.52 116.61L102.86 114.73L101.41 112.79L99.91 110.38L98.77 108.16L97.84 105.88L97.14 103.57L96.64 101.17L96.35 98.67L96.27 96.3" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M219.52 103.86L216.37 102.35L212.95 100.84L209.25 99.32L205.28 97.81L197.71 95.14L180.59 89.45L176.37 87.96L172.48 86.48L168.68 84.92L165.01 83.26L161.7 81.59L158.74 79.92" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M190.82 29.52L189.28 32.46L188.02 35.4L186.96 38.46L186.04 41.82L185.4 44.72L184.84 47.9L183.32 58.73L182.62 63.08L181.76 67.27L180.72 71.24L179.4 75.2L177.86 78.94L176.02 82.66L173.93 86.22" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M214.46 120.24L207.27 117.09L200.16 114.26L192.9 111.66L185.33 109.22L177.48 106.94L169.04 104.74L159.66 102.51L148.61 100.08" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M239.78 47.16L237.08 46.47L234.63 45.97L231.93 45.54L229.48 45.27L226.73 45.12L224.24 45.11L221.75 45.22L219.26 45.46L216.58 45.86L214.15 46.36L211.71 46.98L209.29 47.73L206.78 48.63L204.27 49.68L201.77 50.87L199.26 52.2" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M249.91 72.36L247.39 71.29L244.8 70.38L242.14 69.64L239.42 69.07L236.75 68.67L233.78 68.41L231.02 68.33L227.96 68.4L225.02 68.63L221.83 69.04L218.86 69.57L215.61 70.32L212.55 71.17L209.25 72.24L205.95 73.48L202.64 74.88" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M114.84 125.28L114.24 127.23L113.95 128.93L113.89 130.68L114.09 132.4L114.55 134.09L115.24 135.7L116.29 137.41L117.5 138.93L118.92 140.35L120.71 141.82L122.71 143.18L124.91 144.43L127.43 145.63L129.95 146.63L132.83 147.58L135.74 148.36L138.91 149.03L142.39 149.56L145.89 149.88L149.13 150.01L152.65 149.93L155.91 149.65L158.81 149.2L160.8 148.62L162.13 148.12L163.33 147.58L164.4 146.99L165.28 146.42L166.15 145.74L166.9 145.04L167.51 144.32L168 143.59L168.37 142.85L168.62 142.1L168.75 141.37L168.72 140.43L168.54 139.7L168.22 139.02L167.77 138.41L167.18 137.88" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="119.91" y1="135.36" x2="158.74" y2="139.14" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128.35" y1="142.92" x2="158.74" y2="146.7" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="173.93" y1="137.88" x2="175.62" y2="156.78" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="185.75" y1="137.25" x2="187.44" y2="156.78" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M131.72 52.2L134.03 53.26" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M137.26 54.67L139.57 55.61" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.81 56.85L145.16 57.69" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M148.51 58.8L150.9 59.53" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M154.25 60.46L156.67 61.07" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.1 61.85L162.55 62.33" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M165.99 62.92L168.46 63.28" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.94 63.69L174.43 63.92" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M177.92 64.14L180.42 64.23" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M183.91 64.27L186.41 64.22" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M189.91 64.07L192.41 63.9" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M195.88 63.56L198.35 63.25" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201.82 62.73L204.3 62.3" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M207.71 61.61L210.13 61.05" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M213.53 60.19L215.96 59.51" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M219.3 58.49L221.65 57.72" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M224.95 56.55L227.3 55.66" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M229.65 54.72L232 55.81" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M235.11 57.48L237.2 58.78" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M240.01 60.81L241.95 62.42" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M244.46 64.84L246.11 66.7" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M248.23 69.46L249.59 71.55" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M251.3 74.65L252.33 76.87" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M253.57 80.1L254.34 82.52" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M131.72 52.2L131.78 54.82" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M132.09 58.35L132.48 60.77" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M133.27 64.12L134.05 66.53" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M135.41 69.75L136.57 71.94" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M138.46 74.84L140.01 76.8" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142.44 79.38L144.26 81.02" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M146.97 83.12L149.07 84.53" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M151.99 86.22L153.91 84.53" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.62 82.24L158.59 80.67" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M161.37 78.54L163.38 77.07" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M166.23 75.09L168.28 73.74" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M171.25 71.88L173.42 70.6" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M176.48 68.89L178.7 67.73" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M181.84 66.18L184.1 65.14" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M187.3 63.76L189.61 62.83" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M192.88 61.62L195.24 60.81" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M198.58 59.77L200.99 59.08" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M204.39 58.2L206.85 57.63" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M210.25 56.92L212.68 56.48" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M216.1 55.94L218.57 55.62" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M222.07 55.23L224.58 55.02" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M228.14 54.79L229.65 54.72" fill="none" stroke="#FF3B2F" stroke-opacity="0.55" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="131.72" cy="52.2" r="2" fill="#B3261E"/>
<line x1="126.72" y1="52.2" x2="136.72" y2="52.2" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.72" y1="47.2" x2="131.72" y2="57.2" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="229.65" cy="54.72" r="2" fill="#B3261E"/>
<line x1="224.65" y1="54.72" x2="234.65" y2="54.72" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="229.65" y1="49.72" x2="229.65" y2="59.72" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="254.98" cy="84.96" r="2" fill="#B3261E"/>
<line x1="249.98" y1="84.96" x2="259.98" y2="84.96" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="254.98" y1="79.96" x2="254.98" y2="89.96" fill="none" stroke="#B3261E" stroke-opacity="0.6" stroke-width="0.6" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="151.99" cy="86.22" r="9" fill="#FF3B2F" fill-opacity="0.18"/>
<circle cx="151.99" cy="86.22" r="13" fill="none" stroke="#FF3B2F" stroke-opacity="0.35" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="151.99" cy="86.22" r="3.5" fill="#FF3B2F"/>
<text x="0" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">PRECUNEUS</text>
<path d="M24 19L24.03 52.2L122.72 52.2" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="13.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">PŘEDNÍ ČELNÍ KŮRA</text>
<path d="M334 19L334 54.7L238.65 54.72" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="156.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">TEMPOROPARIETÁLNÍ</text>
<text x="0" y="169.17" text-anchor="start" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#FF3B2F">SPOJENÍ VPRAVO</text>
<path d="M24 143L24 86.33L24.14 86.22L142.99 86.22" fill="none" stroke="#FF3B2F" stroke-opacity="0.5" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="169.19" text-anchor="end" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">ČELNÍ PÓL</text>
<path d="M334 157L334 85.1L333.89 84.96L263.98 84.96" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Proč sny zapomínáme · karta 4: Obyčejná paměť v nezvyklý čas<br>Mozek v lucidním snu · karta 0: Divák, který si všiml kina<br>Mozek v lucidním snu · karta 2: Co se zatím ukazuje</p></article>
<article class="card"><div class="cap"><span class="m acc">04 · remRebound</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<text x="0" y="55.17" text-anchor="start" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#6E1A12">REM</text>
<rect x="59.52" y="52" width="2.23" height="6" fill="#B3261E" fill-opacity="0.18"/>
<rect x="59.52" y="52" width="2.23" height="6" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="59.52" y1="52" x2="61.76" y2="52" fill="none" stroke="#B3261E" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="87.46" y="52" width="2.79" height="6" fill="#B3261E" fill-opacity="0.18"/>
<rect x="87.46" y="52" width="2.79" height="6" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="87.46" y1="52" x2="90.26" y2="52" fill="none" stroke="#B3261E" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="108.88" y="52" width="3.17" height="6" fill="#B3261E" fill-opacity="0.18"/>
<rect x="108.88" y="52" width="3.17" height="6" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="108.88" y1="52" x2="112.05" y2="52" fill="none" stroke="#B3261E" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="121.92" y="52" width="4.66" height="6" fill="#B3261E" fill-opacity="0.18"/>
<rect x="121.92" y="52" width="4.66" height="6" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="121.92" y1="52" x2="126.58" y2="52" fill="none" stroke="#B3261E" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M26 38L28.75 38L28.79 38.21L28.79 77.95L28.99 78L31.49 78L31.59 78.15L31.59 97.9L31.73 98L38.98 98L39.04 98.19L39.04 117.94L39.23 118L53.94 117.96L53.97 98L59.47 98L59.53 97.81L59.53 58.07L59.71 58L61.71 58L61.76 58.2L61.76 97.94L61.95 98L67.91 98.04L67.94 118L78.15 117.96L78.18 98L87.43 98L87.46 58.04L90.17 58L90.26 58.17L90.26 97.91L90.41 98L104.16 98L104.22 97.82L104.22 78.07L104.4 78L108.88 77.98L108.9 58L111.9 58L112.05 58.1L112.05 97.84L112.14 98L121.89 98L121.92 58.04L122.13 58L126.37 58L126.57 57.95L126.57 38.21L126.62 38L129.37 38" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="231.07" y="44" width="7.45" height="14" fill="#FF3B2F" fill-opacity="0.18"/>
<rect x="231.07" y="44" width="7.45" height="14" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="231.07" y1="44" x2="238.53" y2="44" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="260.88" y="44" width="10.24" height="14" fill="#FF3B2F" fill-opacity="0.18"/>
<rect x="260.88" y="44" width="10.24" height="14" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="260.88" y1="44" x2="271.12" y2="44" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="285.09" y="44" width="12.11" height="14" fill="#FF3B2F" fill-opacity="0.18"/>
<rect x="285.09" y="44" width="12.11" height="14" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="285.09" y1="44" x2="297.19" y2="44" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="308.37" y="44" width="13.97" height="14" fill="#FF3B2F" fill-opacity="0.18"/>
<rect x="308.37" y="44" width="13.97" height="14" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="308.37" y1="44" x2="322.34" y2="44" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="332.58" y="44" width="13.97" height="14" fill="#FF3B2F" fill-opacity="0.18"/>
<rect x="332.58" y="44" width="13.97" height="14" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="332.58" y1="44" x2="346.55" y2="44" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M205 38L206.75 38L206.86 38.14L206.86 77.89L207 78L209.5 78L209.66 78.09L209.66 97.84L209.75 98L216 98L216.18 98.07L216.18 117.82L216.25 118L227.25 118L227.35 117.85L227.35 98.1L227.5 98L231 98L231.07 97.82L231.07 58.07L231.25 58L238.5 58L238.52 97.98L245.98 98.02L246 118L254.25 118L254.36 117.86L254.36 98.11L254.5 98L260.75 98L260.88 97.88L260.88 58.13L261 58L271 58L271.12 58.13L271.12 97.88L271.25 98L285 98L285.09 97.84L285.09 58.09L285.25 58L297 58L297.19 58.06L297.19 97.81L297.25 98L308.25 98L308.37 97.87L308.37 58.12L308.5 58L322.25 58L322.34 58.16L322.34 77.91L322.5 78L326 78L326.06 78.19L326.06 97.94L326.25 98L332.5 98L332.58 97.83L332.58 58.08L332.75 58L346.5 58L346.55 57.8L346.55 38.05L346.75 38L354 38" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="30" x2="129.37" y2="32.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="36" x2="129.37" y2="38.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="42" x2="129.37" y2="44.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="48" x2="129.37" y2="50.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="54" x2="129.37" y2="56.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="60" x2="129.37" y2="62.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="66" x2="129.37" y2="68.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="72" x2="129.37" y2="74.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="78" x2="129.37" y2="80.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="84" x2="129.37" y2="86.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="90" x2="129.37" y2="92.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="96" x2="129.37" y2="98.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="102" x2="129.37" y2="104.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="108" x2="129.37" y2="110.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="114" x2="129.37" y2="116.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="129.37" y1="120" x2="129.37" y2="122.5" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 44L138.82 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M140.82 44L142.82 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M144.82 44L146.82 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 44.83L147.99 46.83" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 48.83L147.99 50.83" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 52.83L147.99 54.83" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M147.99 56.83L147.99 57.83L147.92 58L147.17 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M145.17 58L143.17 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M141.17 58L139.17 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M137.17 58L136.92 58L136.82 57.85L136.82 56.35" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 54.35L136.82 52.35" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 50.35L136.82 48.35" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M136.82 46.35L136.82 44.35" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 44L158.38 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.38 44L162.38 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.38 44L166.38 44" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M168.38 44L169.38 44L169.41 44.96" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 46.96L169.41 48.96" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 50.96L169.41 52.96" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M169.41 54.96L169.41 56.96" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M168.45 58L166.45 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.45 58L162.45 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M160.45 58L158.45 58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.45 58L156.38 57.83L156.38 56.08" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 54.08L156.38 52.08" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 50.08L156.38 48.08" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M156.38 46.08L156.38 44.08" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="153.02" y="83.17" text-anchor="middle" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#6E1A12">CHYBÍ</text>
<path d="M152.65 38L155.37 35.57L157.89 33.47L160.42 31.51L162.95 29.7L165.55 27.99L167.94 26.56L170.54 25.15L173.14 23.9L175.74 22.8L178.35 21.86L180.95 21.07L183.56 20.45L186.05 19.99L188.53 19.69L191.02 19.52L193.75 19.5L196.22 19.63L198.94 19.94L201.41 20.37L204.12 21L206.68 21.76L209.25 22.66L211.82 23.72L214.37 24.93L216.92 26.28L219.47 27.79L222.01 29.44L224.56 31.24L227.02 33.13L229.68 35.32L232.33 37.67L234.8 40" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="234.8" y1="40" x2="229.93" y2="38.86" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="234.8" y1="40" x2="233.53" y2="35.16" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="193.72" y="12.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">DOHÁNÍ</text>
<line x1="26" y1="128" x2="175" y2="128" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="205" y1="128" x2="354" y2="128" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="26" y="149.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">KRÁTKÁ NOC</text>
<text x="205" y="149.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">DALŠÍ NOC</text>
<text x="358" y="170.17" text-anchor="end" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#6E1A12">PRINCIP, NE MĚŘENÍ</text>
</svg>
</div><p class="use">Káva, alkohol a REM · karta 4: REM rebound: mozek dohání</p></article>
<article class="card"><div class="cap"><span class="m acc">05 · loopRoom</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<rect x="38.4" y="24" width="281.2" height="148" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M50.4 24L38.4 24L38.4 36" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M307.6 24L319.6 24L319.6 36" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M50.4 172L38.4 172L38.4 160" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M307.6 172L319.6 172L319.6 160" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="38.4" y1="151.28" x2="319.6" y2="151.28" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M52.46 151.28L52.47 53.6L86.2 53.6L86.2 151.28" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="79.17" cy="105.4" r="1.8" fill="#B3261E"/>
<rect x="103.08" y="44.72" width="39.37" height="47.36" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="122.76" y1="44.72" x2="122.76" y2="92.08" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="103.08" y1="68.4" x2="142.44" y2="68.4" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="111.51" cy="53.6" r="0.9" fill="#FF3B2F" fill-opacity="0.6"/>
<circle cx="134.01" cy="61" r="0.9" fill="#FF3B2F" fill-opacity="0.6"/>
<circle cx="117.14" cy="81.72" r="0.9" fill="#FF3B2F" fill-opacity="0.6"/>
<rect x="295.7" y="120.2" width="8.44" height="31.08" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="170.56" y="127.6" width="5.62" height="23.68" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="176.19" y="132.04" width="119.51" height="10.36" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="268.98" y="125.38" width="23.9" height="6.66" rx="3" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M176.19 135L185.88 133.45L195.5 132.22L205.24 131.28L214.7 130.68L219.43 130.5L224.2 130.4L228.96 130.38L233.69 130.44L242.93 130.79L247.42 131.08L252.15 131.47L257.6 132.02L257.74 132.15L257.74 142.4" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="38.4" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">PROBUZENÍ</text>
<rect x="156.5" y="34.36" width="151.85" height="79.92" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.82 34.36L156.63 34.36L156.5 34.48L156.5 42.68" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.03 34.36L308.23 34.36L308.35 34.48L308.35 42.68" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.82 114.28L156.63 114.28L156.5 114.16L156.5 105.96" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.03 114.28L308.23 114.28L308.35 114.16L308.35 105.96" fill="none" stroke="#5A120D" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156.5" y1="103.09" x2="308.35" y2="103.09" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M164.1 103.09L164.1 50.36L164.33 50.34L182.32 50.36L182.32 103.09" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="178.52" cy="78.32" r="1.25" fill="#6E1A12"/>
<rect x="191.43" y="45.55" width="21.26" height="25.57" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="202.06" y1="45.55" x2="202.06" y2="71.12" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="191.43" y1="58.34" x2="212.69" y2="58.34" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="295.44" y="86.31" width="4.56" height="16.78" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="227.87" y="90.3" width="3.04" height="12.79" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="230.91" y="92.7" width="64.54" height="5.59" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="281.02" y="89.11" width="12.91" height="3.6" rx="1.62" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M230.91 94.3L236.17 93.46L241.4 92.79L246.58 92.29L251.72 91.97L256.96 91.81L261.97 91.84L266.95 92.03L271.88 92.39L274.82 92.69L274.95 92.82L274.95 98.3" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="156.5" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#6E1A12">A ZNOVU</text>
<line x1="156.5" y1="17" x2="156.5" y2="32.36" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<rect x="220.28" y="39.95" width="82" height="43.16" fill="none" stroke="#3A0C08" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M226.61 39.95L220.4 39.95L220.28 40.08L220.28 46.29" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.95 39.95L302.15 39.95L302.28 40.08L302.28 46.29" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M226.61 83.11L220.4 83.11L220.28 82.99L220.28 76.78" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.95 83.11L302.15 83.11L302.28 82.99L302.28 76.78" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="220.28" y1="77.07" x2="302.28" y2="77.07" fill="none" stroke="#6E1A12" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M224.38 77.07L224.38 48.65L224.56 48.59L234.04 48.59L234.22 48.65L234.22 77.07" fill="none" stroke="#6E1A12" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="232.17" cy="63.69" r="0.95" fill="#6E1A12"/>
<rect x="239.14" y="46" width="11.48" height="13.81" fill="none" stroke="#6E1A12" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="244.88" y1="46" x2="244.88" y2="59.81" fill="none" stroke="#6E1A12" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="239.14" y1="52.9" x2="250.62" y2="52.9" fill="none" stroke="#6E1A12" stroke-width="0.8" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="276.86" cy="59.81" r="16.59" fill="#FF3B2F" fill-opacity="0.12"/>
<path d="M271.51 73.19L270.41 63.52L265.64 58.76L265.48 58.27L265.5 57.72L265.69 57.22L265.84 57.01L266.23 56.68L266.73 56.47L267 56.44L267.53 56.51L267.77 56.6L270.9 59.47L270.97 59.39L271 49.9L271.18 49.38L271.56 48.93L272.05 48.66L272.32 48.59L272.83 48.59L273.35 48.77L273.8 49.13L273.97 49.37L274.16 49.89L274.18 59.16L274.19 47.92L274.32 47.4L274.63 46.92L275.1 46.59L275.36 46.49L275.88 46.44L276.4 46.56L276.88 46.86L277.23 47.33L277.38 47.85L277.39 59.21L277.4 48.97L277.53 48.45L277.67 48.2L277.86 47.97L278.33 47.64L278.86 47.5L279.37 47.54L279.88 47.76L280.11 47.95L280.3 48.17L280.55 48.67L280.6 49.19L280.6 59.17L280.6 51.88L280.66 51.37L280.75 51.1L281.09 50.63L281.31 50.45L281.82 50.22L282.34 50.18L282.86 50.31L283.34 50.64L283.53 50.86L283.76 51.37L283.82 51.88L283.8 59.37L283.28 63.58L281.68 73.19" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="220.28" y="13.19" text-anchor="start" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">TEST REALITY</text>
<line x1="220.28" y1="17" x2="220.28" y2="37.95" fill="none" stroke="#FF3B2F" stroke-opacity="0.6" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
</div><p class="use">Falešná probuzení · karta 0: Probuzení, které není</p></article>
<article class="card"><div class="cap"><span class="m acc">06 · rewriteScript</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176" style="background:#000000" font-family="'JetBrains Mono', ui-monospace, monospace">
<path d="M2 6L141.99 6L154 18.02L153.99 136L2 135.99L2 6Z" fill="#FF3B2F" fill-opacity="0.03"/>
<path d="M2 6L141.99 6L154 18.02L153.99 136L2 135.99L2 6Z" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M142 6L142 18L154 18" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="24" x2="71.6" y2="24" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="33" x2="116.4" y2="33" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="14" y1="42" x2="90.8" y2="42" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M204 6L343.99 6L356 18.02L355.99 136L204 135.99L204 6Z" fill="#FF3B2F" fill-opacity="0.03"/>
<path d="M204 6L343.99 6L356 18.02L355.99 136L204 135.99L204 6Z" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M344 6L344 18L356 18" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="24" x2="273.6" y2="24" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="33" x2="318.4" y2="33" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="216" y1="42" x2="292.8" y2="42" fill="none" stroke="#3A0C08" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M14 94L18.93 91.58L21.66 90.33L24.19 89.26L26.77 88.31L29.16 87.57L31.83 86.91L34.53 86.45L37.02 86.21L39.52 86.16L42.26 86.31L44.74 86.62L47.2 87.07L49.87 87.72L54.9 89.23L62.47 91.79L65.33 92.69L67.73 93.37L70.17 93.94L72.87 94.44L75.35 94.73L77.85 94.86L80.59 94.79L83.32 94.5L85.78 94.06L88.21 93.45L97.21 48.12L103.6 108" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="miter"/>
<line x1="99.6" y1="108" x2="107.6" y2="108" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M216 94L220.94 91.58L223.66 90.32L226.2 89.26L228.78 88.31L231.16 87.57L233.83 86.91L236.54 86.45L239.03 86.21L241.53 86.16L244.28 86.31L246.76 86.62L249.21 87.08L251.64 87.66L254.29 88.4L256.91 89.23L264.49 91.8L267.35 92.7L269.76 93.37L272.19 93.95L274.89 94.45L277.38 94.74L279.87 94.86L282.62 94.79L285.36 94.49L287.57 94.1L290.24 93.44" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.24 93.44L290.63 91.48" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M291.21 88.54L291.59 86.58" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M292.17 83.63L292.56 81.67" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M293.14 78.73L293.53 76.76" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M294.11 73.82L294.5 71.86" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M295.08 68.92L295.46 66.95" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M296.04 64.01L296.43 62.05" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.01 59.1L297.4 57.14" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M297.98 54.2L298.36 52.24" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M298.94 49.29L299.2 48.01L299.27 48.68" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M299.59 51.66L299.8 53.65" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.12 56.63L300.33 58.62" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M300.65 61.6L300.86 63.59" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M301.18 66.58L301.39 68.56" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M301.71 71.55L301.92 73.54" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M302.24 76.52L302.45 78.51" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M302.77 81.49L302.98 83.48" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M303.3 86.46L303.51 88.45" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M303.83 91.44L304.05 93.42" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.36 96.41L304.58 98.4" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M304.89 101.38L305.11 103.37" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M305.42 106.35L305.6 108" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M290.24 93.44L292.11 88.47L293.07 86.24L294.13 83.96L295.13 82.03L296.16 80.22L297.33 78.4L298.39 76.92L299.44 75.64L300.67 74.34L301.74 73.4L302.87 72.56L304.02 71.89L305.39 71.3L306.54 70.99L307.76 70.83L308.76 70.83L309.75 70.95L310.74 71.18L311.67 71.49L312.54 71.87L313.63 72.46L314.49 73.03L315.54 73.82L317.46 75.6L319.52 77.97L321.48 80.68L323.52 84L324.81 85.24L325.97 86.2L327.38 87.19L328.66 87.94L330.46 88.79L332.12 89.39L333.78 89.83L335.73 90.18L337.77 90.37L339.7 90.39L341.94 90.26L344 90" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="344" cy="90" r="2.6" fill="#FF3B2F"/>
<path d="M0 0L9.9 -3.47L10.15 -3.5L45.88 -3.5L46 -3.37L46 3.37L45.88 3.5L10.15 3.5L9.9 3.47L0 0Z" fill="#FF3B2F" fill-opacity="0.12" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<path d="M0 0L9.9 -3.47L10.15 -3.5L45.88 -3.5L46 -3.37L46 3.37L45.88 3.5L10.15 3.5L9.9 3.47L0 0Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="10" y1="-3.5" x2="10" y2="3.5" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="3.2" y1="-1.1" x2="3.2" y2="1.1" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<rect x="46" y="-3.5" width="9" height="7" rx="2.5" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<line x1="50" y1="-3.5" x2="50" y2="3.5" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round" transform="matrix(0.54 -0.84 0.84 0.54 164 97)"/>
<text x="78" y="153.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#B3261E">NOČNÍ MŮRA</text>
<text x="280" y="153.19" text-anchor="middle" font-size="9.5" font-weight="500" letter-spacing="0.57" fill="#FF3B2F">NOVÝ KONEC</text>
<text x="280" y="169.17" text-anchor="middle" font-size="8.5" font-weight="500" letter-spacing="0.51" fill="#6E1A12">PŘEHRÁVAT DENNĚ</text>
</svg>
</div><p class="use">Noční můry a přepis snu (IRT) · karta 0: Přepiš konec filmu</p></article>
<article class="card"><div class="cap"><span class="m acc">07 · seedMoon</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- seedMoon, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<path d="M120.66 42L122.35 40.8M125.74 38.5L127.43 37.41M130.81 35.33L132.51 34.34M135.94 32.44L137.76 31.49M141.41 29.72L143.24 28.89M146.88 27.36L148.71 26.66M152.5 25.33L154.43 24.72M158.3 23.64L160.23 23.17M164.09 22.37L166.07 22.03M170.05 21.49L172.05 21.3M176.03 21.05L178.02 21.01M182.01 21.06L184 21.15M187.98 21.5L189.97 21.74M193.95 22.38L195.88 22.76M199.74 23.65L201.67 24.17M205.53 25.34L207.46 26M211.15 27.38L212.97 28.12M216.62 29.73L218.44 30.6M222.09 32.46L223.83 33.4M227.22 35.34L228.91 36.37M232.29 38.52L233.99 39.65" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="237.34" y1="42" x2="231.36" y2="41.51" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="237.34" y1="42" x2="234.97" y2="36.49" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M107.88 52.56L106.68 53.45L105.82 53.96L104.91 54.4L103.96 54.76L102.99 55.04L101.5 55.31L100.51 55.39L99.06 55.36L97.59 55.15L96.59 54.9L95.6 54.56L94.26 53.93L92.98 53.13L92.17 52.51L91.42 51.82L90.73 51.07L90.11 50.26L89.56 49.42L88.88 48.09L88.51 47.14L88.22 46.14L87.95 44.66L87.86 43.22L87.9 42.24L88.11 40.75L88.35 39.77L88.68 38.8L89.09 37.86L89.58 36.96L90.44 35.7L91.09 34.93L92.16 33.91L92.18 33.8L90.82 34.39L89.94 34.87L88.29 36.05L87.2 37.08L86.54 37.84L85.4 39.51L84.93 40.4L84.36 41.78L84.07 42.76L83.78 44.25L83.66 45.72L83.71 47.16L83.93 48.64L84.18 49.63L84.51 50.62L85.12 51.99L85.89 53.28L86.49 54.1L87.51 55.23L88.26 55.92L89.06 56.55L90.34 57.36L91.67 58.01L92.65 58.36L93.64 58.64L95.12 58.91L96.09 58.99L97.54 58.97L99.02 58.78L100 58.56L101.46 58.08L102.4 57.66L103.31 57.17L104.59 56.3L105.38 55.65L106.44 54.56L107.07 53.79L107.88 52.56Z" fill="#FF3B2F" fill-opacity="0.12"/>
<path d="M107.88 52.56L106.68 53.45L105.82 53.96L104.91 54.4L103.96 54.76L102.99 55.04L101.5 55.31L100.51 55.39L99.06 55.36L97.59 55.15L96.59 54.9L95.6 54.56L94.26 53.93L92.98 53.13L92.17 52.51L91.42 51.82L90.73 51.07L90.11 50.26L89.56 49.42L88.88 48.09L88.51 47.14L88.22 46.14L87.95 44.66L87.86 43.22L87.9 42.24L88.11 40.75L88.35 39.77L88.68 38.8L89.09 37.86L89.58 36.96L90.44 35.7L91.09 34.93L92.16 33.91L92.18 33.8L90.82 34.39L89.94 34.87L88.29 36.05L87.2 37.08L86.54 37.84L85.4 39.51L84.93 40.4L84.36 41.78L84.07 42.76L83.78 44.25L83.66 45.72L83.71 47.16L83.93 48.64L84.18 49.63L84.51 50.62L85.12 51.99L85.89 53.28L86.49 54.1L87.51 55.23L88.26 55.92L89.06 56.55L90.34 57.36L91.67 58.01L92.65 58.36L93.64 58.64L95.12 58.91L96.09 58.99L97.54 58.97L99.02 58.78L100 58.56L101.46 58.08L102.4 57.66L103.31 57.17L104.59 56.3L105.38 55.65L106.44 54.56L107.07 53.79L107.88 52.56Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="69.66" cy="39" r="0.9" fill="#6E1A12"/>
<circle cx="79.66" cy="64" r="0.9" fill="#6E1A12"/>
<circle cx="120.66" cy="62" r="0.9" fill="#6E1A12"/>
<path d="M96.66 68L96.66 70M96.66 74L96.66 76M96.66 80L96.66 82M96.66 86L96.66 88M96.66 92L96.66 94M96.66 98L96.66 100M96.66 104L96.66 106M96.66 110L96.66 112M96.66 116L96.66 118" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="96.66" y1="121" x2="94.6" y2="117.57" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="96.66" y1="121" x2="98.72" y2="117.57" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="261.34" cy="46" r="5.5" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="269.84" y1="46" x2="272.84" y2="46" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="267.35" y1="52.01" x2="269.47" y2="54.13" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="261.34" y1="54.5" x2="261.34" y2="57.5" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="255.33" y1="52.01" x2="253.21" y2="54.13" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="252.84" y1="46" x2="249.84" y2="46" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="255.33" y1="39.99" x2="253.21" y2="37.87" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="261.34" y1="37.5" x2="261.34" y2="34.5" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="267.35" y1="39.99" x2="269.47" y2="37.87" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="12" y1="126" x2="346" y2="126" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="16" cy="132" r="0.8" fill="#6E1A12"/>
<circle cx="53" cy="137" r="0.8" fill="#6E1A12"/>
<circle cx="127" cy="147" r="0.8" fill="#6E1A12"/>
<circle cx="164" cy="135" r="0.8" fill="#6E1A12"/>
<circle cx="201" cy="140" r="0.8" fill="#6E1A12"/>
<circle cx="238" cy="145" r="0.8" fill="#6E1A12"/>
<circle cx="275" cy="133" r="0.8" fill="#6E1A12"/>
<circle cx="312" cy="138" r="0.8" fill="#6E1A12"/>
<circle cx="23" cy="143" r="0.8" fill="#6E1A12"/>
<circle cx="60" cy="148" r="0.8" fill="#6E1A12"/>
<circle cx="134" cy="141" r="0.8" fill="#6E1A12"/>
<circle cx="171" cy="146" r="0.8" fill="#6E1A12"/>
<circle cx="208" cy="134" r="0.8" fill="#6E1A12"/>
<circle cx="245" cy="139" r="0.8" fill="#6E1A12"/>
<circle cx="282" cy="144" r="0.8" fill="#6E1A12"/>
<circle cx="319" cy="132" r="0.8" fill="#6E1A12"/>
<circle cx="30" cy="137" r="0.8" fill="#6E1A12"/>
<circle cx="67" cy="142" r="0.8" fill="#6E1A12"/>
<circle cx="141" cy="135" r="0.8" fill="#6E1A12"/>
<circle cx="178" cy="140" r="0.8" fill="#6E1A12"/>
<circle cx="215" cy="145" r="0.8" fill="#6E1A12"/>
<path d="M101.66 137.8L100.9 139.17L100.05 140.32L98.96 141.34L97.72 142.1L96.34 142.56L95.34 142.69L94.37 142.7L92.93 142.52L91.92 142.28L91.78 141.96L92.55 140.62L93.42 139.52L94.55 138.51L95.82 137.8L97.23 137.4L98.72 137.29L100.14 137.43L101.66 137.8Z" fill="#B3261E" fill-opacity="0.15"/>
<path d="M101.66 137.8L100.9 139.17L100.05 140.32L98.96 141.34L97.72 142.1L96.34 142.56L95.34 142.69L94.37 142.7L92.93 142.52L91.92 142.28L91.78 141.96L92.55 140.62L93.42 139.52L94.55 138.51L95.82 137.8L97.23 137.4L98.72 137.29L100.14 137.43L101.66 137.8Z" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M266.34 137.8L265.58 139.17L264.73 140.32L263.64 141.34L262.4 142.1L261.02 142.56L260.02 142.69L259.05 142.7L258.1 142.61L256.6 142.28L256.46 141.96L257.23 140.62L258.1 139.52L259.23 138.51L260.5 137.8L261.91 137.4L263.4 137.29L264.82 137.43L266.34 137.8Z" fill="#B3261E" fill-opacity="0.15"/>
<path d="M266.34 137.8L265.58 139.17L264.73 140.32L263.64 141.34L262.4 142.1L261.02 142.56L260.02 142.69L259.05 142.7L258.1 142.61L256.6 142.28L256.46 141.96L257.23 140.62L258.1 139.52L259.23 138.51L260.5 137.8L261.91 137.4L263.4 137.29L264.82 137.43L266.34 137.8ZM261.34 137L261.34 102.06L261.42 99.44L261.74 96.48L262.34 93.59L263.12 91.18L263.69 89.82L264.34 88.53" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M264.34 88.53L266.52 87.31L267.33 86.73L268.46 85.74L269.16 85.02L270.08 83.84L270.61 83L271.29 81.66L271.8 80.25L272.15 78.79L272.28 77.8L272.34 76.31L272.23 74.81L271.94 73.34L271.3 71.45L270.64 70.11L269.83 68.85L268.88 67.68L267.81 66.63L266.2 65.46L265.33 64.95L263.97 64.34L262.06 63.74L260.58 63.51L259.08 63.45L257.1 63.63L255.63 63.96L254.23 64.48L252.47 65.43L251.26 66.32L250.53 66.99L249.22 68.5L248.43 69.77L248 70.68L247.8 71.14L247.37 72.57L247.19 73.55L247.08 75.05L247.18 76.54L247.5 78.01L247.82 78.95L248.49 77.7L249.02 76.86L249.64 76.08L250.34 75.36L251.1 74.71L251.92 74.14L252.79 73.65L254.18 73.08L255.14 72.81L256.62 72.57L258.11 72.52L259.11 72.59L260.1 72.72L261.56 73.08L262.49 73.43L263.39 73.87L264.24 74.4L265.02 75.02L265.73 75.72L266.35 76.5L266.88 77.35L267.3 78.26L267.61 79.21L267.87 80.68L267.87 82.18L267.74 83.17L267.49 84.14L267.14 85.07L266.68 85.96L266.12 86.79L265.12 87.9L264.34 88.53Z" fill="#FF3B2F" fill-opacity="0.18"/>
<path d="M264.34 88.53L266.52 87.31L267.33 86.73L268.46 85.74L269.16 85.02L270.08 83.84L270.61 83L271.29 81.66L271.8 80.25L272.15 78.79L272.28 77.8L272.34 76.31L272.23 74.81L271.94 73.34L271.3 71.45L270.64 70.11L269.83 68.85L268.88 67.68L267.81 66.63L266.2 65.46L265.33 64.95L263.97 64.34L262.06 63.74L260.58 63.51L259.08 63.45L257.1 63.63L255.63 63.96L254.23 64.48L252.47 65.43L251.26 66.32L250.53 66.99L249.22 68.5L248.43 69.77L248 70.68L247.8 71.14L247.37 72.57L247.19 73.55L247.08 75.05L247.18 76.54L247.5 78.01L247.82 78.95L248.49 77.7L249.02 76.86L249.64 76.08L250.34 75.36L251.1 74.71L251.92 74.14L252.79 73.65L254.18 73.08L255.14 72.81L256.62 72.57L258.11 72.52L259.11 72.59L260.1 72.72L261.56 73.08L262.49 73.43L263.39 73.87L264.24 74.4L265.02 75.02L265.73 75.72L266.35 76.5L266.88 77.35L267.3 78.26L267.61 79.21L267.87 80.68L267.87 82.18L267.74 83.17L267.49 84.14L267.14 85.07L266.68 85.96L266.12 86.79L265.12 87.9L264.34 88.53Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="96.66" y="15.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">VEČER</text>
<text x="261.34" y="15.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">RÁNO</text>
<text x="96.66" y="167.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">TÉMA</text>
<text x="261.34" y="167.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">CO VYKLÍČILO</text>
</svg>
</div><p class="use">Inkubace snu: zadej si téma · karta 0: Semínko na noc</p></article>
<article class="card"><div class="cap"><span class="m acc">08 · cueWave</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- cueWave, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<rect x="265.16" y="86" width="23.52" height="59" fill="#FF3B2F" fill-opacity="0.1"/>
<path d="M30 94L35.5 94L35.88 94.12L35.88 123.62L36 124L50.5 124L50.58 124.42L50.58 138.92L51 139L83.5 139L83.65 138.65L83.65 124.15L84 124L92.47 123.97L92.5 109L99.5 109L99.81 109.19L99.81 123.69L100 124L118 124L118.19 124.31L118.19 138.81L118.5 139L143.5 139L143.91 138.91L143.91 124.41L144 124L154.5 124L154.93 123.93L154.93 109.43L155 109L168 109L168.16 109.34L168.16 123.84L168.5 124L190 124L190.2 124.3L190.2 138.8L190.5 139L201 139L201.23 138.73L201.23 124.23L201.5 124L212 124L212.25 123.75L212.25 109.25L212.5 109L231 109L231.36 109.14L231.36 123.64L231.5 124L253 124L253.4 123.9L253.4 94.4L253.5 94L256 94L256.34 94.16L256.34 123.66L256.5 124L265 124L265.16 123.66L265.16 109.16L265.5 109L288.5 109L288.68 109.32L288.68 123.82L289 124L309 124L309.26 123.76L309.26 109.26L309.5 109L337 109L337.18 108.68L337.18 94.18L337.5 94L346 94" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="109" x2="99.81" y2="109" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="109" x2="168.16" y2="109" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="212.25" y1="109" x2="231.36" y2="109" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="109" x2="288.68" y2="109" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="309.26" y1="109" x2="337.18" y2="109" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.92 68L276.92 70M276.92 74L276.92 76M276.92 80L276.92 82" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M309.4 36.95L309.79 38.91M309.56 42.88L309.33 43.86L309 44.8M307.24 48.38L306.12 50.03M303.52 53.06L302.08 54.46M298.98 56.98L297.35 58.14M293.95 60.24L292.19 61.19M288.58 62.91L286.73 63.66M282.96 65.01L281.04 65.57M277.16 66.54L275.2 66.91M271.24 67.47L269.25 67.63M265.25 67.73L263.25 67.65M259.28 67.18L257.32 66.79M253.5 65.63L251.67 64.81M248.32 62.65L246.88 61.26M244.77 57.88L244.48 57.14L244.2 55.98M244.09 52L244.54 50.05M246.13 46.39L247.19 44.69M249.7 41.59L251.11 40.17M254.14 37.56L255.74 36.36M259.11 34.21L260.85 33.22M264.44 31.46L266.27 30.66M270.03 29.28L271.93 28.67M275.8 27.66L277.76 27.25M281.71 26.64L283.7 26.44M287.69 26.27L289.69 26.32M293.67 26.67L295.64 27.01M299.49 28.08L301.35 28.82M304.8 30.82L305.6 31.42L306.33 32.11M308.72 35.29L309.4 36.95" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="254.26" cy="65.91" r="2" fill="#FF3B2F"/>
<path d="M261.92 48L265.4 48L270.78 43.61L270.92 43.82L270.92 58.22L270.75 58.36L265.36 54L261.92 53.96L261.92 48Z" fill="#FF3B2F" fill-opacity="0.1"/>
<path d="M261.92 48L265.4 48L270.78 43.61L270.92 43.82L270.92 58.22L270.75 58.36L265.36 54L261.92 53.96L261.92 48Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M274.32 43.54L275.61 44.19L276.83 45.1L277.87 46.27L278.44 47.16L278.89 48.13L279.3 49.64L279.42 51.15L279.26 52.59" fill="none" stroke="#FF3B2F" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M276.49 37.95L277.82 38.55L278.69 39.04L279.96 39.91L280.75 40.56L281.81 41.61L282.45 42.38L283.58 44.07L284.05 44.97L284.63 46.37L284.93 47.33L285.25 48.79L285.37 49.81L285.42 51.34L285.36 52.34L285.14 53.78" fill="none" stroke="#FF3B2F" stroke-opacity="0.72" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M278.67 32.36L280.43 33.15L281.74 33.86L283.42 35L284.62 35.97L286.03 37.35L287.02 38.48L288.2 40.11L288.97 41.41L289.65 42.77L290.38 44.64L290.81 46.08L291.2 48.02L291.37 49.55L291.41 51.58L291.31 53.06L291.02 54.97" fill="none" stroke="#FF3B2F" stroke-opacity="0.44" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">PRINCIP, NE MĚŘENÍ</text>
<text x="234.92" y="50.19" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">ZVUKOVÝ PODNĚT</text>
<text x="0" y="112.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">REM</text>
<text x="30" y="169.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">USNUTÍ</text>
<text x="346" y="169.19" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">RÁNO</text>
</svg>
</div><p class="use">Inkubace snu: zadej si téma · karta 3: Hádanky v REM<br>Zvukové podněty a rozhovor se snícím · karta 0: Co je TLR</p></article>
<article class="card"><div class="cap"><span class="m acc">09 · timeline</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- timeline, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<path d="M4 111.64L5.87 110.94M9.62 109.53L11.49 108.84M15.26 107.48L17.14 106.82M20.92 105.51L22.81 104.86M26.61 103.6L28.51 102.98M32.32 101.76L34.23 101.16M38.05 99.99L39.97 99.42M43.81 98.29L45.73 97.75M49.58 96.67L51.51 96.14M55.38 95.11L57.32 94.61M61.19 93.63L63.13 93.15M67.02 92.22L68.97 91.76M72.87 90.88L74.83 90.45M78.74 89.61L80.69 89.2M84.62 88.41L86.58 88.03M90.51 87.29L92.48 86.93M96.42 86.24L98.39 85.91M102.34 85.26L104.31 84.95M108.27 84.35L110.25 84.07M114.21 83.52L116.19 83.26M120.16 82.76L122.15 82.53M126.12 82.08L128.11 81.86M132.09 81.46L134.08 81.28M138.07 80.92L140.06 80.76M144.05 80.45L146.04 80.32M150.03 80.06L152.03 79.95M156.03 79.74L158.02 79.65M162.02 79.5L164.02 79.43M168.02 79.32L170.02 79.29M174.02 79.23L176.02 79.21M180.02 79.2L182.02 79.21M186.02 79.25L188.02 79.28M192.02 79.37L194.02 79.44M198.01 79.57L200.01 79.65M204.01 79.84L206 79.95M210 80.19L211.99 80.32M215.98 80.6L217.98 80.76M221.96 81.1L223.95 81.27M227.94 81.66L229.92 81.87M233.9 82.3L235.89 82.53M239.86 83.01L241.84 83.27M245.81 83.8L247.79 84.07M251.75 84.65L253.72 84.96M257.67 85.58L259.65 85.91M263.59 86.59L265.56 86.94M269.49 87.66L271.46 88.04M275.38 88.81L277.34 89.21M281.25 90.03L283.21 90.45M287.11 91.32L289.06 91.77M292.96 92.69L294.9 93.16M298.78 94.13L300.72 94.62M304.59 95.63L306.52 96.15M310.38 97.21L312.3 97.75M316.15 98.86L318.06 99.43M321.89 100.59L323.81 101.17M327.62 102.37L329.52 102.99M333.32 104.24L335.22 104.87M339 106.17L340.89 106.83M344.66 108.17L346.54 108.85M350.29 110.24L352.16 110.94M79.67 89.41L87.51 87.85L95.87 86.33L103.76 85.03L111.18 83.94L116.14 83.27L124.08 82.3L131.53 81.51L140 80.76L147.48 80.22L155.46 79.77L163.45 79.45L171.95 79.25L179.95 79.2L187.95 79.28L195.94 79.5L203.93 79.84L211.92 80.31L219.89 80.92L227.86 81.65L235.81 82.52L243.74 83.51L251.66 84.64L259.56 85.89L267.44 87.28L275.78 88.89L283.61 90.54L291.89 92.43L299.66 94.35L307.87 96.52L315.57 98.69L328 102.49" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="50.33" y1="100.25" x2="54.33" y2="90.25" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="55.33" y1="100.25" x2="59.33" y2="90.25" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="30" cy="102.49" r="2.6" fill="#B3261E"/>
<text x="24" y="120.68" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">ANTIKA</text>
<text x="24" y="132.66" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">ARISTOTELÉS</text>
<circle cx="79.67" cy="89.41" r="2.6" fill="#B3261E"/>
<text x="79.67" y="77.6" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">1867</text>
<text x="79.67" y="65.58" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">SAINT-DENYS</text>
<circle cx="129.33" cy="81.73" r="2.6" fill="#B3261E"/>
<text x="129.33" y="99.92" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">1913</text>
<text x="129.33" y="111.9" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">VAN EEDEN</text>
<circle cx="179" cy="79.2" r="2.6" fill="#B3261E"/>
<text x="179" y="67.39" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">1968</text>
<text x="179" y="55.37" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">GREEN</text>
<circle cx="228.67" cy="81.73" r="8" fill="#FF3B2F" fill-opacity="0.18"/>
<circle cx="228.67" cy="81.73" r="3.5" fill="#FF3B2F"/>
<path d="M221.67 96.73L222.49 96.02L223.71 95.11L224.53 94.62L225.39 94.2L226.36 93.84L227.33 93.6L228.79 93.48L230.25 93.65L231.22 93.91L232.19 94.3L233.82 95.25L235.46 96.55L235.46 96.92L235.05 97.28L233.82 98.22L232.6 98.96L231.7 99.37L230.73 99.7L229.76 99.9L228.79 99.98L227.33 99.86L226.36 99.63L225.39 99.27L224.53 98.85L223.71 98.36L222.49 97.45L221.67 96.73Z" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="228.67" cy="96.73" r="1.9" fill="#FF3B2F"/>
<text x="228.67" y="113.92" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">1975</text>
<text x="228.67" y="125.9" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">HEARNE</text>
<circle cx="278.33" cy="89.41" r="2.6" fill="#B3261E"/>
<text x="278.33" y="77.6" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">1981</text>
<text x="278.33" y="65.58" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">LABERGE</text>
<circle cx="328" cy="102.49" r="2.6" fill="#B3261E"/>
<text x="334" y="120.68" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">2021</text>
<text x="334" y="132.66" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">KONKOLY</text>
</svg>
</div><p class="use">Jak věda uvěřila lucidním snům · karta 0: Staré svědectví</p></article>
<article class="card"><div class="cap"><span class="m acc">10 · eyeSignal</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- eyeSignal, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<rect x="104.02" y="124" width="179.3" height="24" fill="#FF3B2F" fill-opacity="0.1"/>
<path d="M16 136L48.5 136L48.6 136.4L48.6 143.9L49 144L81 144L81.2 143.7L81.2 136.2L81.5 136L104 136L104.02 128.02L283 128L283.32 128.18L283.32 135.68L283.5 136L309 136L309.4 136.1L309.4 143.6L309.5 144L342 144" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="104.02" y1="128" x2="283.32" y2="128" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M104.02 122L104.02 120M104.02 116L104.02 114M104.02 110L104.02 108M104.02 104L104.02 102M104.02 98L104.02 96M104.02 92L104.02 90M104.02 86L104.02 84M104.02 80L104.02 78M104.02 74L104.02 72M104.02 68L104.02 66M104.02 62L104.02 60M104.02 56L104.02 54M104.02 50L104.02 48M283.32 122L283.32 120M283.32 116L283.32 114M283.32 110L283.32 108M283.32 104L283.32 102M283.32 98L283.32 96M283.32 92L283.32 90M283.32 86L283.32 84M283.32 80L283.32 78M283.32 74L283.32 72M283.32 68L283.32 66M283.32 62L283.32 60M283.32 56L283.32 54M283.32 50L283.32 48" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M16 72L17.86 72.72L19.84 73L22.33 72.85L23.83 72.94L25.77 73.38L26.27 73.43L27.77 73.4L28.23 73.25L29.95 72.23L31.93 70.71L33.83 70.1L34.31 70.13L35.77 70.5L38.16 71.22L42.14 71.57L44.04 72.18L45.92 72.87L47.91 73.07L49.9 72.9L50.4 72.92L51.89 73.03L53.86 73.4L55.83 73.15L56.28 72.93L59.96 70.36L61.93 70.04L65.72 71.3L66.21 71.4L69.7 71.64L70.19 71.72L73.98 73L75.97 73.13L77.96 72.95L79.96 73.09L81.94 73.33L83.87 72.83L85.91 71.39L88.03 70.08L89.53 70.09L90.03 70.1L91.86 70.9L93.77 71.5L94.26 71.57L95.76 71.6L97.75 71.76L98.24 71.87L102.03 73.13L104.03 73.18L106.02 73L110.02 73.18L111.88 72.46L113.9 70.99L115.68 70.08L116.14 69.94L118.1 70.28L119.9 71.16L121.82 71.68L123.82 71.7L125.81 71.88L128.17 72.68L130.09 73.24L132.09 73.23L134.08 73.02L136.07 73.07L138.07 72.95L139.88 72.1M247.2 72.53L249.14 72.09L253.14 70.06L255.13 70.01L259.12 72.05L261.1 72.2L263.08 71.97L263.57 72.02L265.04 72.27L267.34 73.23L269.28 73.67L271.24 73.32L273.14 72.73L275.1 72.32L277.02 71.81L279.27 70.74L281.11 69.98L283.08 70.2L285.25 71.41L287.08 72.22L287.56 72.26L289.06 72.23L291.04 72.01L291.53 72.07L292.98 72.42L295.27 73.4L297.23 73.72L299.16 73.22L301.04 72.56L304.9 71.55L307.18 70.55L309.09 69.98L309.57 70.04L311.02 70.42L311.46 70.63L313.17 71.67L315.04 72.35L315.53 72.38L319 72.07L319.49 72.14L320.92 72.58L323.2 73.57L325.19 73.73L329.4 72.21L331.34 71.73L333.25 71.17L335.1 70.41L337.05 70.05L337.53 70.14L338.93 70.66L339.38 70.87L341.09 71.9L342 72.3" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M139.88 72.1L142.36 46.25L142.62 46.03L164.44 48.6L168.45 97.86L168.82 97.96L190.14 95.45L190.55 95.3L194.54 46.02L216.34 48.57L216.64 48.82L220.59 97.6L220.71 97.99L242.53 95.42L242.76 95.07L247.2 72.53" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="13.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">POHYB OČÍ</text>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">PRINCIP, NE MĚŘENÍ</text>
<text x="152.92" y="39.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">L</text>
<text x="179" y="111.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">R</text>
<text x="205.08" y="39.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">L</text>
<text x="231.16" y="111.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">R</text>
<text x="16" y="165.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">FÁZE SPÁNKU</text>
<text x="193.67" y="165.19" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">REM</text>
</svg>
</div><p class="use">Jak věda uvěřila lucidním snům · karta 2: Hull, 12. dubna 1975<br>Zvukové podněty a rozhovor se snícím · karta 3: Rozhovor ze snu</p></article>
<article class="card"><div class="cap"><span class="m acc">11 · chronoDial</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- chronoDial, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<circle cx="128" cy="88" r="56" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="32" x2="128" y2="38" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="142.49" y1="33.91" x2="141.72" y2="36.81" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156" y1="39.5" x2="154.5" y2="42.1" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="167.6" y1="48.4" x2="165.48" y2="50.52" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="176.5" y1="60" x2="173.9" y2="61.5" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="182.09" y1="73.51" x2="179.19" y2="74.28" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="184" y1="88" x2="178" y2="88" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="182.09" y1="102.49" x2="179.19" y2="101.72" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="176.5" y1="116" x2="173.9" y2="114.5" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="167.6" y1="127.6" x2="165.48" y2="125.48" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="156" y1="136.5" x2="154.5" y2="133.9" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="142.49" y1="142.09" x2="141.72" y2="139.19" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="144" x2="128" y2="138" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="113.51" y1="142.09" x2="114.28" y2="139.19" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100" y1="136.5" x2="101.5" y2="133.9" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="88.4" y1="127.6" x2="90.52" y2="125.48" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="79.5" y1="116" x2="82.1" y2="114.5" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="73.91" y1="102.49" x2="76.81" y2="101.72" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="72" y1="88" x2="78" y2="88" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="73.91" y1="73.51" x2="76.81" y2="74.28" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="79.5" y1="60" x2="82.1" y2="61.5" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="88.4" y1="48.4" x2="90.52" y2="50.52" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="100" y1="39.5" x2="101.5" y2="42.1" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="113.51" y1="33.91" x2="114.28" y2="36.81" fill="none" stroke="#6E1A12" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="128" y="49.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">0</text>
<text x="170" y="91.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">6</text>
<text x="128" y="133.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">12</text>
<text x="86" y="91.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">18</text>
<path d="M133.7 67.6L132.86 68.16L131.92 68.56L130.93 68.81L130.42 68.87L129.46 68.86L128.49 68.69L128 68.54L127.05 68.11L126.17 67.5L125.41 66.74L124.79 65.86L124.36 64.91L124.09 63.94L124.01 62.51L124.16 61.52L124.29 61.03L124.69 60.09L125.24 59.23L126.11 58.26L124.76 58.84L123.92 59.42L123.16 60.14L122.82 60.55L122.26 61.43L121.85 62.38L121.53 63.85L121.55 65.28L121.74 66.24L122.1 67.21L122.34 67.68L122.94 68.56L123.69 69.34L124.11 69.68L125.01 70.25L125.97 70.65L127.42 70.95L128.86 70.92L129.84 70.71L130.8 70.35L131.26 70.1L132.11 69.52L132.85 68.81L133.7 67.6Z" fill="#FF3B2F" fill-opacity="0.12"/>
<path d="M133.7 67.6L132.86 68.16L131.92 68.56L130.93 68.81L130.42 68.87L129.46 68.86L128.49 68.69L128 68.54L127.05 68.11L126.17 67.5L125.41 66.74L124.79 65.86L124.36 64.91L124.09 63.94L124.01 62.51L124.16 61.52L124.29 61.03L124.69 60.09L125.24 59.23L126.11 58.26L124.76 58.84L123.92 59.42L123.16 60.14L122.82 60.55L122.26 61.43L121.85 62.38L121.53 63.85L121.55 65.28L121.74 66.24L122.1 67.21L122.34 67.68L122.94 68.56L123.69 69.34L124.11 69.68L125.01 70.25L125.97 70.65L127.42 70.95L128.86 70.92L129.84 70.71L130.8 70.35L131.26 70.1L132.11 69.52L132.85 68.81L133.7 67.6Z" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="128" cy="111.52" r="3.5" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="133.5" y1="111.52" x2="135.5" y2="111.52" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.89" y1="115.41" x2="133.3" y2="116.82" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="117.02" x2="128" y2="119.02" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.11" y1="115.41" x2="122.7" y2="116.82" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="122.5" y1="111.52" x2="120.5" y2="111.52" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="124.11" y1="107.63" x2="122.7" y2="106.22" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="128" y1="106.02" x2="128" y2="104.02" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="131.89" y1="107.63" x2="133.3" y2="106.22" fill="none" stroke="#B3261E" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M111.18 25.21L115.47 24.22L119.44 23.57L123.48 23.16L127.92 23L132.45 23.15L136.47 23.55L140.88 24.29L144.79 25.21L148.66 26.37L152.87 27.94L156.97 29.81L160.51 31.71L163.93 33.83L167.6 36.45L171.06 39.31L174 42.08L176.75 45.01L179.59 48.46L181.95 51.74L184.34 55.59L186.42 59.51L188.09 63.22L189.51 66.98L190.79 71.2L191.8 75.57L192.45 79.53L192.88 84.01L193 88.01L192.88 92.01L192.44 96.49L191.8 100.45L190.79 104.82" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M188.05 63.13L189.61 67.27L190.75 71.06L191.76 75.38L192.41 79.27L192.82 83.2L193 87.63L192.87 92.08L192.44 96.48" fill="none" stroke="#FF3B2F" stroke-opacity="0.2" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M188.05 63.13L189.61 67.27L190.75 71.06L191.76 75.38L192.41 79.27L192.82 83.2L193 87.63L192.87 92.08L192.44 96.48" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="111.18" cy="25.21" r="2" fill="#FF3B2F"/>
<path d="M146.89 17.49L149.23 18.16L151.57 18.91L153.92 19.76L156.26 20.69L160.4 22.58L162.58 23.71L164.74 24.92L166.88 26.22L169 27.6L172.67 30.26L174.6 31.81L176.48 33.43L179.76 36.53L182.86 39.84L184.47 41.73L186.01 43.69L187.5 45.7L188.91 47.77L191.28 51.61L193.41 55.58L194.48 57.85L195.47 60.14L196.39 62.46L197.22 64.8L198.52 69.15L199.55 73.54L200 75.98L200.37 78.43L200.82 82.94L200.96 85.46L201 87.96L200.96 90.44L200.84 92.89L200.39 97.43L200.02 99.92L199.57 102.37L199.05 104.77L198.45 107.13L197.76 109.51L196.98 111.88L195.38 116.1L194.38 118.38L193.3 120.63L191.17 124.59L188.78 128.43L187.35 130.5L185.86 132.51L183.01 135.99L181.34 137.84L179.62 139.62" fill="none" stroke="#5A120D" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201 88L200.96 90.47L200.83 92.94L200.39 97.4L200.03 99.86L199.59 102.3L199.06 104.72L198.45 107.13L197.14 111.41L196.31 113.75L195.4 116.05L193.55 120.13L192.42 122.34L191.22 124.5" fill="none" stroke="#B3261E" stroke-opacity="0.2" stroke-width="7" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M201 88L200.96 90.47L200.83 92.94L200.39 97.4L200.03 99.86L199.59 102.3L199.06 104.72L198.45 107.13L197.14 111.41L196.31 113.75L195.4 116.05L193.55 120.13L192.42 122.34L191.22 124.5" fill="none" stroke="#B3261E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<circle cx="146.89" cy="17.49" r="2" fill="#B3261E"/>
<text x="218" y="71.17" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">REM OKNO</text>
<line x1="218" y1="88" x2="230" y2="88" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="236" y="91.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">RANNÍ TYP</text>
<line x1="218" y1="106" x2="230" y2="106" fill="none" stroke="#B3261E" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="236" y="109.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">VEČERNÍ TYP</text>
</svg>
</div><p class="use">Chronotyp a zdřímnutí · karta 1: Sova, nebo skřivan<br>Jak přesně prsten a hodinky vidí REM · karta 5: Předpověď, ne přímý přenos</p></article>
<article class="card"><div class="cap"><span class="m acc">12 · twoHypnograms</span></div><div class="art"><svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid meet" viewBox="0 0 358 176">
<!-- twoHypnograms, noc (redOnly), statický snímek (live = false), 358 × 176. Souřadnice jsou z týchž volání Canvasu, která dělá Dart. -->
<rect width="358" height="176" fill="#000000"/>
<rect x="92.47" y="40" width="7.35" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="154.93" y="40" width="13.23" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="212.25" y="40" width="19.11" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="265.16" y="40" width="23.52" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="309.26" y="40" width="27.93" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<path d="M30 28L35.5 28L35.88 28.12L35.88 51.62L36 52L50.5 52L50.58 52.42L50.58 63.92L51 64L83.5 64L83.65 63.65L83.65 52.15L84 52L92.47 51.97L92.5 40L99.5 40L99.81 40.19L99.81 51.69L100 52L118 52L118.19 52.31L118.19 63.81L118.5 64L143.5 64L143.91 63.91L143.91 52.41L144 52L154.5 52L154.93 51.93L154.93 40.43L155 40L168 40L168.16 40.34L168.16 51.84L168.5 52L190 52L190.2 52.3L190.2 63.8L190.5 64L201 64L201.23 63.73L201.23 52.23L201.5 52L212 52L212.25 51.75L212.25 40.25L212.5 40L231 40L231.36 40.14L231.36 51.64L231.5 52L253 52L253.4 51.9L253.4 28.4L253.5 28L256 28L256.34 28.16L256.34 51.66L256.5 52L265 52L265.16 51.66L265.16 40.16L265.5 40L288.5 40L288.68 40.32L288.68 51.82L289 52L309 52L309.26 51.76L309.26 40.26L309.5 40L337 40L337.18 39.68L337.18 28.18L337.5 28L346 28" fill="none" stroke="#FF3B2F" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="40" x2="99.81" y2="40" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="40" x2="168.16" y2="40" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="212.25" y1="40" x2="231.36" y2="40" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="40" x2="288.68" y2="40" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="309.26" y1="40" x2="337.18" y2="40" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="43.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">REM</text>
<rect x="106.43" y="110" width="5.14" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="160.81" y="110" width="7.35" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="213.72" y="110" width="16.17" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="265.16" y="110" width="9.55" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="281.33" y="110" width="7.35" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<rect x="307.79" y="110" width="32.33" height="12" fill="#FF3B2F" fill-opacity="0.16"/>
<path d="M30 98L38.5 98L38.82 98.18L38.82 121.68L39 122L53.5 122L53.52 133.98L54 134L81 134L81.44 133.94L81.44 122.44L81.5 122L106 122L106.43 121.93L106.43 110.43L106.5 110L111.5 110L111.57 110.43L111.57 121.93L112 122L119.5 122L119.66 122.34L119.66 133.84L120 134L140 134L140.23 133.73L140.23 122.23L140.5 122L160.5 122L160.81 121.81L160.81 110.31L161 110L168 110L168.16 110.34L168.16 121.84L168.5 122L191.5 122L191.67 122.33L191.67 133.83L192 134L199 134L199.02 122.02L213.5 122L213.72 121.72L213.72 110.22L214 110L229.5 110L229.89 110.11L229.89 121.61L230 122L254.5 122L254.87 121.87L254.87 98.37L255 98L257.5 98L257.81 98.19L257.81 121.69L258 122L265 122L265.16 121.66L265.16 110.16L265.5 110L274.5 110L274.72 110.28L274.72 121.78L275 122L281 122L281.33 121.83L281.33 110.33L281.5 110L288.5 110L288.68 110.32L288.68 121.82L289 122L307.5 122L307.79 121.79L307.79 110.29L308 110L340 110L340.12 109.62L340.12 98.12L340.5 98L346 98" fill="none" stroke="#B3261E" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="106.43" y1="110" x2="111.57" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="160.81" y1="110" x2="168.16" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="213.72" y1="110" x2="229.89" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="265.16" y1="110" x2="274.72" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="281.33" y1="110" x2="288.68" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="307.79" y1="110" x2="340.12" y2="110" fill="none" stroke="#FF3B2F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<text x="0" y="113.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">REM</text>
<line x1="92.47" y1="143" x2="111.57" y2="143" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="92.47" y1="140" x2="92.47" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="111.57" y1="140" x2="111.57" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="102.02" y="158.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">POZDĚ</text>
<line x1="154.93" y1="143" x2="160.81" y2="143" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="154.93" y1="140" x2="154.93" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="160.81" y1="140" x2="160.81" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="274.72" y1="143" x2="281.33" y2="143" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="274.72" y1="140" x2="274.72" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<line x1="281.33" y1="140" x2="281.33" y2="146" fill="none" stroke="#FF3B2F" stroke-width="1" stroke-linecap="round" stroke-linejoin="round"/>
<text x="278.02" y="158.17" text-anchor="middle" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">JAKO LEHKÝ</text>
<text x="0" y="13.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#FF3B2F">POLYSOMNOGRAFIE</text>
<text x="358" y="13.17" text-anchor="end" font-family="'JetBrains Mono', monospace" font-size="8.5" font-weight="500" letter-spacing="0.06em" fill="#6E1A12">PRINCIP, NE MĚŘENÍ</text>
<text x="0" y="85.19" text-anchor="start" font-family="'JetBrains Mono', monospace" font-size="9.5" font-weight="500" letter-spacing="0.06em" fill="#B3261E">ODHAD ZAŘÍZENÍ</text>
</svg>
</div><p class="use">Jak přesně prsten a hodinky vidí REM · karta 0: Světla v oknech<br>Jak přesně prsten a hodinky vidí REM · karta 2: Garmin v číslech</p></article>
</section>
</div></body></html>
```

### self_check.md

````markdown
# Self-check: 12 ilustrací lekcí

## Shrnutí
- Flutter 3.27.4 (stable) / Dart 3.6.2 byl v cloudu skutečně nainstalovaný. `flutter analyze` i `flutter test` proběhly na minimálním projektu s maketou `_Art`, `AppSkin` a `paintText`.
- `flutter analyze` na spojeném `lesson_art.dart` (všech 12 tříd v jedné knihovně se vzorovou `_Forgetting` a se switchem ze `lesson_art_switch.dart`): **No issues found.**
- `flutter test`: vykresleno **4 416 snímků** (12 id × 2 skiny × 4 šířky × statický snímek a 45 živých časů t = 0–39,6 s). Žádná výjimka, žádný chybějící ani nepoužitý klíč textu, sada id v textech přesně odpovídá switchi.
- Obě poloviny prošly navíc přísnějšími testy u autorů, viz níže.
- Všech 12 ilustrací má výchozí výšku 176 px, řádek s výškou zůstává beze změny.

## Co přesně maketa obsahuje
- `_Art` je zkopírovaná doslova ze zadání (`stroke`, `fill`, `mono`, `label`, `arrowHead`, `t`, `live`, `shouldRepaint`).
- `AppSkin` je maketa se všemi poli ze zadání a metodou `mono({size, color, weight, tracking})`. Denní skin: bg #04060C, panel #0C1222, panelAlt #111A2E, line #1E2740, lineStrong #2E3A57, text #E9EDF5, muted #8D97AD, faint #5B6478, accent #FF5F1F, accentText #FF7A45. Noční (`redOnly`): bg #000000, line #3A0C08, lineStrong #5A120D, text a accent #FF3B2F, muted #B3261E, faint #6E1A12.
- `paintText(canvas, text, style, at, {align})` se svislým středem v `at.dy`.
- `TrainingArt` je nahrazený funkcí `buildArt(id, skin, l, clock)` se stejnými řádky switche. Riverpod, `contentProvider` a `DesignMotion` v maketě nejsou, protože nejsou potřeba pro kreslení.
- Lint: `flutter_lints` 5.0.0, navíc `prefer_const_constructors`, `prefer_final_locals`, `avoid_redundant_argument_values`, `unnecessary_parenthesis`, `strict-casts`, `strict-raw-types`.

## Přísnější kontroly u autorů (obě poloviny)
Každé id, oba skiny, šířky 320, 358, 390 a 430, výška 176, statický snímek (`clock == null`) i živé snímky:
1. Nic se nekreslí mimo plochu (render s okrajem 24 px, okraj musí zůstat v barvě pozadí, resp. záznamové plátno s tolerancí 0,5 px).
2. Každý popisek leží celý uvnitř plochy (rámeček glyfů včetně háčků a čárek nad verzálkami).
3. Žádné dva popisky se nepřekrývají.
4. Žádná čára ani tečka nevede přes popisek.
5. Barvy jen ze skinu; výplně širší než 8 px mají alpha ≤ 0,2.
6. Texty: všechny klíče existují, verzálky, 1–3 slova, bez „—“.
- Polovina B kontroluje body 1–4 i pro celou animaci (t = 0–40 s po 0,9 s). Tím se při ladění našla jedna skutečná chyba (skenovací linka v `twoHypnograms` přejížděla popisek), je opravená.
- Popisky se vykreslovaly skutečným fontem JetBrains Mono (FontLoader), ne Ahem obdélníky. PNG jsme prohlíželi na všech šířkách ve dne i v noci.

## Shoda náhledu s Dartem
- SVG v `lesson_art_preview.html` nejsou psaná ručně. Záznamové plátno pustí **stejný Dart `paint()`** na šířce 358 se `clock == null` a zapíše SVG (úsečky, kruhy, obdélníky jako prvky, `Path` navzorkovaný a zjednodušený s tolerancí 0,04 px).
- SVG jsme vykreslili v Chromiu a porovnali po pixelech s Flutter PNG: nad práh 64/255 se liší 0,1–1 % pixelů, jen antialiasing a sazba písma (posun ~0,5 px).
- Náhled nemá žádné skripty, jen Google Fonts. V Chromiu bez chyb v konzoli a bez vodorovného posunu.

## Na co si dát pozor při vložení
- **Prostorování písma:** maketa bere `tracking: 0.06` jako em (0,06 × velikost). Pokud skutečný `skin.mono` počítá jinak, popisky budou o kousek širší nebo užší. Nejtěsnější místo: `timeline` na 320 px má mezi popisky 30 px, `brainMap` má v horní řadě rezervu ~160 px.
- **`Path.combine`** (srpek měsíce v `seedMoon` a `chronoDial`) nepodporuje starý HTML renderer Flutter webu; na Androidu a CanvasKit funguje.
- **Pomocné funkce** (rohové značky, čárkovaná čára) jsou kvůli formátu „jen třídy“ zopakované uvnitř tříd. Pokud `paint_utils.dart` už podobné má, dají se nahradit.
- **Vzorová `_Forgetting` ze zadání** sama hlásí `prefer_const_constructors` na `Offset(left, top - 6)`, pokud máte tento lint zapnutý. Naše třídy ho nehlásí.
- **V noci** splývá `accent` a `text` do stejné červené, proto zvýraznění v nočním režimu nese i tloušťka čáry, halo, výplň a rohové značky, ne jen barva.
- **Precuneus** leží na vnitřní straně hemisféry; v pohledu z boku je to schematický bod (karta to nepopírá, je to princip).
- Maketa nekompiluje skutečný soubor s `flutter_riverpod`, `content.dart` a `design.dart`. Kód ale nepoužívá nic mimo `_Art`, `AppSkin`, `paintText`, `dart:math` a `package:flutter`, takže by se v reálném souboru měl chovat stejně. Poslední jistotu dá `flutter analyze` u vás.

## Spojený test (pro zopakování)
```dart
// test/check_test.dart v maketovém projektu; lib/art.dart = maketa + `part 'lesson_art.g.dart';`
for (final id in artIds) {
  for (final skin in [AppSkin.day, AppSkin.night]) {
    for (final w in [320.0, 358.0, 390.0, 430.0]) {
      for (final t in <double?>[null, for (var i = 0; i < 45; i++) i * 0.9]) {
        final rec = ui.PictureRecorder();
        buildArt(id, skin, l, t == null ? null : ValueNotifier<double>(t))
            .paint(Canvas(rec), Size(w, artHeight(id)));
        rec.endRecording().dispose();
      }
    }
  }
}
// + kontrola: žádný chybějící ani nepoužitý klíč v lesson_art_copy.json, sada id = switch
```
Výsledek: `frames=4416 missing={} unused={}`, `All tests passed!`
````
