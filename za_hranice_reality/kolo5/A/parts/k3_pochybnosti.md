# k3: věcné pochybnosti (techniques.json, reality_tests.json, reality_prompts.json)

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
