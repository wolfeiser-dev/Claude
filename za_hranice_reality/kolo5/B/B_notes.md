# B) Od Stopy snů ke spouštěči: poznámky

Soubory: `dream_types.dart` (typy ze zadání, bez `copyWith`), `dream_sign_triggers.dart` (jen `dart:math`), `dream_sign_triggers_test.dart` (27 testů), `triggers_texty.json`.
Ověřeno na Dart 3.6.2: `dart analyze` 0 problémů, `dart test` 27/27 zelených, `brace_fix.py --check` 0 u všech souborů. V souborech není dlouhá pomlčka.

## 1. `suggestTriggers`

**Skóre Stopy.** Počítám noci, ne zmínky, podle spec TOP 2:

- `Σ 0,5^(stáří/14)` přes noci se Stopou, kde stáří je počet nocí od `nightDate` do `now`,
- `+ 0,02 ×` výskyty z `DreamSign.count`, které v `dreams` nemají datum (nejvýš 10),
- `× (1 + 0,5 × divnost)`, kde divnost je podíl snů s kmeny „nešl, nejde, najednou, nemohl, změnil, létal, letěl“,
- `× 1,2` u kategorií děj a podoba.

**Den, nebo večer.** Rozhoduje váha podle kategorie:

| | prostředí | děj | vnitřní prožitek | podoba |
|---|---|---|---|---|
| den | 1,0 | 1,0 | 0,7 | 0,5 |
| večer | 0,8 | 0,8 | 1,0 | 1,0 |

**Výběr.**
1. Vezmu `max` nejsilnějších různých Stop, každou jejím lepším druhem.
2. Když je Stop míň než `max`, doplním druhý druh, takže jedna Stopa dá plán na den i na večer.
3. Když všechno vyjde jen na den (nebo jen na večer), vyměním jednu položku s nejmenší ztrátou skóre. Plán tak má vždycky obojí.

Pořadí je deterministické. Při shodě rozhoduje skóre, pak den před večerem, pak `count`, label a id. Součty počítám v pevném pořadí, takže na pořadí vstupu nezáleží ani v posledním bitu.

**Rotace.**
- Skóre Stopy násobím faktorem 0,75 až 1,25 z hashe (id Stopy + týden). Proto se přehází jen podobně silné Stopy.
- Varianta šablony a/b se taky mění po týdnech.
- Plán rotuje po týdnech, ne po dnech. Plán „když–pak“ funguje díky opakování a denní přeskupování by ho rozbíjelo.
- Proti habituaci rotují po dnech podněty v notifikacích.
- „Jiný návrh“: appka zavolá funkci znovu a odmítnutou Stopu přidá do `excludeSignIds`.

**Co vynechávám.**
- Stopy z `excludeSignIds`: soukromé, intimní, jména osob, aktivní a odmítnuté. `DreamSign` tyhle příznaky nemá, appka je musí předat.
- Stopy bez použitelného labelu.
- Stopy, které jsou aspoň v polovině svých snů z noční můry (spec: z noční můry spouštěč nedělám).
- Duplicity podle id i podle labelu bez ohledu na velikost písmen. Prázdné noci a duplicitní id snů nepočítám.

**Výstup.** `TriggerSuggestion` obsahuje:
- `id` (`trg_<signId>_<day|evening>_<a|b>`), `signId`, `label`, `category`, `kind`, `variant`,
- `when` a `then` bez „Když“ a „tak“ a bez tečky,
- `reason`, třeba „Ve snech 7× za 30 dní, naposledy minulou noc. Dá se potkat i ve dne.“,
- `score`, `whenKey`, `thenKey`, `weightedNights`, `nights30`, `lastSeenNightsAgo` a `withTest`,
- `sentence()`, která vrátí celou větu pro náhled.

Ve výchozím stavu je spouštěč bez testu: „udělám pauzu a zkontroluju, jestli sním“. Plný test zapne `withTest: true` („udělám pauzu a pak test reality“). Důvod je ILDIS, kde vyšel MILD s testy hůř.

## 2. `transferStats`

**Co počítám.** Pro každou Stopu a pro „jakoukoli Stopu“ (`anySign`) počítám sny, `realityCheckInDream` a lucidní sny, zvlášť před dnem `since` a od něj. Lucidní sen beru stejně jako Laboratoř: `lucid` nebo lucidita ≥ 5.

**Výstup.** Vracím počty (`before`, `after`, `total`), trychtýř „Stopa ve snu 6× · test ve snu 1× · lucidita 1×“ a pro obě metriky verdikt s hotovými texty a klíči.

**Verdikty** (`classifyTransfer`, v tomhle pořadí):

| verdikt | kdy |
|---|---|
| `noDreams` | Stopa není v žádném snu |
| `tooEarly` | od začátku plánu méně než 3 sny se Stopou (spec: od 3 objevení) |
| `noBaseline` | před plánem méně než 3 sny se Stopou |
| `noEventsYet` | 0 událostí před i po |
| `clearlyMore` | P(po > před) ≥ 0,95 a P(po − před > 0,10) ≥ 0,80 |
| `fewer` | zrcadlově |
| `possiblyMore` | P(po > před) ≥ 0,90, po aspoň 2 události a naměřený podíl vyšší |
| `noChangeYet` | jinak |

**Model.** Používám beta‑binomické srovnání se skeptickým priorem „po = před“:

- před plánem: Beta(1, 1),
- od začátku plánu: Beta(1 + 4m, 1 + 4(1 − m)), kde m je podíl před plánem.

Pravděpodobnosti počítám přesně na mřížce 2000 binů, bez Monte Carla, takže jsou deterministické.

Jako první jsem zkoušel pevný prior Beta(1, 4). Při nerovných vzorcích ale stahoval malé období víc a dával falešné „častěji“ až u 12 % lidí. Společný prior pro obě období zase ztrácel sílu, když bylo „před“ malé. Obě varianty zůstaly volitelné v `TransferThresholds`.

**Přesný výčet binomických výsledků** (`tool/sim.dart` v pracovním balíčku mimo dodávku, p 0,05 až 0,5, 3 až 40 snů na období, jeden pohled):

- Při nulovém rozdílu vyjde „Častěji než dřív“ nejvýš u 2,9 % a „častěji nebo náznak“ nejvýš u 9,2 %. Odpovídá to náznaku v Laboratoři, zhruba 1 z 10.
- Síla je malá a texty to přiznávají. Při 10 % → 40 % a 10 snech před i po vyjde jasný verdikt ve 29 % a jasný nebo náznak ve 47 %.
- Při opakovaném týdenním pohledu falešné verdikty přibývají. Proto texty říkají „od začátku plánu“, ne „díky plánu“. Příčinu má ověřit experiment E4 v Laboratoři.

**Texty.** Žádná procenta, jen přirozené četnosti: „ve 2 ze 7 snů“, „v žádném ze 7 snů“, „v tom jednom snu ano“. Předložku v/ve a z/ze určuju podle čtení čísla („ve dvou“, „ze sedmi“, „v pěti“, „ze sta“). Tvar „snů / snech“ beru z JSON.

## 3. `realityPromptsFromSigns(signs, dreams, {now, max = 4, excludeSignIds, text})`

- Vrátí 1 až 5 podnětů (`max` se ořízne), každý nejvýš 60 jednotek UTF‑16, takže limit platí i s emoji.
- Stopy beru ve stejném pořadí jako u `suggestTriggers`, s denní rotací, a střídám je dokola. Každá dostane jinou formu a forma se v jednom dni pokud možno neopakuje.
- Jedna Stopa dá 3 různé podněty.
- Bez Stop vrátí prázdný seznam a appka použije obecné podněty z `reality_prompts.json`.

## 4. Šablony a skloňování

Label je, jak ho uživatel napsal, a nikdy ho neskloňuju. Stojí na jednom ze dvou bezpečných míst:

- **za dvojtečkou:** „Stopa snů: škola. Sníš?“, „Dnes hledej: pes mluví.“,
- **v uvozovkách jako jméno** za slovem, které se skloňuje samo:
  - „Stopu snů „škola““, „ke Stopě snů „škola““, „jako ve Stopě snů „telefon nejde vytočit““,
  - „něco jako „pes mluví““ (u slova „něco“ je 1. a 4. pád stejný),
  - „pocit „panika““.

Dál platí:
- Nepoužívám minulý čas ve 2. osobě („udělal jsi“), protože bych musel znát rod. Slovesa ve 3. osobě volím tak, aby seděla s jednotným i množným číslem („se objeví“).
- `then` nezačíná zvratným „se“ ani „si“. Appka doplní „tak“ a „tak zastavím se“ by bylo špatně, proto „tak udělám pauzu a zkontroluju…“. `when` „se objeví…“ je po „Když“ správně.
- Podněty pro vnitřní prožitek nemají „Dnes hledej“, protože hledat paniku nedává smysl.

**Úklid labelu.**
- Odstraním řídicí znaky a zalomení, sloučím mezery a odstraním uvozovky (label vkládám do „“).
- Dlouhou pomlčku nahradím krátkou a odříznu interpunkci na krajích.
- Label bez písmen, číslic a symbolů přeskočím. Emoji zůstanou.
- Dlouhý label zkrátím se „…“ přednostně na mezeře, nikdy uprostřed emoji (ZWJ, modifikátory, vlajky). U spouštěčů nejvýš 40 znaků, u podnětů tolik, kolik dovolí limit 60.

Pojem píšu jako „Stopa snů“ (jednotné číslo), stejně jako `program.json` a `content_opraveno`. Zadání má příklad „Stopa snu“.

## 5. Texty a JSON

Všechny šablony jsou v `triggerTextsCs` a zrcadlově v `triggers_texty.json` pod `texts.triggers.*` (vygenerované z mapy, 2 mezery, UTF‑8).

Každá veřejná funkce bere `TriggerText text = czechTriggerText`. Z načteného JSON ho appka udělá přes `triggerTextFromJson(json)` a chybějící klíče doplní česká výchozí mapa.

Testy hlídají:
- stejné klíče a texty v JSON a v kódu,
- jen povolené zástupné symboly,
- že kód sahá jen na existující klíče (ověřeno sledováním volání),
- `when` a `then` nezačínají „Když“ ani „tak“,
- podněty ≤ 60 znaků,
- bez osamocených surrogate párů, dlouhé pomlčky, „%“ a zakázaných slov.

## 6. Zapojení

1. Smaž `dream_types.dart`, importuj vlastní modely a uprav importy v testu (`package:triggers_pkg/...`). JSON dej do assets, test ho hledá v `TRIGGERS_TEXTY`, `.`, `test/`, `assets/` a `../B/`.
2. **Návrh spouštěče (karta B):** zavolej `suggestTriggers(signs, dreams, now: DateTime.now(), excludeSignIds: {soukromé, aktivní, odmítnuté})`.
   - Na kartě ukaž `reason`.
   - Tlačítko „Jiný návrh“ přidá Stopu do vyřazených.
   - Volba „Přidat test“ zavolá funkci s `withTest: true`.
   - Max 3 aktivní hlídá appka.
3. **Večerní Záměr poznat sen** a audio z funkce 9 vezmou `TriggerSuggestion` s `kind == evening`.
4. **Notifikace:** použij `realityPromptsFromSigns(...)`. Prázdný výsledek znamená obecné podněty. Soukromé Stopy vždycky v `excludeSignIds`.
5. **Týdenní přenos (F):** zavolej `transferStats(signs, dreams, since: activatedAt)`.
   - Zobraz `title`, `body` a `funnelAfter`.
   - `probMore` je jen pro ladění, uživateli ho neukazuj.
   - Revizi po 21 dnech („Telefon se ve snech za 3 týdny neobjevil. Vyměníme ho?“) rozhodne appka podle `after.dreams == 0`.
