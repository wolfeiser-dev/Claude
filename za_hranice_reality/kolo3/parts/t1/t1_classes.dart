/// Pomůcky sdílu t1: čárkovaná cesta, hladká křivka přes body a hlava z profilu (vzpřímená i na zádech).
mixin _T1Ink on _Art {
  /// Profil hlavy, obličej vpravo, jednotka = půl výšky hlavy (temeno −1, brada 0,92).
  static const _t1Profile = [
    Offset(-0.5, 1.3), Offset(-0.55, 0.95), Offset(-0.86, 0.5), Offset(-0.98, 0), Offset(-0.78, -0.6), //
    Offset(-0.4, -0.92), Offset(0, -1), Offset(0.42, -0.86), Offset(0.62, -0.6), Offset(0.7, -0.3), //
    Offset(0.66, -0.18), Offset(0.76, -0.02), Offset(0.88, 0.14), Offset(0.72, 0.24), Offset(0.76, 0.36), //
    Offset(0.7, 0.44), Offset(0.74, 0.52), Offset(0.64, 0.62), Offset(0.7, 0.78), Offset(0.56, 0.92), //
    Offset(0.32, 0.96), Offset(0.24, 1.08), Offset(0.26, 1.35),
  ];

  /// Bod profilu hlavy se středem [o] a poloměrem [r]; [supine] otočí obličej ke stropu.
  Offset t1HeadPt(Offset o, double r, Offset p, {bool supine = false}) =>
      supine ? o + Offset(p.dy, -p.dx) * r : o + p * r;

  /// Hladká křivka (Catmull-Rom) přes [p].
  Path t1Smooth(List<Offset> p, {bool closed = false}) {
    final n = p.length;
    Offset at(int i) => closed ? p[(i % n + n) % n] : p[i.clamp(0, n - 1)];
    final path = Path()..moveTo(p[0].dx, p[0].dy);
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

  void t1Dashed(Canvas c, Path p, Paint paint, {double dash = 2.5, double gap = 3.5}) {
    for (final m in p.computeMetrics()) {
      for (var d = 0.0; d < m.length; d += dash + gap) {
        c.drawPath(m.extractPath(d, math.min(d + dash, m.length)), paint);
      }
    }
  }

  /// Hlava z profilu: obrys, ucho a oko (zavřené víčko s řasami, nebo otevřené).
  void t1Head(Canvas c, Offset o, double r, Paint p, {bool supine = false, bool eyesOpen = false}) {
    Offset q(double x, double y) => t1HeadPt(o, r, Offset(x, y), supine: supine);
    c.drawPath(t1Smooth([for (final v in _t1Profile) q(v.dx, v.dy)]), p);
    final thin = stroke(p.color, 1);
    c.drawPath(t1Smooth([q(-0.1, -0.16), q(-0.24, -0.2), q(-0.32, -0.02), q(-0.24, 0.2), q(-0.12, 0.24)]),
        stroke(skin.muted, 0.9));
    if (eyesOpen) {
      c.drawPath(t1Smooth([q(0.4, -0.22), q(0.56, -0.15), q(0.42, -0.06)]), thin);
      c.drawCircle(q(0.5, -0.14), r * 0.05 + 0.4, fill(p.color));
    } else {
      c.drawPath(t1Smooth([q(0.36, -0.15), q(0.48, -0.09), q(0.6, -0.14)]), thin);
      for (final x in [0.42, 0.52]) {
        c.drawLine(q(x, -0.1), q(x + 0.02, -0.02), stroke(p.color, 0.8));
      }
    }
  }

  /// Člověk na zádech z boku pod přikrývkou: hlava na polštáři vlevo, chodidla vpravo, matrace dole.
  void t1Sleeper(Canvas c, Offset o, double r, Paint body, Paint bed) {
    Offset q(double x, double y) => o + Offset(x, y) * r;
    c.drawLine(q(-1.9, 1.5), q(13, 1.5), bed);
    c.drawPath(
        t1Smooth([
          q(-1.45, 1.5),
          q(-1.55, 1.2),
          q(-1.2, 1.0),
          q(-0.4, 0.99),
          q(0.6, 1.0),
          q(1.5, 1.1),
          q(1.75, 1.35),
          q(1.7, 1.5)
        ]),
        bed);
    t1Head(c, o, r, body, supine: true);
    c.drawPath(t1Smooth([q(1.35, -0.26), q(1.75, -0.5), q(2.05, -0.64)]), body);
    c.drawPath(t1Smooth([q(1.3, 0.5), q(1.7, 0.6), q(2.18, 0.64)]), body);
    final cover = [
      q(2.05, -0.64), q(3.0, -0.84), q(4.2, -0.62), q(5.4, -0.42), q(6.8, -0.22), q(8.4, -0.08), //
      q(9.7, 0.02), q(10.8, 0.08), q(11.5, -0.36), q(12.05, -0.26), q(12.4, 0.6), q(12.55, 1.5),
    ];
    c.drawPath(t1Smooth(cover), body);
    c.drawPath(t1Smooth([q(2.05, -0.64), q(2.2, 0.4), q(2.45, 1.5)]), stroke(body.color, 1));
  }
}

/// Posílení vybavování: večerní zájem a klid, ráno bez pohybu se zavřenýma očima, sen přetáčený pozpátku, hlas a týdenní přehled.
class _RecallTraining extends _Art with _T1Ink {
  _RecallTraining(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    final mx0 = w * 0.24, mx1 = w * 0.7, wx0 = w * 0.765;
    const axisY = 157.0;

    // Osa večer, ráno, týden.
    c.drawLine(const Offset(4, axisY), Offset(w - 4, axisY), stroke(skin.lineStrong, 1));
    for (final x in [4.0, mx0 - 6, wx0 - 6]) {
      c.drawLine(Offset(x, axisY - 3), Offset(x, axisY + 3), stroke(skin.lineStrong, 1));
    }
    label(c, 'evening', const Offset(4, axisY + 14));
    label(c, 'morning', Offset(mx0 - 6, axisY + 14));
    label(c, 'week', Offset(wx0 - 6, axisY + 14));
    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);

    // Večer: srpek měsíce, zájem o sny, displej zhasnutý dvě minuty před spaním.
    const ex = 20.0;
    final moon = Path.combine(
        PathOperation.difference,
        Path()..addOval(Rect.fromCircle(center: const Offset(ex, 30), radius: 8)),
        Path()..addOval(Rect.fromCircle(center: const Offset(ex + 4.6, 26.6), radius: 7)));
    c.drawPath(moon, fill(skin.muted.withValues(alpha: 0.2)));
    c.drawPath(moon, stroke(skin.muted, 1));
    label(c, 'intent', const Offset(0, 54), color: skin.text);
    final phone = RRect.fromRectAndRadius(
        Rect.fromCenter(center: const Offset(ex, 84), width: 13, height: 22), const Radius.circular(2.5));
    c.drawRRect(phone, stroke(skin.muted, 1));
    c.drawLine(const Offset(ex - 2, 76), const Offset(ex + 2, 76), stroke(skin.faint, 1));
    c.drawLine(const Offset(ex - 10, 95), const Offset(ex + 10, 73), stroke(skin.muted, 1));
    label(c, 'calm', const Offset(0, 110));

    // Ráno: sen jako filmový pás, poslední obraz vpravo, přetáčení zpět.
    const sy0 = 20.0, sy1 = 50.0;
    final strip = Rect.fromLTRB(mx0, sy0, mx1, sy1);
    c.drawRect(strip, stroke(skin.lineStrong, 1));
    for (var x = mx0 + 4; x < mx1 - 3; x += 7) {
      c.drawRect(Rect.fromLTWH(x, sy0 + 2, 2.4, 2.4), fill(skin.lineStrong));
      c.drawRect(Rect.fromLTWH(x, sy1 - 4.4, 2.4, 2.4), fill(skin.lineStrong));
    }
    const gap = 4.0;
    final fw = (mx1 - mx0 - 2 * gap - 3 * gap) / 4;
    final phase = live ? (t / 1.6) % 6 : 0.0;
    final lit = live ? (phase < 4 ? 3 - phase.floor() : -1) : 3;
    for (var i = 0; i < 4; i++) {
      final r = Rect.fromLTWH(mx0 + gap + i * (fw + gap), sy0 + 7, fw, sy1 - sy0 - 14);
      final on = i == lit;
      final col = on ? skin.accent : (i == 3 ? skin.text : skin.muted);
      if (on) {
        c.drawRect(r, fill(skin.accent.withValues(alpha: 0.12)));
      }
      c.drawRect(r, stroke(col, on ? 1.4 : 1));
      _frame(c, i, r.center, stroke(col, 1));
    }
    final ay = sy1 + 7;
    final lastX = mx0 + gap + 3 * (fw + gap) + fw / 2;
    final firstX = mx0 + gap + fw / 2;
    c.drawLine(Offset(lastX, ay), Offset(firstX, ay), stroke(skin.accent, 1.4));
    arrowHead(c, Offset(firstX, ay), const Offset(-1, 0), stroke(skin.accent, 1.4), 5);
    arrowHead(c, Offset(firstX + 6, ay), const Offset(-1, 0), stroke(skin.accent, 1.4), 5);
    label(c, 'rewind', Offset(mx0, ay + 12), color: skin.accentText);
    label(c, 'last', Offset(mx1, sy0 - 9), align: 1, color: skin.text);

    // Ráno: ležící se nehýbe, oči zavřené; hlasem tři slova a jedna emoce.
    final o = Offset(mx0 + 16, 126);
    const r = 9.5;
    t1Sleeper(c, o, r, stroke(skin.text), stroke(skin.lineStrong, 1));
    label(c, 'still', Offset(mx0, axisY - 9));
    final mouth = t1HeadPt(o, r, const Offset(0.7, 0.44), supine: true);
    final pulse = live ? (t / 1.2) % 1 : 0.0;
    for (var i = 0; i < 3; i++) {
      final rr = 5.0 + 4 * i + 2 * pulse;
      c.drawArc(Rect.fromCircle(center: mouth, radius: rr), -1.35, 0.75, false,
          stroke(skin.accent.withValues(alpha: 1 - i * 0.28), 1.1));
    }
    const cy = 101.0;
    final cx0 = mouth.dx + 22;
    for (var i = 0; i < 3; i++) {
      c.drawRRect(RRect.fromRectAndRadius(Rect.fromLTWH(cx0 + i * 15, cy - 3.5, 12, 7), const Radius.circular(3.5)),
          stroke(skin.text, 1));
    }
    final hx = cx0 + 3 * 15 + 6;
    final heart = Path()
      ..moveTo(hx, cy + 4)
      ..cubicTo(hx - 7, cy - 1, hx - 4, cy - 6.5, hx, cy - 2.5)
      ..cubicTo(hx + 4, cy - 6.5, hx + 7, cy - 1, hx, cy + 4);
    c.drawPath(heart, stroke(skin.accent));
    label(c, 'words', Offset(cx0 + 21, cy - 14), align: 0.5, color: skin.text);
    label(c, 'emotion', Offset(hx + 10, cy), color: skin.accentText);

    // Týden: sedm zápisů, tentýž motiv se vrací třikrát.
    final dw = (w - 6 - wx0) / 7;
    const dy0 = 40.0, dy1 = 86.0;
    final hits = [1, 3, 6];
    final pts = <Offset>[];
    for (var d = 0; d < 7; d++) {
      final x = wx0 + d * dw;
      final rr = Rect.fromLTWH(x + 1, dy0, dw - 3, dy1 - dy0);
      c.drawRect(rr, stroke(skin.lineStrong, 1));
      for (var k = 0; k < 3; k++) {
        final yy = dy0 + 8 + k * 7 + (d % 2) * 2.0;
        c.drawLine(Offset(rr.left + 2, yy), Offset(rr.right - 2 - ((d + k) % 3) * 1.2, yy), stroke(skin.faint, 1));
      }
      if (hits.contains(d)) {
        final p = Offset(rr.center.dx, dy1 - 10 - (d % 3) * 3.0);
        pts.add(p);
        c.drawCircle(p, 2.4, stroke(skin.accent));
      }
    }
    final link = Path()..moveTo(pts[0].dx, pts[0].dy);
    for (var i = 1; i < pts.length; i++) {
      final m = Offset((pts[i - 1].dx + pts[i].dx) / 2, math.min(pts[i - 1].dy, pts[i].dy) - 9);
      link.quadraticBezierTo(m.dx, m.dy, pts[i].dx, pts[i].dy);
    }
    t1Dashed(c, link, stroke(skin.accent, 1), dash: 2, gap: 2.5);
    label(c, 'repeat', Offset(wx0 + 1, dy1 + 14), color: skin.accentText);
  }

  /// Drobné obrázky snu: dům, postava, vlna, dveře (poslední obraz).
  void _frame(Canvas c, int i, Offset m, Paint p) {
    switch (i) {
      case 0:
        c.drawRect(Rect.fromCenter(center: m + const Offset(0, 2), width: 10, height: 7), p);
        c.drawPath(
            Path()
              ..moveTo(m.dx - 6.5, m.dy - 1.5)
              ..lineTo(m.dx, m.dy - 6.5)
              ..lineTo(m.dx + 6.5, m.dy - 1.5),
            p);
      case 1:
        c.drawCircle(m + const Offset(0, -4), 2.2, p);
        c.drawLine(m + const Offset(0, -1.8), m + const Offset(0, 3), p);
        c.drawLine(m + const Offset(-4, 0.5), m + const Offset(4, 0.5), p);
        c.drawLine(m + const Offset(0, 3), m + const Offset(-3, 6.5), p);
        c.drawLine(m + const Offset(0, 3), m + const Offset(3, 6.5), p);
      case 2:
        for (final dy in [-2.0, 2.5]) {
          final wave = Path()..moveTo(m.dx - 8, m.dy + dy);
          for (var k = 0; k < 4; k++) {
            wave.quadraticBezierTo(m.dx - 6 + k * 4, m.dy + dy + (k.isEven ? -2.5 : 2.5), m.dx - 4 + k * 4, m.dy + dy);
          }
          c.drawPath(wave, p);
        }
      default:
        c.drawRect(Rect.fromCenter(center: m + const Offset(0, 0.5), width: 8, height: 13), p);
        c.drawCircle(m + const Offset(2, 1.5), 0.9, fill(p.color));
    }
  }
}

/// Návrat do snu bez pohybu: hypnogram noci s krátkým probuzením na konci pozdního REM, ve výřezu cesta zpět do scény.
class _Deild extends _Art with _T1Ink {
  _Deild(super.skin, super.l, super.clock);

  /// (minuta od usnutí, úroveň) 0 bdění, 1 REM, 2 lehký, 3 hluboký. Ilustrativní noc: N3 hlavně v první třetině,
  /// REM k ránu delší, krátká probuzení normální. Na 446. minutě probuzení z pozdního REM, od 449. zpět v REM.
  static const _night = [
    (0, 0), (9, 2), (22, 3), (60, 2), (76, 1), (86, 2), (104, 3), (136, 2), (160, 1), (178, 2), //
    (196, 3), (212, 2), (246, 1), (270, 2), (280, 0), (283, 2), (334, 1), (362, 2), (404, 1), (446, 0), //
    (449, 1), (474, 0),
  ];
  static const _end = 480;
  static const _z0 = 432, _z1 = 472;

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    const left = 52.0;
    final right = w - 8;
    double x(num m) => left + (right - left) * m / _end;
    const ys = [28.0, 44.0, 60.0, 76.0];

    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);
    const keys = ['wake', 'rem', 'light', 'deep'];
    for (var k = 0; k < 4; k++) {
      c.drawLine(Offset(left, ys[k]), Offset(right, ys[k]), stroke(skin.line, 1));
      label(c, keys[k], Offset(0, ys[k]), color: k == 1 ? skin.accentText : skin.muted);
    }
    for (var h = 0; h <= 8; h++) {
      c.drawLine(Offset(x(h * 60), ys[3] + 3), Offset(x(h * 60), ys[3] + 6), stroke(skin.lineStrong, 1));
    }

    // Výřez kolem probuzení.
    final zr = Rect.fromLTRB(x(_z0), ys[0] - 6, x(_z1), ys[3] + 2);
    c.drawRect(zr, fill(skin.accent.withValues(alpha: 0.08)));
    c.drawRect(zr, stroke(skin.accent.withValues(alpha: 0.6), 1));

    final hyp = Path()..moveTo(x(0), ys[0]);
    for (var i = 0; i < _night.length; i++) {
      final (m, k) = _night[i];
      final next = i + 1 < _night.length ? _night[i + 1].$1 : _end;
      hyp
        ..lineTo(x(m), ys[k])
        ..lineTo(x(next), ys[k]);
    }
    c.drawPath(hyp, stroke(skin.muted, 1));
    for (var i = 0; i < _night.length; i++) {
      final (m, k) = _night[i];
      if (k == 1) {
        final next = i + 1 < _night.length ? _night[i + 1].$1 : _end;
        c.drawLine(Offset(x(m), ys[1]), Offset(x(next), ys[1]), stroke(skin.accent, 2));
      }
    }

    // Přiblížený výřez: REM, pár minut bdění, čárkovaná cesta zpět do REM.
    final px0 = math.max(w * 0.44, 150.0), px1 = w - 8;
    const zw = 110.0, zrem = 138.0, zy0 = 96.0;
    double zx(num m) => px0 + (px1 - px0) * (m - _z0) / (_z1 - _z0);
    c.drawLine(Offset(zr.left, zr.bottom), Offset(px0, zy0), stroke(skin.accent.withValues(alpha: 0.35), 1));
    c.drawLine(Offset(zr.right, zr.bottom), Offset(px1, zy0), stroke(skin.accent.withValues(alpha: 0.35), 1));

    c.drawLine(Offset(zx(_z0), zrem), Offset(zx(446), zrem), stroke(skin.accent, 2));
    final wake = Path()
      ..moveTo(zx(446), zrem)
      ..lineTo(zx(446), zw)
      ..lineTo(zx(449), zw);
    c.drawPath(wake, stroke(skin.text));
    final back = Path()
      ..moveTo(zx(449), zw)
      ..cubicTo(zx(450.5), zw, zx(450.5), zrem, zx(452.5), zrem);
    t1Dashed(c, back, stroke(skin.accent, 1.5), dash: 3, gap: 2.5);
    c.drawLine(Offset(zx(452.5), zrem), Offset(zx(_z1), zrem), stroke(skin.accent, 2));
    final dot = live ? 446 + (t / 0.6) % 26 : 447.5;
    final dp = dot < 449
        ? Offset(zx(dot), zw)
        : (dot < 452.5
            ? back
                .computeMetrics()
                .first
                .getTangentForOffset(back.computeMetrics().first.length * (dot - 449) / 3.5)!
                .position
            : Offset(zx(dot), zrem));
    c.drawCircle(dp, 2.6, fill(skin.text));

    label(c, 'awakening', Offset(zx(446) - 6, zw), align: 1, color: skin.text);
    label(c, 'rem', Offset(px0, zrem + 12), color: skin.accentText);
    label(c, 'back', Offset(zx(453) + 4, (zw + zrem) / 2), color: skin.accentText);
    final bar0 = px1 - (px1 - px0) * 5 / (_z1 - _z0);
    c.drawLine(Offset(bar0, 156), Offset(px1, 156), stroke(skin.muted, 1));
    for (final bx in [bar0, px1]) {
      c.drawLine(Offset(bx, 153), Offset(bx, 159), stroke(skin.muted, 1));
    }
    label(c, 'fiveMin', Offset(bar0 - 6, 156), align: 1);

    // Tělo zůstává bez hnutí, oči zavřené.
    const r = 8.2;
    const o = Offset(16, 126);
    t1Sleeper(c, o, r, stroke(skin.text), stroke(skin.lineStrong, 1));
    label(c, 'eyes', const Offset(0, 102));
    label(c, 'still', const Offset(0, 164), color: skin.text);
  }
}

/// Prsty jako na klavíru: uvolněná opřená pravá ruka střídá ukazovák a prostředník, nahoře úzké okno na hraně spánku a test reality.
class _Fild extends _Art with _T1Ink {
  _Fild(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    const lx = 70.0, yW = 34.0, yE = 60.0, yS = 84.0;
    final xa = w * 0.42, xt = w * 0.68;

    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);
    c.drawLine(const Offset(lx, yW), Offset(w - 8, yW), stroke(skin.line, 1));
    c.drawLine(const Offset(lx, yS), Offset(w - 8, yS), stroke(skin.line, 1));
    t1Dashed(
        c,
        Path()
          ..moveTo(lx, yE)
          ..lineTo(w - 8, yE),
        stroke(skin.lineStrong, 1),
        dash: 2,
        gap: 3);
    label(c, 'wake', const Offset(0, yW));
    label(c, 'edge', const Offset(0, yE), color: skin.accentText);
    label(c, 'sleep', const Offset(0, yS));

    // Úzké okno, ve kterém pohyb drží pozornost na hraně.
    final band = Rect.fromLTRB(xa - 6, yW + 5, xt + 8, yS - 5);
    c.drawRect(band, fill(skin.accent.withValues(alpha: 0.08)));
    label(c, 'window', Offset(band.center.dx, yS + 14), align: 0.5, color: skin.accentText);
    label(c, 'duration', Offset(xa, yW + 10), color: skin.muted);

    // Budík, pak ospalost klesá k hraně, drží se na ní a po testu přejde do spánku.
    _alarm(c, const Offset(lx + 10, 16));
    label(c, 'alarm', const Offset(lx + 22, 16));
    final x0 = lx + 10;
    final curve = Path()
      ..moveTo(x0, yW)
      ..cubicTo(x0 + (xa - x0) * 0.45, yW, xa - (xa - x0) * 0.3, yE, xa, yE);
    final hover = <Offset>[];
    for (var x = xa; x <= xt; x += 1.5) {
      final y = yE + 1.4 * math.sin((x - xa) / 3.2);
      hover.add(Offset(x, y));
      curve.lineTo(x, y);
    }
    final xs = xt + w * 0.12;
    curve.cubicTo(xt + w * 0.05, yE, xs - w * 0.05, yS, xs, yS);
    curve.lineTo(w - 8, yS);
    c.drawPath(curve, stroke(skin.text, 1.3));
    final tap = live ? ((t / 0.6).floor() % 2) : 0;
    var k = 0;
    for (var x = xa + 4; x < xt - 3; x += 5.5) {
      final up = k.isEven;
      final on = (k % 2) == tap;
      final y = yE + 1.4 * math.sin((x - xa) / 3.2);
      c.drawLine(
          Offset(x, y + (up ? -3.5 : 3.5)), Offset(x, y + (up ? -6.5 : 6.5)), stroke(on ? skin.accent : skin.faint, 1));
      k++;
    }
    c.drawCircle(Offset(xt, yE), 3, fill(skin.bg));
    c.drawCircle(Offset(xt, yE), 3, stroke(skin.accent, 1.4));
    _lips(c, Offset(xt, yW + 12));
    label(c, 'test', Offset(xt + 12, yW + 12), color: skin.text);

    // Pravá ruka dlaní dolů, opřená, prsty míří doprava; palec nahoře.
    final fingers = _hand(c, const Offset(24, 136));
    final (iTip, iDir) = fingers[0];
    final (mTip, mDir) = fingers[1];
    final active = live ? ((t / 0.6).floor() % 2) : 0;
    for (final (i, tip, dir) in [(0, iTip, iDir), (1, mTip, mDir)]) {
      final on = i == active;
      for (var j = 0; j < 2; j++) {
        final ctr = tip + dir * (3.5 + j * 3.2);
        c.drawArc(Rect.fromCircle(center: ctr, radius: 3.2 + j * 1.2), math.atan2(dir.dy, dir.dx) - 0.75, 1.5, false,
            stroke((on ? skin.accent : skin.faint).withValues(alpha: on ? 1 - j * 0.35 : 0.8), 1));
      }
    }
    label(c, 'index', Offset(iTip.dx + 15, iTip.dy), color: active == 0 ? skin.accentText : skin.muted);
    label(c, 'middle', Offset(mTip.dx + 15, mTip.dy + 1), color: active == 1 ? skin.accentText : skin.muted);
    label(c, 'rest', const Offset(0, 168));
  }

  void _alarm(Canvas c, Offset o) {
    final p = stroke(skin.muted, 1);
    c.drawCircle(o, 5.5, p);
    c.drawLine(o, o + const Offset(0, -3.2), p);
    c.drawLine(o, o + const Offset(2.4, 0.8), p);
    c.drawArc(Rect.fromCircle(center: o + const Offset(-4.6, -4.6), radius: 2.6), 2.4, 2.6, false, p);
    c.drawArc(Rect.fromCircle(center: o + const Offset(4.6, -4.6), radius: 2.6), -2.0, 2.6, false, p);
    c.drawLine(o + const Offset(-3.5, 4.5), o + const Offset(-5, 6.5), p);
    c.drawLine(o + const Offset(3.5, 4.5), o + const Offset(5, 6.5), p);
  }

  /// Zavřené rty a pokus o nádech ústy.
  void _lips(Canvas c, Offset o) {
    final p = stroke(skin.accent, 1.1);
    c.drawPath(
        Path()
          ..moveTo(o.dx - 7, o.dy)
          ..quadraticBezierTo(o.dx - 3, o.dy - 3.6, o.dx, o.dy - 1.6)
          ..quadraticBezierTo(o.dx + 3, o.dy - 3.6, o.dx + 7, o.dy)
          ..quadraticBezierTo(o.dx, o.dy + 4.6, o.dx - 7, o.dy),
        p);
    c.drawLine(Offset(o.dx - 6.5, o.dy), Offset(o.dx + 6.5, o.dy), p);
  }

  /// Hřbet pravé ruky dlaní dolů: jeden obrys od zápěstí kolem prstů po palec, nehty, kloubní vrásky, šlachy.
  /// Proporce: dlaň po klouby ~0,48 délky ruky, prostředník od kloubu ~0,52; palec se dvěma články.
  /// Vrací konečky a směry ukazováku a prostředníku.
  List<(Offset, Offset)> _hand(Canvas c, Offset wrist) {
    const lp = 40.0, wp = 38.0;
    const u = wp / 4;
    final cy = wrist.dy, mcpX = wrist.dx + lp;
    // (osa y báze, posun MCP v ose x, úhel, délka od MCP, šířka) pro ukazovák, prostředník, prsteník, malík.
    const f = [
      (-1.5 * u, -1.0, -0.09, 40.0, 8.4),
      (-0.5 * u, 0.0, -0.02, 44.0, 8.7),
      (0.5 * u, -1.5, 0.05, 41.0, 8.1),
      (1.5 * u, -6.0, 0.13, 33.0, 7.0),
    ];
    Offset base(int i) => Offset(mcpX + f[i].$2, cy + f[i].$1);
    Offset dir(int i) => Offset(math.cos(f[i].$3), math.sin(f[i].$3));
    Offset nrm(int i) => Offset(-math.sin(f[i].$3), math.cos(f[i].$3));
    double wid(int i, double sf) => f[i].$5 * (1 - 0.14 * sf);
    Offset along(int i, double sf, [double across = 0]) => base(i) + dir(i) * (f[i].$4 * sf) + nrm(i) * across;
    Offset side(int i, double sf, double sign) => along(i, sf, sign * wid(i, sf) / 2);
    List<Offset> finger(int i, double fromLow, double fromHigh) {
      final len = f[i].$4, tipR = wid(i, 1) / 2;
      final end = 1 - tipR / len;
      return [
        for (final sf in [fromLow, (fromLow + end) / 2, end]) side(i, sf, 1),
        for (var a = 1; a < 6; a++)
          base(i) +
              dir(i) * (len * end) +
              (nrm(i) * math.cos(a * math.pi / 6) + dir(i) * math.sin(a * math.pi / 6)) * tipR,
        for (final sf in [end, (fromHigh + end) / 2, fromHigh]) side(i, sf, -1),
      ];
    }

    Offset web(int lower, int upper) => (side(lower, 0.22, -1) + side(upper, 0.22, 1)) / 2 - dir(lower) * 1.6;
    // Palec: od karpometakarpálního kloubu u zápěstí šikmo k ukazováku, uvolněně přitažený.
    final tb = Offset(wrist.dx + 4, cy - wp * 0.3);
    const ta = -0.33, tl = 46.0, tw = 11.0;
    final td = Offset(math.cos(ta), math.sin(ta)), tn = Offset(-math.sin(ta), math.cos(ta));
    Offset tAlong(double sf, [double across = 0]) => tb + td * (tl * sf) + tn * across;
    Offset ts(double sf, double sign) => tAlong(sf, sign * tw * (1 - 0.22 * sf) / 2);
    const tTipR = tw * 0.78 / 2, tEnd = 1 - tTipR / tl;

    final outline = <Offset>[
      Offset(wrist.dx, cy + wp * 0.36),
      Offset(wrist.dx + lp * 0.45, cy + wp / 2 + 1.4),
      ...finger(3, 0.1, 0.22),
      web(3, 2),
      ...finger(2, 0.22, 0.22),
      web(2, 1),
      ...finger(1, 0.22, 0.22),
      web(1, 0),
      ...finger(0, 0.22, 0.16),
      Offset(mcpX - lp * 0.14, cy - wp / 2 - 0.5),
      ts(0.56, 1),
      ts((0.56 + tEnd) / 2, 1),
      ts(tEnd, 1),
      for (var a = 1; a < 6; a++)
        tAlong(tEnd) + (tn * math.cos(a * math.pi / 6) + td * math.sin(a * math.pi / 6)) * tTipR,
      ts(tEnd, -1),
      ts(0.55, -1),
      ts(0.25, -1),
      Offset(wrist.dx + 1.5, cy - wp * 0.4),
    ];
    final skinLine = stroke(skin.text);
    c.drawPath(t1Smooth(outline), skinLine);
    // Předloktí k okraji plochy.
    c.drawLine(Offset(1, cy - wp * 0.4), outline.last, skinLine);
    c.drawLine(Offset(1, cy + wp * 0.36), outline.first, skinLine);

    final tendon = stroke(skin.line, 1);
    final crease = stroke(skin.muted, 0.8);
    final faint = stroke(skin.faint, 1);
    for (var i = 0; i < 4; i++) {
      // Šlacha natahovače od zápěstí ke kloubu.
      c.drawLine(Offset(wrist.dx + 7, cy + (i - 1.5) * 2.6), along(i, -0.08), tendon);
      final wd = f[i].$5;
      // Kloubní vrásky nad PIP a DIP, oblouček vypouklý k zápěstí.
      for (final (sf, k) in [(0.5, 0.24), (0.535, 0.18), (0.79, 0.2)]) {
        c.drawPath(t1Smooth([along(i, sf + 0.012, wd * k), along(i, sf), along(i, sf + 0.012, -wd * k)]), crease);
      }
      // Nehet na distální polovině posledního článku.
      final len = f[i].$4, hw = wd * 0.27;
      final n0 = 0.86, n1 = 1 - 1.5 / len;
      c.drawPath(
          t1Smooth([
            along(i, n0, hw * 0.6),
            along(i, n0 - 0.012),
            along(i, n0, -hw * 0.6),
            along(i, n1, -hw),
            along(i, n1, hw)
          ], closed: true),
          faint);
    }
    c.drawPath(t1Smooth([tAlong(0.77, 3), tAlong(0.76), tAlong(0.77, -3)]), crease);
    c.drawPath(
        t1Smooth([
          tAlong(0.85, 1.6),
          tAlong(0.84),
          tAlong(0.85, -2.6),
          tAlong(1 - 1.6 / tl, -2.6),
          tAlong(1 - 1.6 / tl, 1.6)
        ], closed: true),
        faint);

    return [(along(0, 1), dir(0)), (along(1, 1), dir(1))];
  }
}

/// Kritická reflexe podle Tholeye: na ose dne čtyři běžné spouštěče, u každého zastavení, otázky a ohlédnutí zpět v čase.
class _Ada extends _Art with _T1Ink {
  _Ada(super.skin, super.l, super.clock);

  /// (hodina dne, klíč). Nepravidelně, ne každou hodinu.
  static const _triggers = [(8.2, 'door'), (11.4, 'clock'), (14.6, 'water'), (17.9, 'tea')];

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    double x(double h) => 16 + (w - 32) * (h - 7) / 15.5;
    const ly = 118.0, iy = 92.0, ny = 70.0;

    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);
    c.drawLine(Offset(x(7), ly), Offset(x(22.5), ly), stroke(skin.lineStrong, 1));
    for (var h = 7; h <= 22; h++) {
      c.drawLine(Offset(x(h.toDouble()), ly - 2), Offset(x(h.toDouble()), ly + 2), stroke(skin.line, 1));
    }
    for (final h in [7, 12, 17, 22]) {
      paintText(c, '$h', mono(size: 9), Offset(x(h.toDouble()), 160), align: 0.5);
    }

    final active = live ? (t / 5).floor() % 4 : 2;
    for (var i = 0; i < _triggers.length; i++) {
      final (h, key) = _triggers[i];
      final on = i == active;
      final col = on ? skin.text : skin.muted;
      final p = Offset(x(h), iy);
      switch (i) {
        case 0:
          _door(c, p, stroke(col, 1));
        case 1:
          _clock(c, p, h, stroke(col, 1));
        case 2:
          _glass(c, p, stroke(col, 1));
        default:
          _tea(c, p, stroke(col, 1));
      }
      label(c, key, Offset(p.dx, ny), align: 0.5, color: on ? skin.text : skin.muted);
      if (on) {
        c.drawCircle(Offset(p.dx, ly), 7, fill(skin.accent.withValues(alpha: 0.16)));
      }
      c.drawCircle(Offset(p.dx, ly), 3.2, fill(skin.bg));
      c.drawCircle(Offset(p.dx, ly), 3.2, stroke(on ? skin.accent : skin.muted, on ? 1.5 : 1));
    }

    // Večerní zápis jedním slovem.
    final nb = Offset(x(21.6), iy);
    c.drawRect(Rect.fromCenter(center: nb, width: 12, height: 16), stroke(skin.muted, 1));
    for (var k = 0; k < 3; k++) {
      c.drawCircle(Offset(nb.dx - 6, nb.dy - 5 + k * 5), 1, fill(skin.muted));
    }
    c.drawLine(nb + const Offset(-2, -2), nb + const Offset(3.5, -2), stroke(skin.faint, 1));
    c.drawLine(Offset(nb.dx, ly - 3), Offset(nb.dx, ly + 3), stroke(skin.muted, 1));
    label(c, 'note', Offset(nb.dx, ny), align: 0.5);

    // Otázky u aktivního spouštěče a ohlédnutí zpět po ose.
    final (h, _) = _triggers[active];
    final ax = x(h);
    final bx = ax.clamp(58.0, w - 58);
    final bubble = RRect.fromRectAndRadius(Rect.fromLTRB(bx - 56, 19, bx + 56, 55), const Radius.circular(6));
    c.drawRRect(bubble, fill(skin.accent.withValues(alpha: 0.06)));
    c.drawRRect(bubble, stroke(skin.accent.withValues(alpha: 0.7), 1));
    c.drawLine(Offset(ax - 4, 55), Offset(ax, 60), stroke(skin.accent.withValues(alpha: 0.7), 1));
    c.drawLine(Offset(ax + 4, 55), Offset(ax, 60), stroke(skin.accent.withValues(alpha: 0.7), 1));
    label(c, 'ask', Offset(bx, 29), align: 0.5, color: skin.accentText);
    label(c, 'perceive', Offset(bx, 44), align: 0.5, color: skin.text);

    final span = math.min(1.9, h - 7.3);
    final back = x(h - span);
    final arc = Path()
      ..moveTo(ax - 4, ly + 3)
      ..quadraticBezierTo((ax + back) / 2, ly + 22, back + 2, ly + 4);
    t1Dashed(c, arc, stroke(skin.accent, 1.3), dash: 3, gap: 2.5);
    arrowHead(c, Offset(back + 2, ly + 4), const Offset(-0.45, -0.89), stroke(skin.accent, 1.3), 5);
    for (final dh in [span * 0.37, span * 0.74]) {
      c.drawCircle(Offset(x(h - dh), ly), 1.6, fill(skin.accent));
    }
    c.drawCircle(Offset(back, ly), 1.6, fill(skin.accent));
    label(c, 'lookBack', Offset(math.max((ax + back) / 2, 34), ly + 26), align: 0.5, color: skin.text);
  }

  void _door(Canvas c, Offset o, Paint p) {
    c.drawRect(Rect.fromCenter(center: o, width: 13, height: 18), p);
    c.drawPath(
        Path()
          ..moveTo(o.dx - 6.5, o.dy - 9)
          ..lineTo(o.dx + 1.5, o.dy - 6.5)
          ..lineTo(o.dx + 1.5, o.dy + 10.5)
          ..lineTo(o.dx - 6.5, o.dy + 9),
        p);
    c.drawCircle(o + const Offset(-0.5, 1), 0.9, fill(p.color));
  }

  void _clock(Canvas c, Offset o, double h, Paint p) {
    c.drawCircle(o, 8.5, p);
    for (var k = 0; k < 12; k += 3) {
      final a = k * math.pi / 6;
      c.drawLine(o + Offset(math.sin(a), -math.cos(a)) * 6.5, o + Offset(math.sin(a), -math.cos(a)) * 8, p);
    }
    final ha = (h % 12) / 12 * 2 * math.pi, ma = (h % 1) * 2 * math.pi;
    c.drawLine(o, o + Offset(math.sin(ha), -math.cos(ha)) * 4, stroke(p.color, 1.3));
    c.drawLine(o, o + Offset(math.sin(ma), -math.cos(ma)) * 6, p);
  }

  void _glass(Canvas c, Offset o, Paint p) {
    c.drawPath(
        Path()
          ..moveTo(o.dx - 6.5, o.dy - 9)
          ..lineTo(o.dx - 5, o.dy + 9)
          ..lineTo(o.dx + 5, o.dy + 9)
          ..lineTo(o.dx + 6.5, o.dy - 9),
        p);
    final water = Path()..moveTo(o.dx - 6, o.dy - 2);
    water
      ..quadraticBezierTo(o.dx - 3, o.dy - 4, o.dx, o.dy - 2)
      ..quadraticBezierTo(o.dx + 3, o.dy, o.dx + 6, o.dy - 2);
    c.drawPath(water, p);
    c.drawCircle(o + const Offset(-1.5, 4), 0.9, p);
    c.drawCircle(o + const Offset(2, 2), 0.7, p);
  }

  void _tea(Canvas c, Offset o, Paint p) {
    c.drawPath(
        Path()
          ..moveTo(o.dx - 7, o.dy - 2)
          ..lineTo(o.dx + 5, o.dy - 2)
          ..quadraticBezierTo(o.dx + 5, o.dy + 7, o.dx - 1, o.dy + 7)
          ..quadraticBezierTo(o.dx - 7, o.dy + 7, o.dx - 7, o.dy - 2),
        p);
    c.drawArc(Rect.fromCircle(center: o + const Offset(5.5, 1.5), radius: 2.8), -1.4, 2.9, false, p);
    c.drawLine(o + const Offset(-9, 9.5), o + const Offset(7, 9.5), p);
    for (final dx in [-3.5, 0.5]) {
      c.drawPath(
          Path()
            ..moveTo(o.dx + dx, o.dy - 4.5)
            ..quadraticBezierTo(o.dx + dx - 2, o.dy - 7, o.dx + dx, o.dy - 9)
            ..quadraticBezierTo(o.dx + dx + 2, o.dy - 11, o.dx + dx, o.dy - 12.5),
          stroke(p.color, 0.9));
    }
  }
}

/// Jóga nidra: postava na zádech shora, pozornost prochází tělem v daném pořadí, výdech delší než nádech; relaxace, ne indukce.
class _YogaNidra extends _Art with _T1Ink {
  _YogaNidra(super.skin, super.l, super.clock);

  /// Levá polovina obrysu trupu a nohy (pravá strana ležícího), od krku po rozkrok; x od osy těla.
  static const _torso = [
    Offset(-3.9, 34.6), Offset(-4.4, 39), Offset(-5.4, 43), Offset(-11, 46.2), Offset(-16, 48.6), Offset(-15.8, 53.5),
    Offset(-13.4, 58), //
    Offset(-13.2, 66), Offset(-11.2, 77), Offset(-13.2, 87), Offset(-14.4, 95), Offset(-13.6, 107),
    Offset(-11.4, 127), //
    Offset(-11.8, 139), Offset(-9.2, 156), Offset(-12.6, 161.5), Offset(-12.2, 166.5), Offset(-7.6, 165),
    Offset(-6.2, 157), //
    Offset(-5.6, 140), Offset(-4.8, 127), Offset(-3.4, 106), Offset(0, 96.5),
  ];

  /// Pravá paže ležícího (vlevo na obrázku), mírně od těla, dlaň vzhůru, palec ven.
  static const _arm = [
    Offset(-16.6, 48.4), Offset(-20.2, 53), Offset(-22.6, 64), Offset(-25.4, 77), Offset(-28.8, 87.5),
    Offset(-31.8, 95), //
    Offset(-34.6, 96.8), Offset(-38, 101.4), Offset(-36.4, 102.4), Offset(-35.8, 106), Offset(-35.2, 112.2), //
    Offset(-32.6, 112.8), Offset(-30.8, 104.5), Offset(-29.2, 96), Offset(-25.4, 86), Offset(-21.6, 76.4),
    Offset(-17.6, 64), //
    Offset(-14.4, 57.6),
  ];

  @override
  void paint(Canvas c, Size s) {
    final w = s.width, cx = w / 2;
    Offset at(Offset p, [double side = 1]) => Offset(cx + p.dx * side, p.dy);

    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);

    // Podložka.
    final mat = RRect.fromRectAndRadius(Rect.fromLTRB(cx - 43, 13, cx + 43, 172), const Radius.circular(5));
    c.drawRRect(mat, fill(skin.panelAlt.withValues(alpha: 0.2)));
    c.drawRRect(mat, stroke(skin.line, 1));

    // Pořadí: 1 pravá ruka, 2 pravá noha, 3 levá ruka, 4 levá noha, 5 záda, 6 břicho, 7 obličej, 8 celé tělo.
    final active = live ? (t / 2.5).floor() % 8 : 0;
    final body = stroke(active == 7 ? skin.accent : (skin.redOnly ? skin.muted : skin.text));
    final outline = [for (final p in _torso) at(p), for (final p in _torso.reversed.skip(1)) at(p, -1)];
    c.drawPath(t1Smooth(outline.sublist(0, outline.length - 1), closed: true), body);
    for (final side in [1.0, -1.0]) {
      final hot = (side == 1 && active == 0) || (side == -1 && active == 2);
      c.drawPath(t1Smooth([for (final p in _arm) at(p, side)], closed: true), hot ? stroke(skin.accent, 1.3) : body);
      // Klíční kost, čéška.
      c.drawPath(
          t1Smooth([
            at(const Offset(-2, 46.4), side),
            at(const Offset(-7, 46.8), side),
            at(const Offset(-12.5, 47.6), side)
          ]),
          stroke(skin.faint, 1));
      c.drawOval(
          Rect.fromCenter(center: at(const Offset(-8.2, 126.5), side), width: 4, height: 4.8), stroke(skin.faint, 1));
      final legHot = (side == 1 && active == 1) || (side == -1 && active == 3);
      if (legHot) {
        c.drawPath(t1Smooth([for (final p in _torso.sublist(10)) at(p, side)]), stroke(skin.accent, 1.3));
      }
    }
    // Hlava shora: zavřené oči, nos, ústa, uši.
    const hc = Offset(0, 25.6);
    final head = Rect.fromCenter(center: at(hc), width: 14.6, height: 18.6);
    c.drawOval(head, active == 6 ? stroke(skin.accent, 1.3) : body);
    for (final side in [1.0, -1.0]) {
      c.drawArc(Rect.fromCenter(center: at(const Offset(-3, 24.2), side), width: 3.6, height: 2.4), 0.2, math.pi - 0.4,
          false, stroke(skin.muted, 0.9));
      c.drawArc(Rect.fromCenter(center: at(const Offset(-7.4, 25.6), side), width: 2.6, height: 5),
          side > 0 ? 1.57 : -1.57, math.pi, false, stroke(skin.muted, 0.9));
    }
    c.drawLine(at(const Offset(0, 25.8)), at(const Offset(0.5, 28.6)), stroke(skin.muted, 0.9));
    c.drawLine(at(const Offset(-2, 31.4)), at(const Offset(2, 31.4)), stroke(skin.muted, 0.9));
    // Záda zespodu: páteř jako skrytá čára; pupek.
    t1Dashed(
        c,
        Path()
          ..moveTo(cx, 44)
          ..lineTo(cx, 92),
        stroke(active == 4 ? skin.accent : skin.lineStrong, 1),
        dash: 2,
        gap: 2.5);
    c.drawCircle(Offset(cx, 78), 1, stroke(active == 5 ? skin.accent : skin.muted, 1));
    if (active == 5) {
      c.drawCircle(Offset(cx, 78), 6, fill(skin.accent.withValues(alpha: 0.14)));
    }

    // U pravé ruky pořadí prsty, dlaň, paže.
    if (active == 0) {
      for (final p in [
        const Offset(-33.8, 109.6),
        const Offset(-33.2, 102.6),
        const Offset(-27.4, 88),
        const Offset(-21.4, 67)
      ]) {
        c.drawCircle(at(p), 1.5, fill(skin.accent));
      }
    }

    // Popisky: vlevo pravá strana ležícího, vpravo levá.
    final lc = cx - 53, rc = cx + 53;
    void station(int i, String key, double y, Offset target, bool leftSide) {
      final on = i == active;
      final n = '${i + 1}';
      final col = on ? skin.accentText : skin.faint;
      final lineEnd = leftSide ? lc + 6 : rc - 6;
      c.drawLine(Offset(lineEnd, y), target, stroke(on ? skin.accent : skin.line, 1));
      paintText(c, n, mono(color: col, weight: FontWeight.w600), Offset(leftSide ? lc : rc, y),
          align: leftSide ? 1 : 0);
      label(c, key, Offset(leftSide ? lc - 11 : rc + 11, y),
          align: leftSide ? 1 : 0, color: on ? skin.text : skin.muted);
    }

    station(6, 'face', 28, at(const Offset(-7.6, 27)), true);
    station(4, 'back', 62, at(const Offset(0, 62)), true);
    station(0, 'rightHand', 104, at(const Offset(-38.6, 104)), true);
    label(c, 'rightHandParts', Offset(lc - 11, 116),
        align: 1, color: active == 0 ? skin.accentText : skin.faint, size: 8.5);
    station(1, 'rightLeg', 146, at(const Offset(-11.6, 146)), true);
    station(7, 'whole', 26, Offset(cx + 43, 26), false);
    station(5, 'belly', 80, at(const Offset(0, 80)), false);
    station(2, 'leftHand', 104, at(const Offset(-38.6, 104), -1), false);
    station(3, 'leftLeg', 146, at(const Offset(-11.6, 146), -1), false);

    // Dech: krátký nádech, dlouhý výdech.
    final bx0 = rc + 2, bx1 = math.min(w - 6, rc + 96);
    const by0 = 40.0, by1 = 52.0;
    final bw = bx1 - bx0;
    final breath = Path()..moveTo(bx0, by1);
    breath
      ..cubicTo(bx0 + bw * 0.12, by1, bx0 + bw * 0.16, by0, bx0 + bw * 0.3, by0)
      ..cubicTo(bx0 + bw * 0.5, by0, bx0 + bw * 0.75, by1, bx1, by1);
    c.drawPath(breath, stroke(skin.muted));
    final ex = Path()..moveTo(bx0 + bw * 0.3, by0);
    ex.cubicTo(bx0 + bw * 0.5, by0, bx0 + bw * 0.75, by1, bx1, by1);
    c.drawPath(ex, stroke(skin.accent, 1.4));
    final m = breath.computeMetrics().first;
    final dot = m.getTangentForOffset(m.length * (live ? (t / 6) % 1 : 0.62))!.position;
    c.drawCircle(dot, 2.2, fill(skin.text));
    label(c, 'exhale', Offset(bx0, 64), color: skin.accentText);
  }
}

/// Uzemnění: sedící s chodidly na zemi, po schodech dolů smysly 5 vidím, 4 dotýkám se, 3 slyším, dlouhý výdech, kde a kdy jsem.
class _Grounding extends _Art with _T1Ink {
  _Grounding(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    final w = s.width;
    const floor = 160.0;
    label(c, 'caption', Offset(w, 10), align: 1, color: skin.faint, size: 8.5);

    // Podlaha a židle; postava je kreslená v souřadnicích 1 : 1,3 od paty židle.
    Offset q(double x, double y) => Offset(14 + (x - 14) * 1.3, floor + (y - floor) * 1.3);
    c.drawLine(const Offset(4, floor), Offset(w - 4, floor), stroke(skin.lineStrong, 1));
    final chair = stroke(skin.lineStrong);
    c.drawLine(q(12, 123), q(50, 123), chair);
    c.drawLine(q(13, 123), q(10, 84), chair);
    c.drawLine(q(14, 123), q(14, floor), chair);
    c.drawLine(q(48, 123), q(48, floor), chair);

    // Sedící z profilu, obličejem doprava: záda opřená, kyčle a kolena v pravém úhlu, chodidla celou plochou na zemi.
    final body = stroke(skin.text);
    final ho = q(31, 68);
    t1Head(c, ho, 8 * 1.3, body, eyesOpen: true);
    c.drawPath(t1Smooth([q(27, 78.4), q(23.4, 86), q(22.4, 98), q(24, 110), q(21.8, 118), q(24, 122.4)]), body);
    c.drawPath(t1Smooth([q(33.1, 78.8), q(37.6, 88), q(38.4, 98), q(37.4, 106), q(40, 113.4)]), body);
    // Stehno a bérec.
    c.drawPath(
        t1Smooth([q(40, 113.4), q(50, 113.2), q(60, 113.4), q(63.6, 117.4), q(62.6, 124), q(60.4, 140), q(60, 152.4)]),
        body);
    c.drawPath(t1Smooth([q(24, 122.4), q(40, 122.6), q(53.6, 122.6), q(53, 132), q(54.6, 144), q(55, 152.6)]), body);
    // Chodidlo: pata, klenba, prsty.
    c.drawPath(t1Smooth([q(60, 152.4), q(66, 155.2), q(72.6, 157.6), q(74, 159.6)]), body);
    c.drawPath(t1Smooth([q(55, 152.6), q(53.4, 157.4), q(55, 159.6)]), body);
    c.drawLine(q(54.4, floor), q(74, floor), stroke(skin.accent, 2.2));
    // Paže: deltový sval, loket u boku, předloktí a dlaň položená na stehně u kolena.
    c.drawPath(
        t1Smooth([
          q(33.6, 83.4),
          q(30.4, 81.6),
          q(27.6, 84),
          q(26.6, 94),
          q(28, 104.4),
          q(32, 107.6),
          q(40, 109.6),
          q(48, 111.2),
          q(55, 112.4),
          q(60, 113.2),
          q(62.4, 115.6)
        ]),
        body);
    c.drawPath(
        t1Smooth([
          q(33.6, 83.4),
          q(35.2, 90),
          q(35.6, 98),
          q(36.2, 102.6),
          q(42, 104.8),
          q(49, 106.6),
          q(55.6, 107.6),
          q(60.4, 109.6),
          q(63.2, 112.4),
          q(62.4, 115.6)
        ]),
        body);
    label(c, 'feet', const Offset(4, 170), color: skin.accentText);

    // Schody dolů: pět kroků k zemi.
    final x0 = math.max(w * 0.3, 98.0);
    final dx = (w - 84 - x0) / 4;
    const keys = ['see', 'touch', 'hear', 'exhale', 'where'];
    final active = live ? (t / 4).floor() % 5 : 0;
    for (var i = 0; i < 5; i++) {
      final p = Offset(x0 + i * dx, 26 + i * 25.5);
      final on = i == active;
      final col = on ? skin.accent : skin.muted;
      if (i < 4) {
        final nx = Offset(x0 + (i + 1) * dx, 26 + (i + 1) * 25.5);
        t1Dashed(
            c,
            Path()
              ..moveTo(p.dx, p.dy + 12)
              ..lineTo(p.dx, nx.dy)
              ..lineTo(nx.dx - 12, nx.dy),
            stroke(skin.lineStrong, 1),
            dash: 2,
            gap: 2.5);
      } else {
        t1Dashed(
            c,
            Path()
              ..moveTo(p.dx, p.dy + 12)
              ..lineTo(p.dx, floor - 1),
            stroke(skin.lineStrong, 1),
            dash: 2,
            gap: 2.5);
      }
      if (on) {
        c.drawCircle(p, 11, fill(skin.accent.withValues(alpha: 0.12)));
      }
      c.drawCircle(p, 11, stroke(col, on ? 1.4 : 1));
      final ip = stroke(on ? skin.text : skin.muted, 1);
      switch (i) {
        case 0:
          _eye(c, p, ip);
        case 1:
          _palm(c, p, ip);
        case 2:
          _ear(c, p, ip);
        case 3:
          _breath(c, p, ip);
        default:
          _pin(c, p, ip);
      }
      var lx = p.dx + 16;
      if (i < 3) {
        paintText(c, '${5 - i}', mono(size: 11, color: on ? skin.accentText : skin.text, weight: FontWeight.w600),
            Offset(lx, p.dy));
        lx += 11;
      }
      label(c, keys[i], Offset(lx, p.dy), color: on ? skin.text : skin.muted);
    }
  }

  void _eye(Canvas c, Offset o, Paint p) {
    c.drawPath(
        Path()
          ..moveTo(o.dx - 7, o.dy)
          ..quadraticBezierTo(o.dx, o.dy - 7, o.dx + 7, o.dy)
          ..quadraticBezierTo(o.dx, o.dy + 7, o.dx - 7, o.dy),
        p);
    c.drawCircle(o, 2.6, p);
    c.drawCircle(o, 1, fill(p.color));
  }

  void _palm(Canvas c, Offset o, Paint p) {
    c.drawPath(
        t1Smooth([
          o + const Offset(-3.6, -1),
          o + const Offset(-4, 3.4),
          o + const Offset(-1, 6.4),
          o + const Offset(3, 5.6),
          o + const Offset(4.2, 1.4),
          o + const Offset(3.8, -1.4)
        ]),
        p);
    for (final (x, top) in [(-3.0, -5.6), (-1.0, -7.0), (1.2, -6.6), (3.2, -5.0)]) {
      c.drawLine(o + Offset(x, -1.2), o + Offset(x, top), p);
    }
    c.drawLine(o + const Offset(-3.8, 1.8), o + const Offset(-6.6, -1.4), p);
  }

  void _ear(Canvas c, Offset o, Paint p) {
    c.drawPath(
        t1Smooth([
          o + const Offset(-1.5, 6),
          o + const Offset(-4.4, 3),
          o + const Offset(-5, -2.6),
          o + const Offset(-2, -6.2),
          o + const Offset(1.8, -4.6),
          o + const Offset(1.6, -0.6),
          o + const Offset(-0.6, 1.8),
          o + const Offset(-0.2, 4)
        ]),
        p);
    for (var k = 0; k < 3; k++) {
      c.drawArc(Rect.fromCircle(center: o + const Offset(1, 0), radius: 3.4 + k * 2), -0.55, 1.1, false,
          stroke(p.color, 0.9));
    }
  }

  void _breath(Canvas c, Offset o, Paint p) {
    final path = Path()..moveTo(o.dx - 7.5, o.dy + 3);
    path
      ..cubicTo(o.dx - 6, o.dy + 3, o.dx - 5.5, o.dy - 4, o.dx - 3.5, o.dy - 4)
      ..cubicTo(o.dx, o.dy - 4, o.dx + 4, o.dy + 3, o.dx + 7.5, o.dy + 3);
    c.drawPath(path, p);
  }

  void _pin(Canvas c, Offset o, Paint p) {
    c.drawPath(
        Path()
          ..moveTo(o.dx, o.dy + 7)
          ..cubicTo(o.dx - 2.5, o.dy + 3, o.dx - 5.5, o.dy, o.dx - 5.5, o.dy - 2.2)
          ..arcToPoint(Offset(o.dx + 5.5, o.dy - 2.2), radius: const Radius.circular(5.5))
          ..cubicTo(o.dx + 5.5, o.dy, o.dx + 2.5, o.dy + 3, o.dx, o.dy + 7),
        p);
    c.drawCircle(o + const Offset(0, -2.2), 1.8, p);
  }
}
