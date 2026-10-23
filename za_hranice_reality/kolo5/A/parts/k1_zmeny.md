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
