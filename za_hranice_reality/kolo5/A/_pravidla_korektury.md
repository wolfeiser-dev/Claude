# Pravidla korektury (kolo 5 A), společná pro všechny korektory

Zadání: `za_hranice_reality/kolo5/ZADANI.md`, část A. Slovník a tón: `za_hranice_reality/kolo5/content/SLOVNIK.md` (závazný).
Zdroj: `za_hranice_reality/kolo5/content/<soubor>`; cíl: `za_hranice_reality/kolo5/A/content_opraveno/<soubor>` (stejný název).

## Tón
- Zkušený kamarád-vědec, tykání, krátké věty. Nejdřív srozumitelný pokyn, pak metafora. Bez esoteriky, bez mentorování, bez kázání.
- Pryč s AI nádechem: vata („je důležité“, „pojďme“, „v neposlední řadě“, „klíčové“, „unikátní“, „cesta“ jako metafora všeho), trojice přídavných jmen, zbytečné úvody a shrnutí, anglicismy (feedback, tracking, mindset, insight, challenge, skill, trigger, flow, level…) tam, kde je běžné české slovo. Odborné termíny (REM, hypnogram) smí zůstat.
- Přirozený český slovosled, žádné kalky z angličtiny („udělat smysl“, „na konci dne“).
- Stejný tón napříč appkou. Oslovení konzistentně v 2. os. j. č. (ty).
- Žádné procento jistoty bez kalibrace (v textu „82 % jistota“ apod. nahraď slovním odhadem, ale čísla ze studií nech beze změny: viz níže).
- Techniky vždy český název první, zkratka druhotně, podle SLOVNIK.md (např. „Záměr poznat sen (MILD)“ nebo „Záměr poznat sen · MILD“; drž formát, který už daný soubor nebo kontext používá, a sjednoť ho v rámci souboru).
- Pojmy podle SLOVNIK.md: Plán na dnešek, Spánková data, Jak ses vyspal, připomínka, Záloha, Stopy snů, mise jen v Programu, „odhad výskytu REM“.

## Pravopis a typografie
- Pravopis, interpunkce (čárky ve větách!), české uvozovky „“ (ne "" ani “”), výpustka …, pomlčka jen krátká – (s mezerami jako větná, bez mezer v rozsazích 5–10), nikdy dlouhá „—“.
- Čísla a jednotky: 5 min, 20 %, 8 h (mezera; nezlomitelné mezery smí zůstat i se smí přidat). Desetinná čárka (1,5). Časy 5:20.
- Nezlomitelné mezery (U+00A0) po jednopísmenných předložkách a spojkách smí zůstat; nemaž je.

## NEMĚŇ (hlídá check_a.py)
- klíče, `id`, strukturu JSON, pořadí položek, délky seznamů, čísla (ani číslice uvnitř textů: každý řetězec musí obsahovat stejnou množinu čísel), `techniqueId`, `evidence`, `tag`, zdroje (`source`, `sources`, autoři, roky), zástupné symboly `{…}` (přesně stejné), řetězce, které jsou identifikátory (bez mezer, malým písmenem).
- odborný obsah. Věcnou chybu NEOPRAVUJ v textu: zapiš ji do svého souboru pochybností (viz níže).

## Tvrdé limity
- `nightSteps` a noční texty (`copy.json` → `nightGuide[].night`, `texts.night.*`): nejvýš 6 slov,
- `notification` a `silent`: nejvýš 60 znaků,
- `intention.when` nezačíná „Když“, `intention.then` nezačíná „tak“,
- `texts.training.art.*`: VELKÁ PÍSMENA, 1–3 slova (v copy_training.json jsou 3 původní porušení, oprav je: `ssild.rhythm`, `body.caption`, `breath.note`, číslo zachovej),
- nikde „—“; zakázaná slova: binaur, 40 Hz (jen jako vyvrácený mýtus v lessons a reflections), astráln, Calea, Castaned, Senoi, krystal, šišink, „na povel“.

## Postup
1. Načti JSON v Pythonu, uprav jen hodnoty textů, ulož přes `json.dump(data, f, ensure_ascii=False, indent=2)` + koncový `\n`.
2. Spusť `python3 -I za_hranice_reality/kolo5/A/check_a.py za_hranice_reality/kolo5/content za_hranice_reality/kolo5/A/content_opraveno` (z kořene repa `/home/user/Claude`) a oprav všechny chyby u svých souborů (chyby „chybí v …“ u souborů jiných korektorů ignoruj).
3. Přečti si výsledek ještě jednou celý očima rodilého mluvčího.

## Tvoje výstupy do `za_hranice_reality/kolo5/A/parts/<prefix>_*.md`
- `<prefix>_zmeny.md`: po souborech počet upravených řetězců a 8–10 nejzajímavějších příkladů „před → po“ (s cestou v JSON),
- `<prefix>_pochybnosti.md`: věcné pochybnosti (cesta, co nesedí, proč, zdroj; ověř webem, pokud jde).
Necommituj (commitne koordinátor). Na soubory jiných korektorů nesahej.
