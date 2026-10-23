# Věcné pochybnosti (kolo 5, část A)

Co při korektuře věcně nesedělo. V textech se to **neopravovalo**, rozhodnutí je na vás. Plné texty byly z prostředí místy nedostupné (PMC, Frontiers), korektoři pak ověřovali přes vyhledávání; kde to platí, je to u bodu uvedené.

## Napříč appkou (koordinátor)
1. **ADA:** `techniques.json` `ada.fullName` je „Kritická reflexe podle Tholeye“, SLOVNIK.md vede ADA jako „Vědomí po celý den“. Tholeyho kritická reflexe a celodenní vědomí (ADA) nejsou totéž. Text zůstal, rozhodněte, co technika v appce opravdu je.
2. **Kategorie znaků snů:** sjednoceno na děj / souvislosti / podoba / vnitřní prožitek (lekce, ilustrace, zadání B, nově i UI a program). Pokud má UI jinde natvrdo „Tvar/Vědomí“ mimo obsahové soubory, je potřeba ho změnit taky.
3. **Délka názvů technik:** `name` je teď delší (nejvýš 39 znaků, např. „Návrat do snu hned po probuzení (DEILD)“). Zkontrolujte, že se vejde na kartu; nouzově lze dát zkratku zpět do `name` a český název do `fullName`.
4. **SLOVNIK.md** uvádí „mise jen v Programu (14 dní)“, Program má ale 42 dní. A „Zachytit signál“ jako nadpis rána v textech není, ranní obrazovka se jmenuje „Ranní hlášení“.
5. **Stejné klíče s různými texty** v `copy.json` a `copy_journal.json` (např. `texts.morning.record`) a v `copy.json` a `copy_training.json` (`texts.techniques.title`: „Techniky“ / „Výcvik“). Výsledek závisí na pořadí slučování souborů.
6. **Skloňování po číslech** (např. „{pocet} kapitol“ pro 2–4) a mužský rod v minulém čase napříč appkou: řešit v kódu (plurály, rodově neutrální varianty).

## Korektor k1


Obsah v textu jsem neměnil. Všechny body níž čekají na rozhodnutí autora.

1. **`lessons[5].cards[1].body`: „Zažije ji zhruba pětina lidí.“**
   - Systematický přehled Sharpless a Barber (2011, Sleep Med Rev 15(5):311–315) uvádí celoživotní výskyt spánkové paralýzy 7,6 % v běžné populaci, 28,3 % u studentů a 31,9 % u psychiatrických pacientů. „Pětina“ odpovídá jen průměru přes všechny skupiny (20,8 %).
   - Pro běžného čtenáře je tak číslo spíš nadsazené. Návrh: „Aspoň jednou ji zažije zhruba každý desátý až pátý člověk, studenti častěji.“ Případně uvést zdroj.
   - Zdroj: https://pmc.ncbi.nlm.nih.gov/articles/PMC3156892/

2. **`lessons[16].cards[4].body`: „jediná studie lucidního snu pomocí fMRI měla jednoho analyzovatelného člověka (Dresler 2012)“**
   - Stejná skupina už publikovala Dresler a kol. 2011 (Current Biology, „Dreamed movement elicits activation in the sensorimotor cortex“). Ta studie také použila fMRI během lucidního snu, rovněž s velmi malým vzorkem.
   - „Jediná“ je proto nejspíš nepřesné. Návrh: „první studie lucidního snu pomocí fMRI…“ nebo „studie pomocí fMRI měly jednotlivce“.

3. **`lessons[9].cards[2].body`: výčet přirovnání z Diamantové sútry**
   - Známý závěrečný verš má v sanskrtské verzi devět obrazů: hvězda, porucha zraku (mžitky), lampa, iluze, rosa, bublina, sen, blesk, mrak. Kumáradživův čínský překlad jich má šest.
   - V textu je osm obrazů a chybí „porucha zraku“. Není to chyba, která by čtenáře mátla, ale výčet není úplný. Stačí doplnit, nebo napsat „mimo jiné ke hvězdě…“.

4. **`lessons[8].cards[1].body`: „Meditace luciditu nezpůsobí, ale trénuje schopnosti, na kterých lucidita stojí.“**
   - Předchozí věty v kartě tvrdí, že souvislost je nejasná („Možná… Možná ale…“). Rozhodný závěr pak jde dál, než data dovolují.
   - Návrh: „Meditace luciditu přímo nevyvolá, ale nejspíš trénuje schopnosti, na kterých lucidita stojí.“

5. **`lessons[12].cards[2].body` (Aspy 2020, „usneš do 10 minut“): ověřeno, sedí.**
   - Abstrakt ILDIS uvádí jako nejsilnější prediktor usnutí do 10 minut. Populární články zmiňují 5 minut, ty se ale týkají jiného výpočtu.
   - Zdroj: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7379166/

6. **`lessons[17].cards[3].body`: „všech 24 signálem ověřených lucidních snů proběhlo v REM“ (LaBerge, Nagel, Dement a Zarcone 1981)**
   - Počet se mi z dostupných abstraktů nepodařilo ověřit. Mám v paměti jiné číslo: 35 hlášených a 30 signálem ověřených snů. Jistý si tím ale nejsem.
   - Doporučuju ověřit v originále: Perceptual and Motor Skills 52(3):727–732, doi 10.2466/pms.1981.52.3.727.

7. **`lessons[18].cards[3].body`: „ze 158 pokusů … 18 % správných“ (Konkoly 2021)**
   - V článku je 29 správných odpovědí ze 158 pokusů, tedy 18,4 %. Zaokrouhlení dolů je v pořádku, jen upozorňuju.

## Korektor k2


Pozn.: weby frontiersin.org a ncbi.nlm.nih.gov nešly v tomhle prostředí stáhnout (DNS). Ověřoval jsem jen přes výsledky vyhledávání.

1. **`program.json` → `days[21].why`, `days[24].why`, `days[29].why` (Aspy 2020, 16,9 % SSILD proti 16,5 % MILD).** Výsledky vyhledávání se v tom, ke které technice které číslo patří, neshodují. Jeden souhrn uvádí obráceně „SSILD 16,5 %, MILD 16,9 %“, druhý to má jako appka. Je potřeba to ověřit v tabulce původního článku (Frontiers in Psychology 11:1746, doi 10.3389/fpsyg.2020.01746). Shodně se uvádí, že hybrid MILD+SSILD neměl žádnou výhodu. Tvrzení „vyšel ze všech skupin nejhůř“ (`days[22]`) jsem nepotvrdil.
2. **`days[26].why` a `days[26]`, `days[28]` (test „zavři rty a zkus se nadechnout ústy“ připsaný Aspy 2020).** Ve studiích Aspyho (NALDIS, ILDIS) se podle mé paměti používal test se zacpaným nosem (zkusit dýchat nosem). Varianta se zavřenými ústy je komunitní. Ověřit, jestli citace sedí na tuhle variantu.
3. **`days[31].why` („Test s prstem a dlaní používala velká domácí studie (Aspy 2020)“).** Jako bod 2: jestli šlo v ILDIS právě o test s prstem a dlaní, jsem nepotvrdil.
4. **`days[35].why` a jógy dnů 36, 39, 41 („pravý bok“ podle Wangyala 1998).** Tenzin Wangyal Rinpočhe v knize The Tibetan Yogas of Dream and Sleep doporučuje mužům pravý bok a ženám levý. Appka dává všem pravý bok. Ten je vždy podmíněný slovy „pokud je ti to pohodlné“, takže nejde o riziko, ale citace zjednodušuje.
5. **`days[35].goal` („poprvé zkusit jógu snu před usnutím“).** Lotos v hrdle při usínání už byl ve dnech 10, 11 a 13 (`days[9..12].yoga`). Slovo „poprvé“ v rámci programu nesedí.
6. **`days[13].science.steps[2]` („Vyber si na další týdny Záměr poznat sen, nebo Střídání smyslů“).** Týdny 3–6 ale vedou obě techniky postupně, takže volba ve dni 14 na nic nenavazuje. Asi pozůstatek ze 14denní verze programu.
7. **`days[26].morningTask`.** Původně „označ to v poznámce jako falešné probuzení“. Model `Dream` ale má samostatný příznak `falseAwakening`, proto jsem „v poznámce“ vypustil. Ověřit, že ho zápis snu v UI nabízí.
8. **`intention.then`: koncová tečka.** Sjednotil jsem to bez tečky (appka text řadí za „tak …“). Kdyby appka tečku na konec nepřidávala, v kartě dne bude věta bez tečky. Ověřit v widgetu karty dne.
9. **Mezi soubory (pro koordinátora): názvy kategorií znaků snů.** `program.json` a `copy.json` (`texts.signs`) používají „děj, souvislosti, tvar, vědomí“. `lessons.json` a ilustrace (`copy_training.json` → `dreamSignGrid`) ale používají „podoba“ a „vnitřní prožitek“, stejně jako ZADANI.md. Program jsem nechal podle UI (copy.json). Je potřeba sjednotit na jednu dvojici.
10. **`days[36].why` (Mota-Rolim a kol. 2013: lucidní sny „u téměř poloviny lidí pod minutu“) a `days[33].why` (Schredl, Dyck & Kühnel 2020: 18 % proti 6 %).** Čísla jsem nezměnil, ale nepodařilo se mi je ověřit. Doporučuji je zkontrolovat proti abstraktům.
11. **`novinky.json` → `releases[4].items[5]`.** Štítky důkazů z verze 0.4 („věda silné“, „věda slibné“) neodpovídají dnešním popiskům v `copy.json` („Výzkum: nejlépe podložené“, „Výzkum: slibné“). Jde o historickou poznámku k vydání, proto jsem je jen dal do uvozovek.

## Korektor k3


V textu jsem nic z toho neopravoval. Čísla z ILDIS a z Erlacher a Stumbrys 2020 jsem ověřil v plných textech (Europe PMC).

## 1. SSILD + MILD (hybrid) „vyšla nejhůř“: neplatí pro celou studii
- **Cesta:** `techniques.json` → `ssild.evidenceNote` („Kombinace … vyšla nejhůř (13,3 %)“) a `ssild.mistakes[2]` („Tahle kombinace vyšla nejhůř.“)
- **Co nesedí:** V ILDIS měl ve 2. týdnu hybrid 13,3 % nocí s lucidním snem. Nejhůř ale vyšla skupina MILD + WBTB + dechový test reality se **10,8 %**. Hybrid je nejhorší jen mezi skupinami **bez** testů reality (MILD 18,4 % a 20,2 %, SSILD 16,9 %, hybrid 13,3 %). Rozdíly mezi skupinami navíc nebyly významné (χ², p = 0,47 a 0,13).
- **Návrh:** „vyšla nejhůř ze skupin bez testů reality (13,3 %)“ nebo „nepřinesla žádnou výhodu“. Sám autor píše: „The hybrid technique showed no advantage over MILD or SSILD.“
- **Zdroj:** Adventure-Heart (Aspy) 2020, Front. Psychol. 11:1746, tab. 4, PMC7379166.

## 2. MILD + testy reality: 12,1 % proti 19,4 %
- **Cesta:** `mild.evidenceNote`
- **Ověřeno:** sedí. Jsou to podíly nocí (L DRF Lucid) za skupiny MILD + WBTB s testy reality (n = 88) a bez nich (n = 118), Mann–Whitney p = 0,052. Označení „hraniční výsledek“ je správné. „Rán s lucidním snem“ jsem nechal, protože je to v podstatě totéž.

## 3. WBTB: laboratorní čísla a délka bdění
- **Cesta:** `wbtb.evidenceNote`, `wbtb.steps[0]`, `wbtb.steps[3]`, `wbtb.summary`
- **Ověřeno:** 27 % (60 min), 14 % (30 min) a 0 % signálů očí při čtení sedí.
- **Pozor na kontext:** Ve studii budili lidi **po 6 h spánku** z REM a bdění trvalo **30–60 min**. Appka radí budík po 5 h a 5–10 min bdění. Text to sám neprotiřečí („laboratorní čísla se nedají přímo přenést“), čtenář si ale může myslet, že 27 % platí pro postup v appce. Zvážit dovětek, že v laboratoři bylo bdění delší.
- **Zdroj:** Erlacher a Stumbrys 2020, Front. Psychol. 11:1383, PMC7332853.

## 4. FILD: „dotek na prstu“ byla vibrace
- **Cesta:** `fild.evidenceNote`
- **Co nesedí:** Paul, Schädlich a Erlacher 2014 dávali během REM **vibraci na ukazovák**. Ta v 0 z 21 aplikací vyvolala signálem ověřený lucidní sen, takže číslo sedí. Slovo „dotek“ ale podnět zjednodušuje. Návrh: „vibrace na ukazováku“.
- **Zdroj:** IJoDR 7(1), 61–66 (2014).

## 5. Meditace: „metauvědomění … ve studii zprostředkovalo vztah“
- **Cesta:** `meditation.why`
- **Co nesedí:** Abstrakt Gerhardt a Baird 2024 (Brain Sciences 14(5):496) mluví o metauvědomění jen jako o procesu, který spojuje meditaci, všímavost a lucidní snění. Formální mediační analýzu v abstraktu neuvádí. Baird a kol. 2019 o mediaci nepíše vůbec. Plný text Gerhardt a Baird jsem neověřil, proto doporučuju opatrnější znění: „…a právě to ve studii souviselo s meditací i s luciditou“.
- U `meditation.evidenceNote` („denně meditující víc než ti, kdo meditují jednou týdně“) abstrakt říká: denně meditující mají víc lucidních snů než ti, kdo meditují zřídka. Týdenní meditující vyšší četnost neměli. Formulace v textu je tedy přibližně správná. Čísla 1,11 proti 0,45 jsem v dostupném abstraktu ověřit nemohl.

## 6. Znaky snů, kategorie „souvislosti“
- **Cesta:** `dreamJournal.steps[5]` („Souvislosti: místo nebo situace nesedí.“)
- **Co nesedí:** Podle lessons.json (karta s kategoriemi LaBerge) patří místo, které vypadá jinak, do **podoby**. Souvislosti jsou „běžné věci na nečekaném místě“. Definice v technikách se s lekcí rozchází. Návrh: „Souvislosti: věc, člověk nebo situace na nečekaném místě.“
- Názvy kategorií (tvar → podoba, vědomí → vnitřní prožitek) jsem v techniques.json sjednotil. **program.json** (není můj) má pořád „děj, souvislosti, tvar nebo vědomí“ (dny s úkolem zařadit znak snu). Doporučuju sjednotit i tam.

## 7. Testy reality: drobnosti
- `reality_tests.json` → `tests[light].evidence = promising`, `reliability = low` a podle `evidenceNote` existuje jen doporučení Tholeyho, žádné měření. Úroveň „promising“ je tu proti ostatním testům (ruce, hodiny = „tradition“) nadsazená. Totéž platí u `turn` a `oddity` (jen Tholey, „neměřil se“). Hodnotu `evidence` jsem neměnil, je chráněná.
- `tests[dreamsign].evidenceNote` cituje „Purcell (1988)“. ILDIS uvádí obě práce, Purcell a kol. (1986) i Purcell (1988), a to s účinkem testů reality za 3 týdny. Neověřil jsem, která z nich popisuje podmínku se čtením vlastních snů.
- `tests[lips]`: ověřeno, ILDIS (skupina 2) používala dech přes zavřená ústa a odkazuje na Aspy a kol. 2017. `tests[palm]`: skupina 3 ILDIS, sedí.

## 8. Pro koordinátora (není věcná chyba)
- Pole `name` u sedmi technik je teď delší (např. „Návrat do snu hned po probuzení (DEILD)“, 39 znaků). Jestli ho appka zobrazuje v úzkých štítcích nebo se podle něj něco páruje, je potřeba to zkontrolovat v UI. Kdyby to nešlo, záložní varianta je vrátit zkratku do `name` a český název dát do `fullName`.
- copy.json používá u WBTB formát s tečkou („Probuzení a návrat do spánku · WBTB“). Já jsem podle souboru a většiny appky zvolil závorku.

## Korektor k4


## Věcné
1. **`copy.json` `texts.notifications.wbtbAlarmBody`**: „Vstaň na pár minut…“ jde proti nočnímu průvodci (`nightGuide[0–2]`: „Budík. Nehýbej se.“, „Zůstaň se zavřenýma očima a vybav si sen.“, „Řekni tři slova“). Notifikace přeskakuje vybavení snu, které má být první. Návrh: „Nejdřív si vybav sen, pak pár minut vzhůru.“ Text jsem nechal beze změny, protože jde o obsah.
2. **Noční probuzení v prvních 14 dnech:** `copy.json` povoluje jedno (`wbtb.offerBody`, `wbtbReason.programLimit`, `tooEarlyInProgram`: nejdřív 10. den). Oproti tomu `copy_lab.json` `texts.lab.wbtb.inFirst14Days` říká „Noční probuzení přijde potom“. Pro laboratoř to může platit, ale čte se to jako rozpor. Návrh: „V prvních 14 dnech laboratoř noční probuzení nepoužívá.“
3. **`copy_reality.json` `texts.reality.settings.perDayNote`**: „Výzkum a zkušenosti lidí mluví spíš o 5× denně mezi 9. a 21. hodinou.“ Běžně uváděný rozsah je 5–10× denně (Stumbrys et al. 2012, Consciousness and Cognition 21(3); shrnuto např. v IJoDR 2020, https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/37498/pdf/136208). Přesný počet v protokolu Aspy et al. 2017 (Dreaming, doi 10.1037/drm0000059) jsem neověřil. Okno 9–21 h je spíš pravidlo appky než výsledek výzkumu.
4. **`copy.json` `texts.night.wbtbBody`**: kvůli limitu 6 slov vypadlo „zhruba“ (teď „Po pěti hodinách budík a technika.“). Skutečný čas počítá appka (`telemetry.wbtbWindow`). Kdyby mělo „asi“ zůstat, chce to jinou formulaci.

## Pojmy a SLOVNIK.md
5. **„mise jen v Programu (14 dní)“**: Program má 42 dní (`patches[12]`, `ofTotal`). „Mise“ teď stojí v nášivkách (`patches[0]` „Začátek mise“ u prvního ranního zápisu, `patches[10]`, `patches[12]`) a v `copy_design.json` (`today.programPatch` „Program mise“ na obrazovce Dnes, `program.profile`, `missionCode`). Nechal jsem to tak, protože vše souvisí s programem. Rozhodni, jestli „Program mise“ na obrazovce Dnes a „Začátek mise“ u deníku nevadí.
6. **„Zachytit signál“ jako nadpis rána**: v copy*.json není, ranní obrazovka se jmenuje „Ranní hlášení“ (`texts.morning.title`, notifikace). „Zachytit signál“ je jen v `program.json`. Je potřeba rozhodnout, který nadpis platí.
7. **Stupně odhadu výskytu REM** (`copy_devices.json` `texts.telemetry.remBand.level.*`): „vysoká / střední / nízká / nepravděpodobné“ nemají jednotný rod a `showLow` („Zobrazit i nízká“) předpokládá střední rod množného čísla (okna). Bez kontextu UI jsem je neměnil. Návrh: buď „vysoká / střední / nízká / nepravděpodobná“ (okna), nebo podstatná jména („vysoký odhad“ …).

## Technické (check_a.py)
8. **Chráněné klíče s UI textem:** `copy_devices.json` `texts.telemetry.remBand.source` (věta s „;“, chtěl jsem tečku) a `copy_reality.json` `texts.reality.test.evidence` („Důkazy“; techniky mají pro stejný oddíl „Co víme“) checker hlídá podle názvu klíče. Nechal jsem je beze změny. Doporučuju ručně sjednotit na „Co víme“.
9. **Duplicitní klíče mezi soubory** se různými hodnotami: `texts.morning.record` („Nahrát“ / „Nahrát zvuk“), `recordHint`, `voiceLocal`, `feelingQuestion`, `textHint` (copy.json vs copy_journal.json), `texts.techniques.title` / `back` („Techniky“ / „Výcvik“) a `lead` (copy.json vs copy_training.json). Výsledek závisí na pořadí slučování. Neslučoval jsem je.
10. **Skloňování po číslech:** `texts.design.training.lessonMeta` „{pocet} kapitol“, `texts.lab.ui.nights` „{n} nocí“, `texts.reality.hub.inDreamUnit` „snů“, `texts.lab.detail.missing` aj. Pro 2–4 je potřeba tvar „kapitoly / noci“ (ICU plural jako u `traces.dreams1/2/5`).

## Tón (beze změny, k rozhodnutí)
11. **Rod:** appka důsledně používá mužský rod („Jak ses vyspal“, „Věděl jsi“, „Probudil jsem se z něj“). U žen to drhne. Šlo by to řešit volbou oslovení v onboardingu.
12. **Hlas appky:** míchá „já“ („ukážu“, „losuju“, „přepíšu“) a „my“ („jsme nenašli“, „umíme poznat“, „Jak ti máme říkat?“). Sjednotil jsem jen hlášky „nenašli“.

## Korektor k5


V textech jsem nic z toho neopravoval. Plné texty PMC, Frontiers a SEP nešly z prostředí stáhnout (DNS), ověřoval jsem jen přes vyhledávání.

1. **Délka kurzu MBSR: devět, nebo osm týdnů?**
   - Kde: `reflections.json` → `r45.text` říká „devítitýdenní kurz všímavosti“, ale `experiments.json` → `meditationEvening.why` k téže studii říká „osmitýdenní kurz všímavosti“.
   - Proč: Baird a kol. (Psychology of Consciousness, 2019) testovali standardní **osmitýdenní** kurz MBSR. Text v r45 je nejspíš chybný a oba texty si navzájem odporují.
   - Návrh: v r45 změnit na „osmitýdenní“.
   - Zdroj: PMC6490164 (autorský rukopis) a PsyPost 12/2018 („an 8-week mindfulness course did not increase the frequency of lucid dreams“).

2. **Procenta z ILDIS (Aspy 2020)**
   - Kde: `experiments.json` → `ssildVsMildMorning.why` („16,5 a 16,9 % nocí“), `wbtbVsMorning.why` a `wbtbMildVsSsild.why` („16 až 20 %“).
   - Proč: podle souhrnů článek uvádí, že jeho výsledky „neumožňují výpočet četnosti lucidních snů“. Hodnoty jsou spíš úspěšnost pokusů o indukci v 2. týdnu, ne podíl nocí. Hodnota 17,4 % pochází z NALDIS (Aspy a kol. 2017).
   - Návrh: ověřit v tabulkách článku (Frontiers in Psychology 11:1746, doi 10.3389/fpsyg.2020.01746), jestli sedí čísla i formulace „nocí s lucidním snem“. Případně by bylo přesnější „pokusů“.

3. **„Podle Grundmanna“**
   - Kde: `reflections.json` → `r04`. Zdroj uvádí „Stanfordská encyklopedie filozofie, Dreams and Dreaming (Windt)“.
   - Proč: přes vyhledávání jsem nenašel, že by heslo Grundmanna zmiňovalo. Text navíc připisuje tezi „spíš bdíš, když umíš kriticky uvažovat“ někomu, kdo v uvedeném zdroji nemusí být.
   - Návrh: ověřit v SEP (plato.stanford.edu/entries/dreams-dreaming), případně uvést přímo Grundmannovu práci.

4. **Duplicitní reflexe**
   - Kde: `reflections.json`, dvojice r01/r25 (Čuang-c' a motýl), r02/r26 (Descartes, jisté znamení), r05/r31 (Seth, řízená halucinace) a částečně r06/r30.
   - Proč: obsah se skoro opakuje (zřejmě starší a novější sada). Věcně to chyba není, ale uživatel uvidí tutéž myšlenku dvakrát.
   - Návrh: vybrat jednu z dvojice, nebo je v rotaci oddělit.

5. **ADA a „kritická reflexe“**
   - Kde: `experiments.json` → `adaVsQuickTest`. Název jsem sjednotil podle SLOVNIK.md na „Vědomí po celý den (ADA)“.
   - Proč: obsah varianty B je ale Tholeyho kritická reflexe a techniques.json má `ada.fullName` „Kritická reflexe podle Tholeye“. Pokud koordinátor u ADA ponechá Tholeyho pojetí, je potřeba sjednotit SLOVNIK.md, techniques.json, program.json a experiments.json na jedno jméno.

6. **„Pohyb a rušení hned po probuzení vybavování snižují (Koulack a Goodenough 1976)“**
   - Kde: `experiments.json` → `voiceVsWriting.why`.
   - Proč: Koulack a Goodenough 1976 (Psychological Bulletin) je teoretický model vybavování snů závislého na probuzení (arousal-retrieval), ne pokus s pohybem. Tvrzení je v souladu s modelem, ale citace vypadá jako experimentální doklad. Na přímý důkaz se hodí spíš novější práce o vlivu rušení na vybavování.

7. **r44: „z pěti laboratoří“**
   - Kde: `reflections.json` → `r44` (Demirel a kol. 2025, J Neurosci).
   - Proč: počet laboratoří a datových sad jsem nedokázal ověřit. Jinak zjištění sedí: chybí efekt kolem 40 Hz a je tam pokles beta aktivity v pravé temporoparietální oblasti.

