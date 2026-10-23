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
      if (hot) {
        c.drawRect(r, fill(skin.accent.withValues(alpha: 0.06)));
      }
      c.drawRect(r, stroke(hot ? skin.accent.withValues(alpha: 0.5) : skin.line, 1));
      _corners(c, r, stroke(hot ? skin.accent : skin.lineStrong, 1.5));
      label(c, _keys[i], Offset(r.left + 10, r.top + 13), color: hot ? skin.accentText : skin.muted);
      if (hot) {
        label(c, 'main', Offset(r.right - 10, r.top + 13), align: 1, color: skin.accentText, size: 8.5);
      }

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
      if (j < 2) {
        arrowHead(c, q + const Offset(16, 0), const Offset(1, 0), stroke(skin.faint, 1), 3);
      }
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
    if (live) {
      c.drawCircle(kept(grab + (t * 0.4) % (5 - grab)), 2.4, fill(skin.text));
    }
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
      if (d > 0) {
        c.drawLine(Offset(r.left, 17), Offset(r.left, r.top - 2), stroke(d == 2 ? skin.accent.withValues(alpha: 0.6) : skin.lineStrong, 1));
      }
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
      if (k == 1) {
        rem.add((m, m + d));
      }
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
      if (x <= xs || x >= xe + 3) {
        return mid + noise(x - left);
      }
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
    if (live) {
      c.drawCircle(at((t * 0.5) % 24, r), 2, fill(skin.text));
    }

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
        if (k == 1) {
          rem.add(Rect.fromLTRB(x(m), y(1), x(m + d), y(2)));
        }
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
      if (key.isNotEmpty) {
        label(c, key, Offset(x((a + b) / 2), my + 12), align: 0.5, size: 8.5);
      }
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
