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

/// Poloha a obraz podle zdrojů: Wangyal pravý bok (ženy levý) a lotos s A v hrdle, Norbu levý bok a A v srdci i hrdle, kagjü lví poloha.
class _PostureVariants extends _Art {
  _PostureVariants(super.skin, super.l, super.clock);

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

  // Postava na pravém boku zepředu, hlava vlevo: (podél těla od temene, výška nad lůžkem), jednotka = výška postavy.
  static const _head = [
    (0.0, 0.13), (0.01, 0.161), (0.035, 0.176), (0.07, 0.177), (0.1, 0.167), (0.122, 0.15), //
    (0.132, 0.13), (0.122, 0.11), (0.1, 0.093), (0.07, 0.083), (0.035, 0.084), (0.01, 0.099),
  ];
  static const _down = [
    (0.25, 0.004), (0.32, 0.008), (0.39, 0.03), (0.46, 0.008), (0.52, 0.002), (0.62, 0.005), (0.73, 0.007), (0.85, 0.009), (0.95, 0.014),
  ];

  /// Levá paže podél boku, dlaň na stehně.
  static const _topArm = [
    (0.19, 0.212), (0.215, 0.232), (0.28, 0.234), (0.36, 0.224), (0.41, 0.224), (0.49, 0.213), (0.525, 0.216), (0.565, 0.211), //
    (0.592, 0.2), (0.565, 0.19), (0.525, 0.188), (0.49, 0.19), (0.41, 0.186), (0.36, 0.183), (0.29, 0.189), (0.235, 0.19),
  ];
  static const _flank = [(0.33, 0.186), (0.36, 0.171), (0.39, 0.162), (0.44, 0.171), (0.478, 0.188)];
  static const _thigh = [(0.592, 0.183), (0.67, 0.157), (0.73, 0.137), (0.8, 0.131), (0.88, 0.106), (0.95, 0.082)];
  static const _legs = [(0.52, 0.1), (0.6, 0.087), (0.73, 0.071), (0.85, 0.06), (0.95, 0.047)];
  static const _footTop = [(0.95, 0.082), (0.975, 0.084), (0.996, 0.072), (1.0, 0.055), (0.975, 0.047), (0.95, 0.047)];
  static const _footDown = [(0.95, 0.047), (0.98, 0.043), (0.999, 0.032), (0.996, 0.014), (0.97, 0.005), (0.95, 0.014)];

  /// Lví poloha: pravé předloktí před hrudníkem, dlaň pod tváří.
  static const _lionArm = [
    (0.205, 0.004), (0.165, 0.025), (0.135, 0.045), (0.09, 0.053), (0.045, 0.058), (0.028, 0.066), //
    (0.045, 0.075), (0.09, 0.076), (0.125, 0.074), (0.16, 0.058), (0.2, 0.036), (0.215, 0.018),
  ];

  void _figure(Canvas c, Offset Function(double, double) p, {required bool lion}) {
    final body = stroke(skin.muted, 1);
    final thin = stroke(skin.faint, 1);
    List<Offset> pts(List<(double, double)> k) => [for (final (u, v) in k) p(u, v)];
    final pillowTop = lion ? 0.05 : 0.078;
    final pr = Rect.fromPoints(p(-0.04, 0), p(0.165, pillowTop));
    c.drawRRect(RRect.fromRectAndRadius(pr, const Radius.circular(4)), stroke(skin.line, 1));
    c.drawPath(_smooth(pts(_head), closed: true), body);
    // Obličej: zavřené oči, obočí, nos; nahoře levé ucho, vlasová linie.
    for (final sg in [-1.0, 1.0]) {
      final cy = 0.13 + sg * 0.0185;
      c.drawPath(_smooth([p(0.059, cy - 0.008), p(0.065, cy), p(0.059, cy + 0.008)]), thin);
      c.drawLine(p(0.05, 0.13 + sg * 0.008), p(0.047, 0.13 + sg * 0.026), thin);
    }
    c.drawLine(p(0.07, 0.128), p(0.088, 0.126), thin);
    c.drawPath(_smooth([p(0.03, 0.166), p(0.016, 0.13), p(0.03, 0.094)]), thin);
    c.drawPath(_smooth([p(0.055, 0.176), p(0.067, 0.185), p(0.08, 0.174)]), body);
    // Krk a ramena.
    c.drawLine(p(0.122, 0.153), p(0.168, 0.162), body);
    c.drawPath(_smooth([p(0.168, 0.162), p(0.18, 0.19), p(0.19, 0.212)]), body);
    if (lion) {
      c.drawLine(p(0.122, 0.106), p(0.15, 0.098), body);
      c.drawPath(_smooth([p(0.215, 0.008), ...pts(_down)]), body);
      c.drawPath(_smooth(pts(_lionArm), closed: true), body);
      c.drawLine(p(0.05, 0.066), p(0.088, 0.065), thin);
    } else {
      c.drawPath(_smooth([p(0.122, 0.106), p(0.158, 0.095), p(0.18, 0.06), p(0.2, 0.012), ...pts(_down)]), body);
    }
    c.drawPath(_smooth(pts(_topArm)), body);
    c.drawLine(p(0.5, 0.209), p(0.545, 0.204), thin);
    c.drawLine(p(0.56, 0.2), p(0.586, 0.198), thin);
    c.drawPath(_smooth(pts(_flank)), body);
    c.drawPath(_smooth(pts(_thigh)), body);
    c.drawPath(_smooth(pts(_legs)), body);
    c.drawPath(_smooth(pts(_footTop)), body);
    c.drawPath(_smooth(pts(_footDown)), body);
  }

  void _lotus(Canvas c, Offset o, double r) {
    final ink = stroke(skin.accent, 0.9);
    final petals = Path()
      ..moveTo(o.dx - 0.35 * r, o.dy + 0.3 * r)
      ..quadraticBezierTo(o.dx, o.dy - 1.6 * r, o.dx + 0.35 * r, o.dy + 0.3 * r)
      ..moveTo(o.dx - 0.15 * r, o.dy + 0.45 * r)
      ..quadraticBezierTo(o.dx - 1.2 * r, o.dy - 0.6 * r, o.dx - 1.05 * r, o.dy + 0.35 * r)
      ..moveTo(o.dx + 0.15 * r, o.dy + 0.45 * r)
      ..quadraticBezierTo(o.dx + 1.2 * r, o.dy - 0.6 * r, o.dx + 1.05 * r, o.dy + 0.35 * r);
    c.drawCircle(o, r * 0.9, fill(skin.accent.withValues(alpha: 0.16)));
    c.drawPath(petals, ink);
    c.drawPath(
        Path()
          ..moveTo(o.dx - 1.1 * r, o.dy + 0.4 * r)
          ..quadraticBezierTo(o.dx, o.dy + 1.0 * r, o.dx + 1.1 * r, o.dy + 0.4 * r),
        ink);
  }

  @override
  void paint(Canvas c, Size s) {
    const lw = 100.0;
    final L = math.min(150.0, (s.width - lw - 10) / 1.06);
    final fw = 1.04 * L;
    final fx0 = lw + 6 + (s.width - lw - 6 - fw) / 2;
    final pulse = live ? 0.6 + 0.4 * math.sin(t * 1.4) : 1.0;
    const rowKeys = [
      ['wangyal', 'wangyalMen', 'wangyalWomen', 'wangyalImage'],
      ['norbu', 'norbuSide', 'norbuImage'],
      ['kagyu', 'kagyuSide', 'kagyuImage'],
    ];
    for (var i = 0; i < 3; i++) {
      final y0 = 2.0 + i * 48, bed = y0 + 44;
      final flip = i == 1;
      Offset p(double u, double v) => Offset(flip ? fx0 + fw - (u + 0.04) * L : fx0 + (u + 0.04) * L, bed - v * L);
      c.drawLine(Offset(fx0 - 6, bed), Offset(fx0 + fw + 6, bed), stroke(skin.lineStrong, 1));
      _figure(c, p, lion: i == 2);

      final keys = rowKeys[i];
      label(c, keys[0], Offset(0, y0 + 9), color: skin.text);
      for (var k = 1; k < keys.length; k++) {
        final image = k == keys.length - 1;
        label(c, keys[k], Offset(0, y0 + 9 + 11.3 * k), size: 8.5, color: image ? skin.accentText : skin.muted);
      }

      final throat = p(0.152, 0.128), heart = p(0.265, 0.115);
      if (i == 0) {
        _lotus(c, throat, 3.2);
        label(c, 'letterA', p(0.215, 0.128), align: 0.5, size: 8.5, color: skin.accentText);
      } else if (i == 1) {
        c.drawCircle(throat, 2.2 * pulse, fill(skin.accent));
        c.drawCircle(throat, 4.2, fill(skin.accent.withValues(alpha: 0.16)));
        label(c, 'letterA', p(0.215, 0.128), align: 0.5, size: 8.5, color: skin.accentText);
        c.drawCircle(heart, 3, stroke(skin.text, 1));
        c.drawCircle(heart, 1, fill(skin.text));
        label(c, 'letterA', p(0.322, 0.115), align: 0.5, size: 8.5, color: skin.text);
      }
    }

    // Jiné texty: světlo mezi obočím (malá tvář), a poznámka, že mechanismus nikdo netestoval.
    const by = 166.0;
    label(c, 'other', const Offset(0, by), size: 8.5, color: skin.faint);
    const fc = Offset(70, by);
    c.drawOval(Rect.fromCenter(center: fc, width: 11, height: 14), stroke(skin.muted, 1));
    for (final sg in [-1.0, 1.0]) {
      c.drawLine(fc + Offset(sg * 1.6, -2.4), fc + Offset(sg * 3.8, -2.8), stroke(skin.faint, 1));
      c.drawLine(fc + Offset(sg * 1.5, 0.2), fc + Offset(sg * 3.6, 0.2), stroke(skin.faint, 1));
    }
    c.drawCircle(fc + const Offset(0, -2.2), 3.2, fill(skin.accent.withValues(alpha: 0.18 * pulse)));
    c.drawCircle(fc + const Offset(0, -2.2), 1.2, fill(skin.accent));
    label(c, 'brow', const Offset(81, by), size: 8.5);
    label(c, 'untested', Offset(s.width, by), align: 1, color: skin.accentText);
  }
}

/// Zhuang Zhou a motýl v jedné smyčce osmičky: každý sní toho druhého, uprostřed se zkušenosti střídají a hranice je přerušovaná.
class _Butterfly extends _Art {
  _Butterfly(super.skin, super.l, super.clock);

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

  /// Přední křídlo (pravé), shora: kořen, žebro (kosta), vrchol, vnější okraj, vnitřní okraj.
  static const _fore = [
    (0.06, -0.26), (0.25, -0.5), (0.5, -0.66), (0.92, -0.74), (0.96, -0.6), (0.87, -0.32), (0.72, -0.08), (0.45, -0.1), (0.2, -0.13), (0.07, -0.17),
  ];

  /// Zadní křídlo (pravé).
  static const _hind = [
    (0.06, -0.12), (0.3, -0.16), (0.6, -0.1), (0.8, 0.06), (0.78, 0.3), (0.62, 0.5), (0.35, 0.58), (0.15, 0.45), (0.07, 0.15), (0.05, -0.04),
  ];

  /// Žilnatina předního křídla: (začátek, směr k okraji); konec se dosadí na nejbližší bod okraje.
  static const _foreVeins = [
    (0.08, -0.25, 0.45, -0.66), (0.3, -0.33, 0.62, -0.72), (0.4, -0.38, 0.78, -0.76), (0.47, -0.42, 0.92, -0.74), //
    (0.47, -0.42, 0.95, -0.62), (0.465, -0.37, 0.93, -0.5), (0.455, -0.31, 0.89, -0.38), (0.44, -0.24, 0.84, -0.27), //
    (0.36, -0.22, 0.78, -0.15), (0.25, -0.2, 0.66, -0.08), (0.08, -0.17, 0.5, -0.1),
  ];
  static const _foreCell = [(0.1, -0.22), (0.47, -0.42), (0.44, -0.24), (0.1, -0.17)];
  static const _hindVeins = [
    (0.08, -0.1, 0.45, -0.15), (0.42, -0.02, 0.72, -0.02), (0.41, 0.04, 0.8, 0.12), (0.4, 0.09, 0.78, 0.28), //
    (0.38, 0.14, 0.68, 0.44), (0.3, 0.12, 0.55, 0.53), (0.2, 0.09, 0.4, 0.57), (0.07, 0.0, 0.25, 0.53),
  ];
  static const _hindCell = [(0.1, -0.06), (0.42, -0.02), (0.38, 0.14), (0.1, 0.05)];

  /// Spící hlava z profilu (obličej doprava, nahoru Y): přední obrys od temene ke krku a zadní obrys.
  static const _face = [
    (-0.05, 0.5), (0.18, 0.46), (0.31, 0.34), (0.37, 0.17), (0.34, 0.1), (0.47, -0.05), (0.39, -0.12), (0.41, -0.19), //
    (0.37, -0.24), (0.39, -0.3), (0.33, -0.36), (0.36, -0.45), (0.24, -0.53), (0.12, -0.56), (0.1, -0.75),
  ];
  static const _back = [(-0.05, 0.5), (-0.3, 0.45), (-0.48, 0.25), (-0.52, 0.02), (-0.45, -0.22), (-0.33, -0.42), (-0.3, -0.75)];

  Offset _snap(Path outline, Offset guess) {
    var best = guess;
    var bd = double.infinity;
    for (final m in outline.computeMetrics()) {
      for (var i = 0; i <= 160; i++) {
        final q = m.getTangentForOffset(m.length * i / 160)!.position;
        final d = (q - guess).distanceSquared;
        if (d < bd) {
          bd = d;
          best = q;
        }
      }
    }
    return best;
  }

  @override
  void paint(Canvas c, Size s) {
    final cx = s.width / 2;
    const cy = 90.0;
    final a = math.min(s.width * 0.44, 165.0);
    final ky = 60 / (0.354 * a);
    Offset lem(double tau) {
      final sn = math.sin(tau), cs = math.cos(tau), den = 1 + sn * sn;
      return Offset(cx + a * cs / den, cy + ky * a * sn * cs / den);
    }

    // Osmička proměny a přerušovaná hranice uprostřed.
    final loop = Path()..moveTo(lem(0).dx, lem(0).dy);
    for (var i = 1; i <= 240; i++) {
      final q = lem(2 * math.pi * i / 240);
      loop.lineTo(q.dx, q.dy);
    }
    loop.close();
    c.drawPath(loop, stroke(skin.accent.withValues(alpha: 0.55), 1));
    for (final tau in [1.72 * math.pi, 0.72 * math.pi]) {
      final q = lem(tau), d = lem(tau + 0.01) - q;
      arrowHead(c, q, d / d.distance, stroke(skin.accent.withValues(alpha: 0.8), 1), 5);
    }
    final sway = live ? math.sin(t * 0.9) * 2 : 0.0;
    for (var y = 24.0; y < 156; y += 6) {
      final x = cx + sway * math.sin(y / 18);
      c.drawLine(Offset(x, y), Offset(x, y + 2.5), stroke(skin.faint, 1));
    }
    final tau = live ? t * 0.35 : 1.72 * math.pi + 0.25;
    c.drawCircle(lem(tau), 2.6, fill(skin.text));

    // Spáč: hlava na tvrdé podložce, obličej vzhůru, vlasy v uzlu.
    final k = math.min(46.0, a * 0.32);
    final hx = cx - 0.6 * a, hy = cy - 0.1 * k;
    Offset h(double x, double y) => Offset(hx - y * k, hy - x * k);
    List<Offset> hp(List<(double, double)> pts) => [for (final (x, y) in pts) h(x, y)];
    final ink = stroke(skin.text, 1);
    final soft = stroke(skin.muted, 1);
    c.drawRRect(RRect.fromRectAndRadius(Rect.fromPoints(h(-0.53, 0.3), h(-0.72, -0.32)), const Radius.circular(2)), stroke(skin.lineStrong, 1));
    c.drawPath(_smooth(hp(_face)), ink);
    c.drawPath(_smooth(hp(_back)), ink);
    c.drawPath(_smooth(hp([(0.21, 0.43), (0.1, 0.3), (0.02, 0.17), (-0.04, 0.12)])), stroke(skin.faint, 1));
    // Krk přechází do zkříženého límce roucha a ramene na podložce.
    c.drawPath(_smooth(hp([(0.1, -0.75), (0.06, -0.86), (-0.02, -0.98)])), soft);
    c.drawPath(_smooth(hp([(-0.3, -0.75), (-0.2, -0.86), (-0.02, -0.98), (0.08, -1.02)])), soft);
    c.drawPath(_smooth(hp([(-0.3, -0.75), (-0.42, -0.86), (-0.56, -0.96)])), soft);
    c.drawPath(_smooth(hp([(-0.03, -0.02), (-0.06, 0.1), (-0.13, 0.11), (-0.17, -0.02), (-0.14, -0.13), (-0.06, -0.14)])), soft);
    c.drawPath(_smooth(hp([(0.23, 0.075), (0.28, 0.052), (0.325, 0.07)])), ink);
    c.drawPath(_smooth(hp([(0.22, 0.17), (0.29, 0.195), (0.35, 0.17)])), soft);
    c.drawLine(h(0.3, -0.24), h(0.385, -0.24), soft);
    final bun = h(-0.2, 0.6);
    c.drawCircle(bun, 0.13 * k, ink);
    c.drawLine(h(-0.42, 0.63), h(0.06, 0.58), soft);

    // Motýl shora: kyjovitá tykadla, hruď, článkovaný zadeček, žilnatina.
    final b = math.min(a * 0.3, 42.0);
    final bx = cx + 0.6 * a, by = cy + 0.1 * b;
    final flap = live ? 0.84 + 0.16 * math.cos(t * 2.2) : 1.0;
    final vein = stroke(skin.lineStrong, 1);
    final wingInk = stroke(skin.text, 1);
    for (final sg in [-1.0, 1.0]) {
      Offset w(double x, double y) => Offset(bx + sg * x * flap * b, by + y * b);
      for (final (outline, cell, veins) in [(_hind, _hindCell, _hindVeins), (_fore, _foreCell, _foreVeins)]) {
        final path = _smooth([for (final (x, y) in outline) w(x, y)], closed: true);
        c.drawPath(path, fill(skin.accent.withValues(alpha: 0.05)));
        c.drawPath(_smooth([for (final (x, y) in cell) w(x, y)], closed: true), vein);
        for (final (x0, y0, x1, y1) in veins) {
          c.drawLine(w(x0, y0), _snap(path, w(x1, y1)), vein);
        }
        c.drawPath(path, wingInk);
      }
      final ant = _smooth([Offset(bx + sg * 0.02 * b, by - 0.37 * b), Offset(bx + sg * 0.1 * b, by - 0.6 * b), Offset(bx + sg * 0.27 * b, by - 0.82 * b)]);
      c.drawPath(ant, wingInk);
      c.drawOval(Rect.fromCenter(center: Offset(bx + sg * 0.285 * b, by - 0.84 * b), width: 3, height: 4.2), fill(skin.text));
    }
    c.drawCircle(Offset(bx, by - 0.33 * b), 0.055 * b, fill(skin.text));
    final thorax = Rect.fromCenter(center: Offset(bx, by - 0.19 * b), width: 0.13 * b, height: 0.25 * b);
    c.drawOval(thorax, fill(skin.text.withValues(alpha: 0.2)));
    c.drawOval(thorax, wingInk);
    final abd = _smooth([
      Offset(bx, by - 0.07 * b), Offset(bx + 0.05 * b, by), Offset(bx + 0.048 * b, by + 0.25 * b), Offset(bx + 0.022 * b, by + 0.47 * b), //
      Offset(bx, by + 0.52 * b), Offset(bx - 0.022 * b, by + 0.47 * b), Offset(bx - 0.048 * b, by + 0.25 * b), Offset(bx - 0.05 * b, by),
    ], closed: true);
    c.drawPath(abd, wingInk);
    for (var y = 0.05; y < 0.45; y += 0.065) {
      final half = (0.05 - 0.06 * math.max(0, y - 0.2)) * b;
      c.drawLine(Offset(bx - half, by + y * b), Offset(bx + half, by + y * b), stroke(skin.muted, 0.8));
    }

    label(c, 'zhuang', const Offset(0, 10));
    label(c, 'butterfly', Offset(s.width, 10), align: 1);
    label(c, 'who', Offset(cx, 10), align: 0.5, color: skin.accentText);
    label(c, 'change', Offset(cx, s.height - 9), align: 0.5, color: skin.accentText);
  }
}

/// Prediktivní zpracování: v bdění mozek posílá odhady a smysly vracejí chybu, kterou drží svět; ve snu vstup chybí a smyčka běží sama.
class _PredictionLoop extends _Art {
  _PredictionLoop(super.skin, super.l, super.clock);

  /// Obrys pravé hemisféry (čelo vpravo), stejný jako u mapy mozku.
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
  static const _cerebellum = [0.12, 0.78, 0.08, 0.92, 0.26, 1.0, 0.38, 0.97, 0.44, 0.95, 0.45, 0.9, 0.43, 0.88];

  void _brain(Canvas c, Rect box) {
    Offset p(double u, double v) => Offset(box.left + box.width * u, box.top + box.height * v);
    Path curve(List<double> k) {
      final path = Path()..moveTo(p(k[0], k[1]).dx, p(k[0], k[1]).dy);
      for (var i = 2; i + 5 < k.length; i += 6) {
        final a = p(k[i], k[i + 1]), b = p(k[i + 2], k[i + 3]), e = p(k[i + 4], k[i + 5]);
        path.cubicTo(a.dx, a.dy, b.dx, b.dy, e.dx, e.dy);
      }
      return path;
    }

    c.drawPath(curve([0.01, 0.55, for (final k in _outline) ...k]), stroke(skin.muted, 1));
    for (final k in _sulci) {
      c.drawPath(curve(k), stroke(skin.lineStrong, 1));
    }
    c.drawPath(curve(_cerebellum), stroke(skin.muted, 1));
    c.drawLine(p(0.16, 0.86), p(0.38, 0.9), stroke(skin.lineStrong, 1));
    c.drawLine(p(0.47, 0.88), p(0.48, 1.05), stroke(skin.muted, 1));
    c.drawLine(p(0.54, 0.875), p(0.55, 1.05), stroke(skin.muted, 1));
  }

  void _tree(Canvas c, Offset base, double h, Paint ink) {
    c.drawLine(base, base - Offset(0, h * 0.42), ink);
    final cr = base - Offset(0, h * 0.68);
    final r = h * 0.3;
    final crown = Path();
    for (var i = 0; i <= 7; i++) {
      final a0 = -math.pi / 2 + i * 2 * math.pi / 7;
      final q = cr + Offset(math.cos(a0), math.sin(a0)) * r;
      if (i == 0) {
        crown.moveTo(q.dx, q.dy);
      } else {
        final mid = cr + Offset(math.cos(a0 - math.pi / 7), math.sin(a0 - math.pi / 7)) * r * 1.32;
        crown.quadraticBezierTo(mid.dx, mid.dy, q.dx, q.dy);
      }
    }
    c.drawPath(crown, ink);
    c.drawLine(base - Offset(0, h * 0.3), base - Offset(-h * 0.12, h * 0.48), ink);
  }

  void _dashed(Canvas c, Path path, Paint paint, double shift) {
    for (final m in path.computeMetrics()) {
      for (var d = shift % 6 - 6; d < m.length; d += 6) {
        final a = math.max(0.0, d), b = math.min(m.length, d + 3);
        if (b > a) {
          c.drawPath(m.extractPath(a, b), paint);
        }
      }
    }
  }

  Path _arc(Offset a, Offset ctl, Offset b) => Path()
    ..moveTo(a.dx, a.dy)
    ..quadraticBezierTo(ctl.dx, ctl.dy, b.dx, b.dy);

  void _arrowAtEnd(Canvas c, Offset ctl, Offset end, Paint p) {
    final d = end - ctl;
    arrowHead(c, end, d / d.distance, p, 5);
  }

  @override
  void paint(Canvas c, Size s) {
    const bw = 70.0, bh = 52.0, bl = 6.0;
    final tx = s.width - 20;
    final ex = (bl + bw + tx) / 2 + 12;
    final shift = live ? t * 6 : 0.0;
    final hot = stroke(skin.accent);
    final back = stroke(skin.text, 1);
    c.drawLine(const Offset(1, 88), Offset(s.width - 1, 88), stroke(skin.line));

    for (var r = 0; r < 2; r++) {
      final y0 = r * 92.0;
      final awake = r == 0;
      final box = Rect.fromLTWH(bl, y0 + 19, bw, bh);
      _brain(c, box);
      final ey = y0 + 44;
      label(c, awake ? 'awake' : 'dream', Offset(0, y0 + 9), color: skin.text);

      final front = Offset(box.left + bw * 0.93, box.top + bh * 0.24);
      final eyeL = Offset(ex - 13, ey - 2);
      if (awake) {
        // Odhad ven (nahoře), chyba zpět (dole).
        final ctl = Offset((front.dx + eyeL.dx) / 2, y0 + 2);
        c.drawPath(_arc(front, ctl, eyeL), hot);
        _arrowAtEnd(c, ctl, eyeL, hot);
        label(c, 'pred', Offset(ctl.dx, y0 + 9), align: 0.5, color: skin.accentText);
        final from = Offset(ex - 13, ey + 4), to = Offset(box.left + bw * 0.9, box.top + bh * 0.66);
        final ctl2 = Offset((from.dx + to.dx) / 2, y0 + 86);
        c.drawPath(_arc(from, ctl2, to), back);
        _arrowAtEnd(c, ctl2, to, back);
        label(c, 'error', Offset(ctl2.dx, y0 + 77), align: 0.5, size: 8.5);
        // Oko otevřené.
        final lid = Path()
          ..moveTo(ex - 11, ey)
          ..quadraticBezierTo(ex, ey - 10, ex + 11, ey)
          ..quadraticBezierTo(ex, ey + 10, ex - 11, ey);
        c.drawPath(lid, stroke(skin.text, 1));
        c.drawCircle(Offset(ex, ey), 3.6, stroke(skin.text, 1));
        c.drawCircle(Offset(ex, ey), 1.5, fill(skin.text));
        label(c, 'senses', Offset(ex, y0 + 9), align: 0.5);
        // Svět drží odhad pod kontrolou: světlo jde do oka.
        _tree(c, Offset(tx, ey + 22), 46, stroke(skin.muted, 1));
        for (final dy in [-5.0, 0.0, 5.0]) {
          final ray = Path()
            ..moveTo(tx - 16, ey + dy * 1.6)
            ..lineTo(ex + 15, ey + dy * 0.5);
          _dashed(c, ray, stroke(skin.muted, 1), shift);
        }
        arrowHead(c, Offset(ex + 15, ey), const Offset(-1, 0), stroke(skin.muted, 1), 4);
        label(c, 'world', Offset(tx, y0 + 77), align: 0.5, size: 8.5);
      } else {
        // Smyčka sama: odhad se vrací do mozku bez opravy zvenku.
        final top = Offset(box.left + bw * 0.42, box.top + bh * 0.02);
        final c1 = Offset(front.dx + 34, box.top - 26), c2 = Offset(box.left + bw * 0.2, box.top - 30);
        final selfLoop = Path()
          ..moveTo(front.dx, front.dy)
          ..cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, top.dx, top.dy);
        c.drawPath(selfLoop, hot);
        _arrowAtEnd(c, c2, top, hot);
        final m = selfLoop.computeMetrics().first;
        final dot = m.getTangentForOffset(m.length * (live ? (t * 0.25) % 1.0 : 0.45))!.position;
        c.drawCircle(dot, 2.4, fill(skin.accentText));
        label(c, 'ownLoop', Offset(front.dx + 30, y0 + 9), color: skin.accentText);
        // Oko zavřené, svět jen tušený, vstup přerušený.
        final lidC = Path()
          ..moveTo(ex - 11, ey)
          ..quadraticBezierTo(ex, ey + 8, ex + 11, ey);
        c.drawPath(lidC, stroke(skin.text, 1));
        for (final lx in [-6.0, 0.0, 6.0]) {
          c.drawLine(Offset(ex + lx, ey + 4 - lx.abs() * 0.18), Offset(ex + lx * 1.25, ey + 8 - lx.abs() * 0.1), stroke(skin.muted, 0.8));
        }
        final treePaint = stroke(skin.line, 1);
        _tree(c, Offset(tx, ey + 22), 46, treePaint);
        final xm = (ex + tx) / 2 + 2;
        for (final dy in [-5.0, 0.0, 5.0]) {
          final ray = Path()
            ..moveTo(tx - 16, ey + dy * 1.6)
            ..lineTo(xm + 9, ey + dy * 1.0);
          _dashed(c, ray, stroke(skin.line), 0);
        }
        c.drawLine(Offset(xm - 4, ey - 4), Offset(xm + 4, ey + 4), stroke(skin.faint, 1));
        c.drawLine(Offset(xm - 4, ey + 4), Offset(xm + 4, ey - 4), stroke(skin.faint, 1));
        label(c, 'noInput', Offset(xm, ey - 14), align: 0.5, size: 8.5, color: skin.faint);
        label(c, 'theory', Offset(s.width, s.height - 7), align: 1, size: 8.5, color: skin.faint);
      }
    }
  }
}
