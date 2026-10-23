"""Generátor ikony_preview.html ze stejných řetězců jako Dart.

Čte:
  - ../ZADANI.md: první blok ```dart (stará sada, v zadání useknutá po `ssild`),
  - mission_icons_new.dart: mapa _glyphsNew (nová sada),
  - ../../ikony.svg.md: originály z kola 1 (jen do srovnávací sekce, ne do mřížky).
Volání _circle() a _rect() vyhodnocuje stejně jako pomocníci v Dartu, včetně
formátu double.toString() (12 -> "12.0").

Použití: python3 -I gen_ikony_preview.py [--json VÝSTUP.json]
"""
import html
import json
import math
import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
BRIEF = os.path.join(HERE, '..', 'ZADANI.md')
NEW = os.path.join(HERE, 'mission_icons_new.dart')
ORIG = os.path.join(HERE, '..', '..', 'ikony.svg.md')
OUT = os.path.join(HERE, 'ikony_preview.html')


# ---------- Dart double.toString() ----------
def dart_double(x):
    x = float(x)
    if math.isnan(x):
        return 'NaN'
    if math.isinf(x):
        return 'Infinity' if x > 0 else '-Infinity'
    if x == 0:
        return '-0.0' if math.copysign(1, x) < 0 else '0.0'
    # nejkratší zápis, který se vrátí na stejný double (jako Dart i JS)
    r = repr(x)
    sign = '-' if r.startswith('-') else ''
    r = r.lstrip('-')
    if 'e' in r:
        mant, exp = r.split('e')
        exp = int(exp)
    else:
        mant, exp = r, 0
    if '.' in mant:
        ip, fp = mant.split('.')
    else:
        ip, fp = mant, ''
    digits = (ip + fp).lstrip('0')
    lead_zeros = len(ip + fp) - len((ip + fp).lstrip('0'))
    point = len(ip) + exp - lead_zeros  # pozice desetinné čárky vůči `digits`
    digits = digits.rstrip('0') or '0'
    n = len(digits)
    if -6 < point <= 21:
        if point >= n:
            s = digits + '0' * (point - n) + '.0'
        elif point > 0:
            s = digits[:point] + '.' + digits[point:]
        else:
            s = '0.' + '0' * (-point) + digits
    else:
        e = point - 1
        m = digits[0] + ('.' + digits[1:] if n > 1 else '')
        s = m + 'e' + ('+' if e > 0 else '-') + str(abs(e))
    return sign + s


def circle(cx, cy, r):
    D = dart_double
    return f'M{D(cx - r)} {D(cy)}a{D(r)} {D(r)} 0 1 0 {D(2 * r)} 0a{D(r)} {D(r)} 0 1 0 {D(-2 * r)} 0z'


def rect(x, y, w, h, r):
    D = dart_double
    return (f'M{D(x + r)} {D(y)}h{D(w - 2 * r)}a{D(r)} {D(r)} 0 0 1 {D(r)} {D(r)}v{D(h - 2 * r)}'
            f'a{D(r)} {D(r)} 0 0 1 {D(-r)} {D(r)}'
            f'h{D(-(w - 2 * r))}a{D(r)} {D(r)} 0 0 1 {D(-r)} {D(-r)}v{D(-(h - 2 * r))}'
            f'a{D(r)} {D(r)} 0 0 1 {D(r)} {D(-r)}z')


# ---------- malý tokenizer a parser Dartu (jen to, co mapa glyfů používá) ----------
TOK = re.compile(r"""
    (?P<ws>\s+) | (?P<lc>//[^\n]*) | (?P<bc>/\*.*?\*/) |
    (?P<str>'(?:[^'\\\n]|\\.)*') |
    (?P<num>\d+(?:\.\d+)?|\.\d+) |
    (?P<id>[A-Za-z_]\w*) |
    (?P<sp>\.\.\.) |
    (?P<p>[{}\[\]()<>:,.=+\-;])
""", re.X | re.S)


def tokens(src):
    pos = 0
    out = []
    while pos < len(src):
        m = TOK.match(src, pos)
        if not m:
            raise SyntaxError(f'neznámý znak {src[pos]!r} na pozici {pos}')
        pos = m.end()
        k = m.lastgroup
        if k in ('ws', 'lc', 'bc'):
            continue
        out.append((k, m.group()))
    return out


class Truncated(Exception):
    pass


class P:
    def __init__(self, toks):
        self.t = toks
        self.i = 0

    def peek(self, k=0):
        if self.i + k >= len(self.t):
            raise Truncated()
        return self.t[self.i + k]

    def take(self, val=None):
        tok = self.peek()
        if val is not None and tok[1] != val:
            raise SyntaxError(f'čekal jsem {val!r}, mám {tok[1]!r}')
        self.i += 1
        return tok

    def number(self):
        neg = False
        if self.peek()[1] == '-':
            self.take()
            neg = True
        k, v = self.take()
        if k != 'num':
            raise SyntaxError(f'čekal jsem číslo, mám {v!r}')
        x = float(v)
        return -x if neg else x

    def term(self):
        k, v = self.peek()
        if k == 'str':
            s = ''
            while self.peek()[0] == 'str':
                lit = self.take()[1][1:-1]
                if '$' in lit:
                    raise SyntaxError('interpolace v řetězci cesty nečekám')
                s += lit.replace("\\'", "'").replace('\\\\', '\\')
            return s
        if v in ('_circle', '_rect'):
            self.take()
            self.take('(')
            args = [self.number()]
            while self.peek()[1] == ',':
                self.take()
                if self.peek()[1] == ')':
                    break
                args.append(self.number())
            self.take(')')
            if v == '_circle':
                assert len(args) == 3, args
                return circle(*args)
            assert len(args) == 5, args
            return rect(*args)
        raise SyntaxError(f'neznámý výraz {v!r}')

    def expr(self):
        s = self.term()
        while self.peek()[1] == '+':
            self.take()
            s += self.term()
        return s

    def part(self):
        if self.peek()[1] == 'const':
            self.take()
        self.take('_Part')
        self.take('(')
        d = self.expr()
        accent = fill = False
        while self.peek()[1] == ',':
            self.take()
            if self.peek()[1] == ')':
                break
            name = self.take()[1]
            self.take(':')
            val = self.take()[1]
            if name == 'accent':
                accent = val == 'true'
            elif name == 'fill':
                fill = val == 'true'
            else:
                raise SyntaxError(f'neznámý argument {name}')
        self.take(')')
        return {'d': d, 'accent': accent, 'fill': fill}

    def glyph_map(self, var):
        # najdi `NAME = {`
        while not (self.peek()[1] == var and self.peek(1)[1] == '='):
            self.i += 1
        self.take(var)
        self.take('=')
        self.take('{')
        glyphs = {}
        truncated = None
        try:
            while self.peek()[1] != '}':
                if self.peek()[0] == 'sp':  # ..._glyphsNew
                    self.take()
                    self.take()
                    if self.peek()[1] == ',':
                        self.take()
                    continue
                self.take('MissionGlyph')
                self.take('.')
                name = self.take()[1]
                self.take(':')
                if self.peek()[1] == 'const':
                    self.take()
                self.take('[')
                parts = []
                glyphs[name] = parts
                truncated = name
                while self.peek()[1] != ']':
                    parts.append(self.part())
                    if self.peek()[1] == ',':
                        self.take()
                self.take(']')
                truncated = None
                if self.peek()[1] == ',':
                    self.take()
        except Truncated:
            return glyphs, truncated or '(konec mapy)'
        return glyphs, None


def first_dart_block(md):
    m = re.search(r'```dart\n(.*?)```', md, re.S)
    return m.group(1)


def load():
    brief = open(BRIEF, encoding='utf-8').read()
    old_src = first_dart_block(brief)
    old_src = old_src[old_src.index('final Map<MissionGlyph'):]
    old, old_trunc = P(tokens(old_src)).glyph_map('_glyphs')
    new_src = open(NEW, encoding='utf-8').read()
    new, new_trunc = P(tokens(new_src)).glyph_map('_glyphsNew')
    assert new_trunc is None, 'nová mapa nesmí být useknutá'
    return old, old_trunc, new


def originals():
    md = open(ORIG, encoding='utf-8').read()
    md = md[:md.index('## Sprite')]
    out = {}
    for m in re.finditer(r'<svg [^>]*class="icon (icon-[\w-]+)"[^>]*>(.*?)</svg>', md, re.S):
        out[m.group(1)] = m.group(2).strip()
    return out


# ---------- HTML ----------
DAY = {'bg': '#04060C', 'line': '#E9EDF5', 'acc': '#FF5F1F'}
NIGHT = {'bg': '#000000', 'line': '#B3261E', 'acc': '#FF3B2F'}
NIGHT_SWAP = {'bg': '#000000', 'line': '#FF3B2F', 'acc': '#B3261E'}

LABELS = {
    'today': 'Dnes', 'journal': 'Deník', 'voice': 'Hlas', 'night': 'Noc', 'wbtb': 'WBTB',
    'realityTest': 'Test reality', 'mild': 'MILD', 'ssild': 'SSILD',
    'intention': 'Záměr', 'alarm': 'Budík', 'emotion': 'Emoce', 'lesson': 'Lekce',
    'starMap': 'Hvězdná mapa', 'dreamYoga': 'Jóga snu', 'falseAwakening': 'Falešné probuzení',
    'nightmare': 'Noční můra', 'lucidity': 'Lucidita', 'realityExplore': 'Zkoumání reality',
}


def svg(parts, size):
    els = []
    for p in parts:
        cls = ('a' if p['accent'] else 'l') + ('f' if p['fill'] else '')
        els.append(f'<path class="{cls}" d="{html.escape(p["d"])}"/>')
    return (f'<svg class="g" viewBox="0 0 24 24" width="{size}" height="{size}" aria-hidden="true">'
            + ''.join(els) + '</svg>')


def raw_svg(inner, size):
    return (f'<svg class="g o" viewBox="0 0 24 24" width="{size}" height="{size}" aria-hidden="true">'
            + inner + '</svg>')


def tile(name, parts, note=''):
    acc = sum(p['accent'] for p in parts)
    flag = f'<span class="m warn">{note}</span>' if note else f'<span class="m">{acc}× akcent</span>'
    return (f'<figure class="tile"><div class="sizes">{svg(parts, 48)}{svg(parts, 24)}</div>'
            f'<figcaption><b>{html.escape(LABELS.get(name, name))}</b>'
            f'<code>{name}</code>{flag}</figcaption></figure>')


def grid(glyphs, trunc=None):
    out = []
    for name, parts in glyphs.items():
        note = 'useknuté v zadání' if name == trunc else ''
        if sum(p['accent'] for p in parts) != 1 and not note:
            note = f'{sum(p["accent"] for p in parts)}× akcent'
        out.append(tile(name, parts, note))
    return '<div class="grid">' + ''.join(out) + '</div>'


def contrast(a, b):
    def lum(h):
        c = [int(h[i:i + 2], 16) / 255 for i in (1, 3, 5)]
        c = [x / 12.92 if x <= 0.04045 else ((x + 0.055) / 1.055) ** 2.4 for x in c]
        return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2]
    la, lb = sorted((lum(a), lum(b)), reverse=True)
    return (la + 0.05) / (lb + 0.05)


def cr(a, b):
    return f'{contrast(a, b):.1f}'.replace('.', ',') + ' : 1'


def theme_css(cls, t):
    return (f'.{cls}{{background:{t["bg"]};--line:{t["line"]};--acc:{t["acc"]}}}')


def code_list(glyphs):
    rows = []
    for name, parts in glyphs.items():
        for p in parts:
            tag = ('accent' if p['accent'] else '') + (' fill' if p['fill'] else '')
            rows.append(f'<tr><td><code>{name}</code></td><td class="m">{tag.strip()}</td>'
                        f'<td><code class="d">{html.escape(p["d"])}</code></td></tr>')
    return '<table class="codes">' + ''.join(rows) + '</table>'


def build():
    old, old_trunc, new = load()
    orig = originals()
    pairs = [
        ('journal', 'icon-journal', '10 Deník'),
        ('voice', 'icon-microphone', '14 Mikrofon'),
        ('night', 'icon-moon', '06 Měsíc'),
        ('realityTest', 'icon-reality-check', '05 Ruka'),
    ]
    cmp_rows = []
    for app, mine, lab in pairs:
        cmp_rows.append(
            '<div class="pair">'
            f'<figure class="tile"><div class="sizes">{svg(old[app], 48)}{svg(old[app], 24)}</div>'
            f'<figcaption><b>appka</b><code>{app}</code><span class="m">z Dartu (zadání)</span></figcaption></figure>'
            f'<figure class="tile"><div class="sizes">{raw_svg(orig[mine], 48)}{raw_svg(orig[mine], 24)}</div>'
            f'<figcaption><b>kolo 1</b><code>{lab}</code><span class="m">originál SVG</span></figcaption></figure>'
            '</div>')
    cmp_rows.append(
        '<div class="pair">'
        f'<figure class="tile"><div class="sizes">{svg(old["wbtb"], 48)}{svg(old["wbtb"], 24)}</div>'
        f'<figcaption><b>appka</b><code>wbtb</code><span class="m">z Dartu (zadání)</span></figcaption></figure>'
        f'<figure class="tile"><div class="sizes">{svg(new["alarm"], 48)}{svg(new["alarm"], 24)}</div>'
        f'<figcaption><b>nová</b><code>alarm</code><span class="m">z Dartu (kolo 4)</span></figcaption></figure>'
        '</div>')

    def panel(cls, title, sub):
        return (f'<section class="panel {cls}"><header><h2>{title}</h2><span class="m">{sub}</span></header>'
                f'<h3 class="m">Stará sada · ze zadání, useknutá po ssild · {len(old)} ikon</h3>{grid(old, old_trunc)}'
                f'<h3 class="m">Nová sada · kolo 4 · {len(new)} ikon</h3>{grid(new)}</section>')

    css = f"""
:root{{color-scheme:dark;--text:#E9EDF5;--muted:#8D97AD;--panel:#0C1222;--edge:#1E2740}}
*{{box-sizing:border-box}}
body{{margin:0;background:#020308;color:var(--text);font:14px/1.5 Inter,system-ui,sans-serif;padding:28px 16px 48px}}
main{{max-width:1080px;margin:0 auto}}
h1{{font:600 26px/1.15 "Inter Tight",Inter,sans-serif;letter-spacing:-.02em;margin:0 0 6px}}
h2{{font:600 17px/1.2 "Inter Tight",Inter,sans-serif;margin:0}}
h3{{margin:22px 0 10px;font-weight:500}}
p{{margin:0 0 10px;max-width:72ch}}
.lead{{color:var(--muted);margin-bottom:18px}}
.m{{font-family:"JetBrains Mono",ui-monospace,monospace;font-size:10.5px;letter-spacing:.06em;text-transform:uppercase;color:var(--muted)}}
.notes{{background:var(--panel);border:1px solid var(--edge);border-radius:6px;padding:14px 16px;margin:0 0 22px}}
.notes ul{{margin:6px 0 0;padding-left:18px}}.notes li{{margin:3px 0;max-width:80ch}}
.notes b{{color:#FF7A45;font-weight:600}}
.panel{{border:1px solid var(--edge);border-radius:8px;padding:16px;margin:0 0 22px}}
.panel header{{display:flex;flex-wrap:wrap;gap:6px 16px;align-items:baseline;justify-content:space-between}}
{theme_css('day', DAY)}
{theme_css('night', NIGHT)}{theme_css('nightswap', NIGHT_SWAP)}
.night,.nightswap{{border-color:#3A0C08}}
.night h2,.night b,.nightswap h2,.nightswap b{{color:#FF3B2F}}
.night .m,.night code,.nightswap .m,.nightswap code{{color:#B3261E}}
.grid{{display:grid;grid-template-columns:repeat(auto-fill,minmax(132px,1fr));gap:10px}}
.tile{{margin:0;padding:12px 10px 10px;border:1px solid rgba(141,151,173,.16);border-radius:6px;min-width:0}}
.night .tile,.nightswap .tile{{border-color:#2A0806}}
.sizes{{display:flex;align-items:flex-end;gap:14px;height:52px;margin-bottom:8px}}
figcaption{{display:flex;flex-direction:column;gap:1px;min-width:0}}
figcaption b{{font-weight:500;font-size:13px}}
code{{font:12px "JetBrains Mono",ui-monospace,monospace;color:var(--muted);overflow-wrap:anywhere}}
.warn{{color:#FF7A45}}.night .warn{{color:#FF3B2F}}
svg.g{{fill:none;stroke-width:1.5;stroke-linecap:round;stroke-linejoin:round;flex:none}}
svg.g .l{{stroke:var(--line)}}svg.g .a{{stroke:var(--acc)}}
svg.g .lf{{fill:var(--line);stroke:none}}svg.g .af{{fill:var(--acc);stroke:none}}
svg.o{{stroke:var(--line);color:var(--line)}}svg.o .accent{{stroke:var(--acc)}}
.pairs{{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:10px}}
.pair{{display:grid;grid-template-columns:1fr 1fr;gap:8px}}
details{{margin-top:14px}}summary{{cursor:pointer;color:var(--muted)}}
.codes{{border-collapse:collapse;width:100%;margin-top:8px}}
.codes td{{border-top:1px solid var(--edge);padding:5px 8px 5px 0;vertical-align:top}}
.codes td:first-child{{white-space:nowrap}}.codes .d{{color:var(--text);font-size:11px}}
@media (max-width:520px){{.grid{{grid-template-columns:repeat(2,minmax(0,1fr))}}.pair{{grid-template-columns:1fr}}}}
"""
    body = f"""
<main>
<h1>Ikony MissionGlyph: náhled</h1>
<p class="lead">Mřížka 24, linka 1,5, právě jeden prvek v akcentu. Každá ikona ve 48 a 24 px.</p>
<div class="notes">
<span class="m">Poznámky</span>
<ul>
<li>SVG v mřížce je vygenerované skriptem <code>gen_ikony_preview.py</code> ze stejných řetězců jako Dart: nová sada z <code>mission_icons_new.dart</code>, stará z bloku Dartu v <code>ZADANI.md</code>. Volání <code>_circle()</code> a <code>_rect()</code> skript počítá stejně jako Dart, včetně zápisu čísel (<code>12.0</code>).</li>
<li><b>Stará sada je neúplná.</b> Kód v zadání je useknutý po <code>ssild</code>, takže tu je jen {len(old)} ikon (today až ssild) a u <code>ssild</code> jen první čtyři části. Ostatní staré ikony (yoga, oura, watch, dreamSign, vault, path, person, dream, rem, eye, brain, heart, book, meditation, planet, drawing, constellation, cycle) tu nejsou a nevymýšlel jsem je.</li>
<li>Části s <code>fill: true</code> jsou kreslené jen výplní bez obrysu, konce a spoje čar kulaté. Tak předpokládám, že kreslí váš painter; jeho kód v zadání není.</li>
<li><b>Noc:</b> linka #B3261E, akcent #FF3B2F. V noci nese rozdíl jen jas, takže signál musí být ten světlejší odstín, jinak se akcent ztratí a ikona přijde o hierarchii. Linek je plošně víc, tmavší linka tedy méně svítí do tmy. Kontrast na černé: linka {cr(NIGHT['line'], '#000000')}, akcent {cr(NIGHT['acc'], '#000000')} (pro grafiku stačí 3 : 1). Ve dne: linka {cr(DAY['line'], DAY['bg'])}, akcent {cr(DAY['acc'], DAY['bg'])}. V appce to znamená v nočním skinu volat <code>MissionIcon(glyph, color: Color(0xFFB3261E), accentColor: Color(0xFFFF3B2F))</code>, pokud noční skin dává text #FF3B2F a akcent #B3261E (hodnoty nočního skinu v zadání nejsou).</li>
</ul>
</div>
{panel('day', 'Den', 'linka #E9EDF5 · akcent #FF5F1F · pozadí #04060C')}
{panel('night', 'Noc', 'linka #B3261E · akcent #FF3B2F · černá')}
<section class="panel nightswap"><header><h2>Noc, opačné přiřazení</h2><span class="m">linka #FF3B2F · akcent #B3261E · jen pro srovnání, nedoporučuji</span></header>
<h3 class="m">Nová sada</h3>{grid(new)}</section>
<section class="panel day"><header><h2>Srovnání s appkou</h2><span class="m">jen tam, kde je řetězec appky v zadání</span></header>
<p class="lead">Vlevo ikona appky z Dartu, vpravo moje verze z kola 1. Pravé ikony v prvních čtyřech dvojicích jsou originální SVG z <code>ikony.svg.md</code>, ne z Dartu: do <code>mission_icons_new.dart</code> nepatří, protože existující ikony neměním. Poslední dvojice ukazuje podobnost wbtb a nového budíku.</p>
<div class="pairs">{''.join(cmp_rows)}</div></section>
<section class="panel day"><header><h2>Řetězce cest</h2><span class="m">přesně to, co dostane parser</span></header>
<details><summary>Nová sada</summary>{code_list(new)}</details>
<details><summary>Stará sada (ze zadání)</summary>{code_list(old)}</details>
</section>
</main>"""
    page = f"""<!doctype html>
<html lang="cs"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Ikony MissionGlyph</title>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Inter+Tight:wght@600&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
<style>{css}</style></head>
<body>{body}
</body></html>
"""
    with open(OUT, 'w', encoding='utf-8') as f:
        f.write(page)
    return old, old_trunc, new


if __name__ == '__main__':
    old, old_trunc, new = build()
    print(f'stará sada: {len(old)} ikon (useknutá: {old_trunc}), nová: {len(new)} ikon -> {OUT}')
    if '--json' in sys.argv:
        path = sys.argv[sys.argv.index('--json') + 1]
        with open(path, 'w', encoding='utf-8') as f:
            json.dump({'old': old, 'new': new}, f, ensure_ascii=False, indent=1)
