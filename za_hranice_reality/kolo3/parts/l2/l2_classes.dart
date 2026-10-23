/// Lucidita, stabilita a kontrola jako tři oddělené osy: tentýž sen má luciditu vysoko, stabilitu napůl a kontrolu nízko.
class _LucidityAxes extends _Art {
  _LucidityAxes(super.skin, super.l, super.clock);

  static const _names = ['lucidity', 'stability', 'control'];
  static const _hints = ['lucidityHint', 'stabilityHint', 'controlHint'];

  void _dash(Canvas c, Path path, Paint paint, {double on = 3, double off = 3, double shift = 0}) {
    for (final m in path.computeMetrics()) {
      for (var d = shift % (on + off) - (on + off); d < m.length; d += on + off) {
        final a = math.max(0.0, d), b = math.min(m.length, d + on);
        if (b > a) {
          c.drawPath(m.extractPath(a, b), paint);
        }
      }
    }
  }

  @override
  void paint(Canvas c, Size s) {
    const x0 = 88.0;
    final x1 = s.width - 32;
    const rows = [52.0, 94.0, 136.0];
    double vx(double v) => x0 + (x1 - x0) * v;
    final values = [
      0.86,
      live ? 0.52 + 0.09 * math.sin(t * 0.7) : 0.52,
      live ? 0.2 + 0.035 * math.sin(t * 1.1 + 1) : 0.2,
    ];

    label(c, 'title', const Offset(0, 10));
    for (var i = 0; i < 3; i++) {
      final y = rows[i];
      final hot = i == 0;
      label(c, _names[i], Offset(0, y - 6), color: hot ? skin.accentText : skin.text);
      label(c, _hints[i], Offset(0, y + 7), color: skin.faint, size: 8.5);
      for (var k = 0; k <= 10; k++) {
        final major = k % 5 == 0;
        final h = major ? 4.0 : 2.0;
        c.drawLine(Offset(vx(k / 10), y - h), Offset(vx(k / 10), y + h), stroke(major ? skin.lineStrong : skin.line, 1));
      }
      c.drawLine(Offset(x0, y), Offset(x1, y), stroke(skin.lineStrong, 1));
      if (i == 1) {
        // Stabilita kolísá: pás, ve kterém se sen drží.
        final band = Rect.fromLTRB(vx(0.36), y - 6, vx(0.68), y + 6);
        c.drawRect(band, fill(skin.text.withValues(alpha: 0.05)));
        for (final bx in [band.left, band.right]) {
          c.drawLine(Offset(bx, y - 6), Offset(bx, y + 6), stroke(skin.faint, 0.8));
        }
      }
      c.drawLine(Offset(x0, y), Offset(vx(values[i]), y), stroke(hot ? skin.accent : skin.muted, 2));
    }

    // Jeden sen = jeden bod na každé ose; spojnice ukazuje, že hodnoty jdou každá jinam.
    final pts = [for (var i = 0; i < 3; i++) Offset(vx(values[i]), rows[i])];
    final top = Offset(pts[0].dx, 18);
    _dash(c, Path()..addPolygon([top, pts[0] - const Offset(0, 8)], false), stroke(skin.accent.withValues(alpha: 0.6), 1), on: 2, off: 2);
    final prof = Path()..addPolygon(pts, false);
    _dash(c, prof, stroke(skin.accent.withValues(alpha: 0.55), 1), shift: live ? t * 4 : 0);
    final oneW = 9 * 9.5 * 0.66;
    label(c, 'oneDream', Offset(math.min(pts[0].dx, s.width - oneW / 2), 10), align: 0.5, color: skin.accentText);

    for (var i = 0; i < 3; i++) {
      if (i == 0) {
        c.drawCircle(pts[i], 7, fill(skin.accent.withValues(alpha: 0.14)));
        c.drawCircle(pts[i], 7, stroke(skin.accent.withValues(alpha: 0.4), 0.8));
        c.drawCircle(pts[i], 3.5, fill(skin.accent));
      } else {
        c.drawCircle(pts[i], 3.2, fill(skin.text));
      }
    }

    // Ikony na konci os: oko (víš), vodováha (držíš), rozcestí (měníš).
    final ix = s.width - 13;
    final eye = Offset(ix, rows[0]);
    final lid = Path()
      ..moveTo(eye.dx - 9, eye.dy)
      ..quadraticBezierTo(eye.dx, eye.dy - 7.5, eye.dx + 9, eye.dy)
      ..quadraticBezierTo(eye.dx, eye.dy + 7.5, eye.dx - 9, eye.dy);
    c.drawPath(lid, stroke(skin.accentText, 1));
    c.drawCircle(eye, 3, stroke(skin.accentText, 1));
    c.drawCircle(eye, 1.2, fill(skin.accentText));

    final lv = Offset(ix, rows[1]);
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: lv, width: 19, height: 8), const Radius.circular(4)),
        stroke(skin.muted, 1));
    for (final dx in [-3.0, 3.0]) {
      c.drawLine(lv + Offset(dx, -4), lv + Offset(dx, -1.6), stroke(skin.muted, 0.8));
    }
    c.drawCircle(lv + Offset((values[1] - 0.52) * 18, 0.4), 2, stroke(skin.muted, 1));

    final fk = Offset(ix - 8, rows[2]);
    final fork = stroke(skin.faint, 1);
    c.drawLine(fk, fk + const Offset(6, 0), fork);
    c.drawLine(fk + const Offset(6, 0), fk + const Offset(15, -5), fork);
    c.drawLine(fk + const Offset(6, 0), fk + const Offset(15, 5), fork);
    arrowHead(c, fk + const Offset(15, -5), const Offset(0.874, -0.486), fork, 3.5);
    arrowHead(c, fk + const Offset(15, 5), const Offset(0.874, 0.486), fork, 3.5);

    label(c, 'low', Offset(x0, s.height - 9), size: 8.5);
    label(c, 'high', Offset(x1, s.height - 9), align: 1, size: 8.5);
    label(c, 'caption', Offset((x0 + x1) / 2, s.height - 9), align: 0.5, color: skin.faint, size: 8.5);
  }
}

/// Spánková paralýza shora: mysl a oči bdí, bránice dýchá, tělo ještě v útlumu REM; dole vlna, která za sekundy až minuty mine.
class _ParalysisWave extends _Art {
  _ParalysisWave(super.skin, super.l, super.clock);

  /// Hladká křivka bodů (Catmull-Rom jako kubické úseky).
  static Path _smooth(List<Offset> p, {bool closed = false}) {
    final path = Path()..moveTo(p[0].dx, p[0].dy);
    final n = p.length;
    Offset at(int i) => closed ? p[(i % n + n) % n] : p[i.clamp(0, n - 1)];
    for (var i = 0; i < (closed ? n : n - 1); i++) {
      final p0 = at(i - 1), p1 = at(i), p2 = at(i + 1), p3 = at(i + 2);
      final c1 = p1 + (p2 - p0) / 6, c2 = p2 - (p3 - p1) / 6;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    if (closed) {
      path.close();
    }
    return path;
  }

  /// Hlava shora (temeno 0, brada 0,135), horní polovina; dolní je zrcadlová.
  static const _head = [
    (0.0, 0.0), (0.006, 0.026), (0.022, 0.042), (0.045, 0.048), (0.07, 0.047), //
    (0.095, 0.04), (0.115, 0.028), (0.128, 0.014), (0.135, 0.0),
  ];

  /// Vnější obrys trupu a nohy od podpaží po kotník (|v|).
  static const _flank = [
    (0.33, 0.098), (0.36, 0.084), (0.39, 0.075), (0.44, 0.082), (0.5, 0.093), //
    (0.56, 0.091), (0.64, 0.08), (0.72, 0.072), (0.79, 0.074), (0.86, 0.064), (0.945, 0.05),
  ];

  /// Vnitřní strana nohy od rozkroku po kotník.
  static const _inner = [
    (0.515, 0.003), (0.58, 0.018), (0.66, 0.024), (0.72, 0.026), (0.8, 0.028), (0.88, 0.031), (0.945, 0.034),
  ];

  /// Chodidlo vytočené mírně ven, od kotníku zvenku ke kotníku zevnitř.
  static const _foot = [(0.945, 0.05), (0.96, 0.064), (0.984, 0.07), (1.002, 0.06), (1.006, 0.043), (0.992, 0.031), (0.955, 0.033)];

  /// Paže: boční okraj od akromionu k zápěstí, pak vnitřní okraj zpět k podpaží.
  static const _arm = [
    (0.19, 0.108), (0.205, 0.131), (0.25, 0.141), (0.3, 0.144), (0.355, 0.148), (0.4, 0.153), (0.45, 0.151), (0.49, 0.148), //
    (0.49, 0.116), (0.45, 0.112), (0.4, 0.106), (0.355, 0.107), (0.3, 0.1), (0.235, 0.09),
  ];

  /// Dlaň vzhůru (palec ven): (podél, napříč ven) od středu zápěstí; prsty malík, prsteník, prostředník, ukazovák, palec.
  static const _hand = [
    (0.0, -0.016), (0.03, -0.0235), (0.05, -0.024), (0.08, -0.0235), (0.086, -0.0185), (0.08, -0.013), (0.056, -0.0125), //
    (0.091, -0.0118), (0.098, -0.0065), (0.091, -0.001), (0.058, -0.0002), //
    (0.095, 0.0), (0.102, 0.0055), (0.095, 0.011), (0.058, 0.0115), //
    (0.09, 0.012), (0.097, 0.0175), (0.09, 0.0228), (0.06, 0.0235), //
    (0.046, 0.027), (0.061, 0.037), (0.067, 0.043), (0.06, 0.048), (0.03, 0.038), (0.012, 0.025), (0.0, 0.016),
  ];

  /// Malíček zvlášť (pro zvýraznění).
  static const _little = [(0.05, -0.024), (0.08, -0.0235), (0.086, -0.0185), (0.08, -0.013), (0.056, -0.0125)];

  /// Pravá plíce (nahoře): hrot, boční okraj, spodek na bránici; levá má srdeční zářez.
  static const _lungR = [
    (0.304, 0.024), (0.25, 0.024), (0.232, 0.028), (0.195, 0.02), (0.17, 0.034), (0.19, 0.068), (0.23, 0.082), (0.28, 0.085), (0.318, 0.081),
  ];
  static const _lungL = [
    (0.306, 0.05), (0.29, 0.057), (0.262, 0.05), (0.238, 0.024), (0.195, 0.02), (0.17, 0.034), (0.19, 0.068), (0.23, 0.082), (0.28, 0.085),
    (0.322, 0.081),
  ];
  static const _heart = [
    (0.228, -0.006), (0.248, -0.016), (0.28, -0.018), (0.302, -0.008), (0.31, 0.018), (0.306, 0.044), (0.286, 0.046), (0.256, 0.032), (0.236, 0.014),
  ];

  @override
  void paint(Canvas c, Size s) {
    final L = math.min(s.width - 64, 270.0);
    final xs = (s.width - 1.04 * L) / 2 + 0.04 * L;
    const midY = 66.0;
    Offset p(double u, double v) => Offset(xs + u * L, midY + v * L);
    List<Offset> side(List<(double, double)> k, double sg) => [for (final (u, v) in k) p(u, sg * v)];

    final body = stroke(skin.muted, 1);
    final organ = stroke(skin.lineStrong, 1);
    final hot = stroke(skin.accentText);

    // Matrace a polštář.
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTRB(8, midY - 0.175 * L, s.width - 8, midY + 0.175 * L), const Radius.circular(8)),
        stroke(skin.line, 1));
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromPoints(p(-0.045, -0.078), p(0.15, 0.078)), const Radius.circular(7)),
        stroke(skin.line, 1));

    // Mysl bdí: jemná záře a oblouky nad temenem.
    final mind = p(0.055, 0);
    final glow = live ? 0.1 + 0.04 * math.sin(t * 1.3) : 0.12;
    c.drawCircle(mind, 0.05 * L, fill(skin.accent.withValues(alpha: glow)));
    for (final r in [0.066, 0.08]) {
      c.drawArc(Rect.fromCircle(center: mind, radius: r * L), math.pi - 0.55, 1.1, false,
          stroke(skin.accent.withValues(alpha: r < 0.07 ? 0.7 : 0.4), 1));
    }

    // Hlava, uši, obličej.
    c.drawPath(_smooth([...side(_head, -1), ...side(_head.reversed.skip(1).take(_head.length - 2).toList(), 1)], closed: true), body);
    for (final sg in [-1.0, 1.0]) {
      c.drawPath(
          Path()
            ..moveTo(p(0.055, sg * 0.047).dx, p(0.055, sg * 0.047).dy)
            ..quadraticBezierTo(p(0.067, sg * 0.058).dx, p(0.067, sg * 0.058).dy, p(0.08, sg * 0.045).dx, p(0.08, sg * 0.045).dy),
          body);
      // Obočí.
      c.drawPath(_smooth([p(0.053, sg * 0.008), p(0.049, sg * 0.018), p(0.052, sg * 0.029)]), stroke(skin.faint, 1));
      // Oko otevřené: víčka a duhovka, která se hýbe jako v REM.
      final e = p(0.063, sg * 0.0185);
      final hw = 0.0095 * L, hh = 0.0042 * L;
      c.drawPath(
          Path()
            ..moveTo(e.dx, e.dy - hw)
            ..quadraticBezierTo(e.dx - 2 * hh, e.dy, e.dx, e.dy + hw)
            ..quadraticBezierTo(e.dx + 2 * hh, e.dy, e.dx, e.dy - hw),
          hot);
      final look = live ? math.sin(t * 2.1) * 0.35 * hw : 0.0;
      c.drawCircle(e + Offset(0, look), 1.3, fill(skin.accentText));
    }
    c.drawPath(_smooth([p(0.03, -0.037), p(0.021, 0), p(0.03, 0.037)]), stroke(skin.faint, 1));
    c.drawLine(p(0.068, -0.004), p(0.088, -0.006), stroke(skin.faint, 1));
    c.drawPath(_smooth([p(0.089, -0.008), p(0.093, 0), p(0.089, 0.008)]), stroke(skin.faint, 1));
    c.drawPath(_smooth([p(0.106, -0.011), p(0.109, 0), p(0.106, 0.011)]), stroke(skin.faint, 1));

    // Krk, trapézy, klíční kosti.
    for (final sg in [-1.0, 1.0]) {
      c.drawLine(p(0.121, sg * 0.03), p(0.166, sg * 0.032), body);
      c.drawPath(_smooth([p(0.166, sg * 0.032), p(0.173, sg * 0.06), p(0.182, sg * 0.09), p(0.19, sg * 0.108)]), body);
      c.drawPath(_smooth([p(0.172, sg * 0.012), p(0.178, sg * 0.05), p(0.188, sg * 0.094)]), stroke(skin.line, 1));
      c.drawPath(_smooth(side(_flank, sg)), body);
      c.drawPath(_smooth([...side(_inner, sg)]), body);
      c.drawPath(_smooth(side(_foot, sg)), body);
      c.drawPath(_smooth(side(_arm, sg)), body);
      // Ruka dlaní vzhůru.
      Offset h((double, double) q) => p(0.49 + q.$1, sg * (0.132 + q.$2));
      c.drawPath(_smooth([for (final q in _hand) h(q)]), body);
      // Čéška.
      c.drawOval(Rect.fromCenter(center: p(0.722, sg * 0.049), width: 0.016 * L, height: 0.013 * L), stroke(skin.line, 1));
    }
    c.drawCircle(p(0.415, 0), 1.2, stroke(skin.faint, 0.8));

    // Plíce, srdce a bránice; bránice se s dechem posouvá k nohám.
    final d = live ? 0.006 + 0.006 * math.sin(t * 2 * math.pi / 6) : 0.006;
    List<Offset> lung(List<(double, double)> k, double sg) => [
          for (final (u, v) in k) p(u + (u > 0.296 ? d : 0), sg * v),
        ];
    c.drawPath(_smooth(lung(_lungR, -1)), organ);
    c.drawPath(_smooth(lung(_lungL, 1)), organ);
    c.drawPath(_smooth([for (final (u, v) in _heart) p(u, v)], closed: true), stroke(skin.line, 1));
    final dia = _smooth([
      p(0.318 + d, -0.082), p(0.302 + d, -0.06), p(0.296 + d, -0.04), p(0.304 + d, -0.014), p(0.316 + d, 0.0), //
      p(0.31 + d, 0.02), p(0.303 + d, 0.045), p(0.308 + d, 0.065), p(0.322 + d, 0.083),
    ]);
    c.drawPath(dia, stroke(skin.accent, 1.4));

    // Malíček levé ruky (dole) se pohne: zvýraznění a dva drobné oblouky.
    Offset lh((double, double) q) => p(0.49 + q.$1, 0.132 + q.$2);
    c.drawPath(_smooth([for (final q in _little) lh(q)]), stroke(skin.accent, 1.3));
    final tip = lh((0.086, -0.0185));
    final pulse = live ? 0.5 + 0.5 * math.sin(t * 3) : 1.0;
    for (final r in [3.5, 6.0]) {
      c.drawArc(Rect.fromCircle(center: tip, radius: r), -0.7, 1.4, false,
          stroke(skin.accent.withValues(alpha: (r < 4 ? 0.8 : 0.45) * (0.5 + 0.5 * pulse)), 1));
    }

    // Popisky s vodítky.
    final lead = stroke(skin.lineStrong, 1);
    final eye = p(0.063, -0.0185);
    label(c, 'eyes', Offset(math.max(eye.dx, 39), 10), align: 0.5, color: skin.accentText);
    c.drawLine(Offset(eye.dx, 17), Offset(eye.dx, eye.dy - 0.012 * L), lead);
    final leg = p(0.84, -0.066);
    label(c, 'asleep', Offset(s.width, 10), align: 1);
    c.drawLine(Offset(leg.dx, 17), Offset(leg.dx, leg.dy - 3), lead);
    final arc = p(-0.025, 0.05);
    label(c, 'awake', const Offset(0, 124), color: skin.accentText);
    c.drawLine(Offset(arc.dx, 117), arc + const Offset(0, 2), stroke(skin.accent.withValues(alpha: 0.5), 1));
    final dm = p(0.31 + d, 0.06);
    label(c, 'breath', Offset(dm.dx, 124), align: 0.5, color: skin.accentText);
    c.drawLine(Offset(dm.dx, 117), dm + const Offset(0, 3), stroke(skin.accent.withValues(alpha: 0.5), 1));
    final fx = tip.dx + 9;
    label(c, 'finger', Offset(fx - 4, 124), color: skin.accentText);
    c.drawPath(Path()..addPolygon([Offset(fx, 117), Offset(fx, tip.dy + 3)], false), stroke(skin.accent.withValues(alpha: 0.5), 1));

    // Vlna: rychlý nástup, pomalé odeznění; tečka po ní putuje.
    final xa = xs, xb = xs + L, axis = 158.0;
    double g(double q) => q <= 0 ? 0 : (q / 0.22) * math.exp(1 - q / 0.22);
    Offset w(double q) => Offset(xa + (xb - xa) * q, axis - 17 * g(q));
    final wave = Path()..moveTo(xa, axis);
    for (var i = 1; i <= 80; i++) {
      wave.lineTo(w(i / 80).dx, w(i / 80).dy);
    }
    c.drawPath(Path.from(wave)..lineTo(xb, axis)..close(), fill(skin.accent.withValues(alpha: 0.08)));
    c.drawPath(wave, stroke(skin.accentText));
    c.drawLine(Offset(xa, axis), Offset(xb, axis), stroke(skin.lineStrong, 1));
    arrowHead(c, Offset(xb + 4, axis), const Offset(1, 0), stroke(skin.lineStrong, 1), 4);
    final q = live ? (t / 16) % 1.0 : 0.22;
    c.drawCircle(w(q), 2.6, fill(skin.text));
    label(c, 'time', Offset(xa, 169), size: 8.5);
    label(c, 'passes', Offset(xb, 144), align: 1, color: skin.accentText);
  }
}

class _PostureVariants extends _Art {
  _PostureVariants(super.skin, super.l, super.clock);
  @override
  void paint(Canvas c, Size s) {}
}

class _Butterfly extends _Art {
  _Butterfly(super.skin, super.l, super.clock);
  @override
  void paint(Canvas c, Size s) {}
}

class _PredictionLoop extends _Art {
  _PredictionLoop(super.skin, super.l, super.clock);
  @override
  void paint(Canvas c, Size s) {}
}
