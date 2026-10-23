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
    c.drawLine(Offset(arc.dx, 115), arc + const Offset(0, 2), stroke(skin.accent.withValues(alpha: 0.5), 1));
    final dm = p(0.31 + d, 0.06);
    label(c, 'breath', Offset(dm.dx, 124), align: 0.5, color: skin.accentText);
    c.drawLine(Offset(dm.dx, 115), dm + const Offset(0, 3), stroke(skin.accent.withValues(alpha: 0.5), 1));
    final fx = tip.dx + 9;
    label(c, 'finger', Offset(fx - 4, 124), color: skin.accentText);
    c.drawPath(Path()..addPolygon([Offset(fx, 115), Offset(fx, tip.dy + 3)], false), stroke(skin.accent.withValues(alpha: 0.5), 1));

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
    label(c, 'caption', Offset(s.width, 169), align: 1, size: 8.5, color: skin.faint);
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
        label(c, 'letterA', p(0.226, 0.128), align: 0.5, size: 8.5, color: skin.accentText);
      } else if (i == 1) {
        c.drawCircle(throat, 2.2 * pulse, fill(skin.accent));
        c.drawCircle(throat, 4.2, fill(skin.accent.withValues(alpha: 0.16)));
        label(c, 'letterA', p(0.212, 0.128), align: 0.5, size: 8.5, color: skin.accentText);
        c.drawCircle(heart, 3, stroke(skin.text, 1));
        c.drawCircle(heart, 1, fill(skin.text));
        label(c, 'letterA', p(0.33, 0.115), align: 0.5, size: 8.5, color: skin.text);
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
    (-0.05, 0.5), (0.18, 0.46), (0.31, 0.34), (0.36, 0.19), (0.33, 0.12), (0.5, -0.04), (0.38, -0.11), (0.4, -0.18), //
    (0.36, -0.23), (0.38, -0.28), (0.33, -0.34), (0.37, -0.44), (0.25, -0.52), (0.1, -0.56), (0.08, -0.72),
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
    // Krk přechází do hrudníku (nahoře) a zad (dole, na lůžku pod podložkou).
    c.drawPath(_smooth(hp([(0.08, -0.72), (0.1, -0.88), (0.18, -1.05)])), soft);
    c.drawPath(_smooth(hp([(-0.3, -0.75), (-0.55, -0.88), (-0.72, -1.0)])), soft);
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
