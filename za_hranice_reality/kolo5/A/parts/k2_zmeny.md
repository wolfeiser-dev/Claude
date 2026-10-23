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
