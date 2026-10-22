# Lucidní snění: načasování a trénink porážejí technologie

Lucidní sen (LD, *lucid dream*, tedy sen, v němž si snící uvědomuje, že sní) se dá trénovat, ale ne zapnout. Nejsilnější data má kombinace tří prvků. Prvním je probuzení po zhruba 5–6 hodinách spánku (WBTB, *Wake Back To Bed*). Druhým je krátký kognitivní záměr MILD (*Mnemonic Induction of Lucid Dreams*) nebo SSILD (*Senses-Initiated Lucid Dream*). Třetím je rychlé opětovné usnutí. V největší australské terénní studii tato kombinace za jediný týden zvedla podíl lucidních nocí z 9,4 % na 17,4 %. Lidé, kteří po technice usnuli do 5 minut, uspěli ve 45,8 % pokusů. Samotné testy reality, samotné afirmace a samotné WBTB naopak v kontrolovaných studiích z let 2017–2025 nefungují. Jedinou technologií s kontrolovanými daty z domácího prostředí jsou zvukové podněty naučené před spaním a přehrávané během spánku (TLR, *Targeted Lucidity Reactivation*). Ani ta ale v největší preregistrované multicentrické studii (preprint 2026) nepřekonala samotný trénink SSILD: hlavní práci dělá trénink a načasování, ne hardware. Spotřebitelská LD zařízení let 2012–2020 skoro všechna zanikla. Elektrická stimulace 40 Hz se nereplikovala a ultrazvukové čelenky se prodávají bez publikovaných dat. Ezoterické školy fungují jen tam, kde obsahují tytéž ingredience: probuzení, záměr, kritické zkoumání stavu, meta-uvědomění. Tibetská jóga snů přidává hlavně rámec kontinuity dne a noci a metodiku pro chvíli, kdy už je člověk lucidní. Její laboratorní ověření je zatím na úrovni pilotů s 5–6 účastníky. Trh aplikací je roztříštěný, hodnocení píší většinou konkurenti a žádná aplikace na iOS nemá vlastní validovaný protokol. Pro nového vývojáře z toho plyne příležitost: aplikace, která dává na první místo spánek a vybavování snů, staví na MILD/SSILD, používá TLR jako doplněk, funguje na obou platformách a uživateli poctivě měří, co funguje právě u něj. Musí přitom respektovat dvě tvrdé hranice. Telefon v reálném čase nevidí fázi REM (přes HealthKit ani Health Connect) a hlavním rizikem celé disciplíny je fragmentace spánku.

---

## Jak číst tento report: zdroje, značky a slepá místa

Podklady vznikly v prostředí, kde **bylo blokováno stahování webových stránek** pro všechny domény: PMC/NCBI, Frontiers, App Store, Google Play, Reddit, bioRxiv a další. Rozpočet na vyhledávání se navíc několikrát vyčerpal. Většina čísel proto pochází z **úryvků výsledků vyhledávání** (abstrakty, tiskové zprávy, sekundární shrnutí), nikoli z plných textů. Část údajů pochází z **předchozích znalostí výzkumníků (jazykového modelu)** a v této session nebyla znovu ověřena. Reddit a DreamViews nebyly dostupné vůbec, takže „komunitní konsenzus“ o aplikacích chybí. Hodnocení a ceny aplikací jsou snímky z vyhledávačů a většinu žebříčků „nejlepších LD aplikací“ píší konkurenční vývojáři.

Značky použité v textu:

| Značka | Význam | Jak s tím zacházet v produktu |
|---|---|---|
| **[V]** | Ověřeno z abstraktu nebo úryvku primárního zdroje | Lze použít, u přesných čísel zkontrolovat plný text |
| **[S]** | Ověřeno jen přes sekundární zdroj (tisk, blog, citující článek) | Před použitím v textech aplikace ověřit v primárním zdroji |
| **[PK]** | Předchozí znalost modelu, neověřeno v této session (uveden DOI) | „Pravděpodobně správně“, ověřit před publikací |
| **[NEOV]** | Neověřeno, komunitní tradice | Nepoužívat jako fakt |
| **[PRE]** | Preprint, pilot (n < 30), jediná studie nebo jen korelace | Prezentovat jako předběžné |

Soubor 09 (verifikace protokolů) opravuje několik detailů souboru 01. Kde se liší, tento report **přebírá verzi z 09**. Konkrétně jde o časování cyklů SSILD, četnost testů reality, údaj „18 % vs. 6 %“ u WBTB a výsledky multicentrické TLR studie ve verzi v2. Seznam položek, které je nutné ověřit před nasazením do produktu, je na konci sekce o důsledcích pro vývoj.

---

## LD je REM s částečně probuzeným „pozorovatelem“: biologické základy

**Analýza jádra.** Lucidní sny vznikají převážně ve **fázi REM** (spánek s rychlými pohyby očí). Ta se během noci prodlužuje a zintenzivňuje, takže pravděpodobnost LD vrcholí v poslední třetině noci a v ranním zdřímnutí. Na tom stojí logika WBTB. LD se objektivně ověřuje domluveným signálem očí vlevo–vpravo–vlevo–vpravo (LRLR) zaznamenaným polysomnografií (PSG), protože okohybné svaly nepodléhají svalové atonii REM. Takto ověřený sen se označuje **SVLD** (*signal-verified lucid dream*). Poprvé to dokázali Keith Hearne a Alan Worsley v Hullu roku 1975 a nezávisle Stephen LaBerge na Stanfordu v letech 1978–1981 ([UCSC Science Notes](https://sciencenotes.ucsc.edu/0601/dream/index.html)) [V].

Neurálně vypadá LD jako REM s částečným znovuzapojením frontoparietálních „metakognitivních“ sítí. Raný předpoklad silného frontálního signálu 40 Hz (Voss 2009, velmi malý vzorek) nejnovější data nepotvrzují. Multilaboratorní EEG mega-analýza Demirel a kol. (26 lucidních snílků, 43 záznamů, očištěno od artefaktů očí a svalů) našla **na úrovni senzorů jen minimální rozdíly mezi lucidním a nelucidním REM**. Zjistila nárůst gama aktivity v precuneu v okamžiku signalizace a zvýšenou alfa a gama konektivitu ([bioRxiv 2024.04.09.588765](https://www.biorxiv.org/content/10.1101/2024.04.09.588765v2); [Neuroscience News](https://neurosciencenews.com/lucid-dreaming-consciousness-28674/)) [V; časopisecká verze v J Neurosci 2025 neověřena DOI]. Častí lucidní snílci mají vyšší klidovou konektivitu mezi přední prefrontální kůrou a temporoparietálními oblastmi ([Baird a kol. 2018, Sci Rep](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6290891/)) [V, průřezové]. Lidé s vysokou lucidností snů mají více šedé hmoty ve frontopolární kůře, tedy v oblasti metakognice ([Filevich a kol. 2015, doi:10.1523/JNEUROSCI.3342-14.2015](https://doi.org/10.1523/JNEUROSCI.3342-14.2015)) [PK].

Druhým biologickým pilířem je **cholinergní systém**, protože REM je cholinergně řízený stav. Galantamin (inhibitor acetylcholinesterázy) podaný při WBTB spolu s MILD zvýšil podíl LD v závislosti na dávce: placebo 14 %, 4 mg 27 %, 8 mg 42 %. Šlo o dvojitě zaslepenou zkříženou studii s n = 121 ([LaBerge, LaMarca & Baird 2018, PLOS ONE](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0201246)) [V]. Třetím pilířem je **blízkost bdění a REM**. Fyziologicky ověřené přechody z bdění do REM a polyfázický spánek byly spojeny s LD, subjektivní kvalita spánku nikoli ([Gott a kol. 2020, Consc Cogn](https://boris.unibe.ch/189104/1/1-s2.0-S1053810019305227-main.pdf)) [V]. U narkolepsie, kdy člověk často vstupuje do REM přímo z bdění, je LD mnohem častější: zhruba 77 % pacientů oproti 49 % kontrol ([Dodet a kol. 2015, Sleep, doi:10.5665/sleep.4516](https://doi.org/10.5665/sleep.4516)) [PK]. Studie lidí s traumatickými symptomy z roku 2026 hlásí LD častěji v nocích s kratší latencí usnutí a delším bděním po usnutí ([PsyPost](https://www.psypost.org/scientists-uncover-the-physical-signs-of-lucid-dreaming-in-people-with-trauma-symptoms/)) [S, PRE].

**Rozšíření perspektivy.** Pro produkt z toho plyne skrytý předpoklad, který většina aplikací ignoruje: **„čas v noci“ je hlavní nezávislá proměnná**. Pokusy o lucidnost na začátku noci jsou fyziologicky slabé. Neurální obraz zároveň nepodporuje marketingové tvrzení „gama vlny nebo binaurální rytmy = lucidita“. LD je metakognitivní stav, nikoli frekvence, kterou lze „naladit“. Věk hraje roli: spontánní LD jsou časté u dětí a kolem 16 let prudce klesají, což autoři spojují s dozráváním prefrontální kůry ([Voss a kol. 2012, J Sleep Res, doi:10.1111/j.1365-2869.2012.01022.x](https://doi.org/10.1111/j.1365-2869.2012.01022.x)) [PK].

**Strategický návrh.** Aplikace má plánovat všechny noční intervence (WBTB, MILD, podněty) do druhé poloviny noci a výchozí čas WBTB odvozovat od skutečného usnutí uživatele, nikoli od nastavené večerky. Komunikace má rámovat LD jako **trénink metakognice a prospektivní paměti**, nikoli jako „hacknutí mozkových vln“.

**Limitace.** Neurozobrazovací studie mají jednotky až desítky účastníků. Žádná velká studie neověřila, že hustota REM sama predikuje nástup LD.

---

## Metody se posunuly od jednotlivých triků ke kombinovaným protokolům

**Analýza jádra.** Vývoj lze shrnout ve třech vlnách. V 80. letech vznikly základní kognitivní techniky: Tholeyho reflexní technika a autosugesce, LaBergeův MILD, testy reality (RT) a WBTB. V 90. letech přišly světelné masky (DreamLight, NovaDreamer). V letech 2000–2015 vznikly na internetových fórech nové „komunitní“ techniky: SSILD (autor s přezdívkou CosmicIron), FILD (*Finger-Induced LD*, jemné pohyby prsty při usínání), DEILD (*Dream-Exit-Induced LD*, nehybný návrat do snu po probuzení) a CAT (*Cycle Adjustment Technique* Daniela Lovea, 2013). Systematický přehled Stumbrys a kol. 2012 ale shrnul 35 studií s verdiktem, že **žádná technika nenavozuje LD spolehlivě a konzistentně** a 60 % studií má špatnou metodologii ([PhilPapers](https://api.philpapers.org/rec/STUIOL)) [V].

Třetí vlna po roce 2015 přinesla **vícesložkové protokoly a přesun z laboratoře domů**. Aspy 2017 ukázal, že funguje jen trojkombinace RT + WBTB + MILD ([Univ. Adelaide](https://adelaide.edu.au/news/news95682.html)) [V]. ILDIS 2020 (N = 355) zjistil, že **SSILD je stejně účinný jako MILD a jejich hybrid nepřidává nic** ([Aspy 2020, Front Psychol](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7379166/)) [V]. Erlacher a kol. 2022 prokázali, že **probuzení po 6 h je lepší než po 4,5 h** ([Clocks & Sleep](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/)) [V]. Systematický přehled Tan & Fan 2023 (19 studií, 14 technik) určil **MILD jako nejúčinnější techniku (6 podpůrných studií)**; SSILD a galantamin hodnotí jako kandidáty, kteří potřebují replikaci ([J Sleep Res](https://onlinelibrary.wiley.com/doi/10.1111/jsr.13786)) [V]. Nejnovějším směrem je TLR: zvuk asociovaný s „lucidním nastavením mysli“ se přehraje během spánku (Carr 2020, Konkoly 2024, multicentrická studie 2024–2026).

Paralelně běží **série nulových výsledků jednotlivých technik**: WBTB samotné doma 4,3 %, tedy na úrovni spontánního výskytu ([Klofat a kol. 2024, Somnologie](https://link.springer.com/article/10.1007/s11818-024-00453-8)) [V]; RT samotné i autosugesce samotná bez významného efektu za 4 týdny (N = 81) ([Schredl 2025, IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/110523)) [V]. Preregistrované multicentrické studie pak odhalují menší efekty technologie než rané piloty. Ve verzi v2 multicentrické studie SSILD + TLR se signálem ověřený LD (SVLD) vyskytl u **31 ze 60 účastníků (51,7 %)**, ale **mezi skutečnými podněty (38,3 %) a falešnými (28,3 %) nebyl významný rozdíl**. Autoři uzavírají, že výsledky „neukazují jasný přínos REM cueingu oproti samotnému tréninku SSILD“; podněty jen prodloužily trvání LD ([bioRxiv v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2)) [V, PRE]. Preprint Peters a kol. 2026 (3 studie, N = 101) dosáhl 40–45 % externě hodnocených lucidních snů a 11–32 % SVLD pouhými verbálními instrukcemi a primingem laboratorního kontextu. VR nácvik, haptická stimulace v REM ani VR „glitche“ nic nepřidaly ([bioRxiv](https://www.biorxiv.org/content/10.64898/2026.03.11.711049v2.full)) [V, PRE].

| Rok | Milník | Význam pro aplikaci |
|---|---|---|
| 1975–1981 | Hearne/Worsley a LaBerge: LRLR signál z REM | Objektivní verifikace; základ pro „signál“ ve wearable verzi |
| 1980–1990 | MILD (LaBerge), reflexní technika a autosugesce (Tholey), WBTB | Jádro dodnes |
| 2012 | Stumbrys: žádná technika není spolehlivá | Realistická očekávání |
| 2014 → 2020 | 40 Hz tACS (Voss) → nereplikováno (Blanchette-Carrière, n = 40) | Varování před neuro-hypem |
| 2017 | Aspy: RT + WBTB + MILD 9,4 → 17,4 % nocí | Kombinace, ne jednotlivé techniky |
| 2018 | Galantamin 14/27/42 % | Cholinergní mechanismus; lék na předpis |
| 2020 | ILDIS: SSILD ≈ MILD; usnutí ≤ 10 min | Dvě rovnocenné „hlavní“ techniky |
| 2020 | Carr: TLR v laboratorním zdřímnutí 50 % vs. 17 % | Počátek TLR |
| 2021 | Konkoly: obousměrná komunikace se snícími | „Interaktivní snění“ |
| 2022 | Erlacher: 6 h > 4,5 h | Parametry WBTB |
| 2024 | Konkoly: TLR v telefonu doma, 0,74 → 2,11 LD/týden | Jediný validovaný protokol aplikace |
| 2024–2025 | Nulové výsledky samotného WBTB, RT a autosugesce | Jednotlivé techniky nestačí |
| 2026 | Multicentrická studie v2: podněty ≈ falešné podněty; Peters: instrukce stačí | Kognitivní trénink je hlavní aktivní složka |
| 2026 | Studie jógy snů v PSG laboratořích (Northwestern/UVA), registrované RCT | Kontemplativní stopa se vědecky otevírá |

**Rozšíření perspektivy.** Data skrývají tři předpoklady. (1) **Vzorky jsou motivovaní, často zkušení dobrovolníci.** Ve WBTB studii 2024 bylo všech 8 úspěšných lidí už dříve zkušených lucidních snílků. V RCT 2025 vysvětlila většinu výsledku výchozí frekvence LD. Pravý začátečník má tedy horší vyhlídky, než napovídají průměry. (2) **Laboratorní čísla 40–50 % nejsou přenositelná domů.** Laboratoř nabízí probuzení přesně z REM, explicitní instrukce, dlouhé zdřímnutí bohaté na REM a silné efekty očekávání (*demand effects*). (3) **Kvantitativní metaanalýza účinnosti indukce neexistuje**, k roku 2026 jsou k dispozici jen systematické přehledy. Žádná technika nemá „silné“ důkazy ve smyslu více velkých preregistrovaných RCT.

**Strategický návrh.** Jádrem aplikace má být **MILD nebo SSILD po WBTB v 5.–6. hodině spánku s důrazem na rychlé usnutí**. RT, deník a záměr jsou podpůrné návyky, ne samostatné sliby. TLR je zesilovač s předběžnými daty, ne hlavní mechanismus.

**Limitace.** Podíl úspěšných nocí 17 % je pro motivovaného dobrovolníka v nejlepší terénní podmínce zhruba 1 noc z 6. Doba do prvního LD u úplných začátečníků doma není spolehlivě změřena.

---

## Tabulka věrohodnosti: co funguje, co je slibné a co je mýtus

Stupnice: **E** = podloženo kontrolovanými daty; **E-** = slabé nebo jen jako součást kombinace; **P+** = předběžná kontrolovaná data (piloty, preprinty); **P** = věrohodný mechanismus, netestováno; **A** = jen anekdoty; **C** = vyvráceno nebo založeno na nepravdivé premise.

| Technika / přístup | Původ | Klíčová čísla | Hodnocení |
|---|---|---|---|
| **MILD + WBTB** | LaBerge 1980 | 9,4 → 17,4 % nocí (n = 47); 45,8 % pokusů při usnutí < 5 min ([Adelaide](https://adelaide.edu.au/news/news95682.html)); laboratoř ~50 % hlášených, ~1/3 SVLD ([Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full)); 6 studií v přehledu Tan & Fan | **E (střední)**, nejlépe podložená technika |
| **SSILD (+ WBTB)** | CosmicIron, 2010s | ≈ MILD v ILDIS (N = 355); 51,7 % účastníků SVLD v multicentrické laboratorní studii [PRE] | **E- / P+** (1 terénní studie) |
| **WBTB samotné** | LaBerge 80.–90. léta | 4,3 % doma (N = 138), na úrovni spontánního výskytu ([Klofat 2024](https://link.springer.com/article/10.1007/s11818-024-00453-8)) | **C jako samostatná metoda**, nezbytná složka kombinace |
| **WBTB + krátký nácvik prvků snu (doma)** | Schredl 2020 | 18 % LD po WBTB nocích vs. 6 % bez WBTB; N = 50; 5 z 10 nováčků mělo za 5 týdnů ≥ 1 LD ([PsyPost](https://www.psypost.org/more-evidence-the-wake-up-back-to-bed-technique-can-help-to-induce-lucid-dreams/)) [S] | **E-** |
| **Načasování WBTB** | Erlacher 2020/2022 | 6 h > 4,5 h (26 %/0 %/20 % vs. 53 %) | **E-** (malé laboratorní studie) |
| **Testy reality samotné** | Tholey 1983, LaBerge 1990 | RT skupina 7,6 % nocí ve 2. týdnu, méně než v 1. ([Aspy 2017](https://www.researchgate.net/publication/319855294_Reality_testing_and_the_mnemonic_induction_of_lucid_dreams_Findings_from_the_national_Australian_lucid_dream_induction_study)); nulový výsledek RCT 2025; počet RT/den nekoreloval s LD (ILDIS) | **C/E- samostatně**, nejasný přínos v kombinaci |
| **Konkrétní test (nos, ruce, text)** | Komunita, LaBerge | Žádné srovnávací studie; ILDIS testoval „RT Breath“ a „RT Hands“ | **Expertní názor** |
| **Autosugesce / afirmace před spaním** | Tholey, lidová tradice | Nulový výsledek RCT 2025 (N = 81); WBTB + afirmace neúčinné (Dyck 2017, citováno v [PMC9149976](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9149976/)) | **C** |
| **Tholeyho reflexní technika** | Tholey 1983 | Malé efekty, nízká kvalita (Paulsson & Parker 2006 [PK]) | **E-** |
| **Trénink prospektivní paměti** | LaBerge 1990 | Pouze jako mechanismus MILD | **P** |
| **Snový deník a znaky snů** | LaBerge 1985 | Lepší vybavování snů predikuje úspěch (ILDIS); deník pomáhá hlavně lidem se slabým vybavováním | **E- nepřímo** (prerekvizita) |
| **TLR: předspánkový trénink + zvuk ve spánku** | Carr 2020; Konkoly 2024 | Laboratoř 50 % vs. 17 %; doma 0,74 → 2,11 LD/týden (n = 19, bez kontroly); experiment 2 ~17 % vs. ~5 % ([Science News](https://www.sciencenews.org/article/phone-app-help-lucid-dreams)); multicentrická studie v2: podnět 38,3 % vs. falešný podnět 28,3 %, n.s. | **P+** (smíšené; trénink > podnět) |
| **Instrukce + priming kontextu (zdřímnutí)** | Peters 2026 | 40–45 % hodnoceno jako lucidní, 11–32 % SVLD, N = 101 | **P+ [PRE]** |
| **Zvukové RT podněty bez tréninku (laboratoř)** | IJoDR 2026 | Pouze 1 z 15 se striktně ověřeným LD ([IJoDR 2026](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/115408)) | **C/E-** |
| **WILD / hypnagogické techniky** | LaBerge 1985; Tholey | Mechanismus (narkolepsie, přechody bdění → REM); žádné RCT | **A + mechanismus** |
| **FILD** | Fóra | Žádná data | **A** |
| **DEILD / „řetězení snů“** | LaBerge 1990; fóra | Žádná data | **A** |
| **CAT** | Love 2013 | Žádná data | **A** |
| **Raduga: „nepřímé techniky“ po probuzení** | REMspace | 449 účastníků, nekontrolované, nejasný jmenovatel ([IJoDR 2021](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/71170/74402)) | **E-** (afilované, bez kontroly) |
| **Hypnóza / posthypnotická sugesce** | Dane & Van de Castle 1984 | 15 párů vysoce hypnabilních žen; čísla nedohledána | **P / slabé E** |
| **Dlouhodobá meditace** | Buddhismus, sekulární | 38 meditujících vs. 140 kontrol: více LD; 8týdenní MBSR bez efektu ([Baird 2019](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164)); přehled 2025: „neprůkazné“ | **P (korelace)** |
| **Meditační/kontemplativní obsah jako TLR asociace** | Paller lab 2024/2026 | 2/5 SVLD (dýchání), 2/5 LD (Čenrezig) | **P+ [PRE]** |
| **VR trénink** | Gott 2021 | n = 42, 4 týdny, významně více LD než bez tréninku ([PMC7741087](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7741087/)); Peters 2026 bez přínosu VR | **P+ smíšené** |
| **Světelné masky s detekcí REM** | LaBerge 80.–90. léta | Malé staré studie; „není dost důkazů“ ([Sleep Foundation](https://www.sleepfoundation.org/dreams/lucid-dream-mask)) | **E- / P** |
| **Galantamin 4–8 mg + MILD + WBTB** | LaBerge 2018 | 14/27/42 %; vedlejší účinky 12 % vs. 3 % placebo | **E (1 velké RCT)**, lék na předpis |
| **Donepezil** | Malé studie | n ≈ 10 | **E- (nízké)** |
| **Vitamin B6 240 mg** | Aspy 2018 | Zlepšuje vybavování obsahu snu, luciditu netestoval ([ScienceDaily](https://www.sciencedaily.com/releases/2018/04/180427100258.htm)) | **E- pro vybavování, žádné pro LD** |
| **α-GPC** | Somnologie 2017 | 2/2/2 LD z 75 snů (výchozí stav/placebo/látka) ([Springer](https://link.springer.com/article/10.1007/s11818-017-0122-8)) | **C** |
| **Calea zacatechichi** | Mezoamerická tradice | Velmi nízká evidence; signály neurotoxicity ([J Ethnopharm](https://www.sciencedirect.com/science/article/pii/S0378874124012145)) | **A + riziko** |
| **Silene capensis, pelyňkový polštář** | Xhosa, Evropa | Žádné kontrolované studie | **A** |
| **40 Hz tACS** | Voss 2014 | Nereplikováno vůči placebu (n = 40) ([Blanchette-Carrière 2020](https://www.researchgate.net/publication/342080761_Attempted_induction_of_signalled_lucid_dreaming_by_transcranial_alternating_current_stimulation)) | **C** |
| **tDCS DLPFC** | Stumbrys 2013 | Slabý efekt jen u častých lucidních snílků (n = 19) ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1053810013001098)) | **E- / P** |
| **Fokusovaný ultrazvuk (Prophetic)** | 2023–2026 | Žádná recenzovaná data o účinnosti | **Bez dat** |
| **Binaurální a izochronní „LD audio“** | Monroe, YouTube | Žádné LD studie; EEG neukazuje entrainment ([PMC3322125](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322125/)) | **A** (relaxace, rituál) |
| **„LD hudba“, 432 Hz, subliminály** | Internet | Žádné studie | **A** |
| **Monroe Gateway / OBE** | Monroe Institute | Hlášení CIA je teoretické, ne empirické | **A (OBE); P jako WILD** |
| **Castanedovo „podívej se na ruce“** | Castaneda 1972/1993 | Původ pravděpodobně fiktivní; technika = RT/záměr | **Původ C; technika P** |
| **Senoi „teorie snů“** | Kilton Stewart | Domhoff: Senoiové ji nepraktikují | **Původ C** |
| **Krystaly** | New Age | Pravé ≈ falešné krystaly (French, Goldsmiths) ([Time](https://time.com/4969680/do-crystals-work/)) | **C** |
| **Šišinka / DMT / „třetí oko“** | Strassman → internet | Nepodložená hypotéza, kterou zpochybnil i sám Strassman ([OPEN Foundation](https://open-foundation.org/the-science-and-folklore-of-dmt/)) | **C (premisa)** |
| **Jóga nidra / NSDR** | Satyananda | Data o spánku slabá, o LD žádná | **P** (WILD + záměr) |
| **Prvky tibetské jógy snů** | Naropa, Bön, Dzogčhen | Viz samostatná sekce; piloty 2/5 | **P až P+** |
| **Stabilizace (točení, tření rukou)** | LaBerge NightLight | Neprůkazný trend ve prospěch točení, málo účastníků ([lucidity.com](http://www.lucidity.com/NL7.34.RU.SpinFlowRub.html)) | **A** |

**Rozšíření perspektivy.** Placebo s aktivními ingrediencemi je silné, samo o sobě slabé. V galantaminové studii dosáhlo „aktivní placebo“ (MILD + WBTB + víra, že člověk možná dostal lék) 14 % nocí. Doplněk, kterému lidé věřili (α-GPC), ale nad výchozí stav nezvedl nic. Očekávání tedy působí **skrze** skutečné ingredience (motivace, pozornost ke snům, opakování záměru), ne samostatně. Experimentální manipulace očekávání u LD dosud chybí, což je otevřená mezera, kterou může vyplnit i aplikace svými A/B testy ([PLOS ONE 2018](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0201246); [Somnologie 2017](https://link.springer.com/article/10.1007/s11818-017-0122-8)).

---

## Protokoly krok za krokem: co je ověřené a co ne

U každého kroku je uvedeno, zda je ověřen ([V]/[S]) nebo jde o neověřený detail ([PK]/[NEOV]). Výchozí hodnoty jsou navrženy pro aplikaci.

### Protokol 0: Vybavování snů (fáze 1, týdny 1–3)

1. **Večer:** krátký záměr „Zapamatuji si své sny“. Postoj ke snům a zájem o ně predikují vybavování ([Bernardi a kol. 2025, BPS Digest](https://bps.org.uk/research-digest/what-makes-us-more-likely-remember-dreams); [Schredl a kol. 2003](https://onlinelibrary.wiley.com/doi/10.1046/j.1365-2869.2003.00344.x)) [S/V]. Konkrétní znění záměru je expertní praxe [NEOV].
2. **Při probuzení:** nehýbat se, nechat oči zavřené, přehrát sen a nejdřív si uložit klíčová slova. Rušení hned po probuzení snižuje vybavování (model aktivace a vybavení, *arousal-retrieval*; [Koulack & Goodenough 1976, doi:10.1037/0033-2909.83.5.975](https://doi.org/10.1037/0033-2909.83.5.975)) [PK].
3. **Zápis:** hlasem nebo textem, s možností vrátit se k detailům později.
4. **Kdy čekat zlepšení:** deník zvyšuje zaznamenané vybavování hlavně u lidí se slabým a středním vybavováním, u silných „vybavovačů“ ho může snížit. Ve 2. týdnu vybavování typicky klesá ([Schredl & Fulda 2005 via ResearchGate](https://www.researchgate.net/publication/282737690_Reliability_and_stability_of_dream_recall_frequency)) [V-úryvek]. Že deník automaticky zvyšuje vybavování, je zpochybněno a část efektu tvoří motivace ([Consc Cogn 2012](https://www.sciencedirect.com/science/article/abs/pii/S1053810012001973)) [V].
5. **Prediktory vybavování (N = 217):** postoj ke snům, sklon k toulání myslí, delší lehký spánek, nižší věk a jaro oproti zimě ([AlphaGalileo/IMT Lucca](https://www.alphagalileo.org/en-gb/Item-Display/ItemId/257739)) [S; v jiném zdroji N = 204].
6. **Neověřeno:** srovnání buzení budíkem a přirozeného probuzení nemá žádnou studii.

### Protokol 1: MILD (výzkumná podoba Aspy 2017 / ILDIS 2020)

1. **Budík zhruba 5 h po ulehnutí** (nastavitelné 4,5–6 h) ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/); [ScienceAlert](https://www.sciencealert.com/science-has-found-a-drug-free-way-to-unlock-the-power-of-lucid-dreaming)) [V/S]. Aspy 2017 definuje WBTB jako probuzení „obvykle po 5–6 h“ a bdění „od 10 min do více než hodiny“ ([Semantic Scholar](https://www.semanticscholar.org/paper/Reality-Testing-and-the-Mnemonic-Induction-of-Lucid-Aspy-Delfabbro/9cb99be433c3b1a9d5c8b5e0b3ab59c80a597dcb)) [V].
2. **Vybavit si sen**, který právě skončil. Pokud žádný není, vybavit si jakýkoli nedávný sen [S].
3. **V duchu a s významem opakovat záměr**: „Až budu příště snít, uvědomím si, že sním“ (originál: *next time I'm dreaming, I will remember I'm dreaming*, „nebo variace“) [V]. Nejde o mantru: podstatný je význam slov [S]. LaBergeova knižní varianta „…chci si vzpomenout, že rozpoznám, že sním“ je [NEOV].
4. **Vizualizace:** představit si návrat do vybaveného snu, všimnout si znaku snu (*dream sign*, anomálie), říct si „sním!“ a provést předem plánovanou akci, třeba letět ([sci.news](https://www.sci.news/othersciences/psychology/lucid-dream-induction-08653.html)) [S; detailní LaBergeova struktura PK].
5. **Opakovat 3–4**, dokud záměr „nesedí“ nebo dokud člověk neusne. V ILDIS účastníci průměrně opakovali frázi **13,6× (SD 11,6)** [V-úryvek]. Pevný počet opakování nemá oporu v datech.
6. **Rychle usnout:** usnutí **do 10 min** predikovalo úspěch v ILDIS. V Aspy 2017 vedlo usnutí do 5 min k 45,8 % úspěšných pokusů [V].
7. **Opraveno:** blogové tvrzení „54 % při usnutí do 5 min“ odporuje primárnímu zdroji (45,8 %) a nemá se používat ([oneironauts.io](https://oneironauts.io/blog/mild-technique-complete-guide) vs. [Adelaide](https://adelaide.edu.au/news/news95682.html)).
8. **Neověřeno:** doslovné instrukce pro účastníky ILDIS, minimální doba bdění v protokolu Aspy a vizualizační skript.

### Protokol 2: Parametry WBTB

1. **Čas probuzení: 5–6 h po usnutí.** V laboratoři byla 6. hodina lepší než 4,5 h a nutné byly ranní probuzení z REM ([Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/)) [V].
2. **Délka bdění:** laboratoř 30–60 min, nejlépe 60 min s prací se snem a MILD ([Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full)) [V]. Údaj z NightLight 1994 („10 min je méně účinných než 30–60 min“) je jen sekundární ([Carr 2020 preprint](https://cronfa.swan.ac.uk/Record/cronfa53997/Download/53997__17126__f5832f1a79734acb950ae493504c3a2c.pdf)) [S]. **Doma platí opak:** rozhoduje rychlé usnutí. Výchozí hodnota pro aplikaci je proto **10–30 min** s volitelným režimem „intenzivní noc“ až 60 min.
3. **Frekvence:** Schredl 2020 používal WBTB **jednou týdně** [S]. Aplikace má doporučovat **1–3 noci týdně** a nikdy více než jedno plánované probuzení za noc.
4. **WBTB bez kognitivní techniky nenabízet**, protože je nulové [V].
5. **Neověřeno:** optimální délka bdění doma (žádné RCT), procenta z NightLight 1994.

### Protokol 3: SSILD (výchozí „ILDIS režim“)

1. Po WBTB (~5 h) ulehnout v pohodlné poloze se zavřenýma očima a pasivním, nesnaživým postojem ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V].
2. **Jeden cyklus = zrak → sluch → tělo.** Zrak: pozorovat tmu a fosfeny za víčky. Sluch: vnější nebo vnitřní zvuky. Tělo: tíha, teplo, mravenčení.
3. **4 rychlé cykly** po 2–3 s na každý smysl, potom **4–6 pomalých cyklů** po ~20 s na smysl. **Nepočítat sekundy** ([ILDIS PDF](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01746/pdf)) [V z vyhledávacího shrnutí PDF; před nasazením ověřit].
4. Potom pustit techniku a normálně usnout. Případná falešná probuzení otestovat.
5. **Laboratorní režim (volitelný):** rychlé cykly (2–3 s) → střední (~20 s) → pomalé (~60 s), s průvodcem ([bioRxiv v1](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v1.full.pdf)) [V]. Přesný počet středních a pomalých cyklů není znám.
6. **Oprava souboru 01:** komunitní recept „4–6 rychlých + 3–4 pomalé po 30 s“ je jen komunitní ([Gateway to LD](https://www.gateway-to-lucid-dreaming.com/ssild.html)). Ve verzi ILDIS patří číslo „4–6“ k pomalým cyklům.
7. **Implementace:** jemné zvukové předěly místo odpočítávání na obrazovce, protože účastníci neměli počítat. Originální návod CosmicIrona je [NEOV].

### Protokol 4: Testy reality (podpůrný návyk, ne samostatný slib)

1. **Méně, ale vědomě.** V ILDIS dělali lidé průměrně **4,1 RT denně (SD 4,4)** a **počet RT nekoreloval s LD** ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V-úryvek]. Doporučení „10× denně“ u Aspyho je [NEOV]. Tholey uvádí „několikrát denně“ ([Wikipedia: Paul Tholey](https://en.wikipedia.org/wiki/Paul_Tholey)) [S].
2. **Struktura jednoho testu:** (a) skutečně si položit otázku „Sním?“; (b) rozhlédnout se po anomáliích a rozporech s fyzikou bdění [S]; (c) jeden fyzický test: ILDIS používal varianty „RT Breath“ (zkusit dýchat ucpaným nosem) a „RT Hands“ (ruce) [V-úryvek]. Výhodou testu nosem je jasný výsledek, ale to je jen expertní názor [S].
3. **Spouštěče podle událostí místo podle času** (průchod dveřmi, odemčení telefonu, osobní znak snu). Opírá se o logiku prospektivní paměti a implementačních záměrů (viz níže). Specificky pro LD to netestováno [P].
4. **Neověřeno:** že náhodné push notifikace pomáhají. Žádná kontrolovaná studie neexistuje.

### Protokol 5: Domácí TLR (Konkoly a kol. 2024)

1. **Před spaním ~20 min tréninku** v posteli se zavřenýma očima. Zvuk (série pípnutí s verbálními instrukcemi) se spojuje s „lucidním nastavením mysli“, tedy s kritickým pozorováním vlastních myšlenek a těla ([Medical Xpress](https://medicalxpress.com/news/2024-10-lucid-proven-methods-unveiled-scientists.html); [Science News](https://www.sciencenews.org/article/phone-app-help-lucid-dreams)) [S].
2. **Kalibrace hlasitosti:** podnět musí být slyšet z telefonu položeného displejem dolů u polštáře, ale nesmí budit ([PsyPost](https://www.psypost.org/lucid-dreaming-app-triples-users-awareness-in-dreams-study-finds/)) [S].
3. **Přehrání podnětu ~6 h později** při nízké hlasitosti [S]. Jde o parafrázi z tisku. Zda se počítá od tréninku nebo od usnutí a jaký je přesný rozvrh podnětů, není ověřeno.
4. **Kontrola probuzení:** po probuzení telefon položí otázku „probudil vás podnět?“. Pohyb přehrávání pozastaví. Po podnětech bylo pauz kvůli pohybu významně více, takže **podněty budily** ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1053810024001260)) [V].
5. **Výsledky:** experiment 1 (n = 19, Android, 1 týden, bez kontroly) 0,74 → 2,11 LD/týden. Experiment 2 (podle Science News n = 112: 40 s naučeným zvukem, 35 s nenaučeným, 37 bez zvuku; Northwestern uvádí 120) **~17 % vs. ~5 %**. Podněty se přehrávaly ob noc (noci 1, 3, 5, 7) [S]. Údaj „416“ se nepotvrdil.
6. **Interpretace:** srovnání naučeného zvuku, nenaučeného zvuku a ticha ukazuje na **specifický efekt podnětu** nad samotné očekávání. Skok v experimentu 1 je ale očekáváním kontaminovaný; sám Konkoly připouští efekt „soustředění na LD“.
7. **Neověřeno:** počet opakování podnětu, interval mezi podněty, akustické parametry, přesné pravidlo pro pozastavení při pohybu. Vše je v plném textu ([PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932)) a je nutné to ověřit před implementací.

### Protokol 6: Komunitní techniky (nabízet s označením „komunitní, bez dat“)

- **DEILD:** při každém přirozeném probuzení se nehýbat, neotevírat oči, držet pozornost u scény snu nebo tělesného vjemu a „sklouznout“ zpět se záměrem [PK/A].
- **WILD:** po WBTB nehybně ležet a udržet nit vědomí při usínání. Možnosti: počítat („1, sním; 2, sním…“), pasivně sledovat hypnagogické obrazy, nebo si představit pohyb (vznášení, vykutálení se z těla). Může přijít spánková paralýza a vibrace [PK/NEOV].
- **FILD:** ve stavu ospalosti po WBTB 20–30 s střídavě téměř neznatelně tisknout ukazovák a prostředník, potom provést test reality [A].
- **CAT:** týden vstávat o 90 min dřív, pak střídat dny s dřívějším a normálním vstáváním [A]. Kvůli zásahu do spánku nevhodné pro výchozí cestu.

### Protokol 7: Noční můry (rescripting ve stylu IRT)

Lucidita často **není mediátorem** úlevy od nočních můr. V pilotním RCT (n = 23) klesla frekvence nočních můr i bez dosažení lucidity ([Spoormaker & van den Bout 2006](https://read.qxmd.com/read/17053341/lucid-dreaming-treatment-for-nightmares-a-pilot-study)) [V]. Modul má proto kombinovat IRT (*imagery rehearsal therapy*, přepsání noční můry v bdělém stavu a nácvik nové verze 10–20 min denně) s volitelným tréninkem lucidity [PK k parametrům IRT]. U PTSD směrovat k odborníkovi.

---

## Nejsilnějším prediktorem úspěchu je předchozí zkušenost, ne technika

**Analýza jádra.** Zhruba **55 % lidí (95% CI 49–62 %) zažilo LD aspoň jednou a ~23 % (20–25 %) ho má aspoň jednou měsíčně** ([Saunders a kol. 2016, metaanalýza](https://nectar.northampton.ac.uk/id/eprint/8705/)) [V]. Psi Encyclopedia uvádí 23 % jako „týdně“, abstrakt ale říká „měsíčně“. V brazilském průzkumu (3 427 osob) mělo LD aspoň jednou 77 % respondentů, ale **kontrolu nad snem jen 29 %** ([Mota-Rolim 2013](https://www.frontiersin.org/journals/human-neuroscience/articles/10.3389/fnhum.2013.00836/text)) [V].

Faktory se dají seřadit podle síly a podle toho, zda je lze ovlivnit:

| Faktor | Typ | Směr a síla | Lze ovlivnit? | Zdroj |
|---|---|---|---|---|
| Výchozí frekvence LD | Psychologický/trait | Nejsilnější prediktor; LD stabilní 7 let | Ne (jen dlouhodobě praxí) | [Schredl 2025](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/110523); [Schredl & Göritz 2025](https://journals.sagepub.com/doi/10.1177/02762366251349518) [V] |
| Rychlost usnutí po technice | Behaviorální/bio | Silný (≤ 10 min, < 5 min) | Částečně (relaxace, délka WBTB) | [ILDIS](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7379166/) [V] |
| Celkové vybavování snů | Psychologický | Predikuje úspěch indukce | Ano (deník, postoj) | [ILDIS](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7379166/) [V] |
| Čas v noci / pozdní REM | Biologický | Klíčový | Ano (plánování) | [Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/) [V] |
| Přechody bdění → REM, fragmentace | Biologický | Pozitivní | Ano (WBTB), za cenu spánku | [Gott 2020](https://boris.unibe.ch/189104/1/1-s2.0-S1053810019305227-main.pdf) [V] |
| Cholinergní tonus | Biologický | Dávkově závislý (galantamin) | Jen farmakologicky (Rx) | [LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371%2Fjournal.pone.0201246) [V] |
| Noční můry, spánková paralýza, halucinace v bdění | Psychologický/bio | Pozitivní korelace (~2 000 respondentů) | Ne; zároveň zranitelnost | [PMC7093643](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7093643/) [V] |
| Dlouhodobá meditace, meta-uvědomění, *open monitoring* | Psychologický | Korelace; krátký kurz bez efektu | Pomalu | [Gerhardt & Baird 2024, N = 635](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11120098/) [V] |
| Postoj ke snům, toulání myslí | Psychologický | Predikuje vybavování | Ano (motivace) | [BPS Digest](https://bps.org.uk/research-digest/what-makes-us-more-likely-remember-dreams) [S] |
| Otevřenost (Big Five), „tenké hranice“ | Trait | Korelují s vybavováním snů; vztah k frekvenci LD slabý (r ≈ 0,1–0,2 [PK]) | Ne | [Schredl a kol. 2003, Dreaming](https://link.springer.com/article/10.1023/A:1025369311813) [V pro vybavování] |
| Hraní videoher | Behaviorální | Korelace; replikace sporná | — | [Gackenbach, MacEwan](https://roam.macewan.ca/items/646140ec-2d05-4065-b929-22714e692643/full) [V] |
| Sklon k fantazii, absorpce, disociace | Trait | Pozitivní korelace; jádro sporu o rizicích | Ne | [Aviram & Soffer-Dudek 2018](https://www.frontiersin.org/articles/10.3389/fpsyg.2018.00384/full) [V] |
| Synestezie | Trait | Živější a lépe ovladatelné LD | Ne | [The Debrief 2026](https://thedebrief.org/why-some-people-can-control-their-dreams-new-study-links-synesthesia-to-lucid-dreaming-power/) [S, PRE] |
| Věk | Biologický | Pokles kolem 16 let, pokles vybavování s věkem | Ne | [Schredl 2008](https://doi.org/10.2466/pms.106.3.699-702) [V] |
| Dlouhodobé zapojení do praxe | Behaviorální | Větší nárůst LD během 7 let | Ano | [Schredl & Göritz 2025](https://journals.sagepub.com/doi/10.1177/02762366251349518) [V] |

**Rozšíření perspektivy: behaviorální věda je slabě využitá páka.** MILD je strukturálně **implementační záměr** („když budu příště snít, uvědomím si…“). Implementační záměry mají průměrný efekt na dosažení cíle d = 0,65 (94 testů) ([Gollwitzer & Sheeran 2006, Konstanz](https://www.socmot.uni-konstanz.de/publications/implementation-intentions-and-goal-achievement-meta-analysis-effects-and-processes)) [V]. Novější metaanalýza (642 testů) pravděpodobně ukazuje menší efekt, odhadem d ≈ 0,3–0,5 [PK]. Víc souběžných záměrů může škodit („méně je více“) ([EJSP](https://onlinelibrary-wiley-com-443.webvpn.zafu.edu.cn/doi/abs/10.1002/ejsp.1963)). Vytvoření návyku trvá v mediánu ~66 dní s rozptylem 18–254 ([Lally 2010, souhrn](https://forum.effectivealtruism.org/posts/8aBiqvT9uDo56Cckx/esh-a-guide-to-forming-habits-you-ll-keep)) [S]. **Gamifikace** v metaanalýze 38 studií depresních aplikací nepredikovala výsledky ani adherenci (β = −0,03) ([JMIR Ment Health 2021](https://mental.jmir.org/2021/11/e32199)) [V]; u pohybové aktivity měla malý efekt g = 0,32 ([JMIR Serious Games 2025](https://games.jmir.org/2025/1/e64410)) [V]. **Odpad je vysoký:** domácí TLR studie ztratila ~27 % účastníků za týden (26 → 19) ([Konkoly 2024 PDF](https://faculty.wcas.northwestern.edu/paller/C&C24.pdf)) [V]. V ILDIS dokončila oba týdny zhruba polovina účastníků [PK].

**Strategický návrh.** Onboarding má profilovat výchozí vybavování, frekvenci LD, frekvenci nočních můr, latenci usnutí po nočním probuzení, délku spánku a psychiatrické rizikové signály. Podle toho nastaví očekávání a cestu. Lidé se slabým vybavováním stráví týdny 1–3 tréninkem vybavování. Lidé, kteří pomalu usínají, dostanou MILD při přirozeném ranním probuzení místo WBTB. Uživatelé s častými nočními můrami jdou do modulu pro noční můry, ne k agresivní indukci. Metriky v prvních 4–8 týdnech mají odměňovat **proces** (vybavené sny, nalezené znaky snů, provedené MILD), ne počet LD.

**Limitace.** Většina dat o faktorech je průřezová. Pohlaví, chronotyp, locus of control a potřeba poznání nemají ověřená velká data.

---

## Ezoterické školy fungují jen přes vědecké ingredience

**Analýza jádra.** Žádná ezoterická nebo „spirituálně-technologická“ metoda nebyla v kontrolované studii prokázána jako samostatně účinná. Ty, které podle všeho fungují, sdílejí pět ingrediencí z evidence-based technik. (1) **Probuzení a pokus v pozdním REM**: Radugovy nepřímé techniky po probuzení, Monroeho „mysl bdí, tělo spí“, taoistické a tibetské noční bdění. (2) **Prospektivní záměr před spaním**: hypnóza, *sankalpa* v józe nidře, Castanedovy ruce. (3) **Kritické zkoumání stavu**: pohled na ruce jako test reality. (4) **Dlouhodobé meta-uvědomění**: meditace. (5) **Ritualizované prostředí**, které zvyšuje očekávání a motivaci.

Nejlépe zdokumentovaným případem je Michael Raduga, který považuje LD, OBE (*out-of-body experience*, mimotělní zážitek) a spánkovou paralýzu za jeden stav, „fázi“. Jeho studie s 449 převážně začátečníky hlásí 142 LD, ale jmenovatel je nejasný, chybí kontrola a studie je afilovaná ([IJoDR 2021](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/download/71170/74402)) [V]. V jeho studii „mimozemských setkání“ 75 % účastníků „úspěšně“ zažilo setkání v LD/OBE, ale znali cíl studie předem ([IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/78599)) [V]. Mechanismus Radugových technik (pokus o „oddělení“ ihned po probuzení bez pohybu) je přitom zcela mainstreamový: jde o variantu WILD/DEILD. Tvrzení „80 % za 2 dny“ je propagační ([REMspace](https://remspace.net/blog/general-principles-regarding-the-techniques/)). Raduga je navíc kontroverzní osoba: v roce 2023 si sám vrtal do lebky, aby si implantoval elektrodu ([Vice](https://www.vice.com/en/article/lucid-dreaming-tech-michael-raduga-remspace/)) [S].

**Binaurální rytmy** mají v metaanalýze střední efekt na paměť, pozornost a úzkost (g = 0,45), ale **žádnou LD studii**. EEG studie (n = 31) nenašla rozdíl ve frekvenčním výkonu kůry oproti bílému šumu ([PubMed 30073406](https://pubmed.ncbi.nlm.nih.gov/30073406/); [PMC3322125](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322125/)) [V]. Marketing „40 Hz audio = lucidita“ si nelegitimně půjčuje výsledek elektrické tACS, která se navíc nereplikovala. **Spánková paralýza** jako „brána“ je fenomenologicky dobře zdokumentovaná a s LD koreluje ([Denis & Poerio](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5245115/)) [V]. OBE a LD nelze spolehlivě odlišit znaky ani interpretací ([Weiler a kol. 2025](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12477129/)) [V].

**Rozšíření perspektivy.** U řady „tradic“ je falešný samotný původ. Castanedův don Juan je pravděpodobně fikce ([Wikipedia](https://en.wikipedia.org/wiki/The_Art_of_Dreaming)). „Senoi teorii snů“ připsal Senoiům Kilton Stewart, podle Domhoffa šlo o jeho vlastní myšlenky ([Domhoff, UCSC](https://dreams.ucsc.edu/Articles/senoi.html)) [V]. Islámská *istikhára* a řecká inkubace v asklépieích jsou praktiky inkubace obsahu snu a hledání vedení, ne indukce lucidity. Prezentovat je jako „LD hack“ je kulturně necitlivé. Pro hlubší či spirituální rovinu platí, že interpretační rámce (astrální cestování, setkání s entitami) nejsou empiricky podložené. Uživatelům, kteří narazí na spánkovou paralýzu nebo stavy podobné OBE, ale mohou snížit strach, pokud je aplikace podá jako „jak tento zážitek chápou různé tradice“.

**Strategický návrh.** Aplikace může nabídnout kulturní a spirituální rámce jako volitelné „ladění“ obsahu: obřad usínání, „svatyně snu“, tradiční příběhy. Účinnost ale musí stát na skutečných ingrediencích (plánování WBTB, skripty MILD/SSILD, deník, záměr). **Nikdy netvrdit účinnost** u binaurálních rytmů, krystalů, bylin, „aktivace šišinky“ ani u hypnózy jako takové. Řízená „sebehypnóza“ je legitimní forma doručení záměru ve stylu MILD.

**Limitace.** Číselné výsledky studie hypnózy z roku 1984 nebyly dohledány a moderní RCT hypnózy pro LD neexistuje. Data o józe nidře pro spánek jsou rozporná.

---

## Hardware historicky selhal a nejsilnější technologie je software

**Analýza jádra.** Téměř všechna spotřebitelská LD zařízení let 2012–2020 skončila nebo osiřela a žádné nemá nezávislý důkaz účinnosti. Jde o NovaDreamer (výroba ukončena ~2004), Aurora (Kickstarter 2013, aplikace neaktualizovaná), Neuroon (výrobce v úpadku), LucidCatcher (tACS, nedostupný) a spotřebitelskou verzi Dreem (prodej ukončen 2021). Přehled Mota-Rolim 2019 konstatuje, že komerční zařízení nezveřejňují algoritmy detekce REM a nebyla nezávisle testována ([Front Neurosci 2019](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6517539/)) [V]. V roce 2026 jsou k dispozici tyto možnosti:

- **Remee:** LED maska s časovačem, bez detekce REM, ~75–95 USD. Kickstarter vybral ~573 tis. USD. Recenzent: „neškodí, ale není důkaz, že funguje“ ([Inc.](https://www.inc.com/zoe-henry/bitbanger-labs-remee-lucid-dreaming-mask.html)).
- **ZMax (Hypnodyne):** výzkumná EEG čelenka za ~900 USD, kterou s open-source nástrojem Dreamento používají univerzity ([Hypnodyne](https://hypnodynecorp.com/index_ld.php); [arXiv Dreamento](https://arxiv.org/pdf/2207.03977)).
- **INSPEC:** 300 €. Výrobce o sobě tvrdí, že je jediné nově koupitelné zařízení s detekcí REM; jde o tvrzení výrobce ([INSPEC](https://www.inspec.me/lucid-dreaming-devices-compared)).
- **LucidMe (REMspace):** maska za 245 USD od července 2025; předobjednávky verze PRO byly v srpnu 2026 podle konkurenta staženy ([BusinessWire](https://www.businesswire.com/news/home/20250709051233/en/REMspace-Launches-LucidMe-A-Breakthrough-Smart-Sleep-Mask-With-AI-Powered-Sleep-Snoring-and-Dream-Features)).
- **Prophetic:** fokusovaný ultrazvuk, verze **Dual za 449 USD** (dodání konec 2026) a **Phase za 1 299 USD** (2027). „Před datem dodání nebyla publikována žádná recenzovaná data o účinnosti“ ([Neurofounders](https://www.neurofounders.co/startups/prophetic)) [V].

**Neurostimulace.** Efekt 40 Hz tACS z roku 2014 se v placebem kontrolované studii (n = 40) nepotvrdil. tDCS měla slabý efekt jen u častých lucidních snílků (n = 19). REMspace tvrdí, že v roce 2024 zprostředkoval „komunikaci mezi dvěma snícími“; tvrzení není recenzované ani nezávisle ověřené ([The Debrief](https://thedebrief.org/lucid-dreaming-breakthrough-startup-claims-first-ever-two-way-dream-communication/)) [V jako tvrzení]. Pro aplikaci je to relevantní jen jako varování před marketingem, který předbíhá důkazy.

**Látky.** Galantamin je jediná látka se solidním RCT, ale v EU včetně ČR je **na předpis** (Reminyl, schválený pro Alzheimerovu chorobu). Má vedlejší účinky (GIT potíže, nespavost, únava, „zvláštní somatické vjemy“ jako paralýza a vibrace) a kontraindikace: bradykardie, astma/CHOPN, vřed, epilepsie, interakce s beta-blokátory [PK k farmakologii] ([PMC6082533](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6082533/); [medicines.org.uk](https://www.medicines.org.uk/emc/medicine/10340)). Calea zacatechichi má signály neurotoxicity a v Polsku je kontrolovanou látkou ([Erowid](https://www.erowid.org/plants/calea_zacatechichi/calea_zacatechichi_law.shtml)). Právní status v ČR nebyl ověřen.

**Rozšíření perspektivy: TLR je „technologie“, která je ve skutečnosti trénink.** Zvukové podněty fungují jen tehdy, když byly **předem spojeny s lucidním nastavením mysli**. Laboratorní TLR dosáhla 50 % SVLD oproti 17 % bez podnětů ([Carr a kol. 2020, Psychology of Consciousness](https://cronfa.swan.ac.uk/Record/cronfa53997)) [V]. Doma v telefonu bez senzorů ~17 % oproti ~5 % v kontrolách. Multicentrická preregistrovaná studie ale ukazuje, že velká část efektu pochází z tréninku a WBTB. Autoři domácí studie sami nechávají otevřené, zda podněty působí vyvoláním lucidního nastavení, nebo jen zvýšením arousalu ([PsyPost](https://www.psypost.org/lucid-dreaming-app-triples-users-awareness-in-dreams-study-finds/)). TLR se rozšiřuje i mimo luciditu: na řešení problémů (20 častých lucidních snílků, *Neuroscience of Consciousness* 2026, [ScienceDaily](https://www.sciencedaily.com/releases/2026/02/260213223926.htm)) a na noční můry u narkolepsie (n = 6, [PMC12012161](https://pmc.ncbi.nlm.nih.gov/articles/PMC12012161/)) [V, PRE]. MIT Dormio (inkubace obsahu v hypnagogii, fáze N1) je samostatný, snadno implementovatelný princip pro **inkubaci obsahu**, ne pro luciditu ([MIT Media Lab](https://www-prod.media.mit.edu/publications/dormio-a-targeted-dream-incubation-device/)).

**Strategický návrh.** Aplikace nemá vyrábět hardware. Má implementovat TLR v softwaru (časovaný režim bez senzorů jako základ), volitelně zpřesněný hodinkami. Aplikace, která nahradí specializovaný hardware telefonem a běžnými hodinkami, vyplňuje skutečnou mezeru. Nabídnout podněty jako „zesilovač“, nikoli jako hlavní slib.

**Limitace.** Přesný rozvrh podnětů z Konkoly 2024 a srovnání modalit (světlo, zvuk, vibrace) z přehledů nebyly získány.

---

## Aplikace: roztříštěný trh, zastaralé nástroje a mezera na iOS

**Analýza jádra.** Žádná aplikace trhu nedominuje. Trh se dělí do čtyř skupin: (1) kompletní trenažéry (Oniri, Lucidity, Shape, Lucid Dreamer); (2) utility pro testy reality a deník (Awoken, Reality Check, Dream Journal Ultimate, Somnium); (3) nástroje pro noční podněty (Sleep as Android, výzkumná aplikace Paller lab, Lucidly, Ludin, Lucid Now, Lucid Scribe, Everdream); (4) AI deníky s interpretací (Elsewhere a desítky dalších). Standardem je freemium se 7denní zkušební dobou a předplatným ~40–80 USD ročně. Jednorázové platby jsou vzácné a uživatelé je chválí. **Jedinou aplikací s recenzovanou validací vlastního protokolu je výzkumná aplikace Paller lab („lucid“), a ta je jen pro Android.**

Ceny a hodnocení jsou snímky z vyhledávačů (podzim 2026) a jsou ověřené jen částečně:

| Aplikace (vývojář) | Platforma | Cena | Hodnocení (počet) | Klíčové LD funkce | Stav |
|---|---|---|---|---|---|
| **Oniri** (Oniri, FR/Ženeva; dříve „Capture“) | iOS + Android | Freemium; 7,99 USD/měs., 47,99 USD/rok | iOS ~4,6 (~7 075, údaj výrobce); Android ~3,5 (10 tis.+, nízká jistota) | Deník, RT připomínky v intervalu nebo náhodně, widgety, noční zvukové podněty vlastním hlasem (premium), průvodci MILD/WILD/SSILD, binaurální rytmy, AI interpretace a obrázky | Aktivní; Android údajně přestavěn v polovině 2026 |
| **Lucidity** (Christopher Benz) | Android + iOS | Freemium; iOS Pro 4,99 USD/týd., 12,99 USD/měs., 49,99 USD/rok, 119,99 USD doživotně; reklamy na Androidu | **Android 4,83 (~7,6 tis.), ~420 tis. instalací** ([AppBrain](https://www.appbrain.com/app/lucidity-lucid-dream-journal/ch.b3nz.lucidity)); iOS 4,6 (11) | Deník (hlas, tagy, nálada, zámek PIN/biometrie), RT, obrazovky pro WBTB/WILD/MILD/SSILD, 7denní kurz, AI (Pro); **bez nočních podnětů** | Aktivní |
| **Shape** (Timeless LLC) | Jen iOS (17+) | 19,99 USD/měs., 79,99 USD/rok (dříve 9,99/39,99) | 4,7 (~1,6–1,7 tis.) | 30denní kouč, audio průvodci, připomínky „Am I Dreaming“, Apple Health | Aktivní; stížnost na rozdíl mezi zobrazenou a účtovanou cenou |
| **Awoken** (Andreas Rudolph) | Jen Android | Zdarma s reklamami; 4,99 USD jednorázově | 4,42 (~21 tis.), 1 mil.+ instalací, ~41 stažení/den ([AppBrain](https://www.appbrain.com/app/awoken-lucid-dreaming-tool/com.lucid_dreaming.awoken)) | Náhodné RT, „Totem Sound“ ve dne i v noci (předchůdce TLR), deník, převod řeči na text, analýza slov | **Zastaralé** (poslední aktualizace srpen 2024) |
| **Dream Journal Ultimate** | iOS + Android | Deník zdarma; doplňky 2,99 USD (údaje se liší) | iOS 4,47 (565); Android 4,3 (1 103) | Neomezený deník, RT, lekce, komunita, hlas (nespolehlivý přepis) | Aktivní (2026.2.24) |
| **Lucid Dreamer** (guardanus) | iOS + Android | Pro ~6,99 USD jednorázově | ~4,0 (starý údaj) | RT až 150–287×/den, noční podněty, vlastní zvuky, režim „Paralyzer“ pro WILD | **Pravděpodobně zastaralé** (~2022) |
| **Reality Check** (Oneironaut LLC) | Jen iOS 26+ | Zdarma (podle výrobce) | — | Chytré plánování RT, 50+ neopakujících se výzev, statistiky | Nová (2025–26) |
| **Sleep as Android** (Urbandroid) | Android + wearables | Freemium | — | Podněty 10/20/30 min po lehké fázi; výrobce přiznává ~50% šanci trefit REM | Aktivní |
| **„lucid“** (Paller lab, Northwestern) | Jen Android | Zdarma (výzkum) | — | Plný protokol TLR (trénink + podněty), telefon na nabíječce | Výzkumná; balíček údajně `com.neurelectrics.dive` [NEOV] |
| **Lucidly** | iOS + nutné Apple Watch | 5,99 USD/měs., 39,99 USD/rok (2024) | — (G2: 0) | Neuronová síť odhaduje REM z dat hodinek, haptika/zvuk, hypnagogický režim; výrobce tvrdí „>80 %“ | Nejasný; limit relace 270 min |
| **Ludin** | Telefon | — | — | Akcelerometr na matraci, model REM v zařízení, světelný podnět; slibuje zveřejnit přesnost | Spuštěno 1. 10. 2026; tvrzení výrobce „45 %“ neověřeno |
| **Somnium** | iOS | Zdarma + premium | — | RT, offline průvodci WBTB/MILD, hlasový deník, 100% offline | — |
| **MILD Trainer** (N. Woolmore) | iPhone | 3,99 USD | — | Denní „události“ jako spouštěče prospektivní paměti | — |
| **Lucid Now / Lucid Scribe** | iOS | Zdarma + IAP | — | Inzerují podněty v REM / TLR playlisty | Nové, bez validace |
| **Everdream** | iOS 15+ | Pro 19,99 USD/rok | — | „REM“ budík po WBTB, RT, deník; ~50% vybití baterie | — |
| **LucidMe** (REMspace, dříve Phaser) | iOS + maska | Aplikace zdarma, maska 245 USD | — | Deník, maska | Hardware nejistý |
| **Elsewhere** | iOS + Android | 4,99 USD/měs., 49,99 USD/rok | — | AI deník, obrázky, 30+ jazyků; **žádné LD nástroje** | Aktivní |
| **Open-source watchOS TLR** (Mallela & Mallett 2024) | Apple Watch | Open source | — | Předspánkový trénink, vlastní REM staging v reálném čase, podněty ([IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/100797)) | Výzkum; URL repozitáře nezískána |
| **Dreamu, Lucidly: AI Dream Journal** | Android | — | — | Úrovňové kurzy (0–12; 6 lekcí) | Nové (2026) |
| **WorldWithin, DreamKeeper** | iOS | Zdarma | — | RT / pouze deník | Opuštěné (2022 / 2023) |

**Volby v jednotlivých kategoriích** (s výhradou, že žebříčky píší převážně konkurenti: Oniri, Oneironauts, Ludin, INSPEC):

- **Nejlepší celkově, napříč platformami:** **Oniri**, protože má nejširší sadu funkcí včetně nočních podnětů. Nevýhodou je silný paywall a slabší pozice na Androidu ([Oniri 2026, výrobce](https://www.oniri.io/post/best-lucid-dreaming-apps)).
- **Nejlepší na Androidu podle hodnocení:** **Lucidity (Benz)** s 4,83 a ~420 tis. instalacemi; výborný deník a trenažér SSILD, chybí noční podněty.
- **Nejlepší zdarma na Androidu:** výzkumná aplikace **„lucid“ (Paller lab)**, protože je jako jediná validovaná. Druhou volbou je Awoken, který ale není udržovaný.
- **Nejlepší zdarma na iOS:** **Reality Check** pro RT spolu s **Dream Journal Ultimate** nebo **Somnium** pro deník.
- **Nejlepší deník:** Lucidity, nebo Dream Journal Ultimate pro poměr ceny a výkonu. Pro soukromí Somnium (offline).
- **Podněty v noci:** **žádná aplikace není nezávisle validována** kromě protokolu Paller lab. Pro Android Sleep as Android (přiznaných ~50 %), pro Apple Watch Lucidly (tvrzení výrobce).
- **Pro začátečníky:** 7denní kurz Lucidity, nebo 30denní kouč Shape (iOS, drahý).

**Rozšíření perspektivy: opakované stížnosti.** Všechny stížnosti, které se podařilo zachytit, jsou produktové příležitosti:

- **Podněty budí nebo míjejí REM.** V domácí TLR studii bylo po podnětech významně více probuzení. Deirdre Barrett (Harvard) říká, že aplikace „někdy lidi budí“ ([Vice](https://vice.com/en/article/i-tried-controlling-my-dreams-with-my-iphone-lucid-apps)). Na fóru LD4all si uživatel stěžoval, že Dream:ON „často mine REM“ ([LD4all](https://community.ld4all.com/t/best-lucid-dreaming-app-for-ios/39963)).
- **Budíky selhávají.** Lucidity od Shane Curtise posouvala budík nastavený mezi 19:00 a půlnocí automaticky na další den.
- **Nutnost nechat telefon na nabíječce a vybíjení baterie** (Everdream ~50 %).
- **Netransparentní paywally** (Shape, Oniri).
- **Opuštěné aplikace** (Awoken, Lucid Dreamer, WorldWithin, DreamKeeper) a **chybějící export a zálohy**.
- **Nespolehlivý hlasový přepis.**
- **Fragmentace platforem:** Shape a Reality Check jsou jen pro iOS, Awoken a aplikace Paller lab jen pro Android.
- **Chybí zpětná vazba, co funguje právě mně.**

AI interpretace snů je komoditizovaná. Recenzenti upozorňují, že neexistuje studie, která by ukazovala, že jsou AI výklady „přesné“ ([Oniri](https://www.oniri.io/post/best-dream-interpretation-apps)). Sny jsou citlivá data a soukromí je v recenzích silný rozlišovací faktor.

**Strategický návrh.** Nejvíce „evidence-based“ nabídkou na trhu by byla aplikace, která:

- implementuje publikovaný protokol TLR (zvuk naučený před spaním, podněty v pozdním okně, pozastavení podle pohybu a adaptivní hlasitost);
- funguje **i na iOS**, kde zatím žádný validovaný protokol není;
- má offline-first deník s exportem;
- měří osobní efekty jednotlivých technik.

Viditelně aktivní vývoj je na trhu plném zastaralých aplikací konkurenční výhodou sám o sobě.

**Limitace.** Konsenzus komunity Reddit/DreamViews nebyl ověřen. Chybí data o tržbách a stahování (AppMagic/Sensor Tower). Údaje o Oniri na Androidu mají nízkou jistotu. Ceny v EUR/CZK nebyly zachyceny.

---

## Technická proveditelnost: telefon nevidí REM v reálném čase

**Analýza jádra.** Rozhodující omezení je architektonické. **Ani HealthKit, ani Health Connect neposkytují spánkové fáze v reálném čase.** Inženýr Apple Developer Relations potvrdil, že klasifikátor Apple Watch běží v privátním systémovém procesu, ke kterému aplikace nemají přístup ([Apple Developer Forums 804512](https://developer.apple.com/forums/thread/804512)) [V]. Apple zapisuje fáze až po probuzení a jen pro relace delší než 3 h ([Apple white paper, říjen 2025](https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf)) [V]. Samsung vytváří data o spánku na hodinkách až po probuzení ([Samsung Developer](https://developer.samsung.com/health/blog/en/managing-sleep-data-with-samsung-health-and-health-connect)) [V]. Health Connect ukládá `SleepSessionRecord` až po dokončené relaci ([Android Developers](https://developer.android.com/health-and-fitness/health-connect/features/sleep-sessions)) [V].

**Přesnost wearables vůči PSG** je pro rozlišení spánku a bdění dobrá (citlivost ≥ 95 %), pro fáze jen střední:

- Studie financovaná Oura uvádí čtyřfázové kappa: Oura 0,65, Apple Watch 0,60, Fitbit Sense 0,55 ([PMC11511193](https://pmc.ncbi.nlm.nih.gov/articles/PMC11511193/)) [V].
- Šest zařízení na zápěstí mělo kappa 0,21–0,53 ([Sleep Advances 2025](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC12038347/)) [V].
- Jedenáct trackerů mělo makro F1 0,26–0,69. Nejlepší byla aplikace na bázi mikrofonu (SleepRoutine) s F1 pro REM 0,76, ale studie má vazby na výrobce ([Lee 2023, JMIR](https://mhealth.jmir.org/2023/1/e50983)) [V].
- Sleep as Android přiznává, že REM nelze z pohybu přímo určit. Jejich simulace dává ~50% šanci, že podnět padne do REM, a výrobce doporučuje nespouštět podněty první 2 h ([Sleep as Android Docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html)) [V].

**Omezení iOS na pozadí:**

- **(a) Celonoční audio relace** (`UIBackgroundModes: audio`) je přijatelná jen tehdy, když aplikace **skutečně přehrává slyšitelný obsah** (zvuková kulisa, šum) nebo zpracovává mikrofon pro analýzu spánku jako Sleep Cycle SDK ([Sleep Cycle SDK](https://sdk.sleepcycle.com/en/ios)) [V]. Tiché audio jako udržovač při životě Apple zamítá podle pravidla 2.5.4 ([GitHub alarm #87](https://github.com/gdelataillade/alarm/discussions/87); [Apple Forums 95216](https://developer.apple.com/forums/thread/95216)) [V-forum].
- **(b) AlarmKit (iOS 26)** umožňuje budíky, které projdou tichým režimem i Focus s vlastním zvukem z bundlu, ale **„neprobudí aplikaci“**. Hodí se proto jen pro pevně časované podněty, ne pro adaptivní ([WWDC Notes](https://wwdcnotes.com/documentation/wwdc25-230-wake-up-to-the-alarmkit-api/)) [V]. Zvuk budíku je navíc „budíkový“ a může budit.
- **(c) watchOS `WKExtendedRuntimeSession` typu „smart alarm“** lze naplánovat až 36 h dopředu. Běží max. 30 min a musí aspoň jednou spustit haptiku. Aplikace smí mít jen jeden typ relace a novou relaci lze spustit jen z popředí ([ASCIIwwdc WWDC19 251](https://asciiwwdc.com/2019/sessions/251); [Forum 794730](https://developer.apple.com/forums/thread/794730)) [V-forum]. Aktuální limity pro watchOS 26 nebyly ověřeny. Open-source watchOS TLR (Mallela & Mallett) a Lucidly (limit 270 min) ukazují, že vlastní klasifikátor na hodinkách je proveditelný.

**Omezení Androidu:**

- Od Androidu 14 je `SCHEDULE_EXACT_ALARM` pro nové instalace s cílovým API 33+ **ve výchozím stavu zamítnuto**.
- `USE_EXACT_ALARM` je udělováno automaticky, ale politika Google Play ho omezuje na aplikace typu budík nebo kalendář ([Android Developers](https://developer.android.com/about/versions/14/changes/schedule-exact-alarms)) [V]. LD aplikace jako „budík“ nemusí projít.
- Bezpečnější cesta je `SCHEDULE_EXACT_ALARM` s výzvou uživateli nebo foreground service (přehrávání médií) přes celou noc [inference].
- Doze a typy foreground service pro Android 14 nebyly ověřeny.

**Architektura ve vrstvách (inference z podkladů):**

| Vrstva | Co dělá | Výhody | Rizika a omezení |
|---|---|---|---|
| **0. Bez senzorů** (validováno Konkoly 2024) | Předspánkový trénink, WBTB budík, časované podněty v pozdním okně, kalibrace hlasitosti, tlačítko „probudilo mě to“ | Funguje všude, validovaný princip | iOS vyžaduje slyšitelnou zvukovou kulisu po celou noc; Android foreground service; baterie |
| **1. Telefon jako senzor** | Akcelerometr na matraci a/nebo mikrofon pro pravděpodobnostní odhad REM | Bez dalšího hardwaru; nejlepší F1 pro REM měla mikrofonní metoda | Soukromí (mikrofon), přesnost ~50 % u pohybu |
| **2. Apple Watch / Wear OS** | Vlastní klasifikátor ze surových HR/HRV a pohybu na hodinkách, podnět haptikou | Haptika je jemný podnět; přesnější časování | watchOS limity relací; Wear OS přes Health Services / Samsung Sensor SDK [NEOV] |
| **3. Historická data** (HealthKit, Health Connect, Oura/Garmin API) | Personalizace času podnětů podle minulých nocí | Levné, jednoduché | Jen zpětně, žádný reálný čas |
| **4. EEG „pro“** (ZMax/Dreamento, Muse S) | Detekce REM blízká výzkumné kvalitě, LRLR signál | Validace SVLD | Cena, dostupnost SDK [NEOV] |

**Rozšíření perspektivy.** Multicentrická studie v2 naznačuje, že **přesné zasažení REM nemusí být kritické**, protože podnět ≈ falešný podnět. Investice do drahé detekce REM je proto pro MVP špatná priorita. Vyplatí se naopak investovat do **neprobouzení**, což je stížnost číslo jedna.

**Strategický návrh.** MVP postavit na vrstvách 0 a 3. Podnět začíná pod prahem slyšitelnosti a postupně zesiluje. Při pohybu se okamžitě zastaví. Hlasitost se adaptuje noc od noci podle odpovědi „probudilo mě to?“. Vrstvu 2 (Apple Watch haptika) přidat ve verzi 2, vrstvy 1 a 4 jako experimentální.

**Limitace.** Implementace nočních podnětů u Oniri, Lucid Scribe a Lucid Now není známá. Oficiální text pravidla App Review 2.5.4 ani politika Google Play pro exact alarm nebyly staženy.

---

## Tibetská jóga snů a spánku: lucidita jako prostředek, ne cíl

**Analýza jádra.** Jóga snů (tib. *rmi lam*, *milam*) je tantrická praxe všech hlavních tibetských škol i bönu. Nejlépe zdokumentované systémy jsou tři:

- **Šest dharm Náropy** (kagjü, a přes Congkhapův komentář i gelug). Jóga snů je zde třetí z šesti provázaných praxí: vnitřní teplo *tummo*, iluzorní tělo, sen, jasné světlo, *phowa* a bardo. „Rozpoznání“ snu se podle tohoto systému rodí z práce s energií (*prána*) v centrálním kanálu ([Wisdomlib](https://www.wisdomlib.org/buddhism/book/the-six-yogas-of-naropa/d/doc1460908.html); [Encyclopedia of Buddhism](https://www.encyclopediaofbuddhism.org/wiki/Six_Yogas_of_Naropa)) [V].
- **Dzogčhen** (Namkhai Norbu, *Dream Yoga and the Practice of Natural Light*). Vědomí ve snu zde „vyvstává přirozeně z praxe přirozeného světla“ [V].
- **Bön** (Tenzin Wangyal Rinpočhe, *The Tibetan Yogas of Dream and Sleep*, 1998, revize 2022) ([Shambhala](https://www.shambhala.com/the-tibetan-yogas-of-dream-and-sleep.html)) [V].

**Cíle se zásadně liší od západního LD.** Tradice usiluje o rozpoznání všech zážitků (bdělých i snových) jako iluzorních, o snížení lpění a averze, o přípravu na smrt a bardo. **Jóga spánku** míří k rozpoznání jasného světla (*ösel*) v bezesném spánku. Andrew Holecek: LD se stává „super-samsárou, pokud se oddáváte fantaziím“ ([Lion's Roar](https://www.lionsroar.com/dream-yoga/)) [V].

**Čtyři základní praxe (Wangyal)** jsou hotová denní a noční struktura ([obsah knihy, Stillness Speaks PDF](https://www.stillnessspeaks.com/wp-content/uploads/2022/10/TOC-DRC-Tibetan-Yogas-of-Dream-and-Sleep_SH.pdf); [Shambhala course](https://www.shambhala.com/courses/the-tibetan-yogas-of-dream-and-sleep/)) [V]:

1. **Změna karmických stop:** během dne opakovaně rozpoznávat, že smyslová zkušenost je jako sen.
2. **Odstranění lpění a averze:** všímat si emočních reakcí a vnímat je i jejich objekty jako snové.
3. **Posílení záměru:** večer zrekapitulovat den jako sen a pevně se rozhodnout rozpoznat sen.
4. **Pěstování paměti a radostného úsilí:** ráno zrekapitulovat sny, radovat se z úspěchu a bez sebekritiky obnovit záměr.

**Sekvence před spaním:** ležet na pravém boku, pokud je to pohodlné, uvolnit tělo, hlavně hrdlo, a vizualizovat sytě rudý zářící lotos v hrdelní čakře. Obrazy pak postupně pustit a usnout ([Lion's Roar, Wangyal](https://www.lionsroar.com/is-this-a-dream/)) [V]. Norbu místo toho používá bílou slabiku „A“ (zvuk „Ááá“); zda ve středu těla nebo v hrdle, se mezi zdroji liší [V-neoficiální sken]. **Ve snu** se praktikuje rozpoznání, transformace, multiplikace, emanace a **čelení strachu** („vztahujte se ke strachu místo útěku“).

**Výzkum.** Meditace s LD koreluje, ale kauzálně nepůsobí. Systematický přehled z roku 2025 (3 studie) hodnotí vztah všímavosti a LD jako **neprůkazný** ([U Twente](https://research.utwente.nl/en/publications/the-relationship-between-mindfulness-and-lucid-dreaming-a-systema/)) [V]. Od roku 2024 se ale jóga snů dostává do spánkových laboratoří:

- Reaktivace všímavosti (počítání dechů) zvukem v REM: **2 z 5** SVLD ([Wolk a kol. 2024, IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/98233)) [V, PRE].
- Podnět k vizualizaci Čenreziga (Avalókitéšvara) v REM: **2 z 5** s LD, včetně mnicha bez předchozího LD ([Morris a kol. 2026, Brain Sciences](https://www.mdpi.com/2076-3425/16/3/315)) [V, PRE].
- Šest trénovaných praktikujících jógy snů v 19 nocích s PSG a obousměrnou komunikací záměrně vyvolávalo události, které porušují očekávání bdění (manuskript Torres Platas a kol., [PDF](https://bpb-us-e1.wpmucdn.com/sites.northwestern.edu/dist/4/2492/files/2026/07/DYX_PsychSci_R17_unblinded.pdf)) [V, nerecenzováno].
- Registrovaná RCT **NCT07217340** a **NCT07408206** (programy inspirované jógou snů vs. edukace o spánku) zatím nemají výsledky ([ClinicalTrials.gov](https://clinicaltrials.gov/study/NCT07217340)) [V].
- Nejbližším empirickým analogem „lucidního spánku“ je „svědčení“ (*witnessing*) v hlubokém spánku u dlouholetých praktikujících TM: více theta/alfa spolu s deltou a snížené EMG (n = 11 vs. 9 vs. 11) ([Mason a kol. 1997, MIU](https://research.miu.edu/center-for-brain-consciousness-and-cognition/eeg-markers-during-sleep/)) [V, propagační zdroj].

**Mapování na mechanismy LD:**

| Prvek jógy snů | Odpovídající mechanismus LD | Síla důkazů pro LD | Adaptace v aplikaci |
|---|---|---|---|
| Denní „toto je jako sen“ (praxe 1, iluzorní tělo) | Test reality, návyk kritického zkoumání stavu | RT samotné slabé; verze jógy snů netestována | 20–60 s řízené rozpoznání spárované s RT |
| Odstranění lpění a averze (praxe 2) | Emoční decentrace, meta-uvědomění | Korelace (decentrace ↔ LD u dlouhodobých meditujících) | Rychlý záznam reakcí a jejich přerámování |
| Posílení záměru večer (praxe 3) | Prospektivní paměť (MILD) | MILD = E; tibetská verze netestována | 3–5 min audio: den jako sen + záměr |
| Ranní paměť a radostné úsilí (praxe 4) | Vybavování snů, deník, motivace | Vybavování ↔ LD | Deník se soucitnou zpětnou vazbou, bez trestání za přerušené série |
| Noční probuzení s praxí | WBTB | WBTB v kombinaci = E; tradiční rozvrh neověřen | Volitelné, max. 1–3× týdně |
| Rudý lotos / „A“ v hrdle; zvuk „Ááá“ | Kotva pozornosti při usínání (WILD); kandidát na TLR podnět | Přímo netestováno; nejblíže pilot s Čenrezigem (2/5) | Volitelná obrazová a zvuková kotva, současně TLR zvuk |
| Devět očistných dechů, poloha vleže | Relaxace, usínání | Pro LD žádná data | Volitelný rituál zklidnění |
| Dlouhodobá meditace (šamatha, otevřené uvědomění) | Trénink meta-uvědomění | Průřezově pozitivní; MBSR nulový | Dlouhodobá „pokročilá“ stopa |
| Ve snu: transformace, multiplikace, čelení strachu | Kontrola snu; expozice nočním můrám | Pilot (trénovaní to dokážou) | „Mise“ po dosažení lucidity s důrazem na vyrovnanost |
| Jóga spánku / jasné světlo | „Lucidní NREM“, svědčení | Jen EEG u TM; u tibetské praxe netestováno | Dlouhodobý cíl, nikoli metrika |

**Rozšíření perspektivy.** Odstraněním kontextu se mechanismus mění. V systému Náropy a Congkhapy se „rozpoznání“ rodí z práce s pránou. Vizualizace čaker a slabik jsou zasazeny do zmocnění (*empowerment*), guru jógy a božstev, a vytržené z tohoto rámce se stávají pouhými kotvami pozornosti. Bez nauky o prázdnotě a přípravě na smrt se „toto je sen“ redukuje na test reality. Bönská a dzogčhenová podání (Wangyal, Norbu) jsou „nejpřenosnější“, protože stojí na uvědomění, záměru a jednoduché vizualizaci. Wangyal a Norbu své instrukce publikovali veřejně v knihách, takže je lze považovat za veřejně učitelné. Jde o inferenci, nikoli citovaný postoj. Specifická rizika: denní praxe „nic není skutečné“ může u zranitelných lidí zhoršit derealizaci. Rozhovorová studie identifikovala **59 kategorií náročných zážitků z meditace** ([Lindahl a kol. 2017, PLOS ONE](https://pmc.ncbi.nlm.nih.gov/articles/PMC5443484)) [V]. Jóga snů zato přináší čtyři věci, které západní LD postrádá: (1) **kontinuitu dne a noci**, tedy důvod praktikovat i ve dne; (2) **kurikulum pro dobu po dosažení lucidity** (stabilizovat, pozorovat, transformovat, čelit strachu, pustit), protože kontrola je vzácná (29 %); (3) nepatologizující, soucitný přístup k nočním můrám; (4) dlouhodobou pokročilou stopu pro angažované uživatele.

**Strategický návrh.** Nabídnout dvě stopy s různými metrikami úspěchu. **Západní LD stopa** měří počet LD a kontrolu. **Stopa inspirovaná jógou snů** měří rozpoznání bez kontroly, vyrovnanost vůči obsahu, čelení strachu a přenos „snového náhledu“ do dne. Obsah formulovat jako „inspirováno tibetskou buddhistickou a bönskou jógou snů“ a jmenovat zdroje (Wangyal, Norbu, Holecek, Morley). Ve volné a sekulární stopě vynechat vizualizace božstev, guru jógu a tantrické instrukce, které vyžadují zmocnění. Neimplikovat předání (transmisi). Zvážit partnerství s linií (např. Ligmincha, která už provozuje online kurzy). Testovatelná hypotéza pro aplikaci: meditační kotvu (počítání dechů nebo „Ááá“) trénovat ve dne a před spaním jako TLR asociaci a přehrávat ji po WBTB. Spojuje to nejsilnější současný důkaz (piloty reaktivace podnětem) s obsahem jógy snů.

**Limitace.** Wangyalova noční struktura (sezení zhruba každé 2 h, sled thigle v hrdle, na čele, v srdci a v tajné čakře), rozlišení pravého a levého boku podle pohlaví a protokol jógy spánku nebyly v této session ověřeny [PK/NEOV]. Před použitím je nutné je zkontrolovat v knize z let 1998/2022.

---

## Rizika: hlavním nebezpečím je fragmentace spánku, ne sen

**Analýza jádra.** Samotné LD je převážně benigní. U 489 respondentů frekvence LD nesouvisela s horší kvalitou spánku ani s disociací a souvisela s vyšší pohodou. Jen ~10 % LD mělo negativní ladění ([Stumbrys 2023, PsyPost](https://www.psypost.org/2023/07/can-lucid-dreaming-be-dangerous-new-research-suggests-lucid-dreaming-is-generally-a-safe-and-positive-experience-166167)) [S]. V ILDIS úspěšná indukce nezhoršila kvalitu spánku [V]. **Rizika leží ve způsobu indukce:**

- **Fragmentace spánku:** opakovaná probuzení, budíky, WBTB a podněty škálují s frekvencí ([Soffer-Dudek 2020, Front Neurosci](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6993576/); [Tzioridou 2025](https://www.sciencedirect.com/science/article/pii/S0149763425000119)) [V].
- **Disociace a schizotypie:** záměrná indukce predikovala nárůst disociace a schizotypie během 2 měsíců (N = 187, podvzorek pro sledování n = 78, studenti) ([Aviram & Soffer-Dudek 2018](https://www.frontiersin.org/articles/10.3389/fpsyg.2018.00384/full)) [V, PRE].
- **Neúspěšné pokusy:** negativní zážitky (spánková paralýza, neklid) se pojí právě s nimi, pozitivní s úspěchem a kontrolou ([Mallett a kol. 2022](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10104404/)) [V].
- **Lucidní noční můry:** stav, kdy si člověk je vědom, že sní, ale sen neovládá ([Stumbrys 2018, Dreaming](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.00471/epub)) [PK/V].
- **Mýtus „uvíznutí ve snu“** nemá oporu. Řetězce falešných probuzení jsou reálné a nepříjemné, ale vždy skončí ([Sleep Foundation](https://www.sleepfoundation.org/dreams/false-awakening)) [V].

**Skupiny k vyloučení nebo opatrnosti:**

| Skupina | Důvod | Opatření v aplikaci |
|---|---|---|
| Psychóza, vysoká schizotypie, disociativní poruchy | Předběžný longitudinální signál škody; stírání hranice reality | Měkké vyloučení indukce, jen vybavování a relaxace |
| Bipolární porucha | Spánková deprivace může spustit mánii [PK] | Bez WBTB a nočních podnětů |
| Těžká insomnie | WBTB odporuje principům CBT-I [PK] | Bez WBTB; MILD jen při přirozeném probuzení |
| PTSD s nočními můrami | Pozitivní RCT použilo 22h řízený workshop, ne svépomoc | Modul IRT + doporučení odborníka |
| Narkolepsie, porucha spánkové paralýzy | Nestabilní REM; WILD může zvýšit epizody paralýzy | Bez WILD; pod dohledem |
| Epilepsie / fotosenzitivita | Blikající světelné podněty [PK] | Žádné světelné záblesky ve výchozím stavu |
| Těhotné, dospívající, směnoví pracovníci, řidiči | Bezpečnostní riziko spánkového dluhu | Přísný režim bez probouzení |
| Uživatelé galantaminu či doplňků | Lék na předpis, interakce | Jen informace „poraďte se s lékařem“ |

**Rozšíření perspektivy.** Riziko neleží jen na straně uživatele, ale i v designu produktu. Gamifikace, která odměňuje noci s WBTB nebo počet budíků, přímo vytváří expozici hlavnímu riziku. Opakem rizika je přínos: benefit se váže na úspěšnou indukci a kontrolu, škoda na neúspěch a narušený spánek. Aplikace, která zvyšuje podíl úspěšných pokusů a zároveň omezuje počet pokusů, tedy zlepšuje obojí.

**Strategický návrh: bezpečnostní design „sleep-first“.**

1. Screening při onboardingu (psychóza a disociace v anamnéze, bipolární porucha, epilepsie, těžká insomnie, PTSD, léky) s přiřazením bezpečnostní úrovně.
2. Limit WBTB na 1–3 noci týdně, max. jedno plánované probuzení za noc, ideálně o víkendu.
3. Týdenní kontrola spánku a denní ospalosti (1–2 položky, nebo data z wearable) s automatickým snížením intenzity nebo „týdnem odpočinku“.
4. Pravidelná krátká kontrola derealizace a depersonalizace (adaptace CDS-2 nebo DES-II, validovaný LD screener neexistuje [PK]) s pozastavením indukce při nárůstu a s krizovými kontakty.
5. Žádné poradenství k lékům a doplňkům.
6. Ve výchozím stavu zvuk a vibrace, ne světelné záblesky.
7. Normalizace spánkové paralýzy a instrukce, jak ji zvládnout (uvolnit se, nebojovat, pohnout prstem). Strategie „únikové cesty ze snu“ (zavřít oči ve snu vede k dřívějšímu probuzení podle analýzy Paller lab; fixace na jeden bod) označit jako anekdotické nebo předběžné.
8. U denní praxe „jako sen“ formulace „zážitky jsou *jako* sen“ (tradiční znění) místo „nic není skutečné“, plus možnost uzemnění (*grounding*).

**Limitace.** Neexistují data o nežádoucích účincích komerčních LD aplikací ani o „závislosti na LD“. Rizikové studie jsou malé a převážně studentské.

---

## Další užitečné poznatky: terapie, přínosy, komunita a trh

**Terapeutické využití.** Nejlépe prozkoumané jsou **noční můry**. RCT u chronického PTSD (22hodinový LD workshop, n = 49, vs. čekací listina, n = 50) významně snížilo symptomy PTSD i distres z nočních můr s trváním 1 měsíc. Výskyt LD ale nekoreloval se zlepšením, takže mechanismus není jasný. Chybělo zaslepení a autorská instituce (IONS) má na tématu zájem ([Yount a kol. 2025](https://www.sciencedirect.com/science/article/pii/S2468749925000122)) [V]. Přehledy uzavírají, že LD terapie (LDT) **nepřekonává zavedenou IRT** ([Tzioridou 2025](https://www.researchgate.net/publication/387949734_The_Clinical_Neuroscience_of_Lucid_Dreaming); [PMC7900550](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7900550/)) [V]. **Motorický nácvik** v LD zlepšoval jednoduché úlohy v malých studiích, např. finger-tapping srovnatelně s fyzickým nácvikem ([Stumbrys 2016, doi:10.1080/02640414.2015.1030342](https://doi.org/10.1080/02640414.2015.1030342)) [PK]. Kreativita a nálada mají data na úrovni korelací a pilotů. Obousměrná komunikace se snícími je reálná, ale s nízkou propustností: ~18 % správných odpovědí ([Konkoly 2021, Current Biology](https://www.cell.com/current-biology/fulltext/S0960-9822(21)00059-2)) [V/PK k procentům]. Ve snu motorické úlohy trvají zhruba 1,5× déle než v bdění ([Erlacher 2014, doi:10.3389/fpsyg.2013.01013](https://doi.org/10.3389/fpsyg.2013.01013)) [PK].

**Měření lucidity.** Lucidita a kontrola jsou odlišné a jen částečně korelují. Škála LuCiD má 28 položek a 8 faktorů: náhled, kontrola, myšlení, realismus, paměť, disociace, negativní a pozitivní emoce ([Voss 2013, doi:10.1016/j.concog.2012.11.001](https://doi.org/10.1016/j.concog.2012.11.001)) [PK]. Pro aplikaci to znamená zaznamenávat luciditu a kontrolu odděleně a ověřovat luciditu předem plánovanou akcí ve snu.

**Komunita a kurzy.** r/LucidDreaming měl ~419 tis. členů v roce 2021 ([Mallett, PMC10104404](https://pmc.ncbi.nlm.nih.gov/articles/PMC10104404)) [V]. Největší LD server na Discordu, Dream Café, má ~40,5 tis. členů. Gamifikovaný Project Icarus s úkoly a odměnami za záznamy snů ukazuje poptávku po struktuře a odpovědnosti ([Discord](https://discord.com/servers/project-icarus-1250299699043504188)). Opakované potíže z fór: lucidita rychle mizí kvůli vzrušení nebo pohlcení dějem, sny jsou nestabilní a rozmazané, objevují se falešná probuzení. Někteří praktikující luciditu záměrně tlumí, protože jim kontrola „bere něco ze snu“. Trh kurzů je malý a roztříštěný:

- Lucid Dreaming Fast Track: 67 USD jednorázově ([WoLD Academy](https://academy.world-of-lucid-dreaming.com/checkout)).
- Charlie Morley: Zoom workshop 195–275 GBP ([Meetup](https://www.meetup.com/charlie_morley_lucid_dreaming/events/314039741/)).
- Andrew Holecek (Sounds True): 147 USD ([Sounds True](https://www.soundstrue.com/products/the-lucid-dreaming-training-program)).
- Nejlepší kurz na Udemy má jen ~4,4 tis. studentů ([Udemy](https://www.udemy.com/course/luciddreamingtraining/)).

Žádná z klasických autorit (LaBerge, Love, Tuccillo, Raduga) neprovozuje moderní adaptivní online program. Trh LD zařízení se odhaduje na ~113,7 mil. USD (2023) ([GlobeNewswire/TMR](https://www.globenewswire.com/de/news-release/2024/12/04/2991574/32656/en/Lucid-Dreaming-Devices-Market-to-Surpass-US-196-8-Million-by-2034-Fueled-by-Rising-Consciousness-and-Therapeutic-Applications-Transparency-Market-Research.html)). Jde o placenou analýzu trhu, nikoli o nezávislá data.

**Historie jako narativ.** Aristotelés popisuje vědomí, že „to, co se ukazuje, je jen sen“. Augustin v roce 415 popisuje sny lékaře Gennadia. Marquis d'Hervey de Saint-Denys vydal roku 1867 32 let pozorování, Frederik van Eeden roku 1913 zavedl termín „lucid dream“ a Celia Green roku 1968 předpověděla souvislost s REM ([Lucidity Letter](https://journals.macewan.ca/lucidity/article/download/807/747/2330); [CRI](https://www.equip.org/articles/consciously-dreaming-a-look-at-lucid-dreams/)) [V/S]. Spor o prvenství mezi Hearnem a LaBergem je vhodné podat neutrálně: Hearne s Worsleyem byli první (1975), LaBerge publikoval nezávisle a v hlavním proudu. 12. duben je „Lucid Dreaming Day“.

---

## Důsledky pro vývoj aplikace

Tato sekce je psaná jako zadání. Zásady: **spánek na prvním místě, vybavování snů na prvním místě, jádro MILD/SSILD, podněty jako doplněk, bezpečnostní brány, poctivé hodnocení důkazů.**

### 1. Pozice produktu a „core loop“

**Pozice:** „Vědecky poctivý trenér lucidního snění, který chrání váš spánek a učí se, co funguje právě vám.“ Odlišení od konkurence tvoří transparentní hodnocení důkazů u každé techniky, osobní experimenty, TLR na obou platformách a důraz na soukromí.

**Denní smyčka (core loop):**

1. **Den (1–3 min celkem):** 1–4 vědomé testy reality spouštěné událostmi a personalizované znaky snů. Volitelně „toto je jako sen“ (stopa jógy snů).
2. **Večer (3–20 min):** rekapitulace dne, záměr vybavit si sny nebo MILD záměr, volitelně TLR trénink (~20 min se zvukem) nebo krátká verze. Kalibrace hlasitosti podnětu.
3. **Noc:** (a) v noc s WBTB (max. 1–3× týdně) jemný budík v 5.–6. h, rychlý zápis, MILD nebo SSILD s audio průvodcem, cíl usnout do 10 min; (b) volitelně TLR podněty v pozdním okně s adaptivní hlasitostí a okamžitým zastavením při pohybu.
4. **Ráno (1–2 min):** „Nehýbej se, přehraj si sen“, hlasový záznam, ranní check-in (vybavení ano/ne, lucidita 0–4, kontrola 0–4, probudil mě podnět ano/ne, kvalita spánku 1–5) a automatické označení použité techniky.
5. **Týdně:** osobní report (vybavené sny/týden, LD/týden, úspěšnost podle techniky, trend spánku, nalezené znaky snů) a návrh úpravy plánu.

### 2. Fáze uživatelské cesty

| Fáze | Týdny | Obsah | Hlavní KPI | Brána do další fáze |
|---|---|---|---|---|
| **0. Onboarding** | Den 1 | Screening rizik, výchozí vybavování, LD a noční můry, latence usnutí, rozvrh spánku, cíl (zvědavost / noční můry / kreativita / spirituální stopa), nastavení očekávání („týdny, ne noci“) | Dokončení | Bezpečnostní úroveň |
| **1. Vybavování** | 1–3 | Deník, večerní záměr, ranní rituál, objevování znaků snů | Sny vybavené za týden | ≥ 3 vybavené sny/týden nebo uplynutí 3 týdnů |
| **2. Uvědomění** | 3–8 | MILD při přirozeném probuzení, RT spouštěné událostmi, 1–2 implementační záměry „když [znak snu], pak…“, volitelná mikropraxe všímavosti | MILD provedeno, kvalita zkoušky | Stabilní spánek |
| **3. Zesílení (opt-in)** | 4+ | WBTB 1–3× týdně, MILD nebo SSILD (volba uživatele), TLR podněty, volitelně Apple Watch haptika | LD/týden, úspěšnost na pokus | Kontrola spánku v pořádku |
| **4. Po luciditě** | průběžně | Předem plánovaná akce (zároveň validace), stabilizační tipy („nízká evidence“), „mise“ (motorika, kreativita, otázka postavě snu), stopa jógy snů (vyrovnanost, čelení strachu) | Kontrola, trvání, emoce | — |
| **Modul noční můry** | kdykoli | IRT rescripting + volitelný trénink lucidity, doporučení odborníka u PTSD | Frekvence a distres nočních můr | — |

### 3. Funkce MVP (verze 1)

1. **Deník offline-first:** hlasový záznam s převodem na text v zařízení, rychlý zápis z lock screenu nebo widgetu, tagy, šifrování, **export** (JSON/Markdown/PDF) a šifrovaná záloha.
2. **Těžba znaků snů:** NLP v zařízení nebo pravidlová extrakce opakujících se motivů, které se automaticky stávají cíli MILD a RT.
3. **Plánovač WBTB:** výchozí 5 h po *skutečném* usnutí (odhad z historie nebo ručně), rozsah 4,5–6 h, spolehlivý budík (AlarmKit na iOS 26; na Androidu `SCHEDULE_EXACT_ALARM` s vysvětlením), limit 1–3 noci týdně.
4. **Audio průvodci MILD a SSILD:** MILD s editovatelnou frází a smyčkou fráze s vizualizací bez pevného počtu opakování; SSILD v režimu ILDIS (4 × 2–3 s, 4–6 × ~20 s, zvukové předěly) a volitelném laboratorním režimu.
5. **TLR „časovaný režim“:** předspánkový trénink se zvukem, kalibrace hlasitosti, podněty v okně ~6 h od tréninku nebo usnutí (konfigurovatelné, ověřit v Konkoly 2024), start pod prahem slyšitelnosti s pozvolným zesílením, pozastavení při pohybu (akcelerometr), dotaz „probudilo mě to?“ a adaptace hlasitosti. Na iOS skutečná zvuková kulisa (šum, déšť) přes celou noc, aby aplikace splnila pravidla audio relace na pozadí. Na Androidu foreground service typu media playback.
6. **Stejný „totem“ zvuk** ve dne pro RT připomínky a v noci jako TLR podnět. Princip Awokenu, spojený s publikovaným protokolem.
7. **Ranní check-in a osobní analytika** (viz bod 6).
8. **Bezpečnostní brány** (viz sekce o rizicích), týdenní kontrola spánku, automatické snížení intenzity.
9. **Knihovna technik s odznaky důkazů** (E / slibné / komunitní / bez dat) podle tabulky věrohodnosti, s odkazy na zdroje.
10. **Obě platformy od prvního dne** (iOS + Android).

### 4. Verze 2 a experimentální funkce

- **Apple Watch / Wear OS:** vlastní pravděpodobnostní klasifikátor REM ze surových HR/HRV a pohybu, haptický podnět, inspirace open-source watchOS TLR (Mallela & Mallett 2024). Ověřit limity `WKExtendedRuntimeSession` ve watchOS 26.
- **Personalizace z historie:** HealthKit/Health Connect pro typické časy REM uživatele (jen zpětně).
- **Telefon na matraci:** akcelerometr nebo mikrofon jako pravděpodobnostní senzor, s veřejně zveřejněnou přesností (jako slibuje Ludin).
- **Stopa jógy snů** se zdroji a případným partnerstvím s linií.
- **Režim Dormio:** inkubace obsahu při usínání (není LD, ale je atraktivní).
- **„Pro“ EEG integrace** (ZMax/Dreamento, Muse) pro LRLR signál.
- **Citizen science:** anonymizované opt-in sdílení dat po vzoru ILDIS, případně spolupráce s laboratoří (Paller, Dresler, Erlacher), což zároveň buduje důvěryhodnost.

### 5. Mezery na trhu a diferenciátory

1. **TLR na iOS**, kde dosud žádná aplikace nemá validovaný protokol (aplikace Paller lab je jen pro Android).
2. **Podněty, které nebudí**, tedy řešení stížnosti číslo jedna.
3. **„Co funguje mně“:** analytika úspěšnosti podle techniky, kterou žádná recenzovaná aplikace jasně nenabízí.
4. **Poctivost:** odznaky důkazů, žádné sliby typu „první LD dnes v noci“, zveřejněné metriky.
5. **Spolehlivost:** budíky, které fungují, noční režim šetrný k baterii, export, aktivní vývoj.
6. **Férová monetizace:** štědré bezplatné jádro (deník, RT, základní MILD/SSILD, časované podněty), placené pokročilé audio, wearables a analytika, **doživotní licence** jako alternativa předplatného, transparentní cena.
7. **Soukromí:** sny jsou citlivá data, takže zpracování v zařízení, šifrování a žádné prodávání dat.
8. **Dvě stopy** (západní LD a jóga snů) s rozdílnými metrikami úspěchu.

### 6. Měření a osobní analytika

- **Primární KPI pro fázi 1:** vybavené sny za týden. Pro fázi 3: LD za týden a **úspěšnost na pokus** (LD / noci s technikou).
- **Výchozí stav uvnitř uživatele:** 1 týden logování bez intervence, po vzoru Aspy a ILDIS. Bez něj aplikace kvůli samovýběru a vysoké výchozí frekvenci LD nadhodnocuje efekt.
- **Mikro-randomizace na úrovni nocí:** v nocích s TLR náhodně zapínat podnět nebo falešný podnět či ticho (s informovaným souhlasem), po vzoru Konkoly 2024. Díky tomu lze uživateli i týmu ukázat skutečný efekt podnětu.
- **Záznam pro každou noc:** technika, čas WBTB, délka bdění, odhadovaná latence usnutí, počet opakování MILD, podnět ano/ne a hlasitost, „probudilo mě to“, vybavení, lucidita 0–4, kontrola 0–4, trvání, způsob ukončení (probuzení / ztráta lucidity / falešné probuzení), emoce, kvalita spánku.
- **Validace lucidity bez EEG:** otázka „Provedl(a) jste plánovanou akci ve snu?“ a krátký dotazník odvozený z LuCiD (licence nebo adaptace).
- **Bezpečnostní metriky:** trend kvality spánku a denní ospalosti, skóre derealizace, počet nocí s probuzením za týden.
- **Produktové metriky:** retence v týdnech 1–3 (rizikové okno odpadu), podíl uživatelů, kteří dosáhnou fáze 3, NPS.
- **Interpretace:** zobrazovat intervaly spolehlivosti nebo „zatím málo dat“; neprezentovat šum jako úspěch.

### 7. Co NEstavět

- **Žádný vlastní hardware** ani EEG čelenku v MVP. Historie oboru je hřbitov zařízení.
- **Žádnou drahou detekci REM jako jádro.** Data neukazují, že by přesné zasažení REM bylo kritické. Detekce je volitelné zpřesnění.
- **Žádné „LD binaurální rytmy“, 432 Hz ani subliminální audio** jako metodu účinnosti. Šum a zvuková kulisa jsou v pořádku jako relaxace a jako technický nosič audio relace na iOS.
- **Žádné samostatné WBTB, samostatné RT nebo afirmace** jako hlavní slib (mají nulové výsledky).
- **Žádná doporučení léků a doplňků** (galantamin, Calea, B6), jen informace s upozorněním na lékaře.
- **Žádné blikající světelné podněty** ve výchozím stavu.
- **Žádné tiché audio jako udržovač při životě na iOS** (riziko zamítnutí podle 2.5.4).
- **Žádné trestající série ani gamifikaci, která odměňuje počet probuzení.** Hrozí poškození spánku a gamifikace má malý nebo nulový efekt.
- **Žádnou AI interpretaci snů jako „pravdu“.** Výklad nabízet jen jako podnět k reflexi; komoditní funkce nemá být diferenciátorem.
- **Žádné terapeutické sliby** (PTSD, úzkost) bez klinické validace a regulatorního posouzení.
- **Žádné božstvo, guru jóga ani tantrické instrukce** ve volné stopě a žádné implikování předání (transmise).
- **Žádné marketingové údaje typu „54 %“ nebo „80 % za 2 dny“.**

### 8. Etika

- **Poctivost očekávání:** „U motivovaných lidí ve studiích vycházela nejlepší technika zhruba na 1 noc z 6 v prvním týdnu; u většiny začátečníků jde o týdny.“
- **Soukromí:** sny jako zvláštní kategorie citlivých dat. Zpracování v zařízení, šifrování end-to-end, žádné sdílení s reklamními sítěmi, výchozí nastavení výzkumného sdílení vypnuté.
- **Zranitelní uživatelé:** screening, měkké vyloučení, režim pro nezletilé, krizové kontakty, auto-throttling.
- **Kulturní respekt:** připisovat zdroje, odlišit „inspirováno“ od „autentické praxe“, nepodávat istikháru, šamanismus ani indigenní praxe jako „LD hack“.
- **Transparentnost:** odznaky důkazů, odkazy na studie, zveřejněná přesnost případné detekce REM, jasná cena a snadné zrušení předplatného.
- **Autonomie (SDT):** uživatel volí techniku (MILD/SSILD/TLR) se zdůvodněním. Žádné manipulativní dark patterns.

### 9. Položky k ověření před nasazením do produktu

| Položka | Stav | Kde ověřit |
|---|---|---|
| Rozvrh podnětů Konkoly 2024 (počet, interval, okno, akustika, pravidlo pauzy, počítání 6 h) | Neověřeno | [PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932) / [PDF](https://faculty.wcas.northwestern.edu/paller/C&C24.pdf) |
| N experimentu 2 (112 vs. 120) | Rozpor | Tamtéž, Methods |
| Časování SSILD v ILDIS (4 × 2–3 s, 4–6 × ~20 s, nepočítat) | Pravděpodobné | [ILDIS PDF](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01746/pdf) |
| Doslovné instrukce MILD (ILDIS/NALDIS) a LaBergeova knižní formulace | Neověřeno | Doplňkové materiály ILDIS; LaBerge & Rheingold 1990 |
| Skupiny RT v ILDIS („Breath“, „Hands“) | Úryvek, možná zkomolený | ILDIS plný text |
| Procenta NightLight 1994 (délka bdění při WBTB) | Jen sekundárně | [lucidity.com](http://www.lucidity.com/NL63.RU.Naps.html) |
| Multicentrická studie v2: recenzovaná verze | Preprint | [bioRxiv v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2); laboratoř Dresler |
| Limity `WKExtendedRuntimeSession` ve watchOS 26; AlarmKit dokumentace | Neověřeno z oficiálních docs | Apple Developer Documentation |
| App Review 2.5.4 (audio na pozadí); Google Play politika exact alarm; Doze a typy foreground service v Androidu 14+ | Jen fóra a sekundární zdroje | Oficiální pravidla Apple/Google |
| Hodnocení, ceny a stav aplikací (zejména Oniri na Androidu, Shape, Lucidly, Ludin) | Snímky z vyhledávačů | Obchody přímo; Reddit r/LucidDreaming |
| Wangyalova noční struktura, poloha podle pohlaví, protokol jógy spánku | Neověřeno | Kniha Wangyal 1998/2022 |
| Právní status Calea a galantaminu v ČR | Neověřeno | SÚKL |
| Výsledky NCT07217340 / NCT07408206; diplomová práce o Oniri (UNIGE) | Nepublikováno / s omezeným přístupem | ClinicalTrials.gov; [UNIGE](https://archive-ouverte.unige.ch/unige:190406) |
| Údaje [PK] (Dodet 2015, Voss 2012, Filevich 2015, LuCiD, Lally detaily, metaanalýza implementačních záměrů 642 testů) | Neověřeno v této session | DOI uvedené v textu |

---

## Závěr

Hlavní posun v porozumění je tento: **lucidní snění je problém načasování a prospektivní paměti, ne problém detekce mozkového stavu.** Data z let 2024–2026 se sbíhají k obrazu, v němž trénink před spaním plus dobře načasovaný pozdní spánek dělají většinu práce. Technologie přidává málo k četnosti LD a možná něco k jejich délce. Laboratorní čísla 40–50 % vznikají hlavně díky instrukcím, kontextu a probuzení z REM, ne díky přístrojům. Pro produkt to obrací obvyklou logiku „lepší senzor = lepší výsledek“. Skutečné úzké hrdlo je behaviorální: rychle znovu usnout, vydržet týdny bez odměny, nepoškodit si spánek a vědět, co funguje právě mně. To jsou problémy, které dobře navržená aplikace řeší lépe než maska za 300 €.

Druhý, méně zjevný závěr je, že spirituální tradice a věda se tu doplňují jinak, než se obvykle tvrdí. Jóga snů nepřináší lepší *indukci*; její indukční prvky jsou totožné s MILD, WBTB a testy reality. Přináší ale **smysl a kurikulum pro dobu po dosažení lucidity**. Kontrola nad snem je přitom vzácná (29 % lucidních snílků) a právě kontrola a vyrovnanost určují, zda je zážitek přínosný. Aplikace, která spojí poctivě měřené jádro induktivních technik s respektující stopou „co dělat, když se probudím ve snu“, by obsadila místo, které dnes nedrží nikdo: mezi gamifikovanými trenažéry bez důkazů a výzkumnými prototypy bez uživatelského zážitku.
