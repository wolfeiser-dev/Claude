# k3: změny (techniques.json, reality_tests.json, reality_prompts.json)

`check_a.py`: u všech tří souborů 0 chyb a 0 varování. Klíče, `id`, `technique`, `evidence`, `illustration`, `sources`, čísla, pořadí i délky seznamů zůstaly beze změny. Všechny `nightSteps` mají nejvýš 6 slov, všechny `notification`/`silent` nejvýš 60 znaků.

## techniques.json: změněných řetězců 81 (z 22 technik)

- **Názvy technik:** pole `name` u sedmi technik se zkratkou má teď český název první a zkratku v závorce, stejně jako už měl soubor u „Přepis noční můry (IRT)“ a jako je to ve zbytku appky: Záměr poznat sen (MILD), Střídání smyslů (SSILD), Probuzení a návrat do spánku (WBTB), Vědomé usnutí do snu (WILD), Návrat do snu hned po probuzení (DEILD), Usnutí s pohybem prstů (FILD), Vědomí po celý den (ADA). U MILD, WBTB a DEILD by `fullName` jen opakoval nový název, tak jsem ho přepsal na krátký popis postupu.
- **Holé zkratky v textu** (MILD, SSILD, WBTB, WILD, FILD) jsem nahradil českým názvem. Ve vlastní kartě techniky píšu zkráceně („k záměru“, „tuhle techniku“), v cizí kartě plně se zkratkou v závorce. V souboru už teď není žádná zkratka bez závorky.
- **Pojmy:** kategorie znaků snů jsou teď „děj, souvislosti, podoba a vnitřní prožitek“, stejně jako v lessons.json a v zadání B (dřív „tvar“ a „vědomí“). „Noc, která vyšla zeleně“ jsem navázal na „Jak ses vyspal“.
- **Typografie:** přímou řeč a otázky v příkladech dávám do českých uvozovek („Sním?“, „Tohle je sen.“). „meta-uvědomění“ je teď „metauvědomění“.
- **Jazyk:** „praktikanti“ jsou teď „praktikující“ (praktikant je v češtině stážista), „jiný design“ je „jiné uspořádání pokusu“, „data jsou skeptická“ je „data nejsou povzbudivá“, „Klid je důležitý“ je „Zůstaň v klidu“. Opravil jsem shodu („netestováno“ → „netestovaná“ u přípravy a opory) a nejednoznačný slovosled.

### Nejzajímavější příklady (před → po)
1. `techniques[0].name`: „MILD“ → „Záměr poznat sen (MILD)“ (`fullName`: „Záměr zapamatovat si, že sníš“ → „Vybavit si sen a usnout se záměrem“)
2. `techniques[2].nightSteps[4]`: „Lehni si. MILD nebo SSILD.“ → „Lehni si. Záměr nebo střídání smyslů.“ (6 slov)
3. `techniques[17].evidenceNote`: „…u šesti zkušených praktikantů … zachytil „nemožné akce“ jako průchod zdí, autoři ale na prospěch praxe neusuzují.“ → „…u šesti zkušených praktikujících … zachytil „nemožné akce“, třeba průchod zdí. Autoři z toho ale nevyvozují, že praxe prospívá.“
4. `techniques[4].why`: „Bez vybavování si lucidity nemáš ani kdy všimnout.“ → „A když si sny nepamatuješ, nepoznáš ani, jestli už nějaký byl lucidní.“
5. `techniques[8].evidenceNote`: „Nejbližší laboratorní data jsou skeptická: … (…, jiný design).“ → „Nejbližší laboratorní data nejsou povzbudivá: … (…, jiné uspořádání pokusu).“
6. `techniques[11].why`: „…ho podle LaBergea znovu zatíží a udrží. Klid je důležitý, protože nadšení probouzí.“ → „…ho podle LaBergea znovu naplní a udrží. Zůstaň přitom v klidu, nadšení probouzí.“
7. `techniques[2].summary`: „…a jen po noci, která vyšla zeleně.“ → „…, a to jen po noci, která v „Jak ses vyspal“ vyšla zeleně.“
8. `techniques[10].example`: „Téma je most. Ráno si vybavíš…“ → „Večer si zvolíš téma: most. Ráno si vybavíš…“ (původní začátek se dal číst jako metafora)
9. `techniques[0].example`: „…Pak se ve snu podíváš na dlaně.“ → „…Pak se v té představě podíváš na dlaně.“ (člověk je v tu chvíli vzhůru a jen si představuje)
10. `techniques[19].why`: „V malé studii se zlepšily spánkové deníky, lucidita testována nebyla.“ → „V malé studii se podle spánkových deníků zlepšil spánek, luciditu nikdo netestoval.“

## reality_tests.json: změněných řetězců 33 (16 testů, 72 podnětů, 12 spouštěčů, 8 zásad)

Texty byly v dobrém stavu. Opravoval jsem hlavně přechody osoby („když se dívám?“ → „když se díváš?“), kalky a cizí slova („anomálie“, „textura“, „linie“, „notifikace“, „automat“), pravopis („Při tom“ → „Přitom“), interpunkci vsuvky a nejednotné názvy úkonů („Zmáčkni si nos“ a „ucpaný“ → „Zacpi si nos“ a „zacpaný“, jako u testu `nose`).

1. `awarenessPrompts[aw_07].notification`: „Skočilo za poslední minutu něco náhle?“ → „Změnilo se za poslední minutu něco skokem?“
2. `awarenessPrompts[aw_53].prompt`: „Silná emoce, strach, nadšení nebo vztek, patří k častým znakům snů.“ → „Silná emoce (strach, nadšení nebo vztek) patří k častým znakům snů.“
3. `awarenessPrompts[aw_41].prompt`: „Všimni si chuti nebo jejího chybění.“ → „Všimni si chuti, nebo toho, že žádnou necítíš.“
4. `tests[memory].evidenceNote`: „…a po probuzení hrozí falešné probuzení.“ → „…a hned po probuzení tě může zmást falešné probuzení.“
5. `tests[fingers].tip`: „Rychlé počítání ve snu snadno projde bez povšimnutí.“ → „Při rychlém počítání si ve snu chyby snadno nevšimneš.“
6. `awarenessPrompts[aw_05].prompt`: „Řekni si klidně, že teď nesníš, ale až budeš, zastavíš se a poznáš to.“ → „Řekni si klidně: „Teď nesním, ale až budu snít, zastavím se a poznám to.““

## reality_prompts.json: změněných řetězců 3 (14 podnětů)

Soubor je podmnožina `awarenessPrompts` (rc_01 až rc_14) v reality_tests.json. Úpravy jsem udělal v obou souborech stejně, takže zůstávají shodné.
1. `prompts[rc_07].silent`: „Tvůj znak?“ → „Tvůj znak snu?“
2. `prompts[rc_14].silent`: „Jak se máš?“ → „Jak se cítíš?“ (navazuje na otázku po pocitu, ne na zdvořilost)
3. `prompts[rc_14].prompt`: „Pojmenuj pocit a podívej se, odkud přišel.“ → „Pojmenuj pocit a zkus zjistit, odkud přišel.“
