# Kolo 5: přehled

Větev `claude/lucidni-sneni-vyzkum-bxf3tp`, složka `za_hranice_reality/kolo5/`. Pořadí A → B → C. Kód ověřený v cloudu na Dart 3.6.2.

## A) Korektura a sjednocení textů (`A/`)
| Soubor | Co je v něm |
|---|---|
| `content_opraveno/` | Všech 16 souborů ze `content/` se stejnými názvy, platný JSON (2 mezery, UTF-8, bez `ensure_ascii`). `SLOVNIK.md` je zkopírovaný beze změny. |
| `zmeny.md` | Počty úprav po souborech (celkem 513 řetězců), typické zásahy, 15 nejzajímavějších příkladů „před → po“ a podrobné přehledy korektorů. |
| `vecne_pochybnosti.md` | Věcné pochybnosti. V textech se neopravovaly: 6 bodů napříč appkou a body od každého korektora. |
| `check_a.py` | Kontrola: nezměnil se žádný klíč, pořadí, délka seznamu, `id`, chráněná hodnota (`techniqueId`, `evidence`, `tag`, `source(s)`, `art` …), číslo uvnitř textu ani zástupný symbol `{…}`. Ověří i tvrdé limity (noční texty max 6 slov, `notification`/`silent` max 60 znaků, `intention.when/then`, popisky ilustrací, dlouhá pomlčka, zakázaná slova). |
| `_pravidla_korektury.md`, `parts/` | Pravidla pro korektory a jejich dílčí přehledy. |

**Hlavní zásahy**
- **Techniky:** všude český název první (`techniques.json` `name`: „Záměr poznat sen (MILD)“), i v nočních krocích („Záměr, nebo střídání smyslů?“).
- **Pojmy podle SLOVNIK.md:** kotva → připomínka, Stopy → Stopy snů, odhad výskytu REM, Zapsat sen, Nic si nepamatuju.
- **Kategorie znaků snů:** jednotně děj / souvislosti / podoba / vnitřní prožitek (dřív i „tvar / vědomí“).
- **Styl:** pryč s kalky a vatou, české uvozovky, oprava shody a přechodů osoby.
- **Popisky ilustrací:** 3 původní popisky delší než 3 slova jsou zkrácené.

**Výstup `python3 -I A/check_a.py content A/content_opraveno`:**
```
Soubory: 16
  copy.json: změněných řetězců 26
  copy_design.json: změněných řetězců 7
  copy_devices.json: změněných řetězců 13
  copy_journal.json: změněných řetězců 9
  copy_lab.json: změněných řetězců 10
  copy_reality.json: změněných řetězců 9
  copy_training.json: změněných řetězců 3
  experiments.json: změněných řetězců 47
  lessons.json: změněných řetězců 104
  novinky.json: změněných řetězců 16
  program.json: změněných řetězců 99
  reality_prompts.json: změněných řetězců 3
  reality_tests.json: změněných řetězců 33
  reflections.json: změněných řetězců 40
  safety.json: změněných řetězců 13
  techniques.json: změněných řetězců 81
Chyby: 0
Varování: 0
```

**Upozornění**
- **Delší názvy technik:** `techniques.json` `name` je teď delší (až 39 znaků). Zkontrolujte kartu techniky; nouzově vraťte zkratku do `name` a český název dejte do `fullName`.
- **ADA:** `fullName` je „Kritická reflexe podle Tholeye“, slovník ale říká „Vědomí po celý den“. Rozhodněte, co technika opravdu je (viz `vecne_pochybnosti.md`).
- **Kategorie natvrdo v kódu:** pokud má UI kategorie Stop snů natvrdo v kódu jako „Tvar/Vědomí“, změňte je taky.
- **Kontrola ve dvou místech pouští texty pod chráněnými klíči:** v `copy*.json` pod `texts.*` jsou klíče `evidence`/`source` jen popisky UI. Proto tam `check_a.py` změnu povolí; jinde je `evidence`/`source` chráněné.
- **Věcné body k rozhodnutí:**
  - spánková paralýza „zhruba pětina lidí“ (v běžné populaci asi 7,6 %);
  - „devítitýdenní“ kurz MBSR v r45 (správně osmitýdenní);
  - hybrid SSILD+MILD „vyšel nejhůř“ (v ILDIS nejhůř vyšla jiná skupina);
  - WBTB v appce 5 h / 5–10 min, ale ve studii Erlacher 2020 6 h / 30–60 min;
  - další body jsou v `vecne_pochybnosti.md`.

## B) Od Stopy snů ke spouštěči (`B/`)
| Soubor | Co je v něm |
|---|---|
| `dream_sign_triggers.dart` | `suggestTriggers`, `transferStats`, `realityPromptsFromSigns`, jen `dart:math`. |
| `dream_types.dart` | Vaše typy ze zadání. V appce je nahraďte svými a upravte importy. |
| `dream_sign_triggers_test.dart` | 27 testů (package:test); import `package:triggers_pkg/...` přepište. |
| `triggers_texty.json` | `texts.triggers.*`, zrcadlo výchozích textů v kódu (test hlídá shodu). |
| `B_notes.md` | Rozhodnutí, prahy, simulace, strategie skloňování. |

**Jak to funguje**
- **Skóre:** váha nocí s poločasem 14 nocí, k tomu kategorie (`context`/`action` spíš ve dne, `form`/`awareness` spíš večer) a týdenní rotace šablon.
- **Výběr:** vždy aspoň jeden denní a jeden večerní návrh. Stopy hlavně z nočních můr se nenabízejí; soukromé Stopy vyřadíte přes `excludeSignIds`.
- **Text:** `when`/`then` nezačínají „Když“/„tak“ a `then` nezačíná „se/si“, takže s doplněným „tak“ zní přirozeně. Příklad: „Když vejdu na místo, které mi připomíná Stopu snů „škola“, tak udělám pauzu, rozhlédnu se a zkontroluju, jestli sním.“
- **Přenos do snu:** bayesovské srovnání před a po začátku plánu se skeptickým priorem. Verdikty jsou slovy, s přirozenými četnostmi („ve 2 ze 7 snů“). Když žádný rozdíl není, vyjde falešné „jasně víc“ nejvýš u 2,9 % lidí.
- **Podněty:** šablony bez skloňování („Stopa snů: škola. Sníš?“), max 60 znaků i s emoji, dlouhé popisky se zkrátí na hranici slova.

**Ověřeno:** `dart analyze` bez chyb, `dart test` 27/27 (zopakováno v Europe/Prague), žádné tělo bez `{ }`, žádná dlouhá pomlčka ani procento v textech.

**Upozornění**
- **Síla testu je malá:** při 10 snech před a po se skutečný skok z 10 % na 40 % ukáže jako „jasně víc“ jen asi ve 29 % případů. Texty proto říkají „od začátku plánu“, ne „díky plánu“.
- **Stopa snů v jednotném čísle:** použil jsem „Stopa snů“ (jako program a opravené texty), ne „Stopa snu“ z příkladu v zadání.

## C) Rekonstrukce noci podle REM oken (`C/`)
| Soubor | Co je v něm |
|---|---|
| `night_reconstruction.dart` | `reconstructNight({windows, wake, dreamsThatNight, max = 4, gender = RecallGender.neutral})` a `RecallPrompt`, bez importů SDK. |
| `dream_types.dart`, `rem_window_types.dart` | Kopie typů (Dream ze zadání B, RemWindow/RemLevel z kola 4). V appce je smažte a importujte své; v `night_reconstruction.dart` změňte 2 importy. |
| `night_reconstruction_test.dart` | 18 testů; JSON hledá v `RECON_DATA`, `./`, `../`. |
| `rekonstrukce_texty.json` | 48 textů `texts.reconstruction.*` (otázky, nabídky, průvodce, noční řádky). |
| `rekonstrukce_ui.md` | 7 zásad UI: kdy nabídnout, jak dlouho, jak neotravovat, noční červená, rod, soukromí. |
| `C_notes.md` | Krátké poznámky. |

**Pravidla rekonstrukce**
- **Pořadí:** od posledního okna k prvnímu.
- **Úrovně:** `unlikely` se vynechává, `low` jen když nic jiného není (a s „možná“).
- **Spojování oken:** sousední okna jednoho REM úseku (mid–high–mid) se spojí, aby se appka neptala třikrát na totéž.
- **Čas otázky:** střed úseku oříznutý k probuzení, zaokrouhlený na 10 min.
- **Zapsaný sen:** u okna, kde už sen je, zní otázka „Kolem 5:20 máš zapsaný sen. Navázal na něj ještě jiný?“. Místo „K 5:20“ je „Kolem“, protože „k/ke“ se mění podle hodiny a „kolem“ zní jako odhad.
- **Rod:** výchozí znění je rodově neutrální („Kolem 5:20 se ti nejspíš něco zdálo. Co to bylo?“); mužský a ženský tvar jsou volitelné.
- **Půlnoc a změna času** se počítají v reálném čase.

**Ověřeno:** `dart analyze` bez chyb, `dart test` 18/18 (agent v 5 časových pásmech, já znovu v Europe/Prague), žádné tělo bez `{ }`. Test kontroluje i texty: klíče sedí na kód, žádné vykání, procenta ani dlouhá pomlčka, noční texty max 6 slov.
