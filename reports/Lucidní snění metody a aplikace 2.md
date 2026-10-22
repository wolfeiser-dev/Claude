# Lucidní snění: trénink a načasování porážejí přístroje (verze 2)

Lucidní sen (LD, *lucid dream*, tedy sen, v němž si snící uvědomuje, že sní) se dá natrénovat, ale ne spolehlivě zapnout. Ověření plných textů tento závěr z verze 1 spíš zpřísnilo, než oslabilo. Nejstabilnější výsledek napříč studiemi dává domácí kombinace tří kroků. Prvním je probuzení zhruba po 5 hodinách spánku (WBTB, *Wake Back To Bed*). Druhým je krátká kognitivní technika: MILD (*Mnemonic Induction of Lucid Dreams*, záměr a vizualizace) nebo SSILD (*Senses-Initiated Lucid Dream*, cyklické přesouvání pozornosti mezi smysly). Třetím je rychlé opětovné usnutí. U motivovaných dobrovolníků vychází **16–20 % praktikovaných nocí s LD během jednoho týdne** (NALDIS 17,4 %, ILDIS 16,5–16,9 %). Jediným replikovaným behaviorálním prediktorem je **usnutí do 10 minut**; populární hranice „do 5 minut“ se nereplikovala. TLR (*Targeted Lucidity Reactivation*: zvuk naučený před spaním a přehraný ve spánku) zůstává nejzajímavější technologií. Domácí efekt ale stojí na sekundárních analýzách. Často citovaný rozdíl ~17 % vs. ~5 % platí jen pro druhou noc studie Konkoly 2024 a v celém vzorku efekt významný nebyl. Magisterská replikace přes aplikaci Oniri vyšla nulová. V nejlépe kontrolované laboratorní studii skutečné podněty nepřekonaly falešné (38,3 % vs. 28,3 %, n.s.). Laboratorní čísla 40–50 % jsou produktem kontextu (ranní zdřímnutí, buzení z REM, explicitní instrukce), ne přístrojů. Hardware zůstává hřbitovem neověřených zařízení. Jediná látka s RCT, galantamin, je v ČR na lékařský předpis a „doplňky“ s ním byly podle studie v JAMA 2024 v 9 z 10 případů chybně označené. Trh aplikací se od verze 1 posunul: na iOS už existuje nejméně pět aplikací s nočními podněty a na Wear OS aplikace s odhadem REM v reálném čase. Žádná ale nemá validovaný protokol a výzkumná aplikace Paller lab už není dostupná. Pro vývojáře z toho plyne příležitost i tvrdé hranice. Aplikace má stavět na vybavování snů a na MILD/SSILD po WBTB, TLR nabízet jako volitelný zesilovač s parametry z publikovaného protokolu a osobní efekt měřit poctivě (mikrorandomizací nocí). Musí přitom respektovat, že iOS ani Android nedávají třetím stranám spánkové fáze v reálném čase a že hlavním rizikem celé disciplíny je narušování spánku.

> **Co se změnilo oproti verzi 1 (nejdůležitější opravy)**
>
> - **Konkoly 2024 (domácí TLR):** ~17 % vs. ~5 % je srovnání **jen 2. noci** (n = 112). V celém vzorku efekt **nebyl významný** (p > 0,3). Skupina s naučeným podnětem dostávala podněty **všech 7 nocí**, ob noc je dostávaly jen kontroly. „416“ je skutečné číslo (lidé, kteří aplikaci použili aspoň jednou). Dobrovolně z experimentu 1 odstoupil jen 1 z 26 účastníků, ostatní úbytek byl technický. Přesné parametry protokolu jsou nově ověřené (Protokol 5).
> - **„Usnutí do 5 min = 45,8 %“** pochází z pouhých 24 pokusů 14 lidí s nadprůměrnou výchozí frekvencí LD a ILDIS ho **nereplikoval**. Replikovaná je hranice ≤ 10 min (18,3 % vs. 11,1 %).
> - **Erlacher 2022 „neprokázal“, že 6 h > 4,5 h.** Srovnával vlastní data za 4,5 h s dřívější studií za 6 h; jde o naznačení, ne o důkaz.
> - **Laboratorní MILD + WBTB:** ověřený LD (signálem očí) ve **~27 %**, ne v ~1/3.
> - **„Předchozí zkušenost je nejsilnější prediktor“ zjemněno.** Výchozí frekvence LD predikuje úroveň úspěchu, ale ILDIS nenašel rozdíl podle předchozí zkušenosti s technikami a začátečníci reagují také.
> - **Peters 2026 („instrukce stačí“) zjemněno.** Větev s instrukcemi bez VR měla **nejnižší** podíl ověřených LD (11,1 %); design je zkreslený rozdílným buzením.
> - **Multicentrická studie (MC v2):** delší LD pod podněty jen v 1 ze 3 měr; podněty zkrátily REM a snížily efektivitu spánku. Studie je přejmenovaná a stále jde o preprint (srpen 2026).
> - **Morris 2026 (Čenrezig): 0 signálem ověřených LD.** Mnich měl první LD doma noc po laboratoři, bez podnětů.
> - **ILDIS (Aspy 2020) explicitně instruoval minimálně 10 testů reality denně.** „RT Breath“ znamená nádech zavřenými ústy, ne ucpaným nosem. MILD + RT vyšlo hůř než MILD bez RT (12,1 % vs. 19,4 %, p = 0,052).
> - **Aplikace:** výzkumná aplikace Paller lab už není dostupná (nástupce: MIT „Lucid Dreaming Experiment“, jen USA). Lucid Dreamer je stažený z obchodů, „Somnium“ je dnes horoskopová aplikace a Ludin k 22. 10. 2026 nevyšel. Ceny Oniri, Shape, Everdream, MILD Trainer, Awoken a LucidMe jsou opravené, s CZK/EUR. Nově přibyly Lucyd, LDAlarm, Lucid Wake, Dream Catcher, Lucidity Level a Somni Mask.
> - **Platformy:** pravidlo App Store 2.5.4 je obecná věta; riziko zamítnutí tichého audia vychází z fór, ne z textu pravidla. Limity AlarmKit, watchOS sezení, HealthKitu, Android exact alarmů a foreground services jsou nově doložené citacemi z oficiální dokumentace.
> - **Zařízení:** ZMax stojí 1 200 € bez DPH (ne ~900 USD), Remee 67 USD. Prophetic Phase používá fNIRS (ne EEG) a Dual nemá žádné neurální senzory. Nově přibyly INSPEC a Somni Mask Pro.
> - **Látky:** *Calea zacatechichi* **není v ČR kontrolovaná** (na rozdíl od Polska). Galantamin je v ČR jen na předpis. Údaj „donepezil 8/10“ pochází z patentu, ne ze studie.
> - **Neurověda a rizika:** Demirel 2025 vyšel v *J Neurosci* (44 záznamů, pokles beta v TPJ, žádný frontální signál 40 Hz). Řádek „~2 000 respondentů“ je opraven na N = 455. Tvrzení, že fragmentace spánku „škáluje s frekvencí“, je teoretická obava, ne naměřený vztah dávka–účinek.
> - **ClinicalTrials.gov:** NCT07217340 je dokončená (n = 25, bez výsledků), NCT07408206 nabírá (cíl 70, primárním výstupem je frontální theta).

---

## Jak číst tento report: co bylo ověřeno a co zůstalo nedostupné

Verze 1 vznikla bez přístupu k plným textům, jen z úryvků vyhledávačů a z předchozích znalostí modelu. **Tato verze byla ověřena s funkčním webovým přístupem.** Ověřovaly se tyto zdroje:

- plné texty z PMC/Europe PMC, Frontiers, PLOS ONE, bioRxiv a autorských PDF (Konkoly 2024, ILDIS, NALDIS, Erlacher 2020/2022, MC v2, LaBerge 2018, Peters 2026, Wolk 2024, Demirel 2025, Baird 2018/2019, Dodet 2015, Filevich 2015, Gerhardt & Baird 2024, Aviram & Soffer-Dudek 2018, Yount 2025 a další);
- oficiální dokumentace Apple (App Review Guidelines, AlarmKit, WatchKit, HealthKit, white paper o spánkových fázích) a Android/Google Play (exact alarms, typy foreground service, Health Services, Health Connect, politika Play);
- přímé záznamy z App Store (iTunes Lookup API a stránky obchodů pro US, CZ a DE, včetně seznamů nákupů v aplikaci v USD, CZK a EUR) a z Google Play (přesné počty instalací);
- Reddit r/LucidDreaming přes archivní API arctic-shift (388 příspěvků o aplikacích z let 2023–2026) a fórum LD4all přes Discourse;
- ClinicalTrials.gov API v2, veřejné API databáze léčiv SÚKL a české právní předpisy (zakonyprolidi.cz, MZ ČR).

**Nedostupné zůstalo:**

- **IJoDR** (server Heidelberg vracel chyby DNS a resetoval spojení): Schredl 2025, Raduga 2021, IJoDR 2026 (sluchové podněty k testům reality) a Mallela & Mallett 2024 jsou jen na úrovni úryvků;
- **DreamViews** (Cloudflare) a **Wayback Machine**;
- Springer (Klofat 2024), Wiley (Tan & Fan 2023), SAGE (Schredl & Göritz 2025), ScienceDirect, repozitář Swansea (Carr 2023), lucidity.com;
- Apple Developer Forums (bezpečnostní ověření), AppBrain, AppMagic, Sensor Tower a appfigures (nejsou tedy odhady stažení ani tržeb), stránka JAMA, BusinessWire;
- kniha Tenzina Wangyala (výpůjčka na archive.org s omezeným přístupem).

U App Store platí, že **hodnocení jsou za jednotlivé obchody**; čísla v tabulkách jsou za US, pokud není uvedeno jinak. Google Play přes použitý proxy nezobrazil ceny v CZK/EUR, takže lokální ceny pocházejí jen z App Store.

| Značka | Význam | Jak s tím zacházet v produktu |
|---|---|---|
| **[V]** | Ověřeno v plném textu primárního zdroje, v oficiální dokumentaci nebo přímo v obchodě (říjen 2026) | Lze použít; u citací v aplikaci uvádět zdroj |
| **[A]** | Ověřeno jen z abstraktu, metadat nebo úryvku primárního zdroje | Použitelné, přesná čísla před publikací zkontrolovat |
| **[S]** | Jen sekundární zdroj (tisk, blog, konkurenční výrobce) | Prezentovat jako „podle…“ |
| **[NEOV]** | Neověřeno, komunitní tradice nebo inference | Nepoužívat jako fakt |
| **[PRE]** | Preprint, pilot (n < 30), jediná studie nebo jen korelace | Prezentovat jako předběžné |

Ověřovací logy (soubory 10–13) mají přednost před verzí 1 i před staršími poznámkami. Kde se údaje liší, report přebírá ověřenou hodnotu.

---

## LD je REM s částečně probuzeným „pozorovatelem“: biologické základy

**Analýza jádra.** Lucidní sny vznikají převážně ve **fázi REM** (spánek s rychlými pohyby očí). REM se během noci prodlužuje a zintenzivňuje, takže pravděpodobnost LD vrcholí v poslední třetině noci a v ranním zdřímnutí; na tom stojí logika WBTB. LD se objektivně ověřuje domluveným pohybem očí vlevo–vpravo–vlevo–vpravo (LRLR), zaznamenaným polysomnografií (PSG). Okohybné svaly totiž nepodléhají svalové atonii REM. Takto ověřený sen se označuje **SVLD** (*signal-verified lucid dream*). Poprvé to dokázali Keith Hearne a Alan Worsley v Hullu roku 1975 a nezávisle Stephen LaBerge na Stanfordu v letech 1978–1981 ([UCSC Science Notes](https://sciencenotes.ucsc.edu/0601/dream/index.html)) [A].

Neurálně vypadá LD jako REM s částečným znovuzapojením sítí pro metakognici. Raný nález silného frontálního signálu kolem 40 Hz pocházel od **šesti studentů** ([Voss a kol. 2009, PMC2737577](https://pmc.ncbi.nlm.nih.gov/articles/PMC2737577/)) [V]. Nejnovější data ho nepotvrzují. Multilaboratorní EEG mega-analýza **Demirel a kol. vyšla v roce 2025 v *J Neurosci*** a zahrnuje **26 osob a 44 záznamů z pěti laboratoří**. Rozdíly mezi lucidním a nelucidním REM na úrovni senzorů byly minimální. Na úrovni zdrojů autoři našli **pokles beta aktivity (12–30 Hz) v pravých centrálních a parietálních oblastech včetně temporoparietální junkce (TPJ)** a **vyšší alfa konektivitu**. V okamžiku signalizace očima rostla gama1 aktivita (30–36 Hz) v pravé temporo-okcipitální oblasti včetně precunea. Autoři výslovně uvádějí, že LD **není charakterizován frontální aktivitou kolem 40 Hz**, jakmile se odfiltrují artefakty sakád ([Demirel a kol. 2025, PMC12079745](https://pmc.ncbi.nlm.nih.gov/articles/PMC12079745/)) [V]. Preprint téže studie hlásil jiný gama nález (levá temporální oblast), proto je třeba citovat časopiseckou verzi.

Častí lucidní snílci (14 osob s ≥ 3 LD týdně) mají vyšší klidovou konektivitu mezi přední prefrontální kůrou a úhlovým závitem, ale **strukturální rozdíly mozku se nenašly** ([Baird a kol. 2018, PMC6290891](https://pmc.ncbi.nlm.nih.gov/articles/PMC6290891/)) [V]. Studie Filevich 2015 (69 osob rozdělených mediánem) naopak našla u skupiny s vysokou lucidností více šedé hmoty ve frontopolární kůře (BA9/10). Tatáž oblast se u nich víc aktivovala při monitorování vlastních myšlenek ([Filevich a kol. 2015, PMC6605529](https://pmc.ncbi.nlm.nih.gov/articles/PMC6605529/)) [V]. Strukturální nález tedy není konzistentně replikovaný. Exploratorní multimodální MRI z roku 2026 spojila frekvenci LD se společnou šedo-bílou sítí frontálních, temporálních, parietálních a mozečkových oblastí; běžné vybavování snů souviselo jen s komponentami bílé hmoty ([De Pisapia a kol. 2026, J Sleep Res, PMC13357955](https://pmc.ncbi.nlm.nih.gov/articles/PMC13357955/)) [V, PRE]. Jediná fMRI studie LD měla jednoho analyzovatelného účastníka ([Dresler 2012, PMC3369221](https://pmc.ncbi.nlm.nih.gov/articles/PMC3369221/)) [A].

Druhým biologickým pilířem je **cholinergní systém**, protože REM je cholinergně řízený stav. Galantamin, inhibitor acetylcholinesterázy, podaný při WBTB spolu s MILD zvýšil podíl účastníků s LD v dané noci v závislosti na dávce: placebo 14 %, 4 mg 27 %, 8 mg 42 % (n = 121; OR 2,29 a 4,46) ([LaBerge, LaMarca & Baird 2018, PLOS ONE](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246)) [V]. Třetím pilířem je **blízkost bdění a REM**. Fyziologicky ověřené přechody z bdění do REM a polyfázický spánek souvisely s LD, subjektivní kvalita spánku a fyziologicky ověřený počet probuzení nikoli ([Gott a kol. 2020, PubMed 32768920](https://pubmed.ncbi.nlm.nih.gov/32768920/)) [A]. U narkolepsie, kdy člověk vstupuje do REM přímo z bdění, mělo LD **77,4 % pacientů oproti 49,1 % kontrol**, s průměrem 7,6 vs. 0,3 LD měsíčně. V laboratorních zdřímnutích dosáhlo lucidního REM 7 z 12 narkoleptiků a žádný z kontrol ([Dodet a kol. 2015, PMC4335518](https://pmc.ncbi.nlm.nih.gov/articles/PMC4335518/)) [V].

**Rozšíření perspektivy.** Skrytý předpoklad, který většina aplikací ignoruje, je, že **„čas v noci“ je hlavní nezávislá proměnná**. Pokusy o luciditu na začátku noci jsou fyziologicky slabé. Neurální obraz zároveň vyvrací marketing „gama vlny nebo binaurální rytmy = lucidita“. Frontální 40 Hz signál zmizel po očištění od artefaktů a stabilnějším nálezem je pokles beta v TPJ, který autoři interpretují jako přehodnocení reality vjemu. LD je metakognitivní stav, nikoli frekvence, kterou lze „naladit“. Spontánní LD jsou časté u dětí a kolem 16 let prudce klesají ([Voss a kol. 2012, PubMed 22639960](https://pubmed.ncbi.nlm.nih.gov/22639960/)) [A]. U dospělých ve věku 25–66 let ale věk s frekvencí LD nesouvisel; souvisel jen s horším vybavováním snů ([Baird a kol. 2019, PMC6490164](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164/)) [V]. Věk tedy není pro dospělého uživatele důvodem k nižším očekáváním.

**Strategický návrh.** Aplikace má plánovat všechny noční intervence (WBTB, MILD, podněty) do druhé poloviny noci. Výchozí čas WBTB má odvozovat od skutečného usnutí uživatele, nikoli od nastavené večerky. Komunikace má rámovat LD jako **trénink metakognice a prospektivní paměti**, ne jako „hacknutí mozkových vln“.

**Limitace.** Neurozobrazovací studie mají jednotky až desítky účastníků a jsou průřezové. Žádná velká studie neověřila, že hustota REM sama predikuje nástup LD.

---

## Metody se posunuly od jednotlivých triků ke kombinovaným protokolům

**Analýza jádra.** Vývoj lze shrnout ve třech vlnách.

- **80. léta:** základní kognitivní techniky, tedy Tholeyho reflexní technika a autosugesce, LaBergeův MILD, testy reality (RT) a WBTB.
- **90. léta:** světelné masky (DreamLight, NovaDreamer).
- **2000–2015:** komunitní techniky z internetových fór. Patří sem SSILD (autor s přezdívkou CosmicIron), FILD (*Finger-Induced LD*, jemné pohyby prsty při usínání), DEILD (*Dream-Exit-Induced LD*, nehybný návrat do snu po probuzení) a CAT (*Cycle Adjustment Technique* Daniela Lovea, 2013).

Systematický přehled Stumbrys a kol. 2012 shrnul 35 studií (24 terénních a 11 laboratorních). **Žádná technika podle něj nenavozuje LD „spolehlivě, konzistentně a s vysokou úspěšností“** a 60 % studií mělo špatnou metodologii ([Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full); [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V].

Třetí vlna po roce 2015 přinesla **vícesložkové protokoly a přesun z laboratoře domů**:

- **NALDIS 2017** (Aspy a kol.) ukázal, že významně se zlepšila jen trojkombinace RT + WBTB + MILD: z 9,4 % na 17,4 % nocí (n = 47, p = 0,003). RT + WBTB šlo z 6,9 % na 10,7 % (n.s.), samotné RT z 8,1 % na 7,6 % ([Aspy a kol. 2017, autorský rukopis](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf); [DOI](https://doi.org/10.1037/drm0000059)) [V]. Post-hoc se ale významně lišilo jen samotné RT od trojkombinace (p = 0,035); RT + WBTB vs. trojkombinace bylo nevýznamné (p = 0,492). Studii dokončilo 169 z 420 lidí, kteří vyplnili vstupní dotazník.
- **ILDIS 2020** (N = 355) zjistil, že **SSILD je stejně účinný jako MILD**: vážený průměr skupin MILD byl 16,5 % a SSILD 16,9 % ve 2. týdnu. Hybrid SSILD/MILD vyšel nejhůř (13,3 %, n.s.) ([Aspy 2020, ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V].
- **Erlacher a kol. 2022** testovali jen probuzení po 4,5 h a s dřívější vlastní studií za 6 h výsledky pouze porovnali. „Dřívější přerušení spánku podle všeho snižuje úspěšnost“, ale autoři sami vyzývají k přímému srovnání ve vnitrosubjektovém designu ([PMC9149976](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/)) [V]. Jde tedy o naznačení, ne o důkaz.
- **Tan & Fan 2023** (19 studií, 14 technik) označili **MILD za nejúčinnější techniku**; SSILD a galantamin za „konkurenceschopné kandidáty“, kteří potřebují replikaci ([DOI 10.1111/jsr.13786](https://doi.org/10.1111/jsr.13786)) [A]. Údaj „6 podpůrných studií“ z verze 1 se v abstraktu nenachází.
- **TLR** je nejnovějším směrem. Carr a kol. (preprint 2020, časopisecky **2023** v *Psychology of Consciousness* 10(4):413–430) dosáhli v laboratorním zdřímnutí **50 % SVLD vs. 17 %** v kontrolní skupině, s 20minutovým předspánkovým tréninkem ([citováno v Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/); [reference v Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)) [V přes citující plné texty]. Vzorek měl časté noční můry a LD trvaly v průměru 1,9 min.

Paralelně běží **série nulových výsledků jednotlivých technik**:

- **WBTB samotné** vyšlo doma na 4,3 % (6 ze 138), tedy na úrovni spontánního výskytu ([Klofat a kol. 2024, Crossref abstrakt](https://api.crossref.org/works/10.1007/s11818-024-00453-8)) [A]. Šlo ale o jedinou WBTB noc (probuzení po 5 h, 30 min bdění), záměrně bez jakékoli zmínky o LD a s textem k paměťové úloze. Studie tedy testovala WBTB bez lucidního záměru, ne WBTB tak, jak se praktikuje. Všech 8 úspěšných už mělo zkušenosti s LD. WBTB zvýšilo vybavování snů a zhoršilo opětovné usínání.
- **RT samotné i autosugesce samotná** nebyly za 4 týdny významné (N = 81). Počáteční výhoda RT zmizela po kontrole výchozí frekvence LD ([Schredl 2025, IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/110523)) [A, úryvek].

Preregistrované laboratorní studie odhalují menší efekty technologie než rané piloty. Multicentrická studie (MC), ve verzi v2 přejmenovaná na „Inducing lucid dreaming with multisensory stimulation: a preregistered multi-center study“ a s prvním autorem Picard-Deland, vyšla 21. 8. 2026 a stále je preprintem. SVLD se v ní vyskytl ve **40 ze 120 zdřímnutí (33,3 %)**: **23/60 se skutečnými podněty (38,3 %) vs. 17/60 s falešnými (28,3 %), p = 0,219**. Aspoň jeden SVLD mělo 31 ze 60 účastníků. Trvání LD bylo pod podněty delší **jen v jedné ze tří měr** (od prvního do posledního LRLR 6,08 vs. 3,24 min, p = 0,027); ostatní dvě míry se nelišily. Podněty zároveň **zkrátily REM (12,7 vs. 16,2 min) a snížily efektivitu spánku (53,4 vs. 57,6 %)**. Subjektivně lucidních zdřímnutí bylo dokonce víc ve falešné podmínce (55 % vs. 50 %) ([MC v2, bioRxiv](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full)) [V, PRE].

Preprint Peters a kol. 2026 (3 studie, N = 101) dosáhl 45,4 % externě hodnocených lucidních snů bez rozdílu mezi podmínkami. VR nácvik, haptika ani VR „glitche“ nic nepřidaly. Tvrzení „stačí instrukce“ je ale přehnané: aktivní kontrola s instrukcemi a předspánkovým audiem měla **nejnižší podíl SVLD (11,1 %)**, zatímco nejlepší podmínka měla 32,1 %. Studie 3 navíc opakovaně budila z REM, zatímco studie 1–2 jen jednou na konci, takže design je zkreslený ([Peters a kol. 2026 v2](https://www.biorxiv.org/content/10.64898/2026.03.11.711049v2.full)) [V, PRE]. Podstatný je kontext: laboratorní obsah se objevil ve 47,9 % snů, falešná probuzení ve 23,1 % a 17 ze 121 snů se stalo lucidními právě po falešném probuzení v laboratoři.

**Nové studie 2025–2026** většinou potvrzují, že hlavní práci dělá trénink:

- **Domácí MILD + TLR přes aplikaci Oniri (60 účastníků, 3 týdny) vyšlo nulově.** Autorka zdůrazňuje „logistické potíže přenosu laboratorního paradigmatu TLR domů“. Analýza 3 423 snů od 372 uživatelů ukázala, že LD nesou pozitivnější, „kognitivně řízené“ emoce ([Genc 2025, magisterská práce UNIGE](https://archive-ouverte.unige.ch/unige:190406)) [A].
- **VR a meditace otevřeného monitorování** v pětitýdenním domácím programu (n = 38 nezkušených): 26 vs. 11 vs. 4 „lucid-like“ snů (RR 4,00; 95% CI 1,97–8,09); aspoň jeden takový sen mělo 84,6 % vs. 61,5 % vs. 33,3 % účastníků. Samotná VR nestačila a polo-lucidní sny se počítaly jako lucidní ([Signorelli a kol. 2026, Front Psychol](https://doi.org/10.3389/fpsyg.2026.1924370)) [A, PRE].
- **Tělesná stimulace v REM** (n = 28, po dvoutýdenním kognitivním tréninku): elektrická svalová stimulace (EMS) bez efektu, galvanická vestibulární stimulace (GVS) s vyšší externě hodnocenou luciditou. Autoři sami připouštějí roli tréninku, očekávání a výchozí frekvence ([Peters a kol. 2026, Sleep Advances](https://doi.org/10.1093/sleepadvances/zpag074)) [A, PRE].
- **Nový měřicí nástroj:** Lucid Dream Control Questionnaire (36 položek, 7 domén) ([Peters, Erlacher & Bonamino 2026, PsyArXiv](https://doi.org/10.31234/osf.io/p7su6_v1)) [A].

| Rok | Milník | Význam pro aplikaci |
|---|---|---|
| 1975–1981 | Hearne/Worsley a LaBerge: LRLR signál z REM | Objektivní verifikace |
| 1980–1990 | MILD (LaBerge), reflexní technika a autosugesce (Tholey), WBTB | Jádro dodnes |
| 2012 | Stumbrys: žádná technika není spolehlivá | Realistická očekávání |
| 2014 → 2020 | 40 Hz tACS (Voss, n = 27) → falešná stimulace (sham) vyvolala LD stejně (Blanchette-Carrière) | Varování před neuro-hypem |
| 2017 | NALDIS: RT + WBTB + MILD 9,4 → 17,4 % nocí | Kombinace, ne jednotlivé techniky |
| 2018 | Galantamin 14/27/42 % | Cholinergní mechanismus; lék na předpis |
| 2020 | ILDIS: SSILD ≈ MILD; usnutí ≤ 10 min | Dvě rovnocenné hlavní techniky |
| 2020/2023 | Carr: TLR v laboratorním zdřímnutí 50 % vs. 17 % | Počátek TLR |
| 2021 | Konkoly: obousměrná komunikace se snícími (18,4 % správných odpovědí) | „Interaktivní snění“ |
| 2022 | Erlacher: 4,5 h horší než dřívější 6 h (mezistudiové srovnání) | Parametry WBTB |
| 2024 | Konkoly: TLR v telefonu doma; 0,74 → 2,11 LD/týden bez kontroly, kontrolovaný efekt jen 2. noc | Jediný publikovaný protokol aplikace |
| 2024–2025 | Nulové výsledky samotného WBTB, RT a autosugesce | Jednotlivé techniky nestačí |
| 2025–2026 | Genc (Oniri TLR) nulový; MC v2: podněty ≈ falešné podněty; Peters: kontext dělá většinu | Kognitivní trénink je hlavní aktivní složka |
| 2026 | Jóga snů v PSG laboratořích; NCT07217340 dokončena, NCT07408206 nabírá | Kontemplativní stopa se vědecky otevírá |

**Rozšíření perspektivy.** Data skrývají tři předpoklady:

1. **Vzorky jsou motivovaní dobrovolníci a odpad je obrovský.** ILDIS začalo 1 618 lidí, první týden dokončilo 843 a druhý 355, tedy 42 % z těch, kdo prošli prvním týdnem, a 22 % registrovaných ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V]. Galantaminová studie probíhala na osmidenním workshopu Lucidity Institute na Havaji a 94 účastníků mělo navíc masku s paměťovými podněty ([LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246)) [V]. Čísla tedy platí pro ty, kdo vydrží a jsou silně zaujatí.
2. **Laboratorní čísla 40–50 % nejsou přenositelná domů.** Laboratoř nabízí probuzení přesně z REM, explicitní instrukce, dlouhé zdřímnutí bohaté na REM a silné efekty očekávání. Peters 2026 ukazuje, že tento kontext sám produkuje vysoká čísla.
3. **Kvantitativní metaanalýza účinnosti indukce neexistuje**, ani velká (N > 100) preregistrovaná domácí RCT z let 2025–2026. Žádná technika nemá „silné“ důkazy ve smyslu několika velkých preregistrovaných RCT.

**Strategický návrh.** Jádrem aplikace má být **MILD nebo SSILD po WBTB kolem 5. hodiny spánku s důrazem na usnutí do 10 minut**. Deník a záměr jsou podpůrné návyky a RT volitelný doplněk (viz Protokol 6). TLR je zesilovač s nereplikovaným domácím efektem, ne hlavní mechanismus.

**Limitace.** Realistická hodnota pro motivovaného dobrovolníka v nejlepší terénní podmínce je zhruba 1 noc z 5–6 praktikovaných. Doba do prvního LD u úplných začátečníků doma není spolehlivě změřena.

---
## Tabulka věrohodnosti: co funguje, co je slibné a co je mýtus

Stupnice: **E** = podloženo kontrolovanými daty; **E-** = slabé nebo jen jako součást kombinace; **P+** = předběžná kontrolovaná data (piloty, preprinty); **P** = věrohodný mechanismus, netestováno nebo jen korelace; **A** = jen anekdoty; **C** = vyvráceno nebo založeno na nepravdivé premise. Sloupec „Ověření“ odkazuje na značky z úvodu.

| Technika / přístup | Původ | Klíčová čísla | Hodnocení | Ověření |
|---|---|---|---|---|
| **MILD + WBTB (doma)** | LaBerge 1980 | NALDIS 9,4 → 17,4 % nocí (n = 47) ([Aspy 2017](https://doi.org/10.1037/drm0000059)); ILDIS skupiny MILD 16,5 % ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)); nejúčinnější v přehledu Tan & Fan | **E (střední)**, nejlépe podložená technika | [V] |
| **MILD + WBTB (laboratoř)** | Erlacher & Stumbrys 2020 | 60 min bdění: 53–54 % hlášených, **27 % ověřených signálem**; 30 min: 36 % / 14 %; kontroly 9 % / 0 % ([Frontiers](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full)) | **E-** (n = 11–15 na skupinu) | [V] |
| **SSILD (+ WBTB)** | CosmicIron, 2010s | ILDIS n = 76: 4,7 → 16,9 % (r = 0,51); MC v2: 31/60 účastníků ≥ 1 SVLD v laboratoři | **E- / P+** (1 terénní studie + 1 laboratorní preprint) | [V] |
| **Hybrid SSILD/MILD** | ILDIS | 13,3 %, nejnižší ze všech skupin (n.s.) | **E-**, nepřidává nic | [V] |
| **WBTB samotné** | LaBerge 80.–90. léta | 4,3 % (6/138) bez lucidního záměru ([Klofat 2024](https://api.crossref.org/works/10.1007/s11818-024-00453-8)) | **C jako samostatná metoda**, nezbytná složka kombinace | [A] |
| **WBTB + nácvik prvků snu (doma)** | Schredl, Dyck & Kühnel 2020 | Budík po ~6 h jednou týdně; 18 % vs. 6 % nocí; N = 50; 5 z 10 nováčků ≥ 1 LD za 5 týdnů ([HeiBib](https://heibib.ub.uni-heidelberg.de/search/Record/1879821842); [PsyPost](https://www.psypost.org/more-evidence-the-wake-up-back-to-bed-technique-can-help-to-induce-lucid-dreams/)) | **E-** | [A/S] |
| **Načasování WBTB** | Erlacher 2020/2022 | 4,5 h: 26 %/0 %/20 % (čistá podmínka MILD jen v exp. 1) vs. 6 h: 53 % v dřívější studii; mezistudiové srovnání | **E-** (naznačení) | [V] |
| **Usnutí do 10 min po technice** | ILDIS | 18,3 % vs. 11,1 % (p = 0,037); hranice ≤ 5 min nereplikována (17,5 % vs. 13,8 %, p = 0,286) | **E-** (prediktor, ne technika) | [V] |
| **Testy reality samotné** | Tholey 1983, LaBerge 1990 | NALDIS 8,1 → 7,6 %; Schredl 2025 n.s.; počet RT/den nekoreloval s LD (ILDIS) | **C/E- samostatně** | [V/A] |
| **RT přidané k MILD** | ILDIS | MILD + RT 12,1 % vs. MILD bez RT 19,4 % (p = 0,052); účastníci RT označovali za zátěž | **E-, možná kontraproduktivní** | [V] |
| **Autosugesce / afirmace** | Tholey, lidová tradice | Schredl 2025 n.s.; WBTB + afirmace neúčinné (Dyck 2017, citováno v [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) | **C** | [A] |
| **Tholeyho reflexní technika** | Tholey 1983 | Malé efekty, nízká kvalita | **E-** | [NEOV] |
| **Snový deník, znaky snů** | LaBerge 1985 | V LD nocích 2,8 vs. 1,7 vybavených snů/den (ILDIS); TLR efekt jen u lidí s vybavováním ≥ 2 nocí (Konkoly) | **E- nepřímo** (prerekvizita) | [V] |
| **TLR v laboratoři** | Carr 2020/2023 | 50 % vs. 17 % SVLD | **P+** | [V přes citující texty] |
| **TLR doma (telefon)** | Konkoly 2024 | Exp. 1 (n = 19, bez kontroly) 0,74 → 2,11 LD/týden; exp. 2: efekt jen 2. noc (OR 3,61), v celém vzorku n.s. (p > 0,3) ([PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)); autor studie: ~10–15 % šance na LD za noc ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1gaoayw/initial_results_from_the_northwesternmit_lucid/)); Genc 2025 (Oniri) nulový | **P (doma nereplikováno)** | [V] |
| **SSILD + multisenzorické podněty v REM** | MC v2 2026 | 38,3 % vs. falešné 28,3 % zdřímnutí se SVLD, n.s.; méně REM | **P+ [PRE]**; podnět ≈ falešný podnět | [V] |
| **Instrukce + priming laboratorního kontextu** | Peters 2026 | 45,4 % externě lucidních; SVLD 11–32 % podle podmínky; design zkreslený | **P+ [PRE]** | [V] |
| **Sluchové RT podněty bez tréninku (laboratoř)** | IJoDR 2026 | Podle verze 1 jen 1 z 15 se striktně ověřeným LD; server nedostupný | **C/E-** | [NEOV v této verzi] |
| **WILD / hypnagogické techniky** | LaBerge 1985; Tholey | Mechanismus (narkolepsie, přechody bdění → REM); žádné RCT | **A + mechanismus** | [V pro mechanismus] |
| **FILD, DEILD, CAT** | Fóra; Love 2013 | Žádná data | **A** | [NEOV] |
| **Raduga: „nepřímé techniky“ po probuzení** | REMspace | 449 převážně začátečníků, 2 noci, „484 úspěšných pokusů“; afilované, bez kontroly | **E-** | [A, úryvek] |
| **Posthypnotická sugesce** | Dane & Van de Castle 1984 | 15 párů vysoce hypnabilních žen bez předchozího LD; všechny podmínky kromě původních instrukcí v bdění významné; hypnóza nebyla lepší než revidované instrukce (7/7, resp. 6/7 úspěšných) ([Lucidity Letter](https://journals.macewan.ca/lucidity/article/download/444/346)) | **E- / P** | [V] |
| **Dlouhodobá meditace** | Buddhismus, sekulární | 38 meditujících 1,11 vs. 140 kontrol 0,45 LD/měs.; 9týdenní MBSR bez efektu ([Baird 2019](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164/)); otevřené monitorování r = 0,16 ([Gerhardt & Baird 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11120098/)); přehled 2025 „neprůkazné“ | **P (slabá korelace)** | [V] |
| **VR + meditace otevřeného monitorování** | Signorelli 2026 | RR 4,00 proti kontrole; n ≈ 13 na skupinu; počítány i polo-lucidní sny | **P+ [PRE]** | [A] |
| **VR trénink samotný** | Gott 2021 | Více LD než bez tréninku ([DOI](https://doi.org/10.1098/rstb.2019.0697)); Peters 2026: ne lépe než aktivní kontrola | **P+ smíšené** | [A] |
| **Kontemplativní obsah jako TLR asociace** | Paller lab 2024/2026 | Dýchání: 2/5 SVLD ([Wolk 2024](https://faculty.wcas.northwestern.edu/~paller/IJDR2024.pdf)); Čenrezig: 2/5 hlášených LD, **0 ověřených** ([Morris 2026](https://pmc.ncbi.nlm.nih.gov/articles/PMC13023924/)) | **P+ [PRE]** | [V] |
| **Světelné masky s detekcí REM** | LaBerge 80.–90. léta | Malé staré studie; „není dost důkazů“ ([Sleep Foundation](https://www.sleepfoundation.org/dreams/lucid-dream-mask)) | **E- / P** | [S] |
| **Galantamin 4–8 mg + MILD + WBTB** | LaBerge 2018 | 14/27/42 % účastníků; mírné vedlejší účinky 12 % vs. 3 %; 4 z 10 nikdy předtím lucidních uspěli na 8 mg | **E (1 velké RCT, workshop)**, v ČR na předpis | [V] |
| **Donepezil** | LaBerge 2004 | 8/10 vs. 1/10 na placebu, ale **jen patent** ([Oldoni a kol. 2024](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11119155/)) | **E- (patent, ne studie)** | [V] |
| **Vitamin B6 240 mg** | Aspy 2018 | Víc vybaveného obsahu, ne živost; replikace Ebben 2002, která nepotvrdila efekt na živost ([PubMed 29665762](https://europepmc.org/abstract/MED/29665762)) | **E- pro vybavování, žádné pro LD** | [A] |
| **α-GPC** | Kern a kol. 2017 | „No effect… on lucid dream induction“ ([Springer](https://link.springer.com/article/10.1007/s11818-017-0122-8)) | **C** | [A] |
| **Calea zacatechichi** | Mezoamerická tradice | Žádná LD studie; in vitro neurogliální toxicita ([Garcia a kol. 2025](https://europepmc.org/abstract/MED/39389391)) | **A + riziko** | [A] |
| **Silene capensis, pelyňkový polštář** | Xhosa, Evropa | Žádné kontrolované studie ([Oldoni 2024](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11119155/)) | **A** | [V] |
| **40 Hz tACS** | Voss 2014 | „77 %“ je tiskový údaj za jednotlivé stimulace a sebehodnocení, ne SVLD; Blanchette-Carrière 2020: SVLD vyvolala i falešná stimulace ([Europe PMC](https://europepmc.org/abstract/MED/32534325)) | **C** | [A] |
| **tDCS DLPFC** | Stumbrys 2013 | Slabý efekt jen u častých lucidních snílků ([ScienceDirect](https://www.sciencedirect.com/science/article/abs/pii/S1053810013001098)) | **E- / P** | [A] |
| **GVS v REM** | Peters 2026 | Vyšší externě hodnocená lucidita, n = 28 | **P+ [PRE]**, aplikací neproveditelné | [A] |
| **Fokusovaný ultrazvuk (Prophetic)** | 2023–2026 | Jen firemní graf sebehodnocení bez n, bez zaslepení | **Bez dat** | [V jako absence] |
| **Binaurální a izochronní „LD audio“** | Monroe, YouTube | Metaanalýza g = 0,45 pro paměť, pozornost a úzkost, žádný LD výstup ([PubMed 30073406](https://pubmed.ncbi.nlm.nih.gov/30073406/)) | **A** (relaxace, rituál) | [A] |
| **„LD hudba“, 432 Hz, subliminály, krystaly** | Internet, New Age | Žádné studie; pravé ≈ falešné krystaly ([Time](https://time.com/4969680/do-crystals-work/)) | **A / C** | [S] |
| **Šišinka / DMT / „třetí oko“** | Strassman → internet | Nepodložená hypotéza ([OPEN Foundation](https://open-foundation.org/the-science-and-folklore-of-dmt/)) | **C (premisa)** | [S] |
| **Castanedovo „podívej se na ruce“** | Castaneda 1972/1993 | Původ pravděpodobně fiktivní; technika = RT/záměr | **Původ C; technika P** | [S] |
| **Senoi „teorie snů“** | Kilton Stewart | Senoiové ji nepraktikují ([Domhoff](https://dreams.ucsc.edu/Articles/senoi.html)) | **Původ C** | [A] |
| **Jóga nidra / NSDR** | Satyananda | O spánku slabá data, o LD žádná | **P** (WILD + záměr) | [NEOV] |
| **Prvky tibetské jógy snů** | Nárópa, bön, dzogčhen | Viz samostatná sekce | **P až P+** | [V/S] |
| **Stabilizace (tření dlaní, točení)** | LaBerge, NALDIS | Instrukce NALDIS: třít dlaně a opakovat „toto je lucidní sen“; srovnávací data jen anekdotická | **A** | [V pro instrukci] |

**Rozšíření perspektivy.** Placebo s aktivními ingrediencemi je silné, samo o sobě slabé. „Aktivní placebo“ v galantaminové studii (WBTB po ~4,5 h, 30 min mimo postel, MILD a víra, že člověk možná dostal „doplněk“) dosáhlo 14 %, zhruba trojnásobek očekávaného výchozího stavu 4 % na noc ([LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246)) [V]. Doplněk, kterému lidé věřili (α-GPC), bez kognitivní techniky nezvedl nic. Falešná stimulace v tACS studii vyvolala SVLD stejně jako skutečná. Očekávání a kontext tedy působí **skrze** skutečné ingredience (motivace, pozornost ke snům, opakování záměru, probuzení), ne samostatně. Experimentální manipulace očekávání u LD dosud chybí, a to je mezera, kterou může aplikace vyplnit vlastními A/B testy.

---

## Protokoly krok za krokem: co je ověřené a co ne

U každého kroku je značka ověření. Výchozí hodnoty pro aplikaci jsou označené „→ aplikace“. Protokoly 1–5 lze nyní implementovat přímo z primárních textů.

### Protokol 0: Vybavování snů (fáze 1, týdny 1–3)

1. **Večer:** krátký záměr „Zapamatuji si své sny“. Postoj ke snům a zájem o ně predikují vybavování ([BPS Digest](https://bps.org.uk/research-digest/what-makes-us-more-likely-remember-dreams); [Schredl a kol. 2003](https://onlinelibrary.wiley.com/doi/10.1046/j.1365-2869.2003.00344.x)) [S/A]. Konkrétní znění záměru je expertní praxe [NEOV].
2. **Při probuzení:** nehýbat se, nechat oči zavřené, přehrát si sen a nejdřív uložit klíčová slova. Model aktivace a vybavení (*arousal-retrieval*) předpovídá, že rušení hned po probuzení vybavování snižuje ([Koulack & Goodenough 1976, doi:10.1037/0033-2909.83.5.975](https://doi.org/10.1037/0033-2909.83.5.975)) [NEOV v této verzi].
3. **Zápis:** hlasem nebo textem, s možností vrátit se k detailům později. → aplikace: umožnit i záznam „nevybavil(a) jsem si nic“, který se nepočítá jako sen. Jde o konkrétní komunitní požadavek ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzyj6p4/)) a zároveň nutnou hodnotu pro analytiku.
4. **Kdy čekat zlepšení:** deník zvyšuje zaznamenané vybavování hlavně u lidí se slabým a středním vybavováním. Část efektu tvoří motivace ([Consc Cogn 2012](https://www.sciencedirect.com/science/article/abs/pii/S1053810012001973)) [A]. Ve 2. týdnu deníku vybavování typicky klesá ([Schredl & Fulda 2005](https://www.researchgate.net/publication/282737690_Reliability_and_stability_of_dream_recall_frequency)) [A].
5. **Prediktory vybavování (N = 217):** postoj ke snům, sklon k toulání myslí, delší lehký spánek, nižší věk, jaro oproti zimě ([AlphaGalileo/IMT Lucca](https://www.alphagalileo.org/en-gb/Item-Display/ItemId/257739)) [S].
6. **Proč na tom záleží:** v ILDIS měli lidé v LD nocích 2,8 vybavených snů denně oproti 1,7 v ostatních nocích (p < 0,001). U Konkolyho se efekt TLR ukázal jen u lidí, kteří si sny vybavili aspoň ve 2 nocích ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/); [Konkoly 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)) [V].

### Protokol 1: WBTB „obal“ pro domácí praxi (ILDIS/NALDIS) [V]

1. **Příprava:** návod mít vytištěný u postele, před začátkem se s ním „celou hodinu“ seznámit, techniku jednou vyzkoušet ve dne a návod si přečíst každý večer před spaním ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/); [NALDIS](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf)) [V].
2. **Budík 5 h po ulehnutí** a umístit ho tak, aby se k vypnutí muselo vstát. NALDIS navíc rozsvítit a posadit se. Laboratorní varianta: po ≥ 5 h 40 min, buzení z REM po 10–15 min nepřerušeného REM, tedy zhruba v 6 h ([Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full)) [V].
3. **Úprava podle bdělosti (ILDIS):** kdo po technice usíná příliš rychle, rozsvítí na pár minut a přečte si návod znovu. Kdo usíná špatně, nechá zhasnuto, dá budík k posteli a použije tišší tón [V].
4. **Délka bdění:** ILDIS ji nestanovil; samotná technika trvala průměrně 8,7 min. Delší technika nepredikovala LD a ve skupině SSILD s ním mírně negativně korelovala (rs = −0,16). Vstávání z postele (70 % případů) ani rozsvícení s LD nesouviselo [V]. V laboratoři a pod dohledem vychází lépe 30–60 min bdění. LaBerge zvolil 30 min, protože delší bdění už podle něj „nepřináší další nárůst“ ([LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246)); Erlacher & Stumbrys našli 60 > 30 min. Citovaná práce NightLight 1994 uvádí jako nejúčinnější 30–120 min a 10 min jako méně účinné ([Erlacher & Stumbrys 2020](https://www.frontiersin.org/journals/psychology/articles/10.3389/fpsyg.2020.01383/full)) [V]. → aplikace: doma výchozí **10–30 min** s cílem usnout do 10 min po technice; volitelná „intenzivní noc“ 30–60 min. Optimální délka bdění doma nemá RCT [NEOV].
5. **Nepraktikovat ve spánkovém deficitu**; vynechané dny dohnat na konci [V].
6. **Frekvence:** Schredl 2020 používal WBTB jednou týdně [A]. → aplikace: 1–3 noci týdně, nikdy víc než jedno plánované probuzení za noc.
7. **WBTB bez kognitivní techniky nenabízet** [A].
8. **List „co dělat, když jsem lucidní“ (NALDIS, ~700 slov):** zůstat klidný, aby se člověk neprobudil; udělat RT; stabilizovat sen třením dlaní se soustředěním na vjem a opakováním „toto je lucidní sen“ [V]. Přiložit informace o spánkové paralýze [V].

### Protokol 2: MILD (znění ILDIS + doplňky LaBerge 2018) [V]

1. Po budíku si **vybavit sen**, který právě skončil (nebo „jakýkoli jiný nedávný sen“) ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)).
2. Pohodlně si lehnout.
3. **V duchu opakovat:** „Až budu příště snít, uvědomím si, že sním“ (*next time I'm dreaming, I will remember I'm dreaming*). LaBergeova varianta zní „Až budu příště snít, chci si vzpomenout, abych rozpoznal(a), že sním“ (*The next time I'm dreaming I want to remember to recognize that I'm dreaming*) ([LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246)). Důraz je na „silný záměr“ a „vkládání významu do slov“, nejde o mantru.
4. **Současně vizualizovat** návrat do vybaveného snu a „všimnutí si něčeho neobvyklého, co způsobí uvědomění, že sním“.
5. **Přidat předem zvolenou akci**, kterou člověk provede, až bude lucidní (LaBerge 2018). → aplikace: tato akce zároveň slouží jako validace lucidity při ranním check-inu.
6. Pokračovat, „dokud záměr nesedí“ (ILDIS) nebo „dokud neusnete nebo záměr nesedí“ (NALDIS). Když mysl odbíhá, začít znovu, aby **posledním vědomým obsahem byl záměr** (NALDIS).
7. **Délka:** LaBerge doporučuje minimálně 10 min MILD. Účastníci, kteří praktikovali ≥ 10 min, měli LD častěji (β = 0,09), celková délka ale úspěch nepredikovala [V].
8. **Počet opakování nevnucovat:** v ILDIS 13,6 ± 11,6 opakování bez korelace s úspěchem, v NALDIS 17,4 ± 16,1 se slabě negativní korelací (−0,12) [V].
9. **Rychle usnout:** usnutí ≤ 10 min predikovalo úspěch. 70,7 % účastníků usnulo už během techniky, což s úspěchem nesouviselo [V].
10. **Opraveno:** údaj „45,8 % při usnutí do 5 min“ pochází z 24 pokusů 14 lidí s nadprůměrnou výchozí frekvencí LD (20,4 %); sami autoři upozorňují na omezenou zobecnitelnost a ILDIS ho nereplikoval. Blogové „54 %“ nepoužívat vůbec ([NALDIS](https://public.3.basecamp.com/p/jzF4oo49qWDt5Wysw3wR7k84/attachments/fd206c86-7af2-11ee-847b-1ab7a0b123c9/download/reality-testing-mnemonic-induction-lucid-dreams.pdf); [oneironauts.io](https://oneironauts.io/blog/mild-technique-complete-guide)).
11. **Neověřeno:** doslovné listy s instrukcemi ILDIS. Metodika je jen parafrázuje [NEOV].

### Protokol 3: SSILD doma (ILDIS skupina 5, navržená „po konzultaci s autorem“) [V]

1. Po WBTB (~5 h) ulehnout v pohodlné poloze se zavřenýma očima a s pasivním, nesnaživým postojem. Rámec pro uživatele: „podmiňování mysli a těla do jemného stavu optimalizovaného pro lucidní sny“ ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)).
2. **Jeden cyklus = zrak → sluch → tělo.** Znění ILDIS (přeloženo):
   - **Zrak:** „Zavřete oči a soustřeďte veškerou pozornost na tmu za víčky. Oči nechte zcela klidné a uvolněné. Můžete vidět barevné tečky, složité vzory, obrazy, nebo vůbec nic… nesnažte se nic vidět.“
   - **Sluch:** „Přesuňte veškerou pozornost do uší… slabé zvuky dopravy nebo větru… vlastní tlukot srdce nebo slabé zvonění v uších…“
   - **Tělo:** „Vnímejte tíhu přikrývky, tlukot srdce, teplotu vzduchu… mravenčení, tíhu, lehkost, pocity točení… prostě se uvolněte, pozorujte je pasivně a snažte se nevzrušovat.“
3. **Dávka:** nejprve **4 rychlé cykly** (2–3 s na každý smysl, celkem ~30 s), pak **4–6 pomalých cyklů** (~20 s na smysl, celkem ~4–6 min). **Nepočítat sekundy.** Dokončit „aspoň čtyři pomalé cykly“ a „po šesti pomalých cyklech usnout normálně“. Text ILDIS je zde vnitřně nekonzistentní (4–6 vs. „po šesti“); → aplikace: 6 pomalých cyklů s možností skončit po 4.
4. **Pozorovaná praxe:** 4,0 ± 2,2 rychlého a 5,1 ± 4,1 pomalého cyklu. Delší celková technika mírně negativně korelovala s LD (rs = −0,16). Celé sezení má proto trvat jen ~5–7 min [V].
5. Potom techniku pustit a normálně usnout; případná falešná probuzení otestovat RT.
6. **Hybrid (skupina 6) nedoporučovat:** jen pomalé cykly s frází MILD při každém přepnutí smyslu, bez vybavení snu. Vyšel nejhůř [V].
7. **Implementace:** jemné zvukové předěly mezi smysly místo odpočítávání. Komunitní recept „4–6 rychlých + 3–4 pomalé po 30 s“ ([Gateway to LD](https://www.gateway-to-lucid-dreaming.com/ssild.html)) žádný primární zdroj nepoužívá.

### Protokol 4: SSILD + podněty, laboratorní skript MC v2 (~30 min) [V, PRE]

Slouží jako předloha pro „řízené audio“ a pro asociační trénink TLR ([MC v2 Methods](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full)).

1. **Blok 1 – úvod:** definice LD, texty tří cvičení téměř doslova podle ILDIS a poznámka o rušivých myšlenkách: „Nevadí, když rušivé myšlenky přijdou… důležité je, že je můžete záměrně pustit.“
2. **Blok 2 – SSILD bez podnětů:** 4 rychlé cykly během **1 min ticha**, pak 4–6 pomalých (~20 s) během **4 min ticha**.
3. **Blok 3 – SSILD s podněty a výzvami:** 2 cykly = 6 podnětů v pořadí světlo → zvuk → dotek → světlo → zvuk → dotek v **intervalu 1 min**. Každé cvičení trvá 1 min a končí podnětem své modality, který značí přepnutí. Po každém podnětu zazní výzva: „Když si všimnete podnětu, stáváte se lucidními. Obraťte pozornost ke svým myšlenkám… všimněte si, kam mysl zabloudila… Teď pozorujte své tělo… své vjemy… a pocity… Pozorujte dech… zůstaňte kriticky bdělí, lucidní a všímejte si, čím se tento zážitek liší od běžného bdělého prožitku.“
4. **Blok 4 – podněty bez výzev:** další 2 cykly (6 podnětů po 1 min). Intenzita nebo počet vibrací v cyklech klesá. Pak normálně usnout. Pokud během tréninku začne REM, podněty se zastaví.
5. **Vlastnosti podnětů:** zrak = 3 krátké záblesky červeného světla z čelenky ZMax; sluch = třítónová melodie **500–700–900 Hz** z reproduktorů; dotek = 1–3 jemné vibrace na čele; v pozadí bílý šum ~35 dBA.
6. **Prahy:** zvuk začíná na 40 dBA a snižuje se po 5 dB, dokud ho účastník nehodnotí jako nebudící. Světlo začíná na 1 % (500 ms zap./vyp.) a zvyšuje se po 5 %, dokud není vnímáno. Vibrace 1 opakování (200 ms zap. / 500 ms vyp.).
7. **Podněty v REM:** začínají ~20 s po detekci REM, v pořadí z tréninku, zhruba každých 20 s. Přírůstky: světlo +5 %, zvuk +5 dBA, vibrace 1 → 3 opakování. Při mikroprobuzení (EMG nebo alfa) pauza, dokud zcela neodezní, pak pokračování na úrovni před rušením. Po signálu LRLR se intenzita drží konstantní. Každé nové REM období začíná od základní úrovně. Autoři připouštějí, že start po 20 s mohl přijít dřív, než se REM stabilizoval.
8. **Po každém probuzení:** zkrácená verze ~7 min (4 rychlé cykly za 1 min, 1 pomalý cyklus bez podnětu za 1 min, 1 cyklus se 3 podněty bez výzev).
9. **Instrukce pro lucidní sen:** LRLR při nástupu lucidity, při každém vnímaném podnětu a zhruba každých 30 s. Při falešném probuzení RT („zkuste dýchat ucpaným nosem nebo počítat prsty“). Po nástupu lucidity „klidně pozorujte nebo prozkoumejte scénu a v prvních okamžicích se vyhněte intenzivním akcím, jako je létání nebo volný pád“.
10. **Bezpečnostní data:** podněty byly vnímány v 71,1 % stimulačních období, probudily ve 23,7 % a přímo spustily 39,1 % stimulovaných SVLD. Ve 2týdenním sledování (49 respondentů) mělo 32,7 % aspoň jeden LD doma a nikdo nehlásil negativní dopady. Ve 15,3 % falešných probuzení lidé „vnímali podněty“, které nikdy nezazněly. To je užitečná kalibrace pro hlášení uživatelů typu „slyšel jsem podnět“.

### Protokol 5: Domácí TLR v telefonu (Konkoly a kol. 2024, přesné parametry) [V]

Zdroj: [PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/); [PDF Northwestern](https://faculty.wcas.northwestern.edu/paller/C&C24.pdf). Článek vyšel v *Consciousness and Cognition* 2024 (doi:10.1016/j.concog.2024.103759) a autoři uvádějí, že kód aplikace je na GitHubu.

1. **Zařazení (exp. 1):** telefon s Androidem, vybavování ≥ 3–4 snů týdně, spánek ≥ 7–8 h, předpoklad, že po probuzení „v posledních 2 hodinách noci“ člověk znovu usne.
2. **Definice pro uživatele:** lucidita je „schopnost jasně a kriticky přemýšlet o zážitcích přítomného okamžiku“. Uživatel ví, že se zvuk bude ve spánku opakovat.
3. **Nastavení telefonu každou noc:** vypnout notifikace, hlasitost na maximum, telefon displejem dolů na posteli vedle polštáře. (Oprava verze 1: neexistuje samostatná kalibrace „nesmí budit“.)
4. **První noc – testy:** práh slyšitelnosti a **práh rozlišení** (úroveň, při které lze rozlišit dva zvuky studie).
5. **Podnět (exp. 1):** buď tři čisté tóny stoupající **400 → 600 → 800 Hz** (celkem ~650 ms), nebo **zvuk houslí 1 000 ms**; jeden podnět po celou dobu. V pilotu měly housle 0,67 → 3,16 LD/týden (n = 6) a pípnutí 0,83 → 1,67 (n = 12); kvůli velikosti vzorku autoři nic nevyvozují.
6. **Trénink, 1. noc:** podnět zazní 4×, pokaždé s výzvou: „Když si všimnete signálu, stáváte se lucidními. Obraťte pozornost ke svým myšlenkám a všimněte si, kam mysl zabloudila [pauza]. Teď pozorujte své tělo, vjemy a pocity [pauza]. Pozorujte dech [pauza]. Zůstaňte lucidní, kriticky bdělí a všímejte si, čím se tento zážitek liší od běžného bdělého prožitku [45 s pauza].“ Pak oznámení, že podněty budou pokračovat bez instrukcí a že lze usnout a dál „trénovat lucidnost při každém podnětu“. Následuje **12 podnětů za ~15 min v intervalech 45, 70, 55, 65, 70, 80, 65, 60, 75, 75, 90, 120 s**. Celý trénink trvá ~18–22 min.
7. **Trénink, noci 2–7:** výzva zazní jen jednou, po prvním podnětu. Zda se opakuje i 12 podnětů na konci, článek výslovně neuvádí [NEOV].
8. **Podněty ve spánku (exp. 1):** začátek **6 h po skončení tréninku**. Autoři to zdůvodňují přerušením spánku 6 h po usnutí podle Erlacher & Stumbrys 2020. Jeden podnět každých **20–40 s**; 1. noc start na prahu rozlišení a každý podnět o **+0,16 %** hlasitěji. Jednotka není definovaná, pravděpodobně jde o 0,16 % maximální hlasitosti [NEOV]. Konec ani strop článek neuvádí; v exp. 1 podněty pokračovaly, „dokud se účastníci neprobudili“.
9. **Pravidla pauzy (exp. 1):** pohyb akcelerometru od předchozího podnětu → pauza do **5 min po ustání pohybu**. Pokud uživatel nahlásí, že ho aplikace probudila → pauza do **45 min** od chvíle, kdy se rozhodne znovu spát. Po každé pauze restart na prahu rozlišení.
10. **Rozhraní při probuzení:** jakmile podněty začaly, zvednutí telefonu zobrazí otázku „Probudil vás zvuk z aplikace?“ (ano / ne / nejsem si jistý). Pak formulář zprávy o snu (volný text, „byl jste lucidní“, „slyšel jste podněty“, 5 položek náhledu ze škály LuCiD) a volba „spát dál“ nebo „vstávám“.
11. **Změny v exp. 2 (veřejná aplikace) → výchozí pro produkt:** dvě odlišné **harfové melodie ~3 s s náběhem a doznivem**; pauza po pohybu zkrácena na **1 min**; hlasitost má **strop** na úrovni, kdy uživatel nahlásí, že podnět pronikl do snu nebo spustil LD; volitelný **jemný režim** (+0,08 % na podnět, maximum = práh rozlišení, po detekovaném probuzení konec podnětů na celou noc). Jemný režim se použil v ~15–17 % nocí a na LD neměl vliv.
12. **Design exp. 2:** 1. noc dostal TLR každý. Skupina s naučeným podnětem měla TLR všech 7 nocí. Kontroly měly TLR v nocích 1, 3, 5, 7 a v nocích 2, 4, 6 buď nenaučený zvuk z testu rozlišení, nebo ticho. Účastníci o existenci kontrolních nocí nevěděli.
13. **Výsledky a jejich váha:** exp. 1 (n = 19, bez kontroly) 0,74 → 2,11 LD/týden; LD mělo 14 z 19 oproti 8 v předchozím týdnu. Z 26 přijatých 4 vypadli kvůli technickým potížím, 1 odstoupil dobrovolně a 2 nezačali. V exp. 2 aplikaci použilo aspoň jednou **416 lidí**; 120 mělo aspoň jednu noc v každé podmínce, 112 dokončilo první dvě noci (40/35/37) a jen **50 všech 7 nocí**. Naučený podnět se od kontrol lišil **jen ve 2. noci** (OR 3,61, p = 0,006; 1. noc OR 1,06). Po zahrnutí dalších 116 účastníků **efekt nebyl významný (p > 0,3)**. Podněty budily: pohyb na podnět 0,19 vs. 0,10 bez podnětů (p = 0,002).
14. **Interpretace:** srovnání naučený zvuk / nenaučený zvuk / ticho ukazuje na specifický efekt podnětu, ale jen v sekundární analýze a u lidí s dobrým vybavováním. Bezpečnějším výchozím nastavením pro aplikaci jsou parametry exp. 2: krátká pauza, strop a jemný režim. Rampa „až do probuzení“ z exp. 1 vyráběla probuzení typu budík.

### Protokol 6: Testy reality (volitelný doplněk, ne samostatný slib)

1. **Výzkumná dávka:** ILDIS i NALDIS instruovaly **minimálně 10 RT denně** s otázkou „Sním?“ [V]. Skutečná praxe byla podle tabulek ILDIS ~4–10 denně (tabulky 5 a 6 si odporují) a **počet RT s LD nekoreloval** ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V].
2. **Struktura jednoho testu:** (a) skutečně si položit otázku „Sním?“; (b) rozhlédnout se po anomáliích; (c) jeden fyzický test. ILDIS používal **„RT Breath“: zavřít rty a zkusit se nadechnout ústy** a **„RT Hands“: zkusit protlačit prsty jedné ruky dlaní druhé a prohlédnout si ruce, zda nejsou anomální** [V]. Varianta s ucpaným nosem je laboratorní instrukce MC v2 [V].
3. **Kombinace s MILD zvažovat opatrně:** MILD + RT 12,1 % vs. MILD bez RT 19,4 % (p = 0,052). Autor ILDIS doporučuje vynechat denní RT ze studií indukce, „pokud nejde o specifický zájem“, protože je účastníci vnímali jako zátěž [V]. → aplikace: RT nabízet jako volitelný modul, nevnucovat ho v cestě s MILD a měřit jeho osobní efekt.
4. **Spouštěče podle událostí místo podle času** (průchod dveřmi, odemčení telefonu, osobní znak snu). NALDIS instruoval RT „v různých časech a situacích, zvlášť když se stane něco neobvyklého“ [V]. Specificky pro LD to netestováno [P].
5. **Komunitní varování:** „připomínky vás naučí dělat RT, když zazvoní budík“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/16u8bhe/_/k2mr1mh/)) [S]. Zároveň jde o jednu z nejžádanějších funkcí (viz sekce o aplikacích). Rozpor řeší kombinace připomínek a „tichých“ spouštěčů podle událostí.

### Protokol 7: Komunitní techniky (nabízet s označením „komunitní, bez dat“) [NEOV]

- **DEILD:** při každém přirozeném probuzení se nehýbat, neotevírat oči, držet pozornost u scény snu nebo u tělesného vjemu a „sklouznout“ zpět se záměrem.
- **WILD:** po WBTB nehybně ležet a udržet nit vědomí při usínání (počítání „1, sním; 2, sním…“, pasivní sledování hypnagogických obrazů, představa pohybu). Může přijít spánková paralýza a vibrace. Komunita hlásí, že pro „snadné WILD“ jsou užitečné budíky, které se samy vypnou ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzs4fdt/)) [S].
- **FILD:** ve stavu ospalosti po WBTB 20–30 s střídavě téměř neznatelně tisknout ukazovák a prostředník, potom provést RT.
- **CAT:** týden vstávat o 90 min dřív, pak střídat dny s dřívějším a normálním vstáváním. Kvůli zásahu do spánku není vhodný jako výchozí cesta.

### Protokol 8: Noční můry (rescripting ve stylu IRT)

Lucidita **není mediátorem** úlevy od nočních můr, a to se nově potvrdilo ve třech studiích. V pilotní RCT (n = 23) frekvence nočních můr klesla a „lucidita nebyla nutná“ ([Spoormaker & van den Bout 2006, PubMed 17053341](https://pubmed.ncbi.nlm.nih.gov/17053341/)) [A]. V RCT u PTSD (LD terapie, LDT, n = 20 vs. 11) LDT nezlepšila spánkové proměnné, ale úzkost a deprese klesly ([Holzinger a kol. 2020, PMC7471655](https://pmc.ncbi.nlm.nih.gov/articles/PMC7471655/)) [V]. V RCT Yount 2025 výskyt LD se zlepšením nekoreloval a LD mělo zhruba stejně účastníků v intervenci i v kontrole (viz sekce o terapii). Modul má proto kombinovat IRT (*imagery rehearsal therapy*, přepsání noční můry v bdělém stavu a nácvik nové verze) s volitelným tréninkem lucidity. Výsledek se měří na frekvenci a distresu z nočních můr, ne na počtu LD. Parametry IRT (10–20 min denně) jsou standardní klinická praxe, v této verzi neověřená [NEOV]. U PTSD směrovat k odborníkovi.

---
## Výchozí frekvence LD předpovídá úroveň úspěchu, ale začátečníci reagují také

**Analýza jádra.** Zhruba **55 % lidí (95% CI 49–62 %) zažilo LD aspoň jednou a ~23 % (20–25 %) ho má aspoň jednou měsíčně**; „častý“ znamená měsíčně, ne týdně ([Saunders a kol. 2016, PubMed 27337287](https://pubmed.ncbi.nlm.nih.gov/27337287/)) [A]. V brazilském vzorku (n = 3 427) mělo LD aspoň jednou 77 %. U 48 % trval LD subjektivně méně než minutu a **kontrola nad snem byla vzácná (29 %)** ([Mota-Rolim 2013, PMC3857923](https://pmc.ncbi.nlm.nih.gov/articles/PMC3857923/)) [V].

Verze 1 tvrdila, že nejsilnějším prediktorem je předchozí zkušenost. Ověření plných textů ukazuje smíšenější obraz:

- **Pro roli výchozí frekvence** svědčí Schredl 2025, kde výhoda RT zmizela po kontrole výchozí frekvence [A]. Dále Klofat 2024, kde všech 8 úspěšných bylo zkušených [A]. V MC v2 měli úspěšní vyšší předchozí frekvenci LD (p = 0,005) a v LaBerge 2018 výchozí úroveň predikovala úspěch (β = 0,04, p = 0,0001) [V].
- **Proti zjednodušení svědčí** ILDIS: týdenní úspěšnost se nelišila mezi lidmi s předchozí zkušeností s indukcí (15,3 %) a bez ní (16,4 %, p = 0,454). Autor uzavírá, že techniky lze použít „bez ohledu na výchozí frekvenci LD nebo předchozí zkušenost s technikami“; vstupní frekvence LD přitom s výsledkem korelovala (rs = 0,38) ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V]. V MC v2 dosáhlo SVLD **10 lidí, kteří měli LD nejvýš jednou ročně** ([MC v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2.full)) [V, PRE]. V LaBerge 2018 uspěli na 8 mg 4 z 10 lidí, kteří nikdy předtím lucidní sen neměli (40 % vs. 42 % u ostatních) [V].

Správná formulace tedy zní: **výchozí frekvence předpovídá úroveň, ale začátečníci na techniky reagují také.**

| Faktor | Typ | Směr a síla | Lze ovlivnit? | Zdroj |
|---|---|---|---|---|
| Výchozí frekvence LD | Psychologický/trait | Predikuje úroveň úspěchu (rs ≈ 0,38), nevylučuje začátečníky; LD stabilní 7 let (N = 1 267) | Pomalu, praxí | [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) [V]; [Schredl & Göritz 2025](https://doi.org/10.1177/02762366251349518) [A] |
| Usnutí do 10 min po technice | Behaviorální/bio | 18,3 % vs. 11,1 %; hranice 5 min nereplikována | Částečně (délka bdění, relaxace) | [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/) [V] |
| Vybavování snů | Psychologický | V LD nocích 2,8 vs. 1,7 snů/den; recall ↔ frekvence LD r = 0,44 | Ano (deník, postoj) | [ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/); [Gerhardt & Baird 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11120098/) [V] |
| Čas v noci / pozdní REM | Biologický | Klíčový; 4,5 h horší než 6 h (mezistudiově) | Ano (plánování) | [Erlacher 2022](https://pmc.ncbi.nlm.nih.gov/articles/PMC9149976/) [V] |
| Přechody bdění → REM | Biologický | Pozitivní | Ano (WBTB), za cenu spánku | [Gott 2020](https://pubmed.ncbi.nlm.nih.gov/32768920/) [A] |
| Narkolepsie | Biologický | 77,4 % vs. 49,1 % ever-LD; 7,6 vs. 0,3 LD/měs. | Ne | [Dodet 2015](https://pmc.ncbi.nlm.nih.gov/articles/PMC4335518/) [V] |
| Cholinergní tonus | Biologický | Dávkově závislý (galantamin) | Jen farmakologicky (Rx) | [LaBerge 2018](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0201246) [V] |
| Halucinace, disociace v REM, noční můry | Psychologický/bio | Halucinace (IPO-RT) predikují disociované zážitky v REM; vazby slabé; **N = 455** britských lucidních snílků | Ne; zároveň zranitelnost | [Drinkwater a kol. 2020, PMC7093643](https://pmc.ncbi.nlm.nih.gov/articles/PMC7093643/) [V] |
| Meditace, meta-uvědomění | Psychologický | **Slabá** korelace: otevřené monitorování r = 0,16; liší se jen denní meditující; R² ≈ 0,10; 9týdenní MBSR bez efektu | Pomalu | [Gerhardt & Baird 2024](https://pmc.ncbi.nlm.nih.gov/articles/PMC11120098/); [Baird 2019](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164/) [V] |
| Postoj ke snům, toulání myslí | Psychologický | Predikuje vybavování | Ano (motivace) | [BPS Digest](https://bps.org.uk/research-digest/what-makes-us-more-likely-remember-dreams) [S] |
| Otevřenost, extraverze | Trait | Pozitivní asociace s LD (regresní rámec); velikost efektu neověřena | Ne | [Matsuda & Matsuda 2026](https://pmc.ncbi.nlm.nih.gov/articles/PMC12979406/) [V] |
| Synestezie | Trait | Jen **percepční** typy (vizualizované vjemy, prostorové sekvence) podporují kontrolu a náhled; konceptuální (barva písmen) mohou LD tlumit; N = 616, Japonsko, průřezové | Ne | [Matsuda & Matsuda 2026](https://pmc.ncbi.nlm.nih.gov/articles/PMC12979406/) [V, PRE] |
| Sklon k fantazii, absorpce, disociace | Trait | Pozitivní korelace; jádro sporu o rizicích | Ne | [Aviram & Soffer-Dudek 2018](https://pmc.ncbi.nlm.nih.gov/articles/PMC5875414/) [V] |
| Hraní videoher | Behaviorální | Korelace; replikace sporná | — | [Gackenbach, MacEwan](https://roam.macewan.ca/items/646140ec-2d05-4065-b929-22714e692643/full) [A] |
| Věk | Biologický | Pokles kolem 16 let; u dospělých 25–66 let žádný vztah k LD (r = −0,09), jen k vybavování (r = −0,24) | Ne | [Voss 2012](https://pubmed.ncbi.nlm.nih.gov/22639960/) [A]; [Baird 2019](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164/) [V] |
| Dlouhodobé zapojení do praxe | Behaviorální | Více LD během 7 let u těch, kdo praktikovali | Ano | [Schredl & Göritz 2025](https://doi.org/10.1177/02762366251349518) [A] |

**Rozšíření perspektivy: behaviorální věda je slabě využitá páka.** MILD je strukturálně **implementační záměr** typu „když budu příště snít, uvědomím si…“. Implementační záměry mají střední až velký efekt na dosažení cíle, d = 0,65 v 94 testech ([Gollwitzer & Sheeran 2006](https://kops.uni-konstanz.de/bitstreams/d4f710b4-a505-49ef-a831-5b8d7675100b/download)) [V]. Novější metaanalýza **642 testů** uvádí **d = 0,27–0,66** podle typu výstupu. Efekty byly větší, když měl plán podmíněný formát „když–pak“, účastníci byli vysoce motivovaní a **plán si opakovali** ([Sheeran, Listrom & Gollwitzer 2024](https://doi.org/10.1080/10463283.2024.2334563)) [A]. Tyto tři moderátory jsou přímo pravidly pro skript MILD.

Návyk se automatizuje za **18–254 dní**. Často citovaný medián ~66 dní platí jen pro 39 lidí s dobrým proložením modelu. Pro design je klíčové, že **vynechání jedné příležitosti proces formování návyku podstatně neovlivnilo** ([Lally a kol. 2010, doi:10.1002/ejsp.674](https://doi.org/10.1002/ejsp.674)) [A]. To je přímá opora pro zákaz trestajících sérií.

U **gamifikace** v metaanalýze aplikací na depresi (38 studií, n = 8 110) nebyl prvek gamifikace prediktorem symptomů (β = −0,03) ani adherence (β = −1,93, n.s.) ([Six a kol. 2021, PMC8669581](https://pmc.ncbi.nlm.nih.gov/articles/PMC8669581/)) [V]. Malý efekt na pohybovou aktivitu (g = 0,32) pochází z populace **pacientů s kardiovaskulárním onemocněním**; nejdůležitějším herním prvkem byla zpětná vazba ([Yu a kol. 2025, PMC11806271](https://pmc.ncbi.nlm.nih.gov/articles/PMC11806271/)) [V]. **Odpad je obrovský**: v ILDIS odpadlo ~58 % těch, kdo dokončili první týden, ještě před koncem druhého a v domácí TLR studii ze 416 uživatelů vydrželo 7 nocí jen 50 (12 %).

**Strategický návrh.** Onboarding má profilovat výchozí vybavování, frekvenci LD, frekvenci nočních můr, latenci usnutí po nočním probuzení, délku spánku a psychiatrické rizikové signály. Podle toho nastaví očekávání a cestu:

- Lidé se slabým vybavováním stráví týdny 1–3 tréninkem vybavování.
- Lidé, kteří po probuzení usínají pomalu, dostanou MILD při přirozeném ranním probuzení místo WBTB.
- Uživatelé s častými nočními můrami jdou do modulu pro noční můry, ne k agresivní indukci.
- Začátečníkům aplikace výslovně řekne, že „i lidé bez předchozího LD ve studiích uspěli“, ale v řádu týdnů.

Metriky v prvních 4–8 týdnech mají odměňovat **proces** (vybavené sny, nalezené znaky snů, provedené MILD), ne počet LD. Skript MILD má být ve formátu „když–pak“ a opakovaný. Zpětná vazba je jediný herní prvek s doloženým efektem.

**Limitace.** Většina dat o faktorech je průřezová. Pohlaví, chronotyp, locus of control a potřeba poznání nemají ověřená velká data.

---

## Ezoterické školy fungují jen přes vědecké ingredience

**Analýza jádra.** Žádná ezoterická ani „spirituálně-technologická“ metoda nebyla v kontrolované studii prokázána jako samostatně účinná. Ty, které podle všeho fungují, sdílejí pět ingrediencí evidence-based technik:

1. **probuzení a pokus v pozdním REM** (Radugovy nepřímé techniky po probuzení, Monroeho „mysl bdí, tělo spí“, taoistické a tibetské noční bdění);
2. **prospektivní záměr před spaním** (hypnóza, *sankalpa* v józe nidře, Castanedovy ruce);
3. **kritické zkoumání stavu** (pohled na ruce jako test reality);
4. **dlouhodobé meta-uvědomění** (meditace);
5. **ritualizované prostředí**, které zvyšuje očekávání a motivaci.

Nejlépe zdokumentovaným případem je Michael Raduga, který považuje LD, OBE (*out-of-body experience*, mimotělní zážitek) a spánkovou paralýzu za jeden stav, „fázi“. Jeho studie zahrnula 449 převážně začátečníků během dvou nocí a hlásí „484 úspěšných pokusů“. Metoda je údajně odvozená z tibetské jógy snů a testovala se na komerčních akcích ([IJoDR 2021, úryvek](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/71170)) [A]. Údaj 142 LD z verze 1 se nepodařilo znovu ověřit. Ve studii „mimozemských setkání“ znali účastníci cíl studie předem ([IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR/article/view/78599)) [A z verze 1]. Mechanismus Radugových technik (pokus o „oddělení“ ihned po probuzení bez pohybu) je zcela mainstreamový: jde o variantu WILD/DEILD. Tvrzení „80 % za 2 dny“ je propagační ([REMspace](https://remspace.net/blog/general-principles-regarding-the-techniques/)). Raduga si v roce 2023 sám vrtal do lebky, aby si implantoval elektrodu ([Vice](https://www.vice.com/en/article/lucid-dreaming-tech-michael-raduga-remspace/)) [S].

**Hypnóza má nově dohledaná čísla.** Dane & Van de Castle 1984 pracovali s 15 páry vysoce hypnabilních žen ve věku 18–32 let bez předchozího LD a s jednou laboratorní nocí. Účastnice byly rozděleny do čtyř podmínek: posthypnotická sugesce s původními instrukcemi v bdění, posthypnotická sugesce s revidovanými instrukcemi, jen původní instrukce, nebo jen revidované instrukce. Všechny podmínky kromě samotných původních instrukcí byly významně úspěšnější a **mezi hypnózou a revidovanými instrukcemi v bdění nebyl rozdíl**; ve skupinách s revidovanými instrukcemi uspělo 7 ze 7 a 6 ze 7. Hypnóza měla jedinou kvalitativní výhodu: 6 ze 14 lucidních snů v REM se v podmínkách s ní objevilo mezi 3. a 7. hodinou ranní, zatímco bez hypnózy všechny před 3. hodinou ([Lucidity Letter](https://journals.macewan.ca/lucidity/article/download/444/346)) [V]. Jde o malý, selektivní vzorek s laboratorní zpětnou vazbou. Řízená „sebehypnóza“ je tedy legitimní forma doručení záměru ve stylu MILD, ale ne lepší forma. Moderní RCT neexistuje; dohledána byla jen kazuistika z roku 2026 ([Ramos 2026, Europe PMC](https://europepmc.org/article/MED/42090728)) [A].

**Binaurální rytmy** mají v metaanalýze 22 studií střední efekt na paměť, pozornost, úzkost a analgezii (g = 0,45), ale **žádný LD výstup** ([Garcia-Argibay 2019, PubMed 30073406](https://pubmed.ncbi.nlm.nih.gov/30073406/)) [A]. EEG studie nenašla rozdíl ve frekvenčním výkonu kůry oproti bílému šumu ([PMC3322125](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322125/)) [A z verze 1]. Marketing „40 Hz audio = lucidita“ si nelegitimně půjčuje výsledek elektrické tACS. Ta se navíc nereplikovala a frontální 40 Hz signál podle Demirel 2025 není znakem LD. **Spánková paralýza** jako „brána“ je fenomenologicky dobře zdokumentovaná ([Denis & Poerio](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5245115/)) [A]. OBE a LD podle přehledu z roku 2025 nelze spolehlivě odlišit znaky ani interpretací; jako klíčový znak OBE autoři navrhují „bytí bez fyzického těla“ ([Weiler a kol. 2025, PMC12477129](https://pmc.ncbi.nlm.nih.gov/articles/PMC12477129/)) [V].

**Rozšíření perspektivy.** U řady „tradic“ je falešný samotný původ. Castanedův don Juan je pravděpodobně fikce ([Wikipedia](https://en.wikipedia.org/wiki/The_Art_of_Dreaming)). „Senoi teorii snů“ připsal Senoiům Kilton Stewart, podle Domhoffa šlo o jeho vlastní myšlenky ([Domhoff, UCSC](https://dreams.ucsc.edu/Articles/senoi.html)) [A]. Islámská *istikhára* a řecká inkubace v asklépieích jsou praktiky inkubace obsahu snu a hledání vedení, ne indukce lucidity, a prezentovat je jako „LD hack“ je kulturně necitlivé. Interpretační rámce hlubší či spirituální roviny (astrální cestování, setkání s entitami) nejsou empiricky podložené. Uživatelům, kteří narazí na spánkovou paralýzu nebo stavy podobné OBE, ale může snížit strach, když je aplikace podá jako „jak tento zážitek chápou různé tradice“. Weiler 2025 k tomu nabízí neutrální jazyk: popisovat bezprostřední smyslový zážitek, ne jeho výklad.

**Strategický návrh.** Kulturní a spirituální rámce lze nabídnout jako volitelné „ladění“ obsahu (obřad usínání, „svatyně snu“, tradiční příběhy). Účinnost ale musí stát na skutečných ingrediencích: plánování WBTB, skriptech MILD/SSILD, deníku a záměru. **Nikdy netvrdit účinnost** binaurálních rytmů, krystalů, bylin, „aktivace šišinky“ ani hypnózy jako takové. Řízenou sebehypnózu lze nabídnout jako formát doručení záměru.

**Limitace.** Tabulka 2 studie Dane (počty v podmínkách s původními instrukcemi) je jen obrázek a v textu chybí. Plný text Raduga 2021 byl nedostupný. Data o józe nidře pro spánek jsou rozporná.

---

## Hardware historicky selhal, nejsilnější technologie je software

**Analýza jádra.** Téměř všechna spotřebitelská LD zařízení let 2012–2020 skončila nebo osiřela a žádné nemá nezávislý důkaz účinnosti. Patří sem NovaDreamer (výroba ukončena ~2004), Aurora, Neuroon, LucidCatcher, spotřebitelská verze Dreem (dnes B2B čelenka „Waveband“ od Beacon Biosignals pro klinické studie, [beacon.bio](https://beacon.bio/dreem-3s)) a Kokoon (dnes jen podpora Philips „Discontinued“, [kokoon.io](https://kokoon.io/)) [V]. Komerční zařízení podle přehledu z roku 2019 nezveřejňují algoritmy detekce REM a nebyla nezávisle testována ([Mota-Rolim 2019, Front Neurosci](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6517539/)) [A].

| Zařízení | Senzory | Podnět | Cena (říjen 2026) | Stav | Důkazy pro LD |
|---|---|---|---|---|---|
| **Remee** (Bitbanger Labs) | **Žádné**, časovač | červené LED | **67 USD** s dopravou (dříve 95) ([sleepwithremee.com](https://www.sleepwithremee.com/)) | Objednatelné, web zjevně zastaralý (oznámení z roku 2023) | Žádné nezávislé |
| **ZMax LD set** (Hypnodyne) | Čelní EEG, surová data, skriptovatelné | světlo/zvuk/vibrace přes software (Dreamento) | **1 200 € bez DPH** + 50 € doprava; jen zařízení 1 050 € ([order.php](https://hypnodynecorp.com/order.php)); s 21% DPH ~1 450 € (výpočet) | Objednatelné na fakturu, doručuje do ČR | Použito v publikovaném výzkumu (MC studie); žádné tvrzení o účinnosti zařízení |
| **INSPEC** (lucidcode) | Infračervená kamera u postele, strojové vidění pohybů očí (bezkontaktní) | LED, zvuk, vibrace telefonu/hodinek | **300 €** (výrobce) | Objednatelné; Product Hunt 7. 4. 2026 ([inspec.me](https://www.inspec.me/lucid-dreaming-devices-compared)) | Jen výrobce: jedna noc proti EEG, žádná recenzovaná validace |
| **LucidMe** (REMspace) | Chytrá maska | světlo/zvuk | 249,99 USD (zastaralý záznam) ([remspace.net/lucidme](https://remspace.net/lucidme/)) | Nejasný; konkurent uvádí stažení z obchodu | Žádné |
| **LucidMe PRO** (REMspace) | EEG, EMG, EOG, HR/HRV, teplota, SpO₂, dech (tvrzení výrobce) | LED, reproduktory, vibrace | 79 USD + předplatné od 9 USD/měs. ([BusinessWire, nepřímo](https://www.businesswire.com/news/home/20251111511684/en)) | Předobjednávky podle konkurenta v srpnu 2026 pozastaveny kvůli deskám plošných spojů; optimisticky listopad/prosinec 2026; dodávky nezačaly ([inspec.me](https://www.inspec.me/lucid-dreaming-devices-compared)) [S] | Žádné |
| **Somni Mask Pro** (Somni Technologies) | 4 IR senzory u jednoho oka | světlo v masce, zvuk z telefonu | Kickstarter 169–199 USD + 29 USD doprava ([Kicktraq](https://kicktraq.com/projects/somnimask/somni-mask-pro-rem-triggered-cues-for-lucid-dreaming)) | Kampaň 15. 9.–15. 10. 2026; dodání plánováno na březen 2027 | Žádné; předchůdce z roku 2020 dostal 1,5/5 („falešně detekoval REM… nejméně pětkrát“, [recenze](https://gilan.medium.com/review-somni-mask-for-lucid-dreaming-be6a85d4ff58)) |
| **REM Dreamer / SmartLucider** (ELI, PL) | Levné masky s detekcí REM | světlo | — | Zřejmě ukončeno (podle konkurenta) | Žádné |
| **Prophetic Dual** | 2 pevné ultrazvukové vysílače, **žádné neurální senzory** | fokusovaný ultrazvuk | 449 USD | 1. série „vyprodána“, dodání konec 2026; 2. série začátek 2027 ([prophetic.com](https://prophetic.com/)) | Jen firemní graf sebehodnocení 1–10 bez n, protokolu a zaslepení |
| **Prophetic Phase** | Fázovaná pole, elektronické směrování, **fNIRS** (ne EEG), uzavřená smyčka | fokusovaný ultrazvuk | 1 299 USD | Obě série v polovině 2027 | Žádné |
| **Muse S Athena** (InteraXon) | EEG + fNIRS | — (bez LD funkce) | 474,99 USD ([choosemuse.com](https://choosemuse.com/)) | V prodeji, i v EU | Spolupráce s Paller lab jen ohlášena (2024) |
| **Elemind / Somnee / Neurable** | EEG nebo neurostimulace pro usínání či soustředění | — | 389–499 USD | Elemind jen USA a Kanada | Žádná LD funkce |

Prophetic výslovně uvádí, že jeho zařízení „nejsou zdravotnické prostředky“ a jsou „jen pro rekreační použití“ ([prophetic.com](https://prophetic.com/)) [V]. Martin Dresler z Donders institutu, s nímž Prophetic v roce 2023 ohlásil spolupráci, k tomu řekl, že nevědí, „které struktury by bylo třeba stimulovat… a zda by to vůbec bylo možné s čelenkou“ ([Vice 2023](https://www.vice.com/en/article/m7bxdx/scientists-are-researching-a-device-that-can-induce-lucid-dreams-on-demand)) [S]. Výsledky této spolupráce nebyly publikovány. Nová studie NEUSLeeP (UT Austin, *Nature Communications* 2026) ukazuje, že transkraniální ultrazvuk zaměřený na subtalamické jádro dokáže zkrátit latenci REM o 43 min, LD ale neměřila ([UT Austin](https://sites.utexas.edu/mulva-clinic-for-the-neurosciences/2026/08/07/fonzo-co-pi-on-project-for-ultrasound-device-that-improves-rem-sleep/)) [S]. Mechanismus Prophetic je tím méně fantastický, o luciditě to ale nevypovídá nic.

**Neurostimulace.** Voss 2014 stimuloval 27 lidí bez LD 30 s frontotemporální tACS 2 min po nástupu REM. Lucidita vzrostla jen při 25 a 40 Hz ([PubMed 24816141](https://europepmc.org/abstract/MED/24816141)) [A]. Často citovaných „77 %“ je tiskový údaj za jednotlivé stimulace a sebehodnocený náhled, ne SVLD ([Live Science](https://www.livescience.com/45520-brain-zaps-trigger-lucid-dreams.html)) [S]. Replikace z Nielsenovy laboratoře našla SVLD po tACS, **„ale stejně tak po falešné stimulaci“**; autoři uzavírají, že „situační faktory mohou být pro navození sebeuvědomění ve spánku klíčové“ ([Blanchette-Carrière a kol. 2020](https://europepmc.org/abstract/MED/32534325)) [A]. Velikost vzorku n = 40 je jen sekundární údaj. tDCS měla slabý efekt jen u častých lucidních snílků ([Stumbrys 2013](https://www.sciencedirect.com/science/article/abs/pii/S1053810013001098)) [A]. Nová tACS/tDCS studie z let 2024–2026 se nenašla. REMspace tvrdí, že v roce 2024 zprostředkoval „komunikaci mezi dvěma snícími“; recenzovaná práce neexistuje ([The Debrief](https://thedebrief.org/lucid-dreaming-breakthrough-startup-claims-first-ever-two-way-dream-communication/)) [V jako absence].

**Látky a jejich právní status v ČR.**

- **Galantamin** je jediná látka se solidním RCT. Všechny registrované přípravky v ČR (REMINYL a generika, ATC N06DA04) jsou podle databáze SÚKL **„na lékařský předpis“** ([SÚKL](https://prehledy.sukl.cz/prehled_leciv.html)) [V]. Studie LaBerge 2018 vylučovala astma, betablokátory, závažné duševní onemocnění a srdeční arytmie. Účastníkům bylo řečeno, že dostanou „doplněk volně prodejný“ (americký kontext) [V].
- **Galantaminové doplňky** prověřila studie v *JAMA* 2024: **9 z 10 značek doplňků z Amazonu bylo chybně označených (obsah od méně než 2 % do 110 % deklarace) a 3 z 10 obsahovaly bakterii *Bacillus cereus***. Generické léky obsahovaly 97,5–104,2 %. Několik doplňků se prodávalo přímo pro lucidní snění a FDA považuje galantamin v doplňcích za nezákonný ([Cohen a kol. 2024, Europe PMC](https://europepmc.org/abstract/MED/38393714); [AARP](https://www.aarp.org/health/drugs-supplements/galantamine-memory-loss-dose-errors/)) [A/S]. Že by takový výrobek byl v EU neregistrovaným léčivým přípravkem, je inference, kterou SÚKL ani SZPI nepotvrdily [NEOV].
- **Calea zacatechichi, Silene capensis a pelyněk nejsou v ČR kontrolované.** Nefigurují v NV č. 463/2013 Sb. (aktuální znění k 25. 6. 2026) a nový seznam psychomodulačních látek (NV č. 456/2025 Sb., účinný od 12. 11. 2025) obsahuje jen kratom ([zakonyprolidi.cz – NV 463/2013](https://www.zakonyprolidi.cz/cs/2013-463); [NV 456/2025](https://www.zakonyprolidi.cz/cs/2025-456); [MZ ČR](https://mzd.gov.cz/seznam-psychomodulacnich-latek-byl-vyhlasen-ve-sbirce-zakonu/)) [V]. V **Polsku** je Calea od roku 2009 omamnou látkou skupiny I-N ([Dz.U. 2009 nr 63 poz. 520](https://api.sejm.gov.pl/eli/acts/DU/2009/520/text/T/D20090520L.pdf)) [V]. Legálnost neznamená bezpečnost: Calea vykazuje in vitro neurogliální toxicitu ([Garcia a kol. 2025](https://europepmc.org/abstract/MED/39389391)) [A].
- **Donepezil** („8 z 10“) má oporu jen v LaBergeově patentu z roku 2004, ne v recenzované studii ([Oldoni a kol. 2024](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC11119155/)) [V].
- **Vitamin B6:** skupina s B-komplexem měla horší subjektivní kvalitu spánku ([PubMed 29665762](https://europepmc.org/abstract/MED/29665762)) [A].
- Žádná nová farmakologická LD studie z let 2024–2026 se nenašla.

**Rozšíření perspektivy: TLR je „technologie“, která je ve skutečnosti trénink.** Zvukové podněty fungují, jen když byly předem spojeny s lucidním nastavením mysli. Výsledky MC v2, nulová replikace přes Oniri a falešná stimulace v tACS studii ukazují stejným směrem: **procedura, kontext a trénink dělají většinu práce**. TLR se rozšiřuje i mimo luciditu: na řešení problémů (20 častých lucidních snílků, [ScienceDaily](https://www.sciencedaily.com/releases/2026/02/260213223926.htm)) a na noční můry u narkolepsie (n = 6, [PMC12012161](https://pmc.ncbi.nlm.nih.gov/articles/PMC12012161/)) [A, PRE]. MIT Dormio (inkubace obsahu snu v hypnagogii, fáze N1) je samostatný, snadno implementovatelný princip pro **inkubaci obsahu**, ne pro luciditu ([MIT Media Lab](https://www-prod.media.mit.edu/publications/dormio-a-targeted-dream-incubation-device/)) [A].

**Strategický návrh.** Aplikace nemá vyrábět hardware. TLR má implementovat v softwaru, s časovaným režimem bez senzorů jako základem, volitelně zpřesněným hodinkami. Pro uživatele v ČR/EU jsou dnes jedinými objednatelnými zařízeními se snímáním REM a zaměřením na LD ZMax (výzkumný nástroj, ~1 450 € s DPH) a INSPEC (300 €, validace jen od výrobce). Integraci s nimi lze zvážit až ve verzi „pro“. O galantaminu aplikace jen informuje („lék na předpis, poraďte se s lékařem; doplňky z internetu jsou podle JAMA 2024 nespolehlivé a mohou být kontaminované“) a nikdy neuvádí zdroje nákupu.

**Limitace.** Doručení Remee, Prophetic a INSPEC do ČR (clo, DPH) nebylo ověřeno. Stav LucidMe je rozporný. Konečné výsledky kampaně Somni nejsou známy. Přesné n studie Blanchette-Carrière nebylo ověřeno.

---
## Aplikace: podněty na iOS už existují, validovaný protokol ne

**Analýza jádra.** Žádná aplikace trhu nedominuje. Trh se dělí do pěti skupin:

1. kompletní trenažéry (Oniri, Lucidity, Shape, Lucidity Level, Dream Journal Ultimate s „akademií“);
2. utility pro testy reality a deník (Awoken, Reality Check, MILD Trainer, Dream Catcher, DreamKeeper);
3. aplikace s **časovanými** nočními podněty (Oniri, Lucyd, LDAlarm, Lucid Scribe, Lucid Now, Everdream);
4. aplikace s **odhadem REM v reálném čase** z hodinek nebo senzoru (Sleep as Android, Lucidly, Lucid Wake, Lucid Dream Watch, Lucid Scribe s kamerou INSPEC, Somni Mask);
5. AI deníky s interpretací (Elsewhere, Somnium a desítky dalších).

Standardem je freemium se 7denní zkušební dobou a předplatným zhruba 40–60 USD ročně. Jednorázové platby jsou vzácné (LDAlarm 2,99 USD, doživotní licence Everdream 19,99 USD, Lucidity od Shane Curtise PRO 5,99 USD).

**Nejdůležitější posun od verze 1:** výzkumná aplikace Paller lab („lucid“, `com.neurelectrics.dive`) **už není dostupná** (Google Play vrací 404 a stránka laboratoře odkaz nemá). Výzkumník Nathan Whitmore teď publikuje nástupnickou studijní aplikaci **„Lucid Dreaming Experiment“** pod skupinou Pattie Maes na MIT. Je pro iOS i Android, jen pro USA a 18+, a běží jako osminoční studie s 20minutovým tréninkem každou noc a podněty zvukem, světlem a vibracemi ([App Store](https://apps.apple.com/us/app/lucid-dreaming-experiment/id6769513728); [Google Play](https://play.google.com/store/apps/details?id=edu.mit.lucid)) [V]. Mezera na iOS se tím uzavřela v tvrzeních, ne v důkazech: na iOS je nejméně pět aplikací s nočními podněty, ale **žádná nemá nezávisle validovaný protokol**.

Data jsou stažená přímo z obchodů 22. 10. 2026. Hodnocení App Store jsou za obchod v USA, Google Play globálně. Ceny CZK/EUR pocházejí jen z App Store (lokální ceny z Google Play nebyly dostupné).

| Aplikace (vývojář) | Platforma | Cena (USD; CZK/EUR) | Hodnocení (počet) / instalace Play | Klíčové LD funkce a mechanismus podnětů | Stav |
|---|---|---|---|---|---|
| **Oniri** (Oniri Inc) | iOS 16+, Android | Deník zdarma; Premium 6,49–59,99 USD (pravděpodobně ~12,99/měs. a ~59,99/rok, v listingu bez označení), „Full version“ 49,99 USD; CZ 100–949,99 Kč, Full 1 290 Kč; DE 5,49–59,99 € | iOS 4,57 (3 842); CZ 4,67 (51); Play 3,66 (641), 32 527 instalací | Deník, AI výklad, náhodné RT, **časované noční zvukové podněty** (zvonek nebo vlastní hlas ~30 s, posun od usnutí např. 2,5/4/5/6 h, hlasitost s náběhem či poklesem), samovypínací noční budíky, audio WILD/MILD/SSILD; žádné snímání ([oniri.io](https://www.oniri.io/lucid-dreams)) | Aktivní (iOS 17. 10. 2026) ([AS](https://apps.apple.com/us/app/oniri-your-dream-journal/id968737914), [GP](https://play.google.com/store/apps/details?id=io.oniri.oniriapp)) |
| **Lucidity** (Christopher Benz) | Android, iOS 17+ | Android reklamy + 4,99–134,99 USD; iOS 4,99/týd., 12,99/měs., 48–59,99/rok, 89,99–119,99 doživotně; CZ 129 Kč/týd., 349 Kč/měs., 1 290–1 490 Kč/rok, 2 490–2 990 Kč doživotně; DE 5,99 €/týd., 14,99 €/měs., 49–69,99 €/rok | Play **4,81 (8,19 tis.)**, 419 931 instalací; iOS 4,69 (13) | Deník (hlas, tagy, zámek), AI analýza, obrazovky WBTB/WILD/MILD/SSILD, RT a „totemy“; **bez nočních podnětů** | Aktivní ([GP](https://play.google.com/store/apps/details?id=ch.b3nz.lucidity), [AS](https://apps.apple.com/us/app/lucidity-dream-interpretation/id6505020545)) |
| **Shape** (Timeless LLC) | Jen iOS 17+ | Listing: **9,99 USD/měs. nebo 39,99 USD/rok** po 7denní zkoušce (seznam IAP obsahuje i 19,99–99,99); CZ 249–2 990 Kč; DE 9,99 €/měs. | 4,70 (1 730) | 30denní kouč, audio průvodci, připomínky „Am I Dreaming“, z dat Apple Health odhad „špičky snění“ → WBTB budík | Aktivní ([AS](https://apps.apple.com/us/app/shape-lucid-dreaming/id1577026266)) |
| **Awoken** (A. Rudolph) | Jen Android | Reklamy; IAP 0,99–2,49 USD | 4,39 (22,3 tis.), **1 046 096** instalací | Náhodné RT, „Totem Sound“ jako tiché noční podněty, deník | **Zastaralé** (12. 7. 2024); hlášena ztráta dat ([GP](https://play.google.com/store/apps/details?id=com.lucid_dreaming.awoken)) |
| **Dream Journal Ultimate** | iOS, Android | Zdarma; „Support“ 2,99 USD (79 Kč / 2,99 €) | iOS 4,47 (565); Play 4,28 (1,15 tis.), 102 896 | Deník, AI výklad a obrázky, „Lucid Dreaming Academy“ (RT, MILD, WBTB, SSILD, FILD), náhodné RT budíky | Aktivní ([AS](https://apps.apple.com/us/app/dream-journal-ultimate/id802558054), [GP](https://play.google.com/store/apps/details?id=dreamcapsule.com.dl.dreamjournalultimate)) |
| **Dream Catcher** (Snaps Studio) — *nové v tabulce* | Android, iOS | Reklamy; IAP 1,99–29,99 USD | Play 4,33 (8,31 tis.), **499 924**; iOS 4,69 (35) | Deník a analýza | Aktivní ([GP](https://play.google.com/store/apps/details?id=com.vojtkovszky.dreamcatcher)) |
| **Sleep as Android** (Urbandroid) | Android + Wear OS, Galaxy, Garmin aj. | 7 dní premium, pak freemium; IAP 0,99–75 USD | 4,56 (393 tis.), **24,3 mil.** | REM odhadnutý z aktigrafie → hlas „You are dreaming“, vibrace hodinek, světlo; nastavení citlivosti, zpoždění a opakování ([docs](https://sleep.urbandroid.org/docs/sleep/lucid_dreaming.html)) | Aktivní ([GP](https://play.google.com/store/apps/details?id=com.urbandroid.sleep)) |
| **Lucyd** (N. Osadze) — *nové* | iOS 17+ | 4,99–9,99 USD/měs., 19,99–29,99 USD/rok | 4,59 (54) | Výslovně inzeruje protokol Northwestern TLR: předspánkový režim a v „REM bohaté části noci“ podnět „časovaný a s náběhem hlasitosti“; deník a přepis v zařízení, bez účtu | Nové (červenec 2026); poučení z v1.5: denní podnět „byl příliš tichý a režim Focus ho úplně ztlumil“ ([AS](https://apps.apple.com/us/app/lucyd-lucid-dream-on-command/id6787179501)) |
| **LDAlarm** (Y. Koteniatkin) — *nové* | iOS 26+ | **2,99 USD jednorázově** (79 Kč / 2,99 €) | — (nové) | První signál v 6:15 h (WBTB), pak jemné signály, které „jednou zazní a samy odezní“; budicí signál je „skutečný budík iPhonu“, který zní i v tichém režimu a Sleep Focus (AlarmKit); deník, který vzorec vedl k LD | Nové (září 2026) ([AS](https://apps.apple.com/us/app/ldalarm-lucid-dream-alarm/id6813238351)) |
| **Lucid Scribe** (lucidcode) | iOS 16+, Android | iOS zdarma; Android IAP 0,99–39,99 USD | iOS 5,0 (2); Play 3,75 (26), 4 961 | TLR „Deep Playlist“ přes mediální kanál (funguje v tichém režimu a úsporném režimu), časované „REM Lights“, FILD časovač, SSILD; skutečná detekce REM jen s kamerou INSPEC | Aktivní; vývojář prodává INSPEC ([AS](https://apps.apple.com/us/app/lucid-scribe-lucid-dreaming/id6755086169), [GP](https://play.google.com/store/apps/details?id=com.lucidcode.lucidscribe)) |
| **Lucid Wake** (VigilWave) — *nové* | Wear OS (watchOS ve vývoji) | IAP 4,99–29,99 USD | 1 044 instalací | Reálný čas z HR a RMSSD s nastavitelnými prahy; telefon pustí zvuk, vibraci nebo světlo; export surových dat | Nové (březen 2026) ([GP](https://play.google.com/store/apps/details?id=com.vigilwave.lucidwake)) |
| **Lucid Dream Watch / „Dr. Lucid“** (Project Lucid) — *nové* | Wear OS, Apple Watch | IAP 4,29–14,99 USD | Play 3,1 (24), 1 617; iOS 3,57 (7); v CZ/DE App Store nedostupné | „Detekce REM“ a jemná upozornění na hodinkách | Aktivní ([GP](https://play.google.com/store/apps/details?id=app.projectlucid.main)) |
| **Lucidly** (5Path) | iOS + nutné Apple Watch | 5,99 USD/měs., 39,99 USD/rok (159 / 1 090 Kč; 5,99 / 42,99 €) | 3,16 (19) | Neuronová síť odhaduje REM z HR a pohybu hodinek → haptika/zvuk; výrobce tvrdí „>80 %“ a zároveň „odhad REM je aproximace“ | Jen údržba (poslední funkce březen 2025) ([AS](https://apps.apple.com/us/app/lucidly/id1566419183)) |
| **Everdream** | iOS 15+ | 3,99 USD/měs., 14,99 USD/rok, **19,99 USD doživotně** (99 / 399 / 499 Kč) | 4,2 (54) | „Měří spánkové fáze“ → samovypínací budík v REM; RT každou hodinu; deník | Aktivní ([AS](https://apps.apple.com/us/app/lucid-dream-alarm-everdream/id1553743004)) |
| **Lucid Now** (A. Tardy) | iOS 13+ | Premium 3,99 USD/měs. (99 Kč / 3,99 €) | 5,0 (1) | Tvrdí, že podněty míří „do REM fází“; senzor nepopsán | **Zastaralé** (březen 2025) ([AS](https://apps.apple.com/us/app/lucid-now/id6739976528)) |
| **Reality Check** (Oneironaut) | iOS 26+ | Zdarma, bez IAP | 4,67 (3) | 60+ výzev, 5–20 testů denně, tiché hodiny, propojení včerejších testů s nocí | Nové, aktivní ([AS](https://apps.apple.com/us/app/reality-check-lucid-dreams/id6755739747)) |
| **MILD Trainer** (N. Woolmore) | iOS 16+ | **Zdarma** (dříve 3,99 USD) | 5,0 (1) | Denní cílové „události“ jako spouštěče prospektivní paměti, deník s přepisem, export | Aktivní ([AS](https://apps.apple.com/us/app/mild-trainer-lucid-dreaming/id1530667456)) |
| **Lucidity Level** (Woolmore; Android IndieArc) — *nové* | iOS 26+, Android | Pro 1,99/9,99/19,99 USD | Play 4,38 (154), 5 276 | Gamifikovaný deník, cíle MILD, WBTB a samovypínací budíky; listing výslovně: „aplikace sama netrackuje spánek ani nedetekuje REM v reálném čase“ | Nové (2026) ([GP](https://play.google.com/store/apps/details?id=studio.victorylapp.lucidlevelup)) |
| **Lucidity** (Shane Curtis, jiná iOS aplikace) | iOS 26+ | Bez reklam 1,99 USD, PRO 5,99 USD jednorázově | 4,1 (436) | „Samovypínací budíky: krátké jemné budíky, které vzbudí a pak přestanou“ | Aktivní ([AS](https://apps.apple.com/us/app/lucidity-lucid-dreaming/id1121048340)) |
| **LucidMe** (REMspace) | iOS, Android + maska | „Morpheus Mode“ 9,99 USD/měs., 69 USD/rok (249 / 1 990 Kč) | iOS 4,43 (14); Play 3,53 (1,44 tis.), 121 764 | Deník, výklad, spánek s maskou | Aplikace aktivní, hardware nejistý ([AS](https://apps.apple.com/us/app/lucidme-sleep-dream-journal/id907469483)) |
| **Elsewhere** | iOS, Android | 4,99 USD/měs., 49,99 USD/rok (129 / 1 290 Kč; 5,99 / 59,99 €) | iOS 4,94 (108); Play 4,24 (86) | AI deník, symboly (Fontana, Bulkeley), 41 jazyků; **žádné LD nástroje** | Aktivní ([AS](https://apps.apple.com/us/app/elsewhere-dream-journal/id6445864345)) |
| **Lucidly: AI Dream Journal** (MindyApps) | Android | IAP 3,99–34,99 USD | 3,75 (724), 56 193 | AI deník, RT, zvuky, binaurální rytmy; bez nočních podnětů | Aktivní, **od roku 2021** (ne nové) ([GP](https://play.google.com/store/apps/details?id=com.mindyapps.lucidlynew)) |
| **Somni Mask** | iOS + maska | Maska viz zařízení | — | IR senzory u oka; maska sama rozhodne o podnětu, telefon pustí zvuk (výchozí „vítr“ od téměř ticha) | Nové (září 2026) ([AS](https://apps.apple.com/us/app/somni-mask-lucid-dreaming/id6814533249)) |
| **Lucid Dreaming Experiment** (MIT) | iOS 15+, Android | Zdarma (studie) | 377 instalací | Plný protokol TLR v rámci studie | Výzkum, jen USA |
| **Lucid Dreamer** (guardanus) | — | — | — | — | **Stažené** (Play 404, na iOS nenalezeno) ([GP 404](https://play.google.com/store/apps/details?id=guardanus.dreamer)) |
| **Somnium** (Green Advex) | iOS | 6,99 USD/týd., 39,99 USD/rok | 4,75 (20) | AI výklad a **horoskop**; není to LD trenažér | Vyřadit z LD tabulky ([AS](https://apps.apple.com/us/app/somnium-dream-interpretation/id6470462666)) |
| **Ludin** | Tvrzení: iOS + Android | Předběžný přístup 5 USD | — | Telefon na matraci, ML z pohybu v zařízení, světelný podnět | **K 22. 10. 2026 nevyšlo** („Launching October 1, 2026“) ([ludin.app](https://ludin.app/)); stránka s výsledky testů se nenačetla |
| **WorldWithin / DreamKeeper / Dreamu** | iOS / iOS / Android | WorldWithin IAP 6,99–79,99 USD; DreamKeeper zdarma; Dreamu IAP | 4,49 (130) / 4,79 (573) / 37 instalací | RT + deník / jen deník / úrovně 0–12 | Opuštěné (2022, 2023) / zanedbatelné |

Dlouhý chvost tvoří desítky iOS aplikací z let 2025–2026 s 0–5 hodnoceními, například Go Lucid, Ludream, Dreamiary, Lunicia, REMA, DreamWake a Oneirism ([iTunes Search](https://itunes.apple.com/search?term=lucid+dream&entity=software&country=us&limit=50)) [V]. Patří sem i placená binaurální aplikace BrainWave: Dream Inducer (4,86 z 1 051 hodnocení), která je důkazem poptávky po „audio zázracích“, ne po evidenci ([AS](https://apps.apple.com/us/app/brainwave-dream-inducer/id383185215)) [V].

**Volby v jednotlivých kategoriích** (s výhradou, že žádná aplikace nemá nezávislou validaci a že většinu žebříčků píší konkurenti):

- **Nejlepší celkově napříč platformami:** **Oniri**. Na iOS má nejvíc hodnocení (3,8 tis.), nejširší sadu funkcí včetně časovaných nočních podnětů a podle Redditu je deník zdarma bez limitů. Slabinou je Android (3,66, ~33 tis. instalací) a netransparentní ceník.
- **Nejlepší na Androidu podle hodnocení:** **Lucidity (Benz)**, 4,81 a ~420 tis. instalací. Výborný deník a obrazovky technik, ale chybí noční podněty.
- **Noční podněty na Androidu:** **Sleep as Android** (24 mil. instalací, odhad REM z pohybu, vibrace na hodinky), bez validace pro LD.
- **Noční podněty na iOS:** **Lucyd** nejvěrněji kopíruje TLR protokol (nové, nevalidované); **LDAlarm** jako levná jednorázová volba pro WBTB s jemnými signály; **Oniri** pro uživatele, kteří chtějí vše v jednom.
- **Hodinky s reálným časem:** **Lucid Wake** (Wear OS, HR/RMSSD, nové); na Apple Watch **Lucidly** (jen údržba, slabé hodnocení).
- **Nejlepší zdarma na iOS:** **Reality Check** (RT) s **Dream Journal Ultimate** nebo **MILD Trainer** (deník a prospektivní paměť).
- **Nejlepší deník:** Lucidity, Dream Journal Ultimate (poměr ceny a výkonu) a Oniri (deník zdarma). Pro soukromí MILD Trainer nebo Lucyd (zpracování v zařízení, bez účtu).
- **Pro začátečníky:** 30denní kouč **Shape** (iOS, 39,99 USD/rok podle listingu) nebo kurz v Lucidity.
- **Výzkumně nejbližší validovanému protokolu:** „Lucid Dreaming Experiment“ (MIT), dostupná ale jen pro účastníky studie v USA.

### Komunitní konsenzus: deník, samovypínací budíky a hodinky

V r/LucidDreaming bylo v letech 2023–2026 388 příspěvků o aplikacích a zařízeních. V komentářích nejčastěji zmiňovaných vláken padala jména Oniri (11×), Lucidity (9×), Lucid Scribe (9×, většinou od vlastního vývojáře), Apple Watch (8×), Wear OS (8×), INSPEC (7×), Shape (6×), aplikace na poznámky (5×), Fitbit (5×) a Awoken (4×) ([arctic-shift API](https://arctic-shift.photon-reddit.com/api/posts/search?subreddit=LucidDreaming&title=app&after=2023-01-01)) [V]. Počty jsou malé a mají jen orientační váhu. **Konsenzus o „nejlepší aplikaci“ neexistuje** a řada nejlépe hodnocených odpovědí říká, že stačí poznámky v telefonu nebo papír ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzom2er/)).

**Nejžádanější funkce:**

1. **Deník** chráněný heslem s textem, hlasem a skicami, s nastavitelnými budíky, trackerem a grafy (nejvýše hodnocená odpověď, 25 bodů) ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzoaazy/)).
2. **Samovypínací budíky**, ideálně spouštěné detekcí REM z hodinek ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzp28ma/)). „Samovypínací budíky jsou prostě skvělé na snadné WILD“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1c4jpfb/_/kzs4fdt/)). Konkrétní požadavek zní: více budíků s různými zvuky a délkami, jemné, které nevzbudí, a jeden v 6:00, který vzbudí na WBTB ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lqki4h8/)).
3. **Integrace s Apple Watch nebo Fitbitem**, včetně jemného budíku 5 min po detekci REM nebo spouštění podle prahů tepové frekvence ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lkohu3z/); [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1f4tmak/_/lkq8sav/)).
4. **Neomezené, spolehlivé a bezplatné RT připomínky na iPhonu.** Uživatelé narážejí na limity 4 a 10 připomínek denně a nejlépe hodnocené rady zní „nastav si 20 budíků“ nebo „použij Připomínky“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ox73v5/does_anyone_know_an_app_for_iphone_that_can_buzz/)).
5. **Žádné reklamy a žádný paywall** na polovinu funkcí ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/libhi73/); [Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/liaf9or/)).

**Nejsilnější negativní sentiment** se netýká chybějící AI, ale **ztráty dat a chybějících záloh**: „Vyhněte se Awoken: zasekl se a přišel jsem o roky snů“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/17gbywg/_/k6gtgf5/)). Dále nespolehlivých připomínek ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1pbqde6/any_free_app_to_send_me_reality_checks/)) a budíků, které „lidi vyděsí“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1et1vba/_/ligiv47/)). K podnětům je komunita skeptická: „ve většině případů si jich buď vůbec nevšimnete, nebo vás vzbudí… stejný zvuk a hlasitost mají v různé dny různé výsledky“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1tbbzpi/_/olncbfa/)). To odpovídá odhadu autora studie MIT/Northwestern, ~10–15 % šance na LD za noc s tréninkem i podněty ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1gaoayw/initial_results_from_the_northwesternmit_lucid/)). Moderátor LD4all to shrnuje: zařízení „prakticky zaručí, že na podnět ve snu narazíte… vaše signály jsou ale jen polovina práce“ ([LD4all](https://community.ld4all.com/t/wild-device-is-it-worth-it/77588)) [V].

**Doporučení na fórech je třeba diskontovat.** Velkou část „doporučení“ tvoří sebepropagace vývojářů (lucidcode, Lucid Wake, Lucidity Level, Onyra). Jeden nezávislý vývojář LD deníku uvádí tržby **200–300 USD měsíčně bez marketingu** ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1ujxehf/)) [S, jen titulek]. Největší vlákno o zařízeních v korpusu (skóre 203, 156 komentářů) se ptalo, zda by lidé koupili zařízení s 99% úspěšností za 150–300 USD ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1sokuxu/)) [V, jen titulek a metriky]. Poptávka po „zázračném zařízení“ je tedy vysoká, ale ochota platit za software je nízká. LD4all má o aplikacích z let 2023–2026 jen minimum diskusí a DreamViews nebyl dostupný.

### Jak konkurence implementuje noční podněty

Dvě nejrozšířenější implementace jsou protiklady:

- **Oniri** používá pevné časové posuny od usnutí bez jakéhokoli snímání ([oniri.io](https://www.oniri.io/lucid-dreams)) [V].
- **Sleep as Android** odhaduje REM z pohybu. Výrobce na stránce srovnání se spánkovou laboratoří uvádí, že podněty 10, 20 a volitelně 30 min po začátku lehké fáze dopadnou do REM s **~50% pravděpodobností**, což je 2,5× víc než náhoda (REM zabírá ~20 % času). Simulace vychází z 31 nocí aktigrafie z Apple Watch s PSG ([Sleep as Android – Sleep lab comparison](https://sleep.urbandroid.org/sleep-lab-comparison/)) [V]. Současná stránka dokumentace k LD ale tvrdí, že aplikace identifikuje REM „s vysokou přesností“. Teoretická stránka výrobce přitom přiznává, že „jakýkoli pokus určit přesný začátek spánkové fáze je zatížen vysokou chybou a dohady“ ([SaA theory](https://sleep.urbandroid.org/docs/sleep/sleep_tracking_theory.html)). Údaj „nespouštět první 2 h“ z verze 1 se na současných stránkách nenašel. Uživatelé hlásí podněty v bdělém stavu a nefunkční vibrace na Garminu ([Urbandroid forum](https://forum.urbandroid.org/t/lucid-dreaming-sleep-as-android/4691)) [V].
- **Lucid Scribe** řeší tichý režim a DND přehráváním přes **mediální kanál**, který zní i v tichém a úsporném režimu a udrží aktivní Bluetooth sluchátka ([lucidcode.com](https://www.lucidcode.com/)) [V].

Z publikované evidence (podnět ≈ falešný podnět, ~10–15 % za noc) plyne, že **pevný rozvrh s náběhem hlasitosti a předem naučeným podnětem není zjevně horší než šumové časování ze senzorů**.

**Rozšíření perspektivy.** Instalační lídři na Androidu jsou pořád staré deníkové a RT aplikace (Awoken 1 mil.+, Dream Catcher ~500 tis., Lucidity ~420 tis., LucidMe ~120 tis., DJU ~100 tis.). Na iOS mají přes 1 000 hodnocení v USA jen Oniri, Shape a binaurální BrainWave. Trh tedy nevyhrávají protokoly, ale **deník a návyk**. Opakované stížnosti jsou produktovými příležitostmi:

- podněty budí nebo míjejí REM; po podnětech bylo v Konkoly 2024 významně více pohybu a Deirdre Barrett (Harvard) říká, že aplikace „někdy lidi budí“ ([Vice](https://vice.com/en/article/i-tried-controlling-my-dreams-with-my-iphone-lucid-apps)) [S];
- budíky selhávají a Focus režimy ztlumí denní podněty (Lucyd v1.5);
- nutnost nechat telefon na nabíječce a vybíjení baterie;
- netransparentní paywally (Shape, Oniri);
- opuštěné aplikace, ztráta dat a chybějící export;
- fragmentace platforem;
- chybí zpětná vazba, co funguje právě mně.

AI výklad snů je komoditou bez důkazu „přesnosti“ ([Oniri](https://www.oniri.io/post/best-dream-interpretation-apps)) [S] a v komunitě po něm nikdo nevolá.

**Strategický návrh.** Nejpoctivější nabídkou na trhu by byla aplikace, která:

- implementuje **publikovaný** protokol TLR (parametry Konkoly exp. 2) **a otevřeně přizná, že domácí efekt není replikovaný**;
- má spolehlivý offline-first deník s exportem a zálohou;
- nabízí neomezené, spolehlivé RT připomínky a samovypínací jemné budíky;
- funguje stejně na iOS i Androidu;
- měří osobní efekt technik.

Viditelně aktivní vývoj je na trhu plném zastaralých aplikací konkurenční výhodou sám o sobě.

**Limitace.** Celosvětové počty hodnocení App Store ani odhady stažení a tržeb (AppMagic, Sensor Tower) nebyly dostupné. U Oniri, Shape a Lucidity nelze ze seznamu IAP určit, které ceny jsou aktuální. Způsob, jak Oniri, Lucid Now a Everdream udržují aplikaci na iOS v noci naživu, není zdokumentovaný. Limit relace 270 min u Lucidly a ~50% vybití baterie u Everdream nebyly znovu ověřeny.

---

## Technická proveditelnost: telefon nevidí REM v reálném čase

**Analýza jádra.** Rozhodující omezení je architektonické. **Ani HealthKit, ani Health Connect neposkytují spánkové fáze v reálném čase.** Oficiální dokumentace to podporuje ze tří stran:

- Apple zapisuje plné fáze (Awake, REM, Core, Deep) **jen pro relace s celkovým spánkem nad 3 h**; při 1–3 h jen binární spánek/bdění ([Apple white paper, říjen 2025](https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf)) [V].
- Doručování dat na pozadí z HealthKitu probouzí aplikaci „nejvýše jednou za zvolené období“ a na watchOS má většina typů **maximálně hodinovou frekvenci**. Okamžitě se doručují jen události (vysoký či nízký tep, nepravidelný rytmus, pády apod.), ne spánek ([enableBackgroundDelivery](https://developer.apple.com/documentation/healthkit/hkhealthstore/enablebackgrounddelivery(for:frequency:withcompletion:))) [V].
- Health Connect ukládá spánek jako `SleepSessionRecord` s povinným začátkem a koncem a s volitelnými fázemi včetně REM ([Android Developers](https://developer.android.com/health-and-fitness/health-connect/features/sleep-sessions)) [V]. Záznam vzniká až po skončení relace; to je inference z datového modelu, stránka to doslova neříká.

Inženýr Apple Developer Relations potvrdil, že klasifikátor běží v privátním systémovém procesu ([Apple Developer Forums 804512](https://developer.apple.com/forums/thread/804512)) [A z verze 1; fórum nyní nedostupné]. Totéž hlásí vývojář z komunity: „API nedovolují detekci REM v reálném čase, analyzovat lze jen celá data spánku“ ([Reddit](https://www.reddit.com/r/LucidDreaming/comments/1fb73be/_/lm173hj/)) [S].

**Přesnost spánkových fází z wearables vůči PSG** se výrazně liší podle studie:

| Studie | Návrh | Čtyřfázové κ | Citlivost REM | Poznámka |
|---|---|---|---|---|
| Robbins a kol. 2024 ([PMC11511193](https://pmc.ncbi.nlm.nih.gov/articles/PMC11511193/)) | n = 35, jedna noc, **financováno Oura** | Oura 0,65; Apple Watch 8 0,60; Fitbit Sense 2 0,55 | Apple 82,6 %, Oura 76,0 %, Fitbit 67,3 % | Jediná studie s **přesností REM** (podíl „REM“ označení, která jsou skutečně REM): 73–79 %; shoda celkového REM za noc slabá (ICC 0,27–0,37) |
| Lee a kol. 2023 ([PMC10654909](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC10654909/)) | Multicentrická, 11 zařízení; autoři s akciemi výrobce SleepRoutine | Apple Watch 8 0,30; Oura 3 0,35; Pixel Watch 0,40; Galaxy Watch 5 0,42; Fitbit Sense 2 0,42; Halo Rise 0,48; aplikace Pillow 0,07, SleepScore 0,21 | Nejlepší REM F1 0,76 (SleepRoutine, mikrofon + AI) | Stejná zařízení výrazně hůř než ve studii Oura |
| Schyvens a kol. 2025 ([PMC12038347](https://pmc.ncbi.nlm.nih.gov/articles/PMC12038347/)) | n = 62, i pacienti s podezřením na apnoe | κ 0,21 (Garmin Vivosmart 4) až 0,53 (Apple Watch 8, jen 20 nocí); typ κ nejednoznačný | Apple 68,6 %, Whoop 62 %, Fitbit 60–61 %, **Garmin 33,1 %** | Chyby REM většinou do „lehkého“ spánku |
| Apple white paper 2025 ([PDF](https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf)) | 299 nocí / 166 osob (validace) | medián 0,63 → **0,68** (watchOS 26); klinická kohorta 0,55 | REM **78 % → 82 %** | Přesnost REM neuvádí; algoritmus dál jen z akcelerometru |
| Galaxy Watch 3 ([J Sleep Med 2023](https://www.e-jsm.org/journal/view.php?number=358)) | n = 32 | — | 59,8 % | „Délka REM nebyla spolehlivě odhadnuta“ |
| Telefonní aplikace ([Mazzetti a kol. 2018](https://iris.unimore.it/handle/11380/1205742)) | 4 aplikace (akcelerometr/mikrofon) vs. PSG | — | — | „Neposkytují spolehlivá data o fázích… zejména žádný odhad REM“ |

Bezpečné shrnutí zní: **čtyřfázové κ zhruba 0,2–0,7 podle zařízení a studie a citlivost REM 33–83 %**. Pro LD aplikaci je klíčová **přesnost REM**, ne citlivost, protože podnět vypuštěný v bdění nebo lehkém spánku je zbytečný nebo budí. Hrubý odhad (inference): odhad z telefonu nebo aktigrafie trefí REM zhruba v 50 % případů, dobrý klasifikátor hodinek offline zachytí 60–80 % REM a čelní EEG (ZMax, Waveband) se blíží PSG.

**Ověřená omezení platforem (oficiální dokumentace):**

| Platforma / API | Co dovoluje | Oficiální citace | Důsledek pro LD aplikaci |
|---|---|---|---|
| **App Review 2.5.4** | Služby na pozadí jen k určenému účelu | „Multitasking apps may only use background services for their intended purposes: VoIP, audio playback, location, task completion, local notifications, etc.“ ([Guidelines](https://developer.apple.com/app-store/review/guidelines/)) | Obecná věta; zamítnutí „tichého audia“ je doloženo jen z fór ([GitHub alarm #87](https://github.com/gdelataillade/alarm/discussions/87)) |
| **iOS režim `audio` na pozadí** | Přehrávání slyšitelného obsahu | „The app plays audible content in the background… If an alternative to executing in the background exists, use the alternative instead.“ ([Apple](https://developer.apple.com/documentation/xcode/configuring-background-execution-modes)) | Celonoční **slyšitelná** zvuková kulisa (šum, déšť) s vmíchanými podněty odpovídá; tichá smyčka ne |
| **AlarmKit (iOS 26)** | Plánované budíky, které projdou Focus i tichým režimem; vlastní zvuk z bundlu; tlačítka spouští App Intents (sekundární intent až po prvním odemčení) | „It overrides both a device's focus and silent mode, if necessary.“ „Alarms are a great fit for… a wake-up alarm. They are not a replacement for other prominent notifications.“ ([Apple](https://developer.apple.com/documentation/alarmkit/scheduling-an-alarm-with-alarmkit); [WWDC25 230](https://developer.apple.com/videos/play/wwdc2025/230/)) | Ideální pro **budicí** WBTB alarm (tak to dělá LDAlarm); nevhodné pro jemné podněty (plné UI budíku). Vyžaduje souhlas a `NSAlarmKitUsageDescription`. Tvrzení verze 1, že AlarmKit „neprobudí aplikaci“, v oficiální dokumentaci není |
| **watchOS `WKExtendedRuntimeSession`** | Self care: v popředí, 10 min. Mindfulness: v popředí, 1 h. Physical therapy: na pozadí, 1 h. **Smart alarm: na pozadí, plánovatelné až 36 h dopředu, 30 min** | „Each app can only support one type of extended runtime session.“ „You can only schedule one session at a time.“ „Your app must trigger the alarm by calling… notifyUser(hapticType:…)“ ([Apple](https://developer.apple.com/documentation/watchkit/using-extended-runtime-sessions)) | Jedno 30min okno za noc pro klasifikátor a haptiku; celonoční běh by vyžadoval jiný mechanismus (např. workout session) s rizikem při App Review a pro baterii. Jak běží Lucidly (270 min) nebo plánovaná watchOS verze Lucid Wake, dokumentace nevysvětluje |
| **HealthKit 2.5.1** | HealthKit jen pro zdraví a fitness s integrací do aplikace Zdraví | „HealthKit should be used for health and fitness purposes and integrate with the Health app.“ ([Guidelines](https://developer.apple.com/app-store/review/guidelines/)) | Čtení historie spánku pro personalizaci je legitimní |
| **Android 14 `SCHEDULE_EXACT_ALARM`** | Pro nové instalace s cílovým API 33+ ve výchozím stavu zamítnuto | „…will be set to denied by default“ ([Android Developers](https://developer.android.com/about/versions/14/changes/schedule-exact-alarms)) | Vyžádat od uživatele s vysvětlením; `setExact()` s `OnAlarmListener` povolení nepotřebuje |
| **Google Play `USE_EXACT_ALARM`** | Omezené povolení jen pro aplikace budíku, časovače a kalendáře | „Apps that request this restricted permission are subject to review… disallowed from publishing on Google Play.“ ([Play Console Help](https://support.google.com/googleplay/android-developer/answer/9888170?hl=en)) | LD aplikace by se musela obhájit jako budík; bezpečnější je `SCHEDULE_EXACT_ALARM` |
| **Android FGS `mediaPlayback`** | Bez runtime předpokladů, pokračování přehrávání na pozadí | Play: „Playback must be user-initiated“; pro Android 14+ deklarace typů FGS **s odkazem na video** ([Play](https://support.google.com/googleplay/android-developer/answer/13392821?hl=en); [typy FGS](https://developer.android.com/develop/background-work/services/fgs/service-types)) | Uživatelem spuštěná celonoční zvuková kulisa s podněty; limit 6 h za 24 h platí pro `dataSync` a `mediaProcessing`, ne pro `mediaPlayback` ([timeouty](https://developer.android.com/develop/background-work/services/fgs/timeout)) |
| **Android FGS `health`** | Vyžaduje povolení tělesných senzorů nebo rozpoznávání aktivity; na pozadí `BODY_SENSORS_BACKGROUND` / `READ_HEALTH_DATA_IN_BACKGROUND` | Popis: dlouhodobé fitness případy „jako trackery cvičení“ ([Android](https://developer.android.com/develop/background-work/services/fgs/service-types)) | Celonoční snímání akcelerometru je hraniční vůči deklarovanému účelu |
| **Wear OS Health Services** | Pasivní data v dávkách; ExerciseClient se zhasnutým displejem doručuje zhruba každých 150 s | „MeasureClient… not intended for background capture“ ([Android](https://developer.android.com/health-and-fitness/health-services/active-data)) | Noční „cvičení“ pro streamování tepu by zneužívalo API |
| **Samsung Health Sensor SDK** | Surový PPG, EKG, akcelerometr a tep s intervaly mezi údery (IBI) bez probouzení CPU | „…works only with the developer mode turned on“ bez **partnerského schválení** ([Samsung](https://developer.samsung.com/health/sensor/process.html)) | Nejlepší cesta k surovému HRV na Galaxy Watch, ale distribuce vyžaduje partnerství |

**Architektura ve vrstvách (inference z podkladů):**

| Vrstva | Co dělá | Výhody | Rizika a omezení |
|---|---|---|---|
| **0. Bez senzorů** (parametry Konkoly 2024) | Předspánkový trénink, WBTB budík, časované podněty v pozdním okně, kalibrace prahu, tlačítko „probudilo mě to“ | Funguje všude; jediný publikovaný protokol | iOS: slyšitelná kulisa po celou noc; Android: FGS `mediaPlayback` a deklarace s videem; baterie |
| **1. Telefon jako senzor** | Akcelerometr na matraci jako pojistka pauzy (ne jako detektor REM) | Bez dalšího hardwaru; přesně to dělal Konkoly | Detekce REM z telefonu je nespolehlivá; mikrofon vyvolává otázky soukromí |
| **2. Apple Watch / Wear OS** | Haptický podnět; vlastní klasifikátor z HR/HRV a pohybu | Haptika je jemná; přesnější časování | watchOS: jedno 30min okno na pozadí; Wear OS: dávkování dat; Samsung SDK vyžaduje partnerství |
| **3. Historická data** (HealthKit, Health Connect) | Personalizace okna podnětů a času WBTB podle minulých nocí | Levné, legitimní | Jen zpětně; stádia jen pro relace nad 3 h |
| **4. EEG / kamera „pro“** (ZMax/Dreamento, INSPEC) | Detekce REM blízká výzkumné kvalitě, signál LRLR | Validace SVLD | Cena, dostupnost SDK [NEOV] |

**Rozšíření perspektivy.** MC v2 ukazuje, že **přesné zasažení REM není kritické**: podnět vyšel podobně jako falešný podnět, a navíc zkracoval REM a snižoval efektivitu spánku. Investice do drahé detekce REM je proto pro MVP špatná priorita. Vyplatí se investovat do **neprobouzení**, stížnosti číslo jedna, a do kalibrace podle zpětné vazby. Benchmarkem pro jakákoli tvrzení o „detekci lucidity“ je i expertní laboratoř: u zkušených praktikujících jógy snů zachytila PSG jen 15 z 20 vědomých signálů (75 %) ([Torres Platas a kol., PDF](https://bpb-us-e1.wpmucdn.com/sites.northwestern.edu/dist/4/2492/files/2026/07/DYX_PsychSci_R17_unblinded.pdf)) [V, nerecenzováno].

**Strategický návrh.** MVP postavit na vrstvách 0, 1 (jen pauza při pohybu) a 3. Na iOS budicí WBTB přes AlarmKit a jemné podněty vmíchané do uživatelem spuštěné slyšitelné zvukové kulisy. Na Androidu FGS `mediaPlayback` a `SCHEDULE_EXACT_ALARM` udělené uživatelem. Haptiku Apple Watch ve vrstvě 2 přidat ve verzi 2 v rámci 30min okna smart alarm, naplánovaného na konec noci. Vrstvu 4 nechat experimentální.

**Limitace.** Fóra Apple nebyla znovu dostupná. Oficiální zákaz tichého audia neexistuje, jen obecné pravidlo. Omezení Doze a App Standby pro `setExactAndAllowWhileIdle` nebyla znovu ověřena. Oficiální dokument o legitimitě celonočního běhu na watchOS (`HKWorkoutSession`) neexistuje. Validace telefonního akcelerometru na matraci pro REM se nenašla.

---
## Tibetská jóga snů a spánku: lucidita jako prostředek, ne cíl

**Analýza jádra.** Jóga snů (tib. *rmi lam*, *milam*) je tantrická praxe všech hlavních tibetských škol i bönu. Nejlépe zdokumentované jsou tři systémy:

- **Šest dharm Náropy** (kagjü a přes Congkhapův komentář i gelug). Jóga snů je zde třetí z šesti provázaných praxí: vnitřní teplo *tummo*, iluzorní tělo, sen, jasné světlo, *phowa* a bardo. „Rozpoznání“ snu se podle tohoto systému rodí z práce s energií (*prána*) v centrálním kanálu ([Wisdomlib](https://www.wisdomlib.org/buddhism/book/the-six-yogas-of-naropa/d/doc1460908.html); [Encyclopedia of Buddhism](https://www.encyclopediaofbuddhism.org/wiki/Six_Yogas_of_Naropa)) [A].
- **Dzogčhen** (Namkhai Norbu, *Dream Yoga and the Practice of Natural Light*). Vědomí ve snu zde „vyvstává přirozeně z praxe přirozeného světla“ [A].
- **Bön** (Tenzin Wangyal Rinpočhe, *The Tibetan Yogas of Dream and Sleep*, 1998, revize 2022). Kniha obsahuje „jasně ilustrované tibetské slabiky a místa, kde se mají vizualizovat“ ([Shambhala](https://www.shambhala.com/the-tibetan-yogas-of-dream-and-sleep.html)) [V].

**Cíle se zásadně liší od západního LD.** Tradice usiluje o rozpoznání všech zážitků, bdělých i snových, jako iluzorních, o snížení lpění a averze a o přípravu na smrt a bardo. **Jóga spánku** míří k rozpoznání jasného světla (*ösel*) v bezesném spánku. Podle Andrewa Holecka se LD stává „super-samsárou, pokud se oddáváte fantaziím“ ([Lion's Roar](https://www.lionsroar.com/dream-yoga/)) [A].

**Čtyři základní praxe (Wangyal)** tvoří hotovou denní a noční strukturu ([obsah knihy](https://www.stillnessspeaks.com/wp-content/uploads/2022/10/TOC-DRC-Tibetan-Yogas-of-Dream-and-Sleep_SH.pdf); [kurz Shambhala](https://www.shambhala.com/courses/the-tibetan-yogas-of-dream-and-sleep/)) [A]:

1. **Změna karmických stop:** během dne opakovaně rozpoznávat, že smyslová zkušenost je jako sen.
2. **Odstranění lpění a averze:** všímat si emočních reakcí a vnímat je i jejich objekty jako snové.
3. **Posílení záměru:** večer zrekapitulovat den jako sen a pevně se rozhodnout sen rozpoznat.
4. **Pěstování paměti a radostného úsilí:** ráno zrekapitulovat sny, radovat se z úspěchu a bez sebekritiky obnovit záměr.

**Sekvence před spaním (Wangyal):** ležet na pravém boku, pokud je to pohodlné, uvolnit tělo, hlavně hrdlo, a vizualizovat sytě rudý zářící lotos v hrdelní čakře. Obrazy pak postupně pustit a usnout ([Lion's Roar, Wangyal](https://www.lionsroar.com/is-this-a-dream/)) [A, autorův vlastní článek]. Podle sekundárních citací z knihy pomáhá **vysoký polštář**, protože „udržuje spánek lehký a vytváří víc lucidity ve snech“. Zmiňována je i praxe, kdy se člověk zhruba 4 h po usnutí posadí s překříženýma nohama opřený o polštáře, po počítání dechů ([Dream Studies Portal](https://dreamstudies.org/the-secret-posture-for-triggering-wake-initiated-lucid-dreams-and-out-of-body-experiences/)) [S]. Norbu místo lotosu používá bílou slabiku „A“ (zvuk „Ááá“); zda ve středu těla nebo v hrdle, se mezi zdroji liší [NEOV]. **Ve snu** se praktikuje rozpoznání, transformace, multiplikace, emanace a **čelení strachu** („vztahujte se ke strachu místo útěku“).

**Výzkum.** Meditace s LD koreluje slabě a kauzálně nepůsobí:

- 38 dlouhodobých meditujících (medián 10 let praxe, 5,9 h týdně) mělo 1,11 LD měsíčně oproti 0,45 u 140 nemeditujících (p = 0,01). Častí lucidní snílci mezi meditujícími pocházeli z různých tradic (4 théraváda, 3 tibetská, 2 zen, 1 vipassana) bez rozdílu mezi nimi. Randomizovaný 9týdenní program MBSR ani aktivní kontrola frekvenci LD nezvýšily ani po ~6 měsících ([Baird a kol. 2019, PMC6490164](https://pmc.ncbi.nlm.nih.gov/articles/PMC6490164/)) [V].
- Systematický přehled 2025 (555 studií prověřeno, 3 zařazeny se 6 podstudiemi) hodnotí vztah všímavosti a LD jako **neprůkazný** ([Balt a kol. 2025, U Twente](https://research.utwente.nl/en/publications/the-relationship-between-mindfulness-and-lucid-dreaming-a-systema/)) [A].

Od roku 2024 se jóga snů dostává do spánkových laboratoří:

- **Reaktivace všímavosti** (počítání dechů s hudebními podněty, WBTB po ~5 h, podněty v REM): **2 z 5 SVLD** ([Wolk a kol. 2024, IJoDR, PDF](https://faculty.wcas.northwestern.edu/~paller/IJDR2024.pdf)) [V, PRE].
- **Podnět k vizualizaci Čenreziga** (Avalókitéšvara) v REM, 5 účastníků × 7 nocí s PSG: 2 z 5 nahlásili LD, ale **žádný nebyl ověřen signálem**. Častý lucidní snílec bez tibetského výcviku měl po podnětu LD s vizualizací Čenreziga, ale nesignalizoval. Mnich bez předchozího LD měl svůj první LD **až noc po laboratorním sezení, doma a bez podnětů** ([Morris a kol. 2026, Brain Sciences, PMC13023924](https://pmc.ncbi.nlm.nih.gov/articles/PMC13023924/)) [V, PRE]. Nelze to tedy citovat jako laboratorní úspěch u mnicha.
- **Šest zkušených praktikujících** v 19 nocích s PSG (84 REM období, buzení ~4 h po usnutí ke kontemplativní praxi): **21 epizod lucidního uvědomění, z toho 7 objektivně ověřených**. Z 20 hlášených vědomých signálů jich PSG zachytila 15 (75 %). Studie nebyla preregistrovaná ([Torres Platas a kol., PDF](https://bpb-us-e1.wpmucdn.com/sites.northwestern.edu/dist/4/2492/files/2026/07/DYX_PsychSci_R17_unblinded.pdf)) [V, nerecenzováno].
- **NCT07217340** (Northwestern/UVA, PI Ken Paller) je **dokončená** (n = 25, výsledky nezveřejněny). Testovala proveditelnost skupinové intervence inspirované jógou snů (řízená imaginace, meditace, praxe LD, 2 VR sezení, podněty z wearable) proti programu spánkové hygieny. Primárními výstupy jsou retence, přijatelnost a snášenlivost VR, frekvence LD je sekundární ([ClinicalTrials.gov](https://clinicaltrials.gov/study/NCT07217340)) [V].
- **NCT07408206** **nabírá** (cíl 70, primární dokončení odhadem 31. 10. 2027). Primárními výstupy jsou **frontální midline theta a architektura spánku**, frekvence LD je sekundární ([ClinicalTrials.gov](https://clinicaltrials.gov/study/NCT07408206)) [V]. Ani jedna studie tedy netestuje účinnost na LD jako primární cíl.
- Nejbližším empirickým analogem „lucidního spánku“ je „svědčení“ (*witnessing*) v hlubokém spánku u dlouholetých praktikujících TM: víc theta/alfa spolu s deltou a snížené EMG (n = 11 vs. 9 vs. 11) ([Mason a kol. 1997, MIU](https://research.miu.edu/center-for-brain-consciousness-and-cognition/eeg-markers-during-sleep/)) [A, propagační zdroj].

**Mapování na mechanismy LD:**

| Prvek jógy snů | Odpovídající mechanismus LD | Síla důkazů pro LD | Adaptace v aplikaci |
|---|---|---|---|
| Denní „toto je jako sen“ (praxe 1, iluzorní tělo) | Test reality, návyk kritického zkoumání stavu | RT samotné slabé, s MILD možná kontraproduktivní; verze jógy snů netestována | 20–60 s řízené rozpoznání, volitelně spárované s RT |
| Odstranění lpění a averze (praxe 2) | Emoční decentrace, meta-uvědomění | Slabá korelace (decentrace a meta-uvědomění predikují LD, R² ≈ 0,10) | Rychlý záznam reakcí a jejich přerámování |
| Posílení záměru večer (praxe 3) | Prospektivní paměť (MILD), implementační záměr | MILD = E; tibetská verze netestována | 3–5 min audio: den jako sen + záměr ve formátu „když–pak“ |
| Ranní paměť a radostné úsilí (praxe 4) | Vybavování snů, deník, motivace | Vybavování ↔ LD (r = 0,44) | Deník se soucitnou zpětnou vazbou, bez trestání přerušených sérií |
| Noční probuzení s praxí (~4 h) | WBTB | WBTB v kombinaci = E; laboratoř jógy snů budila ~4 h po usnutí | Volitelné, max. 1–3× týdně |
| Rudý lotos / „A“ v hrdle; zvuk „Ááá“ | Kotva pozornosti při usínání (WILD); kandidát na TLR podnět | Přímo netestováno; nejblíže piloty Wolk (2/5 SVLD) a Morris (0 SVLD) | Volitelná obrazová a zvuková kotva, zároveň TLR zvuk |
| Vysoký polštář, poloha vsedě ~4 h po usnutí | Lehčí spánek, více přechodů bdění → REM | Mechanismus věrohodný (Gott 2020); přímo netestováno | Volitelná „pokročilá“ instrukce s varováním před fragmentací |
| Devět očistných dechů, poloha vleže | Relaxace, usínání | Pro LD žádná data | Volitelný rituál zklidnění |
| Dlouhodobá meditace (šamatha, otevřené uvědomění) | Trénink meta-uvědomění | Průřezově slabě pozitivní; MBSR nulový; VR + otevřené monitorování RR 4,00 (malé) | Dlouhodobá „pokročilá“ stopa |
| Ve snu: transformace, multiplikace, čelení strachu | Kontrola snu; expozice nočním můrám | Trénovaní to v laboratoři dokážou (Torres Platas) | „Mise“ po dosažení lucidity s důrazem na vyrovnanost |
| Jóga spánku / jasné světlo | „Lucidní NREM“, svědčení | Jen EEG u TM; u tibetské praxe netestováno | Dlouhodobý cíl, nikoli metrika |

**Rozšíření perspektivy.** Odstraněním kontextu se mechanismus mění. V systému Náropy a Congkhapy se „rozpoznání“ rodí z práce s pránou. Vizualizace čaker a slabik jsou zasazeny do zmocnění (*empowerment*), guru jógy a božstev; vytržené z tohoto rámce se stávají pouhými kotvami pozornosti. Bez nauky o prázdnotě a přípravě na smrt se „toto je sen“ redukuje na test reality. Bönské a dzogčhenové podání (Wangyal, Norbu) je nejpřenosnější, protože stojí na uvědomění, záměru a jednoduché vizualizaci. Wangyal i Norbu své instrukce publikovali v knihách, takže je lze považovat za veřejně učitelné; jde o inferenci, ne o citovaný postoj linie.

Specifické riziko: denní praxe „nic není skutečné“ může u zranitelných lidí zhoršit derealizaci. Rozhovorová studie identifikovala **59 kategorií náročných zážitků z meditace** ([Lindahl a kol. 2017, PMC5443484](https://pmc.ncbi.nlm.nih.gov/articles/PMC5443484)) [A].

Jóga snů zato přináší čtyři věci, které západní LD postrádá:

1. **kontinuitu dne a noci**, tedy důvod praktikovat i ve dne;
2. **kurikulum pro dobu po dosažení lucidity** (stabilizovat, pozorovat, transformovat, čelit strachu, pustit), což je důležité, protože kontrola je vzácná (29 %);
3. nepatologizující, soucitný přístup k nočním můrám;
4. dlouhodobou pokročilou stopu pro angažované uživatele.

Tato hlubší rovina má i praktický smysl: cílem není maximalizovat počet LD, ale vztah k obsahu mysli. Pro část uživatelů to je silnější a udržitelnější motivace než gamifikace.

**Strategický návrh.** Nabídnout dvě stopy s různými metrikami úspěchu:

- **Západní LD stopa** měří počet LD a kontrolu.
- **Stopa inspirovaná jógou snů** měří rozpoznání bez kontroly, vyrovnanost vůči obsahu, čelení strachu a přenos „snového náhledu“ do dne.

Obsah formulovat jako „inspirováno tibetskou buddhistickou a bönskou jógou snů“ a jmenovat zdroje (Wangyal, Norbu, Holecek, Morley). Ve volné a sekulární stopě vynechat vizualizace božstev, guru jógu a tantrické instrukce, které vyžadují zmocnění, a neimplikovat předání (transmisi). Zvážit partnerství s linií (např. Ligmincha, která provozuje online kurzy). Testovatelná hypotéza pro aplikaci: meditační kotvu (počítání dechů nebo „Ááá“) trénovat ve dne a před spaním jako asociaci pro TLR a přehrávat ji po WBTB. Spojuje to nejbližší existující pilot (Wolk 2024) s obsahem jógy snů.

**Limitace.** Wangyalova noční struktura (sezení zhruba každé 2 h, sled bodů v hrdle, na čele, v srdci a v tajné čakře) a pravidlo polohy podle pohlaví (muži na pravém, ženy na levém boku) zůstávají **neověřené** [NEOV]. Kniha byla dostupná jen jako výpůjčka s omezeným přístupem a neautorizované kopie nebyly použity. Před použitím je nutné je zkontrolovat ve fyzické knize (Snow Lion 1998 / Shambhala 2022) nebo v materiálech Ligmincha.

---

## Rizika: hlavním nebezpečím je narušený spánek a neúspěšné pokusy, ne sen

**Analýza jádra.** Samotné LD je převážně benigní. U 489 respondentů frekvence LD nesouvisela s celkovou kvalitou spánku ani s disociací a jen ~10 % LD mělo negativní ladění. **Vyšší frekvence LD ale souvisela s více poruchami spánku** (a zároveň s lepší subjektivní kvalitou spánku) a **s vyšší derealizací** (a méně poruchami paměti). Podíl záměrně navozených LD souvisel s vyšší pohodou ([Stumbrys 2023, PsyPost](https://www.psypost.org/can-lucid-dreaming-be-dangerous-new-research-suggests-lucid-dreaming-is-generally-a-safe-and-positive-experience/); doi:10.1037/cns0000288) [S/A]. V ILDIS byla kvalita spánku v LD nocích dokonce mírně vyšší (3,6 vs. 3,4), ale autor sám píše, že neúspěšné pokusy ji „mohly zhoršit“ a že jde o sebehodnocení ([ILDIS](https://pmc.ncbi.nlm.nih.gov/articles/PMC7379166/)) [V]. V MC v2 podněty objektivně zkrátily REM a snížily efektivitu spánku [V, PRE].

**Rizika leží ve způsobu indukce:**

- **Fragmentace spánku.** Opakovaná probuzení, budíky, WBTB a podněty spánek „fragmentují, mění jeho architekturu a zkracují ho“ ([Vallat & Ruby 2019, PMC6874013](https://pmc.ncbi.nlm.nih.gov/articles/PMC6874013/)) [V]. Soffer-Dudek varuje před narušenou kvalitou spánku a „narušenou hranicí reality a fantazie“ ([Soffer-Dudek 2020, PMC6993576](https://pmc.ncbi.nlm.nih.gov/articles/PMC6993576/)) [V]. **Oprava verze 1:** obě práce jsou názorové a perspektivní články. Podporují „teoretickou obavu“, ne empiricky naměřený vztah dávka–účinek, takže formulace „škáluje s frekvencí“ je nepodložená.
- **Disociace a schizotypie.** U vysokoškoláků (N = 187, sledování n = 78) frekvence záměrně navozených LD predikovala během 2 měsíců nárůst disociace (β = 0,26) včetně depersonalizace (β = 0,25) a nárůst schizotypie (β = 0,14). U spontánních LD se tento efekt neobjevil. Frekvence LD sama s psychopatologií nesouvisela a intenzita LD a pozitivní emoce v nich s ní souvisely inverzně ([Aviram & Soffer-Dudek 2018, PMC5875414](https://pmc.ncbi.nlm.nih.gov/articles/PMC5875414/)) [V, PRE].
- **Neúspěšné pokusy.** Analýza 400 příspěvků z r/LucidDreaming ukázala, že negativní zážitky (spánková paralýza, neklid) se pojí s **neúspěšnými pokusy**, ne s LD samotným, a že úspěšná indukce LD s vysokou kontrolou „představuje nízké riziko“ ([Mallett a kol. 2022, PMC10104404](https://pmc.ncbi.nlm.nih.gov/articles/PMC10104404/)) [V].
- **Lucidní noční můry**, tedy vědomí snu bez kontroly nad ním. Novější primární zdroj o jejich faktorech a zvládání: [Löhner, Schredl & Göritz 2025, doi:10.1037/drm0000316](https://doi.org/10.1037/drm0000316) [A, jen název]. Oprava verze 1: citace „Stumbrys 2018“ odkazovala na jinou práci (Drinkwater 2020).
- **„Uvíznutí ve snu“** je mýtus. Řetězce falešných probuzení jsou reálné a nepříjemné, ale vždy skončí ([Sleep Foundation](https://www.sleepfoundation.org/dreams/false-awakening)) [S].
- **Galantaminové doplňky:** nespolehlivý obsah a kontaminace (JAMA 2024, viz sekce o látkách).

**Skupiny k vyloučení nebo opatrnosti:**

| Skupina | Důvod | Opatření v aplikaci |
|---|---|---|
| Psychóza, vysoká schizotypie, disociativní poruchy | Předběžný longitudinální signál škody; stírání hranice reality | Měkké vyloučení indukce, jen vybavování a relaxace |
| Bipolární porucha | Spánková deprivace může spustit mánii [NEOV, obecná klinická znalost] | Bez WBTB a nočních podnětů |
| Těžká insomnie | WBTB odporuje principům CBT-I [NEOV] | Bez WBTB; MILD jen při přirozeném probuzení |
| PTSD s nočními můrami | Pozitivní RCT použila 22h řízený workshop, ne svépomoc | Modul IRT + doporučení odborníka |
| Narkolepsie, porucha spánkové paralýzy | Nestabilní REM; WILD může zvýšit epizody paralýzy; existuje řízená telemedicínská RCT (NCT07609537) | Bez WILD; jen pod dohledem |
| Epilepsie / fotosenzitivita | Blikající světelné podněty [NEOV] | Žádné záblesky ve výchozím stavu |
| Těhotné, dospívající, směnoví pracovníci, řidiči | Bezpečnostní riziko spánkového dluhu | Přísný režim bez probouzení |
| Uživatelé galantaminu či doplňků | Lék na předpis, interakce, kontaminované doplňky | Jen informace „poraďte se s lékařem“ |

**Rozšíření perspektivy.** Riziko neleží jen na straně uživatele, ale i v designu produktu. Gamifikace, která odměňuje noci s WBTB nebo počet budíků, přímo vytváří expozici hlavnímu riziku. Přínos se váže na úspěšnou indukci a kontrolu, škoda na neúspěch a narušený spánek. Aplikace, která **zvyšuje podíl úspěšných pokusů a zároveň omezuje jejich počet**, zlepšuje obojí. Signál ze Stumbrys 2023 (více poruch spánku a derealizace) spolu s Aviram & Soffer-Dudek ukazuje, že průběžná kontrola derealizace není přehnaná opatrnost.

**Strategický návrh: bezpečnostní design „sleep-first“.**

1. Screening při onboardingu (psychóza a disociace v anamnéze, bipolární porucha, epilepsie, těžká insomnie, PTSD, narkolepsie, léky) s přiřazením bezpečnostní úrovně.
2. Limit WBTB na 1–3 noci týdně, max. jedno plánované probuzení za noc, ideálně o víkendu.
3. Týdenní kontrola spánku a denní ospalosti (1–2 položky nebo data z wearable) s automatickým snížením intenzity nebo „týdnem odpočinku“.
4. Pravidelná krátká kontrola derealizace a depersonalizace (adaptace CDS-2 nebo DES-II; validovaný LD screener neexistuje [NEOV]), s pozastavením indukce při nárůstu a s krizovými kontakty.
5. Strop hlasitosti podnětu a jemný režim podle Konkoly exp. 2; po hlášeném probuzení konec podnětů na noc.
6. Žádné poradenství k lékům a doplňkům.
7. Ve výchozím stavu zvuk a vibrace, ne světelné záblesky.
8. Normalizace spánkové paralýzy a instrukce, jak ji zvládnout (uvolnit se, nebojovat, pohnout prstem). Strategie „únikových cest ze snu“ označit jako anekdotické.
9. U denní praxe „jako sen“ formulace „zážitky jsou *jako* sen“ (tradiční znění) místo „nic není skutečné“ a možnost uzemnění (*grounding*).

**Limitace.** Neexistují data o nežádoucích účincích komerčních LD aplikací ani o „závislosti na LD“. Rizikové studie jsou malé a převážně studentské. Klinické předpoklady (bipolární porucha, CBT-I, fotosenzitivita) nebyly v této verzi ověřeny v LD literatuře.

---

## Další užitečné poznatky: terapie, přínosy, měření, komunita a historie

**Terapeutické využití.** Nejlépe prozkoumané jsou **noční můry**. Preregistrovaná RCT u PTSD (Yount a kol. 2025, *European Journal of Trauma & Dissociation*) srovnala 22hodinový online LD workshop během šesti dnů (n = 49) s čekací listinou (n = 50). Symptomy PTSD (PCL-5) klesly o 22,7 vs. 8,8 bodu v den 6 (d = 0,57) a o 25,8 vs. 9,6 v den 28 (d = 0,81). Distres z nočních můr klesl v den 28 (d = 0,78), v den 6 ještě ne (p = 0,07). **Aspoň jeden LD ale mělo zhruba stejně účastníků v intervenci i v kontrole** a výskyt LD se zlepšením nekoreloval. LD se hodnotily jen sebehodnocením bez PSG, chyběla část dat a studii financovala John Sperling Foundation v Institute of Noetic Sciences ([VU repozitář, PDF](https://epublications.vu.lt/object/elaba:225950437/225950437.pdf); [IONS](https://noetic.org/publication/decreased-ptsd-symptoms-following-a-lucid-dreaming-workshop-a-randomized-controlled-study/)) [V]. Spolu se Spoormaker 2006 a Holzinger 2020 to ukazuje, že aktivní složkou je pravděpodobně **expozice, zvládnutí a imaginace ve stylu IRT, ne lucidita**. Narativní přehled Tzioridou a kol. 2025 (spoluautoři Soffer-Dudek, Stumbrys, Torres-Platas, Dresler) pokrývá noční můry, depresi, úzkost, psychózu, disociaci, jógu snů a rizika ([PubMed 39818345](https://pubmed.ncbi.nlm.nih.gov/39818345/)) [A]; závěr, že LDT nepřekonává IRT, nebyl z plného textu ověřen. **Narkolepsie:** dokončená RCT (n = 98) spojila šest 90min telemedicínských sezení CBT pro narkolepsii s LD tréninkem, kontrolou imaginace a IRT. Primárním výstupem jsou hypnagogické halucinace a spánková paralýza. Výsledky zatím nejsou zveřejněné a registrace proběhla zpětně ([NCT07609537](https://clinicaltrials.gov/study/NCT07609537)) [V].

**Další přínosy.**

- **Motorický nácvik:** v online experimentu s 68 účastníky zlepšily finger-tapping všechny tři nácvičné skupiny včetně nácviku v LD, kontrola ne; subjektivní kvalita spánku se nezhoršila ([Stumbrys 2016, PubMed 25846062](https://pubmed.ncbi.nlm.nih.gov/25846062/)) [A].
- **Čas ve snu:** úkoly v LD trvají déle než v bdění. Počítání o 27,2 %, chůze o 52,5 % a gymnastická sestava o 23,2 %; „1,5×“ z verze 1 platí jen pro chůzi ([Erlacher 2014, PMC3893623](https://pmc.ncbi.nlm.nih.gov/articles/PMC3893623/)) [V].
- **Obousměrná komunikace se snícími** je reálná, ale s nízkou propustností: 18,4 % správných odpovědí, 29 správných od 6 z 36 účastníků ([Konkoly 2021, PMC8162929](https://pmc.ncbi.nlm.nih.gov/articles/PMC8162929/)) [V].
- **Emoce:** LD v datech uživatelů Oniri nesly pozitivnější emoce ([Genc 2025](https://archive-ouverte.unige.ch/unige:190406)) [A]. Kreativita a nálada mají data na úrovni korelací a pilotů.

**Měření lucidity.** Lucidita a kontrola jsou odlišné dimenze a korelují jen částečně. Škála LuCiD má 28 položek a 8 faktorů: náhled, kontrola, myšlení, realismus, paměť, disociace, negativní a pozitivní emoce ([Voss 2013, doi:10.1016/j.concog.2012.11.001](https://doi.org/10.1016/j.concog.2012.11.001)) [NEOV v této verzi]. Konkoly 2024 použil v aplikaci 5 položek náhledu z LuCiD [V]. Nově existuje 36položkový Lucid Dream Control Questionnaire ([PsyArXiv](https://doi.org/10.31234/osf.io/p7su6_v1)) a v laboratoři se používá DLQ-7 (Dream Lucidity Questionnaire) [A]. Pro aplikaci to znamená zaznamenávat luciditu a kontrolu odděleně a ověřovat luciditu předem plánovanou akcí ve snu. Užitečná kalibrace: v MC v2 hlásilo 15,3 % lidí podněty, které nikdy nezazněly, takže sebehlášení „slyšel jsem podnět“ je samo o sobě nespolehlivé.

**Komunita a kurzy.** r/LucidDreaming měl ~419 tis. členů k 28. 10. 2021 ([Mallett, PMC10104404](https://pmc.ncbi.nlm.nih.gov/articles/PMC10104404/)) [V]. Největší LD server na Discordu, Dream Café, má ~40,5 tis. členů a gamifikovaný Project Icarus ukazuje poptávku po struktuře a odpovědnosti ([Discord](https://discord.com/servers/project-icarus-1250299699043504188)) [S z verze 1]. Na LD4all se v roce 2026 objevuje „stack“ WBTB + kognitivní trénink + REM podnět s explicitním odkazem na TLR ([LD4all](https://community.ld4all.com/t/the-big-lucid-dreaming-stack-topic/79872)) [V]. Komunita tedy laboratorní protokol přebírá. Trh kurzů je malý a roztříštěný: Lucid Dreaming Fast Track za 67 USD ([WoLD Academy](https://academy.world-of-lucid-dreaming.com/checkout)), workshopy Charlieho Morleyho za 195–275 GBP ([Meetup](https://www.meetup.com/charlie_morley_lucid_dreaming/events/314039741/)) a program Andrewa Holecka za 147 USD ([Sounds True](https://www.soundstrue.com/products/the-lucid-dreaming-training-program)) [S z verze 1; v této verzi neověřeno]. Žádná z klasických autorit neprovozuje moderní adaptivní online program. Odhad trhu LD zařízení ~113,7 mil. USD (2023) pochází z placené analýzy, ne z nezávislých dat ([GlobeNewswire/TMR](https://www.globenewswire.com/de/news-release/2024/12/04/2991574/32656/en/Lucid-Dreaming-Devices-Market-to-Surpass-US-196-8-Million-by-2034-Fueled-by-Rising-Consciousness-and-Therapeutic-Applications-Transparency-Market-Research.html)) [S].

**Historie jako narativ.** Aristotelés popisuje vědomí, že „to, co se ukazuje, je jen sen“. Augustin v roce 415 popisuje sny lékaře Gennadia. Marquis d'Hervey de Saint-Denys vydal roku 1867 záznamy z 32 let pozorování, Frederik van Eeden roku 1913 zavedl termín „lucid dream“ a Celia Green roku 1968 předpověděla souvislost s REM ([Lucidity Letter](https://journals.macewan.ca/lucidity/article/download/807/747/2330); [CRI](https://www.equip.org/articles/consciously-dreaming-a-look-at-lucid-dreams/)) [S]. Spor o prvenství je vhodné podat neutrálně: Hearne s Worsleyem byli první (1975), LaBerge publikoval nezávisle a v hlavním proudu. 12. duben je „Lucid Dreaming Day“.

---
## Důsledky pro vývoj aplikace

Tato sekce je psaná jako zadání pro vývojářského agenta. Zásady: **spánek na prvním místě, vybavování snů na prvním místě, jádro MILD/SSILD po WBTB, TLR jako volitelný zesilovač s publikovanými parametry, bezpečnostní brány, poctivé hodnocení důkazů a osobní měření.**

### 1. Pozice produktu a core loop

**Pozice:** „Vědecky poctivý trenér lucidního snění, který chrání váš spánek a učí se, co funguje právě vám.“ Od konkurence ho odliší:

- transparentní odznak důkazů u každé techniky;
- osobní experimenty (mikrorandomizace);
- protokol TLR s publikovanými parametry na obou platformách;
- spolehlivost (budíky, zálohy);
- soukromí (zpracování v zařízení).

**Denní smyčka (core loop):**

1. **Den (1–3 min celkem):** volitelně 1–4 vědomé RT spouštěné událostmi a personalizovanými znaky snů. RT ve výchozím stavu nekombinovat s cestou MILD, protože data ILDIS naznačují spíš negativní efekt; nabídnout ho jako experiment. Pro stopu jógy snů volitelně „toto je jako sen“.
2. **Večer (5–22 min):** rekapitulace dne, záměr vybavit si sny nebo záměr MILD ve formátu „když–pak“, volitelně TLR trénink (~20 min podle Konkoly) nebo zkrácená verze. Při první TLR noci test prahu slyšitelnosti a rozlišení.
3. **Noc:**
   - (a) v noc s WBTB (max. 1–3× týdně) budík 5 h po skutečném usnutí, rychlý zápis snu, MILD (≥ 10 min) nebo SSILD (~5–7 min) s audio průvodcem a cíl usnout do 10 min;
   - (b) volitelně TLR podněty od 6 h po skončení tréninku s náběhem od prahu, stropem a pauzou při pohybu;
   - (c) volitelně samovypínací jemné budíky (komunitní požadavek č. 1).
4. **Ráno (1–2 min):** výzva „nehýbej se, přehraj si sen“, hlasový záznam, check-in (vybavení ano/ne, včetně „nic jsem si nevybavil“; lucidita 0–4; kontrola 0–4; provedena plánovaná akce ano/ne; probudil mě podnět ano/ne/nevím; kvalita spánku 1–5) a automatické označení použité techniky.
5. **Týdně:** osobní report (vybavené sny/týden, LD/týden, úspěšnost na pokus podle techniky, trend spánku, nalezené znaky snů, výsledek mikrorandomizace) a návrh úpravy plánu.

### 2. Fáze uživatelské cesty

| Fáze | Týdny | Obsah | Hlavní KPI | Brána do další fáze |
|---|---|---|---|---|
| **0. Onboarding** | Den 1 | Screening rizik, výchozí vybavování, LD a noční můry, latence usnutí po probuzení, rozvrh spánku, cíl (zvědavost / noční můry / kreativita / spirituální stopa), nastavení očekávání („týdny, ne noci; ~1 z 5–6 nocí v nejlepším případě“) | Dokončení | Bezpečnostní úroveň |
| **1. Vybavování** | 1–3 | Deník, večerní záměr, ranní rituál, objevování znaků snů; 1 týden výchozího logování bez intervence | Sny vybavené za týden | ≥ 3 vybavené sny/týden nebo uplynutí 3 týdnů |
| **2. Uvědomění** | 3–8 | MILD při přirozeném ranním probuzení, 1–2 implementační záměry „když [znak snu], pak…“, volitelná mikropraxe všímavosti | Provedené MILD, kvalita zkoušky záměru | Stabilní spánek |
| **3. Zesílení (opt-in)** | 4+ | WBTB 1–3× týdně, MILD nebo SSILD (volba uživatele), TLR podněty, později haptika Apple Watch | LD/týden, úspěšnost na pokus | Kontrola spánku v pořádku |
| **4. Po luciditě** | průběžně | Předem plánovaná akce (zároveň validace), stabilizace (tření dlaní, „toto je lucidní sen“, klidné pozorování místo létání v prvních okamžicích), „mise“ (motorika, kreativita, otázka postavě snu), stopa jógy snů (vyrovnanost, čelení strachu) | Kontrola, trvání, emoce | — |
| **Modul noční můry** | kdykoli | IRT rescripting + volitelný trénink lucidity; u PTSD doporučení odborníka | Frekvence a distres nočních můr (ne počet LD) | — |

### 3. Funkce MVP (verze 1)

1. **Deník offline-first:** hlasový záznam s převodem na text v zařízení, rychlý zápis z lock screenu nebo widgetu, tagy (postavy, místa, emoce), záznam „nic si nevybavuji“, šifrování, **export** (JSON/Markdown/PDF) a šifrovaná záloha. Ztráta dat je nejsilnější negativní sentiment komunity.
2. **Těžba znaků snů:** pravidlová nebo lokální NLP extrakce opakujících se motivů, které se automaticky stávají cíli MILD a RT.
3. **Plánovač WBTB:** výchozí 5 h po *skutečném* usnutí (odhad z historie HealthKit/Health Connect nebo ručně), rozsah 4,5–6,5 h, limit 1–3 noci týdně, max. jedno budicí probuzení za noc. Technicky: AlarmKit na iOS 26 (přepíše Focus a tichý režim, vlastní zvuk z bundlu, vyžaduje `NSAlarmKitUsageDescription` a souhlas uživatele). Na Androidu `SCHEDULE_EXACT_ALARM` s vysvětlující obrazovkou, nebo `setExact()` s `OnAlarmListener`, dokud běží služba. Nepoužívat `USE_EXACT_ALARM`, pokud aplikace není skutečně budík.
4. **Audio průvodci:**
   - **MILD:** editovatelná fráze (výchozí: „Až budu příště snít, uvědomím si, že sním“), vybavení snu, vizualizace znaku snu, plánovaná akce, minimálně 10 min, bez pevného počtu opakování, s návratem k záměru při odbíhání mysli.
   - **SSILD v režimu ILDIS:** 4 × 2–3 s, pak 6 × ~20 s na smysl, jemné zvukové předěly, nepočítat.
   - **SSILD v laboratorním režimu MC v2:** 1 min rychlých cyklů, 4 min pomalých, volitelně 2 × 3 min cyklů s podněty a výzvami.
5. **TLR „časovaný režim“** (výchozí hodnoty podle Konkoly exp. 2, viz tabulka parametrů níže): předspánkový trénink, test prahů 1. noc, start 6 h po skončení tréninku, podnět každých 20–40 s s náběhem od prahu rozlišení, strop podle hlášeného „pronikl do snu“, pauza 1 min po pohybu, po hlášeném probuzení pauza 45 min nebo konec podnětů (jemný režim), dotaz „Probudil vás zvuk z aplikace?“ a adaptace stropu noc od noci.
6. **Noční audio engine:** na iOS uživatelem spuštěná **slyšitelná** zvuková kulisa (šum, déšť) přes celou noc s vmíchanými podněty. Odpovídá oficiálnímu popisu režimu `audio` („plays audible content“) a obchází Focus/tichý režim stejně jako mediální kanál u Lucid Scribe. Na Androidu FGS `mediaPlayback` spuštěná uživatelem s deklarací a videem v Play Console. Nikdy tichá smyčka.
7. **Samovypínací jemné budíky** (vícenásobné, s různými zvuky a délkami) pro DEILD/WILD; budicí budík zvlášť přes AlarmKit / exact alarm.
8. **RT připomínky:** neomezené a zdarma, nastavitelné 0–20 denně, tiché hodiny, spouštěče podle událostí a stejný „totem“ zvuk ve dne jako TLR podnět v noci (princip Awokenu propojený s publikovaným protokolem). Ověřit spolehlivost doručení v režimech Focus, kde Lucyd selhal.
9. **Ranní check-in a osobní analytika** (bod 6).
10. **Bezpečnostní brány** (viz sekce o rizicích): screening, limity, týdenní kontrola spánku a derealizace, automatické snížení intenzity.
11. **Knihovna technik s odznaky důkazů** (E / slibné / komunitní / bez dat) podle tabulky věrohodnosti, s odkazy na zdroje.
12. **iOS i Android od prvního dne.**

**Parametry TLR pro implementaci (výchozí = Konkoly 2024 exp. 2, s označením ověření):**

| Parametr | Výchozí hodnota | Zdroj / stav |
|---|---|---|
| Podnět | Harfová melodie ~3 s s náběhem a doznivem (exp. 2); alternativy 400–600–800 Hz tóny ~650 ms nebo housle 1 000 ms (exp. 1) | [V] |
| Předspánkový trénink | 4× podnět + výzva (1. noc), pak 12 podnětů v intervalech 45, 70, 55, 65, 70, 80, 65, 60, 75, 75, 90, 120 s; noci 2–7 výzva jen jednou | [V]; opakování 12 podnětů v nocích 2–7 [NEOV] |
| Text výzvy | „Když si všimnete signálu, stáváte se lucidními… [myšlenky] … [tělo, vjemy, pocity] … [dech] … zůstaňte lucidní, kriticky bdělí…“ | [V] |
| Kalibrace | 1. noc práh slyšitelnosti a práh rozlišení; telefon displejem dolů u polštáře, notifikace vypnuté, hlasitost systému na maximum | [V] |
| Začátek podnětů | 6 h po skončení tréninku | [V] |
| Interval | 20–40 s | [V] |
| Náběh | +0,16 % na podnět od prahu rozlišení (jemný režim +0,08 %, max. = práh rozlišení) | [V]; jednotka [NEOV] |
| Strop | Úroveň, při které uživatel nahlásil začlenění podnětu do snu nebo LD | [V] (exp. 2) |
| Pauza po pohybu | 1 min (exp. 2); 5 min (exp. 1) | [V] |
| Po hlášeném probuzení | Pauza 45 min (exp. 1), restart od prahu; jemný režim: konec na celou noc | [V] |
| Konec podnětů | Článek neuvádí → aplikace: pevné ukončení v čase buzení nebo po N podnětech | [NEOV], návrh |
| Rozvrh nocí pro osobní experiment | Naučený podnět / nenaučený zvuk / ticho, náhodně podle nocí (vzor exp. 2) | [V] pro design |

### 4. Verze 2 a experimentální funkce

- **Apple Watch:** haptický podnět v rámci jednoho 30min okna `WKExtendedRuntimeSession` typu smart alarm, naplánovaného do pozdního okna (až 36 h dopředu, nutná haptika, jeden typ relace na aplikaci). Celonoční klasifikátor na hodinkách jen po ověření legitimního mechanismu (workout session ohrožuje App Review i baterii).
- **Wear OS / Galaxy Watch:** vibrační podněty; surové HRV přes Samsung Health Sensor SDK až po partnerském schválení; prahy HR/RMSSD ve stylu Lucid Wake jako experiment se zveřejněnou přesností.
- **Personalizace z historie:** typické časy REM uživatele z HealthKit/Health Connect (jen zpětně a jen pro relace nad 3 h u Apple) pro posun okna podnětů a WBTB.
- **Stopa jógy snů** se zdroji a případným partnerstvím s linií; meditační kotva jako asociace pro TLR (hypotéza podle Wolk 2024).
- **Režim Dormio:** inkubace obsahu při usínání (není LD, ale je atraktivní).
- **Integrace „pro“:** ZMax/Dreamento nebo INSPEC pro signál LRLR a skutečnou detekci REM.
- **Citizen science:** anonymizované opt-in sdílení dat po vzoru ILDIS, případně spolupráce s laboratoří (Paller/MIT, Dresler, Erlacher, Schredl). Buduje to důvěryhodnost a odpovídá na chybějící velkou domácí RCT.

### 5. Mezery na trhu a diferenciátory

1. **Publikovaný protokol TLR na iOS i Androidu.** Na iOS dnes existují jen nevalidované implementace (Lucyd, Oniri, Lucid Scribe, LDAlarm, Lucid Now) a výzkumná aplikace MIT je jen pro účastníky studie v USA.
2. **Podněty, které nebudí:** strop podle zpětné vazby, jemný režim, okamžitá pauza a adaptace noc od noci řeší stížnost č. 1.
3. **„Co funguje mně“:** výchozí týden, analytika úspěšnosti podle techniky a mikrorandomizace podnětů. Žádná konkurenční aplikace to nenabízí.
4. **Poctivost:** odznaky důkazů, žádné sliby typu „LD na povel“ (Lucyd) nebo „první LD dnes v noci“, zveřejněné vlastní metriky.
5. **Spolehlivost:** budíky, které fungují i ve Focus, samovypínací jemné budíky, noční režim šetrný k baterii, export a zálohy, viditelně aktivní vývoj.
6. **Férová monetizace:** štědré bezplatné jádro (deník, neomezené RT, základní MILD/SSILD, časované podněty), placené pokročilé audio, wearables a analytika; **doživotní licence** vedle předplatného a transparentní cena v CZK/EUR. Konkurence se pohybuje mezi 79 Kč jednorázově (LDAlarm) a ~1 290–1 490 Kč ročně (Lucidity, Oniri). Ochota platit za software je nízká a nezávislý LD deník vydělává 200–300 USD měsíčně, monetizace tedy musí počítat s malým trhem.
7. **Soukromí:** zpracování v zařízení, šifrování, žádné prodávání dat.
8. **Dvě stopy** (západní LD a jóga snů) s rozdílnými metrikami úspěchu.
9. **Čeština a lokální kontext:** žádná z top aplikací nemá doložené české protokolové audio (neověřeno, inference). České znění MILD/SSILD a ceny v Kč jsou nízko visící ovoce.

### 6. Měření a osobní analytika

- **Primární KPI:** ve fázi 1 vybavené sny za týden; ve fázi 3 LD za týden a **úspěšnost na pokus** (LD / noci s technikou). Benchmark ze studií: 16–20 % praktikovaných nocí u motivovaných dobrovolníků a ~10–15 % nocí s TLR.
- **Výchozí stav uvnitř uživatele:** 1 týden logování bez intervence, po vzoru NALDIS a ILDIS. Bez něj aplikace kvůli samovýběru a regresi k průměru nadhodnocuje efekt.
- **Mikrorandomizace na úrovni nocí:** v nocích s TLR náhodně naučený podnět, nenaučený zvuk nebo ticho, po vzoru Konkoly exp. 2. Uživatel dá informovaný souhlas s tím, že nebude vědět, která noc je kontrolní. Výsledek zobrazit až po dostatku nocí.
- **Záznam pro každou noc:** technika, čas usnutí a WBTB, délka bdění, odhad latence usnutí po technice (≤ 10 min ano/ne), délka MILD/SSILD, podnět ano/ne a hlasitost, počet pauz kvůli pohybu, „probudilo mě to“, vybavení, lucidita 0–4, kontrola 0–4, plánovaná akce provedena, trvání, způsob ukončení (probuzení / ztráta lucidity / falešné probuzení), emoce, kvalita spánku.
- **Validace lucidity bez EEG:** plánovaná akce ve snu, 5 položek náhledu z LuCiD (jako Konkoly) a volitelně položky z LDCQ nebo DLQ-7 (licence ověřit). Odpovědi „slyšel jsem podnět“ ve falešných nocích slouží ke kalibraci, protože 15 % lidí v MC v2 slyšelo neexistující podněty.
- **Bezpečnostní metriky:** trend kvality spánku a denní ospalosti, skóre derealizace a depersonalizace, počet nocí s probuzením za týden, podíl nocí s hlášeným probuzením podnětem.
- **Produktové metriky:** retence v týdnech 1–3 (benchmark odpadu: ILDIS ~58 % mezi 1. a 2. týdnem, Konkoly 50 ze 416 všech 7 nocí), podíl uživatelů ve fázi 3, NPS.
- **Interpretace:** zobrazovat intervaly spolehlivosti nebo „zatím málo dat“; šum neprezentovat jako úspěch.

### 7. Co NEstavět

- **Žádný vlastní hardware** ani EEG čelenku v MVP. Historie oboru je hřbitov zařízení a nová vlna (Somni, LucidMe PRO, Prophetic) nemá data.
- **Žádnou drahou detekci REM jako jádro.** Podnět ≈ falešný podnět a REM z telefonu je nespolehlivý. Akcelerometr slouží jen jako pojistka pauzy.
- **Žádné „LD binaurální rytmy“, 432 Hz, „40 Hz gama“ ani subliminální audio** jako metodu účinnosti. Šum a zvuková kulisa jsou v pořádku jako relaxace a jako technický nosič audia na iOS.
- **Žádné samostatné WBTB, samostatné RT ani afirmace** jako hlavní slib.
- **Žádné vnucené RT v cestě s MILD** bez měření osobního efektu.
- **Žádná doporučení léků a doplňků** (galantamin, Calea, B6) a žádné odkazy na nákup. Jen informace s upozorněním na lékaře a na JAMA 2024.
- **Žádné blikající světelné podněty** ve výchozím stavu.
- **Žádné tiché audio jako udržovač při životě na iOS** a žádné zneužití FGS typu `health` nebo `dataSync` k celonočnímu běhu na Androidu.
- **Žádné `USE_EXACT_ALARM`**, pokud aplikace není skutečně budík.
- **Žádné trestající série ani gamifikaci, která odměňuje počet probuzení nebo WBTB nocí.** Vynechaný den návyk neruší a gamifikace má malý nebo nulový efekt.
- **Žádnou AI interpretaci snů jako „pravdu“.** Nanejvýš jako podnět k reflexi; nejde o diferenciátor.
- **Žádné terapeutické sliby** (PTSD, úzkost, narkolepsie) bez klinické validace a regulatorního posouzení.
- **Žádná božstva, guru jóga ani tantrické instrukce** ve volné stopě a žádné implikování předání.
- **Žádné marketingové údaje** typu „54 %“, „45,8 % při usnutí do 5 min“, „80 % za 2 dny“, „ztrojnásobí LD“ ani „17 % vs. 5 %“ bez kontextu druhé noci.

### 8. Etika

- **Poctivost očekávání:** „U motivovaných lidí ve studiích vycházela nejlepší kombinace zhruba na 1 noc z 5–6 v prvním týdnu; podněty ve spánku přidávají doma nejistý efekt; u většiny začátečníků jde o týdny.“
- **Soukromí:** sny jsou zvláštní kategorie citlivých dat. Zpracování v zařízení, šifrování end-to-end, žádné sdílení s reklamními sítěmi, výzkumné sdílení ve výchozím stavu vypnuté, export kdykoli.
- **Zranitelní uživatelé:** screening, měkké vyloučení, režim pro nezletilé, krizové kontakty, automatické snižování intenzity.
- **Informovaný souhlas s mikrorandomizací:** uživatel ví, že některé noci jsou kontrolní, ale ne které.
- **Kulturní respekt:** připisovat zdroje, odlišit „inspirováno“ od „autentické praxe“, nepodávat istikháru, šamanismus ani indigenní praxe jako „LD hack“.
- **Transparentnost:** odznaky důkazů, odkazy na studie, zveřejněná přesnost případné detekce REM, jasná cena a snadné zrušení předplatného.
- **Autonomie (teorie sebeurčení, SDT):** uživatel volí techniku (MILD/SSILD/TLR) se zdůvodněním. Žádné manipulativní dark patterns.

### 9. Položky stále k ověření před nasazením

| Položka | Stav | Kde ověřit |
|---|---|---|
| Konkoly 2024: jednotka náběhu 0,16 %, konec a strop podnětů v exp. 1, opakování 12 podnětů v nocích 2–7 | Neuvedeno v textu | Doplněk (docx) a kód na GitHubu ([PMC11542932](https://pmc.ncbi.nlm.nih.gov/articles/PMC11542932/)) |
| Procenta 1. a 2. noci exp. 2 po skupinách | Jen v obrázku 5 | Tamtéž |
| Doslovné listy instrukcí ILDIS | Jen parafráze v Methods | Autor (Aspy) |
| MC v2: recenzovaná verze | Preprint (srpen 2026) | [bioRxiv v2](https://www.biorxiv.org/content/10.1101/2024.06.21.600133v2) |
| Schredl 2025, Raduga 2021, IJoDR 2026 (115408), Mallela & Mallett 2024 (watchOS TLR, URL repozitáře) | Server IJoDR nedostupný | [IJoDR](https://journals.ub.uni-heidelberg.de/index.php/IJoDR) |
| Carr 2023 (n podle skupin, tréninkový skript), Tan & Fan 2023 („6 studií“), Klofat 2024 (kontroly, vedlejší účinky) | Plné texty nedostupné | Swansea, Wiley, Springer |
| Způsob, jak Oniri, Lucyd, Lucid Now a Everdream udržují noční audio na iOS; limit 270 min u Lucidly | Nezdokumentováno | Reverzní test aplikací |
| Legitimní mechanismus celonočního běhu na watchOS; omezení Doze pro exact alarms; doručení RT notifikací v režimech Focus (Time Sensitive) | Oficiální dokumentace chybí nebo nebyla stažena | Apple/Android docs, DTS požadavek, prototyp |
| Licence škál LuCiD, LDCQ, DLQ-7 | Neověřeno | Autoři škál |
| Celosvětová hodnocení a tržby konkurence | Nedostupné (AppMagic, Sensor Tower) | Placené nástroje |
| Wangyalova noční struktura a poloha podle pohlaví; umístění Norbuova „A“ | Neověřeno | Fyzická kniha, Ligmincha |
| Výsledky NCT07217340, NCT07408206, NCT07609537 | Nezveřejněno | [ClinicalTrials.gov](https://clinicaltrials.gov/study/NCT07217340) |
| Galantamin v doplňcích z pohledu SÚKL/SZPI; potravinové právo u Calea | Neověřeno | SÚKL, SZPI |
| Klinické předpoklady (bipolární porucha a spánková deprivace, WBTB vs. CBT-I, fotosenzitivita) | Obecná klinická znalost, neověřeno v LD literatuře | Klinický konzultant |
| DreamViews konsenzus 2023–2026 | Cloudflare | Ruční průzkum |

---

## Závěr

Ověření plných textů posunulo obraz jedním směrem: **čím přísnější kontrola, tím menší podíl připadá technologii a tím větší tréninku a kontextu.** Falešná tACS vyvolala LD stejně jako skutečná, falešné podněty v REM skoro stejně jako skutečné a domácí efekt TLR se drží jen v sekundárních analýzách. Z toho neplyne, že podněty jsou bezcenné. Plyne z toho, že jejich hodnota je pravděpodobně připomínací a motivační a že je třeba ji u každého uživatele změřit, ne slíbit. Aplikace, která svůj nejatraktivnější prvek prodává poctivě jako experiment, se tím paradoxně stává jediným hráčem na trhu, který může svůj efekt doložit. Data o odpadu (v ILDIS 58 % odpadlých mezi prvním a druhým týdnem, 12 % sedmi nocí u Konkolyho) ukazují, kde se rozhoduje: ne v hardwaru, ale v tom, zda uživatel vydrží týdny bez odměny a nepoškodí si spánek.

Komunita přitom nežádá zázraky, ale základní řemeslo, které konkurence neumí: deník, o který nepřijde, budíky, které se samy vypnou, připomínky bez limitů a hodinky, které jemně zabzučí ve správnou chvíli. Mezera na iOS se nezavřela důkazy, jen marketingem. Tibetská jóga snů nabízí to, co západní protokoly nemají: smysl a kurikulum pro chvíli, kdy už člověk ví, že sní, protože kontrolu nad snem má jen menšina lucidních snílků. Produkt, který spojí spolehlivé řemeslo, publikované parametry, osobní měření a respektující stopu „co dělat ve snu“, by obsadil místo mezi gamifikovanými trenažéry bez důkazů a výzkumnými prototypy bez uživatelského zážitku. Dnes ho nedrží nikdo.
