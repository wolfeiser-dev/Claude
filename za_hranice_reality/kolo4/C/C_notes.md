# C) Rozpis pro experimenty s WBTB

Soubory v této složce:

| soubor | co to je |
|---|---|
| `nof1_wbtb.dart` | `wbtbArmFor(...)` přesně podle zadání, k tomu `wbtbNightPlan(...)` (stejné rozhodnutí a navíc stav, pořadí noci a texty), `wbtbNeedsOf(template)` a `nof1WbtbCopyKeys()`. Čistý Dart 3.6, importuje jen `nof1.dart`. |
| `nof1_wbtb_test.dart` | 15 testů (package:test), z toho 2 simulace |
| `laborator_texty_wbtb.json` | 7 nových textů `lab.wbtb.*`, které chyběly. Vlož je hlubokým sloučením do `laborator_texty.json`. Nic nepřepisují. |

`nof1.dart` jsem neměnil. Všechno potřebné je v `nof1_wbtb.dart`.

## Pravidlo: obě varianty čekají na stejné noci

Noc patří do experimentu jen tehdy, když by na ni šlo WBTB podle `wbtbIssues`:
- je po 14. dni programu,
- předchozí noc byla dobrá,
- není to den po noci s WBTB,
- v žádných 7 nocích po sobě nejsou víc než 2 noci s WBTB.

To platí i pro variantu bez WBTB. Ostatní noci jsou „dnes mimo experiment“ a rozpis na ně nepostoupí, takže n-tá noc experimentu vždy dostane n-tou položku `planned`.

Varianta bez budíku se do limitu nepočítá. U `wbtbVsMorning` noc A neblokuje další noc ani týdenní limit. Jen sama nesmí běžet na noci, kdy WBTB nejde.

Proč takhle, a ne „A smí i v nocích, kdy WBTB nejde“:

1. **Zkreslení výběrem.** Noci, kdy WBTB nejde, jsou jiné než ostatní: přicházejí po špatném spánku, den po probuzení (únava, odraz REM) nebo v týdnu se dvěma probuzeními. Kdyby na nich běžela jen varianta A, srovnání by se smíchalo s kvalitou předchozí noci.
2. **Kovariáta to nespraví.** Varianta B na takových nocích nemá ani jedno pozorování (porušená pozitivita). Model by mezi variantami jen extrapoloval.
3. **Přenos.** Každá noc experimentu má aspoň jednu noc odstup od posledního probuzení. Noci A tak nenesou část účinku B. U `sleepFeeling` (pojistka spánku) by přenos únavy do nocí A zakryl, že WBTB spánku škodí.
4. **Rozhodnutí je slepé k losu.** Jestli noc do experimentu patří, se rozhodne dřív, než se kód podívá, která varianta je na řadě. Pořadí se nikdy nepřeskakuje, a tak vyváženost zůstává přesně podle rozpisu:
   - u `alternating` se počty liší nejvýš o 1,
   - u bloků po 4 nejvýš o 2 a v každém celém bloku jsou 2× A a 2× B.

   Čítač dluhu není potřeba.

Výsledek odpovídá na otázku, kterou si uživatel opravdu klade: „Vyplatí se WBTB v noci, kdy bych ho mohl udělat?“

Simulace, 2000 rozpisů na řádek, 20 % špatných nocí (po noci s WBTB 30 %). Délka je počet dní po 14. dni programu, medián (p90):

| pravidlo | 20 nocí | 48 nocí (plán + 2 prodloužení) | noci A po špatné noci | noci A den po WBTB | noci A v týdnu se 2 WBTB |
|---|---|---|---|---|---|
| **společná způsobilost (zvoleno)**, `wbtbVsMorning` | 44 (48) | 108 (113) | 0 % | 0 % | 0 % |
| A smí kdykoli po 14. dni | 35 (37) | 87 (90) | 26 % (B 0 %) | 62 % (B 0 %) | 84 % (B 0 %) |
| A smí, když brání jen týdenní limit | 39 (42) | 95 (100) | 0 % | 0 % | 51 % (B 0 %) |
| **společná způsobilost**, `wbtbMildVsSsild` | 70 (73) | 172 (176) | 0 % | 0 % | 0 % |

Zvolené pravidlo prodlouží experiment o 5 až 9 dní na 20 nocí. Zato zmizí systematický rozdíl mezi nocemi A a B.

Průměrné datum nocí A a B se liší o 3 % délky experimentu (u střídání o 0,2 %). To pokryje trend, který `analyzeOutcome` už odečítá.

Při 35 % špatných nocí trvá `wbtbVsMorning` 49 dní a `wbtbMildVsSsild` 74 dní na 20 nocí.

## Napojení v appce

1. **Start experimentu.** Nastav:
   - `planned = fullSchedule(t.design, t.nights, seedFrom('$id|$start'))` (jako v kole 3),
   - `needs = wbtbNeedsOf(t)`:
     - `wbtbVsMorning`: A bez WBTB, B s WBTB,
     - `wbtbMildVsSsild`: obě varianty s WBTB,
     - jiná šablona s `wbtb` se bere jako WBTB v obou variantách.

   Teď můžeš obě šablony přestat skrývat.
2. **Každý večer.** Zavolej `wbtbNightPlan(...)` s těmito vstupy:
   - `night` = dnešní datum večera,
   - `past` = zapsané noci experimentu,
   - `programStart`,
   - `lastNightGood` = hodnocení „Jak ses vyspal“ za minulou noc. Když chybí, předej `false`, spánek má přednost.
   - `armANeedsWbtb: needs.a`, `armBNeedsWbtb: needs.b`.

   Pak podle výsledku:
   - `arm != null` (`scheduled`): ukaž pokyn varianty ze šablony a řádky `copy`. U varianty s budíkem se přidá i `lab.wbtb.sleepFirst`. `{arm}` nahraď popiskem varianty.
   - `wbtbNotAllowed`: karta **„dnes mimo experiment“**, bez budíku. Ukaž `lab.wbtb.notTonight`, pak důvody `lab.wbtb.<issue>`. U `wbtbVsMorning` přidej `lab.wbtb.bothArmsWait`.
   - `experimentDone`: `lab.wbtb.status.experimentDone` a pak výsledek nebo `lab.endPrompt`.
   - `pastNight` / `conflictingRecord`: noc se zpětně nepřiřazuje. U sporu požádej o opravu záznamu.
3. **Ráno.** Do `past` zapiš `(night, arm)` až po noci, a jen když proběhla jako noc experimentu.
   - Vynechanou noc nezapisuj. Položka rozpisu počká na další vhodnou noc.
   - Když člověk variantu nedodržel (třeba vypnul budík), zapiš ji pod vylosovanou variantou (analýza podle záměru léčby). Nebo ji zapiš se štítkem „X“: položka se spotřebuje a pro limit se noc bere opatrně jako noc s WBTB.
4. **Analýza.** `analyzeExperiment` se nemění, dostane jen noci z `past`. Noci mimo experiment do ní nepatří.
5. **WBTB mimo experiment.** Limit 2 za 7 nocí hlídá funkce jen podle nocí experimentu. Dokud WBTB experiment běží, nenabízej WBTB jinde v appce. Jinak by limit neviděl všechna probuzení.
6. **Data a čas.** Data se porovnávají jako kalendářní data. Předávej datum večera (jako `Dream.nightDate`). Dny přičítej přes `DateTime(y, m, d + 1)`, ne přes `add(Duration(days: 1))`. Při přechodu na zimní čas dá `add` 23:00 předchozího dne.

## Ověření

Ověřoval jsem v Dart 3.6.2 v kopii balíčku `nof1_wbtb_pkg` (původní `nof1_pkg` je beze změny):
- `dart analyze`: 0 problémů.
- `brace_fix.py --check`: 0 u obou souborů.
- `dart test` s `NOF1_DATA=…/kolo3` a `NOF1_WBTB_DATA=…/kolo4/C` prošel celý: **46/46** (31 původních testů `nof1_test.dart` + 15 nových). Prošel ve třech pásmech, `TZ=UTC`, `Europe/Prague` a `America/Sao_Paulo`.

Co testy kontrolují:
- n-tá vhodná noc dostane n-tou položku,
- prvních 14 dní a noc po špatném spánku čekají obě varianty,
- noc A se do limitu nepočítá, noc s WBTB ano, u `wbtbMildVsSsild` blokuje i noc A,
- rozhodnutí je slepé k variantě (3000 náhodných stavů),
- zapsaná noc, spor, noc v minulosti a vyčerpaný rozpis,
- duplicity a pořadí `past`, determinismus, nedotčené vstupy,
- čas noci, UTC proti místnímu času, oba přechody letního času,
- šablona bez WBTB, neplatný rozpis a štítek „X“,
- shoda `wbtbArmFor` s `wbtbNightPlan` a argumenty textů,
- **simulace**: obě šablony z `experiments.json`, 300 seedů × 20/25/50 % špatných nocí, 10 % vynechaných nocí, plný rozpis 48 nocí. Ani jednou se neporušilo pravidlo WBTB (nezávisle přes `validateWbtbPlan`). Pořadí vždy odpovídá rozpisu, nerovnováha je nejvýš 1, u bloků nejvýš 2, a žádná noc experimentu nepřišla po špatné noci, den po WBTB ani v týdnu se dvěma WBTB.
- volné pravidlo by zkreslilo srovnání, zvolené ne,
- `wbtbNeedsOf` sedí na popisy variant v `experiments.json`,
- texty: všechny klíče pokryté, nic navíc ani přepsané, zástupné symboly sedí, bez dlouhé pomlčky a bez slov o sériích a trestech.
