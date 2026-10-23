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
