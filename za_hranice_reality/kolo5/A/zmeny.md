# Změny v textech (kolo 5, část A)

Redakce všech 16 obsahových souborů (`content_opraveno/`; `SLOVNIK.md` zkopírovaný beze změny). Pět korektorů (k1–k5) podle společných pravidel `_pravidla_korektury.md`, pak závěrečný průchod koordinátora: sjednocení kategorií Stop snů v programu (dny 3 a 8), doplnění dvou úprav UI, které kontrola nejdřív zablokovala (`copy_devices.json` `texts.telemetry.remBand.source`, `copy_reality.json` `texts.reality.test.evidence` → „Co víme“). Kontrola `check_a.py`: 0 chyb, 0 varování.

## Počty upravených řetězců

| Soubor | Upravených řetězců | Korektor |
|---|---|---|
| copy.json | 26 | k4 |
| copy_design.json | 7 | k4 |
| copy_devices.json | 13 | k4 |
| copy_journal.json | 9 | k4 |
| copy_lab.json | 10 | k4 |
| copy_reality.json | 9 | k4 |
| copy_training.json | 3 | k4 |
| experiments.json | 47 | k5 |
| lessons.json | 104 | k1 |
| novinky.json | 16 | k2 |
| program.json | 99 | k2 |
| reality_prompts.json | 3 | k3 |
| reality_tests.json | 33 | k3 |
| reflections.json | 40 | k5 |
| safety.json | 13 | k5 |
| techniques.json | 81 | k3 |
| **celkem** | **513** | |

## Co se opravovalo nejčastěji
- **Holé zkratky technik:** MILD, SSILD, WBTB a další stály samy v názvech, nadpisech a nočních krocích. Teď je všude český název první a zkratka v závorce (`techniques.json` `name`: „Záměr poznat sen (MILD)“).
- **Pojmy podle SLOVNIK.md:** kotva → připomínka, Stopy → Stopy snů, mapa šancí na REM → odhad výskytu REM, kategorie znaků snů jednotně děj / souvislosti / podoba / vnitřní prožitek, Ťukni → Klepni, Nový zápis → Zapsat sen, Nic si nevybavuju → Nic si nepamatuju.
- **AI nádech a kalky:** „je důležité“, „cesta“ jako metafora, „prediktor“, „preregistrovaná“, „dávat smysl“, „jiný design“, „data jsou skeptická“, anglicismy (orbity, notifikace, textura).
- **Gramatika a typografie:** shoda rodu, přechody osoby (tykání místo „my“), české uvozovky „“ u citovaných vět, dělení dlouhých souvětí, slovosled příklonek.
- **Limity:** 3 původní popisky ilustrací delší než 3 slova zkrácené, noční texty do 6 slov.

## 15 nejzajímavějších příkladů „před → po“

1. `techniques.json` `techniques[0].name`: „MILD“ → „Záměr poznat sen (MILD)“ (český název první)
2. `techniques.json` `techniques[2].nightSteps[4]`: „Lehni si. MILD nebo SSILD.“ → „Lehni si. Záměr nebo střídání smyslů.“ (i noční krok česky, 6 slov)
3. `copy.json` `nightGuide[4].night`: „MILD, nebo SSILD?“ → „Záměr, nebo střídání smyslů?“ (česky první i v noci)
4. `copy.json` `texts.signs.awareness / form`: „Vědomí / Tvar“ → „Vnitřní prožitek / Podoba“ (kategorie Stop snů jednotně s lekcemi a ilustracemi)
5. `copy.json` `texts.morning.emptyNight`: „Nic si nevybavuju“ → „Nic si nepamatuju“ (stejné znění jako v zadání a v modelu)
6. `program.json` `days[35].science.steps[1]`: „Tři dlaně o sebe a soustřeď se na teplo a tření.“ → „Začni třít dlaně o sebe a soustřeď se na teplo a tření.“ (rozkaz „tři“ se četl jako číslo)
7. `program.json` `days[2].intention.when`: „se mi bude zdát něco divného“ → „mi něco přijde divné“ („zdát se“ tu znamená i snít)
8. `program.json` `days[39].intention.when`: „se ve snu probudím do své ložnice“ → „se probudím ve své ložnici“ (ve chvíli probuzení ještě nevíš, že sníš)
9. `program.json` `days[28].science.steps[0]`: „Vyber si tři kotvy dne, …“ → „Vyber si tři připomínky dne, …“ (pojem podle SLOVNIK.md)
10. `lessons.json` `lessons[12].cards[2].body`: „Nejspolehlivější známý prediktor úspěchu je, že po technice usneš do 10 minut“ → „Úspěch nejlépe předpovídá to, že po technice usneš do 10 minut“ (žargon pryč)
11. `lessons.json` `lessons[15].cards[6].explain`: „…na chvíli, kdy se ve snu probereš.“ → „…na chvíli, kdy si ve snu uvědomíš, že sníš.“ („probereš“ se dalo číst jako „probudíš“)
12. `lessons.json` `lessons[18].cards[2].body`: „…replikace v jiné aplikaci vyšla nulová“ → „…opakování s jinou aplikací nic nenašlo“ (odborná hantýrka česky)
13. `techniques.json` `techniques[17].evidenceNote`: „…u šesti zkušených praktikantů…“ → „…u šesti zkušených praktikujících…“ (praktikant je v češtině stážista)
14. `techniques.json` `techniques[8].evidenceNote`: „Nejbližší laboratorní data jsou skeptická: … (…, jiný design).“ → „Nejbližší laboratorní data nejsou povzbudivá: … (…, jiné uspořádání pokusu).“ (kalk z angličtiny)
15. `copy_reality.json` `texts.reality.hub.today`: „Dnešní plán“ → „Dnešní připomínky“ (nepletlo se s „Plánem na dnešek“)

## Podrobné přehledy korektorů

<details><summary>k1</summary>

# k1: změny (lessons.json)

## lessons.json: změněných řetězců 104 (z 22 lekcí)

`check_a.py`: u lessons.json 0 chyb a 0 varování. Klíče, id, čísla, `tag`, `art`, `sources` i pořadí položek zůstaly beze změny. Popisy ilustrací (`artBrief`) jsem nechal, jsou čisté.

### Co jsem sjednotil
- **Techniky:** všude je první český název a zkratka v závorce, tedy formát, který už soubor používal. Holé zkratky v nadpisech, otázkách a vysvětleních jsem nahradil (MILD ve 4 řetězcích, WBTB ve 4 řetězcích). Uvnitř věty píšu název malým písmenem („k záměru poznat sen (MILD)“), po slově „technika“ velkým jako vlastní název („v technice Záměr poznat sen (MILD)“).
- **Slovosled:** kalk „REM fáze“ a „REM okno“ jsem změnil na „fáze REM“ a „okno REM“.
- **Citace v textu:** spojku mezi autory píšu česky „a“ (Casement a Swanson, Dijk a Czeisler, Aviram a Soffer-Dudek), protože tak už to soubor dělal jinde. Pole `sources` jsem nechal beze změny.
- **Pravopis:** „meta-uvědomění“ píšu jako „metauvědomění“, „theta“ jako „théta“, a citované otázky a pojmy dávám do českých uvozovek („Sním?“, „den jako sen“, „řízená halucinace“).
- **Tón:** dlouhá souvětí s čárkami jsem rozdělil na krátké věty. Doplnil jsem tykání tam, kde text přecházel do 1. os. mn. č. („vysvětlíme“ → „vysvětlíš“). Ubral jsem anglicismy a odbornou hantýrku: „prediktor“, „preregistrovaná“, „replikace vyšla nulová“, „oponentura“, „lucidní indukce“, „komunitní odhad“. Zmizelo i „klíčové“ a „cesta“ jako metafora.

### Nejzajímavější příklady (před → po)
1. `lessons[2].cards[2].title`: „MILD trénuje právě tohle“ → „Záměr poznat sen trénuje právě tohle“
2. `lessons[0].cards[2].body`: „REM fáze se k ránu prodlužují. Krátké probuzení zhruba po pěti hodinách tě postaví před nejdelší REM úseky noci, s čerstvou myslí a záměrem. … Spánek má ale přednost, v appce nejvýš dvakrát týdně.“ → „Fáze REM se k ránu prodlužují. Když se zhruba po pěti hodinách krátce probudíš, vstoupíš do nejdelších úseků REM s čerstvou myslí a se záměrem. … Spánek má ale přednost, proto appka tuhle techniku nabízí nejvýš dvakrát týdně.“
3. `lessons[12].cards[2].body`: „Nejspolehlivější známý prediktor úspěchu je, že po technice usneš do 10 minut“ → „Úspěch nejlépe předpovídá to, že po technice usneš do 10 minut“
4. `lessons[18].cards[0].body`: „Funguje jako vůně, která vybaví vzpomínku, ale jen když jste se předtím potkali.“ → „… ale jen když ses s ní už někdy setkal.“
5. `lessons[15].cards[6].explain`: „…na chvíli, kdy se ve snu probereš.“ → „…na chvíli, kdy si ve snu uvědomíš, že sníš.“ („probereš“ se dalo číst jako „probudíš“.)
6. `lessons[3].cards[2].body`: „nádech zavřenými rty … Jejich spolehlivost je komunitní odhad.“ → „nádech se zavřenými ústy … Jak jsou spolehlivé, je ale jen odhad praktiků.“ (Název testu jsem sjednotil s lekcí o falešném probuzení.)
7. `lessons[18].cards[2].body`: „Domácí efekt je tedy slibný, ale nepotvrzený: replikace v jiné aplikaci vyšla nulová“ → „Efekt doma je tedy slibný, ale nepotvrzený: opakování s jinou aplikací nic nenašlo“
8. `lessons[14].cards[5].body`: „Lucidní indukci v takovém období vynech … Appka může být parťák na přepis snu, ne náhrada péče.“ → „Pokusy o lucidní sny v takovém období vynech … Appka ti s přepisem snu pomůže, péči ale nenahradí.“
9. `lessons[15].cards[4].body`: „Vyber jednu otázku nebo obraz, napiš si ho do Deníku…“ (chybná shoda rodu) → „Vyber si jednu otázku nebo obraz a zapiš si je do Deníku. Před spaním si téma pár minut představuj…“
10. `lessons[19].cards[3].body`: „…jinak snadno skončíš ve falešném probuzení.“ → „…jinak snadno uvěříš falešnému probuzení.“ (Po zatočení člověk ve falešném probuzení často už je, jde o to, aby ho nepovažoval za skutečné.)
11. `lessons[10].cards[0].body`: „lidé se stávají lucidními často právě ve chvíli…“ → „lidé si často uvědomí, že sní, právě ve chvíli…“
12. `lessons[8].lead`: „Co víme, co nevíme a proč je to stejný sval.“ → „Co víme, co nevíme a proč meditace i lucidita stojí na stejném svalu.“

</details>

<details><summary>k2</summary>

# k2: změny (program.json, novinky.json)

## program.json: 97 upravených řetězců

Typické zásahy:
- **Techniky českým názvem** (dny 9–14 používaly holé „MILD“ a „SSILD“): nadpisy, cíle, kroky a „why“ teď používají „Záměr poznat sen“ a „Střídání smyslů“. Zkratka v závorce zůstala tam, kde už byla (mise dne 9 a 11, cíle týdnů 3–6), což odpovídá formátu souboru „Záměr poznat sen (MILD)“.
- **`intention.then`**: sjednocená koncová interpunkce. Dny 1–14 byly bez tečky a dny 15–42 s tečkou. Teď jsou všechny bez tečky (appka text skládá za „tak …“). Tečka zůstává jen uvnitř citované věty „…“. Jediné dvě věty v `then` (den 25) jsem spojil do jedné.
- **Přímá řeč v uvozovkách „“**: z „Řekni si: tohle je jako sen.“ je „Řekni si: „Tohle je jako sen.““ a stejně u „Sním?“ a vět záměru v `then`.
- **SLOVNIK**: „kotva“ → „připomínka“ (den 29 a 35). Jinak „mise“ zůstává, protože jde o Program.
- **Gramatika, kalky a vata**: „po 4,5 hodině“ → „po 4,5 hodinách“, „v druhé polovině“ → „ve druhé“, „nechám se usnout“ → „usnu“, „pokrok v procesu“ → „Vidět, co jsi udělal“, „cesta“ jako metafora pryč.
- **Štítek důkazů**: „proto nese štítek slibné“ → „proto má štítek „slibné““ (UI štítek zní „Výzkum: slibné“).

Příklady (před → po):
1. `days[35].science.steps[1]`: „Tři dlaně o sebe a soustřeď se na teplo a tření.“ → „Začni třít dlaně o sebe a soustřeď se na teplo a tření.“ (Rozkaz „tři“ se četl jako číslo 3.)
2. `days[2].intention.when`: „se mi bude zdát něco divného“ → „mi něco přijde divné“ (Původně to bylo dvojznačné, protože „zdát se“ tu může znamenat i snít.)
3. `days[39].intention.when`: „se ve snu probudím do své ložnice“ → „se probudím ve své ložnici“ (Ve chvíli probuzení ještě nevíš, že sníš. Proto následuje test.)
4. `days[8].why`: „MILD je nejlépe podložená technika. … trénink paměti na budoucí úmysl.“ → „Záměr poznat sen je nejlépe podložená technika. … trénink paměti na to, co máš udělat později.“
5. `days[28].yoga.steps[1]`: „Říkej jako sen, ne nic není skutečné.“ → „Říkej „jako sen“, ne „nic není skutečné“.“
6. `days[28].science.steps[0]`: „Vyber si tři kotvy dne, …“ → „Vyber si tři připomínky dne, …“
7. `days[24].intention.then`: „pustím ji, budu klidně dýchat a nechám spánek přijít. Spánek má přednost.“ → „pustím ji, budu klidně dýchat a nechám spánek přijít, protože spánek má přednost“
8. `days[26].why`: „Falešná probuzení bývají bránou k luciditě: …“ → „Z falešného probuzení se dá dostat k luciditě: …“ (Číslo 17 ze 121 sliby typu „bývají bránou“ neunese.)
9. `days[33].science.steps[4]`: „Těžké noční můry na sebe sám nenakládej. Na ně je … a u traumatu odborník.“ → „Na těžké noční můry tohle nepoužívej. Na ně je Přepis noční můry (IRT), a když jde o trauma, odborník.“
10. `days[24].morningTask`: „V Jak ses vyspal buď upřímný, je to důležitější než lucidita.“ → „V Jak ses vyspal odpovídej poctivě, na tom záleží víc než na luciditě.“
11. `days[40].science.title`: „Experiment N-of-1: co víš o sobě“ → „Experiment na sobě (N-of-1): co o sobě víš“
12. `days[22].why`: „Delší sezení Střídání smyslů souviselo s úspěchem mírně negativně a hybrid se Záměrem …“ → „Delší Střídání smyslů vycházelo o něco hůř než kratší a kombinace se Záměrem …“

## novinky.json: 16 upravených řetězců

Typické zásahy: technika bez českého názvu (WBTB), „Stopy“ → „Stopy snů“, „mapa šancí na REM“ → „odhad výskytu REM“, „Ťukni“ → „Klepni“, anglicismus „orbity“, chybná shoda („přijde“ + výčet).

Příklady:
1. `releases[5].items[1]`: „… noční průvodce WBTB a budík.“ → „… noční průvodce Probuzením a návratem do spánku (WBTB) a budík.“
2. `releases[2].items[0]`: „Spánek: nová mapa šancí na REM jako jasná časová okna (vysoká, střední, nízká). Ťukni … čas, úroveň a proč.“ → „Spánek: nová mapa REM ukazuje odhad výskytu REM v jasných časových oknech (vysoký, střední, nízký). Klepni … čas, úroveň a důvod.“
3. `releases[1].items[0]`: „Po dvou týdnech základů přijde Záměr poznat sen (MILD), … vědomí po celý den, inkubace snu a jak sen udržet.“ → „… přijdou na řadu …, Vědomí po celý den (ADA), inkubace snu a udržení snu.“
4. `releases[0].items[7]`: „Spánek se s rostoucím počtem nocí už nezpomaluje …“ → „Obrazovka Spánek se s přibývajícími nocemi už nezpomaluje …“
5. `releases[4].items[2]`: „Stopy: opakující se slova …“ → „Stopy snů: opakující se slova …“
6. `releases[4].items[9]`: „… orbity snů …“ → „… oběžné dráhy snů …“
7. `releases[1].items[8]`: „Přechody mezi obrazovkami bez překrývání textů.“ → „Přechody mezi obrazovkami už nepřekrývají texty.“
8. `releases[3].items[1]`: „… diktát jede přes Google online …“ → „… diktát běží přes online službu Google …“

`check_a.py`: program.json ani novinky.json nemají žádnou chybu ani varování.

</details>

<details><summary>k3</summary>

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

</details>

<details><summary>k4</summary>

# k4: změny v textech UI (copy*.json)

Výchozí stav byl celkem čistý (typografie bez chyb: žádné rovné uvozovky, dlouhé pomlčky, „...“ ani nalepené jednotky). Úpravy jsou hlavně sjednocení pojmů a tlačítek, noční texty do 6 slov a oprava 3 popisků ilustrací.

## Počty upravených řetězců (podle check_a.py)
| Soubor | Řetězců |
|---|---|
| copy.json | 26 |
| copy_design.json | 7 |
| copy_devices.json | 12 |
| copy_journal.json | 9 |
| copy_lab.json | 10 |
| copy_reality.json | 8 |
| copy_training.json | 3 |
| **celkem** | **75** |

check_a.py: u všech 7 souborů 0 chyb a 0 varování.

## Hlavní linie sjednocení
- **Kategorie znaků snů** podle zadání (B) a ilustrace `dreamSignGrid`: Děj, Souvislosti, **Podoba**, **Vnitřní prožitek** (dřív v copy.json „Tvar“ a „Vědomí“). Totéž v `patches[7].condition`.
- **Tlačítko „Nic si nepamatuju“** (dřív „Nic si nevybavuju“). Tak ho jmenuje zadání C a sedí s `journal.emptyNightBody`.
- **„Zapsat sen“** podle SLOVNIK.md: `texts.journal.newEntry` (dřív „Nový zápis“).
- **zápis místo záznamu** pro deník i laboratoř (Zápisy: {pocet}, Zápis, nocí se zápisem, Bez zápisu, Oprav zápis).
- **Stejná akce = stejné slovo:** „Vyzkoušet teď“ (techniky i testy), „Vibrace hodinek“ (dvě obrazovky), „Tvoje znaky snů“, „Tenhle test jsme nenašli.“ (jako u techniky a lekce), „Pozastavit“ místo „Pauza“ (vedle „Přehrát nahrávku“), „Učesání textu“ místo „Úprava textu“ (k tlačítku „Učesat text“), stavové štítky v krátkém tvaru („Nahrávka uložena“, „Klíč uložen“).
- **„Klepni“** všude (dřív i „Ťukni“).
- **Když … tak …**: výpustka s mezerou a čárka před „tak“, sjednoceno ve třech souborech.
- **Techniky:** WBTB v copy.json ve formátu „(WBTB)“ jako jinde v souboru, „Vědomí po celý den (ADA)“, „budík WBTB“ nahrazený „budíkem pro noční probuzení“ nebo „nočním budíkem“.
- **Noční obrazovka:** všechny `texts.night.*` mají nejvýš 6 slov (calmBody, mildAtWakeBody, wbtbBody, awake, awakeLimit). Rozsah je teď „5–10 min“.
- **Kalk „dávat smysl“** v laboratoři pryč.

## Příklady před → po
1. `copy_training.json` `texts.training.art.ssild.rhythm`: „4× RYCHLE, PAK POMALU“ → „4× RYCHLE → POMALU“ (3 slova, číslo zachované)
2. `copy_training.json` `texts.training.art.body.caption`: „SCHÉMA POZORNOSTI, NE ANATOMIE“ → „SCHÉMA, NE ANATOMIE“ (vzor „PRINCIP, NE MĚŘENÍ“)
3. `copy_training.json` `texts.training.art.breath.note`: „VÝDECH DELŠÍ NEŽ NÁDECH“ → „DELŠÍ VÝDECH“
4. `copy.json` `texts.night.mildAtWakeBody`: „Probudíš se v noci? Nehýbej se a začni s MILD.“ → „Probudíš se? Nehýbej se, opakuj záměr.“
5. `copy.json` `texts.night.wbtbBody`: „Budík zhruba pět hodin po usnutí, krátká technika a zpátky spát.“ → „Po pěti hodinách budík a technika.“
6. `copy.json` `nightGuide[4].night`: „MILD, nebo SSILD?“ → „Záměr, nebo střídání smyslů?“ (česky první, i v noci)
7. `copy.json` `texts.signs.awareness` / `form`: „Vědomí“ / „Tvar“ → „Vnitřní prožitek“ / „Podoba“
8. `copy.json` `texts.morning.emptyNight`: „Nic si nevybavuju“ → „Nic si nepamatuju“
9. `copy_reality.json` `texts.reality.test.guide.doTest`: „Teď test“ → „Udělej test“ (aby se nepletl s tlačítkem „Test teď“)
10. `copy_reality.json` `texts.reality.hub.today`: „Dnešní plán“ → „Dnešní připomínky“ (časová osa testů; „Plán na dnešek“ podle slovníku patří večernímu plánu, tak ať se nepletou)
11. `copy_lab.json` `texts.lab.verdict.clearA.body`: „…rozdíl je dost velký, aby dával smysl.“ → „…rozdíl je dost velký, aby se s ním dalo počítat.“
12. `copy_lab.json` `texts.lab.endPrompt`: „Klidně si mezi tím dej…“ → „Klidně si mezitím dej…“ (pravopis)
13. `copy_devices.json` `texts.telemetry.avgHr` / `lowestHr`: „Tep průměr“ / „Tep nejnižší“ → „Průměrný tep“ / „Nejnižší tep“
14. `copy_design.json` `texts.design.program.spanWeek1`: „Den 1–14“ → „Dny 1–14“ (stejně u 15–28 a 29–42)
15. `copy_journal.json` `texts.morning.feelingLow` / `High`: „vyčerpaný“ / „svěží“ → „vyčerpaně“ / „svěže“ (bez rodu, stejně jako stupnice feeling1–5)

</details>

<details><summary>k5</summary>

# k5: změny (reflections.json, experiments.json, safety.json)

Měnil jsem jen textové hodnoty. Klíče, `id`, `tag`, `evidence`, `techniqueId(s)`, `source`, čísla a pořadí zůstaly beze změny. `check_a.py` u těchto tří souborů nehlásí žádnou chybu ani varování.

| Soubor | Upravených řetězců | Hlavní typy úprav |
|---|---|---|
| reflections.json | 40 z 54 | jednotný přepis Čuang-c' (jen v textech, zdroje zůstaly), české uvozovky u citovaných vět, rozdělené dlouhé souvětí, opravený slovosled (příklonky), kalky („čte jako“ → „chápe jako“), nejasné vztažné „který“, vata kolem metafory „cesta“ |
| experiments.json | 47 | slovník: ADA = „Vědomí po celý den (ADA)“, uzemnění podle ostatních souborů; místo středníků samostatné věty; pokyny jako slovesa v rozkazovacím způsobu („Přes den udělej…“); přímá řeč v uvozovkách; plynulejší slovosled |
| safety.json | 13 | jasnější vztah zájmen („ho“ po výčtu), přirozenější věty, doplněná dvojtečka před výčtem, upřesnění „Občasné noční můry“; `nightSteps` jsem neměnil (všechny mají nejvýš 6 slov) |

## Nejzajímavější příklady „před → po“

1. `reflections.json` → `reflections[r27].text`
   „Přesně tohle zkoumá otázka, jak vede cesta až sem.“ → „Přesně tohle zkoumá otázka „Jak jsem se sem dostal?““
2. `reflections.json` → `reflections[r31].text`
   „svět, který vidíš, je nejlepší odhad mozku, který smysly průběžně drží při zemi“ → „svět, který vidíš, je nejlepší odhad tvého mozku a smysly ho průběžně drží při zemi“ (původní „který“ se vztahovalo k mozku)
3. `reflections.json` → `reflections[r33].text`
   „Když Frederic Bartlett nechal lidi opakovaně převyprávět cizí příběh, každým převyprávěním se víc podobal jejich vlastnímu světu.“ → „Frederic Bartlett nechal lidi opakovaně převyprávět cizí příběh. S každým převyprávěním se příběh víc podobal jejich vlastnímu světu.“ (chyběl podmět, gramaticky se „podobal“ vztahoval k Bartlettovi)
4. `reflections.json` → `reflections[r09].text`
   „Párkrát dnes řekni: tohle je jako sen. Jako, ne neskutečné. Když přijde úzkost, chodidla na zem.“ → „Párkrát si dnes řekni: „Tohle je jako sen.“ Jako sen, ne neskutečné. Když přijde úzkost, polož chodidla na zem.“
5. `reflections.json` → `reflections[r54].text`
   „Učitelé jógy snu radí ve snu se ke strachu obrátit místo útěku. Strach podle nich drží hlavně dojem…“ → „Učitelé jógy snu radí před strachem ve snu neutíkat, ale obrátit se k němu čelem. Strach podle nich živí hlavně dojem…“
6. `reflections.json` → `reflections[r51].text`
   „…začíná ve dne: opakovaně si připomínat, že to, co právě prožíváš, je jako sen.“ → „…začíná ve dne: opakovaně si připomínáš, že to, co právě prožíváš, je jako sen.“ (míchání infinitivu a 2. osoby)
7. `experiments.json` → `experiments[adaVsQuickTest].title` a `arms[B].label`
   „Kritická reflexe (ADA), nebo rychlý test“ → „Vědomí po celý den (ADA), nebo rychlý test“ (podle SLOVNIK.md a program.json)
8. `experiments.json` → `experiments[rtThreeVsSix].question`
   „Přidá mi šest testů reality denně něco proti třem pořádným?“ → „Pomůže mi šest testů reality denně víc než tři pořádné?“
9. `experiments.json` → `experiments[rtThreeVsSix].why`
   „…přenos návyku z jednoho dne do dalšího rozdíl spíš rozmaže, nevyrobí.“ → „Návyk se přenáší i do dalšího dne, takže rozdíl spíš rozmaže, než aby ho vytvořil.“
10. `experiments.json` → `experiments[rtThreeVsSix].safety` (stejně `adaVsQuickTest` a `meditationEvening`)
    „přestaň a přejdi na Návrat do těla a do přítomnosti“ → „přestaň a přejdi na uzemnění“ (stejné znění jako v techniques.json, lessons.json, program.json a safety.json)
11. `experiments.json` → `experiments[mildVsJournal].arms[B].instruction`
    „Řekni si: Až budu příště snít, uvědomím si, že sním. Představ si, že to poznáš.“ → „Řekni si: „Až budu příště snít, uvědomím si, že sním.“ Představ si, že to ve snu poznáš.“
12. `experiments.json` → `experiments[caffeineCutoff].arms[B].instruction`
    „…kola ani energetický nápoj. Dopoledne jako obvykle.“ → „…kola ani energetické nápoje. Do té doby jako obvykle.“ (zákaz platí od 14:00, ne od poledne)
13. `safety.json` → `screening.results.limitWbtb.body`
    „Deník, záměr a denní praxe běží. Zapnout ho můžeš v nastavení…“ → „Deník, záměr a denní praxe běží dál. Noční probuzení zapneš v nastavení…“ („ho“ se po výčtu nevztahovalo k ničemu)
14. `safety.json` → `locks.noSleep.body`
    „Usínání po technice tentokrát nešlo.“ → „Po technice se ti tentokrát nepodařilo usnout.“

## Vědomě ponecháno
- „Předletová kontrola“ (`screening.title`, `locks.screening.body`): je to název funkce, který používá i copy.json.
- `nightSteps` a `steps` bezpečnostních karet: jsou krátké, klidné a v limitu, a tak zůstaly beze změny.
- Rozsahy typu „10 až 30 minut“ a „0 až 10“ v pokynech experimentů jsem nepřepisoval na pomlčku, protože se slovy se v pokynu čtou lépe.

</details>

