/// Sdílená geometrie ilustrací t2: hladké křivky, čárkování, srpek, jiskra.
abstract final class _T2Geo {
  /// Hladká křivka přes body (Catmull-Rom převedený na kubické Bézierovy oblouky).
  static Path smooth(List<Offset> p, {bool closed = false}) {
    final path = Path()..moveTo(p[0].dx, p[0].dy);
    final n = p.length;
    for (var i = 0; i < (closed ? n : n - 1); i++) {
      final p0 = p[closed ? (i - 1 + n) % n : math.max(i - 1, 0)];
      final p1 = p[i];
      final p2 = p[(i + 1) % n];
      final p3 = p[closed ? (i + 2) % n : math.min(i + 2, n - 1)];
      final c1 = p1 + (p2 - p0) / 6;
      final c2 = p2 - (p3 - p1) / 6;
      path.cubicTo(c1.dx, c1.dy, c2.dx, c2.dy, p2.dx, p2.dy);
    }
    if (closed) {
      path.close();
    }
    return path;
  }

  /// Čárkovaná kopie cesty.
  static Path dashed(Path src, double on, double off) {
    final out = Path();
    for (final m in src.computeMetrics()) {
      var d = 0.0;
      while (d < m.length) {
        out.addPath(m.extractPath(d, math.min(d + on, m.length)), Offset.zero);
        d += on + off;
      }
    }
    return out;
  }

  /// Srpek měsíce osvětlený zleva, vnitřní oblouk vpravo.
  static Path crescent(Offset c, double r) {
    const a = 1.0;
    final d = r * 0.55;
    final p = Offset(r * math.cos(a), r * math.sin(a));
    final inner = c + Offset(d, 0);
    final r2 = (p - Offset(d, 0)).distance;
    final th = math.atan2(p.dy, p.dx - d);
    return Path()
      ..addArc(Rect.fromCircle(center: c, radius: r), a, 2 * math.pi - 2 * a)
      ..arcTo(Rect.fromCircle(center: inner, radius: r2), -th, -(2 * math.pi - 2 * th), false);
  }

  /// Slunce: kotouč a [rays] paprsků.
  static void sun(Canvas c, Offset o, double r, Paint p, {int rays = 8, double from = 0, double sweep = 2 * math.pi}) {
    c.drawCircle(o, r, p);
    for (var i = 0; i < rays; i++) {
      final a = from + sweep * (rays == 1 ? 0.5 : i / (sweep >= 2 * math.pi ? rays : rays - 1));
      final u = Offset(math.cos(a), math.sin(a));
      c.drawLine(o + u * (r + 2.5), o + u * (r + 5.5), p);
    }
  }

  /// Čtyřcípá hvězdička.
  static void sparkle(Canvas c, Offset o, double r, Paint p) {
    c.drawLine(o.translate(-r, 0), o.translate(r, 0), p);
    c.drawLine(o.translate(0, -r), o.translate(0, r), p);
  }
}

/// Den jako sen: zastavení na cestě dnem, svět stejně pevný, jen v rámečku „jako sen“, a odbočka k uzemnění.
class _DreamYogaDay extends _Art {
  _DreamYogaDay(super.skin, super.l, super.clock);

  /// Stojící postava z profilu (7,5 hlavy), chodidla v [feet], výška [h].
  void _figure(Canvas c, Offset feet, double h, Paint p) {
    final k = h / 64, kx = k * 1.25;
    Offset q(double x, double y) => feet + Offset(x * kx, y * k);
    final hc = q(0.2, -59.4);
    const head = [
      (0.0, -4.6), (3.0, -3.6), (3.9, -1.0), (4.9, 0.6), (3.9, 1.4), (4.0, 2.3), (3.3, 3.8), //
      (1.2, 4.2), (-2.0, 3.5), (-3.9, 0.4), (-3.0, -3.4),
    ];
    c.drawPath(_T2Geo.smooth([for (final (x, y) in head) hc + Offset(x * k * 1.1, y * k)], closed: true), p);
    const body = [
      (-1.3, -55.0), (-2.0, -52.6), (-3.7, -49.2), (-4.2, -44.0), (-3.0, -37.0), (-4.5, -31.0), (-3.6, -25.0), //
      (-2.6, -17.6), (-3.4, -12.0), (-2.1, -3.2), (-2.5, 0.0), (6.6, 0.0), (3.2, -2.0), (1.6, -6.0), (2.0, -17.6), //
      (3.0, -26.0), (3.3, -32.0), (3.7, -36.5), (3.0, -40.5), (4.4, -46.0), (3.4, -50.5), (1.5, -54.6),
    ];
    c.drawPath(_T2Geo.smooth([for (final (x, y) in body) q(x, y)]), p);
    // Paže volně podél těla: rameno, loket, zápěstí, konečky prstů v půli stehna.
    c.drawPath(_T2Geo.smooth([q(-0.4, -50.0), q(0.4, -38.6), q(1.7, -30.2), q(2.1, -25.2)]), p);
    c.drawLine(hc + Offset(2.6 * k, -0.9 * k), hc + Offset(3.4 * k, -0.9 * k), p);
  }

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    const gy = 140.0;
    final fx = (w * 0.34).roundToDouble();
    final bx0 = (w * 0.47).roundToDouble(), bx1 = w - 40;
    final bw = bx1 - bx0;
    final ink = stroke(skin.muted, 1.1);
    final faint = stroke(skin.faint, 1);

    // Den jako cesta: ráno slunce, večer měsíc, mezi tím zastavení.
    c.drawLine(const Offset(12, gy), Offset(w - 12, gy), stroke(skin.lineStrong, 1));
    _T2Geo.sun(c, const Offset(26, gy - 1), 5, ink, rays: 5, from: -math.pi * 0.92, sweep: math.pi * 0.84);
    c.drawPath(_T2Geo.crescent(Offset(w - 26, gy - 14), 6), ink);
    c.drawCircle(Offset((w * 0.2).roundToDouble(), gy), 2.4, faint);
    label(c, 'morning', const Offset(10, gy + 16));

    // Postava se zastaví a rozhlédne.
    _figure(c, Offset(fx, gy), 70, stroke(skin.text, 1.1));
    label(c, 'pause', Offset(fx, gy - 84), align: 0.5, color: skin.text);
    final eye = Offset(fx + 4.6, gy - 65.5);
    final gaze = stroke(skin.faint, 1);
    c.drawPath(_T2Geo.dashed(Path()..moveTo(eye.dx + 3, eye.dy)..lineTo(bx0 - 2, 72), 2, 3), gaze);
    c.drawPath(_T2Geo.dashed(Path()..moveTo(eye.dx + 3, eye.dy + 1)..lineTo(bx0 - 2, 126), 2, 3), gaze);

    // Svět zůstává pevný (stejné linky), mění se jen vztah: rámeček JAKO SEN.
    final frame = RRect.fromLTRBR(bx0, 34, bx1, gy + 8, const Radius.circular(16));
    c.drawPath(_T2Geo.dashed(Path()..addRRect(frame), 4, 3), stroke(skin.accent.withValues(alpha: 0.85), 1.1));
    final mid = (bx0 + bx1) / 2;
    label(c, 'like', Offset(mid - 2, 11), align: 1, color: skin.accentText);
    label(c, 'dream', Offset(mid + 4, 11), color: skin.text);
    label(c, 'lighter', Offset(mid, 25), align: 0.5, color: skin.faint, size: 8.5);

    // Strom a dům stojí na zemi.
    final tx = bx0 + bw * 0.3;
    c.drawLine(Offset(tx, gy), Offset(tx, gy - 20), ink);
    c.drawLine(Offset(tx, gy - 14), Offset(tx + 4, gy - 19), ink);
    c.drawPath(
        _T2Geo.smooth([
          for (var i = 0; i < 9; i++)
            Offset(tx, gy - 31) +
                Offset(math.cos(i * math.pi * 2 / 9), math.sin(i * math.pi * 2 / 9)) * (11 + 1.6 * math.cos(i * 2.3)),
        ], closed: true),
        ink);
    final hx = bx0 + bw * 0.7;
    c.drawRect(Rect.fromLTRB(hx - 12, gy - 18, hx + 12, gy), ink);
    c.drawPath(Path()..moveTo(hx - 15, gy - 17)..lineTo(hx, gy - 29)..lineTo(hx + 15, gy - 17), ink);
    c.drawRect(Rect.fromLTRB(hx - 7, gy - 10, hx - 2, gy), faint);
    c.drawRect(Rect.fromLTRB(hx + 3, gy - 13, hx + 8, gy - 8), faint);

    // Věci se mění a plynou: mrak mění tvar, list padá, vítr táhne.
    final cc = Offset(bx0 + bw * 0.4, 60);
    final ph = live ? t * 0.5 : 0.0;
    c.drawPath(
        _T2Geo.smooth([
          for (var i = 0; i < 12; i++)
            cc +
                Offset(math.cos(i * math.pi / 6) * (15 + 2.5 * math.sin(i * 1.7 + ph)),
                    math.sin(i * math.pi / 6) * (7 + 2 * math.sin(i * 2.9 - ph * 0.8))),
        ], closed: true),
        ink);
    label(c, 'flow', Offset(bx1 - 10, 50), align: 1, color: skin.faint, size: 8.5);
    final drift = live ? (t * 4) % 16 : 4.0;
    for (final (dx, dy, len) in [(-6.0, 77.0, 12.0), (8.0, 83.0, 8.0)]) {
      final x0 = cc.dx + dx + drift;
      c.drawLine(Offset(x0, dy), Offset(x0 + len, dy), faint);
    }
    final fall = live ? (t / 5) % 1 : 0.45;
    final leaf = Offset(tx + 8 + 10 * fall + 2.5 * math.sin(fall * 9), gy - 26 + 22 * fall);
    c.drawPath(
        Path()
          ..moveTo(leaf.dx - 2.5, leaf.dy)
          ..quadraticBezierTo(leaf.dx, leaf.dy - 2.2, leaf.dx + 2.5, leaf.dy)
          ..quadraticBezierTo(leaf.dx, leaf.dy + 2.2, leaf.dx - 2.5, leaf.dy),
        ink);

    // Úzkost nebo pocit neskutečna: odbočka dolů k chodidlům a zemi.
    label(c, 'anxious', Offset(fx - 15, gy - 54), align: 1, color: skin.text);
    final exit = Path()
      ..moveTo(fx - 27, gy - 46)
      ..quadraticBezierTo(fx - 31, gy - 6, fx - 10, gy - 3);
    c.drawPath(_T2Geo.dashed(exit, 3, 2.5), stroke(skin.accentText, 1.1));
    arrowHead(c, Offset(fx - 9, gy - 3), const Offset(1, 0.1), stroke(skin.accentText, 1.1), 4.5);
    for (var i = 0; i < 5; i++) {
      final x = fx - 8 + i * 4.5;
      c.drawLine(Offset(x, gy + 2), Offset(x - 3, gy + 6), stroke(skin.accentText, 1));
    }
    label(c, 'ground', Offset(fx, gy + 16), align: 0.5, color: skin.accentText);
  }
}

/// Večerní ohlédnutí: projít den, najít touhu a odpor, všimnout si jich v těle a s výdechem povolit.
class _DreamYogaRelease extends _Art {
  _DreamYogaRelease(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final bx = w - 92;
    final body = stroke(skin.text, 1.1);
    final faint = stroke(skin.faint, 1);
    Offset q(double x, double y) => Offset(bx + x, y);

    // Tělo zepředu: hlava 24 px, bradavky ~2 hlavy, pupek ~3, rozkrok ~4 (kánon 8 hlav), řez v půli stehen.
    c.drawOval(Rect.fromCenter(center: q(0, 27), width: 18, height: 23), body);
    for (final m in [1.0, -1.0]) {
      c.drawLine(q(5.2 * m, 37.5), q(6 * m, 46.5), body);
      const arm = [
        (6.0, 46.5), (14.0, 49.5), (24.0, 52.5), (28.5, 59.0), (29.5, 72.0), (30.0, 88.0), (29.0, 102.0), //
        (27.0, 113.0), (27.6, 121.0), (24.6, 130.0), (21.6, 126.5), (21.2, 114.0), (22.0, 100.0), (22.0, 88.0), //
        (21.0, 74.0), (19.0, 67.5),
      ];
      c.drawPath(_T2Geo.smooth([for (final (x, y) in arm) q(x * m, y)]), body);
      const side = [(18.6, 68.0), (18.7, 79.0), (16.2, 93.0), (18.6, 104.0), (21.2, 114.0), (20.2, 135.0), (18.6, 156.0)];
      c.drawPath(_T2Geo.smooth([for (final (x, y) in side) q(x * m, y)]), body);
      c.drawPath(_T2Geo.smooth([q(2 * m, 50.5), q(9 * m, 50), q(17 * m, 52)]), faint);
    }
    c.drawPath(_T2Geo.smooth([q(-3.6, 156), q(-2.6, 132), q(0, 118), q(2.6, 132), q(3.6, 156)]), body);
    c.drawCircle(q(0, 93), 0.9, fill(skin.muted));
    c.drawPath(_T2Geo.dashed(_T2Geo.smooth([q(-16, 81), q(-8, 74), q(0, 72.5), q(8, 74), q(16, 81)]), 2, 2.5), faint);

    // Kde to cítíš: hrdlo, hruď, břicho. Uzel v hrudi povoluje s výdechem.
    final u = live ? (t % 8) / 8 : 0.75;
    final ex = u < 0.4 ? 0.0 : (u - 0.4) / 0.6;
    const spots = [('throat', 44.0, 3.6), ('chest', 62.0, 6.5), ('belly', 93.0, 6.5)];
    for (final (key, y, r) in spots) {
      final hot = key == 'chest';
      if (!hot) {
        c.drawPath(_T2Geo.dashed(Path()..addOval(Rect.fromCircle(center: q(0, y), radius: r)), 1.6, 2), stroke(skin.muted, 1));
      }
      c.drawPath(_T2Geo.dashed(Path()..moveTo(bx + r + 2.5, y)..lineTo(bx + 33, y), 1.5, 2.5), faint);
      label(c, key, Offset(bx + 36, y), color: hot ? skin.accentText : skin.muted);
    }
    final knot = q(0, 62);
    c.drawCircle(knot, 4.2 - 1.2 * ex, stroke(skin.accentText, 1.4));
    if (live) {
      c.drawCircle(knot, 6 + 7 * ex, stroke(skin.accentText.withValues(alpha: 0.85 * (1 - ex)), 1));
    } else {
      c.drawPath(_T2Geo.dashed(Path()..addOval(Rect.fromCircle(center: knot, radius: 8)), 2, 2), stroke(skin.accentText, 1));
      c.drawPath(_T2Geo.dashed(Path()..addOval(Rect.fromCircle(center: knot, radius: 12)), 1.2, 3), stroke(skin.accentText, 0.8));
    }

    // Výdech nosem a ústy ven.
    final breath = stroke(skin.muted.withValues(alpha: live ? (ex > 0 ? 1 - ex * 0.6 : 0.25) : 1), 1);
    for (var i = 0; i < 3; i++) {
      final y0 = 30.5 + i * 3.2;
      final reach = live ? 6 + 9 * ex : 13.0;
      c.drawPath(
          Path()
            ..moveTo(bx - 12, y0)
            ..quadraticBezierTo(bx - 12 - reach * 0.5, y0 - 1.5, bx - 12 - reach, y0 + 1.5 + i * 2),
          breath);
    }
    label(c, 'release', Offset(bx - 30, 28), align: 1, color: skin.text);

    // Večer projdi den: pás chvil od rána do večera.
    c.drawPath(_T2Geo.crescent(const Offset(17, 13), 5), stroke(skin.muted, 1.1));
    label(c, 'evening', const Offset(28, 13));
    const x0 = 12.0, gap = 6.0, top = 44.0, fh = 26.0;
    final fw = math.min(40.0, (bx - 46 - x0 - 4 * gap) / 5);
    double fx(int i) => x0 + i * (fw + gap);
    for (var i = 0; i < 5; i++) {
      final key = i == 1 || i == 3;
      c.drawRRect(RRect.fromLTRBR(fx(i), top, fx(i) + fw, top + fh, const Radius.circular(3)),
          stroke(key ? skin.muted : skin.line, 1));
    }
    final ic = stroke(skin.faint, 1);
    _T2Geo.sun(c, Offset(fx(0) + fw / 2, top + fh / 2), 3, ic, rays: 6);
    c.drawLine(Offset(fx(2) + 6, top + 11), Offset(fx(2) + fw - 6, top + 11), ic);
    c.drawLine(Offset(fx(2) + 6, top + 16), Offset(fx(2) + fw - 10, top + 16), ic);
    c.drawPath(_T2Geo.crescent(Offset(fx(4) + fw / 2, top + fh / 2), 4), ic);
    // Touha táhne k věci (šipky dovnitř), odpor ji odstrkuje (šipky ven).
    for (final (i, inward) in [(1, true), (3, false)]) {
      final o = Offset(fx(i) + fw / 2, top + fh / 2);
      final col = stroke(inward ? skin.accentText : skin.text, 1.1);
      c.drawCircle(o, 2.6, col);
      for (final m in [-1.0, 1.0]) {
        final a = o + Offset(m * (fw / 2 - 3.5), 0), b = o + Offset(m * 5.5, 0);
        c.drawLine(a, b, col);
        arrowHead(c, inward ? b : a, Offset(inward ? -m : m, 0), col, 3.5);
      }
    }
    final ph = live ? (t / 10) % 1 : (fx(1) + fw / 2 - x0) / (fx(4) + fw - x0);
    final px = x0 + ph * (fx(4) + fw - x0);
    c.drawLine(Offset(px, top - 4), Offset(px, top + fh + 4), stroke(skin.accent, 1));
    c.drawLine(const Offset(x0, top + fh + 9), Offset(fx(4) + fw, top + fh + 9), faint);
    arrowHead(c, Offset(fx(4) + fw, top + fh + 9), const Offset(1, 0), faint, 4);
    label(c, 'crave', Offset(fx(1) + fw / 2, top + fh + 22), align: 0.5, color: skin.accentText);
    label(c, 'averse', Offset(fx(3) + fw / 2, top + fh + 22), align: 0.5, color: skin.text);

    // Odkaz do těla, bez hodnocení.
    label(c, 'where', const Offset(x0, 120), color: skin.text);
    final link = Path()
      ..moveTo(x0 + 78, 117)
      ..quadraticBezierTo(bx - 60, 114, bx - 34, 74);
    c.drawPath(_T2Geo.dashed(link, 3, 2.5), stroke(skin.muted, 1));
    arrowHead(c, Offset(bx - 34, 74), const Offset(0.53, -0.85), stroke(skin.muted, 1), 4.5);
    label(c, 'noJudge', const Offset(x0, 144), color: skin.faint, size: 8.5);
    label(c, 'asIf', const Offset(x0, 160), color: skin.faint, size: 8.5);
  }
}

/// Třetí a čtvrtá příprava: večerní záměr, noc, ranní návrat s radostí a smyčka k dalšímu večeru.
class _DreamYogaIntention extends _Art {
  _DreamYogaIntention(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final cx = w / 2;
    const cy = 88.0, ry = 52.0;
    final rx = w / 2 - 92;
    Offset at(double a) => Offset(cx + rx * math.cos(a), cy + ry * math.sin(a));
    const gap = 0.3;
    final line = stroke(skin.lineStrong, 1.1);

    Path arc(double a0, double a1) {
      final p = Path()..moveTo(at(a0).dx, at(a0).dy);
      for (var i = 1; i <= 60; i++) {
        final q = at(a0 + (a1 - a0) * i / 60);
        p.lineTo(q.dx, q.dy);
      }
      return p;
    }

    Offset tangent(double a) {
      final d = Offset(-rx * math.sin(a), ry * math.cos(a));
      return d / d.distance;
    }

    // Noc: horní oblouk od večera k ránu, hvězdy uvnitř.
    c.drawPath(arc(math.pi + gap, 2 * math.pi - gap), line);
    arrowHead(c, at(2 * math.pi - gap), tangent(2 * math.pi - gap), line, 5);
    for (final (fx, fy) in [(-0.55, -0.5), (-0.22, -0.7), (0.14, -0.52), (0.42, -0.68), (-0.72, -0.2), (-0.36, -0.28)]) {
      _T2Geo.sparkle(c, Offset(cx + rx * fx, cy + ry * fy), 1.8, stroke(skin.faint, 1));
    }
    label(c, 'night', Offset(cx, cy - 16), align: 0.5, color: skin.faint, size: 8.5);
    // Spáč na boku pod přikrývkou.
    final sl = stroke(skin.muted, 1);
    c.drawLine(Offset(cx - 26, cy + 7), Offset(cx + 24, cy + 7), stroke(skin.line, 1));
    c.drawRRect(RRect.fromLTRBR(cx - 27, cy + 2.5, cx - 13, cy + 7, const Radius.circular(2.2)), sl);
    c.drawCircle(Offset(cx - 18, cy - 1.2), 3.6, sl);
    c.drawPath(_T2Geo.smooth([Offset(cx - 13, cy + 7), Offset(cx - 11, cy + 0.5), Offset(cx - 1, cy - 1.5), Offset(cx + 10, cy + 1.2), Offset(cx + 19, cy + 2.8), Offset(cx + 22, cy + 7)]), sl);

    // Den: spodní oblouk od rána zpět k dalšímu večeru.
    c.drawPath(_T2Geo.dashed(arc(gap, math.pi - gap), 4, 3), line);
    arrowHead(c, at(math.pi - gap), tangent(math.pi - gap), line, 5);
    label(c, 'day', Offset(cx, cy + ry - 14), align: 0.5, color: skin.faint, size: 8.5);
    label(c, 'noReproach', Offset(cx, cy + ry + 16), align: 0.5, color: skin.text);
    label(c, 'again', Offset(cx - rx - 12, cy + 30), align: 1, color: skin.faint, size: 8.5);

    // Večer: měsíc a záměr.
    final ev = at(math.pi), mo = at(0);
    c.drawPath(_T2Geo.crescent(ev, 9), stroke(skin.text));
    label(c, 'evening', Offset(ev.dx - 16, cy - 7), align: 1);
    label(c, 'intent', Offset(ev.dx - 16, cy + 7), align: 1, color: skin.accentText);
    label(c, 'phrase', Offset(cx, cy - ry - 18), align: 0.5, color: skin.accentText);

    // Ráno: slunce, vybavit si, co zůstalo (i útržek), s radostí.
    _T2Geo.sun(c, mo, 4.5, stroke(skin.text));
    label(c, 'morning', Offset(mo.dx + 16, cy - 14));
    label(c, 'recall', Offset(mo.dx + 16, cy), color: skin.text);
    label(c, 'joy', Offset(mo.dx + 16, cy + 14), color: skin.accentText);
    final fr = stroke(skin.muted, 1);
    final f0 = mo + const Offset(-24, -21);
    c.drawPath(Path()..addPolygon([f0.translate(-3, 0), f0.translate(0, -3), f0.translate(3, 0), f0.translate(0, 3)], true), fr);
    c.drawCircle(mo + const Offset(-33, -13), 1.8, fr);
    final f2 = mo + const Offset(-23, -8);
    c.drawPath(Path()..addPolygon([f2.translate(-3, 2), f2.translate(0, -3), f2.translate(3, 1.5)], true), stroke(skin.accentText, 1));
    label(c, 'little', Offset(mo.dx + 16, cy + 28), color: skin.faint, size: 8.5);

    // Záměr putuje nocí, ráno se vrací.
    final u = live ? (t / 16) % 1 : 0.25;
    final a = math.pi + 2 * math.pi * u;
    final na = a % (2 * math.pi);
    final nearNode = (na - math.pi).abs() < gap || na < gap || na > 2 * math.pi - gap;
    if (!nearNode) {
      c.drawCircle(at(a), 3, fill(skin.accent));
    }
  }
}

/// Když víš, že sníš: v jádru rozpoznat a stabilizovat, kolem souhvězdí cvičení bez pevného pořadí.
class _LucidMission extends _Art {
  _LucidMission(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final cx = w / 2;
    const cy = 92.0, ry = 56.0;
    final rx = w / 2 - 56;
    Offset at(double deg) {
      final a = deg * math.pi / 180;
      return Offset(cx + rx * math.cos(a), cy + ry * math.sin(a));
    }

    // Stanice: proměnit, skrz zeď, rozmnožit, strach, rozpustit (úhel, klíč, popisek nad/pod).
    const st = [(-150.0, 'transform', -1), (-30.0, 'beyond', -1), (30.0, 'multiply', 1), (150.0, 'fear', 1), (-90.0, 'dissolve', -1)];
    const hop = [0, 3, 1, 4, 2];
    final active = live ? hop[(t / 3.2).floor() % hop.length] : 0;
    final pos = [for (final e in st) at(e.$1)];

    // Rámečky popisků, aby přes ně nevedla dráha.
    Rect box(String key, Offset at) {
      final tp = TextPainter(text: TextSpan(text: l(key), style: mono()), textDirection: TextDirection.ltr)..layout();
      final r = Rect.fromCenter(center: at, width: tp.width, height: 11).inflate(3);
      tp.dispose();
      return r;
    }

    final labels = [
      for (var i = 0; i < st.length; i++) box(st[i].$2, pos[i] + Offset(0, st[i].$3 * 25.0)),
    ];

    // Oběžná dráha z teček, mezery u stanic a popisků.
    final dot = fill(skin.faint);
    for (var i = 0; i < 160; i++) {
      final q = at(i * 360 / 160);
      if (pos.every((p) => (p - q).distance > 20) && labels.every((r) => !r.contains(q))) {
        c.drawCircle(q, 0.75, dot);
      }
    }
    // Paprsky z jádra ke čtyřem šikmým stanicím.
    for (var i = 0; i < 4; i++) {
      final d = pos[i] - Offset(cx, cy);
      final u = d / d.distance;
      c.drawPath(
          _T2Geo.dashed(Path()..moveTo(cx + u.dx * 23, cy + u.dy * 23)..lineTo(pos[i].dx - u.dx * 22, pos[i].dy - u.dy * 22), 1.5, 3),
          stroke(i == active ? skin.accent : skin.line, 1));
    }

    // Jádro: oko (rozpoznat) v kruhu se značkami (stabilizovat).
    final hub = Offset(cx, cy);
    c.drawCircle(hub, 15, stroke(skin.text, 1.1));
    for (var i = 0; i < 12; i++) {
      final u = Offset(math.cos(i * math.pi / 6), math.sin(i * math.pi / 6));
      c.drawLine(hub + u * 15, hub + u * (i.isEven ? 18.5 : 17), stroke(skin.muted, 1));
    }
    c.drawPath(
        Path()
          ..moveTo(cx - 10, cy)
          ..quadraticBezierTo(cx, cy - 8.5, cx + 10, cy)
          ..quadraticBezierTo(cx, cy + 8.5, cx - 10, cy),
        stroke(skin.text, 1.1));
    c.drawCircle(hub, 3.3, stroke(skin.accentText));
    c.drawCircle(hub, 1.2, fill(skin.accentText));
    label(c, 'recognize', Offset(cx, cy - 29), align: 0.5, color: skin.text);
    label(c, 'stabilize', Offset(cx, cy + 29), align: 0.5, color: skin.text);

    const k = 1.25;
    for (var i = 0; i < st.length; i++) {
      final (_, key, side) = st[i];
      final o = pos[i];
      Offset v(double x, double y) => o + Offset(x * k, y * k);
      final on = i == active;
      final p = stroke(on ? skin.accentText : skin.muted, 1.1);
      final dotFill = fill(on ? skin.accentText : skin.muted);
      switch (key) {
        case 'transform':
          // Stůl se promění v květinu.
          c.drawLine(v(-15, -1), v(-5, -1), p);
          c.drawLine(v(-14, -1), v(-14, 6), p);
          c.drawLine(v(-6, -1), v(-6, 6), p);
          c.drawLine(v(-2.5, 2), v(2.5, 2), p);
          arrowHead(c, v(3, 2), const Offset(1, 0), p, 3);
          c.drawLine(v(10, 7), v(10, -2.5), p);
          c.drawPath(Path()..moveTo(v(10, 3.5).dx, v(10, 3.5).dy)..quadraticBezierTo(v(13, 1).dx, v(13, 1).dy, v(14.5, 2.8).dx, v(14.5, 2.8).dy), p);
          for (var n = 0; n < 5; n++) {
            final a = -math.pi / 2 + n * 2 * math.pi / 5;
            c.drawCircle(v(10 + 3.1 * math.cos(a), -6 + 3.1 * math.sin(a)), 1.6 * k, p);
          }
          c.drawCircle(v(10, -6), 0.8, dotFill);
        case 'beyond':
          // Ruka projde zdí: předloktí vchází, dlaň s prsty vychází na druhé straně.
          c.drawRect(Rect.fromPoints(v(-2.5, -10), v(2.5, 10)), p);
          for (final y in [-5.0, 0.0, 5.0]) {
            c.drawLine(v(-2.5, y), v(2.5, y), stroke(skin.faint, 1));
          }
          for (final y in [1.4, 4.4]) {
            c.drawLine(v(-16, y), v(-4, y), p);
            c.drawPath(_T2Geo.dashed(Path()..moveTo(v(-2.5, y).dx, v(-2.5, y).dy)..lineTo(v(2.5, y).dx, v(2.5, y).dy), 1.2, 1.4), p);
          }
          c.drawPath(_T2Geo.smooth([v(4, 1.4), v(7, 0.6), v(8.2, -1.8)]), p);
          c.drawPath(_T2Geo.smooth([v(4, 4.4), v(7.5, 5.2)]), p);
          for (final y in [0.9, 2.4, 3.9, 5.2]) {
            c.drawLine(v(7.4, y), v(y == 5.2 ? 10.4 : 11.6, y - 0.2), p);
          }
        case 'multiply':
          // Z jedné věci víc.
          c.drawRect(Rect.fromCenter(center: v(-11, 0), width: 6 * k, height: 6 * k), p);
          c.drawLine(v(-6.5, 0), v(-1.5, 0), p);
          arrowHead(c, v(-1, 0), const Offset(1, 0), p, 3);
          for (final (dx, dy) in [(6.0, -7.0), (12.0, 0.0), (6.0, 7.0)]) {
            c.drawRect(Rect.fromCenter(center: v(dx, dy), width: 6 * k, height: 6 * k), p);
          }
        case 'fear':
          // Postava strachu; pojmenovat z odstupu, přiblížit se, zeptat se.
          c.drawPath(_T2Geo.smooth([v(5, 9), v(6, 2), v(8, -2), v(12, -2), v(14, 2), v(15, 9)]), p);
          c.drawCircle(v(10, -5.6), 2.8 * k, p);
          c.drawPath(Path()..addOval(Rect.fromCircle(center: v(10, -5.6), radius: 2.8 * k - 0.6)),
              fill((on ? skin.accent : skin.muted).withValues(alpha: 0.18)));
          c.drawCircle(v(-14, 6), 1.6, dotFill);
          for (var n = 0; n < 3; n++) {
            c.drawCircle(v(-9.5 + n * 3.8, 6), 0.8, dotFill);
          }
          arrowHead(c, v(2.6, 6), const Offset(1, 0), p, 3);
          c.drawPath(Path()..addArc(Rect.fromCircle(center: v(-3, -6), radius: 2.2 * k), math.pi, math.pi * 1.45), p);
          c.drawLine(v(-2.3, -3.6), v(-3, -1.6), p);
          c.drawCircle(v(-3, 0.6), 0.7, dotFill);
        case 'dissolve':
          // Scéna se rozpustí do světla.
          c.drawPath(_T2Geo.dashed(Path()..addOval(Rect.fromCircle(center: o, radius: 5 * k)), 1.6, 1.6), p);
          for (var n = 0; n < 8; n++) {
            final u = Offset(math.cos(n * math.pi / 4), math.sin(n * math.pi / 4));
            c.drawLine(o + u * 7.5 * k, o + u * 10 * k, p);
            final drift = live ? (t * 0.8 + n * 0.37) % 1 : 0.4;
            final a = n * math.pi / 4 + math.pi / 8;
            c.drawCircle(o + Offset(math.cos(a), math.sin(a)) * (9 + 4 * drift) * k, 0.75, dotFill);
          }
      }
      label(c, key, o + Offset(0, side * 25.0), align: 0.5, color: on ? skin.accentText : skin.muted);
    }

    label(c, 'aim', Offset(8, s.height - 9), color: skin.text);
    label(c, 'order', Offset(w - 8, s.height - 9), align: 1, color: skin.faint);
  }
}

/// Meditace: vzpřímený sed, dech u nosu nebo v břiše, počítání výdechů, zatoulání a návrat, pak otevřené pozorování.
class _Meditation extends _Art {
  _Meditation(super.skin, super.l, super.clock);

  double _w(String key, double size) {
    final tp = TextPainter(text: TextSpan(text: l(key), style: mono(size: size)), textDirection: TextDirection.ltr)..layout();
    final v = tp.width - size * 0.06;
    tp.dispose();
    return v;
  }

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final r0 = math.max(142.0, (w * 0.42).roundToDouble());
    final sx = ((r0 - 84) / 2 + 26).roundToDouble();
    const sy = 144.0;
    Offset q(double x, double y) => Offset(sx + x, sy + y);

    // Dech: ~12 za minutu (5 s), nádech kratší než výdech. Bránice klesá, břicho se vyklene.
    final u = live ? (t % 5) / 5 : 0.3;
    final inh = u < 0.4 ? math.sin(u / 0.4 * math.pi / 2) : math.cos((u - 0.4) / 0.6 * math.pi / 2);
    final b = 2.4 * inh;

    final body = stroke(skin.text, 1.1);
    final soft = stroke(skin.muted, 1);
    final faint = stroke(skin.faint, 1);

    // Podložka a podlaha. Pánev na podložce výš než kolena, aby se páteř sama napřímila.
    c.drawLine(const Offset(8, sy + 14), Offset(r0 - 18, sy + 14), stroke(skin.line, 1));
    c.drawRRect(RRect.fromLTRBR(sx - 26, sy + 1, sx + 18, sy + 13, const Radius.circular(6)), stroke(skin.lineStrong, 1));

    // Hlava z profilu (28 px, sed ~3,9 hlavy), oči zavřené.
    final hc = q(1, -95);
    const hk = 1.12;
    const head = [
      (0.0, -12.0), (6.5, -10.2), (9.6, -6.0), (10.7, -2.2), (10.5, -0.4), (14.6, 3.9), (11.2, 5.2), (11.7, 6.5), //
      (11.0, 7.6), (11.3, 8.7), (10.4, 10.0), (10.9, 11.6), (7.0, 13.0), (3.0, 12.0), (-3.6, 10.6), (-8.8, 6.4), //
      (-10.2, 0.0), (-8.8, -7.2), (-5.0, -11.0),
    ];
    c.drawPath(_T2Geo.smooth([for (final (x, y) in head) hc + Offset(x * hk, y * hk)], closed: true), body);
    c.drawPath(Path()..moveTo(hc.dx + 5.6, hc.dy - 1.2)..quadraticBezierTo(hc.dx + 7.4, hc.dy, hc.dx + 9.2, hc.dy - 1.2), soft);
    c.drawPath(Path()..addArc(Rect.fromCircle(center: hc + const Offset(-1.6, 1.8), radius: 2.8), -1.2, 2.6), faint);

    // Trup: krční a bederní lordóza, hrudní kyfóza; krátký krk, ramena nad pánví.
    c.drawPath(
        _T2Geo.smooth([
          q(-15, 1), q(-16, -8), q(-12.6, -24), q(-14, -40), q(-17, -56), q(-15.6, -68), q(-10, -77), q(-6.6, -82),
          q(-6, -85),
        ]),
        body);
    c.drawPath(
        _T2Geo.smooth([
          q(8.8, -80.4), q(7.2, -74), q(10, -68), q(12.6, -58), q(11, -46), q(11 + b * 0.5, -40), q(12 + b, -32),
          q(10.6 + b * 0.6, -20), q(8, -9), q(22, -5.5), q(36, -1), q(43, 4), q(42.6, 11), q(30, 13.6), q(14, 13.8),
          q(7, 13), q(4.6, 10),
        ]),
        body);
    // Druhé chodidlo pod kolenem (zkřížené nohy) a spodní linie stehna.
    c.drawPath(_T2Geo.smooth([q(28, 13.6), q(32, 9.6), q(40, 9.2)]), faint);
    c.drawPath(_T2Geo.smooth([q(12, 6.5), q(26, 7.6), q(38, 7.4)]), faint);
    // Paže: rameno nad hrudníkem, loket u boku, předloktí k dlaním v klíně.
    c.drawPath(_T2Geo.smooth([q(-9.6, -71), q(-5, -75.5), q(1.5, -74.5), q(4.4, -69)]), soft);
    c.drawPath(_T2Geo.smooth([q(-9.6, -71), q(-8.4, -54), q(-6, -40), q(-3.2, -33.4), q(1, -33.6), q(20, -6.4)]), soft);
    c.drawPath(_T2Geo.smooth([q(4.4, -69), q(3.6, -54), q(2.6, -42), q(24, -11)]), soft);
    c.drawOval(Rect.fromCenter(center: q(25, -8), width: 10, height: 5), soft);

    // Páteř z obratlů a klenba bránice.
    final spine = _T2Geo.smooth([
      q(-11, -4), q(-8.6, -22), q(-10, -40), q(-12.8, -55), q(-11.4, -68), q(-6, -77), q(-3.4, -84), q(-2.4, -88),
    ]);
    for (final m in spine.computeMetrics()) {
      for (var d = 0.0; d <= m.length; d += 4.4) {
        c.drawCircle(m.getTangentForOffset(d)!.position, 0.9, fill(skin.muted));
      }
    }
    final dia = 2.6 * inh;
    c.drawPath(
        _T2Geo.dashed(_T2Geo.smooth([q(-12.4, -41 + dia * 0.4), q(-4, -50 + dia), q(3, -50.5 + dia), q(10, -44)]), 2, 2),
        stroke(skin.muted, 1));

    // Kotvy pozornosti: nos (aktivní) a břicho.
    final nose = hc + const Offset(20.4, 5.2);
    c.drawCircle(nose, 3.4, stroke(skin.accentText));
    label(c, 'nose', Offset(nose.dx + 7, nose.dy), color: skin.accentText);
    final belly = q(16.6 + b, -32);
    c.drawPath(_T2Geo.dashed(Path()..addOval(Rect.fromCircle(center: belly, radius: 4.6)), 1.6, 2), soft);
    label(c, 'belly', Offset(sx + 26, belly.dy));
    label(c, 'posture', const Offset(8, 12), color: skin.faint, size: 8.5);

    // Časová osa praxe: nejdřív šamatha, pak otevřené pozorování.
    final ax = r0 - 10;
    c.drawLine(Offset(ax, 12), Offset(ax, 152), stroke(skin.line, 1));
    c.drawCircle(Offset(ax, 12), 2, fill(skin.accent));
    c.drawCircle(Offset(ax, 134), 2, fill(skin.muted));

    final cw = w - 10 - r0;
    label(c, 'phase1', Offset(r0, 12), color: skin.text);
    label(c, 'count', Offset(w - 10, 12), align: 1, color: skin.faint, size: 8.5);

    // Výdechy 1 až 9, pak znovu od jedné.
    final n = live ? (t / 5).floor() % 9 + 1 : 4;
    for (var i = 0; i < 9; i++) {
      final o = Offset(r0 + cw * (i + 0.5) / 9, 28);
      if (i < n - 1) {
        c.drawCircle(o, 2.6, fill(skin.muted));
      } else if (i == n - 1) {
        c.drawCircle(o, 3, fill(skin.accent));
      } else {
        c.drawCircle(o, 2.6, faint);
      }
    }

    // Cyklus: dech, zatoulání k myšlence, všimnutí, návrat (jedno opakování).
    const bl = 88.0;
    final breath = Path()..moveTo(r0, bl);
    for (var x = 0.0; x <= cw; x += 1) {
      breath.lineTo(r0 + x, bl + 2.4 * math.sin(x / 20 * 2 * math.pi));
    }
    c.drawPath(breath, stroke(skin.lineStrong, 1.1));
    label(c, 'anchor', Offset(r0, bl + 15));

    final x1 = r0 + cw * 0.2, cl = Offset(r0 + cw * 0.47, 58), x3 = r0 + cw * 0.8;
    final cloud = _T2Geo.smooth([
      for (var i = 0; i < 10; i++)
        cl + Offset(math.cos(i * math.pi / 5) * (14 + 2 * math.cos(i * 2.0)), math.sin(i * math.pi / 5) * (7.5 + 1.5 * math.sin(i * 3.0))),
    ], closed: true);
    c.drawPath(cloud, soft);
    label(c, 'wander', Offset(cl.dx, 41), align: 0.5, color: skin.muted);
    final away = Path()
      ..moveTo(x1, bl - 3)
      ..quadraticBezierTo(x1 + 2, 62, cl.dx - 17, 60);
    c.drawPath(_T2Geo.dashed(away, 2.5, 2.5), soft);
    final nt = Offset(cl.dx + 23, 54);
    c.drawLine(nt.translate(0, -4.5), nt.translate(0, 1.5), stroke(skin.accentText, 1.3));
    c.drawCircle(nt.translate(0, 4.6), 1, fill(skin.accentText));
    label(c, 'notice', Offset(nt.dx + 7, 54), color: skin.accentText);
    final back = Path()
      ..moveTo(cl.dx + 18, 66)
      ..quadraticBezierTo(x3 - 6, 66, x3, bl - 6);
    c.drawPath(back, stroke(skin.accentText));
    arrowHead(c, Offset(x3, bl - 6), const Offset(0.2, 0.98), stroke(skin.accentText), 4.5);
    label(c, 'return', Offset(x3, bl + 15), align: 0.5, color: skin.accentText);
    label(c, 'rep', Offset(x3, bl + 28), align: 0.5, color: skin.faint, size: 8.5);

    // Pozornost jako tečka: po dechu, ven k myšlence, zpět.
    final k = live ? (t % 14) / 14 : 0.06;
    Offset dotAt(double k) {
      if (k < 0.2) {
        final x = r0 + (x1 - r0) * k / 0.2;
        return Offset(x, bl + 2.4 * math.sin((x - r0) / 20 * 2 * math.pi));
      }
      if (k < 0.35) {
        final m = away.computeMetrics().first;
        return m.getTangentForOffset(m.length * (k - 0.2) / 0.15)!.position;
      }
      if (k < 0.55) {
        final a = (k - 0.35) / 0.2 * math.pi * 2;
        return cl + Offset(7 * math.cos(a), 3 * math.sin(a));
      }
      if (k < 0.7) {
        final m = back.computeMetrics().first;
        return m.getTangentForOffset(m.length * (k - 0.55) / 0.15)!.position;
      }
      final x = x3 + (r0 + cw - x3) * (k - 0.7) / 0.3;
      return Offset(x, bl + 2.4 * math.sin((x - r0) / 20 * 2 * math.pi));
    }

    c.drawCircle(dotAt(k), 2.6, fill(skin.text));

    // Otevřené pozorování: jen pojmenovat, co přijde.
    label(c, 'phase2', Offset(r0, 134), color: skin.text);
    final chips = ['thought', 'sound', 'feeling'];
    final lit = live ? (t / 2.5).floor() % 3 : 0;
    var x = r0;
    for (var i = 0; i < 3; i++) {
      final tw = _w(chips[i], 8.5);
      final on = i == lit;
      c.drawRRect(RRect.fromLTRBR(x, 147, x + tw + 10, 163, const Radius.circular(8)),
          stroke(on ? skin.accentText : skin.lineStrong, 1));
      label(c, chips[i], Offset(x + 5, 155), color: on ? skin.accentText : skin.muted, size: 8.5);
      x += tw + 16;
    }
  }
}

/// Čtyři přípravy podle Wangyala jako koloběh den, večer, noc, ráno; třetí a čtvrtá se kryjí s MILD a deníkem.
class _FourPreps extends _Art {
  _FourPreps(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final cx = w / 2;
    const cy = 82.0, r = 52.0, sr = 8.5;
    Offset at(double deg, [double rr = r]) => Offset(cx + rr * math.cos(deg * math.pi / 180), cy + rr * math.sin(deg * math.pi / 180));
    const ang = [-120.0, -45.0, 12.0, 168.0];
    const gapDeg = 12.5;

    // Kruh dne: oblouky mezi zastaveními po směru hodin, noc čárkovaně.
    for (var i = 0; i < 4; i++) {
      final a0 = ang[i] + gapDeg, a1 = (i == 3 ? ang[0] + 360 : ang[i + 1]) - gapDeg;
      final p = Path()..addArc(Rect.fromCircle(center: Offset(cx, cy), radius: r), a0 * math.pi / 180, (a1 - a0) * math.pi / 180);
      final night = i == 2;
      final pen = stroke(night ? skin.muted : skin.lineStrong, 1.1);
      c.drawPath(night ? _T2Geo.dashed(p, 3, 3) : p, pen);
      final e = a1 * math.pi / 180;
      arrowHead(c, at(a1), Offset(-math.sin(e), math.cos(e)), pen, 4.5);
    }
    // Obzor mezi večerem a ránem; nahoře slunce, dole noc.
    final h0 = at(ang[3]), h1 = at(ang[2]);
    c.drawPath(_T2Geo.dashed(Path()..moveTo(h0.dx + 12, h0.dy)..lineTo(h1.dx - 12, h1.dy), 2, 3), stroke(skin.line, 1));
    _T2Geo.sun(c, Offset(cx, cy - 22), 4, stroke(skin.muted, 1));
    c.drawPath(_T2Geo.crescent(Offset(cx - 16, cy + 27), 4.5), stroke(skin.muted, 1));
    for (final (dx, dy) in [(14.0, 22.0), (22.0, 31.0), (6.0, 35.0)]) {
      _T2Geo.sparkle(c, Offset(cx + dx, cy + dy), 1.6, stroke(skin.faint, 1));
    }

    // Překryv: večerní záměr = MILD, ranní návrat = deník.
    final br = Path()..addArc(Rect.fromCircle(center: Offset(cx, cy), radius: r + 13), 30 * math.pi / 180, 120 * math.pi / 180);
    c.drawPath(_T2Geo.dashed(br, 3, 2.5), stroke(skin.accentText, 1));
    for (final (a, st) in [(30.0, 12.0), (150.0, 168.0)]) {
      final tip = at(st) + (at(a, r + 13) - at(st)) / (at(a, r + 13) - at(st)).distance * (sr + 2.5);
      c.drawLine(at(a, r + 13), tip, stroke(skin.accentText, 1));
    }
    label(c, 'overlap', Offset(cx, cy + r + 26), align: 0.5, color: skin.accentText);

    // Zastavení 1 až 4.
    final lit = live ? (t / 4).floor() % 4 : -1;
    for (var i = 0; i < 4; i++) {
      final o = at(ang[i]);
      final mild = i >= 2;
      final on = i == lit;
      c.drawCircle(o, sr, stroke(on || mild ? skin.accentText : skin.muted, on ? 1.6 : 1.1));
      paintText(c, '${i + 1}', mono(size: 8.5, color: skin.text), o.translate(0.3, 0), align: 0.5);
    }
    final p1 = at(ang[0]), p2 = at(ang[1]), p3 = at(ang[2]), p4 = at(ang[3]);
    label(c, 'p1', Offset(p1.dx - 13, p1.dy), align: 1, color: skin.text);
    label(c, 'p2a', Offset(p2.dx + 13, p2.dy - 6), color: skin.text);
    label(c, 'p2b', Offset(p2.dx + 13, p2.dy + 7), color: skin.text);
    label(c, 'p3', Offset(p3.dx + 13, p3.dy - 6), color: skin.text);
    label(c, 'p4a', Offset(p4.dx - 13, p4.dy - 6), align: 1, color: skin.text);
    label(c, 'p4b', Offset(p4.dx - 13, p4.dy + 7), align: 1, color: skin.text);

    // Tradice, ne věda.
    final tw = l('tradition').length * 8.5 * 0.66;
    c.drawRRect(RRect.fromLTRBR(8, 5, 8 + tw + 9, 21, const Radius.circular(3)), stroke(skin.lineStrong, 1));
    label(c, 'tradition', const Offset(13, 13), color: skin.muted, size: 8.5);
    label(c, 'source', Offset(w - 8, 13), align: 1, color: skin.faint, size: 8.5);
  }
}
