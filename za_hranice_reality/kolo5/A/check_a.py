"""Kontrola korektury textů (kolo 5, část A).

Použití: python3 -I check_a.py [ORIG_DIR] [NEW_DIR]
(výchozí: ../content a content_opraveno vedle tohoto skriptu)

Ověří, že se v opravených souborech nezměnila struktura, klíče, id, čísla ani zástupné
symboly, a že platí tvrdé limity appky. Vrací kód 1, když najde chybu.
"""
import json, os, re, sys, unicodedata

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, '..', 'content')
NEW = sys.argv[2] if len(sys.argv) > 2 else os.path.join(HERE, 'content_opraveno')

# Hodnoty pod těmito klíči jsou identifikátory nebo odborná data: musí zůstat beze změny.
FROZEN_KEYS = {'id', 'ids', 'techniqueId', 'techniqueIds', 'evidence', 'tag', 'tags', 'source', 'sources',
               'art', 'icon', 'glyph', 'signId', 'lesson', 'design', 'primary', 'outcomes', 'kind', 'type',
               'category', 'level', 'arm', 'key', 'route', 'action', 'version', 'date', 'lessonId', 'cardId'}
# V copy*.json pod texts.* jsou tyto klíče jen popisky UI (např. nadpis „Co víme“), ne data.
UI_TEXT_KEYS = {'evidence', 'source', 'tag', 'level', 'action', 'type', 'kind', 'date'}
IDENT = re.compile(r'^[a-z][A-Za-z0-9_.\-]*$')          # řetězec, který vypadá jako identifikátor
PLACEHOLDER = re.compile(r'\{[^{}]*\}')
NUMBER = re.compile(r'\d+(?:[.,]\d+)?')
BANNED = ['binaur', '40 hz', 'astráln', 'calea', 'castaned', 'senoi', 'krystal', 'šišink', 'na povel']
HZ_ALLOWED = {'lessons.json', 'reflections.json'}        # 40 Hz jen jako vyvrácený mýtus

errors, warnings, stats = [], [], {}


def words(s):
    return [w for w in s.split() if any(ch.isalnum() for ch in w)]


def walk(o, n, path, fname):
    if type(o) is not type(n):
        errors.append(f'{fname}:{path}: jiný typ ({type(o).__name__} → {type(n).__name__})')
        return
    if isinstance(o, dict):
        if list(o.keys()) != list(n.keys()):
            errors.append(f'{fname}:{path}: jiné klíče nebo pořadí klíčů')
            return
        for k in o:
            walk(o[k], n[k], f'{path}.{k}' if path else k, fname)
    elif isinstance(o, list):
        if len(o) != len(n):
            errors.append(f'{fname}:{path}: jiná délka seznamu ({len(o)} → {len(n)})')
            return
        for i, (a, b) in enumerate(zip(o, n)):
            walk(a, b, f'{path}[{i}]', fname)
    elif isinstance(o, str):
        key = re.sub(r'\[\d+\]$', '', path).split('.')[-1]
        if o != n:
            stats[fname] = stats.get(fname, 0) + 1
            ui_text = fname.startswith('copy') and path.startswith('texts.') and key in UI_TEXT_KEYS
            if (key in FROZEN_KEYS and not ui_text) or (IDENT.match(o) and ' ' not in o):
                errors.append(f'{fname}:{path}: chráněná hodnota se změnila ({o!r} → {n!r})')
            if sorted(PLACEHOLDER.findall(o)) != sorted(PLACEHOLDER.findall(n)):
                errors.append(f'{fname}:{path}: jiné zástupné symboly {PLACEHOLDER.findall(o)} → {PLACEHOLDER.findall(n)}')
            no, nn = sorted(NUMBER.findall(o)), sorted(NUMBER.findall(n))
            if no != nn:
                errors.append(f'{fname}:{path}: jiná čísla {no} → {nn}')
        check_limits(n, path, key, fname, o)
    else:
        if o != n:
            errors.append(f'{fname}:{path}: změněná hodnota {o!r} → {n!r}')


def check_limits(s, path, key, fname, orig):
    if '—' in s:
        errors.append(f'{fname}:{path}: dlouhá pomlčka')
    low = s.lower()
    for b in BANNED:
        if b in low and not (b == '40 hz' and fname in HZ_ALLOWED):
            errors.append(f'{fname}:{path}: zakázané slovo „{b}“')
    if 'nightSteps' in path and len(words(s)) > 6:
        errors.append(f'{fname}:{path}: nightSteps má {len(words(s))} slov (max 6)')
    if fname == 'copy.json' and path.startswith('nightGuide') and key == 'night' and len(words(s)) > 6:
        errors.append(f'{fname}:{path}: noční text má {len(words(s))} slov (max 6)')
    if fname == 'copy.json' and path.startswith('texts.night.') and len(words(s)) > 6 \
            and len(words(s)) > len(words(orig)):
        warnings.append(f'{fname}:{path}: text noční obrazovky má {len(words(s))} slov (prodlouženo z {len(words(orig))})')
    if key in ('notification', 'silent') and len(s) > 60:
        errors.append(f'{fname}:{path}: {key} má {len(s)} znaků (max 60)')
    if re.search(r'(^|\.)intention\.when$', path) and re.match(r'\s*když\b', s, re.I):
        errors.append(f'{fname}:{path}: intention.when začíná „Když“')
    if re.search(r'(^|\.)intention\.then$', path) and re.match(r'\s*tak\b', s, re.I):
        errors.append(f'{fname}:{path}: intention.then začíná „tak“')
    if '.art.' in f'.{path}.' and path.startswith('texts.training.art.'):
        if s != s.upper() or not 1 <= len(words(s)) <= 3:
            errors.append(f'{fname}:{path}: popisek ilustrace musí být VELKÝMI písmeny a mít 1–3 slova ({s!r})')


def main():
    files = sorted(f for f in os.listdir(ORIG) if f.endswith('.json'))
    missing = [f for f in files if not os.path.exists(os.path.join(NEW, f))]
    for f in missing:
        errors.append(f'{f}: chybí v {NEW}')
    for f in files:
        if f in missing:
            continue
        raw = open(os.path.join(NEW, f), encoding='utf-8').read()
        try:
            n = json.loads(raw)
        except json.JSONDecodeError as e:
            errors.append(f'{f}: neplatný JSON ({e})')
            continue
        o = json.load(open(os.path.join(ORIG, f), encoding='utf-8'))
        if raw != json.dumps(n, ensure_ascii=False, indent=2) + '\n' and raw != json.dumps(n, ensure_ascii=False, indent=2):
            warnings.append(f'{f}: formát není json.dumps(indent=2, ensure_ascii=False)')
        walk(o, n, '', f)
    print(f'Soubory: {len(files)}')
    for f in files:
        print(f'  {f}: změněných řetězců {stats.get(f, 0)}')
    print(f'Chyby: {len(errors)}')
    for e in errors[:200]:
        print('  CHYBA', e)
    print(f'Varování: {len(warnings)}')
    for w in warnings[:100]:
        print('  POZOR', w)
    sys.exit(1 if errors else 0)


if __name__ == '__main__':
    main()
