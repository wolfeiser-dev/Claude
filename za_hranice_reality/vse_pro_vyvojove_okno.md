# Výstupy pro hlavní vývojovou session „Za hranice reality“

Každý výstup je níže celý, jako samostatný blok kódu s názvem souboru nad ním. Pořadí odpovídá úkolům 1–9 v zadání, na konci je QA log (co se kontrolovalo a opravovalo).

### lessons_new.json

```json
{
  "lessons": [
    {
      "id": "dreamSigns",
      "order": 11,
      "title": "Znaky snů a jejich čtyři druhy",
      "lead": "Jak v Deníku najít vlastní značky, které ti říkají: tohle je sen.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "Chyba v kulisách",
          "body": "Znak snu je cokoli, co se ve snu děje jinak než v bdění: gumový zubní kartáček, dávno zbořená škola, let nad střechami. Stephen LaBerge si všiml, že lidé se stávají lucidními často právě ve chvíli, kdy se nad takovou zvláštností zarazí. Je to jako chyba v divadelních kulisách: kdo ji jednou uvidí, už ji nepřehlédne.",
          "art": "realityTree"
        },
        {
          "title": "Čtyři přihrádky",
          "body": "LaBerge třídí znaky snů do čtyř skupin: vnitřní prožitek (zvláštní myšlenka, emoce nebo vjem), děj (někdo nebo něco dělá nemožnou věc), podoba (věc, člověk nebo místo vypadá jinak) a souvislosti (běžní lidé a věci na nečekaném místě, nebo ty v nečekané roli). Ke každému znaku v Deníku připiš, kam patří. Je to jako třídit poštu: brzy uvidíš, která přihrádka přetéká.",
          "art": "dreamSignGrid",
          "artBrief": "Mřížka 2×2 ze čtyř panelů s rohovými značkami: vnitřní prožitek (hlava s malou jiskrou), děj (postava s obloukem pohybu), podoba (čtverec, který se vlní do kruhu), souvislosti (hrnek mimo rám obrazu). Jeden panel je zvýrazněný oranžovou linkou jako tvoje hlavní kategorie, ostatní tlumeně."
        },
        {
          "title": "Najdi svou hlavní kategorii",
          "body": "Až budeš mít v Deníku aspoň tucet snů, podtrhni v nich zvláštnosti a spočítej, která kategorie vede. LaBerge radí vzít si tu nejčastější za cíl a ve dne si všímat, jak se věci z té kategorie chovají normálně. Opakující se motivy ti navíc ukážou Stopy snů, takže nehledáš v mlze, ale podle mapy.",
          "art": "ladder"
        },
        {
          "title": "Znak snu jako spoušť",
          "body": "Nejvíc znak snu pomáhá v technice Záměr poznat sen (MILD): představíš si, že ho znovu vidíš, a v té představě si řekneš, že sníš. Vzniká tak pravidlo „když uvidím X, poznám, že sním“, kterému psychologie říká implementační záměr. Funguje jako záložka v knize: mozek ví, kde má otevřít.",
          "art": "mildLoop"
        },
        {
          "title": "Ochotný tiskový mluvčí",
          "body": "Ve snu si zvláštnosti obvykle hned vysvětlíme, třeba „asi se přestěhovali“. LaBerge to popisuje jako racionalizaci a právě kvůli ní znak snu sám o sobě luciditu nepřinese. Snící mozek je jako ochotný tiskový mluvčí, který má na každou díru v příběhu hotové vysvětlení.",
          "art": "realityTree"
        },
        {
          "title": "Co o tom víme",
          "body": "Katalog znaků snů je praktický nástroj z LaBergeovy knihy a samostatně ho žádná studie netestovala. Víme ale, že v nocích s lucidním snem si lidé vybavují víc snů a že MILD s představou znaku snu patří k nejlépe podloženým technikám. Znaky snů jsou dobrá mapa, ne zaručená cesta.",
          "art": "hypnogram"
        },
        {
          "question": "Ve snu má tvůj byt pokoj navíc, který ve skutečnosti neexistuje. Kam ten znak patří?",
          "options": [
            "Vnitřní prožitek",
            "Děj",
            "Podoba",
            "Souvislosti"
          ],
          "answer": 2,
          "explain": "Podle LaBerge patří do podoby i místo, které vypadá jinak než v bdění. Souvislosti jsou spíš běžné věci na nečekaném místě, třeba tvoje šéfová u tebe v kuchyni."
        }
      ],
      "sources": [
        "LaBerge & Rheingold 1990",
        "Aspy 2017",
        "Aspy 2020",
        "Gollwitzer & Sheeran 2006"
      ]
    },
    {
      "id": "dreamForgetting",
      "order": 12,
      "title": "Proč sny zapomínáme",
      "lead": "Co dělá mozek s nočním zážitkem a proč stačí pár vteřin nepozornosti.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "Kino bez nahrávání",
          "body": "V REM spánku je mozek čilý, ale noradrenalinu, který v bdění pomáhá ukládat zážitky, je v něm velmi málo. Podle vlivné hypotézy je to jeden z důvodů, proč se sen bez probuzení do paměti neuloží. Je to jako film v kině, kde nikdo nezapnul nahrávání.",
          "art": "forgetting"
        },
        {
          "title": "Chvilka bdění",
          "body": "Lidé, kteří si pamatují hodně snů, se podle studií z Lyonu v noci budí častěji a déle a jejich mozek víc reaguje na zvuky ve spánku (Eichenlaub 2014). Vypadá to, že krátké probuzení dává snu čas přesunout se do paměti, která vydrží do rána. Sen je jako vzkaz na zamlženém okně: zůstane jen tomu, kdo ho stihne přečíst.",
          "art": "hypnogram"
        },
        {
          "title": "Vločka na dlani",
          "body": "Sen přežije probuzení, jen když se mu hned věnuješ, říká model aktivace a vybavení (Koulack a Goodenough 1976). Stačí sáhnout po mobilu nebo začít myslet na práci a stopa se rozplyne. Je to jako sněhová vločka na dlani: buď se na ni podíváš hned, nebo zbude kapka.",
          "art": "fadingTrace",
          "artBrief": "Tenká linka snu, která po probuzení řídne do teček a mizí; v místě, kde ji zachytí malá ikona tužky nebo mikrofonu, pokračuje dál plnou oranžovou čarou. Nahoře drobná osa času 0–5 minut v JetBrains Mono."
        },
        {
          "title": "Mozek, který maže",
          "body": "U myší vědci v roce 2019 objevili nervové buňky (MCH), které jsou aktivní hlavně v REM a tlumí ukládání vzpomínek v hipokampu (Izawa 2019). Autoři opatrně navrhují, že by podobný mechanismus mohl vysvětlit rychlé mizení snů i u lidí. Zatím je to hypotéza z pokusů na zvířatech, ne hotová pravda o tvém mozku.",
          "art": "forgetting"
        },
        {
          "title": "Obyčejná paměť v nezvyklý čas",
          "body": "Když měli lidé těsně před probuzením z REM víc pomalé aktivity theta v čelní části mozku, sen si častěji vybavili (Marzano 2011). Stejný vzorec se objevuje v bdění, když si ukládáme běžné zážitky. Paměť na sny tedy není zvláštní dar, ale obyčejná paměť, která pracuje v nezvyklém čase.",
          "art": "brainMap",
          "artBrief": "Liniový profil mozku z boku na tmavém pozadí, oblasti jako hvězdy na hvězdné mapě: čelní pól, přední čelní kůra, temporoparietální spojení vpravo, precuneus. Temporoparietální bod svítí oranžově, ostatní tlumeně, tenké orbity mezi body naznačují propojení."
        },
        {
          "title": "Nesníš, nebo zapomínáš?",
          "body": "Lidé, kteří tvrdí, že nesní, při buzení z REM v laboratoři sny také hlásí, jen méně často (Goodenough 1959). U pacientů s poruchou chování v REM spánku je dokonce vidět, jak sny předvádějí pohyby těla, i když si je ráno nepamatují (Herlin 2015). Sny tedy nejspíš máme všichni, liší se hlavně to, kolik jich doneseme do rána.",
          "art": "body"
        },
        {
          "question": "Proč ráno nejdřív zapisuješ jen pár klíčových slov?",
          "options": [
            "Protože dlouhý zápis nikoho nebaví",
            "Protože stopa snu mizí během chvilky a klíčová slova ji zachytí nejrychleji",
            "Protože klíčová slova jsou pro appku přehlednější"
          ],
          "answer": 1,
          "explain": "Jakmile se pozornost obrátí jinam, sen rychle vyprchá. Klíčová slova jsou háčky, za které celý sen vytáhneš později."
        }
      ],
      "sources": [
        "Hobson 2009",
        "Eichenlaub 2014",
        "Koulack & Goodenough 1976",
        "Izawa 2019",
        "Marzano 2011",
        "Goodenough 1959",
        "Herlin 2015"
      ]
    },
    {
      "id": "sleepHygieneLucid",
      "order": 13,
      "title": "Káva, alkohol a REM",
      "lead": "Co večer vypiješ, to se ukáže ve druhé polovině noci. A právě tam se rodí lucidní sny.",
      "minutes": 4,
      "tag": "strong",
      "cards": [
        {
          "title": "Nejlepší okno je k ránu",
          "body": "Nejdelší a nejživější REM přichází ve druhé polovině noci, proto se tam objevuje i většina lucidních snů. Cokoli, co rozbije ranní hodiny spánku, ti tak bere nejlepší okno. Spánek je pozemek a lucidní sen dům: bez pevných základů ho nepostavíš.",
          "art": "hypnogram"
        },
        {
          "title": "Kofein má dlouhý dosah",
          "body": "Metaanalýza 24 studií ukázala, že kofein zkracuje spánek v průměru o 45 minut, prodlužuje usínání a ubírá hluboký spánek (Gardiner 2023). Šálek kávy autoři doporučují vypít nejpozději zhruba 9 hodin před spaním. Kofein je host, který z večírku odejde, ale klíče od bytu si nechá.",
          "art": "body"
        },
        {
          "title": "Káva při nočním probuzení? Raději ne",
          "body": "Při technice Probuzení a návrat do spánku (WBTB) kávu vynech, i když ji někdo na fórech doporučuje. Nejspolehlivější známý prediktor úspěchu je, že po technice usneš do 10 minut (Aspy 2020), a kofein usínání prodlužuje. Potřebuješ otevřené dveře do spánku, ne zámek.",
          "art": "wildBridge"
        },
        {
          "title": "Alkohol: rychlé usnutí, rozbité ráno",
          "body": "Alkohol pomáhá usnout a první polovinu noci zpevní, ve druhé polovině ale spánek rozkouskuje a ve vyšších dávkách REM potlačuje (Ebrahim 2013). Večer s pár pivy tak bere přesně ty hodiny, kdy se lucidní sny rodí. Je to půjčka s vysokým úrokem: rychlé usnutí teď, rozbité ráno potom.",
          "art": "hypnogram"
        },
        {
          "title": "REM rebound: mozek dohání",
          "body": "Když REM chybí, třeba po krátké noci nebo po alkoholu, mozek ho v dalších nocích dohání a sny bývají živější (Dement 1960). Neber to jako trik: záměrně zkrácený spánek přináší hlavně únavu a horší náladu. Léky, které ovlivňují REM, kvůli snům nikdy neměň bez lékaře.",
          "art": "remRebound",
          "artBrief": "Dva malé hypnogramy vedle sebe: první noc s nízkými, useknutými REM bloky v tlumené barvě, druhá noc s vyššími a delšími REM bloky v oranžové. Mezi nimi tenká oblouková šipka návratu."
        },
        {
          "title": "A co doplňky?",
          "body": "Doplňky na lucidní sny ti nedoporučíme. Jediná látka s velkou studií, galantamin, je v Česku lék na předpis a z deseti testovaných doplňků s galantaminem bylo devět chybně označených (Cohen 2024). Nejspolehlivější doplněk je pravidelný a dostatečný spánek.",
          "art": "breath"
        },
        {
          "question": "Zítra chceš zkusit WBTB. Co dává největší smysl?",
          "options": [
            "Večer dvě piva, ať rychle usnu",
            "Poslední kávu do odpoledne a večer bez alkoholu",
            "Kávu při nočním probuzení, ať jsem bdělejší"
          ],
          "answer": 1,
          "explain": "Alkohol rozbíjí právě druhou polovinu noci a kofein při nočním probuzení zhorší rychlé usnutí, na kterém úspěch stojí. A pamatuj: WBTB nejvýš dvakrát týdně, nikdy dvě noci po sobě a jen po dobré noci."
        }
      ],
      "sources": [
        "Gardiner 2023",
        "Ebrahim 2013",
        "Aspy 2020",
        "Dement 1960",
        "LaBerge 2018",
        "Cohen 2024"
      ]
    },
    {
      "id": "falseAwakening",
      "order": 14,
      "title": "Falešná probuzení",
      "lead": "Probudíš se, vstaneš, čistíš si zuby. A pořád sníš.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "Probuzení, které není",
          "body": "Falešné probuzení je sen o tom, že ses probudil: ležíš v posteli, vstáváš, chystáš snídani. Bývá tak věrohodný, že ho bez testu reality skoro nejde poznat. Je to kulisa tvého pokoje postavená tak pečlivě, že nevidíš švy.",
          "art": "loopRoom",
          "artBrief": "Ložnice nakreslená tenkou linkou (postel, okno, dveře), která se opakuje ve třech zmenšujících se rámech jako zrcadlo v zrcadle. V nejmenším rámu malá oranžová dlaň jako test reality."
        },
        {
          "title": "Dva typy",
          "body": "Badatelka Celia Green v roce 1968 popsala dva typy falešných probuzení. První je všední: probudíš se a začneš normální den. Druhý je vzácnější a napjatý: pokoj vypadá jako obvykle, ale visí v něm zvláštní tíseň nebo očekávání.",
          "art": "wildBridge"
        },
        {
          "title": "Vedlejší vchod do lucidity",
          "body": "V průzkumu 90 zkušených lucidních snílků mělo 41 % falešné probuzení aspoň jednou měsíčně (Buzzi 2011). V laboratoři se falešná probuzení objevila ve 23 % snů a část lucidních snů začala právě jimi (Peters 2026, předběžné). Je to vedlejší vchod do lucidity, který se často otevírá sám.",
          "art": "ladder"
        },
        {
          "title": "Test po každém probuzení",
          "body": "Udělej si pravidlo: po každém probuzení, hlavně při technice Probuzení a návrat do spánku (WBTB), jeden rychlý test reality, třeba nádech se zavřenými ústy. Když test selže, víš, že sníš, a můžeš klidně zůstat ve snu. Je to jako zkontrolovat zámek, i když víš, že je zamčeno.",
          "art": "realityTree"
        },
        {
          "title": "Když se smyčka opakuje",
          "body": "Někdy přijde několik falešných probuzení za sebou a máš pocit, že se nemůžeš probudit. Uvíznout ve snu ale nejde, každá taková série skončí skutečným probuzením. Pomáhá klid a pomalý dech, tipy typu „ve snu si lehni a usni“ jsou jen zkušenosti praktiků, ne ověřená metoda.",
          "art": "breath"
        },
        {
          "title": "Zvuk, který nezazněl",
          "body": "Ve falešném probuzení mozek klidně vyrobí i budík nebo podnět, který nikdy nezazněl. V jedné laboratorní studii lidé v 15 % falešných probuzení hlásili podněty, které vůbec nebyly puštěné (Picard-Deland 2026, předběžné). Když ráno zapisuješ zvuky ze spánku, ber svou paměť s rezervou.",
          "art": "forgetting"
        },
        {
          "question": "Probudíš se v posteli a jsi si skoro jistý, že je ráno. Co uděláš jako první?",
          "options": [
            "Nic, skutečné probuzení se pozná vždycky",
            "Rychlý test reality, třeba nádech se zavřenými ústy",
            "Hned začnu zapisovat sen do Deníku"
          ],
          "answer": 1,
          "explain": "Falešné probuzení bývá k nerozeznání od skutečného, rozhodne až test. Když ukáže bdění, zapiš sen, a když ne, právě jsi lucidní."
        }
      ],
      "sources": [
        "Green 1968",
        "Buzzi 2011",
        "Peters 2026",
        "Picard-Deland 2026",
        "Aspy 2020",
        "LaBerge & Rheingold 1990"
      ]
    },
    {
      "id": "nightmaresIrt",
      "order": 15,
      "title": "Noční můry a přepis snu (IRT)",
      "lead": "Nejlépe ověřená cesta z nočních můr nevede přes luciditu, ale přes nový scénář.",
      "minutes": 5,
      "tag": "strong",
      "cards": [
        {
          "title": "Přepiš konec filmu",
          "body": "Imaginační nácvik (IRT, imagery rehearsal therapy) znamená, že si v bdění přepíšeš opakující se noční můru a novou verzi si pak denně přehráváš v představách. Americká akademie spánkové medicíny ho označuje za doporučenou léčbu nočních můr (Morgenthaler 2018). Je to jako přepsat konec filmu, který ti noc co noc pouští stejný promítač.",
          "art": "rewriteScript",
          "artBrief": "Dva listy vedle sebe: vlevo tenká linka příběhu končící ostrým zubem (noční můra), vpravo stejná linka, která se v místě zubu ohne do měkkého oblouku a pokračuje dál. Mezi listy oranžová tužka."
        },
        {
          "title": "Tři kroky",
          "body": "Vyber si nejdřív mírnější opakující se sen, ne ten nejtěžší, a zapiš si ho. Změň v něm cokoli chceš, třeba konec, místo nebo sebe, a novou verzi si zapiš taky. Pak si ji 10–20 minut denně přehrávej se zavřenýma očima a starou verzi už neopakuj.",
          "art": "mildLoop"
        },
        {
          "title": "Co od toho čekat",
          "body": "Metaanalýza 13 studií u nočních můr po traumatu ukázala velký pokles jejich četnosti, lepší spánek a efekt, který vydržel i měsíce (Casement & Swanson 2012). Nefunguje ale u každého: ve velké studii u válečných veteránů nebyl IRT lepší než srovnávací léčba (Cook 2010). Je to spolehlivý nástroj, ne kouzelné tlačítko.",
          "art": "ladder"
        },
        {
          "title": "A kde je lucidita?",
          "body": "Ve studiích lucidní terapie se úleva objevovala i u lidí, kteří lucidní vůbec nebyli, a výskyt lucidity se zlepšením nesouvisel (Spoormaker 2006, Yount 2025). Účinná je pravděpodobně práce s obrazem a pocit zvládnutí, ne samotné poznání snu. Lucidita je tu bonus, ne vstupenka.",
          "art": "realityTree"
        },
        {
          "title": "Když tě noční můra zastihne lucidního",
          "body": "Pokud se staneš lucidním uprostřed noční můry, nemusíš utíkat ani bojovat. Zkus se zastavit, otočit se k tomu, co tě děsí, a zeptat se, kdo to je a co potřebuje. Tenhle postoj doporučuje LaBerge i jóga snu, vědecky je ale ověřený hlavně bdělý přepis, ne čelení strachu ve snu.",
          "art": "body"
        },
        {
          "title": "Kdy s odborníkem",
          "body": "Pokud noční můry souvisí s traumatem nebo tě budí několikrát týdně, obrať se na odborníka, IRT se pak nejlépe dělá s terapeutem. Lucidní indukci v takovém období vynech a chraň spánek. Appka může být parťák na přepis snu, ne náhrada péče.",
          "art": "breath"
        },
        {
          "question": "Co je při IRT nejdůležitější?",
          "options": [
            "Co nejčastěji si přehrávat původní noční můru",
            "Denně si přehrávat novou, přepsanou verzi",
            "Naučit se v každé noční můře lucidně létat"
          ],
          "answer": 1,
          "explain": "Jádrem IRT je nácvik nového scénáře, starý se neopakuje. Lucidita může pomoct, ale úleva přichází i bez ní."
        }
      ],
      "sources": [
        "Krakow 2001",
        "Krakow & Zadra 2006",
        "Morgenthaler 2018",
        "Casement & Swanson 2012",
        "Cook 2010",
        "Spoormaker & van den Bout 2006",
        "Yount 2025",
        "LaBerge & Rheingold 1990"
      ]
    },
    {
      "id": "dreamIncubation",
      "order": 16,
      "title": "Inkubace snu: zadej si téma",
      "lead": "Jak si večer objednat, o čem se ti bude zdát, a co o tom zjistil výzkum.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "Semínko na noc",
          "body": "Inkubace znamená, že si před spaním vybereš téma nebo otázku a necháš ji jako poslední myšlenku dne. Lidé to dělali už v antických chrámech a dnes to zkoumají spánkové laboratoře. Nejde o to poznat sen, ale zasadit do něj semínko a ráno se podívat, co vyklíčilo.",
          "art": "seedMoon",
          "artBrief": "Tenký srpek měsíce a pod ním semínko v zemi; vedle druhá fáze (ráno), kde ze semínka vyrůstá stonek s jedním lístkem ve tvaru otazníku. Oranžový je jen lístek."
        },
        {
          "title": "Výbor spánku",
          "body": "Psycholožka Deirdre Barrettová nechala studenty týden každý večer inkubovat sen o vlastním problému (Barrett 1993). Zhruba polovina měla sen, který s problémem souvisel, a většina z nich v něm viděla aspoň náznak řešení, nejčastěji u osobních otázek. Nezávislí hodnotitelé viděli řešení o něco méně často, takže čísla ber jako slibný začátek.",
          "art": "ladder"
        },
        {
          "title": "Téma při usínání",
          "body": "Tým z MIT pouštěl lidem při usínání slovo „strom“ a krátce je budil, aby řekli, co se jim honí hlavou. Po zdřímnutí byli lidé tvořivější než po bdění a nejvíc ti, komu se strom opravdu dostal do snu (Haar Horowitz 2023). Studie ale měla jen 49 lidí a šlo o odpolední zdřímnutí, ne o celou noc.",
          "art": "wildBridge"
        },
        {
          "title": "Hádanky v REM",
          "body": "V roce 2026 pouštěli vědci 20 zkušeným lucidním snílkům v REM zvuky spojené s nevyřešenými hádankami. Hádanky, o kterých se jim pak zdálo, druhý den vyřešili častěji a zvuky ovlivnily obsah snů i bez lucidity (Konkoly 2026). Studie je malá, ale naznačuje, že spánek umí na problému pracovat i bez tvého řízení.",
          "art": "cueWave",
          "artBrief": "Hypnogram tenkou linkou; nad pozdním REM blokem drobný reproduktor a tři stoupající vlnky zvuku (tři tóny), oranžové a slábnoucí, kolem nich jemná orbita."
        },
        {
          "title": "Jak inkubovat doma",
          "body": "Vyber jednu otázku nebo obraz, napiš si ho do Deníku a před spaním si ho pár minut představuj, klidně s předmětem na nočním stolku. Poslední myšlenka před usnutím má patřit tématu. Ráno nejdřív zapiš, co se zdálo, a souvislosti hledej až potom.",
          "art": "mildLoop"
        },
        {
          "title": "Sen jako hlas v debatě",
          "body": "Inkubace obsahu má slibná, ale malá data a hodně stojí na sebehodnocení. Neber sen jako věštbu ani jako hotovou odpověď, ber ho jako další nápad do debaty. Výbor spánku radí, rozhoduješ ty.",
          "art": "realityTree"
        },
        {
          "question": "Čím se inkubace liší od lucidního snu?",
          "options": [
            "Inkubace ovlivňuje téma snu, lucidita je poznání, že sníš",
            "Inkubace funguje jen v laboratoři",
            "Je to totéž, jen jiný název"
          ],
          "answer": 0,
          "explain": "Inkubovaný sen nemusí být lucidní a lucidní sen nemusí mít zadané téma. Dají se ale spojit: téma si připrav jako cíl na chvíli, kdy se ve snu probereš."
        }
      ],
      "sources": [
        "Barrett 1993",
        "Barrett 2001",
        "Haar Horowitz 2020",
        "Haar Horowitz 2023",
        "Konkoly 2026"
      ]
    },
    {
      "id": "lucidBrain",
      "order": 17,
      "title": "Mozek v lucidním snu",
      "lead": "Co se v hlavě mění, když si ve snu uvědomíš, že sníš. A co zatím nevíme.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "Divák, který si všiml kina",
          "body": "Lucidní sen probíhá většinou v REM spánku, jen se v něm částečně zapnou sítě, které v bdění sledují vlastní myšlení. Vědci tomu říkají metakognice, tedy uvědomění si toho, co právě prožíváš. Je to jako divák, který si uprostřed filmu všimne, že sedí v kině.",
          "art": "brainMap",
          "artBrief": "Liniový profil mozku z boku na tmavém pozadí, oblasti jako hvězdy na hvězdné mapě: čelní pól, přední čelní kůra, temporoparietální spojení vpravo, precuneus. Temporoparietální bod svítí oranžově, ostatní tlumeně, tenké orbity mezi body naznačují propojení."
        },
        {
          "title": "Příběh 40 Hz",
          "body": "V roce 2009 našla studie u šesti lidí zvýšenou frontální aktivitu kolem 40 Hz a z toho vyrostl marketing „gama vln pro luciditu“. Velká analýza 44 záznamů z pěti laboratoří ale po odfiltrování pohybů očí žádný takový signál nenašla (Demirel 2025). Lucidita není stanice, na kterou se dá naladit jako rádio.",
          "art": "hypnogram"
        },
        {
          "title": "Co se zatím ukazuje",
          "body": "Nejnovější data ukazují spíš jemné změny: slabší beta aktivitu v pravé temporoparietální oblasti a silnější propojení v pásmu alfa (Demirel 2025). Ve chvíli, kdy snící dal znamení očima, navíc vzrostla rychlá aktivita v zadních oblastech včetně precunea. Autoři to vykládají jako přehodnocování toho, co je skutečné, ale jde o první velký nález a čeká na potvrzení.",
          "art": "brainMap",
          "artBrief": "Liniový profil mozku z boku na tmavém pozadí, oblasti jako hvězdy na hvězdné mapě: čelní pól, přední čelní kůra, temporoparietální spojení vpravo, precuneus. Temporoparietální bod svítí oranžově, ostatní tlumeně, tenké orbity mezi body naznačují propojení."
        },
        {
          "title": "Mozky častých lucidních snílků",
          "body": "Lidé, kteří mají lucidní sny často, mají v klidu silnější propojení přední čelní kůry s úhlovým závitem, rozdíly ve stavbě mozku se ale nenašly (Baird 2018). Jiná studie našla víc šedé hmoty v čelním pólu (Filevich 2015), takže obraz zatím není jednotný. Navíc nevíme, co je příčina a co následek: trénink může měnit mozek a mozek může usnadňovat trénink.",
          "art": "ladder"
        },
        {
          "title": "Proč tak opatrně",
          "body": "Studie mozku při luciditě mají jednotky až desítky účastníků a jediná studie lucidního snu pomocí fMRI měla jednoho analyzovatelného člověka (Dresler 2012). Každý nový nález proto ber jako hypotézu, ne jako hotovou mapu. Věda tu stojí na začátku expedice, ne v cíli.",
          "art": "realityTree"
        },
        {
          "title": "Co si z toho vzít",
          "body": "Luciditu nenaladíš frekvencí ani „gama audiem“, buduješ ji pozorností k vlastnímu prožívání. Proto appka sází na záměr, deník a testy reality, ne na mozkové vlny. Je to sval, ne vypínač.",
          "art": "mildLoop"
        },
        {
          "question": "Co o luciditě nejlépe sedí na dnešní data?",
          "options": [
            "Je to stav se silnými gama vlnami 40 Hz v čele",
            "Je to uvědomění uvnitř REM s jemnými, zatím nejistými změnami v mozku",
            "Častí lucidní snílci mají prokazatelně větší mozek"
          ],
          "answer": 1,
          "explain": "Frontální signál 40 Hz zmizel po očištění od pohybů očí a rozdíly ve stavbě mozku se nereplikovaly. Jistější je popis lucidity jako uvědomění uvnitř REM, mozkové podpisy se teprve hledají."
        }
      ],
      "sources": [
        "Voss 2009",
        "Demirel 2025",
        "Baird 2018",
        "Filevich 2015",
        "Dresler 2012",
        "Baird 2019"
      ]
    },
    {
      "id": "researchHistory",
      "order": 18,
      "title": "Jak věda uvěřila lucidním snům",
      "lead": "Od Aristotela po první signál očima ze spánkové laboratoře v Hullu.",
      "minutes": 4,
      "tag": "strong",
      "cards": [
        {
          "title": "Staré svědectví",
          "body": "Už Aristotelés psal, že ve spánku občas něco ve vědomí ohlásí, že to, co se ukazuje, je jen sen. Markýz d’Hervey de Saint-Denys roku 1867 vydal záznamy z 32 let pozorování vlastních snů a Frederik van Eeden roku 1913 zavedl výraz „lucidní sen“. Dlouho to ale byla jen osobní svědectví, kterým věda nevěřila.",
          "art": "timeline",
          "artBrief": "Vodorovná časová osa jako výsek orbity s body: Aristotelés, 1867, 1913, 1968, 1975, 1981, 2021. Bod 1975 je oranžový s drobnou ikonou oka, ostatní tlumené, popisky v JetBrains Mono velkými písmeny."
        },
        {
          "title": "Jak se zeptat spícího?",
          "body": "Skeptici namítali, že jde jen o chvilky bdění uprostřed noci, které si ráno přikrášlíme. Celia Green roku 1968 předpověděla, že lucidní sny patří do REM spánku, chyběl ale způsob, jak to dokázat. Jak se zeptat člověka, který spí a nemůže se pohnout?",
          "art": "body"
        },
        {
          "title": "Hull, 12. dubna 1975",
          "body": "Keith Hearne si uvědomil, že oční svaly jsou ve snu skoro jediné, které nejsou ochrnuté, a domluvil se s lucidním snílkem Alanem Worsleyem na sérii pohybů očí. Ráno 12. dubna 1975 poslal Worsley v laboratoři univerzity v Hullu první signál z REM. Hearne výsledky sepsal v disertaci na univerzitě v Liverpoolu roku 1978, do hlavních časopisů se ale jeho práce dostávala těžko.",
          "art": "eyeSignal",
          "artBrief": "Záznam pohybů očí jako tenká linka se čtyřmi ostrými výkyvy vlevo, vpravo, vlevo, vpravo, pod ní pás hypnogramu s vyznačeným REM. Výkyvy oranžové, popisek L R L R v JetBrains Mono."
        },
        {
          "title": "Stanford a hlavní proud",
          "body": "Stephen LaBerge na Stanfordu došel ke stejnému výsledku nezávisle, zpočátku jako vlastní pokusná osoba, a své práce publikoval v letech 1980 a 1981. V článku z roku 1981 ukázal, že všech 24 signálem ověřených lucidních snů proběhlo v REM. Prvenství patří Hullu, cesta do hlavního proudu vědy vedla přes Stanford.",
          "art": "hypnogram"
        },
        {
          "title": "Telegraf ze snu",
          "body": "Domluvený signál očima se stal standardem a pracují s ním dodnes všechny vážné studie lucidity, od měření mozku po zvukové podněty. V roce 2021 čtyři laboratoře ukázaly, že snící dokáže ve snu i odpovídat na otázky (Konkoly 2021). Z jednosměrného majáku se stala vysílačka, i když zatím s velkým šumem.",
          "art": "ladder"
        },
        {
          "question": "Kdo jako první zachytil signál z lucidního snu ve spánkové laboratoři?",
          "options": [
            "Stephen LaBerge na Stanfordu",
            "Keith Hearne a Alan Worsley v Hullu",
            "Celia Green v Oxfordu"
          ],
          "answer": 1,
          "explain": "První signál zachytili Hearne a Worsley 12. dubna 1975 a ten den se dnes slaví jako Den lucidního snu. LaBerge došel ke stejnému výsledku nezávisle o pár let později."
        },
        {
          "question": "Proč se lucidita signalizuje právě očima?",
          "options": [
            "Oči se ve snu vůbec nehýbou, takže je každý pohyb nápadný",
            "Oční svaly v REM nejsou ochrnuté jako zbytek těla",
            "Oči jsou nejblíž mozku"
          ],
          "answer": 1,
          "explain": "V REM je většina svalů těla dočasně ochrnutá, aby se sny nepřehrávaly pohybem. Pohyby očí zůstávají volné, a tak se z nich stal telegraf ze snu."
        }
      ],
      "sources": [
        "Aristotelés: O snech",
        "Saint-Denys 1867",
        "van Eeden 1913",
        "Green 1968",
        "Hearne 1978",
        "LaBerge 1980",
        "LaBerge, Nagel, Dement & Zarcone 1981",
        "Konkoly 2021"
      ]
    },
    {
      "id": "tlrDialogue",
      "order": 19,
      "title": "Zvukové podněty a rozhovor se snícím",
      "lead": "Co dokáže naučený zvuk ve spánku a jak vědci poprvé mluvili s lidmi uvnitř snu.",
      "minutes": 5,
      "tag": "promising",
      "cards": [
        {
          "title": "Co je TLR",
          "body": "Cílená reaktivace lucidity (TLR) má dvě části: večer spojíš určitý zvuk s lucidním naladěním a ve druhé polovině noci ti ho zařízení potichu pustí. Zvuk sám luciditu nevyrobí, je to jen připomínka toho, co sis večer natrénoval. Funguje jako vůně, která vybaví vzpomínku, ale jen když jste se předtím potkali.",
          "art": "cueWave",
          "artBrief": "Hypnogram tenkou linkou; nad pozdním REM blokem drobný reproduktor a tři stoupající vlnky zvuku (tři tóny), oranžové a slábnoucí, kolem nich jemná orbita."
        },
        {
          "title": "Co ukázaly laboratoře",
          "body": "V ranním zdřímnutí v laboratoři mělo s naučenými podněty ověřený lucidní sen 50 % lidí oproti 17 % bez nich (Carr 2023). Nejpřísnější preregistrovaná studie ale skutečné podněty od falešných významně neodlišila (38 % proti 28 % zdřímnutí) a podněty navíc zkracovaly REM (Picard-Deland 2026, předběžné). Hlavní práci tedy nejspíš dělá trénink a podnět je zesilovač.",
          "art": "hypnogram"
        },
        {
          "title": "TLR doma v telefonu",
          "body": "Studie z Northwesternu přenesla TLR do obyčejného telefonu a v týdnu bez kontrolní skupiny stoupl počet lucidních snů z 0,74 na 2,11 týdně (Konkoly 2024). V kontrolovaném pokusu se naučený zvuk od kontrolních nocí lišil jen druhou noc a v celém vzorku efekt významný nebyl. Domácí efekt je tedy slibný, ale nepotvrzený: replikace v jiné aplikaci vyšla nulová (Genc 2025) a podněty občas budí.",
          "art": "ladder"
        },
        {
          "title": "Rozhovor ze snu",
          "body": "V roce 2021 kladly čtyři laboratoře v USA, Francii, Německu a Nizozemsku lucidním snílkům v REM otázky a jednoduché příklady, třeba kolik je osm minus šest. Snící odpovídali pohyby očí nebo stahy obličejových svalů a ze 158 pokusů bylo 18 % odpovědí správných, nejčastěji ale nepřišla odpověď žádná (Konkoly 2021). Spojení existuje, jen je to zatím vysílačka s velkým šumem.",
          "art": "eyeSignal",
          "artBrief": "Záznam pohybů očí jako tenká linka se čtyřmi ostrými výkyvy vlevo, vpravo, vlevo, vpravo, pod ní pás hypnogramu s vyznačeným REM. Výkyvy oranžové, popisek L R L R v JetBrains Mono."
        },
        {
          "title": "Co přišlo potom",
          "body": "Stejná skupina v roce 2026 ukázala, že zvuky pouštěné v REM dokážou vnést do snů nevyřešené hádanky, a to i bez lucidity (Konkoly 2026). Firmy občas hlásí „komunikaci mezi dvěma snícími“, recenzovaná studie k tomu ale neexistuje. Drž se toho, co prošlo oponenturou, zbytek ber jako zajímavé tvrzení.",
          "art": "realityTree"
        },
        {
          "title": "Doma opatrně",
          "body": "Doma platí tři pravidla: zvuk nejdřív večer natrénuj, pouštěj ho jen potichu ve druhé polovině noci a když tě budí, ztiš ho nebo vypni. Záměrná indukce může u citlivějších lidí zvyšovat pocity odcizení a nereálnosti (Aviram & Soffer-Dudek 2018). Když si jich všimneš, dej si pauzu, spánek a klidná hlava mají přednost.",
          "art": "breath"
        },
        {
          "question": "Proč TLR potřebuje večerní trénink?",
          "options": [
            "Aby sis zvykl na hlasitost",
            "Zvuk připomene luciditu jen tehdy, když je s ní předem spojený",
            "Bez tréninku by telefon nepoznal, kdy jsi v REM"
          ],
          "answer": 1,
          "explain": "Bez předchozího spojení je zvuk pro spící mozek jen hluk, který může budit. Trénink z něj dělá naučený signál „všimni si, že sníš“."
        }
      ],
      "sources": [
        "Carr 2023",
        "Konkoly 2021",
        "Konkoly 2024",
        "Genc 2025",
        "Picard-Deland 2026",
        "Konkoly 2026",
        "Aviram & Soffer-Dudek 2018"
      ]
    },
    {
      "id": "dreamStability",
      "order": 20,
      "title": "Udržet sen: stabilizace",
      "lead": "Lucidní sen často skončí dřív, než pořádně začne. Co pomáhá ho prodloužit a co jsou jen zkušenosti praktiků.",
      "minutes": 4,
      "tag": "community",
      "cards": [
        {
          "title": "Krátká svíčka",
          "body": "Lucidní sny bývají krátké: v brazilském průzkumu trvaly téměř polovině lidí méně než minutu (Mota-Rolim 2013). Často je ukončí právě vzrušení z poznání, že sníš. Je to jako plamen svíčky, který zhasne, když na něj radostí vydechneš.",
          "art": "breath"
        },
        {
          "title": "První vteřiny: klid",
          "body": "Když zjistíš, že sníš, nejdřív se zastav a zpomal, s létáním počkej. Laboratorní instrukce radí v prvních okamžicích klidně pozorovat a vyhnout se prudkým akcím, jako je let nebo volný pád (Picard-Deland 2026). Napřed se rozkoukej, pak teprve řiď.",
          "art": "ladder"
        },
        {
          "title": "Zapoj hmat",
          "body": "Když obraz bledne, sáhni na něco ve snu, prohlédni si ruce nebo si promni dlaně a soustřeď se na ten pocit. LaBerge to vysvětluje tak, že živý vjem ze snu nedovolí mozku přepnout pozornost na skutečné tělo v posteli. Studie NALDIS tření dlaní s větou „tohle je lucidní sen“ přímo doporučovala, srovnávací data ale chybí.",
          "art": "body"
        },
        {
          "title": "Točení",
          "body": "Když sen mizí, roztoč se ve snu jako káča a opakuj si, že další věc, kterou uvidíš, bude nejspíš zase sen. LaBerge tak podle vlastních záznamů většinou zůstal lucidní, jen často přistál v nové scéně, nejčastěji ve své ložnici. Po zatočení vždy udělej test reality, jinak snadno skončíš ve falešném probuzení.",
          "art": "mildLoop"
        },
        {
          "title": "Co na to data",
          "body": "Jediné známé srovnání točení, tření dlaní a „nechat se unášet“ udělal LaBergeův institut se svými členy: po točení i tření dlaní sen častěji pokračoval, po „nechat se unášet“ spíš skončil (LaBerge 1995). Šlo ale o malou studii bez recenze, takže stabilizace je hlavně zkušenost praktiků, levná a bezpečná na vyzkoušení. Zapisuj si do Deníku, co ti pomohlo, tvoje poznámky ti řeknou nejvíc.",
          "art": "realityTree"
        },
        {
          "title": "Řídit jemně",
          "body": "Kontrola nad snem přichází méně často než samotná lucidita, ve velkém brazilském průzkumu ji autoři popsali jako vzácnou (Mota-Rolim 2013). Místo přímých příkazů často líp funguje očekávání, třeba „za těmi dveřmi bude moře“, nebo otázka postavě ze snu. Sen je spíš taneční partner než loutka: vede se lépe, když ho necháš odpovídat.",
          "art": "wildBridge"
        },
        {
          "question": "Sen začíná blednout a ztrácí barvy. Co zkusíš?",
          "options": [
            "Otevřít oči, ať si sen zapamatuju",
            "Promnout si dlaně nebo se roztočit a soustředit se na pocit",
            "Vyletět co nejvýš"
          ],
          "answer": 1,
          "explain": "Blednutí obrazu bývá první znamení konce a zapojení hmatu nebo pohybu ho podle zkušeností praktiků oddálí. Data jsou slabá, ale vyzkoušet to nic nestojí."
        }
      ],
      "sources": [
        "LaBerge & Rheingold 1990",
        "LaBerge 1995, NightLight 7(3–4)",
        "Aspy 2017",
        "Mota-Rolim 2013",
        "Picard-Deland 2026"
      ]
    },
    {
      "id": "chronotypeNaps",
      "order": 21,
      "title": "Chronotyp a zdřímnutí",
      "lead": "Proč se REM řídí vnitřními hodinami a kdy má smysl zkoušet luciditu přes den.",
      "minutes": 4,
      "tag": "promising",
      "cards": [
        {
          "title": "REM má vlastní hodiny",
          "body": "Kolik REM dostaneš, neurčuje jen délka spánku, ale i vnitřní hodiny: nejvíc ho přichází kolem nejnižší tělesné teploty, obvykle k ránu. Ukázaly to pokusy s rozhozeným rozvrhem spánku, ve kterých se REM dál držel svého cirkadiánního rytmu (Dijk & Czeisler 1995). Spánek tě nese jako loďka a vnitřní hodiny jsou proud pod ní.",
          "art": "hypnogram"
        },
        {
          "title": "Sova, nebo skřivan",
          "body": "Pokud jsi večerní typ a usínáš kolem jedné, tvé REM okno se na hodinkách posouvá později než u ranních ptáčat. Čas pro techniku Probuzení a návrat do spánku (WBTB) proto počítej od svého skutečného usnutí, ne od pevné hodiny, a pomůžou ti v tom Spánková data. Budík pak míří do tvého rána, ne do rána tvého souseda.",
          "art": "chronoDial",
          "artBrief": "Ciferník 24 hodin jako orbita s malým měsícem a sluncem; oranžový oblouk ukazuje ranní REM okno, druhý tlumený oblouk posunutý o hodinu až dvě později ukazuje okno večerního typu."
        },
        {
          "title": "Chronotyp a sny",
          "body": "Večerní typy si v průřezové studii pamatovaly víc snů (Choo 2023) a v jiných průzkumech hlásily víc nočních můr, hlavně ženy (Nielsen 2010), další studie to ale u můr nepotvrdila. Jestli chronotyp ovlivňuje i lucidní sny, zatím spolehlivě nevíme. Svůj typ neber jako osud, spíš jako jízdní řád.",
          "art": "ladder"
        },
        {
          "title": "Delší ráno",
          "body": "V brazilském průzkumu lidé lucidní sny nejčastěji spojovali s ránem, kdy nemuseli brzy vstávat (Mota-Rolim 2013). Delší spaní přidává právě pozdní REM, nejbohatší úsek noci. Volné ráno je pro luciditu tichý spojenec.",
          "art": "hypnogram"
        },
        {
          "title": "Ranní zdřímnutí",
          "body": "Když si po časném ranním vstávání znovu zdřímneš, často rychle vklouzneš do REM, protože ho po zkrácené noci máš na dluh a vnitřní hodiny jsou na jeho straně. Laboratoře proto zkoušejí indukci lucidity hlavně v ranních zdřímnutích a mají tam vysoká čísla, i když z velké části díky kontextu. LaBergeův institut uváděl, že pomáhá být před takovým zdřímnutím 30–120 minut vzhůru, šlo ale o neformální zprávu bez recenze.",
          "art": "mildLoop"
        },
        {
          "title": "Odpolední šlofík",
          "body": "Odpolední zdřímnutí obsahuje REM méně spolehlivě a u odpočatého člověka bývá spíš lehké nebo hluboké. LaBerge si ale ve vlastních záznamech všiml, že Vědomé usnutí do snu (WILD) mu vycházelo hlavně odpoledne: začínalo tak 13 z 32 lucidních snů ze zdřímnutí, ale jen 1 z 33 z prvního REM noci. Pokud večer špatně usínáš, dlouhé šlofíky raději vynech, noc má přednost.",
          "art": "wildBridge"
        },
        {
          "question": "Jsi sova a usínáš v jednu ráno. Kdy dává smysl budík na WBTB?",
          "options": [
            "Ve čtyři, jako ranní ptáčata",
            "Zhruba 5 hodin po usnutí, tedy kolem šesté",
            "Půl hodiny po usnutí, ať to mám za sebou"
          ],
          "answer": 1,
          "explain": "Výzkum počítá s probuzením zhruba po 5 hodinách spánku, ne podle hodin na zdi. A WBTB nejvýš dvakrát týdně, nikdy dvě noci po sobě a jen po dobré noci."
        }
      ],
      "sources": [
        "Dijk & Czeisler 1995",
        "Nielsen 2010",
        "Choo 2023",
        "Mota-Rolim 2013",
        "Carr 2023",
        "Erlacher & Stumbrys 2020",
        "LaBerge 1994",
        "LaBerge & Rheingold 1990",
        "Aspy 2020"
      ]
    },
    {
      "id": "wearablesAccuracy",
      "order": 22,
      "title": "Jak přesně prsten a hodinky vidí REM",
      "lead": "Oura ani Garmin REM neměří, odhadují ho. Kolik se dá tomu odhadu věřit?",
      "minutes": 4,
      "tag": "strong",
      "cards": [
        {
          "title": "Světla v oknech",
          "body": "Skutečné spánkové fáze se měří polysomnografií, elektrodami, které sledují mozkové vlny, pohyby očí a napětí svalů. Prsten i hodinky vidí jen pohyb, tep a jeho kolísání nebo teplotu a fáze z toho dopočítávají. Je to jako odhadovat, co se děje v domě, podle světel v oknech.",
          "art": "twoHypnograms",
          "artBrief": "Dva hypnogramy nad sebou: nahoře laboratorní polysomnografie světlou linkou, dole odhad prstenu nebo hodinek tlumeně. REM bloky oranžové, v dolním některé posunuté nebo chybějící, s drobnými značkami odchylky."
        },
        {
          "title": "Oura v číslech",
          "body": "Ve studii financované firmou Oura se prsten třetí generace shodoval s laboratoří docela dobře, kappa 0,65 (1 je dokonalá shoda, 0 náhoda), a zachytil 76 % REM (Robbins 2024). V jiné studii jedenácti zařízení ale stejný prsten vyšel na kappa jen 0,35 (Lee 2023). Pro Ouru 4 je nezávislých recenzovaných dat zatím málo.",
          "art": "hypnogram"
        },
        {
          "title": "Garmin v číslech",
          "body": "Starší Garmin Vivosmart 4 dopadl v belgické studii nejhůř ze šesti zařízení na zápěstí: kappa 0,21 a zachytil jen 33 % REM (Schyvens 2025). Novější modely mají lepší algoritmus, nezávislé srovnání s polysomnografií jsme k říjnu 2026 ale nenašli, jen údaje samotného Garminu. REM se u všech zařízení nejčastěji plete s lehkým spánkem.",
          "art": "twoHypnograms",
          "artBrief": "Dva hypnogramy nad sebou: nahoře laboratorní polysomnografie světlou linkou, dole odhad prstenu nebo hodinek tlumeně. REM bloky oranžové, v dolním některé posunuté nebo chybějící, s drobnými značkami odchylky."
        },
        {
          "title": "Minuty REM neber doslova",
          "body": "I když zařízení trefí jednotlivé úseky REM docela často, celkové množství REM za noc odhaduje špatně, a to i v nejpříznivější studii (Robbins 2024). Údaj „REM 1 h 42 min“ proto neber jako měření. Spolehlivější je vzorec přes víc nocí: kdy se tvá REM okna obvykle objevují.",
          "art": "hypnogram"
        },
        {
          "title": "Dvě zařízení: víc jistoty, ne dvojnásobek",
          "body": "Když Oura i Garmin ukážou REM ve stejnou dobu, je odhad o něco jistější. Obě ale vycházejí z podobných signálů, pohybu a tepu, takže často chybují stejně a jejich shoda není nezávislé potvrzení. Nejcennější třetí svědek jsi ty: ranní záznam „probudil jsem se ze snu v 5:40“ v Deníku.",
          "art": "ladder"
        },
        {
          "title": "Předpověď, ne přímý přenos",
          "body": "Pro lucidní snění je klíčové, jak často je odhadnuté „REM“ opravdu REM, a to uvádí jen málo studií: u nejlepších zařízení 73–79 % (Robbins 2024). Data navíc přicházejí až po synchronizaci, takže REM okna jsou předpověď z minulých nocí, ne živý přenos. Ber je jako předpověď počasí: dobrá na plánování, ne na sázky na minutu.",
          "art": "chronoDial",
          "artBrief": "Ciferník 24 hodin jako orbita s malým měsícem a sluncem; oranžový oblouk ukazuje ranní REM okno, druhý tlumený oblouk posunutý o hodinu až dvě později ukazuje okno večerního typu."
        },
        {
          "question": "Oura i Garmin ukázaly REM mezi 5:20 a 5:50. Co to znamená?",
          "options": [
            "V tu dobu určitě probíhal REM",
            "Je to pravděpodobné okno, které stojí za porovnání s tvými záznamy snů",
            "Zařízení se shodla, takže jejich odhad je přesný na minutu"
          ],
          "answer": 1,
          "explain": "Shoda dvou zařízení odhad posiluje, ale obě měří podobné signály, takže nejde o důkaz. Nejlepší kontrolou jsou tvoje ranní záznamy s časem snu."
        }
      ],
      "sources": [
        "Robbins 2024",
        "Lee 2023",
        "Schyvens 2025"
      ]
    }
  ]
}
```

### reflections_new.json

```json
{
  "reflections": [
    {
      "id": "r25",
      "tag": "philosophy",
      "text": "Čuang-c' se ve snu viděl jako motýl a po probuzení nevěděl, jestli je člověk, kterému se zdálo o motýlovi, nebo motýl, kterému se zdá o člověku. Podle čeho ten rozdíl poznáváš ty?",
      "source": "Zhuangzi (Čuang-c'), 4. st. př. n. l., kniha Zhuangzi, kap. 2 Qiwulun"
    },
    {
      "id": "r26",
      "tag": "philosophy",
      "text": "Descartes si všiml, že nenachází žádnou jistou známku, která by spolehlivě oddělila bdění od snu. Zkus tu otázku dnes položit vážně: co ti v tuhle chvíli dává jistotu?",
      "source": "René Descartes, 1641, Meditace o první filosofii, I. meditace"
    },
    {
      "id": "r27",
      "tag": "philosophy",
      "text": "Na konci Meditací Descartes nabízí vodítko: bdělé zážitky se pamětí napojují na zbytek života, sny ne. Přesně tohle zkoumá otázka, jak vede cesta až sem.",
      "source": "René Descartes, 1641, Meditace o první filosofii, VI. meditace"
    },
    {
      "id": "r28",
      "tag": "philosophy",
      "text": "Aristotelés ve spisu O snech popisuje, že ve spánku se někdy v mysli ozve cosi, co oznámí, že to, co se ukazuje, je jen sen. Ten tichý hlas je starší než jakákoli technika.",
      "source": "Aristotelés, 4. st. př. n. l., O snech (De insomniis), 462a"
    },
    {
      "id": "r29",
      "tag": "philosophy",
      "text": "Augustin vypráví o lékaři Gennadiovi, kterého se postava ve snu zeptala, jestli to, co vidí, vidí ve spánku, nebo v bdění. Gennadius odpověděl, že ve spánku. Je to jedna z nejstarších zapsaných otázek, jestli člověk sní, položená přímo uvnitř snu.",
      "source": "Augustin z Hippa, 415, Dopis 159 (Evodiovi)"
    },
    {
      "id": "r30",
      "tag": "theory",
      "text": "Podle teorie prediktivního zpracování mozek nečeká, co mu smysly přinesou, ale neustále odhaduje, co přijde, a smysly hlavně opravují chyby odhadu. Ve spánku je oprav zvenčí málo a odhad běží skoro sám.",
      "source": "Andy Clark, 2013, Whatever next? (Behavioral and Brain Sciences); Hobson & Friston, 2012, Progress in Neurobiology"
    },
    {
      "id": "r31",
      "tag": "theory",
      "text": "Anil Seth popisuje vnímání jako řízenou halucinaci: svět, který vidíš, je nejlepší odhad mozku, který smysly průběžně drží při zemi. Zkus se dnes na chvíli dívat právě takhle.",
      "source": "Anil Seth, 2021, Being You: A New Science of Consciousness"
    },
    {
      "id": "r32",
      "tag": "theory",
      "text": "Jakob Hohwy připomíná, že mozek je ukrytý za smysly a o světě se dozvídá jen nepřímo, z odhadů toho, co jeho vjemy způsobuje. Co ti v tuhle chvíli dává jistotu, že ten odhad sedí?",
      "source": "Jakob Hohwy, 2013, The Predictive Mind"
    },
    {
      "id": "r33",
      "tag": "strong",
      "text": "Když Frederic Bartlett nechal lidi opakovaně převyprávět cizí příběh, každým převyprávěním se víc podobal jejich vlastnímu světu. Paměť neukládá záznam, pokaždé ho skládá znovu.",
      "source": "Frederic C. Bartlett, 1932, Remembering"
    },
    {
      "id": "r34",
      "tag": "strong",
      "text": "V klasickém pokusu stačilo v otázce na autonehodu změnit jedno sloveso a lidé odhadovali vyšší rychlost a častěji si vybavili rozbité sklo, které na záznamu nebylo. Jaké slovo napíšeš do deníku jako první?",
      "source": "Loftus & Palmer, 1974, Journal of Verbal Learning and Verbal Behavior"
    },
    {
      "id": "r35",
      "tag": "strong",
      "text": "Po opakovaném vyprávění si část lidí živě vybaví i událost z dětství, která se nikdy nestala. Živost vzpomínky ještě nedokazuje, že se věc stala, ve snu ani v bdění.",
      "source": "Loftus & Pickrell, 1995, Psychiatric Annals; Scoboria a kol., 2017, Memory (megaanalýza)"
    },
    {
      "id": "r36",
      "tag": "theory",
      "text": "Podle hypotézy konstruktivní simulace skládá paměť vzpomínky z dílků hlavně proto, aby z týchž dílků uměla poskládat i možnou budoucnost. Sen možná pracuje ve stejné dílně.",
      "source": "Schacter & Addis, 2007, Philosophical Transactions of the Royal Society B"
    },
    {
      "id": "r37",
      "tag": "theory",
      "text": "Thomas Metzinger tvrdí, že svět i já jsou modely, které mozek vytváří, a my je jako modely nevidíme, protože jsou průhledné. Lucidní sen uvádí jako chvíli, kdy model přestane být průhledný: víš, že ho tvoří mysl.",
      "source": "Thomas Metzinger, 2003, Being No One; 2009, The Ego Tunnel"
    },
    {
      "id": "r38",
      "tag": "philosophy",
      "text": "Evan Thompson čte lucidní sen jako přirozenou laboratoř vědomí: můžeš být uvnitř světa a zároveň vědět, že ho tvoří mysl. Kolik z toho by šlo přenést do obyčejného dne?",
      "source": "Evan Thompson, 2015, Waking, Dreaming, Being"
    },
    {
      "id": "r39",
      "tag": "theory",
      "text": "Jennifer Windt popisuje sen jako pohlcující halucinaci prostoru a času: ve snu jsi vždy někde a někdy, i když chybí tělo nebo příběh. Kde a kdy jsi teď a jak to víš?",
      "source": "Jennifer M. Windt, 2015, Dreaming: A Conceptual Framework for Philosophy of Mind and Empirical Research"
    },
    {
      "id": "r40",
      "tag": "theory",
      "text": "Allan Hobson navrhl, že REM spánek je protovědomí: mozek si v něm udržuje virtuální model světa a sebe, který pak bdění naplňuje smysly. Je to teorie, ne ověřený fakt, ale dává snu roli tréninkového simulátoru.",
      "source": "J. Allan Hobson, 2009, Nature Reviews Neuroscience"
    },
    {
      "id": "r41",
      "tag": "theory",
      "text": "Podle teorie simulace hrozeb vznikly sny jako bezpečný trénink útěku a obrany. Teorie má podporu i silnou kritiku. Kdyby sen byl cvičiště, co by v tom tvém stálo za nácvik?",
      "source": "Antti Revonsuo, 2000, Behavioral and Brain Sciences"
    },
    {
      "id": "r42",
      "tag": "strong",
      "text": "Zhruba každý druhý člověk aspoň jednou zažil lucidní sen a asi čtvrtina lidí ho má aspoň jednou měsíčně. Nejsi na neznámém území, jen na málo zmapovaném.",
      "source": "Saunders a kol., 2016, Consciousness and Cognition (metaanalýza)"
    },
    {
      "id": "r43",
      "tag": "strong",
      "text": "V roce 2021 odpovídali lucidní snílci ve čtyřech laboratořích na otázky a jednoduché příklady pohyby očí nebo obličejových svalů, přímo ze snu. Správně to vyšlo jen asi v pětině pokusů, ale rozhovor se snícím se ukázal jako možný.",
      "source": "Konkoly a kol., 2021, Current Biology"
    },
    {
      "id": "r44",
      "tag": "promising",
      "text": "Velká analýza EEG z pěti laboratoří u lucidity nenašla slavný frontální signál kolem 40 Hz. Našla spíš pokles beta aktivity v temporoparietální oblasti, která se podílí na vnímání sebe ve světě. Mapa lucidního mozku se teprve kreslí.",
      "source": "Demirel a kol., 2025, Journal of Neuroscience"
    },
    {
      "id": "r45",
      "tag": "promising",
      "text": "Dlouholetí meditující měli lucidní sny víc než dvakrát častěji než nemeditující, ale devítitýdenní kurz všímavosti jejich počet nezměnil. Možná nejde o techniku, ale o roky trpělivé pozornosti.",
      "source": "Baird a kol., 2019, Psychology of Consciousness"
    },
    {
      "id": "r46",
      "tag": "strong",
      "text": "V roce 1975 vyslal Alan Worsley ze snu domluvený signál očima a Keith Hearne ho zachytil na záznamu spánku. Nezávisle to brzy poté ukázal i Stephen LaBerge. Lucidní sen tím přestal být jen vyprávěním a stal se měřitelným jevem.",
      "source": "Keith Hearne, 1978, dizertace, University of Liverpool (pokus v Hullu 1975); LaBerge a kol., 1981, Perceptual and Motor Skills"
    },
    {
      "id": "r47",
      "tag": "strong",
      "text": "Když vědci budili lidi a ptali se, co právě prožívali, sny se objevily i mimo REM a šlo je předpovědět z aktivity zadní části mozkové kůry. Snění není vypínač, spíš plynulá škála.",
      "source": "Siclari a kol., 2017, Nature Neuroscience"
    },
    {
      "id": "r48",
      "tag": "community",
      "text": "Zkušení lucidní snílci často varují, že kdo dělá testy reality bez přemýšlení, udělá je bez přemýšlení i ve snu a usoudí, že je vzhůru. Jaký je rozdíl mezi testem a opravdovou otázkou?",
      "source": "komunita r/LucidDreaming; LaBerge & Rheingold, 1990, Exploring the World of Lucid Dreaming"
    },
    {
      "id": "r49",
      "tag": "community",
      "text": "Markýz d'Hervey de Saint-Denys si desítky let zapisoval sny a popsal, jak se v nich naučil poznávat sen a částečně ho řídit. Jeho jediným přístrojem byl deník.",
      "source": "Hervey de Saint-Denys, 1867, Les Rêves et les moyens de les diriger"
    },
    {
      "id": "r50",
      "tag": "tradition",
      "text": "V tibetské jógě snu není lucidita cílem, ale prostředkem: má pomoci poznat, že i bdělé zážitky mají povahu podobnou snu, a méně na nich lpět. Co kdyby dnešní starosti držely o kousek slaběji?",
      "source": "Tenzin Wangyal Rinpočhe, 1998, The Tibetan Yogas of Dream and Sleep; Andrew Holecek, 2016, Dream Yoga"
    },
    {
      "id": "r51",
      "tag": "tradition",
      "text": "Bönská i buddhistická jóga snu začíná ve dne: opakovaně si připomínat, že to, co právě prožíváš, je jako sen. Noc pak navazuje na návyk, který vznikl za světla.",
      "source": "Tenzin Wangyal Rinpočhe, 1998, The Tibetan Yogas of Dream and Sleep; Andrew Holecek, 2020, Dreams of Light"
    },
    {
      "id": "r52",
      "tag": "tradition",
      "text": "V systému šesti jóg Nárópy je jóga snu jedním článkem řetězu, který pokračuje jasným světlem a přípravou na umírání. Sen tu slouží jako cvičiště pro nejtěžší přechod.",
      "source": "Congkhapa, 15. st., Kniha tří inspirací (angl. přel. Glenn H. Mullin, 1996, Tsongkhapa's Six Yogas of Naropa); W. Y. Evans-Wentz (ed.), 1935, Tibetan Yoga and Secret Doctrines"
    },
    {
      "id": "r53",
      "tag": "tradition",
      "text": "Tibetské tradice odlišují jógu snu od jógy spánku, která usiluje o bdělou přítomnost i v bezesném spánku, kde už nejsou žádné obrazy. Věda pro ten stav zatím nemá ověřenou mapu.",
      "source": "Tenzin Wangyal Rinpočhe, 1998, The Tibetan Yogas of Dream and Sleep; Chögyal Namkhai Norbu, 1992, Dream Yoga and the Practice of Natural Light"
    },
    {
      "id": "r54",
      "tag": "tradition",
      "text": "Učitelé jógy snu radí ve snu se ke strachu obrátit místo útěku. Strach podle nich drží hlavně dojem, že je všechno pevné a skutečné.",
      "source": "Tenzin Wangyal Rinpočhe, 1998, The Tibetan Yogas of Dream and Sleep; Andrew Holecek, 2016, Dream Yoga"
    }
  ]
}
```

### awareness_new.json

```json
{
  "awarenessPrompts": [
    {
      "id": "aw_19",
      "notification": "Sním? Odpověz až po jednom testu.",
      "prompt": "Nejdřív zavři rty a zkus se nadechnout ústy, teprve pak odpověz. Když vzduch projde, sníš."
    },
    {
      "id": "aw_20",
      "notification": "Tři kroky: otázka, rozhled, test.",
      "prompt": "Upřímně se zeptej, jestli sníš, rozhlédni se po něčem divném a udělej jeden fyzický test. Celé to zabere 20 vteřin."
    },
    {
      "id": "aw_21",
      "notification": "Přečti nejbližší nápis. Odvrať oči a znovu.",
      "prompt": "Ve snu se text při druhém čtení často změní nebo rozpadne. Porovnej obě čtení a zeptej se, jestli sníš."
    },
    {
      "id": "aw_22",
      "notification": "Podívej se na hodiny. Pak ještě jednou.",
      "prompt": "Ve snu čas na hodinách při druhém pohledu často skočí nebo nedává smysl. Odvrať se, vrať se a porovnej."
    },
    {
      "id": "aw_23",
      "notification": "Kolik je hodin? Nejdřív odhadni.",
      "prompt": "Odhadni čas a teprve pak se podívej. Sedí odhad s tím, co se dnes dělo, nebo je v tom díra?"
    },
    {
      "id": "aw_24",
      "notification": "Kolik je 17 + 26? Ověř si to dvakrát.",
      "prompt": "Spočítej příklad a pak ho zkontroluj jinou cestou. Ve snu se počítání často zadrhne nebo výsledek uteče."
    },
    {
      "id": "aw_25",
      "notification": "Zavři rty a zkus se nadechnout ústy.",
      "prompt": "Tenhle test používala velká studie ILDIS. Pokud vzduch projde přes zavřené rty, je to sen."
    },
    {
      "id": "aw_26",
      "notification": "Zmáčkni si nos a zkus se nadechnout.",
      "prompt": "Ve snu se často nadechneš i přes ucpaný nos. Udělej to pomalu a s opravdovou zvědavostí, ne ze zvyku."
    },
    {
      "id": "aw_27",
      "notification": "Zkus protlačit prst dlaní druhé ruky.",
      "prompt": "Zatlač ukazovákem do středu dlaně a prohlédni si obě ruce. Ve snu prst může projít nebo ruce vypadají jinak."
    },
    {
      "id": "aw_28",
      "notification": "Spočítej prsty. Pomalu, jeden po druhém.",
      "prompt": "Ve snu jich bývá jiný počet nebo se při počítání mění. Počítej nahlas nebo šeptem, ať to není automat."
    },
    {
      "id": "aw_29",
      "notification": "Podívej se na ruce pět vteřin v kuse.",
      "prompt": "Sleduj tvar, linie a nehty. Ve snu se ruce při delším pohledu často mění nebo rozmazávají."
    },
    {
      "id": "aw_30",
      "notification": "Malý poskok na místě. Jak dopadneš?",
      "prompt": "Poskoč a sleduj, jak tě to stáhne zpátky. Ve snu můžeš zůstat chvíli viset nebo dopadnout zpomaleně."
    },
    {
      "id": "aw_31",
      "notification": "Zkus vypínač. Reaguje světlo, jak má?",
      "prompt": "Ve snech vypínače často nefungují nebo světlo reaguje divně. Když žádný není po ruce, udělej test s dechem."
    },
    {
      "id": "aw_32",
      "notification": "Najdi svůj odraz: okno, displej, lžička.",
      "prompt": "Prohlédni si odraz pozorně, ne jen letmo. Ve snu bývá rozmazaný, cizí nebo se mění."
    },
    {
      "id": "aw_33",
      "notification": "Jak vede cesta až sem? Projdi ji krok po kroku.",
      "prompt": "Vybav si posledních pár minut, které tě sem přivedly. Když v cestě chybí kus, je to typický znak snu."
    },
    {
      "id": "aw_34",
      "notification": "Co se dělo před deseti minutami?",
      "prompt": "Vybav si jeden konkrétní detail z té doby. Navazuje plynule na tuhle chvíli, nebo je mezi nimi skok?"
    },
    {
      "id": "aw_35",
      "notification": "Co bylo tvoje poslední jídlo?",
      "prompt": "Zkus si vybavit chuť, místo a čas. Když se vzpomínka nechce chytit, rozhlédni se po anomáliích."
    },
    {
      "id": "aw_36",
      "notification": "Co bylo dnes ráno úplně první?",
      "prompt": "Projdi si den od probuzení až sem. Souvislá linie mluví pro bdění, mezery jsou důvod udělat test."
    },
    {
      "id": "aw_37",
      "notification": "Kde budeš za hodinu? A dává to smysl?",
      "prompt": "Ve snu plány často nesedí s tím, kde jsi a co máš na sobě. Ověř si to a udělej jeden test."
    },
    {
      "id": "aw_38",
      "notification": "Vyjmenuj tři zvuky, které teď slyšíš.",
      "prompt": "Pojmenuj je, urči, odkud jdou, a posuď, jestli sedí k místu, kde jsi. Pak se zeptej: sním?"
    },
    {
      "id": "aw_39",
      "notification": "Dotkni se něčeho studeného nebo drsného.",
      "prompt": "Vnímej teplotu a texturu pod prsty. Pak zkus zatlačit prst do dlaně a sleduj, jestli neprojde."
    },
    {
      "id": "aw_40",
      "notification": "Nadechni se nosem. Co cítíš?",
      "prompt": "Ve snech bývají vůně vzácné, tak si všimni, jestli nějakou cítíš. Pak se zeptej, jestli jsi opravdu vzhůru."
    },
    {
      "id": "aw_41",
      "notification": "Jakou chuť máš právě v puse?",
      "prompt": "Všimni si chuti nebo jejího chybění. Pak se rozhlédni, jestli je tu něco, co sem nepatří."
    },
    {
      "id": "aw_42",
      "notification": "Zavři oči. Kde přesně máš ruce?",
      "prompt": "Odhadni polohu rukou bez dívání a pak se podívej, jestli to sedí. Při tom spočítej prsty."
    },
    {
      "id": "aw_43",
      "notification": "Cítíš váhu těla? Čím se dotýkáš země?",
      "prompt": "Všimni si chodidel nebo židle pod sebou. Pak se upřímně zeptej, jestli to není sen."
    },
    {
      "id": "aw_44",
      "notification": "Odkud sem teď padá světlo?",
      "prompt": "Najdi zdroj světla a zkontroluj, jestli k němu sedí stíny. Ve snu světlo často nemá jasný původ."
    },
    {
      "id": "aw_45",
      "notification": "Nehýbej očima. Co vidíš na okrajích?",
      "prompt": "Všimni si okraje zorného pole: je stálý, nebo se něco hýbe a mění? Pak udělej jeden test."
    },
    {
      "id": "aw_46",
      "notification": "Najdi kolem sebe jednu věc, která sem nesedí.",
      "prompt": "Hledej opravdu, jako detektiv: barvu, předmět, člověka, zvuk. Když nějakou najdeš, udělej test reality."
    },
    {
      "id": "aw_47",
      "notification": "Objevila se dnes některá z tvých Stop snů?",
      "prompt": "Vzpomeň si na své opakující se motivy. Pokud je jeden z nich právě kolem tebe, zastav se a udělej test."
    },
    {
      "id": "aw_48",
      "notification": "Kdo je kolem tebe? Sedí to?",
      "prompt": "Ve snech se objevují lidé, kteří by tu nemohli být, nebo se mění jejich tváře. Prohlédni si okolí a zeptej se: sním?"
    },
    {
      "id": "aw_49",
      "notification": "Podívej se z okna. Sedí počasí a denní doba?",
      "prompt": "Ve snu se roční období i denní doba umí přeskočit. Porovnej to s tím, co si pamatuješ z rána."
    },
    {
      "id": "aw_50",
      "notification": "Podívej se na předmět, odvrať se, znovu.",
      "prompt": "Zůstal stejný? Ve snu se věci při druhém pohledu rády mění tvarem, barvou nebo nápisem."
    },
    {
      "id": "aw_51",
      "notification": "Pomalu se otoč dokola. Drží svět pohromadě?",
      "prompt": "Sleduj, jestli místnost navazuje tak, jak čekáš. Ve snu se prostor za zády umí přeskládat."
    },
    {
      "id": "aw_52",
      "notification": "Každé dveře dnes ber jako připomínku.",
      "prompt": "Až projdeš dveřmi, zastav se na prahu, rozhlédni se a udělej jeden test. Návyk spojený se situací se do snu přenáší snáz."
    },
    {
      "id": "aw_53",
      "notification": "Cítíš teď něco silně? Zastav se.",
      "prompt": "Silná emoce, strach, nadšení nebo vztek, patří k častým znakům snů. Pojmenuj ji a zeptej se, jestli nesníš."
    },
    {
      "id": "aw_54",
      "notification": "Co tě dnes naposledy překvapilo?",
      "prompt": "Překvapení je chvíle, kdy mysl zaznamenala nesoulad. Vrať se k ní a zeptej se, jestli to nebyl znak snu."
    },
    {
      "id": "aw_55",
      "notification": "Jakou máš náladu na škále 0 až 10?",
      "prompt": "Ohodnoť ji a všimni si, odkud se vzala. Když nevíš proč, rozhlédni se po něčem neobvyklém."
    },
    {
      "id": "aw_56",
      "notification": "Představ si, že tohle je sen. Co by se změnilo?",
      "prompt": "Vezmi tu možnost na chvíli vážně a hledej důkaz pro i proti. Pak rozhodni až po jednom fyzickém testu."
    },
    {
      "id": "aw_57",
      "notification": "Nakresli si na dlaň tečku.",
      "prompt": "Pokaždé, když ji dnes zahlédneš, udělej test reality. Ve snu může tečka chybět nebo vypadat jinak."
    },
    {
      "id": "aw_58",
      "notification": "Zažij chvíli, jako by byla snem. Pak test.",
      "prompt": "Na pár nádechů nech všechno, co vnímáš, plynout jako sen, beze snahy něco měnit. Pak se vrať a udělej jeden test, ať víš."
    }
  ]
}
```

### program_weeks_3_6.json

```json
{
  "days": [
    {
      "id": "d15",
      "day": 15,
      "week": 3,
      "mission": "Zasaď si do paměti větu, která ti ve snu připomene, že sníš.",
      "goal": "Naučit se Záměr poznat sen (MILD) ve dne nanečisto a večer s ním usnout.",
      "science": {
        "title": "Záměr poznat sen (MILD) nanečisto",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Vyber si z deníku jeden nedávný sen.",
          "Zavři oči a přehraj si ho od začátku do konce.",
          "Najdi v něm jednu věc, která by v bdění nedávala smysl.",
          "V duchu řekni: „Až budu příště snít, uvědomím si, že sním.“ Mysli to vážně, není to mantra.",
          "Představ si, že jsi zpátky ve snu, všimneš si té divné věci a poznáš, že sníš.",
          "Večer v posteli to zopakuj, dokud záměr nesedí. Pak klidně usni."
        ]
      },
      "yoga": {
        "title": "Den jako sen, večerní ohlédnutí",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "V posteli si projdi dnešní den jako film.",
          "U každé scény si řekni: „I tohle bylo jako sen.“",
          "Na konci se pevně rozhodni, že dnes v noci sen poznáš."
        ]
      },
      "intention": {
        "when": "Když se ráno probudím ze snu",
        "then": "zůstanu chvíli bez hnutí, přehraju si sen a zopakuji: Až budu příště snít, uvědomím si, že sním."
      },
      "morningTask": "Zapiš každý sen zvlášť a přidej přibližný čas probuzení. U každého ohodnoť luciditu 0–10. Nula je normální výsledek, počítá se zápis.",
      "why": "Záměr poznat sen je nejlépe podložená technika lucidního snění (LaBerge 1980; Aspy 2020). Je to plán ve tvaru když–pak a takové plány lidé plní častěji, hlavně když si je opakují (Gollwitzer & Sheeran 2006). Věta je semínko, vizualizace mu dává půdu."
    },
    {
      "id": "d16",
      "day": 16,
      "week": 3,
      "mission": "Najdi své Stopy snů a udělej z nich háčky pro záměr.",
      "goal": "Objevit tři opakující se motivy ve svých snech a jeden vložit do záměru.",
      "science": {
        "title": "Stopy snů jako spoušť",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Projdi sny v deníku za poslední dva týdny.",
          "Hledej, co se opakuje: místo, osoba, situace, pocit, nemožná věc.",
          "Tři nejčastější motivy si označ jako Stopy snů.",
          "Večer při Záměru poznat sen si představ, že jednu z nich potkáš a hned poznáš, že sníš.",
          "Příklad věty: „Až budu zase ve staré škole, poznám, že sním.“"
        ]
      },
      "yoga": {
        "title": "Jako sen, třikrát za den",
        "minutes": 2,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "Třikrát za den se na 20 až 60 sekund zastav.",
          "Rozhlédni se a řekni si: „Tohle je jako sen.“",
          "Vnímej barvy, zvuky a tělo s čerstvou zvědavostí.",
          "Pak se vrať k tomu, co děláš. Svět je skutečný, jen se na něj díváš jinak."
        ]
      },
      "intention": {
        "when": "Když večer zhasnu",
        "then": "vybavím si svou nejčastější Stopu snů a řeknu: Až ji uvidím, poznám, že sním."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. U každého snu označ Stopy snů, které v něm najdeš. Nová Stopa je malé vítězství.",
      "why": "Sny mají opakující se znaky a kdo je zná, snáz si ve snu všimne, že něco nesedí (LaBerge 1985). Proto první dva týdny patřily paměti: bez zapsaných snů nejsou Stopy, které by šlo hledat. Stopa je jako maják na pobřeží, které znáš jen ze snů."
    },
    {
      "id": "d17",
      "day": 17,
      "week": 3,
      "mission": "Rozhodni předem, co uděláš, až poznáš, že sníš.",
      "goal": "Přidat do záměru jednu jednoduchou akci ve snu.",
      "science": {
        "title": "Plánovaná akce ve snu",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Vyber jednu jednoduchou akci do snu. Třeba: podívám se na dlaně a řeknu „Tohle je sen.“",
          "Spoj ji se záměrem: „Až budu příště snít, uvědomím si, že sním, a podívám se na dlaně.“",
          "Při vizualizaci tu akci v duchu proveď, pomalu a jasně.",
          "Večer v posteli celé zopakuj, dokud to nesedí."
        ]
      },
      "yoga": {
        "title": "Zklidňující dech před spaním",
        "minutes": 3,
        "techniqueId": "dreamYogaBreath",
        "evidence": "tradition",
        "steps": [
          "Lehni si a pár minut dýchej pomalu nosem.",
          "S každým výdechem pusť kus napětí dne: ramena, čelist, ruce.",
          "Pak nech dech běžet samotný a jen ho pozoruj.",
          "Jóga snu otevírá noc očistnými dechy. Tohle je jejich jednoduchá verze."
        ]
      },
      "intention": {
        "when": "Když ve snu poznám, že sním",
        "then": "podívám se na své dlaně a řeknu: Tohle je sen."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Pokud byl sen lucidní, poznač si, jestli se povedla plánovaná akce. Je to tvůj důkaz, že nešlo jen o sen o luciditě.",
      "why": "LaBerge a kol. (2018) přidali do záměru předem zvolenou akci. Dává snu úkol a ráno pomáhá poznat, jestli byl sen opravdu lucidní. Je to jako domluvený signál s posádkou, ještě než odletíš."
    },
    {
      "id": "d18",
      "day": 18,
      "week": 3,
      "mission": "Ať je záměr poslední myšlenkou před spánkem.",
      "goal": "Usnout se záměrem v mysli, bez počítání a bez křečovité snahy.",
      "science": {
        "title": "Usnout se záměrem",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "V posteli zopakuj větu i vizualizaci s plánovanou akcí.",
          "Když mysl odběhne, bez výčitek začni znovu.",
          "Opakování nepočítej. Rozhoduje, jestli záměr sedí, ne kolikrát zazněl.",
          "Klidně při tom usni. Ve studiích tak usnula většina lidí a nevadilo to."
        ]
      },
      "yoga": {
        "title": "Reakce jako vlny ve snu",
        "minutes": 2,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Když tě dnes něco naštve nebo potěší, všimni si toho.",
          "Pojmenuj pocit jedním slovem.",
          "Řekni si: „I tahle reakce je jako ve snu. Přijde a odejde.“",
          "Pak jednej, jak uznáš za vhodné. Nejde o potlačení, jen o odstup."
        ]
      },
      "intention": {
        "when": "Když se mi při záměru zatoulá mysl",
        "then": "v klidu se vrátím k větě a k obrazu snu."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Poznač si, jestli sis při usínání pamatoval záměr. Ano i ne jsou užitečná data.",
      "why": "Ve studii NALDIS měl být záměr posledním obsahem mysli před usnutím (Aspy a kol. 2017). Počet opakování s úspěchem nesouvisel (Aspy 2020). Záměr je jako cíl v navigaci: stačí ho zadat jednou a dobře."
    },
    {
      "id": "d19",
      "day": 19,
      "week": 3,
      "mission": "Využij ranní okno, které ti noc nabízí zadarmo.",
      "goal": "Zkusit Záměr poznat sen při přirozeném ranním probuzení, bez budíku.",
      "science": {
        "title": "Záměr při ranním probuzení",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Když se brzy ráno probudíš sám a máš ještě čas spát, zůstaň ležet bez hnutí.",
          "Přehraj si sen, ze kterého ses probudil, a zapiš pár klíčových slov.",
          "Lehni si zpátky a dělej Záměr poznat sen, dokud záměr nesedí.",
          "Pak techniku pusť a usni.",
          "Když už je čas vstávat, jen zapiš sen a vstaň. Kvůli technice nepřispávej na úkor povinností."
        ]
      },
      "yoga": {
        "title": "Kroky jako ve snu",
        "minutes": 3,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "Když dnes půjdeš pěšky, vnímej krok za krokem.",
          "Řekni si: „Jdu krajinou, která je jako sen.“",
          "Všimni si světla, zvuků a pohybu lidí kolem.",
          "Na konci cesty se vrať do běžného režimu."
        ]
      },
      "intention": {
        "when": "Když se brzy ráno probudím a mám ještě čas",
        "then": "zapíšu sen, lehnu si zpátky a s větou o snu znovu usnu."
      },
      "morningTask": "Zapiš sen před ranním probuzením a sen po něm zvlášť, každý s časem. Ohodnoť luciditu 0–10. Ranní sny bývají delší a živější, všimni si rozdílu.",
      "why": "REM fáze se k ránu prodlužují, proto má lucidní sen největší šanci v druhé polovině noci (Erlacher a kol. 2022). Přirozené probuzení je okno bez budíku: nic nenarušíš a spánek neztratíš. Je to jako vystoupit na stanici, kde vlak stejně zastavuje."
    },
    {
      "id": "d20",
      "day": 20,
      "week": 3,
      "mission": "Přehraj si včerejší sen znovu, tentokrát lucidně.",
      "goal": "Nacvičit ve dne návrat do snu a okamžik, kdy poznáš, že sníš.",
      "science": {
        "title": "Zkouška snu ve dne",
        "minutes": 5,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Vyber sen z posledních nocí, nejlépe se Stopou snů.",
          "Zavři oči a vrať se do něj.",
          "Ve chvíli, kdy se Stopa objeví, si představ: „Moment, tohle je sen.“",
          "Proveď plánovanou akci a nech sen chvíli klidně pokračovat.",
          "Zopakuj to dvakrát až třikrát. Večer stačí jedna krátká verze."
        ]
      },
      "yoga": {
        "title": "Jídlo jako ve snu",
        "minutes": 2,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "U jednoho jídla dnes zpomal.",
          "Vnímej chuť, vůni a teplotu, jako bys je ochutnával ve snu.",
          "Řekni si: „I tohle je jako sen.“ Pak normálně dojez."
        ]
      },
      "intention": {
        "when": "Když dnes večer zhasnu",
        "then": "projdu si nacvičený sen ještě jednou a usnu s plánovanou akcí v mysli."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Poznač si, jestli se ve snu objevila nacvičená scéna nebo Stopa snů.",
      "why": "Vizualizace návratu do snu je jádrem Záměru poznat sen (LaBerge 1980). Ve studiích lidé techniku jednou zkusili ve dne, než ji použili v noci (Aspy 2020). Je to jako trénink v simulátoru před prvním startem."
    },
    {
      "id": "d21",
      "day": 21,
      "week": 3,
      "mission": "Ohlédni se za týdnem a oslav, co jsi udělal.",
      "goal": "Uvidět pokrok v procesu: sny, Stopy snů, pokusy. Bez sérií a bez hodnocení výsledků.",
      "science": {
        "title": "Týdenní ohlédnutí: Záměr poznat sen",
        "minutes": 5,
        "techniqueId": "dreamJournal",
        "evidence": "promising",
        "steps": [
          "Spočítej sny, které sis tento týden zapsal.",
          "Kolik Stop snů jsi našel? Každá nová se počítá.",
          "Kolikrát jsi zkusil Záměr poznat sen? Pokus je úspěch sám o sobě.",
          "Vyber znění věty, které ti sedí nejvíc, a nech si ho.",
          "Vynechané dny nic nemažou. Pokračuješ tam, kde jsi.",
          "Cítíš se přes den odpojeně nebo nereálně? Dej si pauzu a týden jen deník."
        ]
      },
      "yoga": {
        "title": "Radost z úsilí",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Projdi sny z celého týdne.",
          "U každého zapsaného snu si v duchu řekni: dobře.",
          "Bez kritiky obnov záměr na další týden."
        ]
      },
      "intention": {
        "when": "Když mi týden nepřinese lucidní sen",
        "then": "připomenu si, že u většiny lidí jde o týdny, a pochválím se za každý zápis."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10 a vyplň Jak ses vyspal. Sleduj, jestli ti Záměr nebere spánek.",
      "why": "V přehledu gamifikace byla nejdůležitějším prvkem zpětná vazba (Yu a kol. 2025) a vynechaný den tvorbu návyku nenarušuje (Lally a kol. 2010). Proto tu nejsou série, jen přehled. Záměrně navozované lucidní sny mohou u citlivých lidí zvyšovat pocity odpojení (Aviram & Soffer-Dudek 2018), takže pauza je součástí tréninku."
    },
    {
      "id": "d22",
      "day": 22,
      "week": 4,
      "mission": "Nauč se druhou techniku: Střídání smyslů.",
      "goal": "Vyzkoušet Střídání smyslů (SSILD) ve dne, v klidu a bez očekávání.",
      "science": {
        "title": "Střídání smyslů (SSILD) nanečisto",
        "minutes": 7,
        "techniqueId": "ssild",
        "evidence": "promising",
        "steps": [
          "Sedni si nebo lehni a zavři oči. Postoj je pasivní, nic nenuť.",
          "Zrak: pozornost na tmu za víčky. Nesnaž se nic vidět.",
          "Sluch: přesuň pozornost do uší. Vzdálené zvuky, vlastní tep.",
          "Tělo: tíha, teplota, mravenčení. Jen pozoruj.",
          "Nejdřív 4 rychlá kola, 2 až 3 sekundy na smysl. Pak 4 až 6 pomalých, asi 20 sekund na smysl.",
          "Sekundy nepočítej. Odhad stačí, přesnost tu nehraje roli."
        ]
      },
      "yoga": {
        "title": "Smysly jako sen",
        "minutes": 2,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "Dnes několikrát vnímej zvlášť, co vidíš, slyšíš a cítíš tělem.",
          "U každého smyslu si řekni: „I tohle je jako sen.“",
          "Večer si všimni, jestli se ti dnešní vjemy vybavují ostřeji."
        ]
      },
      "intention": {
        "when": "Když se ráno sám probudím a mám ještě čas",
        "then": "udělám Záměr poznat sen jako minulý týden a znovu usnu."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Poznač, který smysl byl ve snu nejsilnější: obraz, zvuk, nebo tělo.",
      "why": "Střídání smyslů vyšlo ve velké domácí studii stejně jako Záměr poznat sen: 16,9 % proti 16,5 % nocí s lucidním snem (Aspy 2020). Má zatím jen jednu velkou terénní studii, proto nese štítek slibné. Je to jako ladit rádio: neotáčíš silou, jen jemně posouváš."
    },
    {
      "id": "d23",
      "day": 23,
      "week": 4,
      "mission": "Zkus Střídání smyslů v ranním okně.",
      "goal": "Použít Střídání smyslů při přirozeném ranním probuzení a pak normálně usnout.",
      "science": {
        "title": "Střídání smyslů v ranním okně",
        "minutes": 7,
        "techniqueId": "ssild",
        "evidence": "promising",
        "steps": [
          "Když se ráno probudíš sám a máš čas, zůstaň ležet se zavřenýma očima.",
          "Udělej 4 rychlá kola: zrak, sluch, tělo.",
          "Pak 4 až 6 pomalých kol. Nic nečekej, jen pozoruj.",
          "Potom techniku pusť a usni, jak jsi zvyklý.",
          "Celé to má trvat 5 až 7 minut. Nepřidávej větu ze Záměru, tahle kombinace vyšla ve studii nejhůř."
        ]
      },
      "yoga": {
        "title": "Odstup od chtění a odporu",
        "minutes": 2,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Když dnes ucítíš silnou chuť nebo odpor, zastav se na tři dechy.",
          "Pojmenuj, co se děje: chci, nechci, bojím se.",
          "Řekni si: „Je to jako ve snu.“ Pak se rozhodni, co uděláš."
        ]
      },
      "intention": {
        "when": "Když se ráno probudím a mám ještě čas",
        "then": "projdu zrak, sluch a tělo, nejdřív rychle, pak pomalu, a nechám se usnout."
      },
      "morningTask": "Zapiš sen před ranním probuzením i po něm zvlášť, každý s časem. U obou lucidita 0–10. Poznač, jestli jsi usnul během kol, nebo až po nich.",
      "why": "Delší sezení Střídání smyslů souviselo s úspěchem mírně negativně a hybrid se Záměrem vyšel ze všech skupin nejhůř (Aspy 2020). Krátce a lehce je tu lepší než dlouze a usilovně. Techniku pustíš jako lano, když loď vyplouvá."
    },
    {
      "id": "d24",
      "day": 24,
      "week": 4,
      "mission": "Připrav svou první noční výpravu.",
      "goal": "Naplánovat první Probuzení a návrat do spánku (WBTB) a projít si celý postup ve dne. Dnes spíš bez budíku.",
      "science": {
        "title": "Celý postup nanečisto",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Ve Spánkových datech zjisti, kdy obvykle opravdu usínáš.",
          "Spočítej čas budíku: usnutí plus 5 hodin. Upravit ho můžeš mezi 4,5 a 6 hodinami.",
          "Vyber noc před volnem, kdy ráno nemusíš brzy vstávat. Výprava je nejvýš 2× týdně a nikdy dvě noci po sobě.",
          "Ve dne si jednou projdi celý postup: budík, zápis snu, krátké bdění, Záměr poznat sen.",
          "Večer si postup přečti ještě jednou. Dnes spi normálně, budík nenastavuj."
        ]
      },
      "yoga": {
        "title": "Večerní záměr jógy snu",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Večer si projdi den jako sen.",
          "Rozhodni se, že sen poznáš, kdykoli přijde.",
          "Usni s tímto rozhodnutím, bez tlaku na výsledek."
        ]
      },
      "intention": {
        "when": "Když se mi zítřejší noc pro výpravu nehodí",
        "then": "přesunu ji na jinou noc tohoto týdne a do té doby dělám jen Záměr při ranním probuzení."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Podívej se, v kolik ses ze snů probouzel. Časy ti napoví, kde máš ráno REM.",
      "why": "Ve studiích lidé dostali návod předem, techniku jednou zkusili ve dne a každý večer si postup přečetli (Aspy a kol. 2017; Aspy 2020). Budík se počítá od skutečného usnutí, ne od večerky. Probuzení po 4,5 hodině vyšlo hůř než dřívější výsledky po 6 hodinách, jde ale jen o srovnání dvou studií (Erlacher a kol. 2022)."
    },
    {
      "id": "d25",
      "day": 25,
      "week": 4,
      "mission": "První noční výprava: probuď se v půli noci a vrať se se záměrem.",
      "goal": "Vyzkoušet Probuzení a návrat do spánku (WBTB) se Záměrem poznat sen, jen pokud jsou splněné podmínky.",
      "science": {
        "title": "Probuzení a návrat do spánku (WBTB) se Záměrem",
        "minutes": 30,
        "techniqueId": "wbtb",
        "evidence": "strong",
        "steps": [
          "Nejdřív podmínky: včera ses dobře vyspal a nebyla to noc s výpravou, zítra nemáš brzkou povinnost a cítíš se odpočatý. Pokud ses nevyspal, dnes jen Záměr při ranním probuzení.",
          "Nastav jediný budík na 5 hodin po usnutí. Dej ho tak, abys k němu musel vstát.",
          "Po budíku nejdřív zapiš sen, i když je to jen útržek.",
          "Zůstaň vzhůru 10 až 30 minut. Posaď se, rozsviť tlumeně a přečti si postup.",
          "Vrať se do postele a dělej Záměr poznat sen, dokud záměr nesedí.",
          "Cílem je usnout do 10 minut. Když to nejde, techniku pusť a jen odpočívej."
        ]
      },
      "yoga": {
        "title": "Den jako sen a pevné rozhodnutí",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Před spaním si projdi den jako sen.",
          "Rozhodni se: „Dnes v noci sen poznám.“",
          "Pak už na nic nemysli a usni."
        ]
      },
      "intention": {
        "when": "Když po technice nemůžu usnout",
        "then": "pustím ji, budu klidně dýchat a nechám spánek přijít. Spánek má přednost."
      },
      "morningTask": "Zapiš sen před budíkem i sny po návratu zvlášť, každý s časem. U každého lucidita 0–10. V Jak ses vyspal buď upřímný, je to důležitější než lucidita.",
      "why": "Samotné probuzení bez lucidního záměru vyšlo na úrovni náhody (Klofat a kol. 2024). S krátkou technikou je to nejlépe podložený domácí postup: ve velké studii vyšel na zhruba 16,5 % nocí s lucidním snem a rozhodovalo usnutí do 10 minut (Aspy 2020). Je to krátké mezipřistání: dotkneš se země a hned letíš dál."
    },
    {
      "id": "d26",
      "day": 26,
      "week": 4,
      "mission": "Vyhodnoť noční výpravu a dopřej si celou noc.",
      "goal": "Zjistit, jak ti noční probuzení sedlo, a doladit ho. Dnes spíš bez budíku.",
      "science": {
        "title": "Ladění po první výpravě",
        "minutes": 5,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Podívej se na Jak ses vyspal a na Spánková data z minulé noci.",
          "Usnul jsi po technice do 10 minut? Odhad stačí.",
          "Usínal jsi tak rychle, že se záměr ztratil? Příště rozsviť na pár minut a přečti si postup znovu.",
          "Usínal jsi těžko? Příště nech zhasnuto, budík dej k posteli a zvol tišší tón.",
          "Dnes spi bez budíku. Záměr jen při přirozeném ranním probuzení."
        ]
      },
      "yoga": {
        "title": "Pusť očekávání",
        "minutes": 2,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Pokud se lucidní sen nekonal, všimni si zklamání.",
          "Pojmenuj ho a nech ho odplout jako mrak ve snu.",
          "Řekni si: „Pokus se počítá.“"
        ]
      },
      "intention": {
        "when": "Když se dnes ráno probudím sám",
        "then": "zapíšu sen a udělám krátký Záměr poznat sen, bez budíku a bez tlaku."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Porovnej v deníku, kolik snů sis pamatoval po noci s budíkem a kolik dnes.",
      "why": "Úpravy podle bdělosti pocházejí přímo z návodu velké domácí studie (Aspy 2020). Hlavním rizikem lucidního snění není sen, ale narušený spánek (Vallat & Ruby 2019). Proto po noci s budíkem přichází noc bez něj."
    },
    {
      "id": "d27",
      "day": 27,
      "week": 4,
      "mission": "Nauč se poznat falešné probuzení.",
      "goal": "Spojit Střídání smyslů v ranním okně s krátkou kontrolou po každém probuzení.",
      "science": {
        "title": "Smysly a kontrola po probuzení",
        "minutes": 7,
        "techniqueId": "ssild",
        "evidence": "promising",
        "steps": [
          "Při každém probuzení se nejdřív zeptej: „Jsem opravdu vzhůru?“",
          "Udělej jeden test: zavři rty a zkus se nadechnout ústy.",
          "Když vzduch neprojde, jsi vzhůru. Když projde, sníš. Zůstaň klidný.",
          "Pak, máš-li čas, udělej 4 rychlá a 4 až 6 pomalých kol smyslů.",
          "Techniku pusť a usni."
        ]
      },
      "yoga": {
        "title": "Dech pod dlaní",
        "minutes": 3,
        "techniqueId": "dreamYogaBreath",
        "evidence": "tradition",
        "steps": [
          "Lehni si na záda a polož si ruku na břicho.",
          "Nadechni se nosem a pomalu vydechni. Vnímej, jak se ruka zvedá a klesá.",
          "Po pár minutách nech dech běžet sám a usínej."
        ]
      },
      "intention": {
        "when": "Když se ráno probudím v posteli",
        "then": "nejdřív udělám test s dechem, abych věděl, jestli nesním."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Pokud ses ve snu probudil a pak ses probudil znovu, označ to v poznámce jako falešné probuzení.",
      "why": "Falešná probuzení bývají bránou k luciditě: v jedné laboratorní studii se 17 ze 121 snů stalo lucidními právě po falešném probuzení (Peters a kol. 2026, preprint). Test s dechem přes zavřené rty používala velká domácí studie (Aspy 2020). Je to jako ověřit, že jsi opravdu přistál, než otevřeš poklop."
    },
    {
      "id": "d28",
      "day": 28,
      "week": 4,
      "mission": "Ohlédni se za týdnem smyslů a první výpravy.",
      "goal": "Ocenit pokusy a zkontrolovat, jak se noční probuzení snáší se spánkem. Bez sérií.",
      "science": {
        "title": "Týdenní ohlédnutí: smysly a noc",
        "minutes": 5,
        "techniqueId": "dreamJournal",
        "evidence": "promising",
        "steps": [
          "Spočítej zapsané sny a nové Stopy snů.",
          "Které techniky jsi zkusil? Záměr, Střídání smyslů, noční probuzení. Každá se počítá.",
          "Která ti byla příjemnější? To je první řádek tvého receptu.",
          "Jak ses vyspal po noci s budíkem? Pokud špatně, příští týden stačí jedna výprava.",
          "Cítíš se přes den odpojeně? Dej si pauzu od technik a nech jen deník."
        ]
      },
      "yoga": {
        "title": "Radost z úsilí",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Projdi sny týdne a u každého si řekni: dobře.",
          "Vzpomeň si na chvíli, kdy jsi byl při technice opravdu přítomný.",
          "Obnov záměr na další týden, bez kritiky."
        ]
      },
      "intention": {
        "when": "Když mi některá technika nejde",
        "then": "přepnu na tu druhou nebo si dám den jen s deníkem."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Vyplň Jak ses vyspal a porovnej ho s nocí s budíkem.",
      "why": "Obě techniky vyšly ve studii srovnatelně, takže rozhoduje, co sedí tobě (Aspy 2020). Nepříjemné zážitky se pojí hlavně s neúspěšnými pokusy, ne s luciditou samotnou (Mallett a kol. 2022). Méně pokusů po dobré noci je víc než hodně pokusů v únavě."
    },
    {
      "id": "d29",
      "day": 29,
      "week": 5,
      "mission": "Prober se ve dne, aby ses mohl probrat i ve snu.",
      "goal": "Zkusit Vědomí po celý den (ADA) se třemi poctivými kontrolami.",
      "science": {
        "title": "Vědomí po celý den (ADA)",
        "minutes": 5,
        "techniqueId": "ada",
        "evidence": "community",
        "steps": [
          "Vyber si tři kotvy dne, třeba průchod dveřmi, odemčení telefonu a pití vody.",
          "U každé kotvy se na pár dechů zastav a zeptej se: „Kde jsem? Jak jsem se sem dostal? Sním?“",
          "Rozhlédni se po něčem divném. Pak udělej jeden test: zavři rty a zkus se nadechnout ústy.",
          "Mezi kotvami jen lehce vnímej, kde jsi a co děláš.",
          "Nejde o počet. Tři poctivé kontroly mají větší cenu než deset rychlých.",
          "Pokud ti testy připadají jako zátěž, vynech je. Záměr funguje i bez nich."
        ]
      },
      "yoga": {
        "title": "Kotva jako sen",
        "minutes": 2,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "Při každé kotvě si řekni: „Tohle je jako sen.“",
          "Říkej jako sen, ne nic není skutečné. Jde o pohled, ne o popření světa.",
          "Když se cítíš nepříjemně odpojeně, dotkni se pevného předmětu a pojmenuj pět věcí kolem sebe."
        ]
      },
      "intention": {
        "when": "Když projdu dveřmi",
        "then": "zastavím se na jeden dech a zeptám se: Sním?"
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Objevila se ve snu některá z tvých kotev? Označ ji jako Stopu snů.",
      "why": "Vědomí po celý den je komunitní praxe bez vlastní studie. Samotné testy reality ve studiích nepomohly a jejich počet za den s luciditou nesouvisel (Aspy 2020; Schredl 2025). Ber je jako trénink pozornosti, ne jako čárky v tabulce."
    },
    {
      "id": "d30",
      "day": 30,
      "week": 5,
      "mission": "Druhá výprava: vrať se do spánku přes smysly.",
      "goal": "Vyzkoušet Probuzení a návrat do spánku (WBTB) se Střídáním smyslů, jen pokud jsou splněné podmínky.",
      "science": {
        "title": "Probuzení a návrat do spánku (WBTB) se Střídáním smyslů",
        "minutes": 25,
        "techniqueId": "wbtb",
        "evidence": "promising",
        "steps": [
          "Nejdřív podmínky: včera ses dobře vyspal a nebyla to noc s výpravou, zítra nemáš brzkou povinnost a cítíš se odpočatý. Pokud ses nevyspal, dnes jen Záměr při ranním probuzení.",
          "Jediný budík na 5 hodin po usnutí. Uprav ho podle první výpravy, v rozsahu 4,5 až 6 hodin.",
          "Po budíku zapiš sen a zůstaň vzhůru 10 až 30 minut.",
          "V posteli 4 rychlá kola smyslů, pak 4 až 6 pomalých. Sekundy nepočítej.",
          "Potom techniku pusť a usni normálně. Cílem je usnout do 10 minut."
        ]
      },
      "yoga": {
        "title": "Tři chvíle dne jako sen",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Před spaním si vybav tři nejživější chvíle dne.",
          "U každé si řekni: „Bylo to jako sen.“",
          "Rozhodni se, že sen v noci poznáš, a pusť myšlenky."
        ]
      },
      "intention": {
        "when": "Když se při kolech smyslů přistihnu, že přemýšlím",
        "then": "bez výčitek přejdu k dalšímu smyslu."
      },
      "morningTask": "Zapiš sen před budíkem a sny po návratu zvlášť, s časem a luciditou 0–10. Porovnej s nocí se Záměrem: po které technice se ti usínalo snáz?",
      "why": "Přesně tenhle postup testovala velká domácí studie: probuzení po 5 hodinách, Střídání smyslů a rychlé usnutí. Vyšel na 16,9 % nocí s lucidním snem (Aspy 2020). Jde o jednu velkou studii, proto štítek slibné."
    },
    {
      "id": "d31",
      "day": 31,
      "week": 5,
      "mission": "Pozvi si do snu konkrétní místo.",
      "goal": "Vyzkoušet Inkubaci snu: zvolit téma a usnout s ním.",
      "science": {
        "title": "Inkubace snu",
        "minutes": 5,
        "techniqueId": "incubation",
        "evidence": "promising",
        "steps": [
          "Vyber jedno příjemné téma: místo, otázku nebo činnost. Nic děsivého.",
          "Napiš ho jednou větou do deníku.",
          "Večer si ho 2 až 3 minuty živě představ: co vidíš, slyšíš a cítíš.",
          "Přidej záměr: „Až tam budu, poznám, že sním.“",
          "Usni s obrazem v mysli. Když se rozplyne, nevadí."
        ]
      },
      "yoga": {
        "title": "Pozvi, ale nelpi",
        "minutes": 2,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Téma do snu pozvi, ale nelpi na něm.",
          "Když přijde něco jiného, přijmi to jako hosta.",
          "Ráno se raduj z jakéhokoli snu, který si pamatuješ."
        ]
      },
      "intention": {
        "when": "Když večer zavřu oči",
        "then": "vybavím si své místo a řeknu: Až tam budu, poznám, že sním."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. U každého snu poznač, jestli se v něm objevilo téma: celé, náznakem, nebo vůbec.",
      "why": "Inkubace má slibná data: zhruba polovina studentů snila o tématu, které si zadala (Barrett 1993), a cílené podněty při usínání dostaly téma do snů častěji (Haar Horowitz a kol. 2020). Inkubace cílí na obsah snu, ne na luciditu. Spojení se záměrem je tvůj vlastní experiment."
    },
    {
      "id": "d32",
      "day": 32,
      "week": 5,
      "mission": "Udělej ze silných emocí spoušť vědomí.",
      "goal": "Při silném pocitu si všimnout, v jakém jsi stavu, a zeptat se, jestli sníš.",
      "science": {
        "title": "Vědomí po celý den: emoce",
        "minutes": 5,
        "techniqueId": "ada",
        "evidence": "community",
        "steps": [
          "Když dnes přijde silný pocit, radost, vztek nebo strach, zastav se.",
          "Zeptej se: „Dává tahle situace smysl? Vím, jak jsem se sem dostal?“",
          "Udělej jeden test: zkus protlačit prst dlaní druhé ruky a prohlédni si ruce.",
          "Pojmenuj pocit jedním slovem a pokračuj.",
          "Večer zapiš, který pocit byl dnes nejčastější. Může to být tvá Stopa snů."
        ]
      },
      "yoga": {
        "title": "Zůstat s pocitem",
        "minutes": 2,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Před jedním nepříjemným pocitem dnes hned neutíkej.",
          "Vnímej ho pár dechů v těle: kde sedí, jak je velký.",
          "Řekni si: „I tohle je jako ve snu.“ Pak se rozhodni, co uděláš."
        ]
      },
      "intention": {
        "when": "Když ucítím silnou emoci",
        "then": "zastavím se a zeptám se: Sním?"
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. U každého snu poznač nejsilnější emoci.",
      "why": "LaBerge řadí pocity mezi znaky snů ve skupině vnitřního prožívání (LaBerge & Rheingold 1990). Test s prstem a dlaní používala velká domácí studie (Aspy 2020). Vědomí po celý den je komunitní praxe, takže jistě nevíme, jak moc pomáhá. Sleduj to na sobě."
    },
    {
      "id": "d33",
      "day": 33,
      "week": 5,
      "mission": "Třetí výprava: vrať se do své inkubované scény.",
      "goal": "Spojit Probuzení a návrat do spánku (WBTB) se Záměrem poznat sen a s vlastním tématem, jen pokud jsou splněné podmínky.",
      "science": {
        "title": "Probuzení a návrat do spánku (WBTB) se Záměrem a tématem",
        "minutes": 30,
        "techniqueId": "wbtb",
        "evidence": "strong",
        "steps": [
          "Nejdřív podmínky: včera ses dobře vyspal a nebyla to noc s výpravou, zítra nemáš brzkou povinnost a cítíš se odpočatý. Pokud ses nevyspal, dnes jen Záměr při ranním probuzení.",
          "Jediný budík na 5 hodin po usnutí, v rozsahu 4,5 až 6 hodin.",
          "Po budíku zapiš sen a zůstaň vzhůru 10 až 30 minut.",
          "V posteli si vybav sen, ze kterého ses probudil, nebo svou inkubovanou scénu.",
          "Dělej Záměr poznat sen: představ si, že jsi tam a poznáváš, že sníš.",
          "Cílem je usnout do 10 minut. Když to nejde, pusť to a odpočívej."
        ]
      },
      "yoga": {
        "title": "Dech před výpravou",
        "minutes": 3,
        "techniqueId": "dreamYogaBreath",
        "evidence": "tradition",
        "steps": [
          "Před spaním se pohodlně uvelebi a dýchej pomalu nosem.",
          "S každým výdechem pusť jednu starost dne.",
          "Pak nech dech být a usínej."
        ]
      },
      "intention": {
        "when": "Když se ocitnu na svém místě ze snu",
        "then": "poznám, že sním, a podívám se na dlaně."
      },
      "morningTask": "Zapiš sen před budíkem a sny po návratu zvlášť, s časem a luciditou 0–10. Poznač, jestli se objevilo inkubované téma.",
      "why": "Záměr poznat sen po probuzení je nejlépe podložená domácí kombinace (Aspy 2020). Původní postup vizualizuje návrat do snu, ze kterého ses probudil (LaBerge 1980). Inkubovaná scéna místo něj je tvoje varianta, tak si poctivě zapiš, jak dopadla."
    },
    {
      "id": "d34",
      "day": 34,
      "week": 5,
      "mission": "Přepiš sen tak, aby v něm bylo místo pro luciditu.",
      "goal": "Nacvičit ve dne nový průběh snu s okamžikem, kdy poznáš, že sníš.",
      "science": {
        "title": "Nácvik snu",
        "minutes": 5,
        "techniqueId": "incubation",
        "evidence": "promising",
        "steps": [
          "Vyber sen z deníku, který se opakuje nebo tě zajímá.",
          "Představ si ho znovu a v klíčovém místě poznej, že sníš.",
          "Dej mu nový směr, jaký chceš.",
          "Přehrávej si novou verzi 3 až 5 minut ve dne a krátce večer.",
          "Těžké noční můry na sebe sám nenakládej. Na ně je Přepis noční můry (IRT) a u traumatu odborník."
        ]
      },
      "yoga": {
        "title": "Setkání jako ve snu",
        "minutes": 2,
        "techniqueId": "dreamYogaDay",
        "evidence": "tradition",
        "steps": [
          "Při jednom rozhovoru dnes vnímej hlas a tvář druhého.",
          "Řekni si v duchu: „Setkání jako ve snu.“",
          "Zůstaň plně v rozhovoru. Jde o lehký odstup, ne o odpojení."
        ]
      },
      "intention": {
        "when": "Když se mi bude zdát tenhle sen znovu",
        "then": "v klíčovém místě poznám, že sním."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Hledej, jestli se nacvičená scéna objevila, třeba jen kouskem.",
      "why": "Schredl, Dyck & Kühnel (2020) spojili buzení jednou týdně s nácvikem prvků snu a lucidních nocí bylo víc: 18 % proti 6 %. Nácvik nové verze snu ulevuje i od nočních můr, a to i bez lucidity (Spoormaker & van den Bout 2006)."
    },
    {
      "id": "d35",
      "day": 35,
      "week": 5,
      "mission": "Ohlédni se za týdnem vědomí a inkubace.",
      "goal": "Ocenit chvíle vědomí ve dne a sledovat, co z nich proniklo do snů. Bez sérií.",
      "science": {
        "title": "Týdenní ohlédnutí: den a noc",
        "minutes": 5,
        "techniqueId": "dreamJournal",
        "evidence": "promising",
        "steps": [
          "Spočítej sny, Stopy snů a noci, kdy jsi zkusil techniku.",
          "Objevilo se inkubované téma? I náznak se počítá.",
          "Kolik kotev dne jsi opravdu prožil vědomě? Kvalita je víc než počet.",
          "Jak ses vyspal po nocích s výpravou? Pokud hůř, příští týden stačí jedna.",
          "Cítíš se přes den odpojeně nebo jako za sklem? Dej si pauzu od technik, zkus uzemnění a nech jen deník."
        ]
      },
      "yoga": {
        "title": "Radost z úsilí",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Projdi sny týdne a najdi jeden, který tě potěšil.",
          "Raduj se z něj, i když nebyl lucidní.",
          "Obnov záměr na poslední týden programu."
        ]
      },
      "intention": {
        "when": "Když si všimnu, že mě testy nebo techniky unavují",
        "then": "uberu a nechám jen to, co mě baví."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10 a vyplň Jak ses vyspal.",
      "why": "U studentů záměrně navozované lucidní sny předpovídaly nárůst pocitů odpojení, u spontánních ne (Aviram & Soffer-Dudek 2018). Proto kontrola každý týden. Vynechaný den návyk nezboří (Lally a kol. 2010), takže pauza nic nestojí."
    },
    {
      "id": "d36",
      "day": 36,
      "week": 6,
      "mission": "Nauč se udržet lucidní sen, když přijde.",
      "goal": "Mít připravený postup na první vteřiny lucidity a poprvé zkusit jógu snu před usnutím.",
      "science": {
        "title": "Stabilizace snu",
        "minutes": 5,
        "techniqueId": "stabilization",
        "evidence": "community",
        "steps": [
          "Když poznáš, že sníš, zůstaň v klidu. Velké nadšení tě často probudí.",
          "Tři dlaně o sebe a soustřeď se na teplo a tření.",
          "Řekni nahlas: „Tohle je lucidní sen.“",
          "Rozhlédni se a pozoruj detaily. Létání a pády nech na později.",
          "Když se sen rozpadá, vrať se k dlaním a ke klidnému pohledu.",
          "Ve dne si postup dvakrát projdi v představě."
        ]
      },
      "yoga": {
        "title": "Rudý lotos v hrdle",
        "minutes": 5,
        "techniqueId": "dreamYogaSleep",
        "evidence": "tradition",
        "steps": [
          "Lehni si na pravý bok, pokud je ti to pohodlné.",
          "Uvolni tělo, hlavně krk a hrdlo.",
          "Představ si v hrdle malý, sytě rudý zářící lotos.",
          "Drž obraz lehce, jako plamínek svíčky ve tmě.",
          "Až se obraz rozplyne, nech ho jít a usni."
        ]
      },
      "intention": {
        "when": "Když ve snu poznám, že sním",
        "then": "zůstanu v klidu, budu třít dlaně a řeknu: Tohle je lucidní sen."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Pokud byl některý lucidní, poznač, jak dlouho lucidita přibližně vydržela a čím skončila.",
      "why": "Tření dlaní a věta Tohle je lucidní sen byly v návodu studie NALDIS, srovnávací data ale chybí (Aspy a kol. 2017). Klidné pozorování místo prudkých akcí doporučuje i laboratorní protokol (Picard-Deland a kol. 2026, preprint). Rudý lotos a pravý bok pocházejí z bönské jógy snu (Wangyal 1998), Namkhai Norbu místo lotosu používá bílou slabiku A (Norbu 1992). Vědecky testované to není."
    },
    {
      "id": "d37",
      "day": 37,
      "week": 6,
      "mission": "Čtvrtá výprava: se záměrem i s plánem, jak sen udržet.",
      "goal": "Spojit Probuzení a návrat do spánku (WBTB), Záměr poznat sen a stabilizaci jako plánovanou akci, jen pokud jsou splněné podmínky.",
      "science": {
        "title": "Probuzení a návrat do spánku (WBTB) se Záměrem a stabilizací",
        "minutes": 30,
        "techniqueId": "wbtb",
        "evidence": "strong",
        "steps": [
          "Nejdřív podmínky: včera ses dobře vyspal a nebyla to noc s výpravou, zítra nemáš brzkou povinnost a cítíš se odpočatý. Pokud ses nevyspal, dnes jen Záměr při ranním probuzení.",
          "Jediný budík na čas, který ti zatím sedí nejlépe, mezi 4,5 a 6 hodinami po usnutí.",
          "Po budíku zapiš sen a zůstaň vzhůru 10 až 30 minut.",
          "V posteli dělej Záměr poznat sen. Jako plánovanou akci si představ tření dlaní a větu Tohle je lucidní sen.",
          "Cílem je usnout do 10 minut. Když to nejde, pusť to a odpočívej."
        ]
      },
      "yoga": {
        "title": "Chvíle dne, kdy poznáváš sen",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Před spaním si projdi den jako sen.",
          "Vyber jednu chvíli dne a představ si, že v ní poznáváš, že sníš.",
          "Pevně se rozhodni, že to v noci zopakuješ, a usni."
        ]
      },
      "intention": {
        "when": "Když se ve snu začne obraz rozpadat",
        "then": "zpomalím, budu třít dlaně a podívám se na jeden detail."
      },
      "morningTask": "Zapiš sen před budíkem a sny po návratu zvlášť, s časem a luciditou 0–10. Pokud byl některý lucidní, poznač, jestli se povedla stabilizace.",
      "why": "Záměr poznat sen po probuzení je nejlépe podložená domácí kombinace (Aspy 2020; LaBerge a kol. 2018). Lucidní sny bývají krátké, u téměř poloviny lidí pod minutu (Mota-Rolim a kol. 2013). Plán, jak sen udržet, proto patří přímo do záměru."
    },
    {
      "id": "d38",
      "day": 38,
      "week": 6,
      "mission": "Vyber si misi pro svůj příští lucidní sen.",
      "goal": "Mít jednu klidnou misi, kterou zkusíš ve snu po stabilizaci.",
      "science": {
        "title": "Mise ve snu",
        "minutes": 5,
        "techniqueId": "lucidMission",
        "evidence": "community",
        "steps": [
          "Vyber jednu misi. Třeba: zeptej se postavy snu, co ti chce ukázat.",
          "Nebo si zblízka prohlédni detail: kámen, list, vlastní dlaň.",
          "Nebo v klidu zopakuj pohyb, který trénuješ ve dne.",
          "Misi zařaď až po stabilizaci. Nejdřív klid, pak úkol.",
          "Přidej ji do záměru a ráno zapiš, jestli se povedla."
        ]
      },
      "yoga": {
        "title": "Čelit strachu ve snu",
        "minutes": 3,
        "techniqueId": "dreamYogaRelease",
        "evidence": "tradition",
        "steps": [
          "Když se ve snu objeví něco děsivého, neutíkej.",
          "Otoč se k tomu a zeptej se: „Kdo jsi?“ nebo „Co potřebuješ?“",
          "Připomeň si: tohle je sen a nemůže ti ublížit.",
          "Ve dne si to jednou projdi v představě s malým, snesitelným strachem."
        ]
      },
      "intention": {
        "when": "Když se ve snu začnu bát",
        "then": "otočím se k tomu, co mě straší, a zeptám se, co potřebuje."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Pokud byl sen lucidní, poznač, jestli se povedla mise a jak ses v něm cítil.",
      "why": "Kontrola nad snem je vzácnější než lucidita sama (Mota-Rolim a kol. 2013), proto klidné mise místo velkých plánů. Pohybový nácvik v lucidním snu zlepšil výkon v jednoduché úloze s prsty (Stumbrys a kol. 2016). Čelení strachu je jedna z praxí jógy snu (Wangyal 1998; Holecek 2016)."
    },
    {
      "id": "d39",
      "day": 39,
      "week": 6,
      "mission": "Napiš si vlastní větu záměru.",
      "goal": "Vytvořit osobní znění Záměru poznat sen se svou Stopou snů a misí.",
      "science": {
        "title": "Tvůj vlastní záměr",
        "minutes": 10,
        "techniqueId": "mild",
        "evidence": "strong",
        "steps": [
          "Vezmi základ: „Až budu příště snít, uvědomím si, že sním.“",
          "Přidej svou nejčastější Stopu snů: „Až uvidím…, poznám, že sním.“",
          "Přidej plánovanou akci nebo misi.",
          "Řekni si větu nahlas a uprav ji, dokud nezní jako ty. Krátká je lepší než dlouhá.",
          "Používej ji při ranním probuzení i při výpravách se Záměrem."
        ]
      },
      "yoga": {
        "title": "Lotos jako noční světlo",
        "minutes": 5,
        "techniqueId": "dreamYogaSleep",
        "evidence": "tradition",
        "steps": [
          "Lehni si na pravý bok, pokud je ti to pohodlné, a uvolni hrdlo.",
          "Představ si v hrdle rudý lotos, jasný a klidný.",
          "Spoj ho s rozhodnutím: sen, který přijde, poznám.",
          "Nech obraz pomalu slábnout a usínej s ním jako s nočním světlem."
        ]
      },
      "intention": {
        "when": "Když se ráno sám probudím a mám čas",
        "then": "řeknu svou vlastní větu záměru a usnu s ní."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Poznač, jestli se ti tvoje věta vybavila při usínání nebo ve snu.",
      "why": "Plány když–pak fungují nejlépe, když je lidé chtějí, mají je konkrétní a opakují si je (Sheeran, Listrom & Gollwitzer 2024). Proto se vyplatí věta, která zní jako ty. Převzatý záměr je půjčený skafandr, vlastní ti sedí."
    },
    {
      "id": "d40",
      "day": 40,
      "week": 6,
      "mission": "Pátá výprava: vrať se do spánku přes smysly.",
      "goal": "Zopakovat Probuzení a návrat do spánku (WBTB) se Střídáním smyslů, ať máš srovnání se Záměrem. Jen pokud jsou splněné podmínky.",
      "science": {
        "title": "Probuzení a návrat do spánku (WBTB) se Střídáním smyslů",
        "minutes": 25,
        "techniqueId": "wbtb",
        "evidence": "promising",
        "steps": [
          "Nejdřív podmínky: včera ses dobře vyspal a nebyla to noc s výpravou, zítra nemáš brzkou povinnost a cítíš se odpočatý. Pokud ses nevyspal, dnes jen Záměr při ranním probuzení.",
          "Jediný budík na tvůj osvědčený čas, mezi 4,5 a 6 hodinami po usnutí.",
          "Po budíku zapiš sen a zůstaň vzhůru 10 až 30 minut.",
          "V posteli 4 rychlá kola smyslů, pak 4 až 6 pomalých. Tentokrát bez věty záměru.",
          "Techniku pusť a usni. Cílem je usnout do 10 minut."
        ]
      },
      "yoga": {
        "title": "Zklidňující dech",
        "minutes": 3,
        "techniqueId": "dreamYogaBreath",
        "evidence": "tradition",
        "steps": [
          "Na posteli udělej pár pomalých nádechů nosem.",
          "S každým výdechem pusť kus dne.",
          "Pak nech dech být a připrav se na noc."
        ]
      },
      "intention": {
        "when": "Když se ve snu probudím do své ložnice",
        "then": "udělám test s dechem, než uvěřím, že jsem vzhůru."
      },
      "morningTask": "Zapiš sen před budíkem a sny po návratu zvlášť, s časem a luciditou 0–10. Poznač, jestli jsi usnul do 10 minut.",
      "why": "Ve stejné studii vyšly obě techniky po probuzení srovnatelně (Aspy 2020). Až budeš mít noci s oběma, uvidíš, která sedí tobě. Je to tvůj malý experiment N-of-1: jeden člověk, víc pokusů."
    },
    {
      "id": "d41",
      "day": 41,
      "week": 6,
      "mission": "Proměň zápisky v data o sobě.",
      "goal": "Sečíst pokusy a výsledky podle techniky a podívat se na ně poctivě.",
      "science": {
        "title": "Experiment N-of-1: co víš o sobě",
        "minutes": 10,
        "techniqueId": "dreamJournal",
        "evidence": "promising",
        "steps": [
          "Spočítej noci se Záměrem a noci se Střídáním smyslů, zvlášť s budíkem a bez.",
          "U každé techniky spočítej noci, kdy jsi ve snu poznal, že sníš.",
          "Úspěšnost na pokus je počet lucidních nocí dělený počtem nocí s technikou.",
          "Při pár nocích jsou čísla jen orientační. Jedna noc navíc může pořadí otočit.",
          "Porovnej Jak ses vyspal po nocích s budíkem a bez něj.",
          "Poznač si, po kterých nocích jsi usnul do 10 minut."
        ]
      },
      "yoga": {
        "title": "Lotos a chvíle usnutí",
        "minutes": 5,
        "techniqueId": "dreamYogaSleep",
        "evidence": "tradition",
        "steps": [
          "Lehni si na pravý bok, pokud je ti to pohodlné, a uvolni hrdlo.",
          "Vybav si rudý lotos v hrdle.",
          "Všimni si chvíle, kdy obraz začne přecházet v usínání.",
          "Nic nedrž. Jen se nech nést do spánku."
        ]
      },
      "intention": {
        "when": "Když mě zklame malé číslo",
        "then": "připomenu si, že i ve studiích vycházela zhruba jedna lucidní noc z pěti až šesti pokusů, a to u motivovaných lidí."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Porovnej časy svých snů s odhadem výskytu REM ve Spánkových datech.",
      "why": "Nejlepší domácí studie vycházejí zhruba na jednu lucidní noc z pěti až šesti pokusů (Aspy a kol. 2017; Aspy 2020). Když porovnáváš sám sebe, neruší tě rozdíly mezi lidmi. Málo dat ale znamená velkou nejistotu, proto čísla čti jako stopu, ne jako rozsudek."
    },
    {
      "id": "d42",
      "day": 42,
      "week": 6,
      "mission": "Sestav si vlastní recept a oslav šest týdnů práce.",
      "goal": "Ohlédnout se za týdnem i celým programem a vybrat postup, který ti sedí. Bez sérií, jen s radostí z procesu.",
      "science": {
        "title": "Týdenní ohlédnutí a tvůj recept",
        "minutes": 10,
        "techniqueId": "dreamJournal",
        "evidence": "promising",
        "steps": [
          "Spočítej sny, Stopy snů a vyzkoušené techniky za týden i za šest týdnů. Každý zápis a pokus tě sem přivedl.",
          "Recept, část 1: technika, která ti sedí víc. Záměr poznat sen, nebo Střídání smyslů.",
          "Recept, část 2: budík 4,5 až 6 hodin po usnutí, bdění 10 až 30 minut, nejvýš 2 noci týdně, nikdy dvě po sobě.",
          "Recept, část 3: denní a noční praxe, která tě baví. Vědomí po celý den, Jako sen, nebo lotos večer.",
          "Recept, část 4: podmínky. Výprava jen po dobré noci, před volnem a když se cítíš odpočatý.",
          "Cítíš se unaveně nebo odpojeně? Pak recept zní: týden jen deník a spánek."
        ]
      },
      "yoga": {
        "title": "Radost z úsilí a obnovený záměr",
        "minutes": 3,
        "techniqueId": "dreamYogaIntention",
        "evidence": "tradition",
        "steps": [
          "Projdi své oblíbené sny z celého programu.",
          "Raduj se z nich bez hodnocení.",
          "Obnov záměr na další týdny vlastními slovy."
        ]
      },
      "intention": {
        "when": "Když se příští týden nevyspím",
        "then": "vynechám výpravy a nechám jen deník a Záměr při ranním probuzení."
      },
      "morningTask": "Zapiš sny s časem a luciditou 0–10. Do poznámky napiš svůj recept, ať ho máš hned u snů.",
      "why": "Nejlepší domácí výsledky stojí na spánku, záměru, krátké technice a rychlém usnutí (Aspy 2020). Doplňky ani léky do receptu nepatří. Návyk se tvoří týdny až měsíce a vynechaný den ho nezboří (Lally a kol. 2010)."
    }
  ]
}
```

### inovace.md

````markdown
# Za hranice reality: 15 inovací, které konkurence nemá

Podklad pro vývoj (Flutter, Android) · 23. 10. 2026 · úkol 5

## Jak číst tento dokument

- **Pořadí:** rozhoduje odhadovaný dopad na šanci lucidně snít. Při podobném dopadu rozhoduje radost z používání. Dopad je odhad z literatury, ne změřená veličina. Právě proto je v appce Osobní laboratoř (funkce 4).
- **Štítky důkazů:** `strong`, `promising`, `community`, `tradition`. Když se funkce skládá z více dílů, má štítek každý díl. `strong` tu znamená opakované terénní studie (NALDIS, ILDIS) nebo silnou obecnou psychologii. Velké preregistrované RCT na indukci LD neexistují.
- **Pracnost** (jeden Flutter vývojář, bez tvorby obsahu): S do 1 týdne, M 2–4 týdny, L 1–3 měsíce.
- **Soukromí:** všechno běží v telefonu. Síť používá jen volitelné stažení Spánkových dat přímo z Oura API do telefonu. Žádný vlastní server.
- **Texty v minulém čase** mají variantu podle oslovení (vyspal / vyspala). Níže je mužský tvar, stejně jako „Jak ses vyspal“.

## Pevné hranice, na kterých návrhy stojí (ověřeno 23. 10. 2026)

| # | Ověřený fakt | Co z toho plyne pro návrh |
|---|---|---|
| 1 | **REM v reálném čase nedá nikdo.** Health Connect ukládá spánek jako `SleepSessionRecord` se stádii až po relaci. Oura API výslovně píše, že spánková data se nahrají, až uživatel otevře aplikaci Oura (Oura API v2, specifikace 1.42). | REM okna jsou vždy **předpověď z minulých nocí**. Nikdy je neprodáváme jako živé měření. |
| 2 | **Oura API v2**, `/v2/usercollection/sleep`: `sleep_phase_5_min` a nově i `sleep_phase_30_sec` (1 hluboký, 2 lehký, 3 REM, 4 bdění), `movement_30_sec`, `heart_rate` (vzorky), `latency`, `bedtime_start/end`, `type` (`long_sleep`, `sleep`, `late_nap`, `rest`). Jen OAuth2, s PKCE i čistě z klienta. Osobní tokeny zrušeny v prosinci 2025. Nová aplikace má limit 10 uživatelů do schválení Ourou. Bez aktivního členství vrací 403. Pole `app_sleep_phase_5_min` bude odstraněno. | 30s hypnogram je nejlepší vstup pro latenci usnutí a REM okna. Před veřejným spuštěním je nutné schválení u Oury. |
| 3 | **Health Connect:** Oura (od 2023) i Garmin Connect (od 2025) zapisují spánek se stádii. Čtení na pozadí vyžaduje `READ_HEALTH_DATA_IN_BACKGROUND`. Data starší než 30 dní před udělením oprávnění jen s `PERMISSION_READ_HEALTH_DATA_HISTORY`. | Hlavní cesta pro Garmin a záloha pro Ouru. Při připojení požádat i o historii, jinak REM profil startuje jen z 30 nocí. |
| 4 | **Garmin Connect Developer Program** (znovu otevřen 21. 10. 2026): úroveň Personal dává jen vlastní data a jen pull, Starter jen push (potřebuje server), Enterprise je placený. | Bez serveru je pro Garmin jediná čistá cesta Health Connect. Osobní klíč jako „režim pro nadšence“ jen po ověření podmínek. |
| 5 | **Connect IQ:** aplikace na hodinkách v popředí čte tep, intervaly mezi údery a akcelerometr (`Sensor.registerSensorDataListener`) a umí vibrovat (`Attention.vibrate`). Úlohy na pozadí nejčastěji po 5 min. Stádia spánku v reálném čase API nemá, `registerForSleepEvent` jen spouští nastavený čas spánku. | Haptický podnět z hodinek je proveditelný. „Detekce REM“ na hodinkách by byl náš vlastní nevalidovaný odhad. |
| 6 | **Android budíky:** `SCHEDULE_EXACT_ALARM` je u nových instalací od Androidu 14 ve výchozím stavu zamítnuté. `USE_EXACT_ALARM` jen pro skutečné budíky. Full-screen intent jen pro volání a budíky. Bez oprávnění lze přes `AlarmClock.ACTION_SET_ALARM` nastavit budík v systémových Hodinách. | Vysvětlující obrazovka před žádostí o oprávnění a záložní cesta přes Hodiny. |
| 7 | **Celonoční zvuk:** FGS `mediaPlayback` spuštěná uživatelem, deklarace s videem v Play Console. Akcelerometr jen jako pojistka pauzy (jako Konkoly 2024). | Zvukový klíč a jemná ťuknutí poběží jako uživatelem spuštěné noční přehrávání. |
| 8 | **Přesnost:** Oura Gen3 REM citlivost 76 %, přesnost 79 % (Robbins 2024, n = 35, jedna noc, financováno Oura). Shoda množství REM za noc slabá (ICC 0,27–0,37). Garmin Vivosmart 4 zachytil 33 % REM (Schyvens 2025). Novější Garminy bez PSG validace. | Garmin vážit méně. Okna kreslit jako pásmo pravděpodobnosti, nikdy jako ostrou čáru. |
| 9 | **Podnět ≈ falešný podnět:** v laboratoři 38,3 vs 28,3 % SVLD, n.s. (MC v2 2026, preprint). Domácí TLR jen ve 2. noci, celkově n.s. (Konkoly 2024). | Každá noční „chytrá“ funkce má v sobě měření, jestli pomáhá právě tobě. |

## Pořadí 15 funkcí

| # | Funkce | Dopad na LD | Radost | Pracnost | Důkazy |
|---|---|---|---|---|---|
| 1 | **Chytré probuzení do snu** (WBTB podle REM oken a brány spánku) | vysoký (hlavně díky WBTB + MILD, časování přidává málo) | střední | M | strong (WBTB + MILD), promising (časování, malý zisk) |
| 2 | **Od Stopy snů ke spouštěči** (osobní plán „když–pak“ a měření přenosu do snu) | střední až vysoký | vysoká | M | strong (implementační záměry obecně), promising, community |
| 3 | **Zvukový klíč** (TLR podle Konkolyho pro Android) | střední, nejistý | vysoká | L | promising |
| 4 | **Osobní laboratoř** (experimenty N-of-1, bayesovsky) | nepřímý, dlouhodobě vysoký | velmi vysoká | M | strong (metoda), promising (pro LD) |
| 5 | **Rekonstrukce noci podle REM oken** | střední (přes vybavování) | vysoká | M | strong (REM a vybavení), promising, community |
| 6 | **Test reality při každém probuzení** (falešná probuzení) | střední | střední | S | promising, community |
| 7 | **Jemné ťuknutí v pozdním REM okně** (DEILD bez vstávání) | střední | střední | S–M | community, promising |
| 8 | **Zápis poslepu** (hlas, zavřené oči, čeština offline) | nízký až střední | vysoká | M | promising, community |
| 9 | **Český průvodce s tvými Stopami snů** (MILD, SSILD) | střední | vysoká | M | strong (MILD), promising (SSILD), community (vlastní hlas) |
| 10 | **Záměr na noc s ranním ověřením** (inkubace + plánovaná akce) | nízký až střední | vysoká | S | promising |
| 11 | **Jóga snu napojená na Stopy snů a emoce** | nízký až střední | vysoká pro část lidí | S–M | tradition, promising |
| 12 | **Bezpečnostní štít** | ochranný, podmínka pro 1, 3, 7 | střední (důvěra) | S–M | promising, strong (prevalence paralýzy) |
| 13 | **Haptický klíč z Garmin hodinek** (Connect IQ) | nejistý | střední | L | promising, community |
| 14 | **Hvězdná mapa: den a sen** (souvislosti s dnem) | nízký | velmi vysoká | M | promising |
| 15 | **Usínací inkubace** (zdřímnutí ve stylu Dormio) | žádný přímý (není to LD) | vysoká | M | promising |

Štít (12) je níž jen proto, že luciditu sám nezvyšuje. Vychází spolu s funkcemi 1, 3 a 7 a bez něj se nespouští.

---

## 15 funkcí podrobně

### 1. Chytré probuzení do snu: Probuzení a návrat do spánku (WBTB) podle tvých REM oken

**Co:** Budík WBTB nezvoní pevně „5 h po ulehnutí“. Zvoní v nejpravděpodobnější části noci pro pozdní REM, 4,5–6,5 h po **skutečném** usnutí, spočítané z historie Oury nebo Garminu a z časů snů v ranním zápisu. Spouští se jen přes bránu spánku: od 15. dne programu, max 2× týdně, nikdy dvě noci po sobě, jen po dobré noci (zelená ve „Jak ses vyspal“, ne po žluté ani červené), ne při spánkovém dluhu. Ráno z hypnogramu ukáže, jak rychle jsi po technice znovu usnul, a podle toho upraví délku bdění.

**Proč:**
- WBTB + Záměr poznat sen (MILD) nebo Střídání smyslů (SSILD) je nejlépe doložená domácí kombinace: 17,4 % nocí v NALDIS (Aspy 2017), 16,5–16,9 % v ILDIS (Aspy 2020). `strong` v měřítku oboru.
- V laboratoři budili po ≥ 5 h 40 min po 10–15 min nepřerušeného REM (Erlacher & Stumbrys 2020). Probuzení po 4,5 h vyšlo hůř, ale jen v mezistudiovém srovnání (Erlacher 2022). `promising`
- Probuzení z REM dává vybavený sen v ~82 % případů, z NREM v ~43 % (Nielsen 2000). MILD začíná právě vybavením snu. `strong`
- Usnutí do 10 min po technice je jediný replikovaný behaviorální prediktor (ILDIS: 18,3 vs 11,1 %, p = 0,037). `promising`
- Personalizované časování podle wearables nikdo netestoval. `promising`, hypotéza, kterou funkce sama měří.
- Poctivě: bez živých dat z téže noci trefí chytrý budík REM periodu jen o málo častěji než pevných 5 h (asi 0,31 proti 0,27, vybavení snu asi 55 proti 53 %; `algoritmus_rem_cyklu.md` 0 a 4.4), takže hlavní hodnota není přesný zásah REM, ale kotva na skutečné usnutí, brána spánku a osobní učení z tvých nocí.
- Konkurence: Shape (jen iOS) odhaduje „špičku snění“ z Apple Health. Na Androidu s Ourou a Garminem, s branou spánku a se zpětnou vazbou usnutí nic.

**Jak v UI:** Karta v Plánu na dnešek „Probuzení do snu · okno 4:35–5:05“, detail s noční orbitou a pásmem REM, červená noční obrazovka, ráno výsledek „Usnul jsi zpátky za 5–10 min“. Podrobně v UX specifikaci.

**Pracnost:** M (model oken S, brána S, budík a noční tok M, ranní latence S).

**Riziko:** Fragmentace spánku (Vallat & Ruby 2019) řeší brána a rozpočet probuzení. Falešná přesnost: REM z wearables má přesnost ~79 % jen v nejlepší studii, proto pásmo a štítek ODHAD. Habituace na buzení: max 2× týdně. Soukromí: hypnogram zůstává v telefonu.

### 2. Od Stopy snů ke spouštěči

**Co:** Pipeline v pěti krocích: opakující se motivy z deníku (Stopy snů) → zařazení do čtyř kategorií znaků snů (vnitřní prožitek, děj, podoba, prostředí) → návrh osobního plánu „když–pak“ pro den (situace v bdění, která Stopu připomíná) → stejná Stopa jako cíl nočního Záměru poznat sen → ranní měření přenosu: Stopa ve snu → všiml sis → test ve snu → lucidita.

**Proč:**
- MILD je strukturálně implementační záměr. Ty mají d = 0,27–0,66, víc při formátu „když–pak“, vysoké motivaci a opakování (Sheeran, Listrom & Gollwitzer 2024; Gollwitzer & Sheeran 2006). `strong` obecně.
- Prospektivní paměť spouštěná událostí funguje spolehlivěji než spouštěná časem (Einstein & McDaniel 1990; McDaniel & Einstein 2000). `strong` obecně, pro LD netestováno.
- Znaky snů a jejich kategorie jako cíl záměru a testu: LaBerge & Rheingold 1990. `community`, přímý test chybí.
- Pozor: samotné testy reality nefungují (NALDIS 8,1 → 7,6 %; Schredl 2025) a v ILDIS vyšel MILD + testy hůř než MILD bez nich (12,1 vs 19,4 %, p = 0,052). Proto je spouštěč ve výchozím stavu lehký („všimni si a zeptej se“) a plný test je volitelný a měřený.
- Konkurence: MILD Trainer má denní „události“, Reality Check propojuje včerejší testy s nocí. Nikdo netěží spouštěče z tvých vlastních snů a nikdo neměří přenos do snu.

**Jak v UI:** Čip po uložení snu „Tohle se ti zdálo už potřetí“, obrazovka Stopy snů jako souhvězdí, návrh spouštěče, max 3 aktivní, ranní otázky o přenosu, týdenní trychtýř. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Habituace na připomínky (max 3 spouštěče, rotace forem, revize po 21 dnech). Intimní a traumatické motivy nikdy v připomínkách. Falešná přesnost automatického rozpoznání: uživatel vždy potvrzuje. Zátěž: účastníci ILDIS vnímali testy jako zátěž.

### 3. Zvukový klíč: TLR podle Konkolyho pro Android

**Co:** Publikovaný domácí protokol TLR (Konkoly 2024, parametry exp. 2) česky: ~20min večerní trénink, kalibrace prahu slyšitelnosti a rozlišení, podněty nejdřív 6 h po tréninku a jen v tvých pozdních REM oknech, náběh hlasitosti od prahu rozlišení, strop, pauza po pohybu z akcelerometru, tlačítko „Probudilo mě to“, jemný režim a skryté kontrolní noci (cizí zvuk, ticho).

**Proč:**
- Princip stojí na reaktivaci naučené asociace ve spánku (Rudoy 2009; Oudiette & Paller 2013). `strong` pro paměť.
- Pro LD: laboratorní zdřímnutí 50 vs 17 % SVLD (Carr 2023). Doma bez kontroly 0,74 → 2,11 LD týdně, s kontrolou rozdíl jen ve 2. noci, v celém vzorku n.s. (Konkoly 2024). Replikace přes Oniri nulová (Genc 2025). Podnět ≈ falešný podnět (MC v2 2026). `promising`, poctivě slabé.
- Efekt TLR se ukázal jen u lidí, kteří si vybavili sny aspoň ve 2 nocích (Konkoly 2024), proto vstupní brána na vybavování.
- Konkurence: Lucyd kopíruje protokol jen na iOS. Výzkumná aplikace Paller lab už není dostupná, nástupce z MIT je jen pro účastníky studie v USA.

**Jak v UI:** Výcvik › Zvukový klíč: úvod se souhlasem s kontrolními nocemi, kalibrace, trénink s českým hlasem, temná noční obrazovka, ranní otázky. Podrobně v UX specifikaci.

**Pracnost:** L.

**Riziko:** Probouzení (pohyb po podnětu 0,19 vs 0,10 bez podnětu, Konkoly 2024), zkrácení REM a efektivity spánku pod podněty (MC v2), partner v posteli, baterie, falešná hlášení „slyšel jsem zvuk“ (15,3 % ve falešných probuzeních, MC v2). Řeší strop, okna, jemný režim, pauzy a Štít.

### 4. Osobní laboratoř: experimenty N-of-1

**Co:** Malé randomizované experimenty na sobě. Noci se losují do variant (Záměr poznat sen vs Střídání smyslů při ranním probuzení, Zvukový klíč vs cizí zvuk vs ticho, dny se spouštěči vs bez nich, chytré okno vs pevných 5 h). Vyhodnocení bayesovsky (beta-binomický model s priorem z literatury, oblast praktické shody ROPE, kontrolní body) a s poctivým „zatím nevíme“.

**Proč:**
- N-of-1 je zavedená metoda personalizované medicíny (Kravitz & Duan 2014; Schork 2015). Mikrorandomizace pro často opakovaná rozhodnutí (Klasnja 2015). `strong` jako metoda.
- V LD chybí experimentální manipulace očekávání i osobní data „co funguje mně“. Laboratorní kontext sám vyrábí vysoká čísla (Peters 2026). `promising`
- Zpětná vazba je jediný herní prvek s doloženým efektem (Yu 2025). `promising`
- Pravděpodobnost ve formě přirozených četností („3 noci ze 100“) lidé chápou lépe než procenta (Gigerenzer & Hoffrage 1995). `strong`
- Konkurence: nikdo.

**Jak v UI:** Výcvik › Osobní laboratoř: šablony experimentů, průvodce, průběh jako orbita s počtem nocí, výsledek jako dvě křivky a jedna věta. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Falešná přesnost na malých číslech (LD je vzácná událost, viz výpočet síly ve specifikaci), průběžné nahlížení, honba za výsledky (experiment nikdy nezvyšuje rozpočet probuzení), očekávání u variant, které nejdou zaslepit.

### 5. Rekonstrukce noci podle REM oken

**Co:** Ráno po zápisu tě appka provede nocí pozpátku po REM oknech („Okno 4 · 5:20–5:45 · Kde jsi byl?“) jen obecnými otázkami a každý sen přiřadí k oknu s pravděpodobností. Přiřazené časy snů zpětně zpřesňují REM okna pro funkce 1, 3 a 7. Součástí je rychlý záznam „Probudil jsem se, ale nic si nepamatuju“ s časem (ráno i v noci, jedním klepnutím): bez probuzení bez snu nejde kalibrovat, jak silný důkaz pro REM zapsaný sen je (`algoritmus_rem_cyklu.md` 4.1–4.3).

**Proč:**
- Vybavování je prerekvizita lucidity: v LD nocích 2,8 vs 1,7 vybavených snů (ILDIS), efekt TLR jen u lidí s vybavením (Konkoly 2024). `promising`
- Zájem o sny a pozornost k nim vybavování zvyšují (Schredl 2003; Consc Cogn 2012). `promising`
- Vybavování pozpátku od posledního snu: LaBerge & Rheingold 1990. `community`
- Sen při probuzení je důkaz pro REM, ale jen mírný: věrohodnostní poměr ~1,9 (82 vs 43 % vybavení, Nielsen 2000). `strong`
- Konkurence: deníky mají čas zápisu, ne noc s okny.

**Jak v UI:** Svislá noční osa s oranžovými oblouky REM oken, kartičky snů přichycené k času, krokování pozpátku. Podrobně v UX specifikaci.

**Pracnost:** M.

**Riziko:** Sugesce a konfabulace (otázky jen obecné, nikdy obsahové, rozlišení „jistě“ a „možná“). Prodloužení rána (limit 3 min, kdykoli přeskočit). Falešná přesnost přiřazení (vždy s procenty).

### 6. Test reality při každém probuzení

**Co:** Každé probuzení s appkou (budík WBTB, jemné ťuknutí, ranní otevření) začíná třísekundovým testem se zavřenýma očima: „Sním? Zkus se nadechnout se zavřenými ústy.“ Teprve pak zápis. Ranní zápis má pole „Bylo to falešné probuzení?“ a „Poznal jsi ho?“.

**Proč:** Falešná probuzení jsou při buzení častá: v laboratoři 23,1 % snů a 17 ze 121 snů se stalo lucidními po falešném probuzení (Peters 2026, preprint) `promising`. Návyk vázaný na stálou situaci se automatizuje lépe než návyk na náhodné připomínky (Lally 2010; Wood & Rünger 2016) `strong` obecně. Test dechem se zavřenými ústy používal ILDIS. Komunitní varování „připomínky tě naučí testovat, jen když zazvoní telefon“ tu neplatí, protože probuzení je přesně situace, která se ve snu opakuje `community`. Konkurence: nikdo neváže test na každé probuzení.

**Jak v UI:** První obrazovka po budíku: černá, červený kruh, text „Sním?“, krátká vibrace. Po 3 s „Ne? Tak co se ti zdálo?“. Lze vypnout v Nastavení › Noc. V týdenním přehledu: „Falešná probuzení: 2 · poznal jsi 1“.

**Pracnost:** S.

**Riziko:** Zdržení zápisu o 3 s (zanedbatelné, test je bez otevření očí). U citlivých lidí může častá otázka „sním?“ přiživovat derealizaci, proto ji Štít při zhoršení vypne.

### 7. Jemné ťuknutí v pozdním REM okně

**Co:** Místo celého WBTB 1–2 krátké samovypínací podněty (tichý tón 3 s nebo vibrace telefonu) do pozdních REM oken po 6,5 h spánku. Cíl: na chvilku se vynořit, nehýbat se a zkusit Návrat do snu hned po probuzení (DEILD) nebo dvouminutový záměr vleže. Bez rozsvícení a bez vstávání.

**Proč:** Samovypínací budíky jsou komunitní požadavek č. 2 („skvělé na snadné WILD“, Reddit 2024) `community`. Fyziologicky ověřené přechody z bdění do REM souvisely s LD (Gott 2020) `promising`. DEILD je bez dat `community`. Konkurence: LDAlarm a Lucidity (Curtis) mají samovypínací budíky s pevným časem, Everdream budík „v REM“, vše na iOS. Sleep as Android pouští podněty do REM odhadnutého z pohybu (výrobce sám uvádí zásah ~50 %). Ťuknutí podle REM oken z Oury a Garminu, s rozpočtem probuzení a navazujícím DEILD nemá nikdo.

**Jak v UI:** Přepínač v detailu noci „Jemné ťuknutí“, na orbitě malé body v oknech. Po ťuknutí se nic nerozsvítí. Ráno: „Vzbudilo tě ťuknutí? Ano / Ne / Nevím“ a „Vrátil ses do snu?“.

**Pracnost:** S–M (sdílí model oken a audio s funkcemi 1 a 3).

**Riziko:** Fragmentace: počítá se do rozpočtu probuzení (max 2 ťuknutí za noc, max 3 noci týdně, nikdy v noci s WBTB, nikdy po červené). Spánková paralýza u DEILD a WILD (normalizační karta ze Štítu). U narkolepsie a poruchy spánkové paralýzy vypnuto.

### 8. Zápis poslepu

**Co:** Ranní i noční záznam bez dívání na displej. Po budíku stačí podržet kdekoli na obrazovce a mluvit se zavřenýma očima, haptika potvrdí začátek a uložení. Appka nejdřív chce 3 klíčová slova, pak volné vyprávění. Přepis do češtiny přímo v telefonu (např. whisper.cpp), červený režim, uložení hned do lokální databáze a do Zálohy.

**Proč:** Model aktivace a vybavení předpovídá, že rušení hned po probuzení vybavování snižuje (Koulack & Goodenough 1976) `promising`. Nejdřív klíčová slova, pak detaily je praxe deníků `community`. Ztráta dat je nejsilnější negativní sentiment komunity (Reddit o Awoken) `community`. Konkurence: hlasové zápisy jsou běžné (Lucidity, Lucyd), ale bez toku poslepu a bez offline češtiny.

**Jak v UI:** Celá obrazovka je jedno tlačítko. Hlas: „Řekni tři slova.“ Tři krátké vibrace = uloženo. Pak „Teď celý sen. Pusť tlačítko, až skončíš.“ Přepis se dopočítá později a v deníku je štítek PŘEPIS · ZKONTROLUJ.

**Pracnost:** M (model přepisu, výkon, baterie, testy šepotu).

**Riziko:** Kvalita přepisu šeptané češtiny (změřit chybovost slov na 50 nahrávkách). Soukromí: zvuk nikdy neopouští telefon, volba „smazat nahrávku po přepisu“. Partner v posteli (šepot, vibrace místo zvuku).

### 9. Český průvodce s tvými Stopami snů

**Co:** Audio Záměr poznat sen (MILD) a Střídání smyslů (SSILD) česky, které do vizualizace vloží tvoji aktivní Stopu a plánovanou akci: „Až uvidíš telefon, který nejde vytočit, poznáš, že sníš. Pak se podíváš na ruce.“ Volitelně vlastní hlas: větu záměru si nahraješ sám.

**Proč:** MILD je nejlépe doložená technika (Tan & Fan 2023; ILDIS) `strong`. Protokol: záměr, vizualizace návratu do snu a „všimnutí si něčeho neobvyklého“, předem zvolená akce (LaBerge 2018; ILDIS), aspoň 10 min, bez vnuceného počtu opakování `strong`. SSILD ve znění ILDIS: 4 rychlé a 4–6 pomalých cyklů, celé ~5–7 min, delší technika mírně horší `promising`. Hybrid SSILD a MILD vyšel nejhůř, proto dvě oddělená audia `promising`. Vlastní hlas `community`, bez dat. Žádná z top aplikací nemá doložené české protokolové audio (inference z průzkumu trhu).

**Jak v UI:** Přehrávač s volbou „Záměr poznat sen · 10 min“ a „Střídání smyslů · 6 min“, karta „Dnešní Stopa: telefon“, hlas: ženský, mužský, tvůj. Žádné počítadlo opakování.

**Pracnost:** M (nahrané segmenty, české TTS jen pro název Stopy, skládání stopy).

**Riziko:** Syntetická čeština zní uměle, proto nahrané věty a TTS jen pro jedno slovo. Dlouhé audio prodlužuje usínání: MILD 10 min vedení (LaBerge doporučuje aspoň 10 min), pak ticho a pokračuješ sám; SSILD nejvýš 7 min.

### 10. Záměr na noc s ranním ověřením

**Co:** Večer si vybereš, o čem chceš snít (místo, otázka, člověk) a co uděláš, až budeš lucidní. Ráno appka ověří: objevilo se téma? provedl jsi akci? a položí 5 otázek náhledu podle škály LuCiD. Ověřený lucidní sen = provedená plánovaná akce, ne jen pocit.

**Proč:** Inkubace: zhruba polovina studentů si vybavila sen související se zadaným problémem (Barrett 1993) `promising`. Plánovaná akce jako validace bez EEG (LaBerge 2018; Konkoly 2024 s 5 položkami náhledu z LuCiD, Voss 2013) `promising`. Lucidita a kontrola jsou odlišné dimenze, proto zvlášť (Voss 2013). Konkurence: nikdo neváže inkubaci na ověření lucidity.

**Jak v UI:** Večerní karta „Dnešní záměr“ se dvěma poli: „O čem?“ a „Co uděláš, až to poznáš?“. Ráno 3 přepínače a 5 posuvníků 0–10. Štítek OVĚŘENO jen v deníku, žádné body.

**Pracnost:** S.

**Riziko:** Zklamání, když se téma neobjeví. Text: „I ve studii mělo sen o zadaném tématu jen zhruba každý druhý člověk, a to za celý týden zkoušení.“ Inkubace noční můry se přesměruje na přepis noční můry (IRT).

### 11. Jóga snu napojená na Stopy snů a emoce

**Co:** Denní praxe „Tohle je jako sen“ (20–60 s) se spouští ve chvílích, které odpovídají tvým Stopám (prostředí, děj), a při silné emoci (vnitřní prožitek). Večer krátké „den jako sen“ a záměr, ráno radost z pokroku bez sebekritiky. Vždy s tlačítkem Uzemnit se.

**Proč:** Wangyalovy čtyři základní praxe: změna stop, odstranění lpění a averze, posílení záměru, paměť a radostné úsilí (Wangyal 1998; Norbu 1992; Holecek 2016) `tradition`. Kategorie „vnitřní prožitek“ u LaBerge se kryje s Wangyalovou prací s reakcemi: emoce je zároveň znak snu i předmět praxe `tradition`, `community`. Meditace a LD jen slabá korelace, osmitýdenní MBSR bez efektu (Baird 2019; Gerhardt & Baird 2024) `promising`. Konkurence: jóga snu v aplikacích chybí, nebo je oddělená od deníku.

**Jak v UI:** Výcvik › Jóga snu › „Napojeno na Stopy“. Mini karta při spouštěči: „PROSTŘEDÍ · OBCHOD · Rozhlédni se. Tohle je jako sen.“ Tři kroky: dívej se, poslouchej, vnímej tělo. Tlačítko „Uzemnit se“ (5 věcí vidíš, 4 slyšíš, 3 cítíš).

**Pracnost:** S–M (staví na funkcích 2 a 12 a na existující technice dreamYogaDay).

**Riziko:** Derealizace u zranitelných (Lindahl 2017; Aviram & Soffer-Dudek 2018): formulace „jako sen“, nikdy „nic není skutečné“, max 5× denně, týdenní kontrola Štítu, pauza při zhoršení. Kulturní respekt: „inspirováno bönskou a tibetskou jógou snu“, zdroje, bez vizualizací, které tradice váže na zmocnění.

### 12. Bezpečnostní štít

**Co:** Tichá vrstva, která hlídá spánek a duševní pohodu a sama ubírá intenzitu: rozpočet probuzení (WBTB, ťuknutí, Zvukový klíč), spánkový dluh ze Spánkových dat, týdenní check-in derealizace a depersonalizace (dvě otázky, adaptace CDS-2), automatická sedmidenní pauza indukce, karta ke spánkové paralýze, kontakty na pomoc. Žádné série, žádné tresty.

**Proč:** Záměrně navozené LD predikovaly za 2 měsíce nárůst disociace (β = 0,26) a depersonalizace (β = 0,25), spontánní ne (Aviram & Soffer-Dudek 2018) `promising`. Fragmentace spánku je teoretická obava (Vallat & Ruby 2019; Soffer-Dudek 2020) `promising`. Negativní zážitky se pojí s neúspěšnými pokusy, ne s LD (Mallett 2022) `promising`. CDS-2: dvě položky, při hranici ≥ 3 citlivost 78,9 % a specificita 85,7 % (Michal 2010, malý klinický vzorek, není to diagnóza) `promising`. Spánkovou paralýzu zažije aspoň jednou ~7,6 % lidí (Sharpless & Barber 2011) `strong`. Vynechaný den návyk neruší (Lally 2010), proto žádné série. Konkurence: nikdo nemá automatické snižování intenzity.

**Jak v UI:** Ve Spánku malý štít „Rozpočet probuzení: 1 ze 2 tento týden“. V neděli večer dvě otázky 0–10. Při pauze karta: „Dáme si týden klidu. Vybavování snů a relaxace zůstávají.“ Kontakt: Linka první psychické pomoci 116 123, nonstop, zdarma.

**Pracnost:** S–M.

**Riziko:** Přehnaná medikalizace (krátký jazyk, žádné diagnózy). Obcházení (dovolit vypnutí, ale s potvrzením a bez výčitek). Falešné poplachy (CDS-2 je screening, ne diagnóza).

### 13. Haptický klíč z Garmin hodinek (Connect IQ)

**Co:** Malá Connect IQ aplikace: večer trénink se stejnou vibrací jako klíč, v noci vibrace jen v oknech poslaných z telefonu, pauza při pohybu z akcelerometru hodinek, stisk tlačítka = „Probudilo mě to“. Experimentálně a ve výchozím stavu vypnuto: brána podle tepu (krátkodobá variabilita tepu nad tvou NREM úrovní), se zveřejněnou nejistotou.

**Proč:** Vibrace je jedna z modalit MC v2 (na čele) `promising`. Haptika v Peters 2026 nic nepřidala `promising`, negativní nález. REM z tepu je nejistý (Garmin REM citlivost 33 %, Schyvens 2025). Komunita chce jemný podnět z hodinek a Sleep as Android s Garminem hlásí nefunkční vibrace `community`. Konkurence: Lucid Wake (Wear OS) dělá prahy z HR a RMSSD, na Garminu nic.

**Jak v UI:** Spánek › Zařízení › Garmin › „Haptický klíč“. Na hodinkách jedna černá obrazovka s červeným časem a jedno tlačítko.

**Pracnost:** L (Monkey C, Connect IQ Mobile SDK pro Android, testy na 3–4 modelech).

**Riziko:** Baterie (aplikace v popředí celou noc), možné ovlivnění vestavěného měření spánku Garminem (ověřit na zařízení), vibrace budí, falešná přesnost „detekce REM“.

### 14. Hvězdná mapa: den a sen

**Co:** Volitelný večerní zápis 1–3 událostí dne a toho, jak silně tě zasáhly. Appka hledá, kdy se motivy dne vracejí ve snech: hned (1–2 dny) a se zpožděním 5–7 dní, a kreslí to jako souhvězdí. Výraznou událost nabídne jako možnou budoucí Stopu do večerního záměru.

**Proč:** Kontinuita bdění a snu (Schredl & Hofmann 2003) `promising`. Efekt zpoždění 5–7 dní byl replikován (Nielsen 2004; Blagrove 2011) `promising`. Míra začlenění je nízká a nepředvídatelná, proto vždy „možná“. Konkurence: AI výklady symbolů, ne souvislosti z vlastních dat.

**Jak v UI:** Deník › Hvězdná mapa: vlevo dny, vpravo noci, linky mezi hvězdami. Každá linka má štítek SHODA · 1 DEN nebo SHODA · 6 DNÍ a ukazatel „čekaná náhoda“.

**Pracnost:** M.

**Riziko:** Citlivý obsah (denní zápis je deník života): šifrovat, nikdy v připomínkách. Apofenie: náhodné shody vypadají jako souvislosti, proto permutační kontrola (kolik shod by vyšlo při zamíchání dnů) a zobrazení jen nad touto hladinou.

### 15. Usínací inkubace (zdřímnutí)

**Co:** Režim pro odpolední zdřímnutí ve stylu Dormio: appka připomene téma, při usínání (telefon volně v ruce, změna úchopu z akcelerometru, nebo pevný interval) se tiše zeptá „Co se ti teď honí hlavou?“, nahraje zamumlanou odpověď a pošle tě zpátky. 3–4 kola, pak budík.

**Proč:** Cílená inkubace v usínání zvýšila začlenění tématu a výkon v testech kreativity (Haar Horowitz 2020; Haar Horowitz 2023, Sci Rep, n = 49) `promising`. Pro luciditu netestováno. Pozorování hypnagogie je zároveň průprava pro Vědomé usnutí do snu (WILD) `community`. Konkurence: Dormio je výzkumná rukavice, ne aplikace.

**Jak v UI:** Výcvik › Usínací inkubace: pole „Téma“, délka 20–45 min, volba „telefon v ruce / pevné intervaly“. Ráno, tedy po zdřímnutí, se nahrávky seřadí jako „hypnagogický deník“.

**Pracnost:** M.

**Riziko:** Ruší usínání, proto jen zdřímnutí, nikdy noční spánek. Spánková paralýza u citlivých. Nahrávky citlivé, jen lokálně.

---

## UX specifikace TOP 5

### Společné prvky pro všech pět

**Styl Program 2026.** Den: pozadí #04060C, panel #0C1222, text #E9EDF5, tlumený #8D97AD, akcent #FF5F1F. Titulky Inter Tight, text Inter, štítky JetBrains Mono velkými písmeny (OKNO REM 3 · 04:40–05:05). Karty s rohovými značkami, noc jako oběžná dráha, REM okna jako oranžové oblouky s měkkým okrajem podle nejistoty. Noc: jen #FF3B2F (text, hlavní akce), #B3261E (sekundární), #5A120D (linky, plochy) na čisté černé, bez oranžové a bez bílé, jas displeje minimální.

**Sdílený model: REM profil** (podrobné odvození patří do `algoritmus_rem_cyklu.md`, tady jen to, co potřebují funkce):

```
// p_rem[b] = pravděpodobnost REM v binu b (5 min) od skutečného usnutí, b = 0..120 (0–10 h)
NOCI   = posledních 28 nocí: Oura type == "long_sleep", jinak relace ≥ 4 h
VAHA   = {oura30s: 1.0, oura5min: 0.9, garminHC: 0.5, jinyHC: 0.6}
K0     = 5        // síla populačního prioru p0 v "nocích"
LR_SEN = 1.9      // sen při probuzení: 82 % vs 43 % vybavení (Nielsen 2000)
LR_BEZ_SNU = 0.4  // „Probudil jsem se, ale nic si nepamatuju“: (1 − 0,82) / (1 − 0,43), viz algoritmus 4.2
SIGMA  = {presne: 5, zhruba: 20, nevim: 60}   // minuty, nejistota času snu

pro noc n v NOCI:
  onset = první epocha spánku, po které následuje ≥ 10 min spánku   // ne bedtime_start
  pro bin b: dev[n][b] = podíl epoch REM v binu (pokud zařízení pro noc existuje)
  pro sen s v n s časem T a jistotou j:
     pro b: k = exp(-((b*5 - (T - onset))^2) / (2*SIGMA[j]^2))
            logit(dev[n][b] nebo p0[b]) += k * ln(LR_SEN)     // jen mírný posun
  // dvě zařízení pro stejnou noc: obě noci zvlášť, váhy se sčítají

rem[b]    = Σ_n VAHA[n] * dev[n][b]
celkem[b] = Σ_n VAHA[n]
p_rem[b]  = (rem[b] + K0 * p0[b]) / (celkem[b] + K0)
p_rem     = klouzavý průměr přes 15 min
pas[b]    = 80% interval Beta(rem[b] + K0*p0[b] + 0.5, celkem[b] - rem[b] + K0*(1-p0[b]) + 0.5)
p0        = populační křivka: REM periody zhruba po 90 min, prodlužují se k ránu
```

Tenhle vzorec je zjednodušení pro MVP. Závazný model a parametry zařízení jsou v `algoritmus_rem_cyklu.md` a `presnost_nositelne_elektroniky.md`: Oura senzitivita REM 0,70 a falešně pozitivní 0,10, Garmin 0,50 a 0,15, korelace chyb ρ = 0,3 v binárním modelu přesnosti, což v třítřídním modelu algoritmu odpovídá ρ ≈ 0,4 (stejná předpokládaná závislost, jen jiný zápis). Sčítání vah VAHA bere obě zařízení jako nezávislé svědky, proto má Garmin jen poloviční váhu.

**Rozpočet probuzení** (hlídá Štít, sdílí 1, 3, 7): WBTB nejvýš 2× za 7 dní a nikdy dvě noci po sobě. Ťuknutí nejvýš 2 za noc a 3 noci za 7 dní, nikdy v noci s WBTB. Dvě hlášení „Probudilo mě to“ za 7 dní přepnou Zvukový klíč do jemného režimu.

---

### TOP 1: Chytré probuzení do snu (WBTB podle REM oken)

**Uživatelský příběh.** Jako nerd s Ourou chci, aby mě budík na Probuzení a návrat do spánku vzbudil v nejpravděpodobnější části noci, a jen v noci, kdy si to můj spánek může dovolit. Chci si pamatovat živý sen pro Záměr poznat sen, rychle zase usnout a ráno vidět, jestli to vyšlo.

**Vstupní body.**
1. Plán na dnešek: karta „Probuzení do snu“ (jen pokud je den programu ≥ 15 a brána je otevřená).
2. Spánek › REM okna › tlačítko „Naplánovat probuzení“.
3. Večerní „Start noci“ (Dnes): přepínač „Probuzení do snu“.
4. Program: dny s WBTB předvyplní plán, brána ale platí vždy.

**Obrazovky a stavy.**

*A. Karta v Plánu na dnešek*

| Stav | Štítek | Titulek | Text | Akce |
|---|---|---|---|---|
| Povoleno, s daty | DNES MŮŽEŠ · PROBUZENÍ | Probuzení do snu | Nejpravděpodobnější část noci pro REM vychází mezi 4:35 a 5:05. Budík zazní uprostřed. Je to odhad, ne jistota. | Naplánovat · Dnes ne |
| Povoleno, bez dat (prázdný) | OBECNÉ OKNO | Probuzení do snu | Tvoje REM okna zatím neznám. Budík dám 5 h po usnutí a za pár nocí to zpřesním. | Naplánovat · Připojit Spánková data |
| Brána zavřená | SPÁNEK PRVNÍ | Dnes bez probouzení | Důvod v čipu, např. „Tento týden už 2×“, „Včera byl budík, dvě noci po sobě ne“, „Včera jsi spal 5 h 40 min“, „Ráno žlutá“. | Záměr ráno, bez budíku |
| Prvních 14 dní | CHRÁNÍME SPÁNEK | Probuzení přijde později | Prvních 14 dní jen vybavování snů. Od 15. dne ti budík nabídnu. | (žádná) |
| Brána zavřená: alkohol nebo nemoc | SPÁNEK PRVNÍ | Dnes bez probouzení | Po alkoholu bývá druhá polovina noci rozbitá a REM rozházený. Zkusíme to jindy. | Záměr ráno, bez budíku |

*B. První použití (jednou, tři řádky a jedno tlačítko)*
- „Budík jen 2× týdně.“
- „Jen když ses vyspal dobře.“
- „Vzbudíš se, vybavíš si sen, 10–20 minut technika a zpátky spát.“
- Tlačítko: „Rozumím“. Pod ním odkaz „Proč zrovna REM?“ (lekce sleepCycles).

*C. Detail plánu (spodní panel)*
- Noční orbita: ulehnutí, odhad usnutí, oblouky REM oken s pásmem nejistoty, značka budíku. Štítek ODHAD · NE MĚŘENÍ.
- Volby: „Technika: Záměr poznat sen (MILD) / Střídání smyslů (SSILD)“, „Bdění: 10 / 20 / 30 min“, „Jemný náběh 30 s“, „Nejpozději v 5:30“.
- Text pod orbitou: „Okno je spočítané z 23 nocí. Šance, že tě budík zastihne v REM, je asi 3 z 10, o kousek víc než při pevných 5 h. Víc bez živých dat nejde.“

*D. Start noci*
- Tlačítko „Jdu spát“ uloží kotvu usnutí. Potvrzení: „Budík kolem 4:50. Posunu ho podle toho, kdy usneš.“
- Když uživatel appku znovu otevře do 2 h: „Ještě nespíš? Budík je posunutý na 5:10.“

*E. Probuzení (noční režim, jen červená)*
1. Budík s náběhem 30 s, vibrace. Obrazovka: „Sním?“ (funkce 6, 3 s).
2. „Nehýbej se. Co se ti zdálo?“ Tlačítka: „Mám sen“ (otevře Zápis poslepu) · „Nic si nepamatuju“ (uloží záznam bez snu s časem).
3. Po zápisu: „Teď Záměr poznat sen. 10 minut, pak usni.“ Spustí se audio (funkce 9).
4. Konec audia: „Zhasni. Usni do 10 minut, bez snahy.“ Tlačítko „Jdu spát“ uloží čas návratu.
5. Probudil se sám do 30 min před budíkem a otevřel appku: „Probudil ses sám. Chceš teď udělat záměr? Budík zruším.“

*F. Ráno (v toku Jak ses vyspal)*
- S daty: „Usnul jsi zpátky asi za 6 min.“ a „Budík zazněl ve 4:50. Podle Oury jsi byl možná v REM.“
- Data ještě nejsou: „Až otevřeš aplikaci Oura, doplním, jak rychle jsi usnul.“
- Pomalý návrat: „Usínal jsi přes 20 minut. Příště zkrátím bdění na 10 minut a necháme zhasnuto.“

*G. Chybové stavy*

| Situace | Text | Akce |
|---|---|---|
| Chybí oprávnění přesných budíků | Bez povolení přesných budíků může budík zazvonit pozdě. Povol je, nebo ho nastavím v Hodinách. | Povolit · Použít Hodiny |
| Budík nezazvonil (telefon vypnutý, úspora) | Budík v noci nezazvonil. Telefon ho nejspíš uspal. | Vypnout optimalizaci baterie |
| Zaspal jsi budík | Budík jsi zaspal. Nevadí, tahle noc se do rozpočtu nepočítá. | (žádná) |
| Zařízení si odporují | Oura a Garmin se neshodnou. Ukazuju obě a okno beru z Oury. | Ukázat obě |
| Oura vrací 403 | Oura neposílá data. Zkontroluj členství nebo přepni na Health Connect. | Přepnout |

**Datový model.**

```
SleepNight {
  id, localDate, tzOffsetMin,
  source: oura30s | oura5min | garminHC | otherHC | manual,
  bedtimeStart, onsetAt, wakeAt, tstMin, efficiency, ouraType,
  hypnogram: { resolutionSec: 30 | 300, stages: "4442233…" },   // 1 hluboký, 2 lehký, 3 REM, 4 bdění
  quality: green | amber | red,           // Jak ses vyspal
  tags: [alkohol, nemoc, cesta, …]
}
WbtbPlan {
  id, nightId, createdAt,
  gate: { open: bool, reasons: [code], warnings: [code] },
  profileNights: int, mode: personal | generic,
  targetOffsetMin, windowStartMin, windowEndMin, pRemAtTarget,
  onsetAnchorAt, onsetEstimateAt, latestAt, alarmAt, alarmChannel: exact | clockApp,
  technique: mild | ssild, wakeDurationMin, rampSec,
  // noc
  firedAt, dismissedAt, recallAtWake: yes | no | skipped, backToBedAt, audioCompletedPct,
  // ráno
  remHit: bool?, stageAtAlarm: 1..4?, returnLatencyMin?, latencyBucket: lt5 | 5to10 | 10to20 | gt20?,
  ldThatNight: bool?, experimentArm?
}
WakeBudget { weekStart, wbtbUsed, tapsUsed, tlrWokeMe, pausedUntil? }
```

**Algoritmus.**

```
funkce brana(dnes):
  duvody = []
  pokud denProgramu < 15:                      duvody += PRVNICH_14
  pokud wbtbZa7Dni >= 2:                       duvody += TYDEN_PLNY
  pokud vcera WBTB nebo ťuknutí:               duvody += VCERA_BUZENI
  pokud jakSesVyspal(dnes) != green:           duvody += NE_ZELENA   // jen po dobré noci
  pokud tst(vcera) < 6 h:                      duvody += MALO_SPANKU
  pokud prumerTst(7 dní) < 6.5 h:              duvody += DLUH
  pokud planovanyBudik - planovaneUlehnuti < 7.5 h: duvody += KRATKA_NOC
  pokud bezpecnost.bezProbouzeni:              duvody += BEZPECI
  pokud stit.pauzaDo >= dnes:                  duvody += KLIDOVY_TYDEN
  pokud "alkohol" nebo "nemoc" v tagyDne:      duvody += ALKOHOL_NEMOC   // REM rozházený (Ebrahim 2013)
  varovani = []
  vrať (duvody.prazdne, duvody, varovani)

funkce cilovyCas(profil):
  pokud profil.noci < 5: vrať (300, generic)            // 5 h, obecné okno
  pro t v 270..390 krok 5:                             // 4,5–6,5 h
     skore[t] = průměr(p_rem[t-10..t]) - 0.15 * p_hluboky[t]   // aspoň 10 min REM, nebudit z hlubokého
  t* = argmax skore
  pokud skore[t*] < 0.30: vrať (300, generic)
  okno = [t* - max(10, sdZacatkuRem), t* + max(10, sdZacatkuRem)]
  vrať (t*, personal, okno)

pri "Jdu spát":
  usnutiOdhad = ted + clamp(median(latenceVecer, 14 nocí), 5, 45 min)
  alarm = min(usnutiOdhad + t*, ranniBudik - 90 min, uzivatelNejpozdeji)
  naplánuj setAlarmClock(alarm) nebo AlarmClock.ACTION_SET_ALARM
pri dalším otevření appky do 2 h: usnutiOdhad = ted + median; přeplánuj

rano po příchodu hypnogramu:
  remHit = REM ≥ 5 min v 10 min před firedAt
  start = backToBedAt (nebo konec audia + 1 min)
  usnul = první okamžik po start, od kterého trvá spánek ≥ 3 min
  latence = usnul - start
  zobrazení: 30s data → „asi N min“, 5min data → koš (do 5, 5–10, 10–20, přes 20)
  adaptace (ILDIS: úprava podle bdělosti):
     latence > 20 min ve 2 ze 3 posledních → wakeDuration = max(5, wakeDuration - 10), bez světla, bez vstávání
     latence < 2 min a bez vybavení ve 2 ze 3 → nabídni delší bdění nebo pár minut světla
  přidej noc do REM profilu (uzavřená smyčka)
```

**Okrajové případy.**
- Pozdní ulehnutí: alarm se posouvá od kotvy, ale nikdy pod 90 min před ranním budíkem. Když nevyjde, plán se zruší: „Dnes by na návrat nezbyl čas. Probuzení přesouvám.“
- Zdřímnutí a rozdělená noc: do profilu jen `long_sleep` nebo relace ≥ 4 h.
- Změna času a cestování: všechny časy v UTC plus offset noci. První 3 noci po změně pásma o ≥ 2 h jen obecné okno.
- Probudil se sám dřív: nabídka záměru a zrušení budíku, noc se počítá do rozpočtu.
- Dvě zařízení: profil z obou s vahami, ranní kontrola zásahu podle zařízení s vyšší vahou.
- Směnný provoz, těhotenství, řízení ráno: v bezpečnostní úrovni „bez probouzení“.
- Oura data dorazí až večer: ranní karta se doplní později, nečeká se.

**Metriky úspěchu.**
- Vybavení snu při buzení: cíl ≥ 70 %.
- Zásah do REM podle zařízení: sledovat, nic neslibovat. Model čeká asi 0,31 proti 0,27 u pevných 5 h (`algoritmus_rem_cyklu.md` 4.4), cíl je nebýt horší než pevný čas a zisk ověřit randomizací (bod 2 níž).
- Návrat do spánku do 10 min: cíl ≥ 60 % WBTB nocí.
- LD na WBTB noc: sledovat, nikdy neslibovat (benchmark studií 16–20 %).
- Bezpečnost: 0 porušení rozpočtu. „Jak ses vyspal“ po WBTB nocích v průměru nejvýš o 1 bod horší (0–10) než jindy. Podíl lidí, kteří WBTB vypnou kvůli únavě.

**Jak validovat.**
1. **Zpětné přehrání:** na historických hypnogramech vynechat vždy jednu noc a předpovědět REM v okně. Kalibrační graf (předpověď 40 % ≈ skutečnost 40 %?) a Brierovo skóre proti modelu „pevných 5 h“.
2. **Randomizace v appce** (šablona E7 v Osobní laboratoři): na způsobilých nocích chytré okno vs pevných 5 h. Uživatel vidí jen „mezi 4:20 a 5:30“, takže je zaslepený. Primární výstup: vybavení snu při buzení (častá událost, dobrá síla). Sekundární: zásah do REM, LD.
3. **Malá EEG kontrola:** 2–3 testeři, 5–10 nocí s čelenkou (např. ZMax) proti Ouře a Garminu.

---

### TOP 2: Od Stopy snů ke spouštěči

**Uživatelský příběh.** Opakovaně se mi zdá o škole a o telefonu, který nejde vytočit. Chci, aby z toho appka udělala můj osobní spouštěč na den a cíl Záměru poznat sen na noc a aby mi ukázala, jestli se to do snu opravdu přenáší.

**Vstupní body.**
1. Deník: po uložení snu čip „Tohle se ti zdálo už potřetí“.
2. Deník › Stopy snů (souhvězdí motivů).
3. Realita › Moje spouštěče.
4. Plán na dnešek: „Dnešní Stopa: telefon“.
5. Audio Záměr poznat sen vloží aktivní Stopu (funkce 9).

**Kategorie znaků snů v appce** (podle LaBerge & Rheingold 1990):

| Kategorie | Co sem patří | Příklad Stopy | Šablona spouštěče „když–pak“ |
|---|---|---|---|
| Vnitřní prožitek | emoce, myšlenky, tělesné pocity | panika, spěch, „musím stihnout“ | Když ucítím spěch, zastavím se a zeptám se: Sním? |
| Děj | co se děje a nejde, nemožné akce | telefon nejde vytočit, běh na místě | Když mi něco nefunguje, zeptám se: Sním? |
| Podoba | zvláštní tvary, osoby, předměty | dům se mění, pes mluví | Když uvidím psa, podívám se na něj dvakrát. |
| Prostředí | místo a situace | škola, dětský pokoj | Když vejdu do budovy, rozhlédnu se: Sním? |

**Obrazovky a stavy.**

*A. Stopy snů (souhvězdí)*
- Běžný stav: hvězdy = motivy, velikost = počet nocí za 30 dní, barva okraje = kategorie, linka = motivy ze stejného snu. Štítek u hvězdy: TELEFON · 4 NOCI · DĚJ.
- Prázdný: „Stopy snů se objeví po pár zápisech. Zapiš aspoň 5 snů a já hledám, co se opakuje.“
- První použití: „Stopa snu je motiv, který se ti vrací. Když ho poznáš, poznáš sen.“ Tlačítko „Ukaž mi kategorie“.
- Soukromá Stopa: hvězda se zámkem, „Soukromá. Nikdy v připomínkách.“

*B. Návrh spouštěče (karta)*
- Štítek: STOPA · TELEFON NEJDE VYTOČIT · 4× ZA 30 DNÍ
- Otázka: „Jak často to potkáš ve dne?“ Volby: „Denně“ · „Občas“ · „Nikdy“.
- Návrh: „Když mi v bdění něco nefunguje (telefon, dveře, světlo), zastavím se a zeptám se: Sním?“
- Akce volitelně: „Přidat test: nadechni se se zavřenými ústy.“ (výchozí vypnuto, viz ILDIS)
- Tlačítka: „Přijmout“ · „Upravit“ · „Jiný návrh“.
- Při plných 3: „Máš 3 aktivní spouštěče. Víc jich mozek neudrží. Vyměň jeden.“

*C. Den*
- Rychlá dlaždice v panelu rychlého nastavení a widget „Udělal jsem test“ (jedno klepnutí, bez otevření appky).
- Připomínka je nácvik plánu, ne náhodný test: 1× ráno, volitelně 1× odpoledne. Příklady (≤ 60 znaků, střídají se formy):
  - „Dnes hledej: něco, co nefunguje.“
  - „Kde dnes potkáš svou Stopu?“
  - „Když něco zadrhne, zeptej se: Sním?“

*D. Večer*
- V Záměru poznat sen: „Dnes v noci hledej: telefon, který nejde vytočit.“

*E. Ráno, v zápisu snu*
- Pokud text obsahuje kmen motivu, appka předvyplní: „Objevil se telefon?“ Ano / Ne.
- Při Ano: „Všiml sis, že je to divné?“ → „Udělal jsi ve snu test?“ → „Byl jsi lucidní?“
- Bez shody v textu se neptá (žádné návodné otázky).

*F. Přenos do snu (týdenní pohled)*
- Trychtýř: „Za 30 dní: Stopa ve snu 6× · všiml sis 2× · test ve snu 1× · lucidita 1×.“
- U spouštěče po 21 dnech: „Telefon se ve snech za 3 týdny neobjevil. Vyměníme ho?“

*G. Chybové stavy*

| Situace | Text |
|---|---|
| Zápisy příliš krátké | Ze tří slov Stopy nenajdu. Zkus přidat místo a jednu věc, která byla divná. |
| Připomínky zakázané v systému | Připomínky jsou vypnuté. Spouštěč pořád funguje, jen ti ho nepřipomenu. |
| Motiv z noční můry | Tohle vypadá jako noční můra. Spouštěč z ní nedělám. Chceš ji přepsat? (vede na IRT) |

**Datový model.**

```
DreamSign {
  id, label, category: inner | action | form | context,
  stems: [String], mergedFrom: [id], private: bool, fromNightmare: bool,
  firstSeen, lastSeen, nights30d, distinctWeeks30d, oddity: 0..1,
  score, status: candidate | active | retired | dismissed
}
Trigger {
  id, dreamSignId, ifText, thenText, withTest: bool,
  wakingFrequency: daily | sometimes | never, analogOf?: String,
  activatedAt, reviewAt (= +21 dní), reminderPlan: { morning: bool, afternoon: bool },
  status: active | paused | retired
}
TriggerLog { id, triggerId?, at, kind: noticed | test | reminderOpened }
SignOccurrence {
  dreamId, dreamSignId, confirmedByUser: bool,
  noticedOddity: yes | no | unsure, testInDream: bool, ledToLucidity: bool
}
```

**Algoritmus.**

```
// 1) kandidáti
termy = štítky uživatele (váha 1.0) ∪ podstatná jména z textu po lehkém českém
        stemmingu (Dolamic & Savoy 2009) a odstranění stop slov (váha 0.6)
sloučit synonyma podle uživatelských sloučení

// 2) skóre za 30 dní (počítají se noci, ne zmínky)
noci_w(m) = Σ přes noci s m: 0.5^(stáří_dny / 14)            // poločas 14 dní
oddity(m) = podíl snů s m, kde uživatel označil "divné" nebo text obsahuje
            {nešlo, najednou, nemohl, změnil se, létal}
skore(m)  = noci_w(m) * (1 + 0.5 * oddity(m)) * (kategorie ∈ {action, form} ? 1.2 : 1.0)
kandidát, když nocí30d ≥ 3 a distinctWeeks30d ≥ 2 a nejde o soukromou ani o noční můru

// 3) návrh spouštěče
šablona podle kategorie, doplní se label
pokud wakingFrequency == never: spouštěč z obecnější analogie (škola → "budova",
   dětský pokoj → "dveře doma"), Stopa zůstává jen cílem nočního záměru

// 4) aktivace a revize
max 3 aktivní; reviewAt = +21 dní
při revizi: objevení ve snech == 0 → navrhni výměnu
            objevení ≥ 1 a všimnutí ≥ 1 → ponech
            objevení ≥ 3 a všimnutí == 0 → navrhni silnější plán (přidat test, přidat do audia)

// 5) přenos (bayesovsky, Beta(1,1) pro každý krok trychtýře)
p_vsimnuti = Beta(1 + všiml sis, 1 + objevila se - všiml sis)
zobraz medián a 80% interval až od 3 objevení ve snech
```

**Okrajové případy.**
- Intimní a sexuální motivy: automaticky soukromé, nikdy v připomínce ani na zamčené obrazovce.
- Jména osob: v připomínce jen iniciála nebo obecně („někdo blízký“).
- Trauma a noční můry: nikdy spouštěč, nabídka IRT.
- Málo zápisů: návrhy až po 5 snech a 2 týdnech.
- Slovní tvary a překlepy: stemming a ruční sloučení („telefon“, „mobil“, „telefonu“).
- Spouštěč v kombinaci se Záměrem poznat sen: výchozí bez testu. Varianta s testem je experiment E4.

**Metriky úspěchu.**
- Podíl lidí s ≥ 1 aktivním spouštěčem do 21. dne (cíl ≥ 50 % aktivních uživatelů).
- Přijetí nebo úprava návrhu (cíl ≥ 70 %, měří kvalitu rozpoznání motivů).
- Míra všimnutí si Stopy ve snu: trend za 4 týdny nahoru.
- Podíl LD, které začaly poznáním Stopy.
- Zátěž: „Jak moc tě spouštěče obtěžují?“ 0–10, cíl medián ≤ 3. Míra odmítnutí připomínek ≤ 30 %.

**Jak validovat.**
1. **Přesnost rozpoznání:** 20 testerů ručně označí Stopy v 30 snech, srovnat s automatikou (přesnost, úplnost).
2. **Mikrorandomizace připomínek** (Klasnja 2015): každá plánovaná připomínka se losuje odeslat / neodeslat a forma A / B. Blízký výstup: zaznamenaný test nebo všimnutí do 2 h. Dat je dost (desítky rozhodnutí týdně).
3. **Vzdálený výstup** (všimnutí ve snu, LD): experiment E4 v Osobní laboratoři, dny se spouštěčem vs bez, bloky po týdnech kvůli přenosu mezi dny.

---

### TOP 3: Zvukový klíč (TLR podle Konkolyho pro Android)

**Uživatelský příběh.** Chci vyzkoušet TLR podle publikované studie, česky, s jistotou, že mě to nebude budit víc, než musí. A chci vědět, jestli mi zvuk opravdu pomáhá, nebo jen věřím, že pomáhá.

**Vstupní body.** Výcvik › Techniky › Zvukový klíč (TLR). Plán na dnešek: „Dnes noc se Zvukovým klíčem“. Start noci: přepínač.

**Vstupní podmínky.** Den programu ≥ 15. Vybavený sen aspoň ve 2 ze 7 posledních nocí (Konkoly 2024). Bezpečnostní úroveň povoluje noční podněty. Ne po červené. Souhlas s kontrolními nocemi.

**Parametry** (výchozí = Konkoly 2024 exp. 2, [V] ověřeno v plném textu, [N] náš návrh):

| Parametr | Hodnota |
|---|---|
| Podnět | harfová melodie ~3 s s náběhem a doznivem; kontrolní „cizí zvuk“ = druhá melodie z testu rozlišení [V] |
| Trénink 1. noc | 4× podnět + výzva, pak 12 podnětů v intervalech 45, 70, 55, 65, 70, 80, 65, 60, 75, 75, 90, 120 s [V] |
| Trénink další noci | výzva jen po prvním podnětu, pak 12 podnětů [V pro výzvu, N pro opakování 12] |
| Kalibrace | 1. noc práh slyšitelnosti a práh rozlišení, telefon displejem dolů u polštáře, systémová hlasitost médií na maximum [V] |
| Začátek | nejdřív 6 h po konci tréninku [V]; s REM profilem jen v oknech s p_rem ≥ 0,35 [N] |
| Interval | náhodně 20–40 s [V] |
| Náběh | +0,16 % maximální hlasitosti přehrávače na podnět od prahu rozlišení, jemný režim +0,08 % se stropem na prahu rozlišení [V, jednotka N] |
| Strop | úroveň, při které jsi hlásil zvuk ve snu nebo LD [V] |
| Pauza po pohybu | do 1 min klidu, pak znovu od prahu rozlišení [V] |
| Probudilo mě to | pauza 45 min, v jemném režimu konec na celou noc [V] |
| Konec | 30 min před plánovaným budíkem nebo po 300 podnětech [N] |
| Noc s WBTB | zkrácený trénink po návratu do postele (výzva + 6 podnětů), podněty nejdřív 25 min po „Jdu spát“, jen v oknech [N] |
| Kontrolní noci | bloky po 4 nocích: klíč, klíč, cizí zvuk, ticho, náhodně zamíchané, uživatel neví [V pro design] |

**Obrazovky a stavy.**

*A. Úvod (první použití)*
- „Naučíš se jeden zvuk. Večer ho spojíš s bdělostí. V noci ho potichu pustím do tvých pozdních REM oken.“
- „Někdy tě vzbudí. Proto má strop, pauzy a tlačítko Probudilo mě to.“
- Důkazy, štítek PROMISING: „Ve studii doma pomohl jen ve druhé noci, celkově rozdíl jistý nebyl. Zjistíme, jak funguje u tebe.“
- Souhlas: „Některé noci bude hrát jiný zvuk nebo nic. Nebudeš vědět které. Jen tak poznáme, jestli pomáhá právě tobě.“ Přepínač „Souhlasím“.

*B. Kalibrace (1. noc, vleže, ~3 min)*
- „Polož telefon displejem dolů vedle polštáře.“
- Práh slyšitelnosti (schodiště hlasitosti): „Slyšíš tón?“ Slyším / Neslyším.
- Práh rozlišení: „Jsou ty dva zvuky stejné?“ Stejné / Jiné.
- Hotovo: „Hotovo. Teď trénink, asi 20 minut. Klidně při něm usni.“

*C. Trénink (český hlas, tykání, překlad výzvy Konkoly 2024)*
> „Až uslyšíš tenhle zvuk, staň se lucidním. Obrať pozornost ke svým myšlenkám a všimni si, kam mysl odběhla. (pauza) Teď vnímej tělo, vjemy a pocity. (pauza) Vnímej dech. (pauza) Zůstaň lucidní a kriticky bdělý. Všímej si, čím se tenhle zážitek liší od běžného bdění.“ (45 s ticho)
>
> „Zvuky teď budou pokračovat bez slov. Klidně usni. Při každém zvuku trénuj bdělost.“

*D. Noc (jen červená)*
- Displej zhasne. Trvalé oznámení noční služby: „Zvukový klíč běží · start po 4:10“ s tlačítky „Probudilo mě to“ a „Ukončit“.
- Zvednutí telefonu: noční obrazovka nad zámkem (showWhenLocked): „Probudil tě zvuk?“ Ano / Ne / Nevím. Pak „Spát dál“ / „Vstávám“. Při „Spát dál“ krátký zápis poslepu, pokud byl sen.

*E. Ráno*
- „Slyšel jsi zvuk ve snu?“ Ano / Ne / Nevím.
- „Proměnil se v něco?“ (volné pole, volitelné)
- Lucidita 0–10, kontrola 0–10, plánovaná akce ano / ne, 5 otázek náhledu.
- Kontrolní noc se neprozradí. Odhalení až v kontrolním bodě laboratoře.

*F. Chybové stavy*

| Situace | Text | Akce |
|---|---|---|
| Systém ukončil službu | Noc se přerušila ve 2:14. Telefon ukončil přehrávání. | Vypnout optimalizaci baterie |
| Baterie pod 30 % při startu | Baterie má 24 %. Připoj nabíječku, ať noc vydrží. | Spustit i tak |
| Odpojená sluchátka | Sluchátka se odpojila. Pokračuju přes reproduktor, nebo končím? | Reproduktor · Konec |
| Systémová hlasitost změněna | Hlasitost se v noci změnila. Kalibraci ráno zopakujeme. | (žádná) |
| Režim Nerušit tlumí média | Režim Nerušit ztlumil zvuk. Povol média v Nerušit. | Otevřít nastavení |
| Žádné vybavení 5 nocí | Pět nocí bez vzpomínky na sen. Dáme Zvukovému klíči pauzu a zaměříme se na vybavování. | Rozumím |

**Datový model.**

```
TlrProfile {
  cueSoundId, controlSoundId, hearThreshold: 0..1, discrimThreshold: 0..1,
  cap: 0..1?, rampPerCue: 0.0016 | 0.0008, gentleMode: bool, calibratedAt
}
TlrNight {
  id, nightId, condition: cue | control | silence, blindRevealed: bool,
  trainingStart, trainingEnd, trainingCompletedPct,
  earliestStart, windows: [{start, end, pRem}],
  cues: [{at, level, soundId}],          // u ticha se loguje "virtuální" plán bez zvuku
  movementPauses: [{start, end}], wokeMe: [{at, answer: yes | no | unsure}],
  endReason: plannedEnd | maxCues | wokeMeGentle | userStop | systemKill,
  morning: { heardCue: yes | no | unsure, incorporationText?, lucidity, control,
             plannedActionDone, insight: [5 × 0..10], guessCondition?: cue | other | unsure }
}
```

**Algoritmus.**

```
startNoci():
  podminky = vstupniPodminky() ; pokud ne: zobraz důvod, konec
  podminka = experiment.pridel(noc)                 // klíč / cizí zvuk / ticho, skrytě
  spusť FGS mediaPlayback + PARTIAL_WAKE_LOCK, akcelerometr ~5 Hz
  trenink(prvniNoc ? plny : kratky)                  // vždy stejný, i v kontrolní noci
  earliest = trainingEnd + 6 h
  okna = profil.noci ≥ 5 ? oknaNad(p_rem, 0.35, od=earliest, do=budik-30min)
                         : [earliest, budik-30min]

  hlasitost = discrimThreshold ; pocet = 0
  smyčka dokud ted < budik - 30 min a pocet < 300:
     pokud ted mimo okna: spi do začátku dalšího okna ; hlasitost = discrimThreshold ; pokračuj
     pokud pohybOdPoslednihoPodnetu(): čekej, dokud 60 s bez pohybu ; hlasitost = discrimThreshold ; pokračuj
     pokud wokeMe(): pokud gentleMode: konec noci, jinak čekej 45 min od "Spát dál" ; hlasitost = discrimThreshold
     zvuk = podminka == cue ? cueSound : podminka == control ? controlSound : NIC
     přehraj(zvuk, hlasitost) ; loguj(ted, hlasitost) ; pocet += 1
     strop = gentleMode ? discrimThreshold : (cap ?? 1.0)
     hlasitost = min(hlasitost + rampPerCue, strop)
     čekej náhodně 20–40 s

detekce pohybu:
  první 10 min klidu po tréninku → šum = medián |a - g|, MAD
  pohyb = |a - g| > medián + 6 * MAD po dobu ≥ 1 s

ráno, učení stropu (jen v nocích s klíčem):
  pokud heardCue == yes a (lucidita ≥ 5 nebo incorporationText):
     cap = úroveň posledního podnětu před časem probuzení ze snu (z ranního zápisu),
           jinak 80. percentil úrovní té noci
  pokud wokeMe == yes: cap = 0.8 * úroveň při probuzení
  pokud wokeMe ≥ 2 za 7 dní: gentleMode = true (Štít)
```

**Okrajové případy.**
- Partner v posteli: volba sluchátek do spánku s varováním, že tlačí. Nebo jen Haptický klíč (funkce 13).
- Tinnitus nebo citlivost na zvuk: kalibrace jinými tóny, možnost vypnout.
- Telefon spadne z postele: pohyb → pauza, náraz → ranní dotaz.
- Hluk okolí, šum ventilátoru: kalibrovat v obvyklém prostředí. Volitelná tichá zvuková kulisa, nikdy tichá smyčka.
- Noc s WBTB: zkrácený trénink a pozdější start, rozpočet se nepočítá dvakrát.
- Noc ticha: služba běží stejně, loguje pohyb, uživatel pozná rozdíl jen sluchem v bdění. Proto ranní tip podmínky (kontrola zaslepení).

**Metriky úspěchu.**
- „Probudilo mě to“: cíl ≤ 0,2 hlášení na noc.
- Pohyb po podnětu vs v noci ticha: rozdíl menší než v Konkoly 2024 (0,19 vs 0,10).
- Hlášení „slyšel jsem zvuk ve snu“: v nocích s klíčem vs ticha (rozdíl = skutečné začlenění, ticho = falešná hlášení).
- LD: klíč vs kontroly (Osobní laboratoř, šablona E3).
- Retence 7 nocí: cíl nad 12 % z Konkoly 2024.
- Spánek: „Jak ses vyspal“ v nocích s klíčem nejvýš o 1 bod horší než v nocích ticha.

**Jak validovat.**
1. Vestavěný zaslepený design (bloky klíč, klíč, cizí zvuk, ticho). Výsledek po 10 a 20 nocích na podmínku.
2. Kontrola zaslepení: podíl správných ranních tipů. Nad 70 % = zaslepení nefunguje, výsledek ber s rezervou.
3. Agregace dobrovolných exportů od beta testerů (ruční export ze Zálohy, anonymizovaný) proti benchmarkům Konkoly 2024.
4. Technický test 30 nocí na 5 telefonech: přežití služby, baterie, přesnost intervalů.

---

### TOP 4: Osobní laboratoř (experimenty N-of-1)

**Uživatelský příběh.** Jsem nerd a nechci věřit fórům. Chci si na sobě poctivě ověřit, jestli mi víc sedí Záměr poznat sen, nebo Střídání smyslů, a jestli Zvukový klíč dělá něco víc než moje očekávání. Chci výsledek, kterému můžu věřit, i když to bude „zatím nevíme“.

**Vstupní body.** Výcvik › Osobní laboratoř. Plán na dnešek po 21. dni: „Chceš zjistit, co ti sedí víc?“ Zvukový klíč (automaticky šablona E3). Týdenní přehled (stav běžících experimentů).

**Šablony experimentů.**

| Id | Otázka | Varianty | Způsobilé noci | Slepé? | Primární výstup |
|---|---|---|---|---|---|
| E1 | MILD, nebo SSILD při ranním probuzení? | Záměr poznat sen / Střídání smyslů | každá noc | ne | LD noc |
| E2 | MILD, nebo SSILD po WBTB? | totéž po WBTB | jen WBTB noci (pomalé) | ne | LD noc |
| E3 | Pomáhá mi Zvukový klíč? | klíč / cizí zvuk / ticho | noci se Zvukovým klíčem | ano | LD noc, začlenění zvuku |
| E4 | Pomáhají mi denní spouštěče? | dny se spouštěči / bez | týdenní bloky | ne | všimnutí Stopy ve snu, LD |
| E5 | Kolik bdění při WBTB? | 10 / 30 min | jen WBTB noci | ne | návrat do 10 min, LD |
| E6 | Která forma připomínky? | forma A / B (mikrorandomizace) | každé rozhodnutí | ano | test do 2 h |
| E7 | Chytré okno, nebo pevných 5 h? | chytré / pevné | jen WBTB noci | ano | vybavení snu při buzení |

**Statistika (jádro funkce).**

*Model.* Pro každou variantu c: y_c = počet nocí s LD, n_c = počet provedených nocí. Lucidní noc = lucidita ≥ 5 na škále 0–10 nebo provedená plánovaná akce (víc LD za noc se počítá jako jedna noc, počet se ukládá zvlášť).

- Prior pro obě varianty stejný: **Beta(1, 9)**. Průměr 10 %, váha 10 nocí, 95% interval zhruba 0,3–34 %. Odpovídá literatuře: spontánně ~4 % nocí (LaBerge 2018), nejlepší domácí kombinace 16–20 % (NALDIS, ILDIS), TLR doma ~10–15 % (odhad autora studie). Rozsah 5–15 % LD nocí u praktikujících tedy pokrývá střed prioru.
- Personalizace: po výchozím týdnu (7 nocí bez techniky, jako NALDIS a ILDIS) se střed prioru m posune na tvůj odhad, váha zůstává 10: α0 = 10m, β0 = 10(1 − m), m oříznuté na 3–25 %. Stejný prior pro obě varianty znamená, že nic nezvýhodňuje a jen tlumí náhodné rozdíly.
- Posterior: p_c ~ Beta(α0 + y_c, β0 + n_c − y_c).
- Rozdíl d = p_A − p_B. **ROPE = ±0,05** (5 nocí ze 100, tedy 1 LD za 20 nocí). Menší rozdíl na jednom člověku nepoznáme a pro rozhodnutí nemá cenu (Kruschke 2018).
- Výpočet: P(d > 0), P(d > 0,05) a P(|d| < 0,05) Monte Carlem (20 000 dvojic tahů Beta přes dva tahy Gamma, pevný seed, na telefonu milisekundy). Pro celočíselné parametry jde i přesný vzorec pro P(p_B > p_A) jako součet beta funkcí.

*Rozhodovací pravidla v kontrolních bodech* (10, 20, 30, 40 nocí na variantu, mezi nimi se nic nevyhodnocuje). Protože se díváme až čtyřikrát a oběma směry, prahy jsou přísnější, než by stačilo pro jediný pohled:

| Stav | Pravidlo | Text v appce |
|---|---|---|
| Sbíráme | < 10 nocí na variantu | Sbíráme data. 7 z 10 nocí. Výsledek ukážu po 10. |
| Zatím nevíme | žádné pravidlo níž | Zatím nevíme. Šance, že ti víc sedí Střídání smyslů: 84 %. Takové číslo na jednom člověku vyjde často i bez skutečného rozdílu. |
| Vychází lépe | P(d > 0) ≥ 0,95 a P(d > 0,05) ≥ 0,80 | Střídání smyslů ti vychází lépe. Rozdíl nejspíš 5 až 35 lucidních nocí ze 100. |
| Prakticky stejné | P(\|d\| < 0,05) ≥ 0,80 | Obě varianty ti fungují prakticky stejně. Vyber, co tě baví. |
| Nerozhodnuto | 40 nocí na variantu bez verdiktu | Rozdíl je menší, než umíme poznat. Vyber tu, která tě baví a míň ruší spánek. |

Mezistupeň „naznačení“ (P ≥ 0,80) záměrně nezavádíme: v simulaci se při nulovém rozdílu objevil v některém ze čtyř kontrolních bodů u 64 % lidí. Pravděpodobnost se proto ukazuje jen jako číslo s varováním, nikdy jako verdikt.

*Kolik nocí je potřeba* (vlastní simulace, 3 000 opakování, prior Beta(1, 9), kontrolní body 10/20/30/40 nocí na variantu, verdikt kterýmkoli směrem):

| Skutečný stav | Běžné pravidlo (0,95 a 0,80) | Přísné (0,975 a 0,85) | Volné (0,90 a 0,70) |
|---|---|---|---|
| 30 % vs 10 % LD nocí: správný verdikt do 40 nocí | 78 % | 67 % | 88 % |
| 20 % vs 8 % | 51 % | 38 % | 66 % |
| 17 % vs 5 % | 53 % | 41 % | 69 % |
| 15 % vs 10 % | 21 % | 13 % | 33 % |
| 12 % vs 12 % (žádný rozdíl): falešný verdikt | 14 % | 8 % | 30 % |
| 5 % vs 5 % (žádný rozdíl): falešný verdikt | 4 % | 2 % | 11 % |

Výchozí je běžné pravidlo, přísné je volba v nastavení laboratoře pro ty, kdo chtějí méně omylů za cenu delšího čekání. Volné pravidlo se nenabízí.

Pracovní příklady: 4 LD ze 15 nocí vs 1 z 15 dá P(d > 0) = 0,91 a 90% interval rozdílu −3 až +28 bodů: zatím nevíme. 7 z 20 vs 1 z 20 dá P(d > 0) = 0,99, P(d > 0,05) = 0,96, interval +5 až +35: vychází lépe. 2 z 10 vs 2 z 10 dá P(d > 0) = 0,50: zatím nevíme.

*Poctivý závěr pro UI:* na lucidní noc jako jediný výstup N-of-1 pozná jen velké rozdíly, a i ty často až po 30–45 nocích na variantu. Proto:
- **Pomocné výstupy s větší silou** (vždy vedle hlavního, nikdy místo něj): vybavené sny za noc (model Gamma-Poisson, prior Gamma(2, 1)), „záblesk lucidity“ (lucidita ≥ 2 z 10, častější událost, prior Beta(1, 2)), všimnutí si Stopy ve snu, návrat do spánku do 10 min. Častější událost znamená víc informace z každé noci, pravidla verdiktu ale zůstávají stejně přísná.
- **Mikrorandomizace** tam, kde je hodně rozhodnutí: formy připomínek (E6) mají desítky rozhodnutí týdně a blízký výstup (test do 2 h), takže výsledek přijde do 2–3 týdnů. Přidělování Thompsonovým výběrem s podlahou 20 % pro každou formu, aby se nepřestala zkoušet.
- **Rozhodnutí při shodě:** když data nerozhodnou, rozhoduje radost a dopad na spánek. To je platný výsledek, ne selhání.

*Randomizace a návrh.*

```
pridel(noc, experiment):
  pokud noc nezpůsobilá (šablona, Štít, brána WBTB): žádné přidělení
  vrstva = víkend ? "vikend" : "vsedni"           // stratifikace: víkendy spíš delší spánek
  blok = experiment.bloky[vrstva].aktualni
  pokud blok prázdný:
     blok = zamichej(varianty × opakovani, seed = hash(experimentId, vrstva, cisloBloku))
     // E1, E2, E5, E7: blok 2 nocí (AB nebo BA); E3: blok 4 nocí (klíč, klíč, cizí, ticho)
  varianta = blok.pop()
  uloz NightAssignment(skryto = experiment.slepy)
  vrať varianta
```

*Přenos mezi nocemi (carryover).*
- **Spánek:** WBTB nikdy dvě noci po sobě. Noc po WBTB nese příznak a v citlivostní analýze se vynechá. Experimenty o WBTB porovnávají jen WBTB noci mezi sebou.
- **Učení:** techniky se zlepšují praxí, takže efekt není vratný. Bloky po 2 nocích zajistí, že obě varianty pokrývají stejné období. Kontrola trendu: srovnání první a druhé poloviny. Když se směr otočí, štítek „Výsledek se mění v čase“.
- **Asociace u Zvukového klíče:** trénink probíhá každou noc stejně, kontrolní noci tedy měří efekt samotného zvuku ve spánku nad tréninkem (stejná logika jako Konkoly 2024).
- **Denní spouštěče (E4):** přenos mezi dny je pravděpodobný, proto týdenní bloky a první den bloku se nepočítá.

*Očekávání.*
- Každý večer jedna otázka: „Jak moc věříš, že dnes budeš lucidní? 0–10.“ Když se průměr mezi variantami liší o ≥ 2 body, výsledek dostane štítek „Může jít o očekávání“.
- Slepé experimenty (E3, E6, E7): ranní tip „Myslíš, že dnes hrál tvůj klíč?“ Podíl správných tipů nad 70 % = zaslepení nefunguje.
- Varianty, které zaslepit nejde (E1, E2, E4, E5): výsledek vždy s poznámkou „Věděl jsi, co děláš. Část rozdílu může být víra.“
- Průběžné výsledky se nezobrazují mezi kontrolními body. Brání to motivačnímu driftu i honbě za „vítězem“.

*Dodržení.* Noc se počítá, když varianta proběhla (audio dokončeno ≥ 80 % nebo potvrzení). Vedle toho pohled „včetně vynechaných“ (záměr léčit). Když vypadne víc než 30 % přidělených nocí: „Hodně vynechaných nocí. Výsledek bude slabší.“

**Obrazovky a stavy.**
- *Prázdný:* „Laboratoř je prázdná. Vyber otázku, kterou chceš na sobě ověřit.“ Pod tím 3 šablony.
- *Průvodce:* Otázka → Varianty → Co budeme měřit → Jak dlouho (odhad týdnů podle způsobilých nocí) → Souhlas. Text délky: „I velký rozdíl, třeba 2 lucidní noci z 10 proti 1 z 12, poznáš do 40 nocí na variantu zhruba v polovině případů. Menší rozdíl na sobě nepoznáš. I to je výsledek.“
- *Běží:* orbita s body nocí (vyplněné = provedené, prázdné = vynechané), „12 / 20 nocí na variantu“, „Další výsledek po 20. noci“.
- *Výsledek:* dvě křivky hustoty (oranžová a tlumená), pod nimi jedna věta podle tabulky pravidel a řádek četností: „Ze 100 nocí: Střídání smyslů asi 23, Záměr poznat sen asi 10.“ Odkaz „Jak to počítám“ (prior, ROPE, simulace).
- *Chyba:* „Tenhle experiment potřebuje noci s probuzením. Ty máš teď v klidovém týdnu. Pokračujeme po něm.“ a „Změnil jsi techniku uprostřed noci. Tuhle noc nepočítám.“

**Datový model.**

```
Experiment {
  id, templateId, question, arms: [ArmId], blinded: bool, stratifyWeekend: bool,
  blockSize, prior: {alpha0, beta0}, rope: 0.05, primaryOutcome, secondaryOutcomes: [..],
  checkpoints: [10, 20, 30, 40], maxNightsPerArm: 40,
  startedAt, status: running | paused | finished | abandoned, seedBase
}
NightAssignment {
  experimentId, nightId, stratum, blockIndex, arm, hidden: bool, revealedAt?,
  eligible: bool, adhered: bool, adherenceSource: audio | manual,
  expectancy: 0..10, guessArm?: arm | unsure, carryoverFlag: bool
}
Outcome { nightId, ld: bool, ldCount, glimpse: bool, recallCount, signNoticed: bool?, returnLatencyBucket? }
CheckpointResult {
  experimentId, at, nPerArm, pAgtB, pAgtBplusRope, pEquivalent, d90: [lo, hi],
  rule: standard | strict,
  verdict: collecting | unknown | better | equivalent | undecided, flags: [expectancy, trend, blindingBroken, lowAdherence]
}
```

**Okrajové případy.** Nemoc, cesta, alkohol: noc se označí a volitelně vyřadí (rozhodnutí před odhalením). Uživatel chce nakouknout dřív: dovoleno jen se štítkem „Předčasný pohled, zvyšuje riziko omylu“. Dva experimenty najednou: jen pokud se varianty nepletou (E1 a E6 ano, E1 a E2 ne). Smazání nocí: experiment se přepočítá, smazání se loguje. Víc LD za noc: binární výstup 1, počet zvlášť.

**Metriky úspěchu.** Podíl spuštěných experimentů, které dojdou do 2. kontrolního bodu (cíl ≥ 40 %). Pochopení: 5 testerů vlastními slovy vysvětlí obrazovku výsledku (cíl 4 z 5 správně). Zaslepení: správné tipy blízko náhody. Spokojenost: „Dozvěděl ses o sobě něco?“ 0–10.

**Jak validovat.**
1. **Simulace v CI:** při nulovém rozdílu (12 vs 12 %) nesmí falešný verdikt kterýmkoli směrem napříč čtyřmi kontrolními body přesáhnout 15 % u běžného a 10 % u přísného pravidla. Při 20 vs 8 % musí správný verdikt do 40 nocí vyjít kolem 50 % (běžné pravidlo). Test hlídá, aby změna prahů nebo prioru potichu nezměnila chybovost.
2. **Jednotkové testy** posteriorů proti známým hodnotám Beta rozdělení.
3. **Test srozumitelnosti** se 5–8 lidmi: tři varianty výsledkové obrazovky (procenta, četnosti, křivky).

---

### TOP 5: Rekonstrukce noci podle REM oken

**Uživatelský příběh.** Ráno si pamatuju jen poslední sen. Chci, aby mě appka provedla nocí pozpátku po REM oknech, abych si vybavil víc, a aby každý sen dostal svůj čas. Chci, aby se tím moje REM okna zpřesňovala.

**Vstupní body.**
1. Po ranním zápisu v toku Jak ses vyspal: „Projít noc“.
2. Deník › den › Mapa noci.
3. Jedna připomínka denně nejvýš, když dorazí data: „Noc je nahraná. Chceš ji projít?“

**Obrazovky a stavy.**

*A. Mapa noci (běžný stav)*
- Svislá osa od ulehnutí po probuzení. REM okna jako oranžové oblouky, šířka podle nejistoty. Hypnogram jako tenká stopa (dvě stopy, když jsou dvě zařízení).
- Kartičky snů přichycené k času: „SEN 2 · 04:55 ± 20 MIN · NEJSPÍŠ OKNO 3 (72 %)“.
- Značky událostí: budík WBTB, ťuknutí, Zvukový klíč, „Probudilo mě to“.

*B. Krokování pozpátku (průvodce, max 3 min)*
- Start: „Začneme od konce. Poslední okno bylo 5:20–5:45.“
- Pro každé okno od posledního: „OKNO 4 · 05:20–05:45. Kde jsi byl?“ Pak „Kdo tam byl?“, „Co jsi dělal?“, „Jak ti bylo?“, „Jaké tam bylo světlo?“. Každá otázka má „Nic“ a „Přeskočit“.
- Odpovědi: „Jistě“ · „Možná“. Ke snu se uloží s touto jistotou.
- Mezi okny: „Co bylo těsně před tím?“
- Konec: „Hotovo. Dnes 3 sny, minulý týden v průměru 1,4.“

*C. Čas snu v zápisu*
- „Kdy ses z něj probudil?“ Čipy: „Teď ráno“ · „Při budíku“ · „V noci kolem…“ (kolečko po 15 min) · „Nevím“.
- Jistota: „Přesně“ · „Zhruba“ · „Nevím“ (5, 20, 60 min).
- Rychlá volba bez snu: „Probudil jsem se, ale nic si nepamatuju“ + čas, v ranním zápisu i v nočním režimu. Ukládá se jako záznam „bez snu“ (LR_BEZ_SNU) a je nutná pro kalibraci síly důkazu ze snů.
- Předvyplnění z událostí appky (budík WBTB, „Probudilo mě to“, otevření appky v noci). Jiná data telefonu se nečtou.

*D. Stavy*

| Stav | Text |
|---|---|
| Prázdný (bez Spánkových dat) | Bez Spánkových dat ukážu obecné cykly po 90 minutách. Je to šablona, ne tvoje noc. |
| První použití | Projdeme noc od konce. Ptám se jen obecně, abych ti nic nevnutil. |
| Data ještě nejsou | Čekám na data z Oury. Otevři aplikaci Oura, pak se noc nakreslí. |
| Zařízení si odporují | Oura a Garmin vidí noc jinak. Ukazuju obě stopy. |
| Žádný sen | Dnes nic. To je normální, i nic je záznam. Zítra večer si řekni, že si sen zapamatuješ. |
| Chyba dat | Noc z Oury je kratší než 3 hodiny. Okna z ní nekreslím. |

**Datový model.**

```
DreamEntry (rozšíření) {
  id, nightId, order, wokeAt?, wokeAtSource: user | wbtbAlarm | tapEvent | tlrWokeMe | appOpen,
  timeConfidence: exact | rough | unknown, sigmaMin,
  recallMode: freeLog | guidedWindow, windowId?, items: [{prompt, text, certainty: sure | maybe}],
  falseAwakening: bool, recognisedFalseAwakening: bool?,
  lucidity: 0..10, control: 0..10, plannedActionDone: bool?, heardCue?: yes | no | unsure
}
NightMap {
  nightId, windows: [{id, start, end, pRemPeak, band80: [lo, hi], source}],
  assignments: [{dreamId, windowId?, prob, method: timeOnly | timeAndProfile}],
  guidedSession: { startedAt, finishedAt, windowsVisited, itemsAdded, skipped }
}
```

**Algoritmus.**

```
okna noci:
  s hypnogramem: souvislé úseky REM ≥ 5 min, úseky blíž než 10 min sloučit
  bez hypnogramu: okna z REM profilu (p_rem ≥ 0.35), štítek "odhad"
  bez profilu: šablona cyklů po 90 min, štítek "šablona"

přiřazení snu k oknu:
  pro okno w: l(w) = N(wokeAt; konec(w), sigma)        // sen se vybaví z REM těsně před probuzením
  prior(w) = délka(w) / Σ délek                         // delší ranní okna častěji
  prob(w) = l(w) * prior(w) / Σ_v l(v) * prior(v)
  pokud max prob < 0.5: "nejisté přiřazení", bez okna
  probuzení bez REM okna blízko (zařízení říká lehký spánek): přiřadit "mimo REM", i to je informace

zpětná vazba do REM profilu:
  každý sen s časem → důkaz LR_SEN = 1.9 kolem wokeAt (viz společný model)
  snům s certainty "maybe" poloviční váha

průvodce pozpátku:
  okna seřadit od posledního; max 4 okna; max 5 obecných otázek na okno
  časový limit 3 min, pak "Chceš pokračovat?"
  zákaz obsahových otázek: nikdy nenabízet motivy ze Stop snů ani z minulých snů
```

**Okrajové případy.**
- Falešné probuzení (sen o probuzení): čas probuzení je nejistý, výchozí jistota „Nevím“.
- Několik snů z jednoho probuzení: pořadí uvnitř okna, všem stejný čas.
- Sen z WBTB probuzení, zařízení ukazuje bdění: přiřadit k oknu před budíkem, zařízení často značí probuzení posunutě.
- Zdřímnutí: vlastní malá mapa, do nočního profilu nepatří.
- Uživatel zapisuje až odpoledne: průvodce nenabízet (vzpomínky po hodinách slábnou a roste riziko domýšlení), jen přiřazení času.

**Metriky úspěchu.**
- Vybavené sny za ráno: nárůst proti vlastnímu výchozímu týdnu.
- Podíl snů s časem: cíl ≥ 60 %.
- Doba průvodce: medián ≤ 3 min. Podíl přeskočení.
- Kalibrace REM profilu: chyba předpovědi času REM oken klesá s počtem přiřazených snů.
- Radost: „Bavilo tě projít noc?“ 0–10.

**Jak validovat.**
1. **Mikrorandomizace rán:** ráno se losuje „nabídnout průvodce“ vs „běžný zápis“. Výstup: počet vybavených snů (Gamma-Poisson). Počet položek se štítkem „Možná“ jako ukazatel rizika domýšlení.
2. **Kvalita přiřazení:** u testerů s 30s hypnogramem srovnat přiřazení z času probuzení s okny ze zařízení (podíl snů s prob ≥ 0,5).
3. **Kvalitativně:** 5 rozhovorů o tom, jestli otázky působí návodně.

---

## Co tyhle funkce nesmí slibovat (pravidla textů)

- Nikdy „lucidní sen na povel“, „dnes v noci určitě“ ani procenta ze studií bez kontextu. Správně: „Ve studiích vycházela nejlepší kombinace zhruba na 1 noc z 5–6, u začátečníků spíš za týdny.“
- REM okna jsou vždy „odhad“. Nikdy „Oura ví, kdy sníš“.
- Zvukový klíč: „slibné, doma zatím nepotvrzené“. Kontrolní noci jsou součást poctivosti, ne skrytý trik.
- Žádné série, žádné body za probuzení, žádná doporučení léků a doplňků.
- Jóga snu: „jako sen“, nikdy „nic není skutečné“. Zdroje uvést, nevydávat za předání tradice.

## Zdroje

- Aspy D. a kol. 2017, Dreaming (NALDIS), doi:10.1037/drm0000059
- Aspy D. 2020, Front Psychol (ILDIS), PMC7379166
- Aviram L., Soffer-Dudek N. 2018, Front Psychol, PMC5875414
- Baird B. a kol. 2019, Sci Rep, PMC6490164
- Barrett D. 1993, Dreaming 3(2):115–122 (The committee of sleep)
- Blagrove M. a kol. 2011, PLoS One (PMID 22046336) a Conscious Cogn (PMID 20739193), efekt zpoždění snů
- Carr M. a kol. 2023, Psychology of Consciousness 10(4):413–430
- Dolamic L., Savoy J. 2009, Information Processing & Management (český stemming)
- Ebrahim I. O. a kol. 2013, Alcohol Clin Exp Res (alkohol a spánek)
- Einstein G. O., McDaniel M. A. 1990, J Exp Psychol Learn Mem Cogn; McDaniel M. A., Einstein G. O. 2000, Appl Cogn Psychol
- Erlacher D., Stumbrys T. 2020, Front Psychol; Erlacher D. a kol. 2022, PMC9149976
- Genc 2025, magisterská práce UNIGE (TLR přes Oniri)
- Gerhardt, Baird 2024, PMC11120098
- Gigerenzer G., Hoffrage U. 1995, Psychol Rev (přirozené četnosti)
- Gollwitzer P. M., Sheeran P. 2006, Adv Exp Soc Psychol; Sheeran P., Listrom O., Gollwitzer P. M. 2024, Eur Rev Soc Psychol
- Gott J. a kol. 2020, PubMed 32768920
- Haar Horowitz A. a kol. 2020, Conscious Cogn (Dormio); Haar Horowitz A. a kol. 2023, Sci Rep, PMID 37188795
- Holecek A. 2016, Dream Yoga; Norbu N. 1992, Dream Yoga and the Practice of Natural Light; Wangyal T. 1998, The Tibetan Yogas of Dream and Sleep
- Klasnja P. a kol. 2015, Health Psychol, PMID 26651463 (mikrorandomizované studie)
- Konkoly K. a kol. 2021, Curr Biol, PMC8162929; Konkoly K. a kol. 2024, Conscious Cogn, PMC11542932
- Koulack D., Goodenough D. R. 1976, Psychol Bull, doi:10.1037/0033-2909.83.5.975
- Kravitz R. L., Duan N. (eds.) 2014, Design and Implementation of N-of-1 Trials, AHRQ
- Kruschke J. K. 2018, Adv Methods Pract Psychol Sci (ROPE)
- LaBerge S., Rheingold H. 1990, Exploring the World of Lucid Dreaming
- LaBerge S., LaMarca K., Baird B. 2018, PLoS One
- Lally P. a kol. 2010, Eur J Soc Psychol, doi:10.1002/ejsp.674
- Lindahl J. R. a kol. 2017, PLoS One, PMC5443484
- Mallett R. a kol. 2022, PMC10104404
- Michal M. a kol. 2010, Psychother Psychosom Med Psychol 60(5):175–179 (CDS-2)
- Nielsen T. A. 2000, Behav Brain Sci 23:851–866 (vybavení z REM a NREM)
- Nielsen T. A. a kol. 2004, J Sleep Res (efekt zpoždění snů)
- Oudiette D., Paller K. A. 2013, Trends Cogn Sci; Rudoy J. D. a kol. 2009, Science (cílená reaktivace paměti)
- Peters a kol. 2026, bioRxiv (preprint, falešná probuzení a lucidita)
- Picard-Deland C. a kol. 2026, bioRxiv v2 (MC v2, preprint)
- Robbins R. a kol. 2024, Sensors 24(20):6532, PMC11511193
- Schork N. J. 2015, Nature (one-person trials)
- Schredl M. 2003 (vybavování snů); Schredl M., Hofmann F. 2003, Conscious Cogn (kontinuita); Schredl 2025, IJoDR
- Schyvens A.-M. a kol. 2025, Sleep Advances, PMC12038347
- Sharpless B. A., Barber J. P. 2011, Sleep Med Rev (prevalence spánkové paralýzy)
- Soffer-Dudek N. 2020, PMC6993576; Vallat R., Ruby P. 2019, PMC6874013
- Tan S., Fan J. 2023, J Sleep Res, doi:10.1111/jsr.13786
- Voss U. a kol. 2013, Conscious Cogn (LuCiD), doi:10.1016/j.concog.2012.11.001
- Wood W., Rünger D. 2016, Annu Rev Psychol (návyky)
- Yu a kol. 2025, PMC11806271 (zpětná vazba jako herní prvek)
- Technické: Oura API v2, specifikace OpenAPI 1.42 a stránka Authentication (cloud.ouraring.com, staženo 23. 10. 2026); Android Developers: Health Connect Read data, Android 14 behavior changes, AlarmClock; Garmin Developers: Connect Developer Program Overview, Connect IQ API Toybox.Background, Toybox.Sensor, Toybox.Attention; DC Rainmaker 21. 10. 2026 (nové úrovně Garmin API); Google Android Developers Blog 2023 a Notebookcheck 2025 (Oura a Garmin v Health Connect); Linka první psychické pomoci 116 123 (MV ČR).
````

### presnost_nositelne_elektroniky.md

````markdown
# Přesnost nositelné elektroniky pro REM: Oura a Garmin vs. polysomnografie

Stav k 23. 10. 2026. Podklad pro záložku Spánek a funkci „odhad výskytu REM“ v appce Za hranice reality.

**Metodika.** Plné texty jsem četl z Europe PMC (PMC je za captchou), preprint Topalidis z Research Square, firemní stránky Oura a Garmin přímo. ScienceDirect byl blokovaný, takže u Svensson 2024 mám jen abstrakt. U Ong 2024 také jen abstrakt. Hodnoty označené **odv.** jsem dopočítal z publikovaných matic chyb a z rozložení fází v dané studii. Metodu jsem ověřil na Robbins 2024: odvozená PPV 0,788 proti publikované 0,791. **Inference** značí můj úsudek, ne údaj ze studie.

**Pojmy.**
- **Senzitivita REM**: podíl epoch, které PSG označí jako REM a zařízení také.
- **Specificita REM**: podíl epoch, které nejsou REM a zařízení je jako REM neoznačí.
- **PPV (přesnost)**: podíl „REM“ označení zařízení, která jsou podle PSG opravdu REM. Pro appku je to nejdůležitější číslo.
- **κ 4f / 2f**: Cohenovo kappa pro čtyři fáze (bdění, lehký, hluboký, REM) a pro spánek/bdění.
- **LoA**: 95% meze shody Bland–Altman pro minuty REM za noc.
- **Latence REM**: čas od usnutí do prvního REM.

---

## 0. Hlavní zjištění

1. **Oura Gen3 (algoritmus OSSA 2.0, nasazený v roce 2023).**
   - REM senzitivita 0,55–0,76, specificita přibližně 0,82–0,95, PPV 0,36–0,79, κ 4f 0,35–0,65.
   - Nejlepší čísla pocházejí ze studie, kterou Oura financovala: Robbins 2024 (senzitivita 0,76, PPV 0,79, κ 0,65).
   - Klinický a nezávislý vzorek dává méně. Lee 2023: κ 0,35. Herberger 2025: senzitivita 0,55, PPV odv. 0,36.
2. **Oura Ring 4 (2024) a Ring 5 (2026).**
   - Nenašel jsem žádnou recenzovanou PSG validaci určování fází.
   - Oura v srpnu 2026 sama uvádí, že nejnovější algoritmus fází je z roku 2023, a cituje jen studie Gen2 a Gen3.
   - Gen4 má lepší vstupní signál: HRV vs EKG CCC 0,99 (Dial 2025).
   - **Inference:** horší určování fází než u Gen3 nečekám, ale ověřené to není.
3. **Garmin.**
   - V nezávislých studiích má REM senzitivitu 0,33–0,54:
     - Vivosmart 4: 0,33–0,34
     - Vivosmart 3: 0,50
     - Fenix 5S: 0,54
     - Forerunner 245: 0,50
     - Venu 3 / Vivoactive 5–6: 0,49
   - PPV 0,39–0,51, κ 4f 0,20–0,41.
   - Výrobce uvádí 0,70 a κ 0,54. Jde o Vivosmart 3 v roce 2019 a o křížovou validaci na vlastních vývojových datech.
   - Pro Index Sleep Monitor jsem validaci nenašel.
4. **Prakticky:**
   - Když Garmin hlásí REM, je to REM asi ve **40–50 %** případů (odv.).
   - U Oury Gen3 je to **50–80 %**.
   - REM do „lehkého spánku“ chybně řadí obě zařízení. Garmin navíc často označí jako REM bdění a lehký spánek.
5. **REM minuty za jednu noc jsou nespolehlivé.**
   - 95% LoA: Oura zhruba ±60–100 min, Garmin ±65–150 min.
   - ICC/CCC pro REM za noc: 0,06–0,37.
   - Smysl mají jen průměry za týden a delší trendy (inference).
6. **Časová shoda.**
   - Žádná studie nehodnotí začátek a konec jednotlivých REM období.
   - Nepřímé údaje:
     - První REM zařízení často přehlédnou. Latence REM u Garminu +16 až +30 min, u Oury Gen3 ≈ −9,5 min (Lee 2023).
     - Posun celého hypnogramu o ±20 min shodu nezlepšil (Mouritzen 2020). Chyby jsou tedy lokální, hlavně na okrajích period, ne konstantní posun.
     - Hypnogram Oury v appce i v API má rozlišení **5 min**.
7. **Algoritmy počítají až po noci.**
   - Oura normalizuje znaky přes celou noc, používá klouzavá okna „minulost i budoucnost“ a znaky času v noci (Altini 2021).
   - Garmin počítá část znaků přes celou noc v cloudu (Garmin 2019).
   - Důsledek: REM není k dispozici v reálném čase a výstup už v sobě má prior „REM přibývá k ránu“.
8. **Komunikace v appce.** Mluvit o **pravděpodobném REM okně**, kategoriích a rozsazích. Ne o minutách a přesných časech.
9. **Shoda Oury a Garminu** zvyšuje důvěru méně, než ukazuje prosté násobení pravděpodobností. Obě zařízení odhadují z tepu, HRV, pohybu a času v noci, takže jejich chyby jsou korelované. Navrhuji model s podmíněnou závislostí chyb (výchozí ρ = 0,3) a skrytý Markovův model po 5min epochách.
10. **Shoda dvou zařízení není důkaz přesnosti.** I dvě zařízení přesná podle literatury by se při nezávislých chybách shodovala na REM jen s κ ≈ 0,2 (výpočet v 3.5).

---

## 1. Souhrnné tabulky

### 1.1 Oura podle generace

| Studie | Zařízení / algoritmus | Vzorek, prostředí, reference | REM sens. | REM spec. | REM PPV | REM F1 | κ 4f / 2f | REM min za noc: bias (LoA) | Latence REM | Financování / COI |
|---|---|---|---|---|---|---|---|---|---|---|
| de Zambotti 2019, *Behav Sleep Med* | Gen1 | n = 41, 17,2 ± 2,4 r., laboratoř, 1 noc, PSG | 0,61 („agreement“) | n/a | n/a | n/a | n/a | +17 min (nadhodnocení) | n/a | NIH (NIAAA, NCANDA). De Zambotti je od 2025 zaměstnanec Oury. |
| Chee 2021, *Nat Sci Sleep* | Gen2, fw 1.36.3 | n = 53 adolescentů 15–19 r., laboratoř, více nocí (6,5 / 8 / 9 h v posteli), PSG | 0,51–0,53 | n/a | n/a | n/a | 0,44–0,45 / n/a | −12,8 až −19,5 min | n/a | Grant NMRC. Prsteny dodala Oura pro sběr dat pro vlastní účely firmy. |
| Altini & Kinnunen 2021, *Sensors* | Gen2M (výzkumná verze), model akcelerometr + teplota + HRV + cirkadiánní znaky (Oura ho uvádí jako základ současného algoritmu) | 106 osob, 440 nocí, 3 kontinenty, PSG; **křížová validace vývojových dat** | 0,78 | 0,94 | n/a | 0,78 (celkové F1 4f) | n/a (4f přesnost 79 %) | ≈ +2 min (LoA ≈ ±44 min při 90 min REM) | n/a | Kinnunen zaměstnanec Oury, Altini poradce Oury |
| Ghorbani 2022, *Nat Sci Sleep* | Hardware Gen2, nový algoritmus („Gen3“) | n = 58, 23–69 r., domácí PSG, 3 noci | n/a (jen v příloze) | n/a | n/a | n/a | κ pro REM 0,67–0,69 (starý algoritmus 0,49); 4f přesnost 76–78 % | +0,8 až +11,7 min (SD 23–32) | n/a | Chee a Ong mají patent na Z3Score; prohlášení zní „report other conflicts“ bez upřesnění; Oura studii propaguje jako svou validaci |
| Miller 2022, *Sensors* | Gen2 | n = 53, 25 r., laboratoř, 1 noc, 9 h v posteli, PSG | 0,52 | ≈ 0,92 (odv.) | ≈ 0,61 (odv.) | ≈ 0,56 (odv.) | 0,43 / 0,51 | −20,7 ± 35,3 min | n/a | Laboratoř dostává podporu od WHOOP |
| Chinoy 2022, *Nat Sci Sleep* | Gen2 | n = 21, doma, 7 nocí, reference EEG čelenka Dreem 2 | 0,39–0,40 | 0,92 | 0,68 | 0,50 (odv.) | n/a (REM PABAK 0,51) | 77,5 vs 132,7 min (podle Dreemu) | n/a | Office of Naval Research; bez COI |
| Kainec 2024, *Sensors* | Gen2 | n = 53 mladých dospělých, laboratoř, 1 noc, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | +5,8 min (SD 37,7); ICC 0,34 | n/a | Grant UMass; bez COI |
| **Robbins 2024**, *Sensors* | **Gen3, OSSA 2.0** | n = 35, 20–50 r., zdraví, laboratoř, 1 noc, PSG | **0,76** | ≈ 0,95 (odv.) | **0,79** | 0,77 | **0,65 / 0,60**; 4f shoda 76,3 % | −3 min; ICC 0,27 | n/a | **Financovala Oura Ring Inc.**; Robbins je v poradním sboru Oury |
| Lee 2023, *JMIR mHealth uHealth* | Oura Ring 3; verze algoritmu neuvedena (data před 7/2023, pravděpodobně před OSSA 2.0) | n = 53 (z 75), korejští pacienti s plánovanou PSG a klientela kliniky, laboratoř | 0,71 | 0,87 | ≈ 0,52 (odv. z F1) | 0,60 | **0,35** / n/a; 4f přesnost 0,54 | n/a | **≈ −9,5 min** (odečteno z obr. 5) | Autoři z firmy Asleep (konkurenční SleepRoutine) mají akcie |
| Svensson 2024, *Sleep Med* | Gen3, OSSA 2.0 | n = 96 Japonců, 20–70 r., ambulantní PSG v hotelu, až 3 noci, 421 045 epoch | n/a (v abstraktu jen „accuracy“ REM 90,6 %, binární) | n/a | n/a | n/a | n/a / PABAK 0,83–0,84 | −4,1 až −5,6 min | n/a | **Částečně financovala Oura** (blog Oura); Herberger 2025 uvádí COI |
| Ong 2024, *Sleep Health* | Gen3 | n = 60, 18–70 r., laboratoř, PSG, konsenzus 3 hodnotitelů | n/a | n/a | n/a | n/a | 0,55–0,70 / 0,64 | n/a | n/a | Neověřeno (jen abstrakt) |
| **Herberger 2025**, *Sci Rep* | Gen3 (data 8–11/2022, před OSSA 2.0); **5min epochy z API** | n = 31 pacientů spánkové laboratoře Charité, 54 r., BMI 33 | **0,55** (0,45–0,65) | ≈ 0,82 (odv.) | ≈ **0,36** (odv.) | ≈ 0,44 (odv.) | n/a / 0,43; 4f přesnost 53,2 % | **+31,6 ± 44,0 min** | n/a | Bez COI |
| Searles 2026, *Sleep Adv* | Gen3, app 2.8.41 | 12 nocí mladí (19–24 r.) + 15 nocí starší (56–80 r.), laboratoř, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | mladí −1,3 min (LoA −77,5 až +74,9); starší +22,7 min (LoA −77,0 až +122,3); CCC 0,12–0,16 | n/a | NIH; bez COI |
| Topalidis 2025/2026, preprint | Oura Ring 3, app 3.1.1, data 30 s přes Apple Health | n = 18 × 5 nocí, doma, ambulantní PSG, záměrně narušené, zkrácené a prodloužené noci | 0,73 (0,69–0,76) | n/a | n/a | n/a | 0,59 / n/a; 4f přesnost 72,8 % | 84 vs 88 min; proporcionální bias (+16 min při 40 min REM, −21 min při 130 min REM) | n/a | **COI:** autoři z NUKKUAA (konkurenční sleep²). Zarovnání metodou „best-world fit“ přes křížovou korelaci, tedy optimistické |
| Gen4 / Ring 5 | | | **Žádná PSG validace určování fází nenalezena** (Europe PMC, web, 10/2026) | | | | | | | |
| Dial 2025, *Physiol Rep* (jen vstupní signál) | Gen3 vs Gen4 | n = 13, 536 nocí, reference EKG | HRV CCC: Gen4 0,99 (MAPE 6,0 %), Gen3 0,97 (7,2 %) | | | | | | | AFRL; bez COI |

### 1.2 Garmin podle modelu

| Studie | Model / firmware | Vzorek, prostředí, reference | REM sens. | REM spec. | REM PPV | REM F1 | κ 4f / 2f | REM min za noc: bias (LoA) | Latence REM | Financování / COI |
|---|---|---|---|---|---|---|---|---|---|---|
| Garmin / KUMC 2019 (Burgett a kol., poster AAN; firemní blog) | Vivosmart 3, „Advanced Sleep Monitoring“ | n = 55 (14 s poruchou spánku nebo léky), doma, Sleep Profiler (3kanálové EEG); **5násobná křížová validace na vývojových datech** | 0,70 | ≈ 0,89 (odv.) | ≈ 0,59 (odv.) | ≈ 0,64 (odv.) | 0,54 ± 0,12 (4f) | Garmin 21,6 % vs EEG 18,3 % REM | n/a | **Výrobce** |
| Chinoy 2021, *Sleep* | Fenix 5S | 34 mladých dospělých (28 r.) × 3 noci včetně narušené, laboratoř, PSG; analyzováno 29–30 nocí | 0,54 | 0,84 | 0,51 | 0,53 (odv.) | n/a (REM PABAK 0,53) | +8,6 min (LoA −74,9 až +92,1) | **+29,8 min** (LoA −83,3 až +142,9) | Office of Naval Research; bez COI |
| Chinoy 2021 | Vivosmart 3 | totéž, 43–44 nocí | 0,50 | 0,82 | 0,46 | 0,48 (odv.) | n/a (PABAK 0,48) | +8,4 min (LoA −75,9 až +92,6) | **+24,5 min** (LoA −94,8 až +143,7) | totéž |
| Mouritzen 2020, *PLoS One* | Vivosmart 4 | n = 18, 56 ± 12 r., 72 % žen, domácí PSG (typ II) | 0,34 ± 0,26 | 0,88 ± 0,08 | 0,42 (z matice) | 0,37 | **0,20 / 0,33** | −22,1 ± 54,7 min; ICC 0,14 | **+16,1 ± 40,3 min** (n = 14; u 3 osob Garmin REM vůbec nenašel) | Hodinky zapůjčil Garmin |
| Kainec 2024, *Sensors* | Vivosmart 4 | n = 53, laboratoř, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | **+39,2 min (SD 82,3)**; ICC 0,06 | n/a | Bez COI |
| Schyvens 2025, *Sleep Adv* | Vivosmart 4 | n = 25 (z 62; celý vzorek 84 % mužů, 46 r., i podezření na apnoe), laboratoř, PSG | **0,33** | ≈ 0,89 (odv.) | ≈ **0,39** (odv.) | ≈ 0,36 (odv.) | **0,21** (typ κ nejasný) | −14,4 min (LoA **−163,6 až +134,8**) | n/a | VLAIO; bez COI |
| Miller 2022, *Sensors* | Forerunner 245 Music | n = 53, 25 r., laboratoř, PSG | 0,50 (21 % lehkého a 23 % bdění označí jako REM) | ≈ 0,81 (odv.) | ≈ 0,40 (odv.) | ≈ 0,44 (odv.) | 0,25 / 0,35 | +20,2 ± 64,1 min | n/a | Laboratoř dostává podporu od WHOOP |
| Budig 2022, *Sensors* | Forerunner 945, fw 5.50 | n = 49 pacientů s podezřením na poruchu spánku, PSG; jen souhrnné hodnoty | n/a | n/a | n/a | n/a | n/a | REM MAE 53,1 min, MAPE 97,5 % | n/a | Bez COI |
| Topalidis 2025/2026, preprint | Vivoactive 5/6 a Venu 3, fw 5.10.0.22 | n = 18 × 5 nocí doma, ambulantní PSG | **0,49** (0,45–0,53) | n/a | n/a (PPV pro fáze 0,55–0,64) | n/a | **0,41** / n/a; 4f přesnost 63 % | 71 vs 89 min, při průměru ≈ −19 min, LoA ±64,9 | n/a | COI NUKKUAA; optimistické zarovnání |
| Dial 2025 (jen vstupní signál) | Fenix 6 | n = 13, 536 nocí, EKG | HRV CCC 0,87, MAPE 10,5 % (Oura Gen4 0,99) | | | | | | | AFRL; bez COI |
| Saliba 2026, *Front Psychiatry* | Vivoactive 4, Venu 2 Plus, Venu 3 | 130 osob, jen proti spánkovému deníku | Fáze nehodnoceny | | | | | | | |
| Index Sleep Monitor (2025) | pásek na paži | | **Validace nenalezena** | | | | | | | |
| NCT06174558 | Vivosmart 5 vs PSG | registrováno 12/2023, stav „unknown“ | Výsledky nejsou | | | | | | | |

### 1.3 Meta-analýzy a přehledy

| Práce | Zahrnuto | Klíčové číslo pro REM | Pozn. |
|---|---|---|---|
| Khan 2025, *OTO Open* | 6 studií Oury, n = 388 | REM: průměrný rozdíl −3,9 min (95% CI −17,2 až +9,5) | Jen průměrný rozdíl skupin, ne individuální chyba |
| Jin 2026, *J Transl Med* | 28 článků, 11 prstenů | Sloučená binární přesnost REM 0,74 (0,68–0,79); senzitivita REM v jednotlivých studiích 0,14–0,89, specificita 0,87–0,94; κ 0,06–0,70 | Binární přesnost je nafouknutá převahou ne-REM epoch |
| Schyvens 2024, *JMIR mHealth* | 8 studií: Fitbit Charge 4, Garmin Vivosmart 4, WHOOP | Garmin VS4 „mírná“ přesnost fází; WHOOP největší odchylka REM (+21 min) | |
| Lee YJ 2025, *J Clin Sleep Med* | 24 studií náramků, 798 osob | Fáze nemetaanalyzovány; rozdíly v celkové době spánku a WASO | |
| Agostinho 2026, *Behav Sleep Med* | 16 studií, 10 v meta-analýze | Žádné zařízení konzistentně nejlepší; nejblíže PSG Oura Gen3 pro latenci a efektivitu spánku | |
| de Zambotti 2025, *Sleep Adv* | komentář | Validace zaostávají za verzemi; srovnávat ve 30s epochách; 5min epochy z API (Herberger) zhoršují metriky | Všichni autoři kromě jednoho jsou zaměstnanci Oury |
| Chee 2025 (World Sleep Society), *Sleep Med* | doporučení | Oddělovat standardizovaná „základní měřítka spánku“ od proprietárních explorativních metrik | **Inference:** REM okna patří do méně spolehlivé vrstvy |

### 1.4 Srovnání a hodnoty, které appka použije

| Metrika (REM) | Oura Gen3 / Gen4 (OSSA 2.0) | Garmin výchozí (Fenix 5S, Vivosmart 3, Forerunner 245, Venu 3, Vivoactive 5/6) | Garmin Vivosmart 4 (pesimistická varianta) | Kontext |
|---|---|---|---|---|
| Senzitivita | 0,55–0,76 (střed **0,70**) | 0,49–0,54 (střed **0,50**); výrobce 0,70 | 0,33–0,34 | Apple Watch (white paper 2025) 0,82; EEG Dreem 3 κ 4f 0,76–0,86 |
| Falešně pozitivní (1 − spec.) | 0,05–0,18 (střed **0,10**) | 0,16–0,19 (střed **0,15**) | 0,11–0,12 | |
| PPV | 0,36–0,79 | 0,40–0,51 | 0,39–0,42 | |
| κ 4f | 0,35–0,65 | 0,25–0,41 (výrobce 0,54) | 0,20–0,21 | Shoda dvou lidských hodnotitelů PSG je asi 82–83 % epoch (cit. v Altini 2021) |
| REM min za noc, bias | −5 až +33 min | −19 až +20 min | −22 až +39 min | |
| REM min za noc, 95% LoA | asi ±75–100 min (Searles, Herberger, Kainec) | asi ±65–85 min (Chinoy, Topalidis) | až ±150 min | |
| Latence REM (první REM) | ≈ −9,5 min (Lee 2023) | +25 až +30 min (Chinoy) | +16 min (Mouritzen) | Zařízení často přehlédnou krátký první REM |
| Typický vzorec chyby | REM → lehký (15–37 % REM epoch) | REM → lehký (37–42 %); lehký a bdění → REM (13–23 %) | REM → lehký 42–54 %, REM → hluboký 23 % | |
| Rozlišení dat | app a API 5 min (`sleep_phase_5_min`); export do Apple Health 30 s | úseky s časem zaokrouhleným na minuty (Topalidis přes Apple Health) | | |

### 1.5 Časová shoda: co víme a co ne

| Otázka | Co je doloženo | Zdroj |
|---|---|---|
| Přesnost začátku a konce jednotlivých REM období | **Žádná studie to pro Ouru ani Garmin nehodnotí** | rešerše Europe PMC 2018–2026 (negativní) |
| Začátek prvního REM (latence) | Garmin nadhodnocuje o 16–30 min (první REM přehlédne nebo posune). Oura Gen3: bias ≈ −9,5 min. U dalších zařízení se biasy pohybují od −50 do +65 min. | Mouritzen 2020; Chinoy 2021 (tab. S6); Lee 2023 (obr. 5) |
| Je chyba konstantní posun? | Ne. Posun Garminu o ±40 epoch (±20 min) vůči PSG shodu prakticky nezlepšil. | Mouritzen 2020 |
| Malé posuny hodin zařízení | Existují. Topalidis zarovnával křížovou korelací v 3min okně a zarovnání ponechal, jen když zlepšilo shodu. Garmin si v roce 2019 zarovnával data podle tepu s přesností pod 1 s. | Topalidis 2025; Garmin 2019 |
| Opakovatelnost zařízení | Dvoje Vivosmart 4 na téže osobě (23 nocí) se na REM shodly jen v 53 % (pozitivní shoda; κ 4f mezi nimi 0,68). | Mouritzen 2020 (odv. z tab. 2) |
| Vliv delších epoch | Hodnocení po 5 min (data z API Oury) snižuje metriky a vytváří umělé přechody. | Herberger 2025; de Zambotti 2025 |
| Počítá se v reálném čase? | Ne. Oura normalizuje přes celou noc a používá okna s budoucností a znaky času v noci. Garmin počítá 7 znaků přes celou noc v cloudu. | Altini 2021; Garmin 2019 |
| Shoda nočních součtů | Špatná: ICC/CCC pro REM 0,06–0,37 | Robbins 2024; Kainec 2024; Searles 2026; Mouritzen 2020 |

**Inference pro návrh:** hranice REM okna nejsou jisté zhruba o jednu až dvě 5min epochy (±5–10 min). První cyklus je nejméně spolehlivý. Když zařízení v první polovině noci REM „nevidí“, je to slabá informace.

---

## 2. Jak v appce mluvit o „odhadu výskytu REM“

### 2.1 Zásady

1. **Je to odhad z těla, ne měření mozku.** Oura a Garmin odhadují REM z tepu, variability tepu, dýchání, pohybu a teploty. REM v definici PSG je stav mozku (EEG, EOG, EMG).
2. **Okno, ne bod.** Ukazuj „pravděpodobné REM okno“ s neostrými okraji, ne přesné časy začátku a konce.
3. **Kategorie, ne desetiny.** Pravděpodobnost zaokrouhli na desítky procent, v textu použij slovní kategorii a strop zobrazení **90 %**. Ani nejlepší studie nemá PPV nad 0,79.
4. **Trend, ne noc.** REM minuty za jednu noc mohou být o hodinu mimo. Srovnávej týdenní průměry, ne dvě noci.
5. **Přiznej shodu i neshodu zařízení**, ale nevydávej shodu za jistotu.
6. **Žádná diagnostika.** Nehodnoť „málo REM“ jako problém.

### 2.2 Slovník a formulace (tykání)

| Situace | Doporučený text | Pozn. |
|---|---|---|
| Název funkce | „Odhad REM“, „Pravděpodobné REM okno“, „REM mapa noci“ | Ne „REM fáze“ jako fakt |
| Kategorie p ≥ 0,7 | „pravděpodobně REM“ | |
| 0,4 ≤ p < 0,7 | „možná REM“ | |
| 0,2 ≤ p < 0,4 | „spíš ne“ | |
| p < 0,2 | nezobrazovat, nebo „málo pravděpodobné“ | |
| Hlavní věta po noci | „Tvoje spánková data naznačují pravděpodobné REM okno zhruba mezi 4:20 a 4:50. Okraje mohou být posunuté o 5–10 minut.“ | Časy zaokrouhlit na 5 min |
| Obě zařízení souhlasí | „Oura i Garmin se tu shodují. Oba ale měří tep a pohyb, ne mozek, takže je to dobrý odhad, ne jistota.“ | |
| Neshoda | „Tady se zařízení neshodují: Oura hlásí REM, Garmin lehký spánek. Odhad je proto nejistý.“ | Ukaž obě stopy |
| První hodina noci | „První REM bývá krátký a náramky ho často přehlédnou. Na začátku noci se na odhad moc nespoléhej.“ | Opora: latence REM u Garminu +16 až +30 min |
| REM minuty | „REM za noc: asi 1 h 30 min (odhad, může se lišit i o hodinu). Víc řekne týdenní průměr.“ | Zaokrouhlit na 10 min |
| Týdenní trend | „Tento týden v průměru asi 1 h 35 min REM, minulý asi 1 h 25 min. Rozdíl je menší, než kolik zařízení dokáže spolehlivě rozlišit.“ | Rozdíl pod ~30–40 min neinterpretovat (inference) |
| Sen v čase T | „Probudil ses ve 4:52. Podle odhadu jsi těsně předtím byl pravděpodobně v REM.“ | Formulovat jako pravděpodobnost |
| Vysvětlivka (info ikona) | „Odhad vzniká až po noci z dat Oury a Garminu. Ve studiích prsten zachytil zhruba polovinu až tři čtvrtiny REM ze spánkové laboratoře, hodinky Garmin nejvýš asi polovinu.“ | Jedna věta o zdroji: „podle studií 2020–2026“ |
| Po aktualizaci firmwaru | „Oura nebo Garmin změnily algoritmus. Pár nocí může být odhad méně srovnatelný se starými daty.“ | Logovat verze |

### 2.3 Co netvrdit

- „Oura/Garmin **měří** REM.“ Správně je „odhaduje“.
- „Byl jsi v REM **1 h 42 min**“ nebo „REM začal **ve 4:13**“. To je falešná přesnost, rozlišení dat je 5 min a chyba nočního součtu desítky minut.
- „Tvůj sen **byl** v REM“ nebo „lucidní sen se odehrál v REM“. Data to nedokážou, sny bývají i mimo REM.
- „**Detekujeme REM v reálném čase**“ nebo „podnět přijde přesně do REM“. Data přicházejí až po synchronizaci a algoritmy počítají přes celou noc.
- „Obě zařízení se shodla, **takže je to jisté**.“
- „Přesnost **79 %** / **95 %**.“ To jsou firemní čísla pro čtyři fáze nebo pro spánek/bdění, ne pro REM okna. V srpnu 2026 byla proti Ouře kvůli takovým tvrzením podána hromadná žaloba (zatím nerozhodnutá).
- „Málo REM = špatný spánek“, „REM pod normou“. Žádná diagnostika.
- „Dnes víc REM než včera“ při rozdílu pod zhruba hodinu.
- Hodnoty REM latence jako fakt.
- Srovnání přes výměnu zařízení nebo aktualizaci algoritmu bez upozornění.

### 2.4 Jak to ukázat (vizuální specifikace)

- **Pás pravděpodobnosti (REM mapa noci).**
  - Vodorovná osa od usnutí po probuzení, 5min sloupce.
  - Výška nebo krytí výplně = posteriorní p (0–0,9).
  - Den: akcent #FF5F1F na panelu #0C1222. Noc: jen #FF3B2F / #B3261E / #5A120D na černé.
- **Jádro a okraje.**
  - Úseky s p ≥ 0,5 orámovat tenkou linkou s rohovými značkami (styl Program 2026).
  - Navazující úseky s 0,3 ≤ p < 0,5 přerušovanou linkou („okraj“).
- **Stopy zařízení.**
  - Pod pásem dvě tenké stopy „OURA“ a „GARMIN“ (JetBrains Mono, verzálky): krátké čárky tam, kde dané zařízení hlásí REM.
  - Vpravo ukazatel shody: „●● SHODA“, „●○ JEN OURA“, „○● JEN GARMIN“.
- **Sny.** Svislá čárka v čase probuzení se snem z deníku. Popisek „před probuzením: pravděpodobně REM / možná REM“.
- **Popisek okna.** `PRAVDĚPODOBNÉ REM OKNO 04:20–04:50 · OKRAJE ±5 MIN`.
- **Legenda vždy viditelná:** „Odhad z tepu a pohybu, ne z mozku.“
- **Bez ostrých bloků.** Nekreslit klasický hypnogram s ostrými schody jako „pravdu“. Surový hypnogram zařízení schovat do detailu („Surová data Oura“).
- **Plánování (budoucí noci).** Osobní křivka P(REM | čas od usnutí) z posledních 14 nocí jako pás: medián a 25.–75. percentil. Text: „V 9 ze 14 nocí jsi měl pravděpodobné REM okno mezi 4:10 a 5:00.“

```
 23:30        01:00        02:30        04:00        05:30   06:40
   |            |            |            |            |        |
   .  ..        .:::.         ..:::::.       .:::::::::.   ..::.     <- pás p(REM)
                              [----]        [==========]             <- okraj / jádro
 OURA   |     |||        |||||          ||||||||||||    |||
 GARMIN       | |        ||   ||       |||  ||||||  |   ||  |
                                                   ▲ sen 05:12
 PRAVDĚPODOBNÉ REM OKNO 04:20–04:50 · OKRAJE ±5 MIN   ●● SHODA
 Odhad z tepu a pohybu, ne z mozku.
```

---

## 3. Jak vážit shodu Oury a Garminu

### 3.1 Data a předzpracování

1. **Společná mřížka 5 min** od usnutí do probuzení (hypnogram Oury je v 5min oknech).
2. Pro každé zařízení d a epochu t spočítej **podíl REM v okně** φ_d,t ∈ [0, 1]. Když zařízení nemá data, epochu pro něj vynech.
3. **Zarovnání hodin.**
   - Křížovou korelací minutového tepu z obou zařízení odhadni posun v okně ±3 min a posun odečti.
   - Postup odpovídá zarovnání podle tepu (Garmin 2019) a CCF zarovnání (Topalidis 2025).
4. **Bdění z appky má přednost.** Intervaly, kdy appka ví, že uživatel byl vzhůru (vypnutý budík, zápis do deníku, WBTB, MILD v posteli), nastav jako „ne-REM“ s vysokou jistotou.
   - Důvod: všechna zařízení zčásti řadí nehybné bdění jako spánek (Willoughby 2024).
   - **Inference:** tiché ležení při WBTB s vyšším tepem může obě zařízení svést k „REM“.
5. **Uložit verze** aplikace, firmwaru a algoritmu (Oura, Garmin) ke každé noci.

### 3.2 Model

**a) Prior podle času od usnutí** τ (v hodinách). Je to heuristika: tvar odpovídá známému nárůstu REM k ránu, průměr je kalibrovaný na přibližně 22 % REM.
- PSG v citovaných studiích: Robbins 96 / 430 min, Mouritzen 98 / 415 min, Schyvens 92 min; latence REM v PSG 73–112 min.

| τ (h) | 0–0,75 | 0,75–1 | 1–2 | 2–3 | 3–4 | 4–5 | 5–6 | > 6 |
|---|---|---|---|---|---|---|---|---|
| π(τ) | 0,02 (pevně) | 0,05 | 0,15 | 0,18 | 0,22 | 0,26 | 0,30 | 0,33 |

**Zmírnění prioru (β).** Oura už čas v noci používá jako znak (Altini 2021), takže plný prior by tuto informaci započítal dvakrát. Proto od 0,75 h:

`logit π_eff(τ) = logit π̄ + β · (logit π(τ) − logit π̄)`, kde π̄ = 0,22 a β = 0,5.

Po 7–14 nocích nahradit osobní křivkou. Navazuje na `algoritmus_rem_cyklu.md`.

**b) Model senzoru s podmíněnou závislostí chyb.** Pro binární výstup O (Oura hlásí REM) a G (Garmin hlásí REM):

```
Při skutečném REM (R = 1):
  P(O=1, G=1 | R=1) = s_O·s_G + ρ·√(s_O(1−s_O)·s_G(1−s_G))
  P(O=1, G=0 | R=1) = s_O − P(1,1|R=1)
  P(O=0, G=1 | R=1) = s_G − P(1,1|R=1)
  P(O=0, G=0 | R=1) = 1 − s_O − s_G + P(1,1|R=1)
Při ne-REM (R = 0): totéž s f_O a f_G (falešně pozitivní míry) místo s_O a s_G.
```

- s = senzitivita, f = 1 − specificita.
- ρ je podmíněná korelace chyb (klasický model kombinace dvou diagnostických testů se závislostí, Vacek 1985; Gardner a kol. 2000). ρ = 0 znamená naivní Bayes (nezávislé chyby).
- **Podmínka:** všechny buňky ≥ 0. Pokud ne, zmenši ρ.
- **Měkké štítky:** pro φ mezi 0 a 1 použij bilineární směs
  `E_t(r) = Σ_{a,b∈{0,1}} w_O(a)·w_G(b)·P(O=a, G=b | R=r)`, kde w_d(1) = φ_d,t a w_d(0) = 1 − φ_d,t.
- **Jen jedno zařízení:** E_t(r) = φ·P(D=1|r) + (1 − φ)·P(D=0|r).

**c) Časové vyhlazení: dvoustavový skrytý Markovův model** (REM / ne-REM) na 5min epochách.
- Setrvání v REM: `a_RR(τ) = 1 − 5 / L(τ)`. Střední délka REM období L = 15 min do 2 h, 25 min ve 2–5 h a 30 min po 5 h. Učebnicová heuristika: REM periody se k ránu prodlužují.
- Přechod do REM: `h(τ) = π_eff(τ)·(1 − a_RR) / (1 − π_eff(τ))`, aby stacionární podíl REM odpovídal prioru.
- **Zmírněné emise:** `E_t(r)^γ` s γ = 0,5. Chyby zařízení jsou v čase autokorelované (klouzavá okna, celonoční normalizace), takže sousední epochy nejsou nezávislá svědectví. Bez γ je model přehnaně jistý (v testu až 0,99).
- Výstup: posterior `p_t = P(R_t = 1 | všechna data noci)` z dopředně-zpětného algoritmu.

**d) Z posteriorů k oknům.**
- Jádro = souvislý úsek s p ≥ 0,5. Okraj = navazující epochy s p ≥ 0,3.
- Jádra kratší než 10 min nezobrazovat jako okno, jen jako „možná REM“.
- Zobrazení: min(p, 0,9) zaokrouhlit na 0,1 a převést na kategorii (2.2).
- Odhad REM minut za noc = 5 · Σ p_t. Ukazovat zaokrouhleně na 10 min s textovou výhradou z 2.2.

### 3.3 Výchozí parametry

| Parametr | Výchozí | Rozsah pro citlivostní analýzu | Zdroj / zdůvodnění |
|---|---|---|---|
| s_O, Oura Gen3/Gen4 | **0,70** | 0,55–0,76 | Lee 0,71; Topalidis 0,73; Robbins 0,76; Herberger 0,55 |
| f_O, Oura Gen3/Gen4 | **0,10** | 0,05–0,18 | Robbins ≈ 0,05 (odv.); Chinoy 2022 0,08; Lee 0,13; Herberger ≈ 0,18 (odv.) |
| s_O / f_O, Oura Gen2 | 0,52 / 0,08 | 0,39–0,61 / 0,05–0,10 | Miller 2022; Chinoy 2021; Chinoy 2022 |
| s_G, Garmin výchozí | **0,50** | 0,49–0,54 (výrobce 0,70) | Chinoy 2021; Miller 2022; Topalidis 2025 |
| f_G, Garmin výchozí | **0,15** | 0,11–0,19 | Chinoy 0,16–0,18; Miller ≈ 0,19 (odv.); Schyvens ≈ 0,11 (odv.) |
| s_G / f_G, Vivosmart 4 (pesimisticky) | 0,33 / 0,12 | 0,33–0,34 / 0,11–0,12 | Mouritzen 2020; Schyvens 2025 |
| ρ | **0,3** | 0–0,5 | Přímá data pro dvojici Oura + Garmin chybí. Oba používají PPG a akcelerometr, oba přidávají čas v noci a oba přesouvají REM do lehkého spánku (inference) |
| γ | **0,5** | 0,3–1 | Autokorelace chyb (Altini 2021: klouzavá okna, normalizace na noc) |
| β | **0,5** | 0–1 | Dvojí započtení času v noci (Altini 2021) |
| L(τ) | 15 / 25 / 30 min | ±5 min | heuristika |
| Strop zobrazení | **0,9** | 0,8–0,9 | PPV ≤ 0,79 i v nejlepší studii |
| Mřížka | 5 min | | rozlišení Oury |

**Pozn. k ρ:** tady jde o binární korelaci chyb ρ = 0,3 (REM / ne-REM); `algoritmus_rem_cyklu.md` používá třítřídní vazbu se zachovanými marginálami, kde stejné P(oba REM | REM) dává ρ ≈ 0,4, takže 0,3 tady a 0,4 tam je tatáž předpokládaná závislost, ne dvě různé hodnoty.

### 3.4 Jak shoda a neshoda mění důvěru

Výpočet bez časového vyhlazení. Výchozí parametry: s_O 0,70, f_O 0,10, s_G 0,50, f_G 0,15.

Samostatně: Oura „REM“ má LR+ 7,0 a LR− 0,33, Garmin „REM“ má LR+ 3,3 a LR− 0,59.

| Prior | Pouze Oura REM | Pouze Oura ne-REM | Pouze Garmin REM | Pouze Garmin ne-REM |
|---|---|---|---|---|
| 0,25 (pozdní noc) | 0,70 | 0,10 | 0,53 | 0,16 |
| 0,05 (začátek noci) | 0,27 | 0,02 | 0,15 | 0,03 |

| Prior | ρ | Oba REM | Oura REM, Garmin ne | Oura ne, Garmin REM | Oba ne |
|---|---|---|---|---|---|
| 0,25 | 0 (naivní Bayes) | 0,89 (LR 23,3) | 0,58 (LR 4,1) | 0,27 (LR 1,1) | 0,06 (LR 0,20) |
| 0,25 | **0,3 (výchozí)** | **0,75** (LR 8,9) | **0,64** (LR 5,3) | **0,21** (LR 0,79) | **0,08** (LR 0,27) |
| 0,25 | 0,5 | 0,69 (LR 6,8) | 0,71 (LR 7,5) | 0,13 (LR 0,44) | 0,10 (LR 0,32) |
| 0,05 | 0 | 0,55 | 0,18 | 0,06 | 0,01 |
| 0,05 | 0,3 | 0,32 | 0,22 | 0,04 | 0,01 |
| 0,05 | 0,5 | 0,26 | 0,28 | 0,02 | 0,02 |

**Čtení tabulky:**
- **Shoda „REM“** zvyšuje důvěru oproti samotné Ouře jen mírně (z 0,70 na 0,75 při ρ = 0,3). Naivní násobení by dalo 0,89, což je falešná jistota.
- **Neshoda** podle toho, kdo hlásí REM:
  - Když REM hlásí Oura, odhad zůstává „možná REM“ (0,64).
  - Když REM hlásí jen Garmin, výsledek je pod priorem (0,21), protože Garmin má hodně falešných REM a Oura „ne“ je silnější svědectví.
- **Při ρ ≈ 0,5** druhé zařízení po pozitivní Ouře nepřidává skoro nic. Shoda obou je dokonce o chlup slabší než samotná Oura, protože při silně korelovaných chybách se falešné REM obou zařízení objevují spolu.
- **Na začátku noci** ani shoda obou neznamená „pravděpodobně REM“ (0,32). Odpovídá to fyziologii: REM v první hodině je u zdravých vzácný.

### 3.5 Proč shoda zařízení není přesnost

Očekávané κ mezi Ourou a Garminem pro REM při podílu REM 20 % a výchozích s a f:

| ρ | P(oba REM) | Očekávané κ (Oura vs Garmin) |
|---|---|---|
| 0 | 0,082 | **0,20** |
| 0,3 | 0,121 | 0,43 |
| 0,5 | 0,148 | 0,58 |

Důsledky:
- **Nízká shoda** zařízení (κ ≈ 0,2) je normální i u zařízení s „literárními“ parametry. Není to porucha.
- **Vysoká shoda** (κ > 0,5) může znamenat korelované chyby, nebo zařízení přesnější než literatura. Bez EEG referenční noci se tyto možnosti nedají odlišit.
- Bezpečná volba je předpokládat korelované chyby. Model pak bude spíš opatrný než přehnaně jistý.

### 3.6 Odhad ρ a personalizace

1. **Hrubý odhad z dat uživatele.** Po ≥ 7 nocích s oběma zařízeními spočítej pozorované κ_OG na 5min mřížce. Zvol ρ̂ tak, aby očekávané κ_OG (vzorec v 3.5) odpovídalo pozorovanému, a omez ho na [0, 0,5].
2. **Pokročile: bayesovský model latentních tříd** (paradigma Hui–Walter).
   - Strata podle hodiny noci mají různou prevalenci REM.
   - Beta priory na s a f z tabulky 3.3 (např. s_O ~ Beta(14, 6), f_O ~ Beta(2, 18)) a slabý prior na ρ.
   - S ρ > 0 není model bez informativních priorů identifikovatelný. Data tedy hlavně zužují rozsahy, „pravdu“ nenajdou.
3. **Zlatá cesta: 1–3 referenční noci s EEG čelenkou** (např. ZMax) nebo ve spánkové laboratoři. Z nich se přímo odhadnou s, f a ρ pro daného člověka.
4. **Ruční záznamy** „probudil jsem se ze snu v čase T“ jsou slabé svědectví o REM v posledních minutách před T. Model popisuje `algoritmus_rem_cyklu.md`.
5. **Po změně firmwaru nebo algoritmu** vrátit parametry na výchozí a personalizaci začít znovu.

### 3.7 Modelový příklad (pozdní noc, 4:00–5:15)

Parametry výchozí, prior po zmírnění 0,25, L = 25 min (a_RR = 0,80, h = 0,067), ρ = 0,3, γ = 0,5.

| Čas | Oura REM | Garmin REM | p bez vyhlazení | p s HMM | Kategorie |
|---|---|---|---|---|---|
| 04:00 | 0 | 0 | 0,08 | 0,14 | málo pravděpodobné |
| 04:05 | 0 | 0 | 0,08 | 0,16 | málo pravděpodobné |
| 04:10 | 0 | 0 | 0,08 | 0,25 | spíš ne |
| 04:15 | 0 | 1 | 0,21 | 0,47 | možná REM (okraj) |
| 04:20 | 1 | 1 | 0,75 | 0,76 | pravděpodobně REM |
| 04:25 | 1 | 1 | 0,75 | 0,87 | pravděpodobně REM |
| 04:30 | 1 | 0 | 0,64 | 0,90 | pravděpodobně REM |
| 04:35 | 1 | 1 | 0,75 | 0,90 | pravděpodobně REM |
| 04:40 | 1 | 1 | 0,75 | 0,84 | pravděpodobně REM |
| 04:45 | 1 | 0 | 0,64 | 0,67 | možná REM |
| 04:50 | 0 | 0 | 0,08 | 0,31 | spíš ne (okraj) |
| 04:55 | 0 | 0 | 0,08 | 0,16 | málo pravděpodobné |
| 05:00 | 0 | 0 | 0,08 | 0,10 | málo pravděpodobné |
| 05:05 | 0 | 0 | 0,08 | 0,08 | málo pravděpodobné |
| 05:10 | 0 | 1 | 0,21 | 0,09 | málo pravděpodobné (osamocený Garmin) |
| 05:15 | 0 | 0 | 0,08 | 0,09 | málo pravděpodobné |

**Výsledek a text v appce:**
- Jádro (p ≥ 0,5) je 4:20–4:50 a okraj (p ≥ 0,3) 4:15–4:55.
- Text: „Pravděpodobné REM okno zhruba 4:20–4:50, okraje ±5 min. Oura i Garmin se tu z větší části shodují.“
- Osamocený Garminův REM v 5:10 vyhlazení potlačí (0,21 → 0,09).
- Epochy uvnitř okna, kde Garmin hlásí „ne“, zůstávají vysoko, protože okolní svědectví je silné.
- Odhad REM v tomto úseku: 5 · Σ p ≈ 30 min.

### 3.8 Pseudokód

```text
input: sleep_onset, wake_time, hypnogram_oura (5 min), hypnogram_garmin (segmenty),
       app_awake_intervals, params (tab. 3.3)

grid = 5min epochy od sleep_onset do wake_time
shift = argmax_lag xcorr(hr_oura_1min, hr_garmin_1min, lag in [-3, +3] min)
for t in grid:
    phiO[t] = podil REM Oury v okne t (nebo MISSING)
    phiG[t] = podil REM Garminu v okne t posunuteho o shift (nebo MISSING)
    tau = hodiny od sleep_onset
    piEff[t] = tau < 0.75 ? 0.02 : temper(priorTable(tau), base = 0.22, beta = 0.5)
    L = tau < 2 ? 15 : (tau < 5 ? 25 : 30)
    aRR[t] = 1 - 5 / L
    h[t] = piEff[t] * (1 - aRR[t]) / (1 - piEff[t])
    for r in {0, 1}:
        E[t][r] = emission(phiO[t], phiG[t], r, sO, fO, sG, fG, rho) ^ gamma
    if t in app_awake_intervals: E[t][1] = 1e-3 * E[t][1]
p = forward_backward(E, transitions(h, aRR), init = piEff[0])
display = round(min(p, 0.9), 1)
windows = runs(p >= 0.5, min_len = 10 min) extended by neighbours with p >= 0.3
rem_minutes = round(5 * sum(p), to = 10)
log(device_versions, params, rho_hat)
```

### 3.9 Jak model ověřit (stručně)

1. **Kontroly rozumnosti:**
   - Podíl noci s p ≥ 0,5 by měl být zhruba 15–30 %.
   - Jádra by se neměla objevovat v prvních 45 min.
   - Počet oken za noc by měl být 3–6.
2. **Citlivostní analýza:** okna při ρ ∈ {0; 0,3; 0,5} a γ ∈ {0,3; 0,5; 1}. Když se okno posune o víc než 10 min, zobrazit ho jako „nejisté“.
3. **Referenční noci s EEG** (pokud je uživatel má): kalibrace p proti EEG ve skupinách po 0,1 a Brierovo skóre.
4. **Vnitřní validita:**
   - Probuzení se snem z deníku by mělo mít vyšší p v posledních 10 min než probuzení bez snu.
   - Obrácený výsledek naznačuje chybu modelu nebo dat.

---

## 4. Limity a otevřené otázky

1. **Oura Gen4 a Ring 5 nemají PSG validaci určování fází.** Platí jen nepřímý předpoklad, že běží stejný algoritmus z roku 2023 jako u Gen3 (podle Oury) s lepším signálem HRV (Dial 2025).
2. **Současné Garminy** (Venu 3, Vivoactive 5/6, Fenix 7/8, Forerunner 265/965, Index Sleep Monitor) nemají recenzovanou PSG validaci. Jediný zdroj je preprint s COI a optimistickým zarovnáním (Topalidis 2025). Firemní validace je z roku 2019 a jde o křížovou validaci vývojových dat.
3. **Asymetrie COI.**
   - Nejlepší čísla Oury pocházejí z prací financovaných nebo spoluautorovaných Ourou (Altini 2021, Robbins 2024, částečně Svensson 2024).
   - Nezávislé klinické vzorky dávají výrazně méně (Herberger 2025, Lee 2023).
   - Studie Garminu jsou převážně nezávislé, a proto možná „férověji nízké“ (inference).
4. **Populace.** Většina studií měří mladé zdravé lidi v laboratoři po jednu noc. U starších lidí, při apnoe a u nočních s vysokým WASO je chyba větší (Searles 2026, Herberger 2025, Topalidis 2025).
5. **Rozlišení.** Validace jsou ve 30s epochách, appka dostane 5 min (Oura). Metriky na 5min mřížce jsou neznámé a pravděpodobně horší (Herberger 2025).
6. **Časování jednotlivých REM období** (začátek a konec, chyba v minutách) nikdo nevalidoval. To je hlavní mezera pro chytrý budík WBTB.
7. **Korelace chyb Oura + Garmin (ρ)** není změřena. Výchozí 0,3 je odhad.
8. **Lucidní snění a WBTB.** Zařízení nebyla validována během lucidních snů, po nočním probuzení ani při ležení v klidu s mentálním cvičením (MILD). Nehybné bdění se zčásti řadí jako spánek (Willoughby 2024).
9. **Algoritmy se mění bez ohlášení.** De Zambotti 2025 výslovně upozorňuje, že validace zaostávají za verzemi. Není jasné, zda Oura po aktualizaci přepočítává historické noci (neověřeno).
10. **Reálný čas.** Ani jedno zařízení nedává REM během noci přes veřejné API. Odhad výskytu REM pro plánování je proto vždy předpověď z minulých nocí.
11. **Otevřené otázky pro vlastní měření:**
    - Jak velké je ρ u konkrétní dvojice?
    - O kolik minut se liší začátky REM oken mezi Ourou a Garminem po zarovnání podle tepu?
    - Dá se první REM odhadnout lépe z prioru než ze zařízení?

---

## 5. Zdroje

| Autor, rok | Časopis | DOI / URL | Financování / COI |
|---|---|---|---|
| de Zambotti M, Rosas L, Colrain IM, Baker FC, 2019 | Behav Sleep Med 17(2) | 10.1080/15402002.2017.1300587 | NIH (NIAAA). De Zambotti později zaměstnanec Oury |
| Mouritzen NJ, Larsen LH, Lauritzen MH, Kjær TW, 2020 | PLoS One 15:e0243214 | 10.1371/journal.pone.0243214 | Hodinky zapůjčil Garmin |
| Altini M, Kinnunen H, 2021 | Sensors 21:4302 | 10.3390/s21134302 | Kinnunen zaměstnanec Oury, Altini poradce Oury |
| Chee NIYN a kol., 2021 | Nat Sci Sleep 13:177 | 10.2147/NSS.S286070 | NMRC; prsteny dodala Oura |
| Chinoy ED a kol., 2021 | Sleep 44(5):zsaa291 | 10.1093/sleep/zsaa291 | Office of Naval Research; bez COI |
| Chinoy ED, Cuellar JA, Jameson JT, Markwald RR, 2022 | Nat Sci Sleep 14:493 | 10.2147/NSS.S348795 | Office of Naval Research; autoři zaměstnanci Leidos; bez vazby na výrobce |
| Ghorbani S a kol., 2022 | Nat Sci Sleep 14:645–660 | 10.2147/NSS.S359789 | Patent Z3Score (Chee, Ong); nespecifikované „other conflicts“ |
| Miller DJ, Sargent C, Roach GD, 2022 | Sensors 22:6317 | 10.3390/s22166317 | Laboratoř podporuje WHOOP |
| Budig M, Stoohs R, Keiner M, 2022 | Sensors 22:9540 | 10.3390/s22239540 | Bez COI |
| Lee T a kol., 2023 | JMIR mHealth uHealth 11:e50983 | 10.2196/50983 | Akcie Asleep (SleepRoutine) |
| Kainec KA a kol., 2024 | Sensors 24:635 | 10.3390/s24020635 | Grant UMass; bez COI |
| Robbins R a kol., 2024 | Sensors 24:6532 | 10.3390/s24206532 | Financovala Oura; Robbins v poradním sboru Oury |
| Svensson T a kol., 2024 | Sleep Med 115:251 | 10.1016/j.sleep.2024.01.020 (komentář Lolli 10.1016/j.sleep.2024.03.013) | Částečně Oura (blog Oura, 12. 2. 2024) |
| Ong JL a kol., 2024 | Sleep Health | 10.1016/j.sleh.2023.11.005 | Neověřeno (abstrakt) |
| Willoughby AR a kol., 2024 | Sleep Health | 10.1016/j.sleh.2024.02.007 | Neověřeno (abstrakt) |
| Schyvens AM a kol., 2024 | JMIR mHealth uHealth 12:e52192 | 10.2196/52192 | |
| Schyvens AM a kol., 2025 | Sleep Adv 6:zpaf021 | 10.1093/sleepadvances/zpaf021 | VLAIO; bez COI |
| Herberger S a kol., 2025 | Sci Rep 15:9461 | 10.1038/s41598-025-93774-z | Bez COI |
| Khan S a kol., 2025 | OTO Open | 10.1002/oto2.70181 | |
| Lee YJ a kol., 2025 | J Clin Sleep Med 21(3):573 | 10.5664/jcsm.11460 | |
| de Zambotti M, Vallat R, Pho G, Goldstein C, Patel S, 2025 | Sleep Adv | 10.1093/sleepadvances/zpaf063 | 4 z 5 autorů zaměstnanci Oury |
| Dial MB a kol., 2025 | Physiol Rep | 10.14814/phy2.70527 | AFRL; bez COI |
| Chee MW a kol. (World Sleep Society), 2025 | Sleep Med 131:106506 | 10.1016/j.sleep.2025.106506 | |
| Topalidis P a kol., 2025/2026 | preprint PsyArXiv / Research Square | 10.31234/osf.io/27wun_v1; 10.21203/rs.3.rs-8419739/v1 | Schabus spoluzakladatel, Topalidis zaměstnanec NUKKUAA (sleep²) |
| Searles ME a kol., 2026 | Sleep Adv | 10.1093/sleepadvances/zpag006 | NIH; bez COI |
| Jin Y a kol., 2026 | J Transl Med | 10.1186/s12967-026-08214-x | |
| Agostinho M a kol., 2026 | Behav Sleep Med | 10.1080/15402002.2026.2673893 | |
| Saliba CT a kol., 2026 | Front Psychiatry | 10.3389/fpsyt.2026.1767216 | |
| Burgett S a kol. (Garmin, KUMC), 2019 | poster AAN, firemní blog | https://www.garmin.com/en-GB/blog/?p=6904 | Výrobce |
| Apple, 2025 | White paper „Estimating Sleep Stages from Apple Watch“ | https://www.apple.com/health/pdf/Estimating_Sleep_Stages_from_Apple_Watch_Oct_2025.pdf | Výrobce |
| Oura, 2026 | Blog „Standing Behind Our Science“ (23. 8. 2026) a podpora „Sleep Graphs“ (5min hypnogram) | https://ouraring.com/blog/how-oura-measures-sleep-and-validates-accuracy/ ; https://support.ouraring.com/hc/en-us/articles/4403155260307 | Výrobce |
| Žaloba Surber v. Oura, 2026 (N.D. Cal., podána 20. 8. 2026) | zpravodajství | https://www.mddionline.com/wearable-medical-devices/oura-faces-class-action-over-sleep-tracking-claims | Nerozhodnuto |
| NCT06174558, 2023 | ClinicalTrials.gov | https://clinicaltrials.gov/study/NCT06174558 | Výsledky nejsou |
| Vacek PM, 1985; Gardner IA a kol., 2000; Hui SL, Walter SD, 1980 | Biometrics 41(4):959–968; Prev Vet Med 45(1–2):107–122; Biometrics 36(1):167–171 | 10.2307/2530967; 10.1016/S0167-5877(00)00119-7; 10.2307/2530508 | metodika: závislé diagnostické testy, latentní třídy |

*Pozn.: Ong 2024, Willoughby 2024 a Svensson 2024 jsem četl jen v abstraktu. Hodnoty „odv.“ jsou mé výpočty z matic chyb a nejsou publikované.*
````

### algoritmus_rem_cyklu.md

````markdown
# Algoritmus REM cyklů: od hypnogramu k pravděpodobným REM oknům

Stav k 23. 10. 2026. Podklad pro záložku Spánek: odhad výskytu REM, REM okna, Chytré probuzení do snu (WBTB) a Zvukový klíč (TLR).

**Vazby na ostatní dokumenty:**
- `presnost_nositelne_elektroniky.md` dává parametry zařízení (senzitivita, falešně pozitivní míra, ρ, γ, β), slovník a vizuální specifikaci. Tady je používám a rozšiřuji. Kde by se čísla lišila, platí tamten dokument. Jediný rozdíl v zápisu je korelace chyb: tamten binární model má ρ′ = 0,3, tady třítřídní vazba ρ = 0,4, a jde o tutéž předpokládanou závislost (převod v 3.3).
- `inovace.md` popisuje funkce (REM profil, TOP 1 WBTB, Zvukový klíč, Osobní laboratoř). Tady je odvozený model, na kterém stojí.

**Značky u čísel:**
- **[L]** literatura,
- **[O]** odvozeno výpočtem z literatury,
- **[P]** předpoklad modelu, nutno kalibrovat,
- **[S]** vlastní simulace v této práci (skripty v scratchpadu sezení, viz 7.1).

---

## 0. Shrnutí

1. **Cyklus = NREM perioda + REM perioda** podle Feinberga a Floyda (1979):
   - NREM perioda (NREMP) trvá aspoň 15 min.
   - REM epizody oddělené méně než 15 min NREM patří do jedné REM periody (REMP).
   - Každá REMP kromě první trvá aspoň 5 min.
   - Strojově to převzal balík SleepCycles (Blume & Cajochen 2021). Doplnil dělení NREMP delší než 120 min (vynechaný první REM) a značení neúplných period na konci noci.
2. **Cyklus trvá 90 ± 25 min** (961 cyklů, 205 zdravých dospělých) a noc má 4,7 ± 0,9 cyklu (Rosenblum 2025).
   - Variabilita je hlavně uvnitř noci. SD intervalu mezi začátky REM v rámci noci je 19 min.
   - Osobní průměr se mezi lidmi liší jen o SD 5,8 min (ICC 0,32; Kishi & Van Dongen 2023).
3. **Model je skrytý semi-Markovův model (HSMM) se segmenty W0 → N1 → R1 → (W1) → N2 → R2 …**, tedy pravděpodobnostní verze Feinberga a Floyda.
   - Délky segmentů jsou log-normální a závisí na pořadí cyklu.
   - Emise spojují Ouru a Garmin přes matice záměn s korelovanými chybami. Jsou zmírněné kvůli autokorelaci a mají pojistku „zařízení celou REM periodu přehlédlo“.
   - Výstupy: P(REM perioda v čase t), intervaly začátku a konce každé REM periody, souhrny noci.
4. **Osobní prior** se učí hierarchicky (populace → člověk → noc) Kalmanovým filtrem po každé noci.
   - Učit se dá hlavně latence REM a průměrná délka cyklu.
   - Pravidelnost uvnitř noci je osobním rysem jen málo (ICC 0,02).
5. **Záznam „probudil jsem se ze snu v čase T“** je jedno svědectví s věrohodnostním poměrem asi 2.
   - Vybavení po probuzení z REM je 82 %, z NREM 43 % (Nielsen 2000).
   - Poměr se upravuje podle kvality vybavení a lucidity a má časové jádro podle jistoty času.
   - Počítá se přesně, rozšířením stavu o příznak „probuzení už nastalo“.
6. **Poctivé číslo pro chytrý budík [S].**
   - Bez dat z téže noci trefí model REM periodu v okně 4,5–6,5 h po usnutí nejvýš s pravděpodobností asi **0,31**. Pevných 5 h dává **0,27**.
   - Vybavení snu při budíku tím stoupne z asi 53 % na 55 %.
   - Kdyby appka znala konec předchozí REM periody téže noci, šlo by o **0,50**. Data v reálném čase ale API nedávají.
   - Chytrý budík proto prezentovat jako „budík ve správnou část noci, kotvený na skutečné usnutí, s bránou spánku a učením“. Ne jako „budík do REM“.
7. **Syntetická zkouška [S]** (30 nocí, záměrně chybný prior, epizodní korelované chyby zařízení):
   - HSMM snížil Brierovo skóre proti surovým štítkům Oury z 0,134 na 0,078.
   - Chybu kalibrace (ECE) snížil z 0,134 na 0,027.
   - Druhé, slabší zařízení přidalo málo.
   - Naivní spojení (ρ = 0) bylo hůř kalibrované a ρ šlo odhadnout z marginální věrohodnosti.
   - Platí jen pro simulované chyby.
8. **Výpočet:** na 5min mřížce desítky milisekund v isolate, na minutové mřížce pod 0,5 s.
9. **Validace** postupuje ve čtyřech krocích:
   - syntetika,
   - polosyntetika (skutečné PSG hypnogramy a simulátor zařízení),
   - veřejná data (Walch 2019, DREAMT, MESA, Sleep-EDF),
   - N-of-1 u uživatele (zápisy snů vynechané jeden po druhém a mikrorandomizovaný budík).

---

## 1. Literatura

### 1.1 Definice cyklu z hypnogramu

| Kritérium | Feinberg & Floyd 1979 | SleepCycles (Blume & Cajochen 2021) | Návrh pro Ouru a Garmin (2.6) |
|---|---|---|---|
| Začátek NREMP | S2 | Na začátku noci N1 (výchozí) nebo N2. Po REMP i bdění. | První epocha trvalého spánku (≥ 10 min spánku) |
| Minimum NREMP | 15 min (smí obsahovat bdění) | 15 min, smí obsahovat W a < 5 min REM | 15 min (3 epochy po 5 min) |
| Maximum NREMP | není | 120 min bez bdění, pak dělení | 120 min, dělení jen jako „možná vynechaný REM“ |
| Dělení dlouhé NREMP | není | U první N3 po ≥ 12 min bez N3 (Jenni & Carskadon 2004; Kurth 2010; Rudzik 2020) | Stejně, ale s nízkou jistotou (hluboký spánek je z náramku nespolehlivý) |
| Minimum REMP | 1. REMP bez minima, další ≥ 5 min | Stejně, parametr `REMP_length` = 10 epoch po 30 s | 1. REMP ≥ 1 epocha a ne dřív než 45 min po usnutí. Další ≥ 10 min na 5min datech, ≥ 5 min na minutových |
| Sloučení REM epizod | Mezera < 15 min NREM | Implicitně (REMP končí až splněním kritérií další NREMP) | Mezera < 15 min |
| Neúplná perioda na konci | Perioda bez ≥ 5 min opačného stavu před probuzením | `rm_incomplete_period` | Označit „neúplné“, do statistik délky nebrat |
| Rozlišení | 30s epochy | jen 30s epochy | 5 min (Oura API), minuty (Garmin přes Health Connect) |

**Poznámky k literatuře:**
- **Blume & Cajochen 2021** upozorňují, že původní kritéria „nebyla psána pro převod do kódu a jsou místy nedourčená“. Jejich implementace je proto de facto standard pro opakovatelnost.
- Vynechaný první REM je častý hlavně u dospívajících a mladých dospělých. Vidět je jen „zesvětlení spánku“ (Jenni & Carskadon 2004; Kurth 2010).
- **Merica & Gaillard 1986:** ani dlouhé bdění uvnitř cyklu „nenulovalo hodiny cyklu“. Číslování cyklů po probuzení WBTB proto nerestartovat.
- **Aeschbach & Borbély 1993** popisují dynamiku spánkového EEG po NREM-REM cyklech. Pomalovlnná aktivita klesá cyklus od cyklu. N3 je tedy značka prvních cyklů.

### 1.2 Délka a variabilita cyklů

- **Rosenblum 2025** (eLife, 5 datových sad, 205 zdravých dospělých):
  - Klasický cyklus trvá 90 ± 25 min, za noc jich je 4,7 ± 0,9.
  - Délka cyklů v průběhu noci tvoří obrácené U.
  - REM epizody trvají v průměru 22–26 ± 12–15 min podle datové sady.
  - Rozdělení délek cyklů není normální.
  - Děti a dospívající mají kratší cykly (80 ± 23 vs 90 ± 22 min).
  - Léky na depresi cykly prodlužují.
- **Kishi & Van Dongen 2023** (12denní laboratorní studie, 12h příležitosti ke spánku):
  - Průměrný interval mezi začátky REM je 91,6 min.
  - Mezi lidmi: SD 5,8 min, rozptyl 34,2 min².
  - Mezi nocemi téhož člověka: rozptyl 73,4 min².
  - ICC průměrné délky cyklu 0,32, počtu cyklů 0,37.
  - SD intervalu uvnitř noci je 19,3 min a jeho ICC jen 0,02. Nepravidelnost tedy není osobní rys.
  - Autoři shrnují, že „90 minut“ je zjednodušení a reálně jde o 70–150 min.
- **Schulz 1980:** po sobě jdoucí cykly mají záporné kovariance. Dlouhý cyklus mívá kratšího následníka. Data odpovídají „periodicky řízenému procesu“, ne procesu obnovy.
  - Důsledek: model, ve kterém se délky cyklů jen sčítají, rozmazává fázi k ránu víc než skutečnost. Rozšíření je v 3.2.
- **Kishi 2011:** délku intervalu mezi REM určují hlavně přechody N2 → N3 v NREM části.
- **Le Bon 2020** je přehled konkurenčních koncepcí regulace REM a NREM.
- **Akhavan 2026** (573 PSG nahrávek z veřejných databází):
  - Lidské REM tvoří „sekvenční“ (krátké mezery) i „jednotlivé“ cykly.
  - Delší předchozí REM znamená delší následující interval (β = 0,33 v log-log modelu).
  - V posledním decilu noci začíná asi 41 % REM záchvatů a podíl REM v něm dosahuje až 70 %.
  - Pro model z toho plyne, že délky REM záchvatů nejsou exponenciální. Semi-Markovův model má proto smysl.

### 1.3 Latence REM, podíl REM a jeho rozložení v noci

- **Boulos 2019** (meta-analýza 169 studií, 5 273 zdravých dospělých; průměry s 95% CI):
  - latence REM 97,4 min (93,9–100,8), ve věku 18–34 let 96,4 min, na druhé a další noci 87,3 min (82,4–92,2),
  - REM 19,0 % celkového spánku, na druhé a další noci 21,4 %,
  - latence usnutí 15,4 min, celkový spánek 394,6 min.
  - Domácí noci odpovídají spíš „druhé a další noci“.
- **Ohayon 2004** (65 studií, 3 577 osob): s věkem dospělých klesá podíl REM i latence REM. Efekty silně závisí na kvalitě výběru zdravých osob.
- **Feinberg & Floyd 1979:** REM periody se v noci prodlužují, NREM periody a pomalé vlny ubývají. Je to klasický zdroj pro „REM přibývá k ránu“.
- **Czeisler 1980; Dijk & Czeisler 1995:** REM má cirkadiánní složku s vrcholem kolem minima tělesné teploty, tedy v druhé polovině obvyklé noci. Při posunutém spánku se mění latence REM i jeho rozložení. Model proto potřebuje kovariátu „posun ulehnutí“.
- **Barbato 2002** (1 189 spontánních probuzení, 364 prodloužených nocí):
  - Probuzení delší než 10 min začínají přednostně z REM.
  - Po probuzení následuje krátká latence REM.
  - Podíl dlouhých probuzení po REM k ránu roste.
  - Pro model: REM po návratu do postele z WBTB přichází dřív a probuzení, které si člověk pamatuje, je spíš z REM.
- **Ebrahim 2013:** alkohol potlačuje REM v první polovině noci a prodlužuje latenci REM. V modelu je to štítek noci.

### 1.4 Probuzení a vybavení snu

- **Nielsen 2000:** vybavení po probuzení z REM 81,9 ± 9,0 % (29 studií), z NREM 43,0 ± 20,8 % (33 studií). Poměr ≈ 1,9.
- **Stucky 2025** (69 studií):
  - Zážitek s vybavením: REM 83,4 %, NREM 59,5 % (N1 84,9 %, N2 53,2 %, N3 50,8 %).
  - Doma o 14 p. b. víc než v laboratoři.
  - Při buzení budíkem o 10 p. b. méně než při oslovení jménem.
  - Novější data dávají menší poměr, asi 1,4.
- **Dement & Kleitman 1957:** vybavení po konci REM klesá během minut. Hranici kolem 8 min uvádějí sekundární zdroje [L, sekundárně]. V modelu z toho plyne okno λ_d = 5 min po konci REMP.
- **Lucidní sny:**
  - Vznikají převážně v REM, poprvé ověřeno signály očima (LaBerge 1981; přehled Baird 2019).
  - Existují i v NREM (Stumbrys & Erlacher 2012).
  - „Lucidní“ je tedy silné, ale ne absolutní svědectví o REM.

### 1.5 Pravděpodobnostní modely hypnogramu a spojování zdrojů

- **HMM pro spánek:**
  - Rabiner 1989 (forward–backward, Viterbi).
  - Pan 2012: HMM s omezenými přechody mezi fázemi.
  - Kemp & Kamphuisen 1986: simulace hypnogramů Markovovým řetězcem. Hodí se jako nezávislý generátor syntetických nocí.
- **Proč semi-Markov:**
  - Délky spánkových záchvatů nejsou geometrické (Lo 2004; Bianchi 2010).
  - Obyčejný HMM proto špatně drží minimální a typické délky period.
  - HSMM s explicitními délkami popisuje Yu 2010.
- **Hypnodenzita** (Stephansen 2018): pravděpodobnost fází po epochách je informativnější výstup než tvrdý hypnogram. Stejně chci ukazovat REM.
- **Čas v noci jako příznak:** Walch 2019 přidal „clock proxy“ k pohybu a tepu z Apple Watch a dosáhl ~72 % přesnosti pro bdění/NREM/REM. Oura používá znaky času v noci také (Altini 2021). Výstup zařízení tak už v sobě nese prior „REM k ránu“ a hrozí jeho dvojí započtení (viz β v 3.4).
- **Spojování nespolehlivých hodnotitelů:**
  - Dawid & Skene 1979: matice záměn hodnotitelů odhadované EM.
  - Kim & Ghahramani 2012: bayesovská kombinace klasifikátorů.
  - Korelované chyby dvou testů řeší model podmíněné závislosti (v `presnost_nositelne_elektroniky.md` 3.2).
- **Zmírněná věrohodnost** (power likelihood, Holmes & Walker 2017): emise umocněná γ < 1, když pozorování nejsou nezávislá.
- **Hodnocení pravděpodobností:**
  - Striktně správná skóre, Brier a log-skóre (Gneiting & Raftery 2007).
  - Slovní pravděpodobnosti lidé čtou nejednotně (Budescu 2014; škála IPCC Mastrandrea 2011). Slovo proto vždy doplnit číslem.

### 1.6 Co z toho plyne pro návrh

1. Feinbergova a Floydova pravidla jsou dobrý cíl, ale na 5min datech ze zařízení se musí převést na pravděpodobnost. Jinak vznikají falešné REM periody: v simulaci [S] surové štítky Oury vytvořily 0,97 falešného začátku REM periody za noc, HSMM 0,23.
2. Prior „cyklus 90 min“ se k ránu rozmaže. Osobní učení zúží hlavně první dva cykly a celkovou úroveň.
3. Dvě zařízení měřící tep a pohyb nejsou dva nezávislí svědci. Spojení musí počítat s korelovanými chybami a s autokorelací v čase.
4. Ruční zápisy snů jsou slabé, ale nezávislé svědectví. Jejich síla roste, když appka zná i probuzení bez snu (tlačítko „bez snu“, budíky WBTB).
5. Plánování (budík, podněty) je vždy předpověď z minulých nocí. API nedávají fáze v reálném čase (`presnost_nositelne_elektroniky.md` bod 7; zpráva *Lucidní snění, metody a aplikace 2*).

---

## 2. Pipeline: od surových dat k noci

### 2.1 Vstupy

| Zdroj | Pole | Kódování | Rozlišení | Poznámka |
|---|---|---|---|---|
| Oura API v2 (`/v2/usercollection/sleep`, OpenAPI 1.42) | `sleep_phase_30_sec`, `sleep_phase_5_min`, `app_sleep_phase_5_min` (bude zrušeno) | znak `1` hluboký, `2` lehký, `3` REM, `4` bdění | 30 s nebo 5 min od `bedtime_start` | Preferovat 30 s, pokud existuje. Logovat `sleep_algorithm_version` (v1/v2). Brát `type` = `long_sleep` (> 3 h). `sleep` a `late_nap` jsou zdřímnutí, `rest` je falešně detekovaný spánek. |
| Oura | `bedtime_start`, `bedtime_end` | ISO 8601 s posunem vůči UTC | | Kotva mřížky |
| Oura | `latency`, `movement_30_sec`, `heart_rate`, `hrv` | s, kódy 1–4, vzorky | | Zarovnání hodin podle tepu, kontrola usnutí |
| Garmin přes Health Connect (od poloviny 2025) | `SleepSessionRecord.stages` | `STAGE_TYPE_AWAKE` 1, `SLEEPING` 2, `OUT_OF_BED` 3, `LIGHT` 4, `DEEP` 5, `REM` 6, `AWAKE_IN_BED` 7, `UNKNOWN` 0 | úseky `startTime`–`endTime` (Instant), v praxi minuty | `startZoneOffset`, `endZoneOffset`. Logovat zdroj (`metadata.dataOrigin`) a verzi aplikace Garmin Connect. |
| Appka | „Jdu spát“, budík WBTB, „zpět do postele“, „Probudilo mě to“, zápis snu v noci, test reality po budíku | časová razítka telefonu (UTC) | sekundy | Jisté bdění (emise a_t) a kotvy |
| Ranní zápis | sny s časem T, jistota času, kvalita 0–10, lucidita, „bez snu“ | | | Kapitola 4 |

**Mapování tříd:** emise pracují se třemi třídami {W, N, R}. N = lehký + hluboký. Hluboký spánek se drží zvlášť jen pro deterministické dělení dlouhé NREMP (2.6, pravidlo F6).

### 2.2 Čas

1. Vše interně v **UTC (Instant)**. Lokální čas se počítá jen pro zobrazení a pro cirkadiánní kovariátu, vždy z posunu platného v daném okamžiku. Noci přes změnu letního času jsou pak bez chyby.
2. **Mřížka** Δ = 5 min (výchozí, rozlišení Oura API). Δ = 1 min, když je k dispozici `sleep_phase_30_sec` nebo jen Garmin.
3. **Měkké štítky:** pro epochu t a zařízení d spočítej podíly tříd φ^d_t ∈ [0,1]³ (stejně jako `presnost_nositelne_elektroniky.md` 3.1). Chybějící data = prázdný štítek (emise 1).
4. **Noc** = spojení relací oddělených méně než 60 min. Zdřímnutí (< 3 h, nebo začátek po 12:00 místního času) se do modelu noci nepočítá.
5. Začátek mřížky t = 1 je dřívější z `bedtime_start` (Oura) a začátku relace Garminu. Konec je pozdější z konců.

### 2.3 Zarovnání zařízení

1. Posun hodin δ ∈ [−5, +5] min odhadni křížovou korelací minutového tepu obou zařízení. Když tep chybí, použij binární sekvenci spánek/bdění a maximalizuj κ.
2. Posun použij, jen když zlepší shodu (κ o ≥ 0,05) a |δ| ≤ 5 min. Větší posun je spíš chyba dat než hodin. Nezarovnávat a noc označit.
3. Konstantní posun celého hypnogramu shodu s PSG nezlepšuje (Mouritzen 2020, citováno v `presnost_nositelne_elektroniky.md` 1.5). Zarovnání proto opravuje jen hodiny, ne chyby klasifikace.

### 2.4 Usnutí a kvalita noci

- **Usnutí S0** = první epocha, po které následuje ≥ 10 min spánku s nejvýš 2 min bdění. Jde o obdobu „latence k trvalému spánku“, shodnou s `inovace.md`.
  - V HSMM je S0 latentní (konec segmentu W0). Deterministické S0 slouží jen k zobrazení a k pravidlům 2.6.
- **Štítky noci** (z appky nebo ručně):
  - alkohol,
  - nemoc,
  - cestování přes ≥ 2 časová pásma,
  - noc s WBTB,
  - léky ovlivňující REM,
  - posun ulehnutí > 2 h proti osobnímu mediánu.
  - Štítky slouží jako kovariáty nebo vyřadí noc z učení (3.5).
- **Kvalita dat:** podíl epoch bez dat, nesoulad délky relací > 30 min, změna verze algoritmu. Noci s > 30 % chybějících epoch se do učení nepočítají.

### 2.5 Vyhlazování

- **Pro pravděpodobnostní model nic nevyhlazovat.** Časovou strukturu dodá HSMM. Předchozí vyhlazení by autokorelaci jen zesílilo a rozbilo kalibraci.
- **Pro deterministickou segmentaci** (zobrazení „surových“ cyklů a srovnávací baseline) použij modus v okně 3 epoch, až potom pravidla 2.6.

### 2.6 Deterministická segmentace podle Feinberga a Floyda, verze pro Ouru a Garmin

Slouží jako baseline ve validaci, pro detail „Surová data“ a jako záloha, když model nedoběhne. Vstup: sekvence {W, N, R} (u Oury i D).

| # | Pravidlo | Parametr (5min data / minutová) | Zdroj |
|---|---|---|---|
| F1 | Mapuj na W, N, R (D zvlášť pro F6), Oura 30 s agreguj na 1 min majoritou | | |
| F2 | Usnutí S0 = začátek prvního úseku ≥ 10 min spánku s ≤ 2 min bdění | 10 min | obdoba latence k trvalému spánku |
| F3 | Sluč REM úseky oddělené < 15 min N nebo W | 15 min | Feinberg & Floyd 1979 |
| F4 | 1. REMP: ≥ 1 epocha a začátek ≥ 45 min po S0. Dřívější REM označ „neobvyklé, spíš chyba zařízení“. Nediagnostikovat. | 5 / 1 min, 45 min | F&F bez minima; `presnost_nositelne_elektroniky.md` 3.9 |
| F5 | Další REMP ≥ 10 min (5min data) nebo ≥ 5 min (minutová). Kratší úseky patří do NREMP. | 10 / 5 min | F&F 5 min; jádra < 10 min z 5min dat nespolehlivá |
| F6 | NREMP > 120 min bez bdění rozděl u první epochy D po ≥ 12 min bez D. Výsledek je „cyklus bez REM“ s nízkou jistotou. | 120, 12 min | Blume & Cajochen 2021; Jenni & Carskadon 2004; Rudzik 2020 |
| F7 | Bdění ≥ 20 min označ jako přerušení (WBTB nebo nespavost). Číslování cyklů pokračuje. | 20 min | Merica & Gaillard 1986 |
| F8 | Perioda na konci bez ≥ 5 min opačného stavu před probuzením je „neúplná“ | 5 min | F&F; SleepCycles |
| F9 | Cyklus k = NREMP_k + REMP_k. Reportuj i interval mezi začátky REM (ROI). | | Kishi & Van Dongen 2023 |

---

## 3. Pravděpodobnostní model REM

### 3.1 Tři úrovně, jedna datová cesta

| Úroveň | Co dělá | Kde je popsaná | Kdy ji použít |
|---|---|---|---|
| 0: REM profil | Beta-vyhlazený průměr podílu REM po 5min binech přes 28 nocí | `inovace.md`, sdílený model | První verze, plánování bez modelu |
| A: dvoustavový HMM | REM / ne-REM po 5 min, prior π(τ), spojení dvou zařízení s ρ, γ, β | `presnost_nositelne_elektroniky.md` 3.2 | MVP denního zobrazení |
| B: HSMM cyklů | Segmenty NREMP/REMP s délkami podle cyklu, osobní prior, missed-REMP pojistka, zápisy snů | tento dokument | Cílový stav. Úrovně 0 a A z něj vypadnou jako speciální případy |

Úroveň B nahrazuje heuristickou křivku π(τ) prior predictive vlastního modelu (3.6). Ta ji při výchozích parametrech reprodukuje (tabulka v 3.6). Do REM profilu úrovně 0 se místo surových štítků zapisuje posterior z úrovně B.

### 3.2 Segmenty a jejich délky

```
Pořadí segmentů (levopravý řetězec, K_max = 8):
  W0, N1, R1, W1, N2, R2, W2, …, N8, R8, W8
Typy: W0 = usínání od začátku záznamu, N = NREM perioda, R = REM perioda,
      W = dlouhé bdění ≥ 5 min (spontánní nebo WBTB)
Přechody:  W0 → N1;  N_k → R_k;  R_k → W_k s p_W(k);  R_k → N_{k+1} s 1 − p_W(k);  W_k → N_{k+1}
Konec záznamu v čase T: segment, který v T běží, je cenzurovaný,
  místo p_j(d) se použije přežití S_j(d) = P(D_j ≥ d)
Délka: p_j(d) ∝ LN(d; m_j, s_j) na [d_min, d_max], diskretizováno po Δ
```

| Segment | Medián m (min) | s (log) | Podpora (min) | Zdroj |
|---|---|---|---|---|
| W0 (usínání) | osobní, výchozí 12 | 0,7 | 0–180 | Boulos 2019 (SOL 15,4 průměr) [L/P] |
| N1 (latence REM od usnutí) | směs: 0,9 · LN(80; 0,30) + 0,1 · LN(170; 0,20) | | 15–300 | Boulos 2019: průměr 87–97 min [L]. Podíl vynechaného 1. REM 0,1 [P] |
| N_k, k ≥ 2 | 68 | 0,25 | 15–200 | Cyklus 90 min minus REMP (Rosenblum 2025; Kishi 2023) [O] |
| N_k po W_{k−1} | 35 | 0,6 | 5–200 | Krátká latence REM po probuzení (Barbato 2002), velikost [P] |
| R1 | 10 | 0,5 | Δ–60 | REM se k ránu prodlužuje (F&F 1979; Rosenblum 2025) [O/P] |
| R2, R3, R4, R5+ | 17, 22, 26, 28 | 0,5 | 5–75 | Průměr REM epizody 22–26 min (Rosenblum 2025) [O] |
| W_k | 10 | 0,8 | 5–120 | [P] |
| p_W(k) | min(0,25; 0,05 + 0,04 (k − 1)) | | | Dlouhá probuzení po REM přibývají k ránu (Barbato 2002) [P] |

**Kontrola [S].** Generativní model s těmito parametry (30 000 simulovaných nocí po 8 h) dává:
- 21,6 % REM (Boulos 2019: 19,0–21,4 %),
- 4,8 REM periody za noc (Rosenblum 2025: 4,7 ± 0,9).

**Rozšíření pro záporné kovariance cyklů (Schulz 1980).** Začátky REM period se modelují jako mřížka s chvěním, ne jako součet nezávislých délek:

```
s_k = L + (k − 1)·P + η_k,   η_k = α·η_{k−1} + ξ_k,   ξ_k ~ N(0, σ_ξ²)
α = 0 … čistě periodický proces (lag-1 korelace intervalů −0,5)
α = 1 … proces obnovy (běžný HSMM)
výchozí α = 0,5 [P], fitovat na Sleep-EDF / MESA (7.2)
```

V HSMM se to přiblíží časově nehomogenní délkou N_k, která závisí na odchylce začátku R_{k−1} od mřížky. Do stavu se přidá diskretizovaná fáze (5 košů). V simulaci [S] změnila mřížka maximum P(REMP) v pozdním okně jen z 0,30 na 0,35. Proto jde o rozšíření, ne o MVP.

### 3.3 Emise: co „vidí“ zařízení

**Mikrostav uvnitř segmentu.** Skutečná fáze v epoše t je z_t ∈ {W, N, R} s rozdělením μ_j(z):

| Segment | μ(W) | μ(N) | μ(R) | Zdůvodnění |
|---|---|---|---|---|
| W0 | 0,95 | 0,05 | 0 | |
| N_k | 0,04 | 0,94 | 0,02 | NREMP smí obsahovat bdění a < 5 min REM (F&F) |
| R_k | 0,05 | 0,10 | 0,85 | REMP smí obsahovat krátké bdění a NREM < 15 min |
| W_k | 0,90 | 0,10 | 0 | |

**Model zařízení.** C_d(o | z) je matice záměn zařízení d (řádek = skutečnost, sloupec = štítek). Výchozí hodnoty sjednocené s `presnost_nositelne_elektroniky.md` 1.4 a 3.3 (s = senzitivita REM, f = falešně pozitivní REM):

| | Oura → W | Oura → N | Oura → R | Garmin → W | Garmin → N | Garmin → R |
|---|---|---|---|---|---|---|
| skutečně W | 0,60 | 0,30 | 0,10 | 0,50 | 0,35 | 0,15 |
| skutečně N | 0,05 | 0,85 | **0,10** (f_O) | 0,05 | 0,80 | **0,15** (f_G) |
| skutečně R | 0,03 | 0,27 | **0,70** (s_O) | 0,04 | 0,46 | **0,50** (s_G) |

- Řádky W jsou [P]: zařízení řadí nehybné bdění jako spánek a Garmin bdění často i jako REM.
- Pesimistická varianta Garminu (Vivosmart 4): s_G = 0,33, f_G = 0,12.

**Korelované chyby: vazba se zachovanými marginálami.** Zobecňuje binární model z `presnost_nositelne_elektroniky.md` 3.2 na tři třídy a nikdy nedá zápornou buňku:

```
pro každé z:  a_i = C_O(i|z),  b_i = C_G(i|z),  m_i = min(a_i, b_i),  M = Σ_i m_i
  J(i,k|z)   = m_i·[i = k] + (a_i − m_i)(b_k − m_k) / (1 − M)        (maximální shoda, Fréchet)
  P_ρ(i,k|z) = (1 − ρ)·a_i·b_k + ρ·J(i,k|z),     ρ ∈ [0, 1]
Marginály P_ρ jsou přesně C_O a C_G. ρ = 0 je naivní Bayes, ρ = 1 maximální korelace.
```

**Převod ρ mezi dokumenty [O].** Pro REM při s_O = 0,70 a s_G = 0,50 platí:
- tady P(oba REM | R) = 0,35 + 0,15 ρ,
- v binárním modelu `presnost_nositelne_elektroniky.md` 0,35 + 0,229 ρ′.

Pro ne-REM (f_O = 0,10, f_G = 0,15) vychází 0,015 + 0,085 ρ vs 0,015 + 0,107 ρ′. Výchozí ρ′ = 0,3 tedy odpovídá **ρ ≈ 0,4**.

**Emise epochy:**

```
P(o_t | z) = Σ_{a,b} φ^O_t(a)·φ^G_t(b)·P_ρ(a, b | z) · P(a_t | z)
  když chybí zařízení d, jeho φ^d_t se vynechá (marginalizace)
  P(a_t = jisté bdění | z) = 0,99 pro z = W, jinak 0,01
e_j(t) = [ Σ_z μ_j(z)·P(o_t | z) ]^γ
  γ = 0,5 na 5min epochu (z `presnost_nositelne_elektroniky.md`), tj. 0,1 na minutu
```

**Pojistka „zařízení celou REM periodu přehlédlo“.**
- Proč: chyby zařízení jsou lokální, ale často pokrývají celou periodu. Garmin má latenci REM +16 až +30 min a krátký první REM zařízení často přehlédnou (`presnost_nositelne_elektroniky.md` 1.5).
- Pro segment R_k na [s, e]:

```
E_j(s, e) = Σ_{m_O, m_G ∈ {0,1}} w(m_O, m_G | k) · Π_{t=s..e} e_j^{(m_O, m_G)}(t)
  w = Π_d π_d(k)^{m_d} (1 − π_d(k))^{1 − m_d}
  v režimu m_d = 1 zařízení d vidí REM jako NREM: C_d(·|R) := C_d(·|N)
π_O(1) = 0,25, π_O(k ≥ 2) = 0,10;  π_G(1) = 0,50, π_G(k ≥ 2) = 0,25     [P/O]
```

- Účinek [S]: v nocích, kdy obě zařízení přehlédla pozdní REM periodu, stoupla průměrná P(REMP) uvnitř skutečné periody z 0,16 na 0,38.
- Dobře kalibrované noci to nezhoršilo (Brier 0,082 → 0,078).

**Dvojí započtení času v noci.** Oura i Garmin už používají znaky času v noci. Při zpětné inferenci se proto apriorní log-pravděpodobnosti délek a přechodů násobí **β = 0,5** a znovu normalizují (tj. p_j(d)^β). Při plánování bez dat ze zařízení je β = 1. Hodnotu β ladit na kalibraci (ECE) ve validaci.

### 3.4 Inference

Prefixové součty dovolí spočítat emisi celého segmentu v O(1):

```
C_j(t) = Σ_{u ≤ t} log e_j(u);   logE_j(s, e) = C_j(e) − C_j(s − 1)   (u R: log-součet přes 4 režimy)

Dopředu (t = 1..T):
  St_j(t) = log P(o_{1:t−1}, segment j začíná v t)
          = 0 pro j = W0, t = 1;   jinak logsumexp_{i ∈ pred(j)} [ A_i(t − 1) + log a_ij ]
  A_j(t)  = log P(o_{1:t}, segment j končí v t)
          = logsumexp_{d = d_min..min(t, d_max)} [ St_j(t − d + 1) + β·log p_j(d) + logE_j(t − d + 1, t) ]
  log Z   = logsumexp_{j, s} [ St_j(s) + β·log S_j(T − s + 1) + logE_j(s, T) ]

Dozadu:
  Bs_j(s) = log P(o_{s:T} | j začíná v s)
          = logsumexp( logsumexp_d [ β·log p_j(d) + logE_j(s, s+d−1) + Be_j(s+d−1) ],
                       β·log S_j(T−s+1) + logE_j(s, T) )
  Be_j(t) = log P(o_{t+1:T} | j končí v t) = logsumexp_{k ∈ succ(j)} [ log a_jk + Bs_k(t + 1) ]

Posterior segmentu na [s, e]:  ξ_j(s, e) = exp( St_j(s) + β·log p_j(e−s+1) + logE_j(s, e) + Be_j(e) − log Z )
Obsazenost occ_j(t) se sečte rozdílovým polem (+ξ v s, −ξ v e+1).
```

**Výstupy noci:**

```
q_t        = P(REMP v t | data)     = Σ_{j ∈ R} occ_j(t)
r_t        = P(z_t = REM | data)    = Σ_j occ_j(t) · μ_j(R)·P(o_t|R) / Σ_z μ_j(z)·P(o_t|z)
on_k(s)    = P(R_k začíná v s | data);  P(R_k existuje) = Σ_s on_k(s)
off_k(e)   analogicky;  80% interval začátku a konce z kvantilů on_k, off_k
```

**Vzorky cest (FFBS):**
1. Vyber poslední cenzurovaný segment a jeho začátek úměrně exp(St + log S + logE).
2. Pak zpětně předchůdce a jeho délku.
3. Opakuj 200×.

Ze vzorků se spočítají souhrny noci s nejistotou:
- latence REM L_n = začátek R1 − začátek N1,
- intervaly mezi začátky REM ROI_k,
- délky REMP D_k,
- „vynechaný 1. REM“ (N1 > 150 min).

Viterbiho cesta (MAP) slouží jen k jednomu hladkému „nejpravděpodobnějšímu hypnogramu“ v detailu, nikdy jako fakt.

### 3.5 Osobní prior: hierarchický model populace → člověk → noc

Pro každý parametr θ (na log škále) platí model místní úrovně (Kalmanův filtr):

```
θ_{u,n} = μ_pop + b_{u,n} + βᵀx_n + e_{u,n},   e ~ N(0, σ_w²)       noc n uživatele u
b_{u,n} = b_{u,n−1} + ω_n,   ω ~ N(0, q)                             pomalý drift
start: b = 0, P = τ²

po noci n (y_n, v_n = průměr a rozptyl θ z 200 vzorků FFBS):
  P⁻ = P + q
  R_n = σ_w² + v_n;   když |y_n − μ_pop − βᵀx_n − b|² > 9 (P⁻ + R_n), R_n ← 4 R_n   (odlehlá noc)
  K  = P⁻ / (P⁻ + R_n)
  b  = b + K·(y_n − μ_pop − βᵀx_n − b);   P = (1 − K)·P⁻

prior pro další noc:  θ ~ N(μ_pop + b + βᵀx, σ_w² + P)   → m_j = exp(·), s_j = √(σ_w² + P + s_cyklus²)
```

| θ | μ_pop | τ (mezi lidmi) | σ_w (mezi nocemi) | Zdroj |
|---|---|---|---|---|
| log latence REM L | log 80 | 0,15 | 0,25 | Boulos 2019; ICC ≈ 0,26 zvoleno podle ICC 0,32 délky cyklu (Kishi 2023) [O/P] |
| log medián N_k (k ≥ 2) | log 68 | 0,065 | 0,10 | Kishi 2023: SD mezi lidmi 5,8 min, rozptyl mezi nocemi 73,4 min² při ROI 91,6 min [O] |
| cyklus od cyklu (uvnitř noci) | 0,22, neučí se | | | SD-ROI 19,3 min, ICC 0,02 (Kishi 2023) [O] |
| log škála REMP (násobí mediány R_k) | 0 | 0,20 | 0,25 | [P] |
| log SOL | log 12 | 0,4 | 0,6 | Boulos 2019 [O/P] |
| π_skip (vynechaný 1. REM) | Beta(2, 18) | | | aktualizace Beta(2 + Σ p_n, 18 + Σ (1 − p_n)) [P] |
| drift q | 0,0005 za noc | | | odpovídá pomalé změně za měsíce [P] |

**Shrnutí (shrinkage).** Váha vlastních dat po n nocích u délky cyklu je n τ² / (n τ² + σ_w²) [O]:
- 1 noc: 0,30,
- 5 nocí: 0,68,
- 14 nocí: 0,86.

**Kovariáty x_n** (koeficienty β s priorem a učením ve stejném filtru jako rozšířený stav):
- **Posun ulehnutí v hodinách proti osobnímu mediánu:** při pozdějším ulehnutí kratší latence REM, prior β ~ N(−0,08; 0,05²) na hodinu (směr: Czeisler 1980; Dijk & Czeisler 1995, velikost [P]).
- **Alkohol:** delší latence REM, prior +0,2 ± 0,15 (Ebrahim 2013, velikost [P]).
- **Noc s WBTB:** jen přes segment W_k a zkrácenou N_{k+1}, ne přes θ.
- **Z učení vyřadit:** noci se štítkem nemoc, cestování a léky ovlivňující REM. Noci s nízkou kvalitou dat (2.4) také.

**Parametry zařízení:**
- **ρ** volit každý týden z mřížky {0; 0,2; 0,4; 0,6} podle součtu log Z přes posledních 28 nocí s oběma zařízeními (aspoň 7 nocí). Prior preferuje 0,4. V simulaci [S] měla marginální věrohodnost maximum u skutečné hodnoty vazby (ρ = 0,5) v obou scénářích.
- **Matice záměn** se z dat uživatele bez referenční noci neučí. Model latentních tříd není bez silných priorů identifikovatelný (`presnost_nositelne_elektroniky.md` 3.6).
- **Výjimka:** EEG referenční noc nebo úpravy typu Dawid–Skene s Dirichletovým priorem (200 pseudopočtů), omezené na ±0,1 od výchozích hodnot.
- **Změna verze algoritmu** (`sleep_algorithm_version`, verze Garmin Connect) vrací ρ na výchozí hodnotu. Osobní θ se nemažou, jen se P zvětší 2×.

### 3.6 Prior predictive: odhad výskytu REM bez dat dané noci

Pro plánování (budík, podněty) a pro prázdný stav se ze simulovaných nocí počítá:

```
π(t) = P(REMP v t), t = minuty od usnutí
π₅(t) = P(REMP v t a běží už ≥ 5 min)
M = 2000 simulovaných nocí z osobního prioru, β = 1
```

| Čas od usnutí (h) | 1 | 1,5 | 2 | 2,5 | 3 | 3,5 | 4 | 4,5 | 5 | 5,5 | 6 | 6,5 | 7 | 7,5 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| π(t), výchozí populace [S] | 0,09 | 0,16 | 0,10 | 0,20 | 0,24 | 0,20 | 0,25 | 0,28 | 0,27 | 0,27 | 0,30 | 0,31 | 0,30 | 0,31 |
| π(τ) heuristika z `presnost_nositelne_elektroniky.md` | 0,15 | 0,15 | 0,18 | 0,18 | 0,22 | 0,22 | 0,26 | 0,26 | 0,30 | 0,30 | 0,33 | 0,33 | 0,33 | 0,33 |

**Čtení tabulky:**
- Model reprodukuje heuristiku a navíc má vlny prvních dvou cyklů (vrchol kolem 1,5 a 3 h, údolí kolem 2 h).
- Od 4 h je fáze rozmazaná. Plyne to z variability 19 min na cyklus, ne z chyby modelu.
- **Osobní prior zúží hlavně první dva cykly.** Pozdní okno zůstane kolem 0,3 i při dokonale známých osobních průměrech [S]: v simulaci bez rozptylu mezi lidmi vyšlo maximum 0,35 místo 0,34.
- Nejistota usnutí (kotva „Jdu spát“ + medián SOL) maximum téměř nemění (0,31) [S].

---

## 4. Ruční záznamy a jejich použití

### 4.1 Datový model záznamu

| Pole | Hodnoty | Účel |
|---|---|---|
| `tMin` | čas probuzení se snem (UTC) | střed jádra |
| `timeSource` | `nocVAppce` (razítko zápisu), `budik` (čas budíku WBTB), `ranoPresne`, `ranoZhruba`, `ranoNevim` | σ_T a posun δ |
| `recalled` | sen / bez snu (bílý sen se počítá jako „bez snu“) | směr svědectví |
| `quality` | 0–10 | síla svědectví |
| `lucid` | ano / ne | síla svědectví |
| `falseAwakening` | ano / ne | jen pro statistiku, do modelu ne |

**Nejistota času** (sladěno s `inovace.md`, SIGMA):

| `timeSource` | δ (min, o kolik dřív bylo probuzení) | σ_T (min) |
|---|---|---|
| `budik` | 0 | 1 |
| `nocVAppce` | 2 | 3 |
| `ranoPresne` | 0 | 5 |
| `ranoZhruba` | 0 | 20 |
| `ranoNevim` | 0 | 60 |

**Doporučení pro UI ranního zápisu:** přidat rychlou volbu **„Probudil jsem se, ale nic si nepamatuju“** s časem. Negativní záznamy (a každý budík WBTB s odpovědí sen / bez snu) udělají ze slabého svědectví měřitelné. Bez nich nejde Λ kalibrovat (4.3).

### 4.2 Věrohodnost záznamu

```
ℓ_r(cesta) = Σ_τ w_r(τ) · λ_r(τ | cesta)
  w_r(τ) = N(τ; T_r − δ_r, σ_r²), normováno na mřížce noci (Σ_τ w_r = 1)
  λ_r(τ | cesta) = Λ_r   když v τ běží REMP, nebo REMP skončila nejvýš λ_d = 5 min před τ
                 = 1     jinak
Sen:     Λ_r = min(10, Λ_0 · exp(β_q·(q_r − 5)/5) · Λ_L^{lucid})
Bez snu: Λ_r = Λ_0⁻
```

| Parametr | Výchozí | Rozsah | Zdroj |
|---|---|---|---|
| Λ_0 | 2,0 | 1,4–3 | 0,82 / 0,43 = 1,9 (Nielsen 2000). Novější 0,83 / 0,60 = 1,4 (Stucky 2025). Dlouhá probuzení jsou častěji z REM (Barbato 2002). [O] |
| Λ_0⁻ (bez snu) | 0,4 | 0,3–0,5 | (1 − 0,82) / (1 − 0,43) = 0,32; se Stucky 2025 0,41 [O] |
| β_q | 0,4 | 0–0,8 | q = 10 → ×1,49, q = 0 → ×0,67. NREM zprávy bývají kratší a méně snové (Nielsen 2000). [P] |
| Λ_L | 3 | 2–5 | LD převážně v REM (LaBerge 1981; Baird 2019), ale ne výhradně (Stumbrys & Erlacher 2012) [P] |
| λ_d | 5 min | 3–10 | Vybavení po konci REM klesá během minut (Dement & Kleitman 1957) [L, sekundárně] |
| strop Λ | 10 | | Ochrana proti přebití dat zařízení jedním zápisem [P] |

**Přesný výpočet: rozšíření stavu o příznak.**
- Ke každému segmentu se přidá příznak c ∈ {0, 1} („probuzení r už nastalo“).
- V segmentu j na [s, e] může cesta buď c zachovat (faktor 1), nebo přejít 0 → 1 s faktorem:

```
F_j(s, e) = Σ_{τ = s..e} w_r(τ) · λ_j(τ − s)
  pro R:                 Λ·(W(e) − W(s−1))
  pro segment po REMP:   Λ·(W(min(e, s−1+λ_d)) − W(s−1)) + (W(e) − W(min(e, s−1+λ_d)))
  jinak:                 W(e) − W(s−1)
  W(t) = Σ_{u ≤ t} w_r(u)   (prefixový součet, výpočet v O(1))
Na konci noci se vyžaduje c = 1.
```

- Výsledek je přesně ℓ_r a cena je jen ×2 stavů.
- Více záznamů za noc: čítač c ∈ {0..R} podle pořadí časů, nejvýš jedna událost na segment. Dva zápisy z jedné REMP jsou vzácné, a když nastanou, slučují se.

**Záložní aproximace (MVP):** logaritmický pool e_j(t) ← e_j(t) · λ_j(t)^{w_r(t)}.
- Pro malé σ_T je přesný.
- Pro velké σ_T rozprostře svědectví do jádra a je mírně slabší.
- V simulaci [S] (Λ = 3, σ = 10 min) zvýšil průměrnou P(REMP) uvnitř REM periody, kterou obě zařízení přehlédla, z 0,38 na 0,43. U lucidního zápisu (Λ = 9) na 0,49.

**Jisté bdění.** Zápis v noci v appce (`nocVAppce`) navíc dává jisté bdění v epoše zápisu (a_t). Ranní odhad ne.

### 4.3 Učení ze záznamů

1. **Osobní parametry** se aktualizují samy: zápis změní posterior hranic REM period dané noci, tedy i vzorky FFBS, ze kterých se počítá y_n (3.5).
2. **Kalibrace Λ** (po ≥ 30 záznamech včetně „bez snu“):
   - Pro každý záznam spočítej p_r = P(REMP⁺ v τ | data bez záznamu r). REMP⁺ je REMP plus 5 min po konci, integrováno přes jádro w_r.
   - Model vybavení je směs se známými vahami:

```
P(y_r | p_r) = p_r · ρ_R^{y_r} (1 − ρ_R)^{1 − y_r} + (1 − p_r) · ρ_N^{y_r} (1 − ρ_N)^{1 − y_r}
y_r = 1 sen, 0 bez snu
priory:  ρ_R ~ Beta(16,4; 3,6) (průměr 0,82),  ρ_N ~ Beta(8,6; 11,4) (průměr 0,43)   (Nielsen 2000, síla 20 pseudopočtů)
EM nebo mřížka → Λ_0 = ρ_R / ρ_N,  Λ_0⁻ = (1 − ρ_R) / (1 − ρ_N)
```

   - Identifikovatelnost dává rozptyl p_r. Budíky WBTB v různých částech noci jsou proto cenné.
   - Λ_0 omezit na [1,2; 4].
3. **Vlastní stopy:** z kvality q a lucidity se neučí nic jiného než β_q a Λ_L, a to až po ≥ 50 záznamech.

### 4.4 Chytré probuzení do snu (WBTB)

**Brána** (pravidla obsahu a `inovace.md`):
- od 15. dne programu,
- nejvýš 2× za 7 dní a nikdy dvě noci po sobě,
- jen po dobré noci: zelená v „Jak ses vyspal“ (ne po žluté ani červené), ne při spánkovém dluhu (spánek předchozí noci < 6 h, pokud je znám),
- ne se štítkem nemoc nebo alkohol,
- uživatel musí chtít.

**Algoritmus:**

```
1. S0 = čas „Jdu spát“ + osobní medián SOL; při opětovném otevření appky do 2 h S0 posunout
2. M = 2000 nocí z osobního prior predictive (3.6), β = 1
3. pro t ∈ [S0 + 270, min(S0 + 390, plánované vstávání − 90)] min:
       π₅(t) = P(REMP běží v t a trvá už ≥ 5 min)
4. t* = argmax_t [ π₅(t) − κ·|t − (S0 + 300)| ],  κ = 0,0003 za min
       (mírná preference 5 h podle praxe NALDIS/ILDIS; větší κ by zisk z modelu vynulovalo:
        rozdíl π₅ mezi 5 h a 6,5 h je jen asi 0,04)
5. budík t*, okno nejistoty = 80% interval začátku REMP, která t* pokrývá
6. ráno po synchronizaci: q(t*) z posterioru + odpověď sen / bez snu → záznam typu `budik` (4.1)
```

Podmínka „vstávání − 90 min“ nechává po návratu do postele čas na pozdní REM, kvůli kterému se WBTB dělá. Při výchozích parametrech model obvykle zvolí 6–6,5 h po usnutí. Odpovídá to naznačení, že pozdější přerušení vychází lépe než 4,5 h (Erlacher 2022, jen mezistudiové srovnání).

**Co od toho čekat [S]:**

| Strategie | P(REM perioda při budíku) | Očekávané vybavení snu (0,43 + 0,39·P) |
|---|---|---|
| Pevně 5 h po usnutí | 0,27 | 0,53 |
| Nejlepší čas z prioru (≈ 6,3 h) | 0,31 | 0,55 |
| Kdyby byl znám konec předchozí REMP téže noci (nedostupné) | 0,50 | 0,62 |

**Důsledky:**
1. Hlavní hodnotu nedává přesné zasažení REM. Dávají ji:
   - kotva na skutečné usnutí místo ulehnutí,
   - pozdní část noci, kde je REM nejvíc a skoro žádný hluboký spánek,
   - brána spánku,
   - měření vlastního efektu.
   Text v appce podle toho (6.4).
2. Laboratorní varianta (buzení po 10–15 min nepřerušeného REM kolem 6 h; Erlacher & Stumbrys 2020) doma bez živých dat nejde. Nesmí se slibovat.
3. **Experimentálně, mimo MVP:** živý odhad z hodinek (vlastní aplikace Connect IQ na Garminu se srdečním tepem a pohybem) by mohl dát informaci z téže noci. Validace neexistuje a dopad na baterii a schválení je neznámý.
4. **Mikrorandomizace v Osobní laboratoři:** na povolených nocích losovat t* vs pevných 5 h. Analýza je v 7.5. Po 3 měsících (~24 nocí) poznáš jen velké rozdíly.

### 4.5 Okna pro Zvukový klíč (TLR)

```
start okna = max(S0 + 6 h, konec večerního tréninku + 6 h)        (Konkoly 2024, exp. 1)
           nebo návrat do postele po WBTB + 20 min                  (krátká latence REM po probuzení, Barbato 2002; délka [P])
konec okna = plánovaný budík − 15 min
v okně: hustota podnětů ∝ π₅(t) / max π₅, nejméně 1 podnět za 60 s, když π₅(t) ≥ 0,2;
        jinak rytmus 20–40 s z protokolu
pauzy:  pohyb (akcelerometr) → 1 min;  „Probudilo mě to“ → 45 min;  strop hlasitosti a jemný režim (Konkoly 2024, exp. 2)
ráno:   přesnost podnětů = Σ_cue q(t_cue) / počet podnětů → týdenní karta a ladění okna
```

- V pozdní noci je π₅ ≈ 0,2–0,3 téměř všude. Model tedy hlavně vynechá první polovinu noci a mezeru hned po budíku.
- Podněty tak budou téměř souvislé, což odpovídá publikovanému protokolu. Je to poctivé: přesné časování do REM bez živých dat neexistuje.
- Každé „Probudilo mě to“ je jisté bdění (a_t) a zároveň hlášení k rozpočtu probuzení.

---

## 5. Výchozí parametry

| Skupina | Parametr | Výchozí | Rozsah pro citlivost | Zdroj |
|---|---|---|---|---|
| Mřížka | Δ | 5 min (1 min s 30s daty) | | Oura API [L] |
| Usnutí | trvalý spánek | 10 min, ≤ 2 min bdění | 5–15 | obdoba latence k trvalému spánku; `inovace.md` |
| Segmenty | latence REM (medián) | 80 min | 60–100 | Boulos 2019 [L/O] |
| | podíl vynechaného 1. REM | 0,10 | 0,05–0,25 | Jenni & Carskadon 2004 kvalitativně [P] |
| | NREMP k ≥ 2 (medián, s) | 68 min, 0,25 | 55–80 | Rosenblum 2025; Kishi 2023 [O] |
| | REMP R1..R5+ (medián) | 10, 17, 22, 26, 28 min | ×0,7–1,3 | F&F 1979; Rosenblum 2025 [O/P] |
| | NREMP po dlouhém bdění | 35 min, s 0,6 | 15–60 | Barbato 2002 kvalitativně [P] |
| | p_W(k) | 0,05 → 0,25 | | Barbato 2002 kvalitativně [P] |
| | min. NREMP, min. REMP (k ≥ 2), sloučení | 15, 5 (10 na 5min datech), 15 min | | F&F 1979 [L] |
| Mikrostav | μ_N(R), μ_R(R) | 0,02, 0,85 | 0–0,05, 0,75–0,95 | F&F 1979 (REMP smí obsahovat W a NREM) [P] |
| Zařízení | s_O, f_O | 0,70, 0,10 | 0,55–0,76, 0,05–0,18 | `presnost_nositelne_elektroniky.md` 3.3 |
| | s_G, f_G | 0,50, 0,15 | 0,33–0,54, 0,11–0,19 | tamtéž |
| | ρ (vazba se zachovanými marginálami) | 0,4 | 0–0,6 | ≈ ρ′ 0,3 binárně [O] |
| | γ | 0,5 na 5 min | 0,3–1 | tamtéž [P] |
| | β (zmírnění prioru) | 0,5 | 0–1 | tamtéž [P] |
| | π_miss Oura (R1, R2+) | 0,25, 0,10 | 0–0,4 | latence REM Oury −9,5 min; přehlížení 1. REM [O/P] |
| | π_miss Garmin (R1, R2+) | 0,50, 0,25 | 0,2–0,6 | latence REM Garminu +16 až +30 min [O/P] |
| Osobní prior | τ, σ_w pro L | 0,15, 0,25 | | [O/P] |
| | τ, σ_w pro N_k | 0,065, 0,10 | | Kishi 2023 [O] |
| | drift q | 0,0005 za noc | 0–0,002 | [P] |
| Zápisy | Λ_0, Λ_0⁻, β_q, Λ_L, λ_d | 2,0; 0,4; 0,4; 3; 5 min | viz 4.2 | Nielsen 2000; Stucky 2025; Dement & Kleitman 1957 |
| | σ_T | 1 / 3 / 5 / 20 / 60 min | | `inovace.md` [P] |
| WBTB | okno | 4,5–6,5 h po S0 | | zpráva *Lucidní snění 2*; Erlacher 2022 [L] |
| | penalizace vzdálenosti od 5 h (κ) | 0,0003 za min | 0–0,0005 | [P] |
| | nejpozději | plánované vstávání − 90 min | | [P] |
| TLR | start | S0 + 6 h nebo po WBTB + 20 min | | Konkoly 2024 [L]; [P] |
| Zobrazení | strop p | 0,9 | 0,8–0,9 | `presnost_nositelne_elektroniky.md` 2.1 |

---

## 6. Jak ukazovat nejistotu

Slovník a vizuální pravidla jsou v `presnost_nositelne_elektroniky.md` 2.2 a 2.4. Tady je jen to, co přidává HSMM.

### 6.1 Kategorie (stejné prahy ve všech obrazovkách)

| p (po stropu 0,9) | Slovo | Den | Noc |
|---|---|---|---|
| ≥ 0,7 | „pravděpodobně REM“ | #FF5F1F, krytí 0,9 | #FF3B2F plně |
| 0,4–0,7 | „možná REM“ | #FF5F1F, krytí 0,55 | #B3261E |
| 0,2–0,4 | „spíš ne“ | #FF5F1F, krytí 0,25 | #5A120D |
| < 0,2 | nezobrazovat, v detailu „málo pravděpodobné“ | | |

- **Slovo vždy s číslem** zaokrouhleným na desítky („pravděpodobně REM, asi 7 z 10“). Slovní pravděpodobnosti si lidé vykládají různě (Budescu 2014).
- **Noc:** jen červené odstíny na černé a bez gradientů. Tři úrovně stačí, nejistotu nese vzor (přerušovaný obrys) místo další barvy.

### 6.2 REM okno jako karta

```
OKNO REM 4 · 04:40–05:05 · POČÁTEK ±10 MIN
pravděpodobně REM (asi 7 z 10)
OURA ●  GARMIN ○  ZÁPIS ★
```

- Časy na 5 min. Okraje z 80% intervalu začátku (on_k) a konce (off_k).
- Pás q_t pod kartou. Jádro p ≥ 0,5 plnou linkou s rohovými značkami, okraj 0,3–0,5 přerušovaně.
- **Proč to tak vychází** (rozbalení karty): příspěvek zdrojů v „bodech“ (log šance ×10, zaokrouhleno):
  - populace a tvoje historie,
  - Oura,
  - Garmin,
  - tvůj zápis.
  Počítá se opakovaným během bez daného zdroje (4 běhy navíc, líně, jen po rozbalení).
  Text: „Nejvíc k tomu přispěla Oura a tvůj zápis ve 4:58. Garmin tu REM nevidí.“

### 6.3 Jistota noci a nejistá okna

- **Jistota noci** = 1 − průměrná binární entropie q_t přes spánek, rozdělená na vysoká / střední / nízká (prahy 0,6 a 0,4 [P]). Vedle ní ukazatel shody zařízení (κ Oura vs Garmin).
- **Citlivostní test:** okno, které se při ρ ∈ {0; 0,6} nebo γ ∈ {0,3; 1} posune o víc než 10 min, dostane štítek „NEJISTÉ“ (`presnost_nositelne_elektroniky.md` 3.9).
- **První cyklus:** nikdy „pravděpodobně“, když ho vidí jen jedno zařízení a chybí zápis. Strop p v prvních 2 h je 0,7 [P].

### 6.4 Plánování a budík

- **Pás osobní křivky π(t)** (medián a 25.–75. percentil z prior predictive). Text: „V 9 ze 14 nocí jsi měl pravděpodobné REM okno mezi 4:10 a 5:00.“
- **Budík:** „Budík 4:55, asi 6 h 10 min po usnutí. Šance, že tě zastihne v REM: asi 3 z 10. Je to nejlepší čas, který z tvých nocí umím odhadnout. Víc dnes nejde, protože prsten ani hodinky neposílají data během noci.“
- **Ráno:** „Budík zazněl ve 4:55. Podle Oury a Garminu jsi byl možná v REM (asi 5 z 10). Sen sis zapsal, to se počítá do tvé Osobní laboratoře.“
- **Kalibrační karta** (po ≥ 20 zápisech): „Když appka napíše ‚pravděpodobně REM‘, tvoje probuzení se snem tam padla v 7 z 10 případů.“ Jde o spolehlivostní diagram přeložený do vět.
- **Nikdy:** „REM začal ve 4:13“, „budík tě vzbudí v REM“, „tvůj sen byl v REM“. Viz `presnost_nositelne_elektroniky.md` 2.3.

---

## 7. Validace

### 7.1 Syntetická data (proběhlo [S])

**Nastavení:**
- Prototyp HSMM v Pythonu podle kapitoly 3 na minutové mřížce, γ = 0,2 na minutu, π_miss = 0,15 sdíleně, ρ podle řádku.
- Pravda se generuje jinak než model: úseky hlubokého spánku, krátká probuzení, spontánní dlouhá bdění.
- Zařízení mají sdílenou chybu „vzhledu“ ve 3min blocích, vlastní šum, 5min agregaci u Oury a 3min modus u Garminu.
- **Scénář B** přidává chybný prior (latence 70 min, cyklus 100 min, REM periody 1,3× delší) a epizodní korelované chyby: celá REMP přehlédnutá oběma zařízeními s p = 0,15, falešné REM úseky 10–20 min.
- 30 nocí na scénář.

| Metoda (scénář B) | Brier | AUROC | ECE |
|---|---|---|---|
| Surový štítek Oura | 0,134 | 0,775 | 0,134 |
| Surový štítek Garmin | 0,163 | 0,644 | 0,163 |
| Jen prior (HSMM bez dat) | 0,157 | 0,637 | 0,088 |
| HSMM + Oura | 0,079 | 0,927 | 0,024 |
| HSMM + Garmin | 0,097 | 0,898 | 0,040 |
| HSMM + obě, ρ = 0 (naivně) | 0,081 | 0,928 | 0,042 |
| HSMM + obě, ρ = 0,5 | **0,078** | **0,929** | **0,027** |
| HSMM + obě, ρ = 0,8 | 0,082 | 0,924 | 0,033 |

**Další výsledky:**
- **Marginální log-věrohodnost** přes 30 nocí: ρ = 0: −4800; ρ = 0,5: −4632; ρ = 0,8: −4812. Maximum je u skutečné vazby.
- **Začátky REM period** (porovnané pravidly 2.6):
  - surová Oura 0,97 falešného začátku za noc, HSMM 0,23,
  - medián chyby shodných začátků 2–3 min,
  - minuto 20–24 % (hlavně krátké první REMP).
- **Scénář A** (správný prior, jen krátké chyby): Brier Oura 0,103 → HSMM (obě, ρ = 0,5) 0,053, ECE 0,103 → 0,017.
- **Výkon:** 0,6 s na noc v neoptimalizovaném Pythonu.

**Limity:** chyby zařízení jsou simulované podle předpokladů z kapitoly 3. Skutečné chyby mohou být delší a závislé na fyziologii. Čísla ukazují, že model funguje správně a které komponenty pomáhají. Neukazují, jak přesný bude na skutečných datech.

**Další syntetické testy:**
1. Pravda z jiného generátoru: Markovův řetězec podle Kemp & Kamphuisen 1986 a varianta s periodickou mřížkou (α = 0).
2. Chybně zadané parametry zařízení (±0,15 u s a f) a ρ (0 vs 0,6): citlivost Brier/ECE.
3. Záznamy snů simulovat z pravdy:
   - probuzení na konci REMP s vybavením 0,82, z NREM 0,43,
   - časový šum podle `timeSource`.
   Kontrolovat, že kalibrace Λ (4.3) najde zadané hodnoty.
4. Noci s WBTB, chybějícím zařízením a přerušeným záznamem.

### 7.2 Polosyntetika a veřejná data

| Datová sada | Co obsahuje | K čemu |
|---|---|---|
| Sleep-EDF Expanded (PhysioNet; Kemp 2000) | PSG hypnogramy, kohorta SC má 2 noci na osobu | Populační prior cyklů (SleepCycles na 30s hypnogramech), rozptyl mezi nocemi, test osobního prioru noc 1 → noc 2 |
| MESA Sleep (NSRR; Chen 2015; Zhang 2018) | PSG + souběžná aktigrafie zápěstí, přibližně 2 000 účastníků | Populační normy podle věku, druhé „zařízení“ (aktigrafie), zobecnění (Walch 2019 na MESA testoval) |
| Walch 2019 (PhysioNet `sleep-accel`) | Apple Watch zrychlení + tep z PPG, PSG štítky, 31 osob | Klasifikátor tepu a pohybu jako „zařízení podobné Ouře/Garminu“; test spojení s reálnými autokorelovanými chybami |
| DREAMT (PhysioNet v2.2.0, omezený přístup; Wang 2024) | Empatica E4 (BVP, EDA, teplota, zrychlení) + PSG, 100 pacientů spánkové poradny | Druhé zařízení s jinými senzory, populace s apnoe (robustnost), výpočet ρ mezi dvěma klasifikátory |
| MNC, BOAS (použité v Akhavan 2026) | PSG z více kohort | Statistika REM period po decilech noci, sekvenční cykly |

**Polosyntetický protokol:**
1. Pravda = skutečný PSG hypnogram (Sleep-EDF, MESA).
2. Zařízení:
   - (a) simulátor s chybovými režimy (minutový šum, přehlédnutá REMP, falešný REM, zpoždění prvního REM) kalibrovaný na `presnost_nositelne_elektroniky.md` 1.4,
   - (b) skutečné klasifikátory natrénované na Walch/MESA/DREAMT.
3. Výstup zařízení agregovat na 5 min jako Oura.
4. Zápisy snů simulovat z pravdy (7.1, bod 3).

### 7.3 Metriky

- **Po epochách** (q_t a r_t vs PSG):
  - Brierovo skóre a skill vůči nejlepšímu surovému štítku a vůči prioru,
  - log-skóre,
  - AUROC a AUPRC (REM je asi 20 %),
  - spolehlivostní diagram a ECE (10 košů).
- **Po REM periodách:**
  - párování REMP s IoU ≥ 0,3,
  - F1 period,
  - absolutní chyba začátku a konce (medián, podíl do 10 min),
  - pokrytí 80% intervalů (cíl 0,75–0,85),
  - chyba počtu cyklů,
  - chyba latence REM.
- **Po rozhodnutích** (offline vyhodnocení politiky na datech s více nocemi):
  - P(REMP při budíku) pro t* vs pevných 5 h,
  - přesnost podnětů TLR (podíl podnětů v PSG REM) vs „vše po 6 h“,
  - počet podnětů v hlubokém spánku.
- **Po nocích:** chyba REM minut (jen jako kontrola, v UI se neukazuje přesně).

### 7.4 Ablace

| Varianta | Co se odstraní | Otázka |
|---|---|---|
| A0 | Model, jen surové štítky + pravidla 2.6 | Kolik dává pravděpodobnostní vrstva |
| A1 | HSMM → dvoustavový HMM (úroveň A) | Kolik dává explicitní délka a struktura cyklu |
| A2 | Bez osobního prioru (jen populace) | Hodnota učení, po 1, 5, 14, 28 nocích |
| A3 | ρ = 0 vs odhad | Cena naivního spojení (překalibrování) |
| A4 | γ = 1 | Cena ignorované autokorelace |
| A5 | Bez π_miss | Robustnost k přehlédnutým periodám |
| A6 | Bez zápisů snů / přesné rozšíření vs log-pool | Hodnota zápisů a aproximace |
| A7 | Jen Oura, jen Garmin, obě | Hodnota druhého zařízení |
| A8 | Oura 5 min vs 30 s | Hodnota jemnějšího rozlišení |
| A9 | β ∈ {0,5; 1} | Dvojí započtení času v noci |
| A10 | Mřížka cyklů (α = 0,5) vs obnova | Má smysl rozšíření ze Schulz 1980? |

### 7.5 N-of-1 u uživatele

1. **Zápisy vynechané jeden po druhém:**
   - Pro každý zápis r spočítej p_r z dat bez něj a základní míru b_r = průměr q_t v okně ±2 h kolem T_r.
   - Statistiky:
     - průměr log(p_r / b_r),
     - podíl zápisů s p_r > b_r,
     - beta-binomický „zásah“ h = podíl zápisů, kde p_r > 0,5, s priorem Beta(1, 1).
   - Příklad výpočtu [S]: 12 zásahů z 20 dává P(h > 0,3) = 0,997 a 95% interval 0,38–0,78. 9 z 20 dává 0,93.
   - **Očekávání:** zápisy se snem mají vyšší p_r než zápisy „bez snu“ (`presnost_nositelne_elektroniky.md` 3.9). Opak signalizuje chybu dat (posun hodin, špatná časová zóna) nebo modelu.
2. **Kalibrace na vlastních datech:** spolehlivostní diagram q_t v čase probuzení vs y_r (sen / bez snu). Po přepočtu přes ρ_R a ρ_N jde o nepřímou kalibraci.
3. **Mikrorandomizovaný budík (Osobní laboratoř):**
   - Na povolených nocích losovat t* nebo pevných 5 h. Výsledek: vybavení snu při budíku a jeho kvalita.
   - Beta-binomický model a rozdíl ramen [S]:

     | Nocí na rameno | Skutečně | Medián P(t* lepší) | P(posterior > 0,95) |
     |---|---|---|---|
     | 8 | 0,60 vs 0,40 | 0,82 | 0,17 |
     | 12 | 0,60 vs 0,40 | 0,80 | 0,21 |
     | 24 | 0,60 vs 0,40 | 0,92 | 0,42 |
     | 24 | 0,80 vs 0,45 | 0,99 | 0,83 |

   - Při rozdílu, který model skutečně předpovídá (≈ 2 p. b.), se nic neprokáže. To je správně a appka to má říct („zatím nevíme“).
4. **Kontrola driftu:** posun mediánu latence REM nebo délky cyklu o > 2 SD za 14 dní ukáž jako změnu („Poslední dva týdny první REM přichází později. Mohla se změnit verze algoritmu, léky, alkohol nebo režim.“). Nediagnostikovat.

### 7.6 Kritéria pro nasazení úrovně B

Na polosyntetice a na Walch/DREAMT/MESA (držené stranou):
1. ECE ≤ 0,05.
2. Brier skill ≥ 0,25 vůči nejlepšímu surovému štítku.
3. Pokrytí 80% intervalů začátku REMP 0,75–0,85.
4. Medián chyby začátku REMP (k ≥ 2) ≤ 10 min.
5. Falešné REMP < 0,5 za noc.
6. Žádné zhoršení proti úrovni A v žádné ablaci.

U prvních 20 uživatelů: medián log(p_r / b_r) > 0 po 30 dnech.

---

## 8. Pseudokód (Dart) a výpočetní náročnost

```dart
import 'dart:math';
import 'dart:typed_data';

const int W = 0, N = 1, R = 2;
const double NEG = double.negativeInfinity;
enum SegType { w0, n, r, w }

class Seg { final SegType type; final int k; const Seg(this.type, this.k); }

double lse(double a, double b) {
  if (a == NEG) return b;
  if (b == NEG) return a;
  final m = max(a, b);
  return m + log(exp(a - m) + exp(b - m));
}

class Params {
  // matice záměn [z][o] pro W, N, R (kap. 3.3)
  List<List<double>> cO = [[.60,.30,.10],[.05,.85,.10],[.03,.27,.70]];
  List<List<double>> cG = [[.50,.35,.15],[.05,.80,.15],[.04,.46,.50]];
  double rho = 0.4, gammaPerEpoch = 0.5, betaPrior = 0.5;
  List<double> piMissO = [0.25, 0.10], piMissG = [0.50, 0.25]; // [R1, R2+]
}

/// Sdružená emise P(o_t | z) se zachovanými marginálami (kap. 3.3).
double jointLik(Float64List? fO, Float64List? fG, List<double> a, List<double> b, double rho) {
  if (fO == null && fG == null) return 1.0;
  if (fG == null) return fO![0]*a[0] + fO[1]*a[1] + fO[2]*a[2];
  if (fO == null) return fG[0]*b[0] + fG[1]*b[1] + fG[2]*b[2];
  final m = [min(a[0], b[0]), min(a[1], b[1]), min(a[2], b[2])];
  final mm = m[0] + m[1] + m[2];
  var s = 0.0;
  for (var i = 0; i < 3; i++) {
    for (var k = 0; k < 3; k++) {
      final jMax = (i == k ? m[i] : 0.0) + (mm < 1 ? (a[i]-m[i])*(b[k]-m[k])/(1-mm) : 0.0);
      s += fO[i] * fG[k] * ((1 - rho) * a[i] * b[k] + rho * jMax);
    }
  }
  return s;
}

class Hsmm {
  final List<Seg> segs; final int T;
  final List<Float64List> logP;      // [j][d-1], už × beta a normováno
  final List<Float64List> logS;      // přežití [j][d-1]
  final List<int> dMin, dMax;
  final List<List<(int, double)>> pred, succ; // (index, log a_ij)
  // prefixové součty log emisí: [mode 0..3][typ segmentu][t]
  late List<List<Float64List>> cum;
  late List<Float64List> logModeW;       // [k 0/1][mode] váhy režimů přehlédnutí
  late List<Float64List> a, st, be, bs;
  late double logZ;
  Hsmm(this.segs, this.T, this.logP, this.logS, this.dMin, this.dMax, this.pred, this.succ);

  double segE(int j, int s, int e) {         // log emise segmentu j na [s, e], 1-indexováno
    final ty = segs[j].type.index;
    if (segs[j].type != SegType.r) return cum[0][ty][e] - cum[0][ty][s - 1];
    final kk = segs[j].k == 1 ? 0 : 1;
    var acc = NEG;
    for (var mode = 0; mode < 4; mode++) {
      acc = lse(acc, logModeW[kk][mode] + cum[mode][ty][e] - cum[mode][ty][s - 1]);
    }
    return acc;
  }

  void forward() {
    final J = segs.length;
    a  = List.generate(J, (_) => Float64List(T + 1)..fillRange(0, T + 1, NEG));
    st = List.generate(J, (_) => Float64List(T + 2)..fillRange(0, T + 2, NEG));
    st[0][1] = 0.0;
    for (var t = 1; t <= T; t++) {
      for (var j = 1; j < J; j++) {
        var acc = NEG;
        for (final (i, la) in pred[j]) { acc = lse(acc, a[i][t - 1] + la); }
        st[j][t] = acc;
      }
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        final dHi = min(t, dMax[j]);
        for (var d = dMin[j]; d <= dHi; d++) {
          final s = t - d + 1;
          if (st[j][s] == NEG) continue;
          acc = lse(acc, st[j][s] + logP[j][d - 1] + segE(j, s, t));
        }
        a[j][t] = acc;
      }
    }
    logZ = NEG;
    for (var j = 0; j < J; j++) {
      for (var s = max(1, T - dMax[j] + 1); s <= T; s++) {
        if (st[j][s] == NEG) continue;
        logZ = lse(logZ, st[j][s] + logS[j][T - s] + segE(j, s, T));
      }
    }
  }

  void backward() {
    final J = segs.length;
    be = List.generate(J, (_) => Float64List(T + 1)..fillRange(0, T + 1, NEG));
    bs = List.generate(J, (_) => Float64List(T + 2)..fillRange(0, T + 2, NEG));
    for (var t = T; t >= 1; t--) {
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        final eHi = min(T, t + dMax[j] - 1);
        for (var e = t + dMin[j] - 1; e <= eHi; e++) {
          if (be[j][e] == NEG) continue;               // konec přesně v T pokrývá přežití níže
          acc = lse(acc, logP[j][e - t] + segE(j, t, e) + be[j][e]);
        }
        final dc = T - t + 1;                          // cenzurovaný běh do konce
        if (dc <= dMax[j]) acc = lse(acc, logS[j][dc - 1] + segE(j, t, T));
        bs[j][t] = acc;
      }
      for (var j = 0; j < J; j++) {
        var acc = NEG;
        for (final (k, la) in succ[j]) { acc = lse(acc, la + bs[k][t]); }
        be[j][t - 1] = acc;
      }
    }
  }

  /// q_t = P(REMP v t) a začátky REMP; rozdílové pole přes páry (s, e).
  (Float64List, List<Float64List>) posteriorRem() {
    final q = Float64List(T + 2);
    final onsets = <Float64List>[];
    for (var j = 0; j < segs.length; j++) {
      if (segs[j].type != SegType.r) continue;
      final on = Float64List(T + 1);
      for (var s = 1; s <= T; s++) {
        if (st[j][s] == NEG) continue;
        final eHi = min(T, s + dMax[j] - 1);
        for (var e = s + dMin[j] - 1; e <= eHi; e++) {
          final p = exp(st[j][s] + logP[j][e - s] + segE(j, s, e) + be[j][e] - logZ);
          on[s] += p; q[s] += p; q[e + 1] -= p;
        }
        final dc = T - s + 1;
        if (dc <= dMax[j]) {
          final p = exp(st[j][s] + logS[j][dc - 1] + segE(j, s, T) - logZ);
          on[s] += p; q[s] += p; q[T + 1] -= p;
        }
      }
      onsets.add(on);
    }
    for (var t = 1; t <= T; t++) { q[t] += q[t - 1]; }
    return (q, onsets);
  }
}

/// Osobní parametr: model místní úrovně (kap. 3.5).
class LocalLevel {
  final double muPop, sigmaW, q; double b = 0, P;
  LocalLevel(this.muPop, double tau, this.sigmaW, this.q) : P = tau * tau;
  void update(double y, double v) {
    final pm = P + q; var rn = sigmaW * sigmaW + v;
    final innov = y - muPop - b;
    if (innov * innov > 9 * (pm + rn)) rn *= 4;      // odlehlá noc
    final k = pm / (pm + rn);
    b += k * innov; P = (1 - k) * pm;
  }
  double get mean => muPop + b;
  double get sd => sqrt(sigmaW * sigmaW + P);
}

/// Budík WBTB z prior predictive (kap. 4.4). Vrací minuty po usnutí, nebo null.
int? planWbtb(bool gateOpen, List<List<(int, int)>> Function(Random, int) sampleNights, Random rng) {
  if (!gateOpen) return null;
  const lo = 270, hi = 390, m = 2000;
  final hits = Float64List(hi - lo);
  for (final night in sampleNights(rng, m)) {        // night = REM periody (start, end) v min od usnutí
    for (final (s, e) in night) {
      for (var t = max(s + 5, lo); t < min(e, hi); t++) { hits[t - lo] += 1; }
    }
  }
  var best = lo; var bestU = NEG;
  for (var t = lo; t < hi; t++) {
    final u = hits[t - lo] / m - 0.0003 * (t - 300).abs();   // κ z kap. 4.4
    if (u > bestU) { bestU = u; best = t; }
  }
  return best;
}
```

**Doplnit podle textu:**
- výpočet `cum` (kap. 3.3: μ_j, `jointLik` pro 4 režimy přehlédnutí, umocnění γ, prefixové součty),
- rozšíření o příznak záznamu (kap. 4.2),
- FFBS (kap. 3.4).

**Implementační poznámky:**
- Běh v `Isolate.run` po synchronizaci nebo při otevření záložky Spánek. Výsledek noci uložit (q_t po epochách, REMP souhrny, verze parametrů a algoritmů zařízení).
- Prořezávání: segment N_k/R_k nemůže začít dřív než (k − 1) · 40 min po začátku záznamu. Délky s p_j(d) < 1e-6 vynechat.
- Místo logaritmů lze počítat v pravděpodobnostech se škálováním po epochách (2–4× rychlejší).
- Testy:
  - Σ_j occ_j(t) = 1 pro každé t,
  - Σ_s on_k(s) ≤ 1,
  - log Z z dopředného i zpětného průchodu se shoduje na 1e-8,
  - prior predictive dává 21 ± 2 % REM.

**Výpočetní náročnost** (T epoch, J ≈ 25 segmentů, D̄ průměrná šířka podpory délek):

| Konfigurace | T | Operace na průchod (≈ T·J·D̄) | Celkem (dopředu, dozadu, posterior, 4 režimy R, 1 záznam ×2) | Odhad na telefonu (Dart AOT) |
|---|---|---|---|---|
| 5 min, 10 h | 120 | 120 · 25 · 30 ≈ 90 tis. | ≈ 1 mil. logsumexp | < 30 ms |
| 1 min, 10 h | 600 | 600 · 25 · 150 ≈ 2,3 mil. | ≈ 20 mil. | 0,2–0,5 s |
| FFBS 200 vzorků | | 200 · T · D̄ | 0,7–20 mil. | < 0,3 s |
| Plánování (2000 nocí) | | 2000 · ~12 segmentů | ≈ 25 tis. vzorků | < 20 ms |
| „Proč to tak vychází“ (4 běhy navíc) | | | 4× konfigurace | na vyžádání |

- **Paměť:** 4 pole J × T doubles + prefixové součty ≈ 0,1 MB (5 min) až 1 MB (1 min).
- **Baterie:** zanedbatelná, jeden běh denně.
- **Referenční prototyp** v Pythonu (minutová mřížka, smyčky v Pythonu) běžel 0,6 s na noc [S].

---

## 9. Rizika a otevřené otázky

1. **Parametry zařízení jsou nejistější než model.** Oura Gen4/Ring 5 a současné Garminy nemají PSG validaci fází (`presnost_nositelne_elektroniky.md` 4). Celý výstup je podmíněný maticemi záměn. Citlivostní analýza a štítek „NEJISTÉ“ jsou povinné.
2. **Časování jednotlivých REM period nikdo nevalidoval.** Kritéria 7.6 se proto musí ověřit na polosyntetice, ne na studiích zařízení.
3. **Dvojí započtení času v noci** (β) a autokorelace (γ) se navzájem částečně zastupují. Ladit je společně na ECE, ne odděleně.
4. **ρ a Λ** jsou bez referenční noci identifikovatelné jen díky priorům a rozptylu situací. Tlačítko „bez snu“ a budíky v různých časech jsou pro učení klíčové.
5. **Populační prior neplatí:**
   - u lidí na antidepresivech (delší cykly, potlačený REM; Rosenblum 2025),
   - při práci na směny,
   - při narkolepsii (REM hned po usnutí),
   - při neléčené apnoe.
   Štítky noci a široké priory pomohou, ale appka nemá nic diagnostikovat. „REM hned po usnutí“ z náramku je spíš chyba zařízení.
6. **Změny algoritmů zařízení** mohou posunout výstup bez ohlášení. Logovat verze a po změně zvětšit nejistotu.
7. **Budík do REM bez živých dat:** model ukazuje, že zisk je malý (4.4). `inovace.md` TOP 1 proto mluví o budíku „v nejpravděpodobnější části noci“, ne „když nejspíš sníš“ (upraveno při QA 23. 10. 2026).
8. **Otevřené:**
   - Vyplatí se mřížka cyklů (Schulz 1980)?
   - Pomáhá hluboký spánek ze zařízení k určení fáze cyklu?
   - Jak velké je ρ pro konkrétní pár Oura + Garmin?
   - Liší se chyby zařízení po WBTB a při MILD vleže (nehybné bdění)?

---

## 10. Zdroje

**Cykly, latence a rozložení REM**
- Feinberg I, Floyd TC (1979). Systematic trends across the night in human sleep cycles. *Psychophysiology* 16(3):283–291. doi:10.1111/j.1469-8986.1979.tb02991.x
- Blume C, Cajochen C (2021). 'SleepCycles' package for R: a free software tool for the detection of sleep cycles from sleep staging. *MethodsX* 8:101318. doi:10.1016/j.mex.2021.101318 (PMC8374325). Balík SleepCycles 1.1.4, CRAN, https://cran.r-project.org/package=SleepCycles
- Jenni OG, Carskadon MA (2004). Spectral analysis of the sleep electroencephalogram during adolescence. *Sleep* 27(4):774–783. doi:10.1093/sleep/27.4.774
- Kurth S a kol. (2010). Mapping of cortical activity in the first two decades of life: a high-density sleep EEG study. *J Neurosci* 30(40):13211–13219. doi:10.1523/JNEUROSCI.2532-10.2010
- Rudzik F a kol. (2020). Ultradian modulation of cortical arousals during sleep: effects of age and exposure to nighttime transportation noise. *Sleep* 43(7):zsz324. doi:10.1093/sleep/zsz324
- Aeschbach D, Borbély AA (1993). All-night dynamics of the human sleep EEG. *J Sleep Res* 2(2):70–81. doi:10.1111/j.1365-2869.1993.tb00065.x
- Merica H, Gaillard JM (1986). Internal structure of sleep cycles in a healthy population. *Sleep* 9(4):502–513. doi:10.1093/sleep/9.4.502
- Schulz H, Dirlich G, Balteskonis S, Zulley J (1980). The REM-NREM sleep cycle: renewal process or periodically driven process? *Sleep* 2(3):319–328. doi:10.1093/sleep/2.3.319
- Kishi A a kol. (2011). NREM sleep stage transitions control ultradian REM sleep rhythm. *Sleep* 34(10):1423–1432. doi:10.5665/sleep.1292
- Kishi A, Van Dongen HPA (2023). Phenotypic interindividual differences in the dynamic structure of sleep in healthy young adults. *Nat Sci Sleep* 15:465–476. doi:10.2147/NSS.S392038
- Le Bon O (2020). Relationships between REM and NREM in the NREM-REM sleep cycle: a review on competing concepts. *Sleep Med* 70:6–16. doi:10.1016/j.sleep.2020.02.004
- Rosenblum Y a kol. (2025). Fractal cycles of sleep, a new aperiodic activity-based definition of sleep cycles. *eLife* 13:RP96784. doi:10.7554/eLife.96784
- Akhavan N a kol. (2026). A data-driven measure of REM sleep propensity for human and rodent sleep. *Front Neurosci* 20:1844209. doi:10.3389/fnins.2026.1844209
- Ohayon MM, Carskadon MA, Guilleminault C, Vitiello MV (2004). Meta-analysis of quantitative sleep parameters from childhood to old age in healthy individuals. *Sleep* 27(7):1255–1273. doi:10.1093/sleep/27.7.1255
- Boulos MI a kol. (2019). Normal polysomnography parameters in healthy adults: a systematic review and meta-analysis. *Lancet Respir Med* 7(6):533–543. doi:10.1016/S2213-2600(19)30057-8. Tabulky 2 a 3: https://omc.ohri.ca/psgnorms
- Czeisler CA a kol. (1980). Human sleep: its duration and organization depend on its circadian phase. *Science* 210:1264–1267. doi:10.1126/science.7434029
- Dijk DJ, Czeisler CA (1995). Contribution of the circadian pacemaker and the sleep homeostat to sleep propensity, sleep structure, electroencephalographic slow waves, and sleep spindle activity in humans. *J Neurosci* 15(5):3526–3538. doi:10.1523/JNEUROSCI.15-05-03526.1995
- Barbato G, Barker C, Bender C, Wehr TA (2002). Spontaneous sleep interruptions during extended nights. *Clin Neurophysiol* 113(6):892–900. doi:10.1016/S1388-2457(02)00081-0
- Ebrahim IO, Shapiro CM, Williams AJ, Fenwick PB (2013). Alcohol and sleep I: effects on normal sleep. *Alcohol Clin Exp Res* 37(4):539–549. doi:10.1111/acer.12006

**Sny, vybavení, lucidita**
- Nielsen TA (2000). A review of mentation in REM and NREM sleep: "covert" REM sleep as a possible reconciliation of two opposing models. *Behav Brain Sci* 23(6):851–866. doi:10.1017/S0140525X0000399X
- Stucky B (2025). We are the sensors of consciousness! A review and analysis on how awakenings during sleep influence dream recall. *Nat Sci Sleep* 17:709–729. doi:10.2147/NSS.S506461
- Dement W, Kleitman N (1957). The relation of eye movements during sleep to dream activity: an objective method for the study of dreaming. *J Exp Psychol* 53(5):339–346. doi:10.1037/h0048189
- LaBerge SP, Nagel LE, Dement WC, Zarcone VP (1981). Lucid dreaming verified by volitional communication during REM sleep. *Percept Mot Skills* 52(3):727–732. doi:10.2466/pms.1981.52.3.727
- Baird B, Mota-Rolim SA, Dresler M (2019). The cognitive neuroscience of lucid dreaming. *Neurosci Biobehav Rev* 100:305–323. doi:10.1016/j.neubiorev.2019.03.008
- Stumbrys T, Erlacher D (2012). Lucid dreaming during NREM sleep: two case reports. *Int J Dream Res* 5(2):151–155.
- Erlacher D, Stumbrys T (2020). Wake up, work on dreams, back to bed and lucid dream: a sleep laboratory study. *Front Psychol* 11:1383. doi:10.3389/fpsyg.2020.01383
- Erlacher D, Furrer V, Ineichen M, Braillard J, Schmid D (2022). Combining wake-up-back-to-bed with cognitive induction techniques: does earlier sleep interruption reduce lucid dream induction rate? *Clocks Sleep* 4(2):230–239. doi:10.3390/clockssleep4020021
- Konkoly KR a kol. (2024). Provoking lucid dreams at home with sensory cues paired with pre-sleep cognitive training. *Conscious Cogn* 125:103759. doi:10.1016/j.concog.2024.103759

**Modely, spojování zdrojů, hodnocení**
- Rabiner LR (1989). A tutorial on hidden Markov models and selected applications in speech recognition. *Proc IEEE* 77(2):257–286. doi:10.1109/5.18626
- Yu SZ (2010). Hidden semi-Markov models. *Artif Intell* 174(2):215–243. doi:10.1016/j.artint.2009.11.011
- Pan ST, Kuo CE, Zeng JH, Liang SF (2012). A transition-constrained discrete hidden Markov model for automatic sleep staging. *Biomed Eng Online* 11:52. doi:10.1186/1475-925X-11-52
- Kemp B, Kamphuisen HAC (1986). Simulation of human hypnograms using a Markov chain model. *Sleep* 9(3):405–414. doi:10.1093/sleep/9.3.405
- Lo CC a kol. (2004). Common scale-invariant patterns of sleep–wake transitions across mammalian species. *PNAS* 101(50):17545–17548. doi:10.1073/pnas.0408242101
- Bianchi MT a kol. (2010). Obstructive sleep apnea alters sleep stage transition dynamics. *PLoS One* 5(6):e11356. doi:10.1371/journal.pone.0011356
- Stephansen JB a kol. (2018). Neural network analysis of sleep stages enables efficient diagnosis of narcolepsy. *Nat Commun* 9:5229. doi:10.1038/s41467-018-07229-3
- Dawid AP, Skene AM (1979). Maximum likelihood estimation of observer error-rates using the EM algorithm. *Appl Stat* 28(1):20–28. doi:10.2307/2346806
- Kim HC, Ghahramani Z (2012). Bayesian classifier combination. *AISTATS*, PMLR 22:619–627. https://proceedings.mlr.press/v22/kim12.html
- Holmes CC, Walker SG (2017). Assigning a value to a power likelihood in a general Bayesian model. *Biometrika* 104(2):497–503. doi:10.1093/biomet/asx010
- Gneiting T, Raftery AE (2007). Strictly proper scoring rules, prediction, and estimation. *J Am Stat Assoc* 102:359–378. doi:10.1198/016214506000001437
- Budescu DV, Por HH, Broomell SB, Smithson M (2014). The interpretation of IPCC probabilistic statements around the world. *Nat Clim Change* 4:508–512. doi:10.1038/nclimate2194
- Mastrandrea MD a kol. (2011). The IPCC AR5 guidance note on consistent treatment of uncertainties. *Climatic Change* 108:675–691. doi:10.1007/s10584-011-0178-6

**Nositelná elektronika a datové sady**
- Walch O, Huang Y, Forger D, Goldstein C (2019). Sleep stage prediction with raw acceleration and photoplethysmography heart rate data derived from a consumer wearable device. *Sleep* 42(12):zsz180. doi:10.1093/sleep/zsz180. Data: PhysioNet, doi:10.13026/hmhs-py35
- Wang K a kol. (2024). Addressing wearable sleep tracking inequity: a new dataset and novel methods for a population with sleep disorders. *CHIL 2024*, PMLR 248:380–396. Data DREAMT v2.2.0: PhysioNet, doi:10.13026/3f7y-2d80
- Chen X a kol. (2015). Racial/ethnic differences in sleep disturbances: the Multi-Ethnic Study of Atherosclerosis (MESA). *Sleep* 38(6):877–888. doi:10.5665/sleep.4732
- Zhang GQ a kol. (2018). The National Sleep Research Resource: towards a sleep data commons. *J Am Med Inform Assoc* 25(10):1351–1358. doi:10.1093/jamia/ocy064
- Kemp B a kol. (2000). Analysis of a sleep-dependent neuronal feedback loop: the slow-wave microcontinuity of the EEG. *IEEE Trans Biomed Eng* 47(9):1185–1194. doi:10.1109/10.867928 (Sleep-EDF)
- Altini M, Kinnunen H (2021). The promise of sleep: a multi-sensor approach for accurate sleep stage detection using the Oura ring. *Sensors* 21(13):4302. doi:10.3390/s21134302
- Studie přesnosti Oura a Garmin (Robbins 2024, Lee 2023, Schyvens 2025, Mouritzen 2020, Chinoy 2021 a další): viz `presnost_nositelne_elektroniky.md`, kapitola 5
- Oura API v2, OpenAPI specifikace 1.42 (schéma `PublicModifiedSleepModel`, `PublicSleepType`, `PublicSleepAlgorithmVersion`). https://cloud.ouraring.com/v2/docs
- Android Developers: `SleepSessionRecord` (Health Connect), konstanty `STAGE_TYPE_*`. https://developer.android.com/reference/kotlin/androidx/health/connect/client/records/SleepSessionRecord
- Notebookcheck (2025): Garmin officially reveals Google Health Connect support for wearables (spánkové fáze mezi zapisovanými typy). https://www.notebookcheck.net/Garmin-officially-reveals-Google-Health-Connect-support-for-wearables.1054577.0.html

**Interní podklady**
- *Lucidní snění, metody a aplikace 2* (ověřená zpráva): technická proveditelnost, parametry WBTB a TLR.
- `presnost_nositelne_elektroniky.md` (23. 10. 2026): parametry zařízení, slovník, vizuální specifikace, binární model ρ.
- `inovace.md` (23. 10. 2026): REM profil, Chytré probuzení do snu, Zvukový klíč, Osobní laboratoř, rozpočet probuzení.
````

### dnes_koncept.html

```html
<!doctype html>
<html lang="cs">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#04060C">
<title>Dnes · koncept</title>
<meta name="description" content="Domovská obrazovka Dnes: plán na dnešek, jak ses vyspal, připomínka, večerní záměr a start noci s nočním režimem.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#04060C;--panel:#0C1222;--panel-2:#111A30;--raise:#17213B;
  --line:rgba(233,237,245,.09);--line-2:rgba(233,237,245,.16);--line-3:rgba(233,237,245,.30);
  --text:#E9EDF5;--muted:#8D97AD;--faint:#7D879E;
  --accent:#FF5F1F;--accent-ink:#140600;--accent-soft:rgba(255,95,31,.13);--accent-line:rgba(255,95,31,.55);
  --ok:#3FD49A;--warn:#FFB443;--bad:#FF5A4E;
  --ev-strong:#5FE0B6;--ev-prom:#8DB9FF;--ev-comm:#C6AAFF;--ev-trad:#E6C17D;
  --night:#FF3B2F;--night-2:#B3261E;--night-3:#5A120D;
  --f-title:'Inter Tight','Inter Display','Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-text:'Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-mono:'JetBrains Mono',ui-monospace,'SFMono-Regular','Roboto Mono',Menlo,Consolas,monospace;
}
*{box-sizing:border-box;margin:0;padding:0}
html{background:var(--bg);-webkit-text-size-adjust:100%;color-scheme:dark}
body{background:var(--bg);color:var(--text);font:400 15px/1.5 var(--f-text);-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;font-feature-settings:"cv11","ss01";min-height:100vh}
a{color:inherit;text-decoration:none}
button{font:inherit;color:inherit;background:none;border:0;cursor:pointer}
input.sr{position:absolute;opacity:0;width:1px;height:1px;pointer-events:none}
.vh{position:absolute!important;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}
:focus-visible{outline:2px solid var(--accent);outline-offset:2px;border-radius:6px}
input.sr:focus-visible + label,input.sr:focus-visible + .lbl{outline:2px solid var(--accent);outline-offset:2px}
.tnum{font-variant-numeric:tabular-nums}

/* ---------- device frame ---------- */
.stage{position:relative}
.device{position:relative;width:100%;max-width:390px;margin:0 auto;background:var(--bg);overflow:clip;min-height:844px;isolation:isolate}
.caption{display:none}
@media (min-width:600px){
  body{background:radial-gradient(900px 600px at 50% -8%,#0E1832 0%,rgba(4,6,12,0) 70%),var(--bg);padding:48px 0 72px}
  .device{border-radius:46px;box-shadow:0 0 0 1px var(--line-2),0 0 0 10px #070A13,0 0 0 11px var(--line),0 50px 140px rgba(0,0,0,.75)}
  .caption{display:flex;justify-content:space-between;gap:16px;white-space:nowrap;max-width:390px;margin:0 auto 18px;font:500 12px/1.4 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
  .caption b{color:var(--text);font-weight:500}
}

/* ---------- status + app bar ---------- */
.sb{height:36px;display:flex;align-items:center;justify-content:space-between;padding:0 22px 0 26px;font:600 13px/1 var(--f-text);letter-spacing:.01em;position:relative;z-index:3}
.sb .ic{display:flex;gap:6px;align-items:center}
.appbar{display:flex;align-items:center;justify-content:space-between;height:52px;padding:0 8px 0 16px;position:relative;z-index:3}
.brand{display:flex;align-items:center;gap:10px}
.logo{font:700 17px/1 var(--f-title);letter-spacing:-.02em}
.logo sup{font-size:12px;color:var(--accent);margin-left:1px;vertical-align:7px}
.brand .mono{color:var(--muted)}
.ibtn{width:44px;height:44px;display:grid;place-items:center;border-radius:50%;color:var(--muted)}
.ibtn:hover{background:rgba(233,237,245,.06);color:var(--text)}

/* ---------- type ---------- */
.mono{font-family:var(--f-mono);font-size:12px;line-height:1.35;letter-spacing:.08em;text-transform:uppercase;font-weight:500}
.eyebrow{font:500 12px/1.3 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
.eyebrow .a{color:var(--accent)}
.display{font:600 34px/1.04 var(--f-title);letter-spacing:-.028em}
.h1{font:600 28px/1.08 var(--f-title);letter-spacing:-.024em}
.h2{font:600 21px/1.18 var(--f-title);letter-spacing:-.018em}
.h3{font:600 17px/1.25 var(--f-title);letter-spacing:-.01em}
.lead{font-size:16px;line-height:1.5;color:var(--text)}
.muted{color:var(--muted)}
.small{font-size:14px;line-height:1.45}
.src{font:400 12px/1.4 var(--f-mono);letter-spacing:.02em;color:var(--faint)}

/* ---------- section header ---------- */
.sh{display:flex;align-items:center;gap:10px;margin:40px 16px 14px}
.sh .n{font:500 12px/1 var(--f-mono);color:var(--accent);letter-spacing:.06em}
.sh h2{font:500 12px/1 var(--f-mono);letter-spacing:.12em;text-transform:uppercase;color:var(--text);white-space:nowrap}
.sh .rule{flex:1;height:1px;background:linear-gradient(90deg,var(--line-3),rgba(233,237,245,0))}
.sh .meta{font:500 12px/1 var(--f-mono);color:var(--muted);letter-spacing:.08em;text-transform:uppercase;white-space:nowrap}

/* ---------- panels with corner marks ---------- */
.panel{position:relative;margin:0 16px;background:linear-gradient(180deg,#0F1730 0%,var(--panel) 46%);border:1px solid var(--line);border-radius:4px;padding:16px}
.panel::after,.corners::after{content:"";position:absolute;inset:-1px;pointer-events:none;--c:var(--line-3);--k:12px;
  background:
   linear-gradient(var(--c) 0 0) 0 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 0 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/1px var(--k) no-repeat}
.panel.hot::after,.corners.hot::after{--c:var(--accent)}
.sub{background:rgba(4,6,12,.55);border:1px solid var(--line);border-radius:4px;padding:14px}
.hr{height:1px;background:var(--line);margin:16px 0}
.row{display:flex;align-items:center;gap:12px}
.between{display:flex;align-items:center;justify-content:space-between;gap:12px}

/* ---------- evidence chips ---------- */
.ev{display:inline-flex;align-items:center;gap:7px;height:24px;padding:0 8px 0 7px;border-radius:3px;font:600 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;white-space:nowrap;border:1px solid;background:rgba(255,255,255,.02)}
.ev i{display:inline-flex;gap:2px}
.ev i b{width:4px;height:9px;border-radius:1px;background:currentColor;opacity:.25}
.ev.strong{color:var(--ev-strong);border-color:rgba(95,224,182,.4);background:rgba(95,224,182,.07)}
.ev.prom{color:var(--ev-prom);border-color:rgba(141,185,255,.4);background:rgba(141,185,255,.07)}
.ev.comm{color:var(--ev-comm);border-color:rgba(198,170,255,.4);background:rgba(198,170,255,.07)}
.ev.trad{color:var(--ev-trad);border-color:rgba(230,193,125,.4);background:rgba(230,193,125,.07)}
.ev.strong i b{opacity:1}
.ev.prom i b:nth-child(-n+2){opacity:1}
.ev.comm i b:nth-child(1){opacity:1}
.ev.trad i b{width:7px;height:7px;border-radius:0;transform:rotate(45deg);opacity:1;background:none;border:1.2px solid currentColor}
.ev.trad i b+b{display:none}

/* ---------- tags & chips ---------- */
.tag{display:inline-flex;align-items:center;gap:6px;height:24px;padding:0 9px;border-radius:999px;font:500 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;color:var(--muted);border:1px solid var(--line-2);white-space:nowrap}
.tag.hot{color:var(--accent);border-color:var(--accent-line);background:var(--accent-soft)}
.tag.solid{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);font-weight:600}
.motif{display:inline-flex;align-items:center;gap:6px;height:26px;padding:0 10px 0 8px;border-radius:999px;font:500 13px/1 var(--f-text);color:var(--text);background:rgba(233,237,245,.06);border:1px solid var(--line-2);white-space:nowrap}
.motif .g{font:600 12px/1 var(--f-mono);color:var(--muted)}

/* ---------- buttons ---------- */
.btn{min-height:48px;padding:0 20px;border-radius:999px;font:600 15px/1 var(--f-text);display:inline-flex;align-items:center;justify-content:center;gap:10px;border:1px solid var(--line-2);color:var(--text);background:rgba(233,237,245,.04);transition:transform .15s ease,background .2s ease,border-color .2s;white-space:nowrap;cursor:pointer;user-select:none}
.btn:hover{background:rgba(233,237,245,.08);border-color:var(--line-3)}
.btn:active{transform:scale(.98)}
.btn.primary{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);box-shadow:0 10px 34px -8px rgba(255,95,31,.55)}
.btn.primary:hover{background:#FF7036}
.btn.ghost{border-color:transparent;background:none;color:var(--muted);padding:0 12px}
.btn.ghost:hover{color:var(--text)}
.btn.sm{min-height:44px;padding:0 16px;font-size:14px}
.btn.block{width:100%}
.lnk{display:inline-flex;align-items:center;gap:6px;min-height:44px;color:var(--accent);font:600 14px/1 var(--f-text)}
.lnk svg{transition:transform .2s}
.lnk:hover svg{transform:translateX(3px)}

/* ---------- switch ---------- */
.switch{position:relative;width:52px;height:32px;flex:none;border-radius:999px;background:rgba(233,237,245,.12);border:1px solid var(--line-2);transition:background .2s}
.switch::after{content:"";position:absolute;top:3px;left:3px;width:24px;height:24px;border-radius:50%;background:var(--muted);transition:transform .22s cubic-bezier(.3,.7,.3,1),background .2s}

/* ---------- tab bar ---------- */
.tabbar{position:sticky;bottom:0;z-index:30;display:grid;grid-template-columns:repeat(5,1fr);background:rgba(4,6,12,.92);-webkit-backdrop-filter:blur(16px);backdrop-filter:blur(16px);border-top:1px solid var(--line);padding:6px 4px 24px;margin-top:40px}
.tab{min-height:56px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:5px;color:var(--muted);font:500 12px/1 var(--f-text);position:relative;border-radius:12px}
.tab:hover{color:var(--text)}
.tab.on{color:var(--text);font-weight:600}
.tab.on svg{color:var(--accent)}
.tab.on::before{content:"";position:absolute;top:-7px;width:24px;height:2px;background:var(--accent);box-shadow:0 0 14px 1px rgba(255,95,31,.8)}
.gesture{position:absolute;bottom:8px;left:50%;width:112px;height:4px;border-radius:2px;background:rgba(233,237,245,.45);transform:translateX(-50%)}

/* ---------- svg text ---------- */
.sm12{font-family:var(--f-mono);font-size:12px;letter-spacing:.04em}
.sm13{font-family:var(--f-mono);font-size:13px;letter-spacing:.04em}
.st{font-family:var(--f-title)}

@keyframes tw{0%,100%{opacity:.25}50%{opacity:.9}}
.tw{animation:tw 4.5s ease-in-out infinite}
@keyframes pulse{0%{transform:scale(.6);opacity:.9}100%{transform:scale(2.4);opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition:none!important}}


.pulse{animation:pulse 2.4s ease-out infinite}
.hero{position:relative;padding:14px 16px 22px}
.hero .display{margin:10px 0 10px}
.hero .lead{max-width:320px}

/* start noci */
.nightcta{overflow:hidden;padding:18px 16px 16px;background:radial-gradient(260px 200px at 92% 0%,rgba(255,95,31,.16),rgba(255,95,31,0) 70%),linear-gradient(180deg,#101a35 0%,#0C1222 60%)}
.nightcta .art{position:absolute;right:-34px;top:-34px;pointer-events:none}
.nightcta .h1{margin:8px 0 8px;max-width:220px}
.nightcta p{max-width:250px}
.trio{display:grid;grid-template-columns:repeat(3,1fr);gap:1px;background:var(--line);border:1px solid var(--line);border-radius:4px;margin:18px 0 16px;overflow:hidden}
.trio>div{background:rgba(6,9,18,.86);padding:10px 10px 11px}
.trio .mono{color:var(--muted);display:block;margin-bottom:6px}
.trio b{font:600 18px/1.1 var(--f-title);letter-spacing:-.01em;display:block}
.trio b.a{color:var(--accent)}
.trio small{display:block;font-size:13px;color:var(--muted);margin-top:3px;white-space:nowrap}
.startbtn{min-height:60px;font-size:17px;gap:12px;width:100%}
.startbtn svg{width:22px;height:22px}
.nightcta .lnk{margin-top:6px}

/* plan */
.traj{display:block;margin:-4px auto 14px}
.mission .h2{margin:6px 0 6px}
.plan{list-style:none;margin:16px -16px 0;border-top:1px solid var(--line);counter-reset:done}
.plan li{border-bottom:1px solid var(--line);position:relative}
.plan input:checked{counter-increment:done}
.it{display:flex;gap:12px;padding:14px 16px 14px 10px;cursor:pointer;align-items:flex-start;transition:background .2s}
.it:hover{background:rgba(233,237,245,.025)}
.chk{width:44px;height:44px;flex:none;display:grid;place-items:center;margin-top:-4px}
.chk span{width:26px;height:26px;border-radius:50%;border:1.5px solid var(--line-3);display:grid;place-items:center;color:transparent;transition:all .2s}
.plan input:checked + .it .chk span{background:var(--accent);border-color:var(--accent);color:var(--accent-ink)}
.plan input:checked + .it .h3{color:var(--muted)}
.ib{display:flex;flex-direction:column;gap:5px;min-width:0;flex:1}
.ib .foot{display:flex;align-items:center;gap:10px;flex-wrap:wrap;margin-top:4px}
.ib .mono{color:var(--muted)}
.ib .small{color:var(--muted)}
.done-l{display:none;color:var(--accent)}
.plan input:checked + .it .done-l{display:inline}
.prog{display:flex;align-items:center;gap:10px;margin-top:3px}
.prog .bar{flex:1;height:4px;border-radius:2px;background:rgba(233,237,245,.1);position:relative;overflow:hidden}
.prog .bar i{position:absolute;inset:0 auto 0 0;width:57%;background:var(--text);border-radius:2px}
.plan-foot{display:flex;justify-content:space-between;align-items:center;padding:14px 0 2px}
.plan-foot .cnt::before{content:"Hotovo " counter(done) " ze 3"}
.legend{display:grid;grid-template-columns:1fr 1fr;gap:12px 14px;margin-top:14px}
.legend div{display:flex;flex-direction:column;gap:6px;align-items:flex-start}
.legend p{font-size:13px;line-height:1.35;color:var(--muted)}
.why{margin-top:16px;padding:12px 14px;border-left:2px solid var(--accent);background:rgba(255,95,31,.05)}
.why .mono{color:var(--accent)}
.why p{font-size:14px;margin:4px 0 4px}

/* sleep */
.verdict{display:flex;gap:16px;align-items:flex-start}
.light{flex:none;width:40px;padding:7px 0;border-radius:20px;background:#070B16;border:1px solid var(--line-2);display:flex;flex-direction:column;align-items:center;gap:7px}
.light i{width:24px;height:24px;border-radius:50%;background:#151B2B;box-shadow:inset 0 0 0 1px rgba(233,237,245,.06)}
.light i.on.g{background:radial-gradient(circle at 40% 35%,#9BF5CF,var(--ok) 55%,#1E8F63);box-shadow:0 0 18px 2px rgba(63,212,154,.55)}
.verdict .h2{margin:4px 0 6px}
.okline{display:flex;gap:10px;align-items:flex-start;margin:16px 0 0;padding:11px 12px;border-radius:4px;background:rgba(63,212,154,.07);border:1px solid rgba(63,212,154,.25);font-size:14px;line-height:1.4}
.okline svg{color:var(--ok);flex:none;margin-top:-1px}
.feel{margin-top:16px}
.feel .opts{display:grid;grid-template-columns:repeat(3,1fr);gap:8px;margin-top:8px}
.feel label{min-height:44px;display:grid;place-items:center;border-radius:999px;border:1px solid var(--line-2);font-size:14px;font-weight:500;color:var(--muted);cursor:pointer;transition:all .2s}
.feel input:checked + label{background:rgba(233,237,245,.1);border-color:var(--text);color:var(--text)}
.data{margin-top:16px}
.stats{display:grid;grid-template-columns:1fr 1fr;gap:14px 12px;margin:12px 0 16px}
.stat .mono{color:var(--muted);display:block}
.stat b{display:block;font:600 22px/1.15 var(--f-title);letter-spacing:-.015em;margin:4px 0 2px}
.stat b small{font-size:14px;font-weight:500;color:var(--muted);margin-left:2px}
.stat span.s{font-size:13px;color:var(--muted)}
.stat .dev{display:flex;align-items:center;gap:4px;white-space:nowrap}.stat .dev .sep{width:8px}
.ns-key{display:flex;gap:16px;margin:2px 0 4px;font-size:13px;color:#FF3B2F}.ns-key span{display:inline-flex;align-items:center;gap:7px}.ns-key i{width:14px;height:10px;background:#5A120D;display:inline-block}.ns-key b{width:7px;height:7px;background:#FF3B2F;transform:rotate(45deg);display:inline-block}
.agree{height:4px;border-radius:2px;background:rgba(233,237,245,.1);margin-top:7px;overflow:hidden}
.agree i{display:block;height:100%;width:73%;background:linear-gradient(90deg,#FF5F1F,#FF8A5B)}
.hkey{display:flex;flex-wrap:wrap;gap:6px 14px;margin-top:10px;font-size:13px;color:var(--muted)}
.hkey span{display:inline-flex;align-items:center;gap:7px}
.hkey i{width:14px;height:10px;border-radius:1px;display:inline-block}
.note{display:flex;gap:10px;margin-top:12px;font-size:13px;line-height:1.45;color:var(--muted)}
.note svg{flex:none;color:var(--muted);margin-top:1px}
.rules{margin-top:14px;display:flex;flex-direction:column;gap:6px;font-size:13px;color:var(--muted)}
.rules span{display:flex;align-items:center;gap:8px}
.rules i{width:8px;height:8px;border-radius:50%;flex:none}

/* reminder */
.rc .row{align-items:flex-start;gap:14px}
.rc .h3{font-size:19px;margin:5px 0 4px}
.rc svg.track{display:block;margin:16px 0 6px}
.btns{display:flex;gap:8px;margin-top:14px;flex-wrap:wrap}
.btns .btn{flex:1}

/* intention */
.intent{background:radial-gradient(240px 160px at 100% 100%,rgba(255,95,31,.12),rgba(255,95,31,0) 70%),linear-gradient(180deg,#101a35 0%,#0C1222 60%)}
.ift{margin:16px 0 4px;display:grid;grid-template-columns:44px 1fr;row-gap:10px;align-items:baseline}
.ift .k{font:600 13px/1 var(--f-mono);letter-spacing:.1em;color:var(--accent)}
.ift .v{font:600 23px/1.22 var(--f-title);letter-spacing:-.018em}
.ift .v em{font-style:normal;color:var(--accent)}
.from{display:flex;align-items:center;gap:10px;margin-top:16px;padding-top:14px;border-top:1px dashed var(--line-2);font-size:14px;color:var(--muted)}
.from svg{color:var(--muted);flex:none}
.from b{color:var(--text);font-weight:600}

/* night preview */
.intro{margin:0 16px 14px;font-size:14px;color:var(--muted)}
.nwrap{margin:0 16px;border-radius:22px;padding:6px;background:#000;border:1px solid #5A120D}
.ns{position:relative;background:#000;color:#FF3B2F;border-radius:18px;padding:18px 16px 18px;overflow:hidden;font-family:var(--f-text)}
.ns-stars{position:absolute;left:0;top:0;pointer-events:none}
.ns .nm{font:500 12px/1.3 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:#FF3B2F}
.ns-top{display:flex;justify-content:space-between;position:relative}
.ns-clock{font:300 84px/1 var(--f-title);letter-spacing:-.04em;margin:22px 0 8px;color:#FF3B2F;position:relative}
.ns-hello{font-size:16px;line-height:1.4;color:#FF3B2F;position:relative;margin-bottom:18px}
.ns-card{position:relative;border:1px solid #5A120D;border-radius:6px;padding:14px;background:#000}
.ns-row{display:flex;justify-content:space-between}
.ns-big{font:600 54px/1 var(--f-title);letter-spacing:-.03em;margin:8px 0 8px;color:#FF3B2F}
.ns-txt{font-size:15px;line-height:1.4;color:#FF3B2F;margin-bottom:8px}
.ns-two{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:10px}
.ns-two .ns-txt{font-size:14px;margin:6px 0 0}
.ns-status{display:flex;align-items:center;gap:8px;font:600 20px/1 var(--f-title);margin-top:10px;color:#FF3B2F}
.ns-status i{width:9px;height:9px;border-radius:50%;background:#FF3B2F;position:relative}
.ns-status i::after{content:"";position:absolute;inset:0;border-radius:50%;border:1px solid #FF3B2F;animation:pulse 2.4s ease-out infinite}
.ns-int{font:600 19px/1.25 var(--f-title);margin-top:10px;color:#FF3B2F}
.ns-btn{display:flex;flex-direction:column;align-items:center;justify-content:center;gap:5px;width:100%;min-height:76px;margin-top:14px;border-radius:14px;border:1.5px solid #FF3B2F;background:#000;color:#FF3B2F;font:600 20px/1.1 var(--f-title);cursor:pointer}
.ns-btn small{font:400 14px/1.2 var(--f-text);color:#FF3B2F}
.ns-btn:active{background:#5A120D}
.ns-actions{display:grid;grid-template-columns:1fr 1fr;gap:10px;margin-top:10px}
.ns-btn2{min-height:56px;border-radius:14px;border:1px solid #B3261E;color:#FF3B2F;font:600 16px/1 var(--f-text);display:flex;align-items:center;justify-content:center;gap:8px;background:#000}
.ns-hold{margin-top:14px;text-align:center;font:500 13px/1 var(--f-mono);letter-spacing:.08em;text-transform:uppercase;color:#FF3B2F;padding:12px 0 4px;border-top:1px solid #5A120D}
.nfoot{display:flex;gap:10px;margin:12px 16px 0}

/* full screen overlay */
.ov{display:none;position:fixed;top:0;bottom:0;left:50%;width:min(390px,100%);transform:translateX(-50%);z-index:100;background:#000;overflow:auto}
#nt:checked ~ .ov{display:block}
.ov .ns{border-radius:0;min-height:100%;padding-top:10px}
.ov .close{position:sticky;top:0;z-index:2;display:flex;justify-content:space-between;align-items:center;padding:6px 8px 0 16px;background:#000}
.ov .close label{min-height:44px;display:inline-flex;align-items:center;gap:6px;padding:0 12px;border:1px solid #5A120D;border-radius:999px;font:500 13px/1 var(--f-mono);letter-spacing:.08em;text-transform:uppercase;color:#FF3B2F;cursor:pointer}
.ov .sbn{font:500 12px/1 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:#FF3B2F}

</style>
</head>
<body>
<div class="caption" aria-hidden="true"><span><b>Za hranice reality</b></span><span>Koncept · Dnes</span></div>
<div class="device">
<input type="checkbox" id="nt" class="sr" aria-label="Náhled nočního režimu">
<div class="sb" ><span class="tnum">21:47</span><span class="ic" aria-hidden="true">
<svg width="17" height="12" viewBox="0 0 17 12"><rect x="0" y="8" width="3" height="4" rx=".8" fill="currentColor"/><rect x="4.6" y="5.5" width="3" height="6.5" rx=".8" fill="currentColor"/><rect x="9.2" y="3" width="3" height="9" rx=".8" fill="currentColor"/><rect x="13.8" y="0" width="3" height="12" rx=".8" fill="currentColor" opacity=".35"/></svg>
<svg width="16" height="12" viewBox="0 0 16 12"><path d="M8 11.5l2.6-3.1a4 4 0 0 0-5.2 0z" fill="currentColor"/><path d="M2.8 5.4a7.8 7.8 0 0 1 10.4 0M.6 2.9a11 11 0 0 1 14.8 0" stroke="currentColor" stroke-width="1.5" fill="none" stroke-linecap="round"/></svg>
<svg width="26" height="12" viewBox="0 0 26 12"><rect x=".75" y=".75" width="21.5" height="10.5" rx="3" stroke="currentColor" stroke-width="1.2" fill="none" opacity=".55"/><rect x="2.5" y="2.5" width="14" height="7" rx="1.6" fill="currentColor"/><rect x="23.4" y="4" width="1.8" height="4" rx=".8" fill="currentColor" opacity=".55"/></svg>
</span></div>
<header class="appbar">
  <div class="brand"><span class="logo">Já<sup>2</sup></span><span class="mono">Za hranice reality</span></div>
  <div class="row" style="gap:0"><button class="ibtn" aria-label="Připomínky"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M6.5 16.5V11a5.5 5.5 0 0 1 11 0v5.5l1.5 1.8H5z"/><path d="M10 20.5a2.2 2.2 0 0 0 4 0"/></svg></button><button class="ibtn" aria-label="Nastavení"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="3"/><path d="M19.4 13.5a7.6 7.6 0 0 0 0-3l2-1.5-2-3.4-2.4 1a7.6 7.6 0 0 0-2.6-1.5L14 2.5h-4l-.4 2.6A7.6 7.6 0 0 0 7 6.6l-2.4-1-2 3.4 2 1.5a7.6 7.6 0 0 0 0 3l-2 1.5 2 3.4 2.4-1a7.6 7.6 0 0 0 2.6 1.5l.4 2.6h4l.4-2.6a7.6 7.6 0 0 0 2.6-1.5l2.4 1 2-3.4z"/></svg></button></div>
</header>

<section class="hero">
  <div class="eyebrow">Pondělí 26. října · <span class="a">den 37 ze 42</span></div>
  <h1 class="display">Dobrý večer.</h1>
  <p class="lead muted">Do usnutí zbývá hodina. Ještě jeden test reality a večerní záměr.</p>
</section>

<section class="panel hot nightcta" aria-labelledby="t-noc">
  <svg class="art" width="190" height="170" viewBox="0 0 190 170" aria-hidden="true">
    <defs><radialGradient id="mg" cx="40%" cy="38%"><stop offset="0" stop-color="#FFD9C7"/><stop offset=".55" stop-color="#FF8A5B"/><stop offset="1" stop-color="#B83A0E"/></radialGradient>
    <mask id="cres"><rect width="190" height="170" fill="#fff"/><circle cx="118" cy="62" r="25" fill="#000"/></mask></defs>
    <circle cx="136.8" cy="6.6" r="0.4" fill="#E9EDF5" opacity="0.57"/><circle cx="91.4" cy="82.7" r="0.5" fill="#E9EDF5" opacity="0.45399999999999996"/><circle cx="37" cy="14.2" r="0.6" fill="#E9EDF5" opacity="0.5870000000000001"/><circle cx="167.2" cy="55" r="0.5" fill="#E9EDF5" opacity="0.52"/><circle cx="100" cy="141.4" r="0.4" fill="#E9EDF5" opacity="0.633"/><circle cx="59" cy="159.3" r="0.6" fill="#E9EDF5" opacity="0.5429999999999999"/><circle cx="29.3" cy="62.5" r="0.4" fill="#E9EDF5" opacity="0.155"/><circle cx="90.9" cy="146.7" r="0.7" fill="#E9EDF5" opacity="0.5820000000000001"/><circle cx="111" cy="98.9" r="0.6" fill="#E9EDF5" opacity="0.442"/><circle cx="159.3" cy="70.2" r="0.6" fill="#E9EDF5" opacity="0.46399999999999997"/><circle cx="147.5" cy="145.4" r="0.6" fill="#E9EDF5" opacity="0.529"/><circle cx="133" cy="79.3" r="1.4" fill="#E9EDF5" opacity="0.542"/><path d="M129.5 79.3H136.5M133 75.8V82.8" stroke="#E9EDF5" stroke-width=".5" opacity="0.3252"/><circle cx="181" cy="130.1" r="0.4" fill="#E9EDF5" opacity="0.446"/><circle cx="164.4" cy="58.6" r="0.5" fill="#E9EDF5" opacity="0.405"/><circle cx="104.9" cy="98.2" r="0.8" fill="#E9EDF5" opacity="0.245"/><circle cx="181" cy="109.3" r="0.8" fill="#E9EDF5" opacity="0.184"/><circle cx="78.4" cy="26.3" r="0.8" fill="#E9EDF5" opacity="0.49200000000000005"/><circle cx="187.5" cy="168.4" r="1.2" fill="#E9EDF5" opacity="0.638"/><path d="M184 168.4H191M187.5 164.9V171.9" stroke="#E9EDF5" stroke-width=".5" opacity="0.3828"/><circle cx="154.6" cy="53.7" r="0.9" fill="#E9EDF5" opacity="0.365"/><circle cx="113.8" cy="23.9" r="0.7" fill="#E9EDF5" opacity="0.29100000000000004"/><circle cx="167.4" cy="8.3" r="0.4" fill="#E9EDF5" opacity="0.38299999999999995"/><circle cx="169" cy="4.9" r="0.4" fill="#E9EDF5" opacity="0.308"/>
    <ellipse cx="104" cy="74" rx="78" ry="26" transform="rotate(-18 104 74)" fill="none" stroke="rgba(233,237,245,.18)" stroke-dasharray="2 4"/>
    <ellipse cx="104" cy="74" rx="56" ry="18" transform="rotate(-18 104 74)" fill="none" stroke="rgba(255,95,31,.35)"/>
    <circle cx="104" cy="74" r="28" fill="url(#mg)" mask="url(#cres)"/>
    <circle cx="157" cy="57" r="3.5" fill="#FF5F1F"/><circle cx="157" cy="57" r="8" fill="#FF5F1F" opacity=".18"/>
  </svg>
  <div class="eyebrow">Noc 37 · usnutí <span class="a">23:00</span></div>
  <h2 class="h1" id="t-noc">Noc je připravená.</h2>
  <p class="small muted">Až budeš v posteli, spusť noc. Telefon přejde do červeného režimu.</p>
  <div class="trio">
    <div><span class="mono">WBTB budík</span><b class="a tnum">04:40</b><small>pozdní část noci</small></div>
    <div><span class="mono">TLR podnět</span><b>4×</b><small>jen po WBTB</small></div>
    <div><span class="mono">Záměr</span><b>Voda</b><small>až → tak</small></div>
  </div>
  <label for="nt" class="btn primary startbtn" role="button" tabindex="0"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M19.6 14.6A8.2 8.2 0 0 1 9.4 4.4a8.2 8.2 0 1 0 10.2 10.2z"/></svg>Start noci</label>
  <a href="#nahled" class="lnk">Jak bude noc vypadat <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M12 5v14M6.5 13.5L12 19l5.5-5.5"/></svg></a>
</section>

<div class="sh"><span class="n">01</span><h2>Plán na dnešek</h2><span class="rule"></span><span class="meta">≈ 8 min</span></div>
<section class="panel mission" aria-label="Plán na dnešek">
  <svg class="traj" viewBox="0 0 326 134" width="326" height="134" role="img" aria-label="Program: den 37 ze 42, šestý týden"><g><circle cx="64.8" cy="59.6" r="0.8" fill="#E9EDF5" opacity="0.36700000000000005"/><circle cx="224.6" cy="18.4" r="0.4" fill="#E9EDF5" opacity="0.34"/><circle cx="227.6" cy="41.1" r="0.9" fill="#E9EDF5" opacity="0.23600000000000002"/><circle cx="238.1" cy="44.9" r="0.6" fill="#E9EDF5" opacity="0.419"/><circle cx="282.2" cy="31.9" r="0.5" fill="#E9EDF5" opacity="0.353"/><circle cx="108.7" cy="3.4" r="0.5" fill="#E9EDF5" opacity="0.308"/><circle cx="161.1" cy="5.2" r="0.7" fill="#E9EDF5" opacity="0.209"/><circle cx="22.3" cy="34.2" r="0.7" fill="#E9EDF5" opacity="0.23800000000000002"/><circle cx="180.4" cy="67" r="0.4" fill="#E9EDF5" opacity="0.305"/><circle cx="106.1" cy="37.6" r="0.7" fill="#E9EDF5" opacity="0.33399999999999996"/><circle cx="173.9" cy="46" r="0.4" fill="#E9EDF5" opacity="0.429"/><circle cx="194.6" cy="44.9" r="0.7" fill="#E9EDF5" opacity="0.445"/></g><path d="M18,116 Q163,0 308,116" stroke="rgba(233,237,245,.16)" stroke-width="1" fill="none" stroke-dasharray="2 4"/><path d="M18,116 Q144.0,15.2 270.0,89.6" stroke="url(#tg)" stroke-width="1.6" fill="none"/><defs><linearGradient id="tg" x1="0" x2="1"><stop offset="0" stop-color="#E9EDF5" stop-opacity=".25"/><stop offset="1" stop-color="#FF5F1F"/></linearGradient></defs><line x1="17.8" y1="108.5" x2="25.1" y2="118" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="26.6" y1="105.6" x2="30.1" y2="110.4" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="33.5" y1="100.6" x2="37" y2="105.5" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="40.5" y1="95.8" x2="43.8" y2="100.8" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="47.5" y1="91.3" x2="50.7" y2="96.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="54.5" y1="87" x2="57.5" y2="92.2" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="61.4" y1="83" x2="64.3" y2="88.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="67" y1="76.6" x2="72.5" y2="87.3" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="75.4" y1="75.8" x2="78" y2="81.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="82.4" y1="72.6" x2="84.8" y2="78.1" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="89.4" y1="69.7" x2="91.6" y2="75.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="96.4" y1="67" x2="98.4" y2="72.7" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="103.4" y1="64.6" x2="105.2" y2="70.4" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="110.4" y1="62.5" x2="112" y2="68.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="116.7" y1="57.7" x2="119.6" y2="69.4" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="124.4" y1="59.3" x2="125.6" y2="65.2" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="131.4" y1="57.7" x2="132.4" y2="63.6" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="138.4" y1="56.6" x2="139.2" y2="62.6" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="145.5" y1="55.8" x2="146" y2="61.8" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="152.5" y1="55.3" x2="152.8" y2="61.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="159.5" y1="55" x2="159.6" y2="61" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="166.6" y1="52" x2="166.3" y2="64" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="173.5" y1="55.3" x2="173.2" y2="61.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="180.5" y1="55.8" x2="180" y2="61.8" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="187.6" y1="56.6" x2="186.8" y2="62.6" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="194.6" y1="57.7" x2="193.6" y2="63.6" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="201.6" y1="59" x2="200.4" y2="64.9" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="208.6" y1="60.6" x2="207.2" y2="66.5" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="216.4" y1="59.6" x2="213.1" y2="71.2" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="222.6" y1="64.6" x2="220.8" y2="70.4" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="229.6" y1="67" x2="227.6" y2="72.7" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="236.6" y1="69.7" x2="234.4" y2="75.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="243.6" y1="72.6" x2="241.2" y2="78.1" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="250.6" y1="75.8" x2="248" y2="81.3" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="257.6" y1="79.3" x2="254.8" y2="84.6" stroke="rgba(233,237,245,.75)" stroke-width="1"/><line x1="266" y1="80.4" x2="260.2" y2="90.9" stroke="rgba(233,237,245,.75)" stroke-width="1.3"/><line x1="278.5" y1="91.3" x2="275.3" y2="96.3" stroke="rgba(233,237,245,.22)" stroke-width="1"/><line x1="285.5" y1="95.8" x2="282.2" y2="100.8" stroke="rgba(233,237,245,.22)" stroke-width="1"/><line x1="292.5" y1="100.6" x2="289" y2="105.5" stroke="rgba(233,237,245,.22)" stroke-width="1"/><line x1="299.4" y1="105.6" x2="295.9" y2="110.4" stroke="rgba(233,237,245,.22)" stroke-width="1"/><line x1="306.4" y1="110.9" x2="302.7" y2="115.6" stroke="rgba(233,237,245,.22)" stroke-width="1"/><text x="32.7" y="88.1" text-anchor="middle" class="sm12" fill="#7D879E">T1</text><text x="84.2" y="60.7" text-anchor="middle" class="sm12" fill="#7D879E">T2</text><text x="136.6" y="46.8" text-anchor="middle" class="sm12" fill="#7D879E">T3</text><text x="189.4" y="46.8" text-anchor="middle" class="sm12" fill="#7D879E">T4</text><text x="241.8" y="60.7" text-anchor="middle" class="sm12" fill="#7D879E">T5</text><text x="293.3" y="88.1" text-anchor="middle" class="sm12" fill="#FF5F1F">T6</text><circle cx="270.0" cy="89.6" r="11" fill="#FF5F1F" opacity=".14"/><circle cx="270.0" cy="89.6" r="5" fill="#FF5F1F"/><circle cx="270.0" cy="89.6" r="5" fill="none" stroke="#FF5F1F" class="pulse" style="transform-origin:270.0px 89.6px"/><text x="163" y="88" text-anchor="middle" class="sm12" fill="#8D97AD">DEN PROGRAMU</text><text x="163" y="128" text-anchor="middle" fill="#E9EDF5"><tspan class="st" font-size="40" font-weight="600" letter-spacing="-1">37</tspan><tspan class="sm13" fill="#8D97AD" dx="5">/ 42</tspan></text></svg>
  <div class="eyebrow"><span class="a">Mise 37</span> · týden 6: udržet sen</div>
  <h3 class="h2">Vrať se do snu a udrž ho.</h3>
  <p class="small muted">Z nejčastější Stopy snu udělej večerní záměr. Spánek má pořád přednost.</p>
  <ul class="plan">
    <li><input type="checkbox" class="sr" id="i1" checked><label class="it" for="i1"><span class="chk"><span><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M5.5 12.5l4.2 4.2 8.8-9.4"/></svg></span></span><span class="ib">
      <span class="mono">Jóga snu · 3 min <span class="done-l">· hotovo</span></span>
      <span class="h3">Denní pohled: svět jako sen</span>
      <span class="small">Třikrát za den se zastav a řekni si: tohle je sen. Pak se jen dívej.</span>
      <span class="foot"><span class="ev trad"><i aria-hidden="true"><b></b><b></b><b></b></i>Tradice</span><span class="src">Tenzin Wangyal 1998</span></span></span></label></li>
    <li><input type="checkbox" class="sr" id="i2"><label class="it" for="i2"><span class="chk"><span><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M5.5 12.5l4.2 4.2 8.8-9.4"/></svg></span></span><span class="ib">
      <span class="mono">Přes den · 4 ze 7 <span class="done-l">· hotovo</span></span>
      <span class="h3">Testy reality</span>
      <span class="small">Prsty, text, nádech nosem. Počítá se každý test.</span>
      <span class="prog"><span class="bar"><i></i></span><span class="mono">4/7</span></span>
      <span class="foot"><span class="ev prom"><i aria-hidden="true"><b></b><b></b><b></b></i>Slibné</span><span class="src">Stumbrys et al. 2012</span></span></span></label></li>
    <li><input type="checkbox" class="sr" id="i3"><label class="it" for="i3"><span class="chk"><span><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M5.5 12.5l4.2 4.2 8.8-9.4"/></svg></span></span><span class="ib">
      <span class="mono">Věda · 5 min · v posteli <span class="done-l">· hotovo</span></span>
      <span class="h3">Záměr poznat sen (MILD)</span>
      <span class="small">Vybav si sen z minulé noci. Najdi v něm vodu. Představ si, že ji poznáš a řekneš: sním.</span>
      <span class="foot"><span class="ev strong"><i aria-hidden="true"><b></b><b></b><b></b></i>Věda silné</span><span class="src">Aspy et al. 2017</span></span></span></label></li>
  </ul>
  <div class="plan-foot"><span class="mono cnt" aria-live="polite"></span><a class="lnk" href="#">Celý den 37 <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M9.5 6l6 6-6 6"/></svg></a></div>
  <div class="legend" aria-label="Co znamenají štítky">
    <div><span class="ev strong"><i aria-hidden="true"><b></b><b></b><b></b></i>Věda silné</span><p>Víc kvalitních studií</p></div>
    <div><span class="ev prom"><i aria-hidden="true"><b></b><b></b><b></b></i>Slibné</span><p>První studie, malé vzorky</p></div>
    <div><span class="ev comm"><i aria-hidden="true"><b></b><b></b><b></b></i>Komunita</span><p>Praxe lucidních snílků bez studie</p></div>
    <div><span class="ev trad"><i aria-hidden="true"><b></b><b></b><b></b></i>Tradice</span><p>Bez vědeckého důkazu, ze dvou a víc zdrojů</p></div>
  </div>
  <div class="why"><span class="mono">Proč dnes</span><p>Spouštěč z tvých vlastních snů si vybavíš snáz než obecný pokyn.</p><span class="src">Gollwitzer &amp; Sheeran 2006</span></div>
</section>

<div class="sh"><span class="n">02</span><h2>Jak ses vyspal</h2><span class="rule"></span><span class="meta">Noc na pondělí</span></div>
<section class="panel" aria-label="Jak ses vyspal">
  <div class="verdict">
    <div class="light" role="img" aria-label="Semafor ukazuje zelenou"><i class="r"></i><i class="y"></i><i class="g on"></i></div>
    <div><div class="mono" style="color:var(--ok)">Zelená</div><h3 class="h2">Vyspal ses dobře.</h3><p class="small muted">7 h 04 min spánku, pět REM oken. Noční probuzení jsou normální, nepočítají se jako chyba.</p></div>
  </div>
  <div class="okline"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M5.5 12.5l4.2 4.2 8.8-9.4"/></svg><span>Dnes můžeš zařadit WBTB. Bude to 1. ze 2 tento týden, minulá noc byla bez budíku a podle tvého plánu zítra nemusíš brzy vstávat.</span></div>
  <div class="feel"><span class="mono muted">Tvůj pocit ráno</span>
    <div class="opts" role="radiogroup" aria-label="Tvůj pocit ráno">
      <input type="radio" name="feel" id="f1" class="sr" checked><label for="f1">Svěží</label>
      <input type="radio" name="feel" id="f2" class="sr"><label for="f2">Ujde</label>
      <input type="radio" name="feel" id="f3" class="sr"><label for="f3">Unavený</label>
    </div>
  </div>
  <div class="sub data">
    <div class="between"><span class="mono">Spánková data</span><span class="row" style="gap:8px;color:var(--muted)"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><ellipse cx="12" cy="12" rx="8" ry="8"/><ellipse cx="12" cy="12" rx="5.2" ry="5.2"/><path d="M10.5 4.2h3"/></svg><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="6.5" y="6.5" width="11" height="11" rx="3"/><path d="M9 6.5L9.6 3h4.8l.6 3.5M9 17.5l.6 3.5h4.8l.6-3.5M12 9.5V12l1.6 1"/></svg></span></div>
    <div class="stats">
      <div class="stat"><span class="mono">Spánek</span><b class="tnum">7 h 04<small>min</small></b><span class="s dev"><svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><ellipse cx="12" cy="12" rx="8" ry="8"/><ellipse cx="12" cy="12" rx="5.2" ry="5.2"/><path d="M10.5 4.2h3"/></svg>7:09<span class="sep"></span><svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="6.5" y="6.5" width="11" height="11" rx="3"/><path d="M9 6.5L9.6 3h4.8l.6 3.5M9 17.5l.6 3.5h4.8l.6-3.5M12 9.5V12l1.6 1"/></svg>6:58</span></div>
      <div class="stat"><span class="mono">REM · odhad</span><b class="tnum">≈1:40–2:20<small>h</small></b><span class="s">5 oken, nejdelší ráno</span></div>
      <div class="stat"><span class="mono">Shoda v REM</span><b class="tnum">73<small>%</small></b><div class="agree"><i></i></div></div>
      <div class="stat"><span class="mono">Probuzení</span><b class="tnum">4<small>×</small></b><span class="s">bez budíku</span></div>
    </div>
    <svg viewBox="0 0 296 132" width="296" height="132" role="img" aria-label="Hypnogram noci 23:10 až 07:05 s odhadem REM oken"><line x1="54" x2="294" y1="12" y2="12" stroke="rgba(233,237,245,.07)"/><text x="0" y="16" font-size="12" fill="#8D97AD" style="font-family:var(--f-text)">Bdění</text><line x1="54" x2="294" y1="28" y2="28" stroke="rgba(233,237,245,.07)"/><text x="0" y="32" font-size="12" fill="#FF5F1F" style="font-family:var(--f-text)">REM</text><line x1="54" x2="294" y1="46" y2="46" stroke="rgba(233,237,245,.07)"/><text x="0" y="50" font-size="12" fill="#8D97AD" style="font-family:var(--f-text)">Lehký</text><line x1="54" x2="294" y1="64" y2="64" stroke="rgba(233,237,245,.07)"/><text x="0" y="68" font-size="12" fill="#8D97AD" style="font-family:var(--f-text)">Hluboký</text><rect x="99.1" y="2" width="7.5" height="72" fill="#FF5F1F" opacity=".10"/><rect x="100.6" y="2" width="5" height="72" fill="#FF5F1F" opacity=".20"/><rect x="144.2" y="2" width="12.5" height="72" fill="#FF5F1F" opacity=".10"/><rect x="146.2" y="2" width="8" height="72" fill="#FF5F1F" opacity=".20"/><rect x="200.3" y="2" width="14" height="72" fill="#FF5F1F" opacity=".10"/><rect x="203.3" y="2" width="11" height="72" fill="#FF5F1F" opacity=".20"/><rect x="233.9" y="2" width="17" height="72" fill="#FF5F1F" opacity=".10"/><rect x="235.4" y="2" width="13" height="72" fill="#FF5F1F" opacity=".20"/><rect x="271" y="2" width="18.5" height="72" fill="#FF5F1F" opacity=".10"/><rect x="273.5" y="2" width="14" height="72" fill="#FF5F1F" opacity=".20"/><path d="M54 12H61V46H70V64H90.1V46H100.6V28H105.6V46H112.1V64H128.2V46H146.2V28H154.2V12H157.7V46H170.2V64H181.3V46H203.3V28H214.3V12H225.4V46H235.4V28H248.4V12H251.4V46H273.5V28H287.5V46H288.5V12H292" stroke="rgba(233,237,245,.7)" stroke-width="1.2" fill="none" stroke-linejoin="round"/><line x1="100.6" x2="105.6" y1="28" y2="28" stroke="#FF5F1F" stroke-width="3.2" stroke-linecap="round"/><line x1="146.2" x2="154.2" y1="28" y2="28" stroke="#FF5F1F" stroke-width="3.2" stroke-linecap="round"/><line x1="203.3" x2="214.3" y1="28" y2="28" stroke="#FF5F1F" stroke-width="3.2" stroke-linecap="round"/><line x1="235.4" x2="248.4" y1="28" y2="28" stroke="#FF5F1F" stroke-width="3.2" stroke-linecap="round"/><line x1="273.5" x2="287.5" y1="28" y2="28" stroke="#FF5F1F" stroke-width="3.2" stroke-linecap="round"/><text x="0" y="91" class="sm12" fill="#8D97AD">OURA</text><rect x="54" y="86" width="238" height="6" rx="1" fill="rgba(233,237,245,.07)"/><rect x="99.1" y="86" width="7.5" height="6" rx="1" fill="#FF5F1F"/><rect x="144.2" y="86" width="10" height="6" rx="1" fill="#FF5F1F"/><rect x="203.3" y="86" width="11" height="6" rx="1" fill="#FF5F1F"/><rect x="233.9" y="86" width="14.5" height="6" rx="1" fill="#FF5F1F"/><rect x="273.5" y="86" width="16" height="6" rx="1" fill="#FF5F1F"/><text x="0" y="107" class="sm12" fill="#8D97AD">GARMIN</text><rect x="54" y="102" width="238" height="6" rx="1" fill="rgba(233,237,245,.07)"/><rect x="100.6" y="102" width="5" height="6" rx="1" fill="#FF5F1F"/><rect x="146.2" y="102" width="10.5" height="6" rx="1" fill="#FF5F1F"/><rect x="200.3" y="102" width="14" height="6" rx="1" fill="#FF5F1F"/><rect x="235.4" y="102" width="15.5" height="6" rx="1" fill="#FF5F1F"/><rect x="271" y="102" width="16.5" height="6" rx="1" fill="#FF5F1F"/><line x1="79.1" x2="79.1" y1="110" y2="114" stroke="rgba(233,237,245,.3)"/><text x="79.1" y="128" text-anchor="middle" class="sm12" fill="#7D879E">00:00</text><line x1="139.2" x2="139.2" y1="110" y2="114" stroke="rgba(233,237,245,.3)"/><text x="139.2" y="128" text-anchor="middle" class="sm12" fill="#7D879E">02:00</text><line x1="199.3" x2="199.3" y1="110" y2="114" stroke="rgba(233,237,245,.3)"/><text x="199.3" y="128" text-anchor="middle" class="sm12" fill="#7D879E">04:00</text><line x1="259.4" x2="259.4" y1="110" y2="114" stroke="rgba(233,237,245,.3)"/><text x="259.4" y="128" text-anchor="middle" class="sm12" fill="#7D879E">06:00</text></svg>
    <div class="hkey"><span><i style="background:rgba(255,95,31,.42)"></i>REM, obě zařízení</span><span><i style="background:rgba(255,95,31,.16)"></i>jen jedno</span></div>
    <div class="note"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="8.8"/><path d="M12 11v5.5M12 7.6v.2"/></svg><span>Je to odhad. Prsten a hodinky usuzují na REM z tepu, dechu a pohybu. Kde se shodnou, je pás užší a jistější.</span></div>
  </div>
  <div class="rules"><span><i style="background:var(--warn)"></i>Žlutá: jen MILD, bez budíku v noci.</span><span><i style="background:var(--bad)"></i>Červená: dnes jen spánek.</span></div>
</section>

<div class="sh"><span class="n">03</span><h2>Test reality</h2><span class="rule"></span><span class="meta">Připomínka</span></div>
<section class="panel rc" aria-label="Příští připomínka">
  <div class="row"><svg viewBox="0 0 64 64" width="64" height="64" aria-hidden="true"><circle cx="32" cy="32" r="27" fill="none" stroke="rgba(233,237,245,.12)" stroke-width="3"/>
<circle cx="32" cy="32" r="27" fill="none" stroke="#FF5F1F" stroke-width="3" stroke-linecap="round" stroke-dasharray="82.4 169.6" transform="rotate(-90 32 32)"/>
<text x="32" y="33" text-anchor="middle" class="st" font-size="20" font-weight="600" fill="#E9EDF5">18</text><text x="32" y="47" text-anchor="middle" class="sm12" fill="#8D97AD" font-size="10.5">MIN</text></svg><div><div class="eyebrow">Příští připomínka · <span class="a">22:05</span></div><h3 class="h3">Spočítej prsty. Dvakrát.</h3><p class="small muted">Ve snu jich bývá víc nebo míň. Přidej nádech se zacpaným nosem.</p></div></div>
  <svg class="track" viewBox="0 0 326 46" width="326" height="46" role="img" aria-label="Připomínky dnes: 4 hotové, 2 vynechané, další ve 22:05"><line x1="10" x2="316" y1="16" y2="16" stroke="rgba(233,237,245,.14)"/><line x1="10" x2="292" y1="16" y2="16" stroke="rgba(233,237,245,.5)"/><circle cx="33" cy="16" r="5" fill="#E9EDF5"/><path d="M30.6 16.2l1.6 1.6 3-3.2" stroke="#04060C" stroke-width="1.4" fill="none" stroke-linecap="round"/><circle cx="77.5" cy="16" r="5" fill="#E9EDF5"/><path d="M75.1 16.2l1.6 1.6 3-3.2" stroke="#04060C" stroke-width="1.4" fill="none" stroke-linecap="round"/><circle cx="125.2" cy="16" r="5" fill="#E9EDF5"/><path d="M122.8 16.2l1.6 1.6 3-3.2" stroke="#04060C" stroke-width="1.4" fill="none" stroke-linecap="round"/><circle cx="169.6" cy="16" r="4.5" fill="#04060C" stroke="#7D879E" stroke-width="1.2" stroke-dasharray="2 1.6"/><circle cx="204.1" cy="16" r="5" fill="#E9EDF5"/><path d="M201.7 16.2l1.6 1.6 3-3.2" stroke="#04060C" stroke-width="1.4" fill="none" stroke-linecap="round"/><circle cx="251.8" cy="16" r="4.5" fill="#04060C" stroke="#7D879E" stroke-width="1.2" stroke-dasharray="2 1.6"/><circle cx="297.9" cy="16" r="10" fill="#FF5F1F" opacity=".16"/><circle cx="297.9" cy="16" r="5.5" fill="#04060C" stroke="#FF5F1F" stroke-width="2"/><text x="19.9" y="42" text-anchor="middle" class="sm12" fill="#7D879E">08:00</text><text x="98.8" y="42" text-anchor="middle" class="sm12" fill="#7D879E">12:00</text><text x="177.8" y="42" text-anchor="middle" class="sm12" fill="#7D879E">16:00</text><text x="256.8" y="42" text-anchor="middle" class="sm12" fill="#7D879E">20:00</text></svg>
  <div class="between"><span class="mono muted" style="white-space:nowrap">Dnes 4 ze 7</span><span class="small muted">Počítá se každý test.</span></div>
  <div class="btns"><button class="btn primary sm" type="button">Test teď</button><button class="btn sm" type="button">Odložit o 15 min</button></div>
</section>

<div class="sh"><span class="n">04</span><h2>Večerní záměr</h2><span class="rule"></span><span class="meta">Až · tak</span></div>
<section class="panel hot intent" aria-label="Večerní záměr">
  <div class="between"><span class="eyebrow">Záměr na noc 37</span><span class="ev strong"><i aria-hidden="true"><b></b><b></b><b></b></i>Věda silné</span></div>
  <div class="ift"><span class="k">AŽ</span><span class="v">uvidím tekoucí vodu,</span><span class="k">TAK</span><span class="v">se zastavím a zeptám se: <em>sním?</em></span></div>
  <div class="from"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M2.5 9c2.4 0 2.4-2 4.8-2s2.4 2 4.7 2 2.4-2 4.7-2 2.4 2 4.8 2"/><path d="M2.5 14c2.4 0 2.4-2 4.8-2s2.4 2 4.7 2 2.4-2 4.7-2 2.4 2 4.8 2"/><path d="M2.5 19c2.4 0 2.4-2 4.8-2s2.4 2 4.7 2 2.4-2 4.7-2 2.4 2 4.8 2"/></svg><span>Ze Stop snů: <b>voda</b>, 7 nocí ze 14. Naposledy tekla nahoru.</span></div>
  <div class="btns"><button class="btn sm" type="button"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M4 20h4L19 9a2.8 2.8 0 0 0-4-4L4 16z"/><path d="M13.5 6.5l4 4"/></svg>Změnit</button><button class="btn sm" type="button"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="9" y="3" width="6" height="11" rx="3"/><path d="M5.5 11a6.5 6.5 0 0 0 13 0M12 17.5V21"/></svg>Říct nahlas 3×</button></div>
  <p class="src" style="margin-top:12px">Záměr typu až/tak: Gollwitzer 1999</p>
</section>

<div class="sh" id="nahled"><span class="n">05</span><h2>Noční režim</h2><span class="rule"></span><span class="meta">Náhled</span></div>
<p class="intro">Po startu noci uvidíš jen tohle. Jen červená na černé, jas na minimu, velké písmo. Nic modrého, nic bílého.</p>
<div class="nwrap"><div class="ns" >
  <svg class="ns-stars" viewBox="0 0 390 300" width="390" height="300" aria-hidden="true"><circle cx="331.9" cy="152.7" r="0.6" fill="#5A120D" opacity="0.8740000000000001"/><circle cx="191.8" cy="274.3" r="0.4" fill="#5A120D" opacity="0.753"/><circle cx="324.3" cy="99.2" r="0.9" fill="#5A120D" opacity="0.495"/><circle cx="82.9" cy="78.9" r="0.8" fill="#5A120D" opacity="0.413"/><circle cx="103.7" cy="162.2" r="0.6" fill="#5A120D" opacity="0.278"/><circle cx="186.5" cy="91" r="0.8" fill="#5A120D" opacity="0.303"/><circle cx="12.1" cy="199" r="0.6" fill="#5A120D" opacity="0.7929999999999999"/><circle cx="84.7" cy="215.6" r="0.7" fill="#5A120D" opacity="0.302"/><circle cx="74.7" cy="215.1" r="0.5" fill="#5A120D" opacity="0.8959999999999999"/><circle cx="278.2" cy="69.7" r="0.5" fill="#5A120D" opacity="0.151"/><circle cx="187.3" cy="55" r="0.4" fill="#5A120D" opacity="0.486"/><circle cx="341.7" cy="231.3" r="0.8" fill="#5A120D" opacity="0.231"/><circle cx="78.2" cy="169.3" r="0.9" fill="#5A120D" opacity="0.6579999999999999"/><circle cx="375.8" cy="85.2" r="0.5" fill="#5A120D" opacity="0.6659999999999999"/><circle cx="111.4" cy="78.3" r="0.7" fill="#5A120D" opacity="0.384"/><circle cx="80.6" cy="289" r="0.8" fill="#5A120D" opacity="0.273"/><circle cx="150.2" cy="184.4" r="0.8" fill="#5A120D" opacity="0.7390000000000001"/><circle cx="237.7" cy="264.8" r="0.9" fill="#5A120D" opacity="0.382"/><circle cx="201.7" cy="19" r="0.7" fill="#5A120D" opacity="0.36700000000000005"/><circle cx="224.7" cy="85.2" r="0.7" fill="#5A120D" opacity="0.304"/><circle cx="103.9" cy="256.4" r="0.4" fill="#5A120D" opacity="0.9790000000000001"/><circle cx="194.6" cy="263.3" r="0.6" fill="#5A120D" opacity="0.769"/><circle cx="65.5" cy="66.5" r="0.9" fill="#5A120D" opacity="0.993"/><circle cx="71.6" cy="27.9" r="0.6" fill="#5A120D" opacity="0.855"/><circle cx="89.4" cy="144.2" r="0.6" fill="#5A120D" opacity="0.33"/><circle cx="53.8" cy="99.1" r="0.9" fill="#5A120D" opacity="0.435"/><circle cx="314.7" cy="191.6" r="0.8" fill="#5A120D" opacity="0.665"/><circle cx="33.7" cy="32.3" r="0.8" fill="#5A120D" opacity="0.927"/><circle cx="371.7" cy="44.9" r="0.5" fill="#5A120D" opacity="0.7020000000000001"/><circle cx="101.1" cy="277.9" r="0.9" fill="#5A120D" opacity="0.515"/><circle cx="3.3" cy="186.1" r="0.5" fill="#5A120D" opacity="0.66"/><circle cx="197.1" cy="256.1" r="0.8" fill="#5A120D" opacity="0.75"/><circle cx="244.6" cy="23" r="0.4" fill="#5A120D" opacity="0.708"/><circle cx="104.7" cy="56.4" r="0.4" fill="#5A120D" opacity="0.28300000000000003"/></svg>
  <div class="ns-top"><span class="nm">Noční režim · noc 37</span><span class="nm">Jas 2 %</span></div>
  <div class="ns-clock tnum">23:41</div>
  <p class="ns-hello">Dobrou noc. Displej polož dolů.</p>
  <div class="ns-card">
    <div class="ns-row"><span class="nm">Budík WBTB</span><span class="nm">za 4 h 59 min</span></div>
    <div class="ns-big tnum">04:40</div>
    <p class="ns-txt">V nejpravděpodobnější části noci, odhad REM okna 04:28–05:04. Pak 15 minut vzhůru, záměr a zpátky spát.</p>
    <div class="ns-key"><span><i></i>REM okno, odhad</span><span><b></b>TLR podnět</span></div>
    <svg viewBox="0 0 318 92" width="100%" height="92" role="img" aria-label="Odhad REM oken na dnešní noc, budík WBTB 04:40"><line x1="4" x2="314" y1="52" y2="52" stroke="#5A120D"/><rect x="49.6" y="40" width="9.7" height="24" fill="#5A120D"/><rect x="102.5" y="40" width="15.8" height="24" fill="#5A120D"/><rect x="154.7" y="40" width="19.5" height="24" fill="#5A120D"/><rect x="203.4" y="40" width="21.9" height="24" fill="#5A120D"/><rect x="241.1" y="40" width="19.4" height="24" fill="#5A120D"/><rect x="282.4" y="40" width="20.7" height="24" fill="#5A120D"/><line x1="28.9" x2="28.9" y1="30" y2="72" stroke="#FF3B2F" stroke-width="1.5"/><text x="32.9" y="36" class="sm12" fill="#FF3B2F">TEĎ</text><line x1="210.7" x2="210.7" y1="20" y2="72" stroke="#FF3B2F" stroke-width="2"/><path d="M205.7 20h10l-5 6z" fill="#FF3B2F"/><text x="210.7" y="13" text-anchor="middle" class="sm12" fill="#FF3B2F">BUDÍK 04:40</text><path d="M244.7 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M253.2 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M286 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M294.5 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><text x="4" y="88" text-anchor="start" class="sm12" fill="#FF3B2F">23:00</text><text x="76.9" y="88" text-anchor="middle" class="sm12" fill="#FF3B2F">01:00</text><text x="149.9" y="88" text-anchor="middle" class="sm12" fill="#FF3B2F">03:00</text><text x="314" y="88" text-anchor="end" class="sm12" fill="#FF3B2F">07:30</text></svg>
  </div>
  <div class="ns-two">
    <div class="ns-card"><div class="nm">TLR podnět</div><div class="ns-status"><i></i>Čeká</div><p class="ns-txt">Až po WBTB, max 3× za okno. Řídí se odhadem, ne živým měřením.</p></div>
    <div class="ns-card"><div class="nm">Záměr</div><p class="ns-int">Až uvidím vodu, zeptám se: sním?</p></div>
  </div>
  <button class="ns-btn" type="button"><span>Probudil jsem se ze snu</span><small>Uloží čas, sen pak namluvíš</small></button>
  <div class="ns-actions"><button class="ns-btn2" type="button"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="9" y="3" width="6" height="11" rx="3"/><path d="M5.5 11a6.5 6.5 0 0 0 13 0M12 17.5V21"/></svg>Nahrát sen</button><button class="ns-btn2" type="button"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="13" r="7.2"/><path d="M12 9.5V13l2.4 1.6M4.5 4.6L2.8 6.3M19.5 4.6l1.7 1.7"/></svg>Vynechat WBTB</button></div>
  <div class="ns-hold">Ukončit noc: podrž 2 s</div>
</div></div>
<div class="nfoot"><label for="nt" class="btn block" role="button" tabindex="0">Vyzkoušet na celé obrazovce</label></div>

<nav class="tabbar" aria-label="Hlavní navigace"><a class="tab on" href="dnes_koncept.html" aria-current="page"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="3.2"/><ellipse cx="12" cy="12" rx="9.6" ry="4.2" transform="rotate(-24 12 12)"/></svg><span>Dnes</span></a><a class="tab" href="noc_mapa_snu.html"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M6 3.75h10.5A1.75 1.75 0 0 1 18.25 5.5v15H7.5A2.25 2.25 0 0 1 5.25 18.25V4.5a.75.75 0 0 1 .75-.75z"/><path d="M5.25 18.25A2.25 2.25 0 0 1 7.5 16h10.75"/><path d="M9 7.75h5.5M9 10.75h3.5"/></svg><span>Deník</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M8.5 12.5V6.2a1.2 1.2 0 0 1 2.4 0V11"/><path d="M10.9 10.5V4.9a1.2 1.2 0 0 1 2.4 0v5.6"/><path d="M13.3 10.5V5.9a1.2 1.2 0 0 1 2.4 0v5.4"/><path d="M15.7 11.3V8.4a1.2 1.2 0 0 1 2.4 0v5.1a6.6 6.6 0 0 1-6.6 6.6h-.4a6 6 0 0 1-4.8-2.4l-2.4-3.3a1.25 1.25 0 0 1 1.9-1.6l1.7 1.6"/></svg><span>Realita</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="8.6"/><circle cx="12" cy="12" r="4.6"/><circle cx="12" cy="12" r=".9" fill="currentColor"/><path d="M12 1.8v3M12 19.2v3M1.8 12h3M19.2 12h3"/></svg><span>Výcvik</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M19.6 14.6A8.2 8.2 0 0 1 9.4 4.4a8.2 8.2 0 1 0 10.2 10.2z"/><path d="M16.5 3.5v2.4M15.3 4.7h2.4"/></svg><span>Spánek</span></a><span class="gesture" aria-hidden="true"></span></nav>

<div class="ov" role="dialog" aria-label="Noční režim, náhled">
  <div class="close"><span class="sbn">Náhled</span><label for="nt">Zavřít náhled</label></div>
  <div class="ns" >
  <svg class="ns-stars" viewBox="0 0 390 300" width="390" height="300" aria-hidden="true"><circle cx="331.9" cy="152.7" r="0.6" fill="#5A120D" opacity="0.8740000000000001"/><circle cx="191.8" cy="274.3" r="0.4" fill="#5A120D" opacity="0.753"/><circle cx="324.3" cy="99.2" r="0.9" fill="#5A120D" opacity="0.495"/><circle cx="82.9" cy="78.9" r="0.8" fill="#5A120D" opacity="0.413"/><circle cx="103.7" cy="162.2" r="0.6" fill="#5A120D" opacity="0.278"/><circle cx="186.5" cy="91" r="0.8" fill="#5A120D" opacity="0.303"/><circle cx="12.1" cy="199" r="0.6" fill="#5A120D" opacity="0.7929999999999999"/><circle cx="84.7" cy="215.6" r="0.7" fill="#5A120D" opacity="0.302"/><circle cx="74.7" cy="215.1" r="0.5" fill="#5A120D" opacity="0.8959999999999999"/><circle cx="278.2" cy="69.7" r="0.5" fill="#5A120D" opacity="0.151"/><circle cx="187.3" cy="55" r="0.4" fill="#5A120D" opacity="0.486"/><circle cx="341.7" cy="231.3" r="0.8" fill="#5A120D" opacity="0.231"/><circle cx="78.2" cy="169.3" r="0.9" fill="#5A120D" opacity="0.6579999999999999"/><circle cx="375.8" cy="85.2" r="0.5" fill="#5A120D" opacity="0.6659999999999999"/><circle cx="111.4" cy="78.3" r="0.7" fill="#5A120D" opacity="0.384"/><circle cx="80.6" cy="289" r="0.8" fill="#5A120D" opacity="0.273"/><circle cx="150.2" cy="184.4" r="0.8" fill="#5A120D" opacity="0.7390000000000001"/><circle cx="237.7" cy="264.8" r="0.9" fill="#5A120D" opacity="0.382"/><circle cx="201.7" cy="19" r="0.7" fill="#5A120D" opacity="0.36700000000000005"/><circle cx="224.7" cy="85.2" r="0.7" fill="#5A120D" opacity="0.304"/><circle cx="103.9" cy="256.4" r="0.4" fill="#5A120D" opacity="0.9790000000000001"/><circle cx="194.6" cy="263.3" r="0.6" fill="#5A120D" opacity="0.769"/><circle cx="65.5" cy="66.5" r="0.9" fill="#5A120D" opacity="0.993"/><circle cx="71.6" cy="27.9" r="0.6" fill="#5A120D" opacity="0.855"/><circle cx="89.4" cy="144.2" r="0.6" fill="#5A120D" opacity="0.33"/><circle cx="53.8" cy="99.1" r="0.9" fill="#5A120D" opacity="0.435"/><circle cx="314.7" cy="191.6" r="0.8" fill="#5A120D" opacity="0.665"/><circle cx="33.7" cy="32.3" r="0.8" fill="#5A120D" opacity="0.927"/><circle cx="371.7" cy="44.9" r="0.5" fill="#5A120D" opacity="0.7020000000000001"/><circle cx="101.1" cy="277.9" r="0.9" fill="#5A120D" opacity="0.515"/><circle cx="3.3" cy="186.1" r="0.5" fill="#5A120D" opacity="0.66"/><circle cx="197.1" cy="256.1" r="0.8" fill="#5A120D" opacity="0.75"/><circle cx="244.6" cy="23" r="0.4" fill="#5A120D" opacity="0.708"/><circle cx="104.7" cy="56.4" r="0.4" fill="#5A120D" opacity="0.28300000000000003"/></svg>
  <div class="ns-top"><span class="nm">Noční režim · noc 37</span><span class="nm">Jas 2 %</span></div>
  <div class="ns-clock tnum">23:41</div>
  <p class="ns-hello">Dobrou noc. Displej polož dolů.</p>
  <div class="ns-card">
    <div class="ns-row"><span class="nm">Budík WBTB</span><span class="nm">za 4 h 59 min</span></div>
    <div class="ns-big tnum">04:40</div>
    <p class="ns-txt">V nejpravděpodobnější části noci, odhad REM okna 04:28–05:04. Pak 15 minut vzhůru, záměr a zpátky spát.</p>
    <div class="ns-key"><span><i></i>REM okno, odhad</span><span><b></b>TLR podnět</span></div>
    <svg viewBox="0 0 318 92" width="100%" height="92" role="img" aria-label="Odhad REM oken na dnešní noc, budík WBTB 04:40"><line x1="4" x2="314" y1="52" y2="52" stroke="#5A120D"/><rect x="49.6" y="40" width="9.7" height="24" fill="#5A120D"/><rect x="102.5" y="40" width="15.8" height="24" fill="#5A120D"/><rect x="154.7" y="40" width="19.5" height="24" fill="#5A120D"/><rect x="203.4" y="40" width="21.9" height="24" fill="#5A120D"/><rect x="241.1" y="40" width="19.4" height="24" fill="#5A120D"/><rect x="282.4" y="40" width="20.7" height="24" fill="#5A120D"/><line x1="28.9" x2="28.9" y1="30" y2="72" stroke="#FF3B2F" stroke-width="1.5"/><text x="32.9" y="36" class="sm12" fill="#FF3B2F">TEĎ</text><line x1="210.7" x2="210.7" y1="20" y2="72" stroke="#FF3B2F" stroke-width="2"/><path d="M205.7 20h10l-5 6z" fill="#FF3B2F"/><text x="210.7" y="13" text-anchor="middle" class="sm12" fill="#FF3B2F">BUDÍK 04:40</text><path d="M244.7 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M253.2 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M286 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><path d="M294.5 30l3.5 4-3.5 4-3.5-4z" fill="#FF3B2F"/><text x="4" y="88" text-anchor="start" class="sm12" fill="#FF3B2F">23:00</text><text x="76.9" y="88" text-anchor="middle" class="sm12" fill="#FF3B2F">01:00</text><text x="149.9" y="88" text-anchor="middle" class="sm12" fill="#FF3B2F">03:00</text><text x="314" y="88" text-anchor="end" class="sm12" fill="#FF3B2F">07:30</text></svg>
  </div>
  <div class="ns-two">
    <div class="ns-card"><div class="nm">TLR podnět</div><div class="ns-status"><i></i>Čeká</div><p class="ns-txt">Až po WBTB, max 3× za okno. Řídí se odhadem, ne živým měřením.</p></div>
    <div class="ns-card"><div class="nm">Záměr</div><p class="ns-int">Až uvidím vodu, zeptám se: sním?</p></div>
  </div>
  <button class="ns-btn" type="button"><span>Probudil jsem se ze snu</span><small>Uloží čas, sen pak namluvíš</small></button>
  <div class="ns-actions"><button class="ns-btn2" type="button"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="9" y="3" width="6" height="11" rx="3"/><path d="M5.5 11a6.5 6.5 0 0 0 13 0M12 17.5V21"/></svg>Nahrát sen</button><button class="ns-btn2" type="button"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="13" r="7.2"/><path d="M12 9.5V13l2.4 1.6M4.5 4.6L2.8 6.3M19.5 4.6l1.7 1.7"/></svg>Vynechat WBTB</button></div>
  <div class="ns-hold">Ukončit noc: podrž 2 s</div>
</div>
</div>
</div>
</body>
</html>
```

### noc_mapa_snu.html

```html
<!doctype html>
<html lang="cs">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#04060C">
<title>Mapa noci · deník</title>
<meta name="description" content="Deník jako noční časová osa: sny s časy, odhad REM oken z Oury a Garminu, TLR podněty, WBTB a Stopy snů.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#04060C;--panel:#0C1222;--panel-2:#111A30;--raise:#17213B;
  --line:rgba(233,237,245,.09);--line-2:rgba(233,237,245,.16);--line-3:rgba(233,237,245,.30);
  --text:#E9EDF5;--muted:#8D97AD;--faint:#7D879E;
  --accent:#FF5F1F;--accent-ink:#140600;--accent-soft:rgba(255,95,31,.13);--accent-line:rgba(255,95,31,.55);
  --ok:#3FD49A;--warn:#FFB443;--bad:#FF5A4E;
  --ev-strong:#5FE0B6;--ev-prom:#8DB9FF;--ev-comm:#C6AAFF;--ev-trad:#E6C17D;
  --night:#FF3B2F;--night-2:#B3261E;--night-3:#5A120D;
  --f-title:'Inter Tight','Inter Display','Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-text:'Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-mono:'JetBrains Mono',ui-monospace,'SFMono-Regular','Roboto Mono',Menlo,Consolas,monospace;
}
*{box-sizing:border-box;margin:0;padding:0}
html{background:var(--bg);-webkit-text-size-adjust:100%;color-scheme:dark}
body{background:var(--bg);color:var(--text);font:400 15px/1.5 var(--f-text);-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;font-feature-settings:"cv11","ss01";min-height:100vh}
a{color:inherit;text-decoration:none}
button{font:inherit;color:inherit;background:none;border:0;cursor:pointer}
input.sr{position:absolute;opacity:0;width:1px;height:1px;pointer-events:none}
.vh{position:absolute!important;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}
:focus-visible{outline:2px solid var(--accent);outline-offset:2px;border-radius:6px}
input.sr:focus-visible + label,input.sr:focus-visible + .lbl{outline:2px solid var(--accent);outline-offset:2px}
.tnum{font-variant-numeric:tabular-nums}

/* ---------- device frame ---------- */
.stage{position:relative}
.device{position:relative;width:100%;max-width:390px;margin:0 auto;background:var(--bg);overflow:clip;min-height:844px;isolation:isolate}
.caption{display:none}
@media (min-width:600px){
  body{background:radial-gradient(900px 600px at 50% -8%,#0E1832 0%,rgba(4,6,12,0) 70%),var(--bg);padding:48px 0 72px}
  .device{border-radius:46px;box-shadow:0 0 0 1px var(--line-2),0 0 0 10px #070A13,0 0 0 11px var(--line),0 50px 140px rgba(0,0,0,.75)}
  .caption{display:flex;justify-content:space-between;gap:16px;white-space:nowrap;max-width:390px;margin:0 auto 18px;font:500 12px/1.4 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
  .caption b{color:var(--text);font-weight:500}
}

/* ---------- status + app bar ---------- */
.sb{height:36px;display:flex;align-items:center;justify-content:space-between;padding:0 22px 0 26px;font:600 13px/1 var(--f-text);letter-spacing:.01em;position:relative;z-index:3}
.sb .ic{display:flex;gap:6px;align-items:center}
.appbar{display:flex;align-items:center;justify-content:space-between;height:52px;padding:0 8px 0 16px;position:relative;z-index:3}
.brand{display:flex;align-items:center;gap:10px}
.logo{font:700 17px/1 var(--f-title);letter-spacing:-.02em}
.logo sup{font-size:12px;color:var(--accent);margin-left:1px;vertical-align:7px}
.brand .mono{color:var(--muted)}
.ibtn{width:44px;height:44px;display:grid;place-items:center;border-radius:50%;color:var(--muted)}
.ibtn:hover{background:rgba(233,237,245,.06);color:var(--text)}

/* ---------- type ---------- */
.mono{font-family:var(--f-mono);font-size:12px;line-height:1.35;letter-spacing:.08em;text-transform:uppercase;font-weight:500}
.eyebrow{font:500 12px/1.3 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
.eyebrow .a{color:var(--accent)}
.display{font:600 34px/1.04 var(--f-title);letter-spacing:-.028em}
.h1{font:600 28px/1.08 var(--f-title);letter-spacing:-.024em}
.h2{font:600 21px/1.18 var(--f-title);letter-spacing:-.018em}
.h3{font:600 17px/1.25 var(--f-title);letter-spacing:-.01em}
.lead{font-size:16px;line-height:1.5;color:var(--text)}
.muted{color:var(--muted)}
.small{font-size:14px;line-height:1.45}
.src{font:400 12px/1.4 var(--f-mono);letter-spacing:.02em;color:var(--faint)}

/* ---------- section header ---------- */
.sh{display:flex;align-items:center;gap:10px;margin:40px 16px 14px}
.sh .n{font:500 12px/1 var(--f-mono);color:var(--accent);letter-spacing:.06em}
.sh h2{font:500 12px/1 var(--f-mono);letter-spacing:.12em;text-transform:uppercase;color:var(--text);white-space:nowrap}
.sh .rule{flex:1;height:1px;background:linear-gradient(90deg,var(--line-3),rgba(233,237,245,0))}
.sh .meta{font:500 12px/1 var(--f-mono);color:var(--muted);letter-spacing:.08em;text-transform:uppercase;white-space:nowrap}

/* ---------- panels with corner marks ---------- */
.panel{position:relative;margin:0 16px;background:linear-gradient(180deg,#0F1730 0%,var(--panel) 46%);border:1px solid var(--line);border-radius:4px;padding:16px}
.panel::after,.corners::after{content:"";position:absolute;inset:-1px;pointer-events:none;--c:var(--line-3);--k:12px;
  background:
   linear-gradient(var(--c) 0 0) 0 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 0 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/1px var(--k) no-repeat}
.panel.hot::after,.corners.hot::after{--c:var(--accent)}
.sub{background:rgba(4,6,12,.55);border:1px solid var(--line);border-radius:4px;padding:14px}
.hr{height:1px;background:var(--line);margin:16px 0}
.row{display:flex;align-items:center;gap:12px}
.between{display:flex;align-items:center;justify-content:space-between;gap:12px}

/* ---------- evidence chips ---------- */
.ev{display:inline-flex;align-items:center;gap:7px;height:24px;padding:0 8px 0 7px;border-radius:3px;font:600 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;white-space:nowrap;border:1px solid;background:rgba(255,255,255,.02)}
.ev i{display:inline-flex;gap:2px}
.ev i b{width:4px;height:9px;border-radius:1px;background:currentColor;opacity:.25}
.ev.strong{color:var(--ev-strong);border-color:rgba(95,224,182,.4);background:rgba(95,224,182,.07)}
.ev.prom{color:var(--ev-prom);border-color:rgba(141,185,255,.4);background:rgba(141,185,255,.07)}
.ev.comm{color:var(--ev-comm);border-color:rgba(198,170,255,.4);background:rgba(198,170,255,.07)}
.ev.trad{color:var(--ev-trad);border-color:rgba(230,193,125,.4);background:rgba(230,193,125,.07)}
.ev.strong i b{opacity:1}
.ev.prom i b:nth-child(-n+2){opacity:1}
.ev.comm i b:nth-child(1){opacity:1}
.ev.trad i b{width:7px;height:7px;border-radius:0;transform:rotate(45deg);opacity:1;background:none;border:1.2px solid currentColor}
.ev.trad i b+b{display:none}

/* ---------- tags & chips ---------- */
.tag{display:inline-flex;align-items:center;gap:6px;height:24px;padding:0 9px;border-radius:999px;font:500 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;color:var(--muted);border:1px solid var(--line-2);white-space:nowrap}
.tag.hot{color:var(--accent);border-color:var(--accent-line);background:var(--accent-soft)}
.tag.solid{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);font-weight:600}
.motif{display:inline-flex;align-items:center;gap:6px;height:26px;padding:0 10px 0 8px;border-radius:999px;font:500 13px/1 var(--f-text);color:var(--text);background:rgba(233,237,245,.06);border:1px solid var(--line-2);white-space:nowrap}
.motif .g{font:600 12px/1 var(--f-mono);color:var(--muted)}

/* ---------- buttons ---------- */
.btn{min-height:48px;padding:0 20px;border-radius:999px;font:600 15px/1 var(--f-text);display:inline-flex;align-items:center;justify-content:center;gap:10px;border:1px solid var(--line-2);color:var(--text);background:rgba(233,237,245,.04);transition:transform .15s ease,background .2s ease,border-color .2s;white-space:nowrap;cursor:pointer;user-select:none}
.btn:hover{background:rgba(233,237,245,.08);border-color:var(--line-3)}
.btn:active{transform:scale(.98)}
.btn.primary{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);box-shadow:0 10px 34px -8px rgba(255,95,31,.55)}
.btn.primary:hover{background:#FF7036}
.btn.ghost{border-color:transparent;background:none;color:var(--muted);padding:0 12px}
.btn.ghost:hover{color:var(--text)}
.btn.sm{min-height:44px;padding:0 16px;font-size:14px}
.btn.block{width:100%}
.lnk{display:inline-flex;align-items:center;gap:6px;min-height:44px;color:var(--accent);font:600 14px/1 var(--f-text)}
.lnk svg{transition:transform .2s}
.lnk:hover svg{transform:translateX(3px)}

/* ---------- switch ---------- */
.switch{position:relative;width:52px;height:32px;flex:none;border-radius:999px;background:rgba(233,237,245,.12);border:1px solid var(--line-2);transition:background .2s}
.switch::after{content:"";position:absolute;top:3px;left:3px;width:24px;height:24px;border-radius:50%;background:var(--muted);transition:transform .22s cubic-bezier(.3,.7,.3,1),background .2s}

/* ---------- tab bar ---------- */
.tabbar{position:sticky;bottom:0;z-index:30;display:grid;grid-template-columns:repeat(5,1fr);background:rgba(4,6,12,.92);-webkit-backdrop-filter:blur(16px);backdrop-filter:blur(16px);border-top:1px solid var(--line);padding:6px 4px 24px;margin-top:40px}
.tab{min-height:56px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:5px;color:var(--muted);font:500 12px/1 var(--f-text);position:relative;border-radius:12px}
.tab:hover{color:var(--text)}
.tab.on{color:var(--text);font-weight:600}
.tab.on svg{color:var(--accent)}
.tab.on::before{content:"";position:absolute;top:-7px;width:24px;height:2px;background:var(--accent);box-shadow:0 0 14px 1px rgba(255,95,31,.8)}
.gesture{position:absolute;bottom:8px;left:50%;width:112px;height:4px;border-radius:2px;background:rgba(233,237,245,.45);transform:translateX(-50%)}

/* ---------- svg text ---------- */
.sm12{font-family:var(--f-mono);font-size:12px;letter-spacing:.04em}
.sm13{font-family:var(--f-mono);font-size:13px;letter-spacing:.04em}
.st{font-family:var(--f-title)}

@keyframes tw{0%,100%{opacity:.25}50%{opacity:.9}}
.tw{animation:tw 4.5s ease-in-out infinite}
@keyframes pulse{0%{transform:scale(.6);opacity:.9}100%{transform:scale(2.4);opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition:none!important}}


.head{padding:6px 16px 0}
.head .h1{margin:8px 0 6px}
.seg{display:grid;grid-template-columns:repeat(3,1fr);margin:18px 16px 0;padding:3px;border-radius:999px;border:1px solid var(--line-2);background:rgba(233,237,245,.03)}
.seg a{min-height:42px;display:grid;place-items:center;border-radius:999px;font:500 14px/1 var(--f-text);color:var(--muted)}
.seg a.on{background:rgba(233,237,245,.1);color:var(--text);font-weight:600;box-shadow:inset 0 0 0 1px var(--line-3)}
.week{display:grid;grid-template-columns:repeat(7,1fr);gap:4px;margin:18px 12px 0}
.day{position:relative;min-height:74px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:5px;border-radius:4px;cursor:pointer;transition:background .2s}
.day:hover{background:rgba(233,237,245,.04)}
.day .dw{font:500 12px/1 var(--f-mono);letter-spacing:.08em;text-transform:uppercase;color:var(--muted)}
.day .dn{width:32px;height:32px;display:grid;place-items:center;border-radius:50%;font:600 16px/1 var(--f-title)}
.day.luc .dn{box-shadow:inset 0 0 0 1.5px var(--accent)}
.day .dots{display:flex;gap:3px;height:5px}
.day .dots i{width:5px;height:5px;border-radius:50%;background:var(--text);opacity:.75}
.day .dots i.e{background:none;border:1px solid var(--faint);opacity:.6}
.day.fut{cursor:default}.day.fut .dn{color:var(--faint)}
.week input:checked + .day{background:linear-gradient(180deg,rgba(255,95,31,.14),rgba(255,95,31,.02))}
.week input:checked + .day::after{content:"";position:absolute;inset:0;pointer-events:none;--c:var(--accent);background:linear-gradient(var(--c) 0 0) 0 0/8px 1.5px no-repeat,linear-gradient(var(--c) 0 0) 0 0/1.5px 8px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/8px 1.5px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/1.5px 8px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/8px 1.5px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/1.5px 8px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/8px 1.5px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/1.5px 8px no-repeat}
.week input:checked + .day .dw{color:var(--accent)}
.kpis{display:grid;grid-template-columns:.8fr .95fr 1.45fr 1fr;margin:16px 16px 0;border:1px solid var(--line);border-radius:4px;background:var(--line);gap:1px;overflow:hidden}
.kpis>div{background:var(--panel);padding:10px 10px 11px}
.kpis .mono{color:var(--muted);display:block}
.kpis b{display:block;font:600 19px/1.1 var(--f-title);letter-spacing:-.01em;margin-top:6px}
.kpis b.a{color:var(--accent)}
.kpis b small{font-size:13px;color:var(--muted);font-weight:500}
.nightmap{position:relative}
.filters{display:flex;gap:8px;overflow-x:auto;padding:2px 16px 4px;scrollbar-width:none;-webkit-mask-image:linear-gradient(90deg,#000 88%,transparent);mask-image:linear-gradient(90deg,#000 88%,transparent)}
.filters::-webkit-scrollbar{display:none}
.fchip{flex:none;min-height:44px;display:inline-flex;align-items:center;gap:8px;padding:0 8px 0 14px;border-radius:999px;border:1px solid var(--line-2);font:500 14px/1 var(--f-text);color:var(--muted);cursor:pointer;transition:all .2s}
.fchip b{min-width:24px;height:24px;padding:0 6px;display:grid;place-items:center;border-radius:999px;background:rgba(233,237,245,.1);font:600 12px/1 var(--f-mono);color:var(--text)}
.flabel{display:flex;justify-content:space-between;align-items:center;margin:0 16px 10px}
.map{position:relative;margin:14px 16px 0;height:938px}
.mapsvg{position:absolute;left:0;top:0;overflow:visible}
.arc{stroke:rgba(233,237,245,.28);stroke-width:1.1;stroke-dasharray:2 3;transition:stroke .3s,stroke-width .3s}
.dcard,.gcard{position:absolute;left:154px;width:204px;border-radius:4px;padding:10px 12px 11px}
.dcard{display:flex;flex-direction:column;gap:5px;background:rgba(12,18,34,.88);border:1px solid var(--line-2);-webkit-backdrop-filter:blur(3px);backdrop-filter:blur(3px);transition:border-color .3s,transform .2s}
a.dcard:hover{transform:translateX(2px)}
.dcard.lucid{background:linear-gradient(180deg,rgba(40,22,18,.92),rgba(12,18,34,.92));box-shadow:0 0 0 1px rgba(255,95,31,.25),0 14px 40px -12px rgba(255,95,31,.35)}
.dcard.lucid::after{content:"";position:absolute;inset:-1px;pointer-events:none;--c:var(--accent);--k:10px;background:linear-gradient(var(--c) 0 0) 0 0/var(--k) 1.5px no-repeat,linear-gradient(var(--c) 0 0) 0 0/1.5px var(--k) no-repeat,linear-gradient(var(--c) 0 0) 100% 0/var(--k) 1.5px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/1.5px var(--k) no-repeat,linear-gradient(var(--c) 0 0) 0 100%/var(--k) 1.5px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/1.5px var(--k) no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/var(--k) 1.5px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/1.5px var(--k) no-repeat}
.gcard{border:1px dashed var(--line-2);background:rgba(4,6,12,.6)}
.gcard p{font-size:13px;line-height:1.4;color:var(--muted);margin-top:6px}
.dc-top{display:flex;align-items:center;gap:6px;min-height:24px}
.dc-top .t{font:600 14px/1 var(--f-mono);letter-spacing:.02em}
.dcard.lucid .dc-top .t{color:var(--accent)}
.dc-top .rem{margin-left:auto;font:500 12px/1 var(--f-mono);letter-spacing:.04em;color:var(--muted);white-space:nowrap}
.dc-top .tag{height:22px;padding:0 7px}
.dc-title{font:600 16px/1.22 var(--f-title);letter-spacing:-.01em;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.dc-meta{display:flex;gap:12px;align-items:center;font:500 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;color:var(--muted)}
.dc-meta b{color:var(--text);font-weight:600;margin-left:2px}
.dcard.lucid .dc-meta b{color:var(--accent)}
.dc-chips .go{position:absolute;right:8px;bottom:14px;color:var(--accent);display:flex;align-items:center}
.mchip{flex:none}
.dc-chips{display:flex;gap:6px;margin-top:3px;overflow:hidden}
.dcard.lucid .dc-chips{padding-right:26px}
.mchip{height:24px;padding:0 9px;display:inline-flex;align-items:center;border-radius:999px;border:1px solid var(--line-2);font:500 13px/1 var(--f-text);color:var(--muted);transition:all .3s}
.mchip.more{color:var(--faint)}
.lgd{display:grid;grid-template-columns:1fr 1fr;gap:12px 14px;margin:6px 16px 0;padding:16px 0 0;border-top:1px solid var(--line)}
.lgd>div{display:flex;gap:10px;align-items:flex-start;font-size:13px;line-height:1.35;color:var(--muted)}
.lgd svg{flex:none;margin-top:0}
.ins .h2{margin:8px 0 8px}
.ins .bars{display:flex;flex-direction:column;gap:10px;margin:16px 0 4px}
.ins .bars>div{display:grid;grid-template-columns:64px 1fr 44px;align-items:center;gap:10px;font-size:14px}
.ins .bars .tr{height:6px;border-radius:3px;background:rgba(233,237,245,.08);overflow:hidden}
.ins .bars .tr i{display:block;height:100%;border-radius:3px;background:var(--text)}
.ins .bars .tr i.a{background:var(--accent)}
.ins .bars .n{font:500 12px/1 var(--f-mono);color:var(--muted);text-align:right}
.model p{font-size:14px;color:var(--muted);margin-top:12px}
.srcs{display:flex;gap:16px;flex-wrap:wrap;font-size:14px;color:var(--text)}.srcs span{display:inline-flex;align-items:center;gap:7px}.srcs svg{color:var(--muted)}
.model .eq{margin-top:12px;padding:10px 12px;border-radius:4px;background:rgba(4,6,12,.6);border:1px solid var(--line);font:400 13px/1.5 var(--f-mono);color:var(--text)}
.model .eq span{color:var(--muted)}
.addbtn{margin:20px 16px 0;width:calc(100% - 32px)}

#mf-voda:checked ~ .filters label[for="mf-voda"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-voda:checked ~ .filters label[for="mf-voda"] b{background:var(--accent);color:var(--accent-ink)}
#mf-voda:checked ~ .map .arc.voda{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-voda:checked ~ .map .star.m-voda .sel{opacity:1}
#mf-voda:checked ~ .map .dcard[data-m~="voda"]{border-color:rgba(255,95,31,.55)}
#mf-voda:checked ~ .map .dcard[data-m~="voda"] .mchip.m-voda{color:var(--accent);border-color:var(--accent-line)}
#mf-skola:checked ~ .filters label[for="mf-skola"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-skola:checked ~ .filters label[for="mf-skola"] b{background:var(--accent);color:var(--accent-ink)}
#mf-skola:checked ~ .map .arc.skola{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-skola:checked ~ .map .star.m-skola .sel{opacity:1}
#mf-skola:checked ~ .map .dcard[data-m~="skola"]{border-color:rgba(255,95,31,.55)}
#mf-skola:checked ~ .map .dcard[data-m~="skola"] .mchip.m-skola{color:var(--accent);border-color:var(--accent-line)}
#mf-letani:checked ~ .filters label[for="mf-letani"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-letani:checked ~ .filters label[for="mf-letani"] b{background:var(--accent);color:var(--accent-ink)}
#mf-letani:checked ~ .map .arc.letani{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-letani:checked ~ .map .star.m-letani .sel{opacity:1}
#mf-letani:checked ~ .map .dcard[data-m~="letani"]{border-color:rgba(255,95,31,.55)}
#mf-letani:checked ~ .map .dcard[data-m~="letani"] .mchip.m-letani{color:var(--accent);border-color:var(--accent-line)}
#mf-prsty:checked ~ .filters label[for="mf-prsty"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-prsty:checked ~ .filters label[for="mf-prsty"] b{background:var(--accent);color:var(--accent-ink)}
#mf-prsty:checked ~ .map .arc.prsty{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-prsty:checked ~ .map .star.m-prsty .sel{opacity:1}
#mf-prsty:checked ~ .map .dcard[data-m~="prsty"]{border-color:rgba(255,95,31,.55)}
#mf-prsty:checked ~ .map .dcard[data-m~="prsty"] .mchip.m-prsty{color:var(--accent);border-color:var(--accent-line)}
#mf-vlak:checked ~ .filters label[for="mf-vlak"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-vlak:checked ~ .filters label[for="mf-vlak"] b{background:var(--accent);color:var(--accent-ink)}
#mf-vlak:checked ~ .map .arc.vlak{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-vlak:checked ~ .map .star.m-vlak .sel{opacity:1}
#mf-vlak:checked ~ .map .dcard[data-m~="vlak"]{border-color:rgba(255,95,31,.55)}
#mf-vlak:checked ~ .map .dcard[data-m~="vlak"] .mchip.m-vlak{color:var(--accent);border-color:var(--accent-line)}
#mf-hodiny:checked ~ .filters label[for="mf-hodiny"]{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
#mf-hodiny:checked ~ .filters label[for="mf-hodiny"] b{background:var(--accent);color:var(--accent-ink)}
#mf-hodiny:checked ~ .map .arc.hodiny{stroke:#FF5F1F;stroke-opacity:.95;stroke-width:1.6;stroke-dasharray:none}
#mf-hodiny:checked ~ .map .star.m-hodiny .sel{opacity:1}
#mf-hodiny:checked ~ .map .dcard[data-m~="hodiny"]{border-color:rgba(255,95,31,.55)}
#mf-hodiny:checked ~ .map .dcard[data-m~="hodiny"] .mchip.m-hodiny{color:var(--accent);border-color:var(--accent-line)}

</style>
</head>
<body>
<div class="caption" aria-hidden="true"><span><b>Za hranice reality</b></span><span>Koncept · Mapa noci</span></div>
<div class="device">
<div class="sb" ><span class="tnum">07:18</span><span class="ic" aria-hidden="true">
<svg width="17" height="12" viewBox="0 0 17 12"><rect x="0" y="8" width="3" height="4" rx=".8" fill="currentColor"/><rect x="4.6" y="5.5" width="3" height="6.5" rx=".8" fill="currentColor"/><rect x="9.2" y="3" width="3" height="9" rx=".8" fill="currentColor"/><rect x="13.8" y="0" width="3" height="12" rx=".8" fill="currentColor" opacity=".35"/></svg>
<svg width="16" height="12" viewBox="0 0 16 12"><path d="M8 11.5l2.6-3.1a4 4 0 0 0-5.2 0z" fill="currentColor"/><path d="M2.8 5.4a7.8 7.8 0 0 1 10.4 0M.6 2.9a11 11 0 0 1 14.8 0" stroke="currentColor" stroke-width="1.5" fill="none" stroke-linecap="round"/></svg>
<svg width="26" height="12" viewBox="0 0 26 12"><rect x=".75" y=".75" width="21.5" height="10.5" rx="3" stroke="currentColor" stroke-width="1.2" fill="none" opacity=".55"/><rect x="2.5" y="2.5" width="14" height="7" rx="1.6" fill="currentColor"/><rect x="23.4" y="4" width="1.8" height="4" rx=".8" fill="currentColor" opacity=".55"/></svg>
</span></div>
<header class="appbar">
  <div class="brand"><span class="logo">Já<sup>2</sup></span><span class="mono">Deník</span></div>
  <div class="row" style="gap:0"><button class="ibtn" aria-label="Hledat ve snech"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="11" cy="11" r="6.5"/><path d="M16 16l4.5 4.5"/></svg></button><button class="ibtn" aria-label="Zapsat sen"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M12 5v14M5 12h14"/></svg></button></div>
</header>
<section class="head">
  <div class="eyebrow">Mapa noci · <span class="a">pá 23. 10.</span></div>
  <h1 class="h1">Noc na pátek</h1>
  <p class="small muted">V posteli 23:10–07:05. Čtyři sny, jeden lucidní.</p>
</section>
<nav class="seg" aria-label="Pohled deníku"><a class="on" href="#" aria-current="page">Mapa noci</a><a href="#">Seznam</a><a href="#">Stopy snů</a></nav>
<div class="week" role="radiogroup" aria-label="Noci tohoto týdne"><input type="radio" name="wk" id="wk19" class="sr"  ><label for="wk19" class="day" aria-label="Po 19. 2 sny"><span class="dw">Po</span><span class="dn">19</span><span class="dots"><i></i><i></i></span></label><input type="radio" name="wk" id="wk20" class="sr"  ><label for="wk20" class="day" aria-label="Út 20. 1 sny"><span class="dw">Út</span><span class="dn">20</span><span class="dots"><i></i></span></label><input type="radio" name="wk" id="wk21" class="sr"  ><label for="wk21" class="day luc" aria-label="St 21. 3 sny"><span class="dw">St</span><span class="dn">21</span><span class="dots"><i></i><i></i><i></i></span></label><input type="radio" name="wk" id="wk22" class="sr"  ><label for="wk22" class="day" aria-label="Čt 22. 2 sny"><span class="dw">Čt</span><span class="dn">22</span><span class="dots"><i></i><i></i></span></label><input type="radio" name="wk" id="wk23" class="sr" checked ><label for="wk23" class="day luc" aria-label="Pá 23. 4 sny"><span class="dw">Pá</span><span class="dn">23</span><span class="dots"><i></i><i></i><i></i><i></i></span></label><input type="radio" name="wk" id="wk24" class="sr"  disabled><label for="wk24" class="day fut" aria-label="So 24. zatím bez záznamu"><span class="dw">So</span><span class="dn">24</span><span class="dots"><i class="e"></i></span></label><input type="radio" name="wk" id="wk25" class="sr"  disabled><label for="wk25" class="day fut" aria-label="Ne 25. zatím bez záznamu"><span class="dw">Ne</span><span class="dn">25</span><span class="dots"><i class="e"></i></span></label></div>
<div class="kpis">
  <div><span class="mono">Sny</span><b>4</b></div>
  <div><span class="mono">Lucidní</span><b class="a">1</b></div>
  <div><span class="mono">REM</span><b class="tnum">≈1:40–2:20</b></div>
  <div><span class="mono">Shoda</span><b class="tnum">73<small> %</small></b></div>
</div>

<div class="sh"><span class="n">01</span><h2>Hvězdná mapa noci</h2><span class="rule"></span><span class="meta">Odhad REM</span></div>
<section class="nightmap" aria-label="Časová osa noci se sny a odhadem REM oken">
  <input type="radio" name="mf" id="mf-voda" class="sr" checked><input type="radio" name="mf" id="mf-skola" class="sr" ><input type="radio" name="mf" id="mf-letani" class="sr" ><input type="radio" name="mf" id="mf-prsty" class="sr" ><input type="radio" name="mf" id="mf-vlak" class="sr" ><input type="radio" name="mf" id="mf-hodiny" class="sr" >
  <div class="flabel"><span class="mono muted">Zvýraznit Stopu snu</span><span class="mono muted">tato noc</span></div>
  <div class="filters" role="radiogroup" aria-label="Zvýraznit Stopu snu"><label for="mf-voda" class="fchip"><span>Voda</span><b>3</b></label><label for="mf-skola" class="fchip"><span>Škola</span><b>3</b></label><label for="mf-letani" class="fchip"><span>Létání</span><b>1</b></label><label for="mf-prsty" class="fchip"><span>Prsty</span><b>1</b></label><label for="mf-vlak" class="fchip"><span>Vlak</span><b>1</b></label><label for="mf-hodiny" class="fchip"><span>Hodiny</span><b>1</b></label></div>
  <div class="map">
    <svg class="mapsvg" viewBox="0 0 358 938" width="358" height="938" aria-hidden="true">
<defs>
  <filter id="soft" x="-10%" y="-60%" width="120%" height="220%"><feGaussianBlur stdDeviation="4"/></filter>
  <radialGradient id="starg"><stop offset="0" stop-color="#fff"/><stop offset=".35" stop-color="#E9EDF5"/><stop offset="1" stop-color="#E9EDF5" stop-opacity="0"/></radialGradient>
  <radialGradient id="lucg"><stop offset="0" stop-color="#FF5F1F" stop-opacity=".5"/><stop offset="1" stop-color="#FF5F1F" stop-opacity="0"/></radialGradient>
  <pattern id="hatch" width="6" height="6" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><line x1="0" y1="0" x2="0" y2="6" stroke="rgba(233,237,245,.16)" stroke-width="1.2"/></pattern>
</defs><g><circle cx="33.2" cy="64.1" r="0.5" fill="#E9EDF5" opacity="0.28"/><circle cx="76.7" cy="480.3" r="1.4" fill="#E9EDF5" opacity="0.154" class="tw" style="animation-delay:2.8s"/><circle cx="30.9" cy="924.4" r="0.6" fill="#E9EDF5" opacity="0.447"/><circle cx="19.8" cy="424.3" r="0.9" fill="#E9EDF5" opacity="0.235"/><circle cx="302.8" cy="215.9" r="0.8" fill="#E9EDF5" opacity="0.213"/><circle cx="256.1" cy="348.3" r="0.9" fill="#E9EDF5" opacity="0.456"/><circle cx="320.4" cy="856.4" r="0.8" fill="#E9EDF5" opacity="0.433"/><circle cx="77.8" cy="291.6" r="0.8" fill="#E9EDF5" opacity="0.531"/><circle cx="289.9" cy="605.3" r="0.8" fill="#E9EDF5" opacity="0.231"/><circle cx="141.2" cy="752.5" r="0.7" fill="#E9EDF5" opacity="0.509"/><circle cx="277.7" cy="4.7" r="0.6" fill="#E9EDF5" opacity="0.45"/><circle cx="129.6" cy="274.5" r="0.4" fill="#E9EDF5" opacity="0.231"/><circle cx="231.9" cy="79.9" r="0.9" fill="#E9EDF5" opacity="0.428"/><circle cx="65.6" cy="162.3" r="0.7" fill="#E9EDF5" opacity="0.273"/><circle cx="24.9" cy="779" r="0.8" fill="#E9EDF5" opacity="0.433"/><circle cx="8.3" cy="156.1" r="0.7" fill="#E9EDF5" opacity="0.237"/><circle cx="148.6" cy="225.1" r="0.7" fill="#E9EDF5" opacity="0.5479999999999999"/><circle cx="8.2" cy="661.7" r="0.4" fill="#E9EDF5" opacity="0.536"/><circle cx="207.6" cy="637.8" r="1.4" fill="#E9EDF5" opacity="0.488" class="tw" style="animation-delay:0.8s"/><circle cx="280.7" cy="582.7" r="0.7" fill="#E9EDF5" opacity="0.43200000000000005"/><circle cx="214" cy="557.3" r="0.8" fill="#E9EDF5" opacity="0.23199999999999998"/><circle cx="348" cy="674.1" r="0.4" fill="#E9EDF5" opacity="0.519"/><circle cx="56.4" cy="413.4" r="0.5" fill="#E9EDF5" opacity="0.155"/><circle cx="297.7" cy="517" r="0.7" fill="#E9EDF5" opacity="0.515"/><circle cx="52.5" cy="222.4" r="0.4" fill="#E9EDF5" opacity="0.34700000000000003"/><circle cx="176.5" cy="564.6" r="0.4" fill="#E9EDF5" opacity="0.195"/><circle cx="225.1" cy="386.6" r="0.6" fill="#E9EDF5" opacity="0.19699999999999998"/><circle cx="293.2" cy="857" r="0.8" fill="#E9EDF5" opacity="0.366"/><circle cx="129.7" cy="237.8" r="0.6" fill="#E9EDF5" opacity="0.364"/><circle cx="66.5" cy="114.7" r="0.8" fill="#E9EDF5" opacity="0.268"/><circle cx="258.7" cy="733.5" r="0.4" fill="#E9EDF5" opacity="0.40299999999999997"/><circle cx="299.9" cy="620.7" r="1" fill="#E9EDF5" opacity="0.43799999999999994" class="tw" style="animation-delay:0.7s"/><path d="M296.4 620.7H303.4M299.9 617.2V624.2" stroke="#E9EDF5" stroke-width=".5" opacity="0.2628"/><circle cx="288.9" cy="290.6" r="0.7" fill="#E9EDF5" opacity="0.41700000000000004"/><circle cx="319.8" cy="269.5" r="0.4" fill="#E9EDF5" opacity="0.488"/><circle cx="247.3" cy="895.2" r="0.4" fill="#E9EDF5" opacity="0.494"/><circle cx="95.6" cy="119.8" r="0.7" fill="#E9EDF5" opacity="0.158"/><circle cx="323.6" cy="262.1" r="1.1" fill="#E9EDF5" opacity="0.17800000000000002" class="tw" style="animation-delay:0.9s"/><path d="M320.1 262.1H327.1M323.6 258.6V265.6" stroke="#E9EDF5" stroke-width=".5" opacity="0.1068"/><circle cx="220.4" cy="135.7" r="0.6" fill="#E9EDF5" opacity="0.281"/><circle cx="143" cy="763.2" r="0.6" fill="#E9EDF5" opacity="0.304"/><circle cx="295.9" cy="431.3" r="0.8" fill="#E9EDF5" opacity="0.242"/><circle cx="206" cy="120" r="0.5" fill="#E9EDF5" opacity="0.531"/><circle cx="65.5" cy="345.1" r="0.9" fill="#E9EDF5" opacity="0.3"/><circle cx="233.3" cy="582" r="1" fill="#E9EDF5" opacity="0.505" class="tw" style="animation-delay:1.6s"/><circle cx="140.5" cy="294.4" r="0.4" fill="#E9EDF5" opacity="0.225"/><circle cx="187.7" cy="731.5" r="1" fill="#E9EDF5" opacity="0.47" class="tw" style="animation-delay:3.8s"/><circle cx="173.8" cy="822.5" r="0.8" fill="#E9EDF5" opacity="0.243"/><circle cx="63.5" cy="733.3" r="0.7" fill="#E9EDF5" opacity="0.19"/><circle cx="176.9" cy="465.5" r="0.5" fill="#E9EDF5" opacity="0.287"/><circle cx="185.4" cy="546.4" r="0.8" fill="#E9EDF5" opacity="0.457"/><circle cx="318.9" cy="23.7" r="0.5" fill="#E9EDF5" opacity="0.27399999999999997"/><circle cx="181.9" cy="15.5" r="0.8" fill="#E9EDF5" opacity="0.349"/><circle cx="76.7" cy="594.4" r="0.4" fill="#E9EDF5" opacity="0.273"/><circle cx="146.3" cy="91.5" r="0.5" fill="#E9EDF5" opacity="0.20600000000000002"/><circle cx="347.1" cy="709.9" r="0.6" fill="#E9EDF5" opacity="0.47200000000000003"/><circle cx="47.9" cy="500.2" r="0.5" fill="#E9EDF5" opacity="0.503"/><circle cx="115.2" cy="260.4" r="0.5" fill="#E9EDF5" opacity="0.5"/><circle cx="202.2" cy="492.3" r="0.8" fill="#E9EDF5" opacity="0.415"/><circle cx="258.7" cy="512.7" r="0.4" fill="#E9EDF5" opacity="0.355"/><circle cx="16.4" cy="402.7" r="0.4" fill="#E9EDF5" opacity="0.233"/><circle cx="221.6" cy="53.2" r="0.5" fill="#E9EDF5" opacity="0.428"/><circle cx="118.8" cy="171.7" r="0.5" fill="#E9EDF5" opacity="0.26899999999999996"/><circle cx="329.5" cy="89.3" r="0.7" fill="#E9EDF5" opacity="0.5479999999999999"/><circle cx="211.7" cy="68" r="1" fill="#E9EDF5" opacity="0.35200000000000004" class="tw" style="animation-delay:1.7s"/><circle cx="65.3" cy="311.4" r="1.2" fill="#E9EDF5" opacity="0.43" class="tw" style="animation-delay:3.9s"/><path d="M61.8 311.4H68.8M65.3 307.9V314.9" stroke="#E9EDF5" stroke-width=".5" opacity="0.258"/><circle cx="42.2" cy="316.6" r="0.8" fill="#E9EDF5" opacity="0.27899999999999997"/><circle cx="150.1" cy="714.3" r="0.5" fill="#E9EDF5" opacity="0.26"/><circle cx="254.3" cy="593.8" r="0.6" fill="#E9EDF5" opacity="0.22399999999999998"/><circle cx="154.5" cy="259.6" r="0.6" fill="#E9EDF5" opacity="0.368"/><circle cx="277.6" cy="681.4" r="0.7" fill="#E9EDF5" opacity="0.299"/><circle cx="311.1" cy="568.9" r="0.5" fill="#E9EDF5" opacity="0.396"/><circle cx="109.6" cy="566.1" r="0.7" fill="#E9EDF5" opacity="0.511"/><circle cx="165.7" cy="39.1" r="0.4" fill="#E9EDF5" opacity="0.223"/><circle cx="137.5" cy="510" r="0.9" fill="#E9EDF5" opacity="0.473"/><circle cx="162.3" cy="262" r="0.8" fill="#E9EDF5" opacity="0.314"/><circle cx="326.5" cy="17.2" r="0.5" fill="#E9EDF5" opacity="0.249"/><circle cx="117.1" cy="355.3" r="0.9" fill="#E9EDF5" opacity="0.35100000000000003"/><circle cx="351.9" cy="389.4" r="0.7" fill="#E9EDF5" opacity="0.525"/><circle cx="189.7" cy="871.1" r="0.9" fill="#E9EDF5" opacity="0.5329999999999999"/><circle cx="193.5" cy="886.4" r="0.5" fill="#E9EDF5" opacity="0.366"/><circle cx="224.3" cy="209.7" r="0.7" fill="#E9EDF5" opacity="0.502"/><circle cx="346.8" cy="239" r="0.6" fill="#E9EDF5" opacity="0.374"/><circle cx="47.3" cy="850.4" r="0.8" fill="#E9EDF5" opacity="0.501"/><circle cx="241.3" cy="389.6" r="1.3" fill="#E9EDF5" opacity="0.25" class="tw" style="animation-delay:3.4s"/><circle cx="97.9" cy="438.9" r="0.8" fill="#E9EDF5" opacity="0.23399999999999999"/><circle cx="94.9" cy="911.3" r="0.6" fill="#E9EDF5" opacity="0.365"/><circle cx="18.4" cy="866.7" r="0.4" fill="#E9EDF5" opacity="0.528"/><circle cx="40.7" cy="932.8" r="0.7" fill="#E9EDF5" opacity="0.331"/><circle cx="54.8" cy="148.9" r="1" fill="#E9EDF5" opacity="0.198" class="tw" style="animation-delay:0s"/><circle cx="218.4" cy="696.8" r="0.9" fill="#E9EDF5" opacity="0.524" class="tw" style="animation-delay:3s"/><circle cx="62" cy="931.1" r="0.8" fill="#E9EDF5" opacity="0.46799999999999997"/></g><line x1="40" x2="358" y1="126" y2="126" stroke="rgba(233,237,245,.06)"/><text x="0" y="130" class="sm12" fill="#7D879E">00:00</text><line x1="40" x2="358" y1="222" y2="222" stroke="rgba(233,237,245,.06)"/><text x="0" y="226" class="sm12" fill="#7D879E">01:00</text><line x1="40" x2="358" y1="318" y2="318" stroke="rgba(233,237,245,.06)"/><text x="0" y="322" class="sm12" fill="#7D879E">02:00</text><line x1="40" x2="358" y1="414" y2="414" stroke="rgba(233,237,245,.06)"/><text x="0" y="418" class="sm12" fill="#7D879E">03:00</text><line x1="40" x2="358" y1="510" y2="510" stroke="rgba(233,237,245,.06)"/><text x="0" y="514" class="sm12" fill="#7D879E">04:00</text><line x1="40" x2="358" y1="606" y2="606" stroke="rgba(233,237,245,.06)"/><text x="0" y="610" class="sm12" fill="#7D879E">05:00</text><line x1="40" x2="358" y1="702" y2="702" stroke="rgba(233,237,245,.06)"/><text x="0" y="706" class="sm12" fill="#7D879E">06:00</text><line x1="40" x2="358" y1="798" y2="798" stroke="rgba(233,237,245,.06)"/><text x="0" y="50" class="sm12" fill="#E9EDF5">23:10</text><text x="0" y="810" class="sm12" fill="#E9EDF5">07:05</text><rect x="40" y="190" width="318" height="24" fill="#FF5F1F" opacity=".16" filter="url(#soft)"/><rect x="40" y="194.8" width="318" height="16" fill="#FF5F1F" opacity=".13"/><line x1="40" x2="358" y1="194.8" y2="194.8" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><line x1="40" x2="358" y1="210.8" y2="210.8" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><rect x="40" y="334" width="318" height="40" fill="#FF5F1F" opacity=".16" filter="url(#soft)"/><rect x="40" y="340.4" width="318" height="25.6" fill="#FF5F1F" opacity=".13"/><line x1="40" x2="358" y1="340.4" y2="340.4" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><line x1="40" x2="358" y1="366" y2="366" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><rect x="40" y="513.2" width="318" height="44.8" fill="#FF5F1F" opacity=".16" filter="url(#soft)"/><rect x="40" y="522.8" width="318" height="35.2" fill="#FF5F1F" opacity=".13"/><line x1="40" x2="358" y1="522.8" y2="522.8" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><line x1="40" x2="358" y1="558" y2="558" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><rect x="40" y="620.4" width="318" height="54.4" fill="#FF5F1F" opacity=".16" filter="url(#soft)"/><rect x="40" y="625.2" width="318" height="41.6" fill="#FF5F1F" opacity=".13"/><line x1="40" x2="358" y1="625.2" y2="625.2" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><line x1="40" x2="358" y1="666.8" y2="666.8" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><rect x="40" y="738.8" width="318" height="59.2" fill="#FF5F1F" opacity=".16" filter="url(#soft)"/><rect x="40" y="746.8" width="318" height="44.8" fill="#FF5F1F" opacity=".13"/><line x1="40" x2="358" y1="746.8" y2="746.8" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><line x1="40" x2="358" y1="791.6" y2="791.6" stroke="#FF5F1F" stroke-opacity=".35" stroke-dasharray="1 3"/><rect x="40" y="558" width="318" height="35.2" fill="url(#hatch)"/><line x1="40" x2="358" y1="558" y2="558" stroke="#E9EDF5" stroke-opacity=".5" stroke-dasharray="4 3"/><text x="0" y="579.6" class="sm12" fill="#FF5F1F">WBTB</text><rect x="44" y="46" width="9" height="22.4" fill="#C9D0DE" opacity=".85"/><rect x="44" y="68.4" width="9" height="22.4" fill="#3A4560"/><rect x="44" y="90.8" width="9" height="70.4" fill="#2A3F78"/><rect x="44" y="161.2" width="9" height="28.8" fill="#3A4560"/><rect x="44" y="190" width="9" height="24" fill="#FF5F1F"/><rect x="44" y="214" width="9" height="17.6" fill="#3A4560"/><rect x="44" y="231.6" width="9" height="51.2" fill="#2A3F78"/><rect x="44" y="282.8" width="9" height="51.2" fill="#3A4560"/><rect x="44" y="334" width="9" height="32" fill="#FF5F1F"/><rect x="44" y="366" width="9" height="11.2" fill="#C9D0DE" opacity=".85"/><rect x="44" y="377.2" width="9" height="40" fill="#3A4560"/><rect x="44" y="417.2" width="9" height="46.4" fill="#2A3F78"/><rect x="44" y="463.6" width="9" height="59.2" fill="#3A4560"/><rect x="44" y="522.8" width="9" height="35.2" fill="#FF5F1F"/><rect x="44" y="558" width="9" height="35.2" fill="#C9D0DE" opacity=".85"/><rect x="44" y="593.2" width="9" height="27.2" fill="#3A4560"/><rect x="44" y="620.4" width="9" height="46.4" fill="#FF5F1F"/><rect x="44" y="666.8" width="9" height="9.6" fill="#C9D0DE" opacity=".85"/><rect x="44" y="676.4" width="9" height="70.4" fill="#3A4560"/><rect x="44" y="746.8" width="9" height="51.2" fill="#FF5F1F"/><rect x="44" y="798" width="9" height="8" fill="#C9D0DE" opacity=".85"/><text x="48.5" y="28" text-anchor="middle" class="sm12" fill="#8D97AD">O</text><rect x="57" y="46" width="9" height="22.4" fill="#C9D0DE" opacity=".85"/><rect x="57" y="68.4" width="9" height="43.2" fill="#3A4560"/><rect x="57" y="111.6" width="9" height="49.6" fill="#2A3F78"/><rect x="57" y="161.2" width="9" height="33.6" fill="#3A4560"/><rect x="57" y="194.8" width="9" height="16" fill="#FF5F1F"/><rect x="57" y="210.8" width="9" height="33.6" fill="#3A4560"/><rect x="57" y="244.4" width="9" height="38.4" fill="#2A3F78"/><rect x="57" y="282.8" width="9" height="57.6" fill="#3A4560"/><rect x="57" y="340.4" width="9" height="33.6" fill="#FF5F1F"/><rect x="57" y="374" width="9" height="3.2" fill="#C9D0DE" opacity=".85"/><rect x="57" y="377.2" width="9" height="28.8" fill="#3A4560"/><rect x="57" y="406" width="9" height="46.4" fill="#2A3F78"/><rect x="57" y="452.4" width="9" height="60.8" fill="#3A4560"/><rect x="57" y="513.2" width="9" height="44.8" fill="#FF5F1F"/><rect x="57" y="558" width="9" height="35.2" fill="#C9D0DE" opacity=".85"/><rect x="57" y="593.2" width="9" height="32" fill="#3A4560"/><rect x="57" y="625.2" width="9" height="49.6" fill="#FF5F1F"/><rect x="57" y="674.8" width="9" height="1.6" fill="#C9D0DE" opacity=".85"/><rect x="57" y="676.4" width="9" height="62.4" fill="#3A4560"/><rect x="57" y="738.8" width="9" height="52.8" fill="#FF5F1F"/><rect x="57" y="791.6" width="9" height="3.2" fill="#3A4560"/><rect x="57" y="794.8" width="9" height="11.2" fill="#C9D0DE" opacity=".85"/><text x="61.5" y="28" text-anchor="middle" class="sm12" fill="#8D97AD">G</text><text x="84" y="28" text-anchor="middle" class="sm12" fill="#8D97AD">TLR</text><line x1="84" x2="84" y1="46" y2="806" stroke="rgba(233,237,245,.08)"/><path d="M84 625.5l4 4.5-4 4.5-4-4.5z" fill="#FF5F1F"/><path d="M84 636.7l4 4.5-4 4.5-4-4.5z" fill="#FF5F1F"/><path d="M84 750.3l4 4.5-4 4.5-4-4.5z" fill="#FF5F1F"/><path d="M84 761.5l4 4.5-4 4.5-4-4.5z" fill="#FF5F1F"/><path d="M84 772.7l4 4.5-4 4.5-4-4.5z" fill="#FF5F1F"/><line x1="138" x2="138" y1="36" y2="814" stroke="rgba(233,237,245,.28)"/><line x1="135" x2="141" y1="46" y2="46" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="94" y2="94" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="142" y2="142" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="190" y2="190" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="238" y2="238" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="286" y2="286" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="334" y2="334" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="382" y2="382" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="430" y2="430" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="478" y2="478" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="526" y2="526" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="574" y2="574" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="622" y2="622" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="670" y2="670" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="718" y2="718" stroke="rgba(233,237,245,.35)"/><line x1="135" x2="141" y1="766" y2="766" stroke="rgba(233,237,245,.35)"/><circle cx="138" cy="46" r="3" fill="none" stroke="#E9EDF5"/><circle cx="138" cy="68.4" r="2" fill="#8D97AD"/><circle cx="138" cy="806" r="3" fill="#E9EDF5"/><text x="154" y="50" class="sm12" fill="#E9EDF5">ULEHNUTÍ 23:10</text><text x="154" y="74.4" class="sm12" fill="#8D97AD">USNUTÍ ~23:24</text><text x="154" y="133.2" font-size="13" fill="#7D879E" style="font-family:var(--f-text)">Hlavně hluboký spánek</text><text x="154" y="278" font-size="13" fill="#7D879E" style="font-family:var(--f-text)">K ránu se REM okna</text><text x="154" y="296" font-size="13" fill="#7D879E" style="font-family:var(--f-text)">prodlužují.</text><path class="arc voda" d="M122.5 370.8C99.2 370.8 99.2 558 123.2 558" fill="none"/><path class="arc voda" d="M123.2 558C105.8 558 105.8 671.6 120.2 671.6" fill="none"/><path class="arc skola" d="M123.2 558C93.8 558 93.8 671.6 120.2 671.6" fill="none"/><path class="arc skola" d="M120.2 671.6C104.8 671.6 104.8 796.4 124 796.4" fill="none"/><path d="M154.5 370.8H144L154 368.8" stroke="rgba(233,237,245,.3)" fill="none"/><g class="star m-voda m-vlak"><circle class="sel" cx="138" cy="370.8" r="16.5" fill="none" stroke="#FF5F1F" stroke-width="1" opacity="0"/><circle cx="138" cy="370.8" r="9.5" fill="url(#starg)"/><circle cx="138" cy="370.8" r="3.8" fill="#fff"/><path d="M138.9 358.3A12.5 12.5 0 0 1 144.6 360.2" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M146 361.2A12.5 12.5 0 0 1 149.6 366.1" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M150.1 367.8A12.5 12.5 0 0 1 150.1 373.8" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M149.6 375.5A12.5 12.5 0 0 1 146 380.4" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M144.6 381.4A12.5 12.5 0 0 1 138.9 383.3" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M137.1 383.3A12.5 12.5 0 0 1 131.4 381.4" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M130 380.4A12.5 12.5 0 0 1 126.4 375.5" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M125.9 373.8A12.5 12.5 0 0 1 125.9 367.8" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M126.4 366.1A12.5 12.5 0 0 1 130 361.2" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M131.4 360.2A12.5 12.5 0 0 1 137.1 358.3" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/></g><path d="M153.8 558H144L154 556" stroke="rgba(233,237,245,.3)" fill="none"/><g class="star m-skola m-voda"><circle class="sel" cx="138" cy="558" r="15.8" fill="none" stroke="#FF5F1F" stroke-width="1" opacity="0"/><circle cx="138" cy="558" r="8.8" fill="url(#starg)"/><circle cx="138" cy="558" r="3.4" fill="#fff"/><path d="M138.8 546.2A11.8 11.8 0 0 1 144.3 548" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M145.6 549A11.8 11.8 0 0 1 148.9 553.6" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M149.4 555.1A11.8 11.8 0 0 1 149.4 560.9" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M148.9 562.4A11.8 11.8 0 0 1 145.6 567" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M144.3 568A11.8 11.8 0 0 1 138.8 569.8" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M137.2 569.8A11.8 11.8 0 0 1 131.7 568" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M130.4 567A11.8 11.8 0 0 1 127.1 562.4" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M126.6 560.9A11.8 11.8 0 0 1 126.6 555.1" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M127.1 553.6A11.8 11.8 0 0 1 130.4 549" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M131.7 548A11.8 11.8 0 0 1 137.2 546.2" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/></g><path d="M156.8 671.6H144L154 684" stroke="rgba(233,237,245,.3)" fill="none"/><g class="star m-voda m-letani m-prsty m-skola"><circle cx="138" cy="671.6" r="30.8" fill="url(#lucg)"/><path d="M109.2 671.6H166.8M138 642.8V700.4" stroke="#FF5F1F" stroke-opacity=".5" stroke-width=".8"/><circle class="sel" cx="138" cy="671.6" r="18.8" fill="none" stroke="#FF5F1F" stroke-width="1" opacity="0"/><circle cx="138" cy="671.6" r="11.8" fill="url(#starg)"/><circle cx="138" cy="671.6" r="4.9" fill="#fff"/><path d="M139 656.8A14.8 14.8 0 0 1 145.8 659" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M147.5 660.3A14.8 14.8 0 0 1 151.7 666.1" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M152.4 668A14.8 14.8 0 0 1 152.4 675.2" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M151.7 677.1A14.8 14.8 0 0 1 147.5 682.9" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M145.8 684.2A14.8 14.8 0 0 1 139 686.4" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M137 686.4A14.8 14.8 0 0 1 130.2 684.2" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M128.5 682.9A14.8 14.8 0 0 1 124.3 677.1" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M123.6 675.2A14.8 14.8 0 0 1 123.6 668" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M124.3 666.1A14.8 14.8 0 0 1 128.5 660.3" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M130.2 659A14.8 14.8 0 0 1 137 656.8" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/></g><path d="M153 796.4H144L154 820" stroke="rgba(233,237,245,.3)" fill="none"/><g class="star m-skola m-hodiny"><circle class="sel" cx="138" cy="796.4" r="15" fill="none" stroke="#FF5F1F" stroke-width="1" opacity="0"/><circle cx="138" cy="796.4" r="8" fill="url(#starg)"/><circle cx="138" cy="796.4" r="3" fill="#fff"/><path d="M138.8 785.4A11 11 0 0 1 143.8 787.1" stroke="#FF5F1F" stroke-width="2.2" fill="none" stroke-linecap="round"/><path d="M145.1 788A11 11 0 0 1 148.2 792.3" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M148.7 793.7A11 11 0 0 1 148.7 799.1" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M148.2 800.5A11 11 0 0 1 145.1 804.8" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M143.8 805.7A11 11 0 0 1 138.8 807.4" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M137.2 807.4A11 11 0 0 1 132.2 805.7" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M130.9 804.8A11 11 0 0 1 127.8 800.5" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M127.3 799.1A11 11 0 0 1 127.3 793.7" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M127.8 792.3A11 11 0 0 1 130.9 788" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/><path d="M132.2 787.1A11 11 0 0 1 137.2 785.4" stroke="rgba(233,237,245,.2)" stroke-width="1.4" fill="none" stroke-linecap="round"/></g><path d="M144 202.8H144L154 200.8" stroke="rgba(233,237,245,.2)" stroke-dasharray="2 3" fill="none"/><circle cx="138" cy="202.8" r="3.5" fill="none" stroke="rgba(233,237,245,.4)" stroke-dasharray="1.5 1.5"/></svg>
    <div class="gcard" style="top:178.8px;min-height:70px"><div class="dc-top"><span class="mono">REM 1 · 00:43–00:53</span></div><p>Bez zápisu. První okno bývá krátké.</p></div>
<div class="dcard"  data-m="voda vlak" style="top:346.8px;min-height:116px" aria-label="Sen 02:33: Vlak přes zatopené pole">
  <div class="dc-top"><span class="t tnum">02:33</span><span class="rem">REM 2</span></div>
  <div class="dc-title">Vlak přes zatopené pole</div>
  <div class="dc-meta"><span>Lucidita <b>0</b></span><span>Živost <b>6</b></span></div>
  <div class="dc-chips"><span class="mchip m-voda">Voda</span><span class="mchip m-vlak">Vlak</span></div>
</div>
<div class="dcard"  data-m="skola voda" style="top:534px;min-height:116px" aria-label="Sen 04:30: Chodba ve staré škole">
  <div class="dc-top"><span class="t tnum">04:30</span><span class="tag hot">WBTB</span><span class="rem">REM 3</span></div>
  <div class="dc-title">Chodba ve staré škole</div>
  <div class="dc-meta"><span>Lucidita <b>2</b></span><span>Živost <b>5</b></span></div>
  <div class="dc-chips"><span class="mchip m-skola">Škola</span><span class="mchip m-voda">Voda</span></div>
</div>
<a class="dcard lucid" href="detail_snu.html" data-m="voda letani prsty skola" style="top:662px;min-height:124px" aria-label="Sen 05:41: Řeka nad městem">
  <div class="dc-top"><span class="t tnum">05:41</span><span class="tag solid">Lucidní</span><span class="rem">REM 4</span></div>
  <div class="dc-title">Řeka nad městem</div>
  <div class="dc-meta"><span>Lucidita <b>7</b></span><span>Živost <b>9</b></span></div>
  <div class="dc-chips"><span class="mchip m-voda">Voda</span><span class="mchip m-letani">Létání</span><span class="mchip more">+2</span><span class="go"><svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M9.5 6l6 6-6 6"/></svg></span></div>
</a>
<div class="dcard"  data-m="skola hodiny" style="top:798px;min-height:116px" aria-label="Sen 06:59: Třída plná hodin">
  <div class="dc-top"><span class="t tnum">06:59</span><span class="rem">REM 5</span></div>
  <div class="dc-title">Třída plná hodin</div>
  <div class="dc-meta"><span>Lucidita <b>1</b></span><span>Živost <b>4</b></span></div>
  <div class="dc-chips"><span class="mchip m-skola">Škola</span><span class="mchip m-hodiny">Hodiny</span></div>
</div>
  </div>
  <div class="lgd">
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><rect x="0" y="3" width="28" height="14" fill="#FF5F1F" opacity=".3"/><line x1="0" x2="28" y1="3" y2="3" stroke="#FF5F1F" stroke-dasharray="1 3"/><line x1="0" x2="28" y1="17" y2="17" stroke="#FF5F1F" stroke-dasharray="1 3"/></svg><span>REM, shoda obou zařízení</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><rect x="2" y="5" width="24" height="10" fill="#FF5F1F" opacity=".32" filter="url(#soft2)"/><defs><filter id="soft2" x="-30%" y="-60%" width="160%" height="220%"><feGaussianBlur stdDeviation="2"/></filter></defs></svg><span>REM, jen jedno zařízení</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><rect x="4" y="0" width="8" height="20" fill="#2A3F78"/><rect x="16" y="0" width="8" height="20" fill="#3A4560"/><rect x="4" y="8" width="8" height="5" fill="#FF5F1F"/><rect x="16" y="6" width="8" height="8" fill="#FF5F1F"/></svg><span>O Oura, G Garmin: fáze</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><path d="M14 4l5 6-5 6-5-6z" fill="#FF5F1F"/></svg><span>TLR podnět</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><circle cx="14" cy="10" r="4" fill="#fff"/><circle cx="14" cy="10" r="8" fill="none" stroke="#FF5F1F" stroke-width="2" stroke-dasharray="6 3"/></svg><span>Sen: velikost = živost, prstenec = lucidita</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><path d="M24 2C6 2 6 18 24 18" stroke="#FF5F1F" stroke-width="1.6" fill="none"/></svg><span>Sny spojené Stopou snu</span></div>
  <div><svg width="28" height="20" viewBox="0 0 28 20" aria-hidden="true"><rect x="0" y="3" width="28" height="14" fill="url(#hatch2)"/><defs><pattern id="hatch2" width="5" height="5" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><line x1="0" y1="0" x2="0" y2="5" stroke="rgba(233,237,245,.4)" stroke-width="1.2"/></pattern></defs></svg><span>Bdění při WBTB</span></div>
</div>
</section>

<div class="sh"><span class="n">02</span><h2>Vzorec noci</h2><span class="rule"></span><span class="meta">Stopy snů</span></div>
<section class="panel hot ins">
  <div class="eyebrow">Opakuje se</div>
  <h3 class="h2">Voda a škola se proplétají.</h3>
  <p class="small muted">Voda byla ve 3 snech ze 4. Ve snu 3 tekla řeka nahoru a sen jsi poznal až podle prstů.</p>
  <div class="bars">
    <div><span>Voda</span><span class="tr"><i class="a" style="width:50%"></i></span><span class="n">7/14</span></div>
    <div><span>Škola</span><span class="tr"><i style="width:28.6%"></i></span><span class="n">4/14</span></div>
    <div><span>Létání</span><span class="tr"><i style="width:21.4%"></i></span><span class="n">3/14</span></div>
  </div>
  <p class="src" style="margin-top:12px">Nocí se Stopou snu za posledních 14</p>
  <div class="btns" style="display:flex;gap:8px;margin-top:14px"><a class="btn primary sm" style="flex:1" href="detail_snu.html#spoustec">Voda jako spouštěč testu</a></div>
</section>

<div class="sh"><span class="n">03</span><h2>Jak vznikají okna</h2><span class="rule"></span></div>
<section class="panel model">
  <div class="srcs"><span><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><ellipse cx="12" cy="12" rx="8" ry="8"/><ellipse cx="12" cy="12" rx="5.2" ry="5.2"/><path d="M10.5 4.2h3"/></svg>Oura</span><span><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="6.5" y="6.5" width="11" height="11" rx="3"/><path d="M9 6.5L9.6 3h4.8l.6 3.5M9 17.5l.6 3.5h4.8l.6-3.5M12 9.5V12l1.6 1"/></svg>Garmin</span><span><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="8.8"/><path d="M12 7.5V12l3 2"/></svg>Tvoje časy</span></div>
  <p>Okna spojují oba přístroje a časy, kdy ses probudil ze snu. Každý zápis s časem je zpřesní. Pořád je to odhad.</p>
  <div class="eq">P(REM | data) <span>∝</span><br>model cyklů × Oura × Garmin × zápisy<br><span>okno 4: 05:12–05:38 · ±4 min</span></div>
</section>

<a class="btn addbtn" href="#"><svg viewBox="0 0 24 24" width="20" height="20" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M12 5v14M5 12h14"/></svg>Přidat sen do této noci</a>
<nav class="tabbar" aria-label="Hlavní navigace"><a class="tab" href="dnes_koncept.html"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="3.2"/><ellipse cx="12" cy="12" rx="9.6" ry="4.2" transform="rotate(-24 12 12)"/></svg><span>Dnes</span></a><a class="tab on" href="noc_mapa_snu.html" aria-current="page"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M6 3.75h10.5A1.75 1.75 0 0 1 18.25 5.5v15H7.5A2.25 2.25 0 0 1 5.25 18.25V4.5a.75.75 0 0 1 .75-.75z"/><path d="M5.25 18.25A2.25 2.25 0 0 1 7.5 16h10.75"/><path d="M9 7.75h5.5M9 10.75h3.5"/></svg><span>Deník</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M8.5 12.5V6.2a1.2 1.2 0 0 1 2.4 0V11"/><path d="M10.9 10.5V4.9a1.2 1.2 0 0 1 2.4 0v5.6"/><path d="M13.3 10.5V5.9a1.2 1.2 0 0 1 2.4 0v5.4"/><path d="M15.7 11.3V8.4a1.2 1.2 0 0 1 2.4 0v5.1a6.6 6.6 0 0 1-6.6 6.6h-.4a6 6 0 0 1-4.8-2.4l-2.4-3.3a1.25 1.25 0 0 1 1.9-1.6l1.7 1.6"/></svg><span>Realita</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="8.6"/><circle cx="12" cy="12" r="4.6"/><circle cx="12" cy="12" r=".9" fill="currentColor"/><path d="M12 1.8v3M12 19.2v3M1.8 12h3M19.2 12h3"/></svg><span>Výcvik</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M19.6 14.6A8.2 8.2 0 0 1 9.4 4.4a8.2 8.2 0 1 0 10.2 10.2z"/><path d="M16.5 3.5v2.4M15.3 4.7h2.4"/></svg><span>Spánek</span></a><span class="gesture" aria-hidden="true"></span></nav>
</div>
</body>
</html>
```

### detail_snu.html

```html
<!doctype html>
<html lang="cs">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#04060C">
<title>Detail snu · koncept</title>
<meta name="description" content="Detail snu: kontext REM okna, zápis, škály 0 až 10, Stopy snů, reflexe, osobní spouštěč, technika noci a přílohy.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter+Tight:wght@500;600;700&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
<style>
:root{
  --bg:#04060C;--panel:#0C1222;--panel-2:#111A30;--raise:#17213B;
  --line:rgba(233,237,245,.09);--line-2:rgba(233,237,245,.16);--line-3:rgba(233,237,245,.30);
  --text:#E9EDF5;--muted:#8D97AD;--faint:#7D879E;
  --accent:#FF5F1F;--accent-ink:#140600;--accent-soft:rgba(255,95,31,.13);--accent-line:rgba(255,95,31,.55);
  --ok:#3FD49A;--warn:#FFB443;--bad:#FF5A4E;
  --ev-strong:#5FE0B6;--ev-prom:#8DB9FF;--ev-comm:#C6AAFF;--ev-trad:#E6C17D;
  --night:#FF3B2F;--night-2:#B3261E;--night-3:#5A120D;
  --f-title:'Inter Tight','Inter Display','Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-text:'Inter',system-ui,-apple-system,'Segoe UI',Roboto,sans-serif;
  --f-mono:'JetBrains Mono',ui-monospace,'SFMono-Regular','Roboto Mono',Menlo,Consolas,monospace;
}
*{box-sizing:border-box;margin:0;padding:0}
html{background:var(--bg);-webkit-text-size-adjust:100%;color-scheme:dark}
body{background:var(--bg);color:var(--text);font:400 15px/1.5 var(--f-text);-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;font-feature-settings:"cv11","ss01";min-height:100vh}
a{color:inherit;text-decoration:none}
button{font:inherit;color:inherit;background:none;border:0;cursor:pointer}
input.sr{position:absolute;opacity:0;width:1px;height:1px;pointer-events:none}
.vh{position:absolute!important;width:1px;height:1px;overflow:hidden;clip:rect(0 0 0 0);white-space:nowrap}
:focus-visible{outline:2px solid var(--accent);outline-offset:2px;border-radius:6px}
input.sr:focus-visible + label,input.sr:focus-visible + .lbl{outline:2px solid var(--accent);outline-offset:2px}
.tnum{font-variant-numeric:tabular-nums}

/* ---------- device frame ---------- */
.stage{position:relative}
.device{position:relative;width:100%;max-width:390px;margin:0 auto;background:var(--bg);overflow:clip;min-height:844px;isolation:isolate}
.caption{display:none}
@media (min-width:600px){
  body{background:radial-gradient(900px 600px at 50% -8%,#0E1832 0%,rgba(4,6,12,0) 70%),var(--bg);padding:48px 0 72px}
  .device{border-radius:46px;box-shadow:0 0 0 1px var(--line-2),0 0 0 10px #070A13,0 0 0 11px var(--line),0 50px 140px rgba(0,0,0,.75)}
  .caption{display:flex;justify-content:space-between;gap:16px;white-space:nowrap;max-width:390px;margin:0 auto 18px;font:500 12px/1.4 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
  .caption b{color:var(--text);font-weight:500}
}

/* ---------- status + app bar ---------- */
.sb{height:36px;display:flex;align-items:center;justify-content:space-between;padding:0 22px 0 26px;font:600 13px/1 var(--f-text);letter-spacing:.01em;position:relative;z-index:3}
.sb .ic{display:flex;gap:6px;align-items:center}
.appbar{display:flex;align-items:center;justify-content:space-between;height:52px;padding:0 8px 0 16px;position:relative;z-index:3}
.brand{display:flex;align-items:center;gap:10px}
.logo{font:700 17px/1 var(--f-title);letter-spacing:-.02em}
.logo sup{font-size:12px;color:var(--accent);margin-left:1px;vertical-align:7px}
.brand .mono{color:var(--muted)}
.ibtn{width:44px;height:44px;display:grid;place-items:center;border-radius:50%;color:var(--muted)}
.ibtn:hover{background:rgba(233,237,245,.06);color:var(--text)}

/* ---------- type ---------- */
.mono{font-family:var(--f-mono);font-size:12px;line-height:1.35;letter-spacing:.08em;text-transform:uppercase;font-weight:500}
.eyebrow{font:500 12px/1.3 var(--f-mono);letter-spacing:.1em;text-transform:uppercase;color:var(--muted)}
.eyebrow .a{color:var(--accent)}
.display{font:600 34px/1.04 var(--f-title);letter-spacing:-.028em}
.h1{font:600 28px/1.08 var(--f-title);letter-spacing:-.024em}
.h2{font:600 21px/1.18 var(--f-title);letter-spacing:-.018em}
.h3{font:600 17px/1.25 var(--f-title);letter-spacing:-.01em}
.lead{font-size:16px;line-height:1.5;color:var(--text)}
.muted{color:var(--muted)}
.small{font-size:14px;line-height:1.45}
.src{font:400 12px/1.4 var(--f-mono);letter-spacing:.02em;color:var(--faint)}

/* ---------- section header ---------- */
.sh{display:flex;align-items:center;gap:10px;margin:40px 16px 14px}
.sh .n{font:500 12px/1 var(--f-mono);color:var(--accent);letter-spacing:.06em}
.sh h2{font:500 12px/1 var(--f-mono);letter-spacing:.12em;text-transform:uppercase;color:var(--text);white-space:nowrap}
.sh .rule{flex:1;height:1px;background:linear-gradient(90deg,var(--line-3),rgba(233,237,245,0))}
.sh .meta{font:500 12px/1 var(--f-mono);color:var(--muted);letter-spacing:.08em;text-transform:uppercase;white-space:nowrap}

/* ---------- panels with corner marks ---------- */
.panel{position:relative;margin:0 16px;background:linear-gradient(180deg,#0F1730 0%,var(--panel) 46%);border:1px solid var(--line);border-radius:4px;padding:16px}
.panel::after,.corners::after{content:"";position:absolute;inset:-1px;pointer-events:none;--c:var(--line-3);--k:12px;
  background:
   linear-gradient(var(--c) 0 0) 0 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 0/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 0/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 0 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 0 100%/1px var(--k) no-repeat,
   linear-gradient(var(--c) 0 0) 100% 100%/var(--k) 1px no-repeat,linear-gradient(var(--c) 0 0) 100% 100%/1px var(--k) no-repeat}
.panel.hot::after,.corners.hot::after{--c:var(--accent)}
.sub{background:rgba(4,6,12,.55);border:1px solid var(--line);border-radius:4px;padding:14px}
.hr{height:1px;background:var(--line);margin:16px 0}
.row{display:flex;align-items:center;gap:12px}
.between{display:flex;align-items:center;justify-content:space-between;gap:12px}

/* ---------- evidence chips ---------- */
.ev{display:inline-flex;align-items:center;gap:7px;height:24px;padding:0 8px 0 7px;border-radius:3px;font:600 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;white-space:nowrap;border:1px solid;background:rgba(255,255,255,.02)}
.ev i{display:inline-flex;gap:2px}
.ev i b{width:4px;height:9px;border-radius:1px;background:currentColor;opacity:.25}
.ev.strong{color:var(--ev-strong);border-color:rgba(95,224,182,.4);background:rgba(95,224,182,.07)}
.ev.prom{color:var(--ev-prom);border-color:rgba(141,185,255,.4);background:rgba(141,185,255,.07)}
.ev.comm{color:var(--ev-comm);border-color:rgba(198,170,255,.4);background:rgba(198,170,255,.07)}
.ev.trad{color:var(--ev-trad);border-color:rgba(230,193,125,.4);background:rgba(230,193,125,.07)}
.ev.strong i b{opacity:1}
.ev.prom i b:nth-child(-n+2){opacity:1}
.ev.comm i b:nth-child(1){opacity:1}
.ev.trad i b{width:7px;height:7px;border-radius:0;transform:rotate(45deg);opacity:1;background:none;border:1.2px solid currentColor}
.ev.trad i b+b{display:none}

/* ---------- tags & chips ---------- */
.tag{display:inline-flex;align-items:center;gap:6px;height:24px;padding:0 9px;border-radius:999px;font:500 12px/1 var(--f-mono);letter-spacing:.06em;text-transform:uppercase;color:var(--muted);border:1px solid var(--line-2);white-space:nowrap}
.tag.hot{color:var(--accent);border-color:var(--accent-line);background:var(--accent-soft)}
.tag.solid{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);font-weight:600}
.motif{display:inline-flex;align-items:center;gap:6px;height:26px;padding:0 10px 0 8px;border-radius:999px;font:500 13px/1 var(--f-text);color:var(--text);background:rgba(233,237,245,.06);border:1px solid var(--line-2);white-space:nowrap}
.motif .g{font:600 12px/1 var(--f-mono);color:var(--muted)}

/* ---------- buttons ---------- */
.btn{min-height:48px;padding:0 20px;border-radius:999px;font:600 15px/1 var(--f-text);display:inline-flex;align-items:center;justify-content:center;gap:10px;border:1px solid var(--line-2);color:var(--text);background:rgba(233,237,245,.04);transition:transform .15s ease,background .2s ease,border-color .2s;white-space:nowrap;cursor:pointer;user-select:none}
.btn:hover{background:rgba(233,237,245,.08);border-color:var(--line-3)}
.btn:active{transform:scale(.98)}
.btn.primary{background:var(--accent);color:var(--accent-ink);border-color:var(--accent);box-shadow:0 10px 34px -8px rgba(255,95,31,.55)}
.btn.primary:hover{background:#FF7036}
.btn.ghost{border-color:transparent;background:none;color:var(--muted);padding:0 12px}
.btn.ghost:hover{color:var(--text)}
.btn.sm{min-height:44px;padding:0 16px;font-size:14px}
.btn.block{width:100%}
.lnk{display:inline-flex;align-items:center;gap:6px;min-height:44px;color:var(--accent);font:600 14px/1 var(--f-text)}
.lnk svg{transition:transform .2s}
.lnk:hover svg{transform:translateX(3px)}

/* ---------- switch ---------- */
.switch{position:relative;width:52px;height:32px;flex:none;border-radius:999px;background:rgba(233,237,245,.12);border:1px solid var(--line-2);transition:background .2s}
.switch::after{content:"";position:absolute;top:3px;left:3px;width:24px;height:24px;border-radius:50%;background:var(--muted);transition:transform .22s cubic-bezier(.3,.7,.3,1),background .2s}

/* ---------- tab bar ---------- */
.tabbar{position:sticky;bottom:0;z-index:30;display:grid;grid-template-columns:repeat(5,1fr);background:rgba(4,6,12,.92);-webkit-backdrop-filter:blur(16px);backdrop-filter:blur(16px);border-top:1px solid var(--line);padding:6px 4px 24px;margin-top:40px}
.tab{min-height:56px;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:5px;color:var(--muted);font:500 12px/1 var(--f-text);position:relative;border-radius:12px}
.tab:hover{color:var(--text)}
.tab.on{color:var(--text);font-weight:600}
.tab.on svg{color:var(--accent)}
.tab.on::before{content:"";position:absolute;top:-7px;width:24px;height:2px;background:var(--accent);box-shadow:0 0 14px 1px rgba(255,95,31,.8)}
.gesture{position:absolute;bottom:8px;left:50%;width:112px;height:4px;border-radius:2px;background:rgba(233,237,245,.45);transform:translateX(-50%)}

/* ---------- svg text ---------- */
.sm12{font-family:var(--f-mono);font-size:12px;letter-spacing:.04em}
.sm13{font-family:var(--f-mono);font-size:13px;letter-spacing:.04em}
.st{font-family:var(--f-title)}

@keyframes tw{0%,100%{opacity:.25}50%{opacity:.9}}
.tw{animation:tw 4.5s ease-in-out infinite}
@keyframes pulse{0%{transform:scale(.6);opacity:.9}100%{transform:scale(2.4);opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important;transition:none!important}}


.top{display:flex;align-items:center;justify-content:space-between;height:52px;padding:0 4px 0 2px;position:relative;z-index:3}
.backl{display:inline-flex;align-items:center;gap:2px;min-height:44px;padding:0 12px 0 6px;border-radius:999px;font:500 15px/1 var(--f-text);color:var(--text)}
.backl:hover{background:rgba(233,237,245,.06)}
.hero{padding:4px 16px 0;position:relative}
.sys{display:block;margin:0 0 2px}
.hero .display{margin:6px 0 12px}
.tags{display:flex;gap:8px;flex-wrap:wrap}
.when .lead{font:600 19px/1.3 var(--f-title);letter-spacing:-.01em;margin:8px 0 6px}
.when .lead b{color:var(--accent);font-weight:600}
.nw{white-space:nowrap}
.when svg{display:block;margin:16px 0 10px}
.pbar{display:flex;height:10px;border-radius:5px;overflow:hidden;gap:2px;margin:16px 0 10px}
.pbar i{display:block;height:100%}
.pkey{display:grid;grid-template-columns:auto 1fr auto;gap:8px 10px;font-size:14px;align-items:center}
.pkey .sw{width:10px;height:10px;border-radius:2px}
.pkey .p{font:500 13px/1 var(--f-mono);color:var(--muted);text-align:right}
.quote{font:400 17px/1.62 var(--f-text);color:var(--text);margin:12px 0 4px;letter-spacing:-.003em}
.quote .m{color:var(--text);text-decoration:underline;text-decoration-color:var(--accent);text-decoration-thickness:2px;text-underline-offset:4px;background:linear-gradient(transparent 60%,rgba(255,95,31,.16) 60%)}
.quote .mk{font:600 12px/1 var(--f-mono);color:var(--accent);margin-left:3px;letter-spacing:.04em;vertical-align:6px}
.qmeta{display:flex;justify-content:space-between;align-items:center;margin-top:12px;padding-top:12px;border-top:1px solid var(--line);gap:10px}
.scales{display:flex;flex-direction:column;gap:18px}
.sc-h{display:flex;justify-content:space-between;align-items:baseline}
.sc-h .mono{color:var(--text)}
.sc-v{font:600 24px/1 var(--f-title);letter-spacing:-.02em}
.sc-v small{font-size:13px;color:var(--muted);font-weight:500;margin-left:2px}
.segs{position:relative;display:grid;grid-template-columns:repeat(10,1fr);gap:3px;margin:9px 0 7px;height:12px}
.segs i{background:rgba(233,237,245,.09);border-radius:2px}
.segs i.on{background:var(--text)}
.scale.hot .segs i.on{background:var(--accent)}
.scale.hot .sc-v{color:var(--accent)}
.segs .avg{position:absolute;top:-5px;bottom:-5px;width:0}
.segs .avg b{position:absolute;left:-1px;top:0;bottom:0;width:2px;background:#04060C;box-shadow:0 0 0 1px rgba(233,237,245,.7)}
.sc-f{display:flex;justify-content:space-between;font-size:13px;color:var(--muted);gap:12px}
.sc-f span:last-child{font:500 12px/1.5 var(--f-mono);white-space:nowrap}
.emo{display:flex;gap:6px;margin-top:8px}
.mrows{display:flex;flex-direction:column}
.mrow{padding:14px 0;border-top:1px solid var(--line)}
.mrow:first-child{border-top:0;padding-top:4px}
.mr-top{display:flex;justify-content:space-between;align-items:flex-start;gap:12px}
.mr-name{font:600 17px/1.25 var(--f-title)}
.mrow.hot .mr-name{color:var(--accent)}
.mr-cat{color:var(--muted);margin-top:4px}
.mr-n{text-align:right}
.mr-n b{display:block;font:600 20px/1 var(--f-title)}
.mr-n span{font-size:13px;color:var(--muted)}
.d14{display:grid;grid-template-columns:repeat(14,1fr);gap:4px;margin-top:10px}
.d14 i{height:8px;border-radius:2px;background:rgba(233,237,245,.08)}
.d14 i.on{background:rgba(233,237,245,.7)}
.mrow.hot .d14 i.on{background:var(--accent)}
.d14 i.now{box-shadow:0 0 0 1px var(--text)}
.d14-axis{display:flex;justify-content:space-between;margin-top:6px;font:500 12px/1 var(--f-mono);color:var(--faint);letter-spacing:.04em}
.refl .h2{margin:8px 0 8px}
.opts{display:flex;flex-wrap:wrap;gap:8px;margin:16px 0 0}
.opts label{min-height:44px;display:inline-flex;align-items:center;padding:0 16px;border-radius:999px;border:1px solid var(--line-2);font:500 14px/1 var(--f-text);color:var(--muted);cursor:pointer;transition:all .2s}
.opts input:checked + label{background:var(--accent-soft);border-color:var(--accent);color:var(--text)}
.tip{margin-top:16px;padding:12px 14px;border-left:2px solid var(--accent);background:rgba(255,95,31,.05)}
.tip .mono{color:var(--accent)}
.tip p{font-size:15px;margin:5px 0 6px}
.trig .ift{display:grid;grid-template-columns:44px 1fr;row-gap:8px;align-items:baseline;margin:14px 0 16px}
.trig .k{font:600 13px/1 var(--f-mono);letter-spacing:.1em;color:var(--accent)}
.trig .v{font:600 20px/1.25 var(--f-title);letter-spacing:-.015em}
.swrow{display:flex;align-items:center;justify-content:space-between;gap:14px;min-height:56px;padding:6px 0;border-top:1px solid var(--line);cursor:pointer}
.swrow .t{font-weight:600;font-size:15px}
.swrow .s{font-size:13px;color:var(--muted)}
#trig:checked + .swrow .switch{background:var(--accent);border-color:var(--accent)}
#trig:checked + .swrow .switch::after{transform:translateX(20px);background:var(--accent-ink)}
.son,.soff{font-size:13px;margin-top:6px}
.son{display:none;color:var(--ok)}
.soff{color:var(--muted)}
#trig:checked ~ .son{display:flex;gap:8px;align-items:center}
#trig:checked ~ .soff{display:none}
.tech{display:flex;flex-direction:column}
.trow{padding:14px 0;border-top:1px solid var(--line);display:flex;flex-direction:column;gap:6px}
.trow:first-child{border-top:0;padding-top:2px}
.trow .h3{font-size:16px}
.trow .meta{font-size:14px;color:var(--muted)}
.trow .foot{display:flex;align-items:center;gap:10px;flex-wrap:wrap}
.heard{display:grid;grid-template-columns:repeat(3,1fr);gap:8px;margin-top:6px}
.heard label{min-height:44px;display:grid;place-items:center;border-radius:999px;border:1px solid var(--line-2);font:500 14px/1 var(--f-text);color:var(--muted);cursor:pointer}
.heard input:checked + label{background:rgba(233,237,245,.1);border-color:var(--text);color:var(--text)}
.n1{display:flex;gap:10px;align-items:center;margin-top:10px;font-size:13px;color:var(--muted)}
.n1 .pips{display:flex;gap:3px}
.n1 .pips i{width:8px;height:8px;border-radius:2px;background:rgba(233,237,245,.12)}
.n1 .pips i.on{background:var(--ev-prom)}
.att{display:grid;grid-template-columns:1fr;gap:10px;margin:0 16px}
.audio{display:flex;align-items:center;gap:14px}
.playb{width:52px;height:52px;flex:none;border-radius:50%;display:grid;place-items:center;background:var(--accent);color:var(--accent-ink);cursor:pointer;box-shadow:0 8px 24px -6px rgba(255,95,31,.6)}
.playb .pz{display:none}
#pl:checked + .audio .playb .py{display:none}
#pl:checked + .audio .playb .pz{display:block}
.audio .w{flex:1;min-width:0}
.audio .w .between{margin-bottom:6px}
@keyframes wv{0%,100%{transform:scaleY(1)}50%{transform:scaleY(.55)}}
#pl:checked + .audio .wave rect{animation:wv .9s ease-in-out infinite;transform-origin:center;transform-box:fill-box}
#pl:checked + .audio .wave rect:nth-child(3n){animation-delay:.2s}
#pl:checked + .audio .wave rect:nth-child(3n+1){animation-delay:.45s}
.sk{display:grid;grid-template-columns:150px 1fr;gap:14px;align-items:center}
.sk .fr{border:1px solid var(--line-2);border-radius:4px;background:repeating-linear-gradient(0deg,rgba(233,237,245,.03) 0 1px,transparent 1px 14px),repeating-linear-gradient(90deg,rgba(233,237,245,.03) 0 1px,transparent 1px 14px);padding:4px}
.priv{display:flex;gap:14px;align-items:flex-start;margin:28px 16px 0;padding:16px;border:1px dashed var(--line-2);border-radius:4px}
.priv svg{flex:none;color:var(--ok)}
.priv b{display:block;font:600 15px/1.3 var(--f-title)}
.priv p{font-size:14px;color:var(--muted);margin-top:4px}

</style>
</head>
<body>
<div class="caption" aria-hidden="true"><span><b>Za hranice reality</b></span><span>Koncept · Detail snu</span></div>
<div class="device">
<div class="sb" ><span class="tnum">07:24</span><span class="ic" aria-hidden="true">
<svg width="17" height="12" viewBox="0 0 17 12"><rect x="0" y="8" width="3" height="4" rx=".8" fill="currentColor"/><rect x="4.6" y="5.5" width="3" height="6.5" rx=".8" fill="currentColor"/><rect x="9.2" y="3" width="3" height="9" rx=".8" fill="currentColor"/><rect x="13.8" y="0" width="3" height="12" rx=".8" fill="currentColor" opacity=".35"/></svg>
<svg width="16" height="12" viewBox="0 0 16 12"><path d="M8 11.5l2.6-3.1a4 4 0 0 0-5.2 0z" fill="currentColor"/><path d="M2.8 5.4a7.8 7.8 0 0 1 10.4 0M.6 2.9a11 11 0 0 1 14.8 0" stroke="currentColor" stroke-width="1.5" fill="none" stroke-linecap="round"/></svg>
<svg width="26" height="12" viewBox="0 0 26 12"><rect x=".75" y=".75" width="21.5" height="10.5" rx="3" stroke="currentColor" stroke-width="1.2" fill="none" opacity=".55"/><rect x="2.5" y="2.5" width="14" height="7" rx="1.6" fill="currentColor"/><rect x="23.4" y="4" width="1.8" height="4" rx=".8" fill="currentColor" opacity=".55"/></svg>
</span></div>
<div class="top">
  <a class="backl" href="noc_mapa_snu.html"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M14.5 6l-6 6 6 6"/></svg>Noc na pátek</a>
  <div class="row" style="gap:0"><button class="ibtn" aria-label="Upravit zápis"><svg viewBox="0 0 24 24" width="21" height="21" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M4 20h4L19 9a2.8 2.8 0 0 0-4-4L4 16z"/><path d="M13.5 6.5l4 4"/></svg></button></div>
</div>

<section class="hero">
  <svg class="sys" viewBox="0 0 358 196" width="358" height="196" role="img" aria-label="Sen jako hvězda: lucidita 7 z 10, živost 9. Kolem obíhají Stopy snů: voda, škola, létání, prsty.">
<defs><radialGradient id="core"><stop offset="0" stop-color="#fff"/><stop offset=".3" stop-color="#FFE3D6"/><stop offset=".65" stop-color="#FF8A5B" stop-opacity=".55"/><stop offset="1" stop-color="#FF5F1F" stop-opacity="0"/></radialGradient>
<radialGradient id="halo"><stop offset="0" stop-color="#FF5F1F" stop-opacity=".28"/><stop offset="1" stop-color="#FF5F1F" stop-opacity="0"/></radialGradient></defs><circle cx="152.4" cy="8.3" r="0.6" fill="#E9EDF5" opacity="0.20199999999999999"/><circle cx="295.7" cy="173.1" r="0.4" fill="#E9EDF5" opacity="0.231"/><circle cx="325.5" cy="114.4" r="0.7" fill="#E9EDF5" opacity="0.34"/><circle cx="19.2" cy="25.5" r="0.6" fill="#E9EDF5" opacity="0.37799999999999995"/><circle cx="349.6" cy="11.3" r="0.5" fill="#E9EDF5" opacity="0.21100000000000002"/><circle cx="74.4" cy="42.7" r="0.8" fill="#E9EDF5" opacity="0.384"/><circle cx="170.4" cy="118.8" r="0.5" fill="#E9EDF5" opacity="0.419"/><circle cx="98.7" cy="139.1" r="0.7" fill="#E9EDF5" opacity="0.415"/><circle cx="143.1" cy="22.8" r="0.7" fill="#E9EDF5" opacity="0.153"/><circle cx="333.2" cy="24.8" r="0.6" fill="#E9EDF5" opacity="0.517"/><circle cx="113.7" cy="73.8" r="0.7" fill="#E9EDF5" opacity="0.531"/><circle cx="148.2" cy="76.3" r="0.5" fill="#E9EDF5" opacity="0.493"/><circle cx="134.1" cy="80.5" r="0.6" fill="#E9EDF5" opacity="0.434"/><circle cx="195.2" cy="158.4" r="0.6" fill="#E9EDF5" opacity="0.38299999999999995"/><circle cx="127.9" cy="92.2" r="0.7" fill="#E9EDF5" opacity="0.308"/><circle cx="163" cy="14.7" r="0.4" fill="#E9EDF5" opacity="0.332"/><circle cx="110.8" cy="85.5" r="0.5" fill="#E9EDF5" opacity="0.429"/><circle cx="20" cy="88.5" r="0.7" fill="#E9EDF5" opacity="0.395"/><circle cx="212.5" cy="62.3" r="0.6" fill="#E9EDF5" opacity="0.596"/><circle cx="104.1" cy="1.9" r="0.4" fill="#E9EDF5" opacity="0.166"/><circle cx="145.9" cy="2.3" r="0.6" fill="#E9EDF5" opacity="0.188"/><circle cx="236.6" cy="70.3" r="0.5" fill="#E9EDF5" opacity="0.193"/><circle cx="92.4" cy="159.1" r="0.4" fill="#E9EDF5" opacity="0.37799999999999995"/><circle cx="341.2" cy="100.5" r="0.7" fill="#E9EDF5" opacity="0.386"/><circle cx="83.1" cy="1.9" r="0.5" fill="#E9EDF5" opacity="0.36"/><circle cx="259.2" cy="150.2" r="0.4" fill="#E9EDF5" opacity="0.237"/><circle cx="279.6" cy="67.2" r="0.6" fill="#E9EDF5" opacity="0.158"/><circle cx="330.8" cy="44.6" r="0.8" fill="#E9EDF5" opacity="0.205"/><circle cx="277.9" cy="177.6" r="0.6" fill="#E9EDF5" opacity="0.27699999999999997"/><circle cx="228.4" cy="183.5" r="0.4" fill="#E9EDF5" opacity="0.406"/><circle cx="26.6" cy="77.5" r="1.2" fill="#E9EDF5" opacity="0.436" class="tw" style="animation-delay:1.5s"/><path d="M23.1 77.5H30.1M26.6 74V81" stroke="#E9EDF5" stroke-width=".5" opacity="0.2616"/><circle cx="150.4" cy="190.1" r="1.4" fill="#E9EDF5" opacity="0.41700000000000004" class="tw" style="animation-delay:1.2s"/><circle cx="174.4" cy="112.3" r="0.7" fill="#E9EDF5" opacity="0.433"/><circle cx="201.9" cy="44.2" r="0.4" fill="#E9EDF5" opacity="0.47600000000000003"/><circle cx="105.7" cy="14.5" r="0.8" fill="#E9EDF5" opacity="0.369"/><circle cx="169.3" cy="100.2" r="0.6" fill="#E9EDF5" opacity="0.348"/><circle cx="232.8" cy="41.5" r="1.1" fill="#E9EDF5" opacity="0.57" class="tw" style="animation-delay:0.7s"/><circle cx="77" cy="93.1" r="0.7" fill="#E9EDF5" opacity="0.278"/><circle cx="159" cy="158.4" r="0.7" fill="#E9EDF5" opacity="0.243"/><circle cx="17.4" cy="94" r="0.4" fill="#E9EDF5" opacity="0.18600000000000003"/><circle cx="74.2" cy="52.6" r="0.4" fill="#E9EDF5" opacity="0.5579999999999999"/><circle cx="20.5" cy="26.5" r="1.3" fill="#E9EDF5" opacity="0.29100000000000004" class="tw" style="animation-delay:2.9s"/><path d="M17 26.5H24M20.5 23V30" stroke="#E9EDF5" stroke-width=".5" opacity="0.1746"/><circle cx="116.6" cy="162" r="0.8" fill="#E9EDF5" opacity="0.44799999999999995"/><circle cx="355.5" cy="23.9" r="0.6" fill="#E9EDF5" opacity="0.5670000000000001"/><circle cx="231.1" cy="132.9" r="0.8" fill="#E9EDF5" opacity="0.48200000000000004"/><circle cx="180.6" cy="182.4" r="0.5" fill="#E9EDF5" opacity="0.235"/><circle cx="31.9" cy="9.1" r="0.4" fill="#E9EDF5" opacity="0.436"/><circle cx="248.9" cy="143.2" r="0.5" fill="#E9EDF5" opacity="0.483"/><circle cx="94.2" cy="175.2" r="0.8" fill="#E9EDF5" opacity="0.321"/><circle cx="183.1" cy="14.3" r="0.6" fill="#E9EDF5" opacity="0.349"/><circle cx="182.6" cy="30.4" r="0.6" fill="#E9EDF5" opacity="0.22"/><circle cx="240.9" cy="157" r="0.8" fill="#E9EDF5" opacity="0.446"/><circle cx="313.4" cy="73.7" r="0.9" fill="#E9EDF5" opacity="0.591"/><circle cx="329.8" cy="123" r="0.6" fill="#E9EDF5" opacity="0.263"/><circle cx="137.7" cy="43.4" r="0.4" fill="#E9EDF5" opacity="0.517"/><circle cx="214.1" cy="92.4" r="0.4" fill="#E9EDF5" opacity="0.573"/><circle cx="324.4" cy="121.2" r="0.5" fill="#E9EDF5" opacity="0.209"/><circle cx="220.2" cy="186.4" r="0.5" fill="#E9EDF5" opacity="0.23800000000000002"/><circle cx="180.9" cy="49.4" r="0.5" fill="#E9EDF5" opacity="0.389"/><circle cx="133.8" cy="161.8" r="0.5" fill="#E9EDF5" opacity="0.243"/><ellipse cx="226" cy="98" rx="50" ry="19" transform="rotate(-12 226 98)" fill="none" stroke="rgba(233,237,245,0.22)" /><ellipse cx="226" cy="98" rx="84" ry="32" transform="rotate(-12 226 98)" fill="none" stroke="rgba(233,237,245,0.14)" stroke-dasharray="2 4"/><ellipse cx="226" cy="98" rx="116" ry="46" transform="rotate(-12 226 98)" fill="none" stroke="rgba(233,237,245,0.14)" stroke-dasharray="2 4"/><circle cx="226" cy="98" r="58" fill="url(#halo)"/><circle cx="226" cy="98" r="22" fill="url(#core)"/><circle cx="226" cy="98" r="7" fill="#fff"/><path d="M186 98H266M226 58V138" stroke="#FF5F1F" stroke-opacity=".45" stroke-width=".8"/><path d="M228.1 68.1A30 30 0 0 1 241.9 72.6" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M245.3 75A30 30 0 0 1 253.8 86.8" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M255.1 90.7A30 30 0 0 1 255.1 105.3" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M253.8 109.2A30 30 0 0 1 245.3 121" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M241.9 123.4A30 30 0 0 1 228.1 127.9" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M223.9 127.9A30 30 0 0 1 210.1 123.4" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M206.7 121A30 30 0 0 1 198.2 109.2" stroke="#FF5F1F" stroke-width="2.6" fill="none" stroke-linecap="round"/><path d="M196.9 105.3A30 30 0 0 1 196.9 90.7" stroke="rgba(233,237,245,.22)" stroke-width="1.6" fill="none" stroke-linecap="round"/><path d="M198.2 86.8A30 30 0 0 1 206.7 75" stroke="rgba(233,237,245,.22)" stroke-width="1.6" fill="none" stroke-linecap="round"/><path d="M210.1 72.6A30 30 0 0 1 223.9 68.1" stroke="rgba(233,237,245,.22)" stroke-width="1.6" fill="none" stroke-linecap="round"/><circle cx="178.7" cy="101.4" r="10.5" fill="#04060C"/><circle cx="178.7" cy="101.4" r="5.5" fill="#FF5F1F"/><text x="167.7" y="105.4" text-anchor="end" class="sm12" fill="#FF5F1F">VODA <tspan fill="#8D97AD">7×</tspan></text><circle cx="267.1" cy="47" r="9.4" fill="#04060C"/><circle cx="267.1" cy="47" r="4.4" fill="#E9EDF5"/><text x="267.1" y="35" text-anchor="middle" class="sm12" fill="#C9D0DE">ŠKOLA <tspan fill="#8D97AD">4×</tspan></text><circle cx="156.6" cy="128.1" r="8.8" fill="#04060C"/><circle cx="156.6" cy="128.1" r="3.8" fill="#E9EDF5"/><text x="156.6" y="150.1" text-anchor="middle" class="sm12" fill="#C9D0DE">LÉTÁNÍ <tspan fill="#8D97AD">3×</tspan></text><circle cx="297.8" cy="101" r="8.2" fill="#04060C"/><circle cx="297.8" cy="101" r="3.2" fill="#E9EDF5"/><text x="297.8" y="121" text-anchor="middle" class="sm12" fill="#C9D0DE">PRSTY <tspan fill="#8D97AD">2×</tspan></text><text x="0" y="22" class="sm12" fill="#8D97AD">SEN 3 ZE 4</text><text x="0" y="40" class="sm12" fill="#E9EDF5">05:41 · REM 4</text><text x="0" y="184" class="sm12" fill="#7D879E">LUCIDITA 7/10 · ŽIVOST 9/10</text></svg>
  <h1 class="display">Řeka nad městem</h1>
  <div class="tags"><span class="tag solid">Lucidní</span><span class="tag hot">REM 4 · odhad</span><span class="tag">WBTB + MILD</span></div>
</section>

<div class="sh"><span class="n">01</span><h2>Kdy se zdál</h2><span class="rule"></span><span class="meta">Odhad</span></div>
<section class="panel when">
  <div class="eyebrow">Zdroj snu</div>
  <p class="lead">Pravděpodobně ze <b>4. REM okna,</b> <b class="nw">05:12–05:38</b>.</p>
  <p class="small muted">Probudil ses v 05:41, tři minuty po konci okna. Oura i Garmin tu vidí REM shodně 26 z 34 minut.</p>
  <svg viewBox="0 0 326 214" width="326" height="214" role="img" aria-label="Noc 23:10 až 07:05. Sen v 05:41 pravděpodobně ze 4. REM okna 05:12 až 05:38.">
<defs><filter id="sb" x="-20%" y="-20%" width="140%" height="140%"><feGaussianBlur stdDeviation="2.2"/></filter>
<pattern id="h3" width="5" height="5" patternUnits="userSpaceOnUse" patternTransform="rotate(45)"><line x1="0" y1="0" x2="0" y2="5" stroke="rgba(233,237,245,.3)" stroke-width="1.1"/></pattern></defs><line x1="4" x2="322" y1="34" y2="34" stroke="rgba(233,237,245,.2)"/><rect x="64.3" y="20" width="10" height="28" fill="#FF5F1F" opacity="0.14" filter="url(#sb)"/><rect x="66.3" y="20" width="6.7" height="28" fill="#FF5F1F" opacity="0.22"/><text x="69.7" y="13" text-anchor="middle" class="sm12" fill="#7D879E">1</text><rect x="124.5" y="20" width="16.7" height="28" fill="#FF5F1F" opacity="0.14" filter="url(#sb)"/><rect x="127.2" y="20" width="10.7" height="28" fill="#FF5F1F" opacity="0.22"/><text x="132.6" y="13" text-anchor="middle" class="sm12" fill="#7D879E">2</text><rect x="199.5" y="20" width="18.7" height="28" fill="#FF5F1F" opacity="0.14" filter="url(#sb)"/><rect x="203.5" y="20" width="14.7" height="28" fill="#FF5F1F" opacity="0.22"/><text x="210.9" y="13" text-anchor="middle" class="sm12" fill="#7D879E">3</text><rect x="244.3" y="20" width="22.8" height="28" fill="#FF5F1F" opacity="0.35" filter="url(#sb)"/><rect x="246.3" y="20" width="17.4" height="28" fill="#FF5F1F" opacity="0.75"/><text x="255.1" y="13" text-anchor="middle" class="sm12" fill="#FF5F1F">4</text><rect x="293.9" y="20" width="24.8" height="28" fill="#FF5F1F" opacity="0.14" filter="url(#sb)"/><rect x="297.2" y="20" width="18.7" height="28" fill="#FF5F1F" opacity="0.22"/><text x="306.6" y="13" text-anchor="middle" class="sm12" fill="#7D879E">5</text><rect x="218.2" y="20" width="14.7" height="28" fill="url(#h3)"/><circle cx="139.9" cy="34" r="3" fill="#C9D0DE"/><circle cx="218.2" cy="34" r="3" fill="#C9D0DE"/><circle cx="265.8" cy="34" r="7" fill="#04060C" stroke="#fff" stroke-width="1.5"/><circle cx="265.8" cy="34" r="3" fill="#fff"/><circle cx="318" cy="34" r="3" fill="#C9D0DE"/><rect x="237" y="16" width="40.1" height="36" fill="none" stroke="rgba(233,237,245,.55)" stroke-dasharray="2 2"/><path d="M237 52L4 90M277.1 52L322 90" stroke="rgba(233,237,245,.22)"/><text x="37.5" y="68" text-anchor="middle" class="sm12" fill="#7D879E" stroke="#0D1427" stroke-width="5" paint-order="stroke">00:00</text><text x="117.8" y="68" text-anchor="middle" class="sm12" fill="#7D879E" stroke="#0D1427" stroke-width="5" paint-order="stroke">02:00</text><text x="198.1" y="68" text-anchor="middle" class="sm12" fill="#7D879E" stroke="#0D1427" stroke-width="5" paint-order="stroke">04:00</text><text x="278.5" y="68" text-anchor="middle" class="sm12" fill="#7D879E" stroke="#0D1427" stroke-width="5" paint-order="stroke">06:00</text><rect x="4" y="90" width="318" height="96" fill="rgba(4,6,12,.7)" stroke="rgba(233,237,245,.12)"/><rect x="78.2" y="91" width="137.8" height="94" fill="#FF5F1F" opacity=".14"/><line x1="78.2" x2="78.2" y1="91" y2="185" stroke="#FF5F1F" stroke-opacity=".6" stroke-dasharray="2 2"/><line x1="216" x2="216" y1="91" y2="185" stroke="#FF5F1F" stroke-opacity=".6" stroke-dasharray="2 2"/><text x="10" y="114" class="sm12" fill="#8D97AD">OURA</text><rect x="62.3" y="104" width="153.7" height="12" rx="2" fill="#FF5F1F"/><text x="10" y="138" class="sm12" fill="#8D97AD">GARMIN</text><rect x="78.2" y="128" width="164.3" height="12" rx="2" fill="#FF5F1F" opacity=".75"/><path d="M94.1 152l4.5 5-4.5 5-4.5-5z" fill="#FF5F1F"/><path d="M131.2 152l4.5 5-4.5 5-4.5-5z" fill="#FF5F1F"/><text x="140.2" y="161" class="sm12" fill="#FF5F1F">TLR ×2</text><line x1="231.9" x2="231.9" y1="96" y2="182" stroke="#fff" stroke-width="1.5"/><circle cx="231.9" cy="166" r="4" fill="#fff"/><text x="239.9" y="158" class="sm12" fill="#E9EDF5">PROBUZENÍ</text><text x="239.9" y="174" class="sm12" fill="#E9EDF5">05:41</text><text x="94.1" y="202" text-anchor="middle" class="sm12" fill="#7D879E">05:15</text><text x="173.6" y="202" text-anchor="middle" class="sm12" fill="#7D879E">05:30</text><text x="253.1" y="202" text-anchor="middle" class="sm12" fill="#7D879E">05:45</text></svg>
  <div class="pbar" role="img" aria-label="Odhad původu snu: REM 4 asi 80 procent, lehký spánek před ním asi 10 procent, nejisté asi 10 procent"><i style="width:80%;background:var(--accent)"></i><i style="width:10%;background:#8D97AD"></i><i style="width:10%;background:rgba(233,237,245,.18)"></i></div>
  <div class="pkey">
    <span class="sw" style="background:var(--accent)"></span><span>4. REM okno</span><span class="p">≈ 80 %</span>
    <span class="sw" style="background:#8D97AD"></span><span>Lehký spánek před ním</span><span class="p">≈ 10 %</span>
    <span class="sw" style="background:rgba(233,237,245,.18)"></span><span>Nejisté</span><span class="p">≈ 10 %</span>
  </div>
</section>

<div class="sh"><span class="n">02</span><h2>Zápis</h2><span class="rule"></span><span class="meta">05:44</span></div>
<section class="panel">
  <div class="eyebrow">Výňatek · zapsáno 3 min po probuzení</div>
  <p class="quote">Stojím na mostě. Řeka pode mnou neteče dolů, ale <span class="m">nahoru, přes střechy</span><sup class="mk">VODA</sup>. Přijde mi to normální. Pak si všimnu, že mám na ruce <span class="m">šest prstů</span><sup class="mk">PRSTY</sup>. Dojde mi to: sním. Odrazím se a <span class="m">letím nad vodou</span><sup class="mk">LÉTÁNÍ</sup>. Jde to ztěžka, jako bych plaval. Řeknu nahlas: jasnost teď. Barvy zesílí. Pak se řeka změní v <span class="m">chodbu staré školy</span><sup class="mk">ŠKOLA</sup> a probouzím se.</p>
  <div class="qmeta"><span class="src">94 slov · 4 Stopy snů</span><a class="lnk" href="#">Celý zápis <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M9.5 6l6 6-6 6"/></svg></a></div>
</section>

<div class="sh"><span class="n">03</span><h2>Škály</h2><span class="rule"></span><span class="meta">0–10</span></div>
<section class="panel scales">
  <div class="scale hot" role="img" aria-label="Lucidita 7 z 10, tvůj průměr 1,4">
  <div class="sc-h"><span class="mono">Lucidita</span><span class="sc-v tnum">7<small>/10</small></span></div>
  <div class="segs"><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><span class="avg" style="left:14%"><b></b></span></div>
  <div class="sc-f"><span>Věděl jsi, že sníš</span><span class="tnum">průměr 1,4</span></div>
</div>
  <div class="scale" role="img" aria-label="Živost 9 z 10, tvůj průměr 5,8">
  <div class="sc-h"><span class="mono">Živost</span><span class="sc-v tnum">9<small>/10</small></span></div>
  <div class="segs"><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class=""></i><span class="avg" style="left:58%"><b></b></span></div>
  <div class="sc-f"><span>Barvy, detaily, pocit skutečnosti</span><span class="tnum">průměr 5,8</span></div>
</div>
  <div><div class="scale" role="img" aria-label="Emoce 6 z 10, tvůj průměr 4,9">
  <div class="sc-h"><span class="mono">Emoce</span><span class="sc-v tnum">6<small>/10</small></span></div>
  <div class="segs"><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><span class="avg" style="left:49%"><b></b></span></div>
  <div class="sc-f"><span>Síla emocí</span><span class="tnum">průměr 4,9</span></div>
</div><div class="emo"><span class="motif">úžas</span><span class="motif">radost</span><span class="motif">lehká nervozita</span></div></div>
  <div class="scale" role="img" aria-label="Kontrola 4 z 10, tvůj průměr 1,1">
  <div class="sc-h"><span class="mono">Kontrola</span><span class="sc-v tnum">4<small>/10</small></span></div>
  <div class="segs"><i class="on"></i><i class="on"></i><i class="on"></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><span class="avg" style="left:11%"><b></b></span></div>
  <div class="sc-f"><span>Kolik jsi ovlivnil děj</span><span class="tnum">průměr 1,1</span></div>
</div>
</section>

<div class="sh"><span class="n">04</span><h2>Stopy snů</h2><span class="rule"></span><span class="meta">4 nalezené</span></div>
<section class="panel">
  <div class="mrows">
    <div class="mrow hot">
  <div class="mr-top"><div><div class="mr-name">Tekoucí voda</div><div class="mono mr-cat">Kontext · nemožná událost</div></div><div class="mr-n"><b class="tnum">7×</b><span>za 14 nocí</span></div></div>
  <div class="d14" aria-label="7 ze 14 nocí"><i class="on"></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class="on"></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class="on"></i><i class="on now"></i></div>
</div>
    <div class="mrow">
  <div class="mr-top"><div><div class="mr-name">Stará škola</div><div class="mono mr-cat">Kontext · místo</div></div><div class="mr-n"><b class="tnum">4×</b><span>za 14 nocí</span></div></div>
  <div class="d14" aria-label="4 ze 14 nocí"><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class="on now"></i></div>
</div>
    <div class="mrow">
  <div class="mr-top"><div><div class="mr-name">Létání</div><div class="mono mr-cat">Akce</div></div><div class="mr-n"><b class="tnum">3×</b><span>za 14 nocí</span></div></div>
  <div class="d14" aria-label="3 ze 14 nocí"><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class="on now"></i></div>
</div>
    <div class="mrow">
  <div class="mr-top"><div><div class="mr-name">Šest prstů</div><div class="mono mr-cat">Forma · tělo</div></div><div class="mr-n"><b class="tnum">2×</b><span>za 14 nocí</span></div></div>
  <div class="d14" aria-label="2 ze 14 nocí"><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class=""></i><i class="on"></i><i class=""></i><i class=""></i><i class=""></i><i class="on now"></i></div>
</div>
  </div>
  <div class="d14-axis"><span>před 14 nocemi</span><span>dnes</span></div>
  <p class="src" style="margin-top:12px">Kategorie znaků snu: LaBerge &amp; Rheingold 1990</p>
</section>

<div class="sh"><span class="n">05</span><h2>Reflexe</h2><span class="rule"></span><span class="meta">1 min</span></div>
<section class="panel refl">
  <div class="eyebrow">Zpětný pohled</div>
  <h3 class="h2">Proč to nebyl test reality?</h3>
  <p class="small muted">Řeka tekla nahoru a tobě to přišlo normální. Sen jsi poznal až podle prstů. Co tě u řeky zdrželo?</p>
  <div class="opts" role="radiogroup" aria-label="Co tě zdrželo">
    <input type="radio" name="why" id="w1" class="sr" checked><label for="w1">Přišlo mi to normální</label>
    <input type="radio" name="why" id="w2" class="sr"><label for="w2">Byl jsem v ději</label>
    <input type="radio" name="why" id="w3" class="sr"><label for="w3">Nevšiml jsem si</label>
    <input type="radio" name="why" id="w4" class="sr"><label for="w4">Jiné</label>
  </div>
  <div class="tip"><span class="mono">Zkus zítra</span><p>U každé tekoucí vody se zastav a udělej test. Ve snu pak stačí jeden pohled. Je to jako vyšlapaná cestička.</p><span class="src">LaBerge &amp; Rheingold 1990</span></div>
</section>

<div class="sh" id="spoustec"><span class="n">06</span><h2>Osobní spouštěč</h2><span class="rule"></span><span class="meta">Z motivu</span></div>
<section class="panel hot trig">
  <div class="eyebrow">Voda · 7 nocí ze 14</div>
  <div class="ift"><span class="k">AŽ</span><span class="v">uvidím tekoucí vodu,</span><span class="k">TAK</span><span class="v">udělám test reality.</span></div>
  <input type="checkbox" id="trig" class="sr">
  <label for="trig" class="swrow"><span><span class="t">Přidat do připomínek</span><br><span class="s">3× denně: „Viděl jsi teď vodu? Test.“</span></span><span class="switch" aria-hidden="true"></span></label>
  <div class="son"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M5.5 12.5l4.2 4.2 8.8-9.4"/></svg>Spouštěč je aktivní. Uvidíš ho i v Plánu na dnešek.</div>
  <div class="soff">Připomínky se střídají, ať si na ně nezvykneš.</div>
</section>

<div class="sh"><span class="n">07</span><h2>Technika té noci</h2><span class="rule"></span><span class="meta">Noc 33</span></div>
<section class="panel tech">
  <div class="trow"><span class="h3">Probuzení a návrat do spánku (WBTB)</span><span class="meta">Budík 04:30, 22 min vzhůru. Nejvýš 2× týdně.</span><span class="foot"><span class="ev strong"><i aria-hidden="true"><b></b><b></b><b></b></i>Věda silné</span><span class="src">s MILD: Aspy et al. 2017</span></span></div>
  <div class="trow"><span class="h3">Záměr poznat sen (MILD)</span><span class="meta">5 minut po budíku, záměr na vodu.</span><span class="foot"><span class="ev strong"><i aria-hidden="true"><b></b><b></b><b></b></i>Věda silné</span><span class="src">LaBerge 1980</span></span></div>
  <div class="trow"><span class="h3">Cílená reaktivace lucidity (TLR)</span><span class="meta">Tichý tón 2× ve 4. REM okně: 05:15 a 05:22.</span><span class="foot"><span class="ev prom"><i aria-hidden="true"><b></b><b></b><b></b></i>Slibné</span><span class="src">Carr et al. 2020</span></span>
    <span class="mono muted" style="margin-top:8px">Slyšel jsi podnět ve snu?</span>
    <div class="heard" role="radiogroup" aria-label="Slyšel jsi podnět ve snu?"><input type="radio" name="hr" id="h1" class="sr"><label for="h1">Ano</label><input type="radio" name="hr" id="h2" class="sr"><label for="h2">Ne</label><input type="radio" name="hr" id="h3" class="sr" checked><label for="h3">Nevím</label></div>
    <div class="n1"><span class="pips"><i class="on"></i><i class="on"></i><i class="on"></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i></span><span>Experiment TLR: noc 3 z 10</span></div>
  </div>
</section>

<div class="sh"><span class="n">08</span><h2>Přílohy</h2><span class="rule"></span><span class="meta">2</span></div>
<div class="att">
  <section class="panel" style="margin:0">
    <input type="checkbox" id="pl" class="sr" aria-label="Přehrát hlasovou poznámku">
    <div class="audio"><label for="pl" class="playb" aria-hidden="true"><span class="py"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M8.5 5.8v12.4a.6.6 0 0 0 .9.5l9.8-6.2a.6.6 0 0 0 0-1L9.4 5.3a.6.6 0 0 0-.9.5z" fill="currentColor" stroke="none"/></svg></span><span class="pz"><svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M8.5 5.5v13M15.5 5.5v13" stroke-width="2.6"/></svg></span></label>
      <div class="w"><div class="between"><span style="font-weight:600">Hlasová poznámka</span><span class="mono muted">0:48</span></div><svg class="wave" viewBox="0 0 200 40" width="100%" height="40" preserveAspectRatio="none" aria-hidden="true"><rect x="0" y="18" width="2.2" height="4" rx="1.1" fill="#FF5F1F"/><rect x="4" y="13.2" width="2.2" height="13.6" rx="1.1" fill="#FF5F1F"/><rect x="8" y="12.9" width="2.2" height="14.2" rx="1.1" fill="#FF5F1F"/><rect x="12" y="9.1" width="2.2" height="21.9" rx="1.1" fill="#FF5F1F"/><rect x="16" y="13.4" width="2.2" height="13.3" rx="1.1" fill="#FF5F1F"/><rect x="20" y="12.8" width="2.2" height="14.5" rx="1.1" fill="#FF5F1F"/><rect x="24" y="16.7" width="2.2" height="6.7" rx="1.1" fill="#FF5F1F"/><rect x="28" y="15.3" width="2.2" height="9.5" rx="1.1" fill="#FF5F1F"/><rect x="32" y="9.7" width="2.2" height="20.7" rx="1.1" fill="#FF5F1F"/><rect x="36" y="12" width="2.2" height="16" rx="1.1" fill="#FF5F1F"/><rect x="40" y="8.3" width="2.2" height="23.4" rx="1.1" fill="#FF5F1F"/><rect x="44" y="11.1" width="2.2" height="17.9" rx="1.1" fill="#FF5F1F"/><rect x="48" y="15.4" width="2.2" height="9.2" rx="1.1" fill="#FF5F1F"/><rect x="52" y="17" width="2.2" height="6" rx="1.1" fill="#FF5F1F"/><rect x="56" y="12.9" width="2.2" height="14.3" rx="1.1" fill="#FF5F1F"/><rect x="60" y="11.8" width="2.2" height="16.5" rx="1.1" fill="#FF5F1F"/><rect x="64" y="7.2" width="2.2" height="25.7" rx="1.1" fill="#FF5F1F"/><rect x="68" y="12.8" width="2.2" height="14.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="72" y="13.9" width="2.2" height="12.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="76" y="17.3" width="2.2" height="5.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="80" y="14.6" width="2.2" height="10.9" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="84" y="13.9" width="2.2" height="12.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="88" y="7.8" width="2.2" height="24.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="92" y="12.8" width="2.2" height="14.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="96" y="14.6" width="2.2" height="10.9" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="100" y="17.7" width="2.2" height="4.7" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="104" y="14.7" width="2.2" height="10.6" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="108" y="8.7" width="2.2" height="22.7" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="112" y="11.8" width="2.2" height="16.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="116" y="13.3" width="2.2" height="13.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="120" y="11.1" width="2.2" height="17.8" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="124" y="16.6" width="2.2" height="6.8" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="128" y="15.9" width="2.2" height="8.3" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="132" y="9.8" width="2.2" height="20.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="136" y="11.8" width="2.2" height="16.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="140" y="10.9" width="2.2" height="18.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="144" y="13.5" width="2.2" height="13.1" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="148" y="14.3" width="2.2" height="11.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="152" y="16.6" width="2.2" height="6.9" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="156" y="11.5" width="2.2" height="17.1" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="160" y="10.6" width="2.2" height="18.9" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="164" y="7.8" width="2.2" height="24.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="168" y="10.3" width="2.2" height="19.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="172" y="15.4" width="2.2" height="9.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="176" y="17.9" width="2.2" height="4.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="180" y="13.8" width="2.2" height="12.4" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="184" y="12.3" width="2.2" height="15.5" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="188" y="7.9" width="2.2" height="24.2" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="192" y="10" width="2.2" height="20.1" rx="1.1" fill="rgba(233,237,245,.35)"/><rect x="196" y="15.3" width="2.2" height="9.4" rx="1.1" fill="rgba(233,237,245,.35)"/></svg><span class="src">Nahráno 05:42 v nočním režimu</span></div></div>
  </section>
  <section class="panel" style="margin:0">
    <div class="sk"><div class="fr"><svg viewBox="0 0 150 110" width="100%" height="110" aria-label="Kresba: řeka teče nahoru přes střechy, nad ní letící postava" role="img">
  <g fill="none" stroke="#C9D0DE" stroke-width="1.3" stroke-linecap="round" stroke-linejoin="round">
    <path d="M6 100V78l10-8 10 8v22M26 100V72l12-10 12 10v28M50 100V82l9-7 9 7v18M68 100V70l13-11 13 11v30M94 100V80l10-8 10 8v20M114 100V74l11-9 11 9v26"/>
    <path d="M0 100h150"/>
  </g>
  <path d="M10 64C40 58 46 40 70 38s34-14 44-30" fill="none" stroke="#FF5F1F" stroke-width="1.6" stroke-linecap="round"/>
  <path d="M12 70C42 64 50 46 74 44s36-14 46-32" fill="none" stroke="#FF5F1F" stroke-width="1" stroke-linecap="round" stroke-dasharray="3 3" opacity=".7"/>
  <g stroke="#E9EDF5" stroke-width="1.3" fill="none" stroke-linecap="round"><circle cx="108" cy="19" r="3"/><path d="M105 22L92 30M101 24l9-1M99 26l6 4M92 30l-9-1M92 30l-8 4"/></g>
</svg></div><div><span style="font-weight:600;display:block">Kresba</span><span class="small muted">Řeka nad střechami. Nakresleno 05:50.</span><br><a class="lnk" href="#"><svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M14.5 5.5l4 4L8.8 19.2 4 20l.8-4.8z"/><path d="M12.8 7.2l4 4"/></svg>Upravit</a></div></div>
  </section>
</div>

<div class="priv"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><rect x="5" y="10.5" width="14" height="10" rx="2"/><path d="M8 10.5V7.8a4 4 0 0 1 8 0v2.7"/><path d="M12 14.6v2"/></svg><div><b>Data jen v telefonu</b><p>Sen se nikam neodesílá. Zálohu děláš ty, šifrovaně a jen na tvůj pokyn.</p></div></div>

<nav class="tabbar" aria-label="Hlavní navigace"><a class="tab" href="dnes_koncept.html"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="3.2"/><ellipse cx="12" cy="12" rx="9.6" ry="4.2" transform="rotate(-24 12 12)"/></svg><span>Dnes</span></a><a class="tab on" href="noc_mapa_snu.html" aria-current="page"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M6 3.75h10.5A1.75 1.75 0 0 1 18.25 5.5v15H7.5A2.25 2.25 0 0 1 5.25 18.25V4.5a.75.75 0 0 1 .75-.75z"/><path d="M5.25 18.25A2.25 2.25 0 0 1 7.5 16h10.75"/><path d="M9 7.75h5.5M9 10.75h3.5"/></svg><span>Deník</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M8.5 12.5V6.2a1.2 1.2 0 0 1 2.4 0V11"/><path d="M10.9 10.5V4.9a1.2 1.2 0 0 1 2.4 0v5.6"/><path d="M13.3 10.5V5.9a1.2 1.2 0 0 1 2.4 0v5.4"/><path d="M15.7 11.3V8.4a1.2 1.2 0 0 1 2.4 0v5.1a6.6 6.6 0 0 1-6.6 6.6h-.4a6 6 0 0 1-4.8-2.4l-2.4-3.3a1.25 1.25 0 0 1 1.9-1.6l1.7 1.6"/></svg><span>Realita</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><circle cx="12" cy="12" r="8.6"/><circle cx="12" cy="12" r="4.6"/><circle cx="12" cy="12" r=".9" fill="currentColor"/><path d="M12 1.8v3M12 19.2v3M1.8 12h3M19.2 12h3"/></svg><span>Výcvik</span></a><a class="tab" href="#"><svg viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true" ><path d="M19.6 14.6A8.2 8.2 0 0 1 9.4 4.4a8.2 8.2 0 1 0 10.2 10.2z"/><path d="M16.5 3.5v2.4M15.3 4.7h2.4"/></svg><span>Spánek</span></a><span class="gesture" aria-hidden="true"></span></nav>
</div>
</body>
</html>
```

### ikony.svg.md

````markdown
# Ikony · Za hranice reality

Sada 24 liniových ikon ve stylu **Program 2026**: tenké linky, hvězdy, orbity a rohové značky. Každá ikona má jeden akcentový prvek (hvězdu, tečku nebo oblouk), který nese oranžovou. Bez textu, bez externích odkazů.

## Specifikace

- Plátno `viewBox="0 0 24 24"`, `width`/`height` 24, vnitřní okraj zhruba 2 px (kresba leží v poli 2 až 22).
- `fill="none"`, `stroke="currentColor"`, `stroke-width="1.5"`, `stroke-linecap="round"`, `stroke-linejoin="round"`. Barvu ikony určuje CSS `color` rodiče.
- Přesně jeden prvek s `class="accent"`. Má také `stroke="currentColor"`, takže bez stylu ikona funguje jednobarevně.
- Tečky jsou kruhy s `r=".5"` až `r=".75"` a tahem 1.5 (vykreslí se jako plná tečka 2 až 3 px). Hvězdy jsou čtyřcípé jiskry s prohnutými stranami.
- Ověřeno v Chromiu na 24, 48 a 96 px v denní i noční paletě. Každé SVG projde XML parserem a má právě jeden akcent.

## Barvení akcentu

```css
.icon { color: #E9EDF5; }            /* základní linka (text) */
.icon .accent { stroke: #FF5F1F; }    /* akcent Program 2026 */
.icon.muted { color: #8D97AD; }      /* tlumená varianta */

/* Noc: jen červená na černé */
.night .icon { color: #B3261E; }
.night .icon .accent { stroke: #FF3B2F; }
.night .icon.muted { color: #5A120D; }
```

Ve Flutteru (`flutter_svg`) CSS třídy nefungují. Nejjednodušší cesta: načti SVG jako řetězec a před vykreslením nahraď `class="accent" stroke="currentColor"` za `stroke="#FF5F1F"` (v noci `#FF3B2F`). Základní barvu dodá `SvgTheme(currentColor: …)` nebo `colorFilter`, ten ale přebarví i akcent, proto ho použij jen pro jednobarevné stavy.

Velikosti: 24 px pro navigaci a seznamy, 20 px v textu (tah zůstane 1.5 v jednotkách mřížky), 48 px a víc pro prázdné stavy a karty lekcí.

## Ikony

### 01 · Sen (`icon-dream`)

Mrak snu s hvězdou uvnitř: obsah, který se rodí v noci.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-dream" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M7.25 19H17A4 4 0 0 0 17.47 11.03A5.5 5.5 0 0 0 6.5 10.57A4.25 4.25 0 0 0 7.25 19Z"/>
  <path class="accent" stroke="currentColor" d="M12 11.25Q12.61 13.39 14.75 14Q12.61 14.61 12 16.75Q11.39 14.61 9.25 14Q11.39 13.39 12 11.25Z"/>
</svg>
```

### 02 · REM (`icon-rem`)

Hypnogram noci: schody spánkových fází a zvýrazněný úsek REM nahoře.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-rem" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M3 4.5H5V12H7.5V18H10V12H12.5V7.5M17 7.5V12H19.5V15.5H21"/>
  <path class="accent" stroke="currentColor" d="M12.5 7.5H17"/>
</svg>
```

### 03 · Oko (`icon-eye`)

Otevřené oko se zorničkou: pozornost a vnímání.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-eye" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M2.75 12C5 7.75 8.25 5.75 12 5.75S19 7.75 21.25 12C19 16.25 15.75 18.25 12 18.25S5 16.25 2.75 12Z"/>
  <circle cx="12" cy="12" r="3.25"/>
  <circle class="accent" stroke="currentColor" cx="12" cy="12" r=".5"/>
</svg>
```

### 04 · Záměr (`icon-intention`)

Zaměřovač s hvězdou uprostřed: večer si jasně míříš na cíl.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-intention" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="12" cy="12" r="7"/>
  <path d="M12 3V5M12 19V21M3 12H5M19 12H21"/>
  <path class="accent" stroke="currentColor" d="M12 9.25Q12.61 11.39 14.75 12Q12.61 12.61 12 14.75Q11.39 12.61 9.25 12Q11.39 11.39 12 9.25Z"/>
</svg>
```

### 05 · Ruka / test reality (`icon-reality-check`)

Otevřená dlaň s otvorem: test reality „prst skrz dlaň“ a počítání prstů.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-reality-check" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M9 11.5V6.5a1.5 1.5 0 0 0-3 0V14.5"/>
  <path d="M12 11V4.5a1.5 1.5 0 0 0-3 0V6.5"/>
  <path d="M15 11.5V5.5a1.5 1.5 0 0 0-3 0"/>
  <path d="M15 8a1.5 1.5 0 0 1 3 0V14a7 7 0 0 1-7 7H10.5c-2 0-3.3-.8-4.6-2.2L3.1 15.6a1.45 1.45 0 0 1 2.1-2L6 14.5"/>
  <circle class="accent" stroke="currentColor" cx="12" cy="15.5" r="1.25"/>
</svg>
```

### 06 · Měsíc (`icon-moon`)

Srpek měsíce a hvězda: noc, spánek, čas snů.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-moon" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M19.5 14.75A8 8 0 1 1 9.25 4.5a6.25 6.25 0 0 0 10.25 10.25Z"/>
  <path class="accent" stroke="currentColor" d="M17.25 3.75Q17.86 5.89 20 6.5Q17.86 7.11 17.25 9.25Q16.64 7.11 14.5 6.5Q16.64 5.89 17.25 3.75Z"/>
</svg>
```

### 07 · Budík (`icon-alarm`)

Budík se zvonky: připomínka a probuzení v pravý čas.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-alarm" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="12" cy="13" r="7"/>
  <path d="M3.5 7.5a3.75 3.75 0 0 1 4-4M20.5 7.5a3.75 3.75 0 0 0-4-4M7 18l-1.5 2.5M17 18l1.5 2.5"/>
  <path class="accent" stroke="currentColor" d="M12 9.5V13l2.5 1.75"/>
</svg>
```

### 08 · Mozek (`icon-brain`)

Dvě hemisféry shora se zábleskem v čelním laloku: vědomí ve spánku.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-brain" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M12 5C11 3.75 8.5 3.75 7.75 5.5 5.75 5.5 4.5 7.25 5 9.25 3.5 10.25 3.25 12.75 4.75 14 4.25 16 5.5 18 7.75 18 8.5 19.75 11 20 12 18.75"/>
  <path d="M12 5C13 3.75 15.5 3.75 16.25 5.5 18.25 5.5 19.5 7.25 19 9.25 20.5 10.25 20.75 12.75 19.25 14 19.75 16 18.5 18 16.25 18 15.5 19.75 13 20 12 18.75"/>
  <path d="M12 5V18.75M4.75 14c1.25-.25 2.5.25 3.25 1.25M19 9.25c-1.25.25-2.5-.25-3.25-1.25M19.25 14c-1.5 0-2.75.75-3.25 2"/>
  <circle class="accent" stroke="currentColor" cx="8.5" cy="9.75" r=".5"/>
</svg>
```

### 09 · Emoce (`icon-emotion`)

Tvář s úsměvem: jak se ve snu cítíš.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-emotion" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="12" cy="12" r="9"/>
  <path d="M9 9.25V10.25M15 9.25V10.25"/>
  <path class="accent" stroke="currentColor" d="M8.5 14.25c1.9 2.33 5.1 2.33 7 0"/>
</svg>
```

### 10 · Deník (`icon-journal`)

Zavřený deník s hvězdou na obálce: místo pro ranní zápis snů.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-journal" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <rect x="5" y="3" width="14" height="18" rx="2"/>
  <path d="M8.5 3V21M11.5 16.5H16"/>
  <path class="accent" stroke="currentColor" d="M13.75 7.25Q14.36 9.39 16.5 10Q14.36 10.61 13.75 12.75Q13.14 10.61 11 10Q13.14 9.39 13.75 7.25Z"/>
</svg>
```

### 11 · Meditace (`icon-meditation`)

Sedící postava v lotosu, hlava jako světlo: klidná pozornost.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-meditation" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M5.5 15.5L8.4 10.9A2 2 0 0 1 10.1 10H13.9A2 2 0 0 1 15.6 10.9L18.5 15.5"/>
  <path d="M3.5 19.75C6.5 16.75 9.5 16.75 12 18.5 14.5 16.75 17.5 16.75 20.5 19.75Z"/>
  <circle class="accent" stroke="currentColor" cx="12" cy="5.25" r="2.25"/>
</svg>
```

### 12 · Planeta (`icon-planet`)

Planeta s prstencem a malým měsícem: svět, který ve snu prozkoumáváš.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-planet" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="12" cy="12" r="6"/>
  <path d="M6.04 11.32A9.5 3.25 -20 1 0 16.13 7.64"/>
  <circle class="accent" stroke="currentColor" cx="19.5" cy="4.5" r=".75"/>
</svg>
```

### 13 · Kresba (`icon-sketch`)

Tužka kreslí hvězdu: nakresli, co se ti zdálo.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-sketch" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M4 20l1-4.5L15.25 5.25a2.12 2.12 0 0 1 3 0l.5.5a2.12 2.12 0 0 1 0 3L8.5 19Z"/>
  <path d="M13.25 7.25l3.5 3.5"/>
  <path class="accent" stroke="currentColor" d="M6.5 3.75Q7.11 5.89 9.25 6.5Q7.11 7.11 6.5 9.25Q5.89 7.11 3.75 6.5Q5.89 5.89 6.5 3.75Z"/>
</svg>
```

### 14 · Mikrofon (`icon-microphone`)

Mikrofon s tečkou nahrávání: nadiktuj sen hned po probuzení.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-microphone" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <rect x="9" y="2.75" width="6" height="11" rx="3"/>
  <path d="M5.5 11a6.5 6.5 0 0 0 13 0M12 17.5V21M8.75 21h6.5"/>
  <circle class="accent" stroke="currentColor" cx="19.25" cy="4.5" r=".75"/>
</svg>
```

### 15 · Oura prsten (`icon-ring`)

Chytrý prsten v perspektivě, senzory na vnitřní straně: noční měření bez loga.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-ring" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <ellipse cx="12" cy="10.5" rx="8" ry="4.75"/>
  <path d="M4 10.5v2.75a8 4.75 0 0 0 16 0V10.5"/>
  <ellipse class="accent" stroke="currentColor" cx="12" cy="10.75" rx="5.75" ry="2.75"/>
</svg>
```

### 16 · Hodinky (`icon-watch`)

Kulaté sportovní hodinky s prstencem měření: Garmin a spol.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-watch" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="12" cy="12" r="5.5"/>
  <path d="M9 7.25L9.5 3.5A1 1 0 0 1 10.5 2.75h3A1 1 0 0 1 14.5 3.5L15 7.25M9 16.75L9.5 20.5a1 1 0 0 0 1 .75h3a1 1 0 0 0 1-.75L15 16.75M18.75 10.75v2.5"/>
  <path class="accent" stroke="currentColor" d="M12 9a3 3 0 0 1 3 3"/>
</svg>
```

### 17 · Stopy snů (`icon-dream-traces`)

Klikatá stezka od výchozího bodu ke hvězdě: motivy, které se ve snech vracejí.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-dream-traces" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="5.5" cy="18.5" r="2"/>
  <path d="M7.5 18.5H15a3 3 0 0 0 0-6H9a3 3 0 0 1 0-6H13.5"/>
  <path class="accent" stroke="currentColor" d="M18.25 3.75Q18.86 5.89 21 6.5Q18.86 7.11 18.25 9.25Q17.64 7.11 15.5 6.5Q17.64 5.89 18.25 3.75Z"/>
</svg>
```

### 18 · Hvězdná mapa (`icon-star-map`)

Souhvězdí v rohových značkách: mapa tvých snů a souvislostí.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-star-map" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M3 7V3H7M17 3h4V7M21 17v4H17M7 21H3V17"/>
  <path d="M7.5 15.5L10 9.5 14 11.5 16.5 8M14 11.5L15.5 16"/>
  <circle cx="7.5" cy="15.5" r=".5"/><circle cx="10" cy="9.5" r=".5"/><circle cx="14" cy="11.5" r=".5"/><circle cx="15.5" cy="16" r=".5"/>
  <path class="accent" stroke="currentColor" d="M16.5 5.75Q17 7.5 18.75 8Q17 8.49 16.5 10.25Q16 8.49 14.25 8Q16 7.5 16.5 5.75Z"/>
</svg>
```

### 19 · Lekce (`icon-lesson`)

Otevřená kniha s jiskrou nad hřbetem: krátká lekce, nové pochopení.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-lesson" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M12 9.25C10.25 8 7 7.5 3 8V19c4-.5 7 0 9 1.25C14 19 17 18.5 21 19V8c-4-.5-7.25 0-9 1.25ZM12 9.25V20.25"/>
  <path class="accent" stroke="currentColor" d="M12 2.75Q12.49 4.5 14.25 5Q12.49 5.5 12 7.25Q11.51 5.5 9.75 5Q11.51 4.5 12 2.75Z"/>
</svg>
```

### 20 · Jóga snu (`icon-dream-yoga`)

Lotos s tečkou nad ním: tibetská jóga snu a vědomí ve spánku.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-dream-yoga" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M12 7.5C14.25 10 14.25 15.25 12 18.5 9.75 15.25 9.75 10 12 7.5Z"/>
  <path d="M12 18.5C9 18.25 5.75 16.25 4.5 12 7.75 12 10.25 14 11.25 17M12 18.5C15 18.25 18.25 16.25 19.5 12 16.25 12 13.75 14 12.75 17"/>
  <path d="M5 21.25H19"/>
  <circle class="accent" stroke="currentColor" cx="12" cy="3.75" r=".75"/>
</svg>
```

### 21 · Falešné probuzení (`icon-false-awakening`)

Postel a smyčka nad ní: probudíš se, ale stále sníš.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-false-awakening" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M3 10V20M3 16.5H21V20M9.5 16.5V13.5H18.5A2.5 2.5 0 0 1 21 16"/>
  <circle cx="6.25" cy="13.75" r="1.5"/>
  <path class="accent" stroke="currentColor" d="M16.22 8.27A3 3 0 1 1 15.22 4.54M13.48 4.39L15.22 4.54L14.48 2.96"/>
</svg>
```

### 22 · Noční můra (`icon-nightmare`)

Bouřkový mrak s bleskem: sen, který tě vyděsí, a cesta, jak ho přepsat.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-nightmare" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M7.25 15.25H17A4 4 0 0 0 16.49 7.28A4.5 4.5 0 0 0 7.56 6.76A4.25 4.25 0 0 0 7.25 15.25Z"/>
  <path class="accent" stroke="currentColor" d="M12.75 13.25L10.25 17H13.75L11.5 20.75"/>
</svg>
```

### 23 · Lucidita (`icon-lucidity`)

Zavřené oko a hvězda nad ním: spíš, a přesto víš, že sníš.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-lucidity" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <path d="M3.5 12.5C5.75 15.5 8.75 17 12 17S18.25 15.5 20.5 12.5"/>
  <path d="M12 17v2.75M7.25 15.75L6 18.25M16.75 15.75L18 18.25"/>
  <path class="accent" stroke="currentColor" d="M12 3.75Q12.71 6.29 15.25 7Q12.71 7.71 12 10.25Q11.29 7.71 8.75 7Q11.29 6.29 12 3.75Z"/>
</svg>
```

### 24 · Zkoumání reality (`icon-reality-exploration`)

Lupa nad hvězdou: zvědavě zkoumáš, z čeho je skutečnost.

```svg
<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-reality-exploration" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
  <circle cx="10.5" cy="10.5" r="6.75"/>
  <path d="M15.5 15.5L20.75 20.75"/>
  <path class="accent" stroke="currentColor" d="M10.5 7.5Q11.16 9.84 13.5 10.5Q11.16 11.16 10.5 13.5Q9.84 11.16 7.5 10.5Q9.84 9.84 10.5 7.5Z"/>
</svg>
```

## Sprite (všech 24 ikon)

Vlož jednou na začátek `<body>` a pak používej `<svg class="icon" width="24" height="24"><use href="#icon-dream"/></svg>`. Přes `<use>` se selektor `.accent` do kopie symbolu nedostane, proto mají akcenty ve spritu navíc `style="stroke:var(--icon-accent,currentColor)"`. Barvu akcentu pak nastavíš proměnnou, která se dědí i dovnitř `<use>` (funguje i u externího `sprite.svg#icon-dream`):

```css
.icon { color: #E9EDF5; --icon-accent: #FF5F1F; }
.night .icon { color: #B3261E; --icon-accent: #FF3B2F; }
```

Bez proměnné se akcent vykreslí v `currentColor`.

```svg
<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
  <symbol id="icon-dream" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M7.25 19H17A4 4 0 0 0 17.47 11.03A5.5 5.5 0 0 0 6.5 10.57A4.25 4.25 0 0 0 7.25 19Z"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 11.25Q12.61 13.39 14.75 14Q12.61 14.61 12 16.75Q11.39 14.61 9.25 14Q11.39 13.39 12 11.25Z"/>
  </symbol>
  <symbol id="icon-rem" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M3 4.5H5V12H7.5V18H10V12H12.5V7.5M17 7.5V12H19.5V15.5H21"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12.5 7.5H17"/>
  </symbol>
  <symbol id="icon-eye" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M2.75 12C5 7.75 8.25 5.75 12 5.75S19 7.75 21.25 12C19 16.25 15.75 18.25 12 18.25S5 16.25 2.75 12Z"/>
    <circle cx="12" cy="12" r="3.25"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="12" cy="12" r=".5"/>
  </symbol>
  <symbol id="icon-intention" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="12" cy="12" r="7"/>
    <path d="M12 3V5M12 19V21M3 12H5M19 12H21"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 9.25Q12.61 11.39 14.75 12Q12.61 12.61 12 14.75Q11.39 12.61 9.25 12Q11.39 11.39 12 9.25Z"/>
  </symbol>
  <symbol id="icon-reality-check" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M9 11.5V6.5a1.5 1.5 0 0 0-3 0V14.5"/>
    <path d="M12 11V4.5a1.5 1.5 0 0 0-3 0V6.5"/>
    <path d="M15 11.5V5.5a1.5 1.5 0 0 0-3 0"/>
    <path d="M15 8a1.5 1.5 0 0 1 3 0V14a7 7 0 0 1-7 7H10.5c-2 0-3.3-.8-4.6-2.2L3.1 15.6a1.45 1.45 0 0 1 2.1-2L6 14.5"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="12" cy="15.5" r="1.25"/>
  </symbol>
  <symbol id="icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M19.5 14.75A8 8 0 1 1 9.25 4.5a6.25 6.25 0 0 0 10.25 10.25Z"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M17.25 3.75Q17.86 5.89 20 6.5Q17.86 7.11 17.25 9.25Q16.64 7.11 14.5 6.5Q16.64 5.89 17.25 3.75Z"/>
  </symbol>
  <symbol id="icon-alarm" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="12" cy="13" r="7"/>
    <path d="M3.5 7.5a3.75 3.75 0 0 1 4-4M20.5 7.5a3.75 3.75 0 0 0-4-4M7 18l-1.5 2.5M17 18l1.5 2.5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 9.5V13l2.5 1.75"/>
  </symbol>
  <symbol id="icon-brain" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M12 5C11 3.75 8.5 3.75 7.75 5.5 5.75 5.5 4.5 7.25 5 9.25 3.5 10.25 3.25 12.75 4.75 14 4.25 16 5.5 18 7.75 18 8.5 19.75 11 20 12 18.75"/>
    <path d="M12 5C13 3.75 15.5 3.75 16.25 5.5 18.25 5.5 19.5 7.25 19 9.25 20.5 10.25 20.75 12.75 19.25 14 19.75 16 18.5 18 16.25 18 15.5 19.75 13 20 12 18.75"/>
    <path d="M12 5V18.75M4.75 14c1.25-.25 2.5.25 3.25 1.25M19 9.25c-1.25.25-2.5-.25-3.25-1.25M19.25 14c-1.5 0-2.75.75-3.25 2"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="8.5" cy="9.75" r=".5"/>
  </symbol>
  <symbol id="icon-emotion" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="12" cy="12" r="9"/>
    <path d="M9 9.25V10.25M15 9.25V10.25"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M8.5 14.25c1.9 2.33 5.1 2.33 7 0"/>
  </symbol>
  <symbol id="icon-journal" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <rect x="5" y="3" width="14" height="18" rx="2"/>
    <path d="M8.5 3V21M11.5 16.5H16"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M13.75 7.25Q14.36 9.39 16.5 10Q14.36 10.61 13.75 12.75Q13.14 10.61 11 10Q13.14 9.39 13.75 7.25Z"/>
  </symbol>
  <symbol id="icon-meditation" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M5.5 15.5L8.4 10.9A2 2 0 0 1 10.1 10H13.9A2 2 0 0 1 15.6 10.9L18.5 15.5"/>
    <path d="M3.5 19.75C6.5 16.75 9.5 16.75 12 18.5 14.5 16.75 17.5 16.75 20.5 19.75Z"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="12" cy="5.25" r="2.25"/>
  </symbol>
  <symbol id="icon-planet" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="12" cy="12" r="6"/>
    <path d="M6.04 11.32A9.5 3.25 -20 1 0 16.13 7.64"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="19.5" cy="4.5" r=".75"/>
  </symbol>
  <symbol id="icon-sketch" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M4 20l1-4.5L15.25 5.25a2.12 2.12 0 0 1 3 0l.5.5a2.12 2.12 0 0 1 0 3L8.5 19Z"/>
    <path d="M13.25 7.25l3.5 3.5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M6.5 3.75Q7.11 5.89 9.25 6.5Q7.11 7.11 6.5 9.25Q5.89 7.11 3.75 6.5Q5.89 5.89 6.5 3.75Z"/>
  </symbol>
  <symbol id="icon-microphone" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <rect x="9" y="2.75" width="6" height="11" rx="3"/>
    <path d="M5.5 11a6.5 6.5 0 0 0 13 0M12 17.5V21M8.75 21h6.5"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="19.25" cy="4.5" r=".75"/>
  </symbol>
  <symbol id="icon-ring" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <ellipse cx="12" cy="10.5" rx="8" ry="4.75"/>
    <path d="M4 10.5v2.75a8 4.75 0 0 0 16 0V10.5"/>
    <ellipse class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="12" cy="10.75" rx="5.75" ry="2.75"/>
  </symbol>
  <symbol id="icon-watch" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="12" cy="12" r="5.5"/>
    <path d="M9 7.25L9.5 3.5A1 1 0 0 1 10.5 2.75h3A1 1 0 0 1 14.5 3.5L15 7.25M9 16.75L9.5 20.5a1 1 0 0 0 1 .75h3a1 1 0 0 0 1-.75L15 16.75M18.75 10.75v2.5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 9a3 3 0 0 1 3 3"/>
  </symbol>
  <symbol id="icon-dream-traces" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="5.5" cy="18.5" r="2"/>
    <path d="M7.5 18.5H15a3 3 0 0 0 0-6H9a3 3 0 0 1 0-6H13.5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M18.25 3.75Q18.86 5.89 21 6.5Q18.86 7.11 18.25 9.25Q17.64 7.11 15.5 6.5Q17.64 5.89 18.25 3.75Z"/>
  </symbol>
  <symbol id="icon-star-map" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M3 7V3H7M17 3h4V7M21 17v4H17M7 21H3V17"/>
    <path d="M7.5 15.5L10 9.5 14 11.5 16.5 8M14 11.5L15.5 16"/>
    <circle cx="7.5" cy="15.5" r=".5"/><circle cx="10" cy="9.5" r=".5"/><circle cx="14" cy="11.5" r=".5"/><circle cx="15.5" cy="16" r=".5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M16.5 5.75Q17 7.5 18.75 8Q17 8.49 16.5 10.25Q16 8.49 14.25 8Q16 7.5 16.5 5.75Z"/>
  </symbol>
  <symbol id="icon-lesson" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M12 9.25C10.25 8 7 7.5 3 8V19c4-.5 7 0 9 1.25C14 19 17 18.5 21 19V8c-4-.5-7.25 0-9 1.25ZM12 9.25V20.25"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 2.75Q12.49 4.5 14.25 5Q12.49 5.5 12 7.25Q11.51 5.5 9.75 5Q11.51 4.5 12 2.75Z"/>
  </symbol>
  <symbol id="icon-dream-yoga" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M12 7.5C14.25 10 14.25 15.25 12 18.5 9.75 15.25 9.75 10 12 7.5Z"/>
    <path d="M12 18.5C9 18.25 5.75 16.25 4.5 12 7.75 12 10.25 14 11.25 17M12 18.5C15 18.25 18.25 16.25 19.5 12 16.25 12 13.75 14 12.75 17"/>
    <path d="M5 21.25H19"/>
    <circle class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" cx="12" cy="3.75" r=".75"/>
  </symbol>
  <symbol id="icon-false-awakening" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M3 10V20M3 16.5H21V20M9.5 16.5V13.5H18.5A2.5 2.5 0 0 1 21 16"/>
    <circle cx="6.25" cy="13.75" r="1.5"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M16.22 8.27A3 3 0 1 1 15.22 4.54M13.48 4.39L15.22 4.54L14.48 2.96"/>
  </symbol>
  <symbol id="icon-nightmare" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M7.25 15.25H17A4 4 0 0 0 16.49 7.28A4.5 4.5 0 0 0 7.56 6.76A4.25 4.25 0 0 0 7.25 15.25Z"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12.75 13.25L10.25 17H13.75L11.5 20.75"/>
  </symbol>
  <symbol id="icon-lucidity" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <path d="M3.5 12.5C5.75 15.5 8.75 17 12 17S18.25 15.5 20.5 12.5"/>
    <path d="M12 17v2.75M7.25 15.75L6 18.25M16.75 15.75L18 18.25"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M12 3.75Q12.71 6.29 15.25 7Q12.71 7.71 12 10.25Q11.29 7.71 8.75 7Q11.29 6.29 12 3.75Z"/>
  </symbol>
  <symbol id="icon-reality-exploration" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
    <circle cx="10.5" cy="10.5" r="6.75"/>
    <path d="M15.5 15.5L20.75 20.75"/>
    <path class="accent" stroke="currentColor" style="stroke:var(--icon-accent,currentColor)" d="M10.5 7.5Q11.16 9.84 13.5 10.5Q11.16 11.16 10.5 13.5Q9.84 11.16 7.5 10.5Q9.84 9.84 10.5 7.5Z"/>
  </symbol>
</svg>
```
````

### QA_log.md

```markdown
# QA log: finální kontrola výstupů

Datum: 23. 10. 2026. Záloha původních souborů před úpravami je ve scratchpadu sezení (`orig_backup`).

## Co jsem kontroloval

1. **Konzistence mezi dokumenty:** chytrý budík WBTB, záznam „bez snu“, parametry přesnosti zařízení (s, f, ρ), pravidla WBTB.
2. **Citace z paměti:** ověřeny na webu (abstrakty, katalogy knihoven, nakladatelé) a v podkladu `Lucidní snění metody a aplikace 2.md`.
3. **Pravidla obsahu:** žádná dlouhá pomlčka (i viditelný text a atributy HTML), tykání, platnost JSON, 5–7 karet a aspoň 1 kvíz na lekci, max 3 věty na kartu, notifikace ≤ 60 znaků, techniqueId jen z 22 povolených, tagy reflexí, tradice s ≥ 2 zdroji, žádné doporučení galantaminu a doplňků, žádné série a tresty, terminologie (Plán na dnešek, Spánková data, Jak ses vyspal, připomínka, Záloha, Stopy snů, český název techniky první, „mise“ jen v Programu).
4. **HTML:** žádné `<script>` (ani inline, ani `src`), jediný externí zdroj jsou Google Fonts (fonts.googleapis.com, fonts.gstatic.com).

Výsledek automatických kontrol: všechny 4 JSON jsou platné, dlouhá pomlčka (U+2014) se nevyskytuje v žádném výstupu, všech 40 notifikací má ≤ 60 znaků, všech 12 lekcí má 7 karet a 1–2 kvízy, všechna techniqueId jsou povolená, všech 30 reflexí má platný tag a 5 tradičních má ≥ 2 zdroje. Nezlomitelné mezery U+00A0 v lekcích jsem ponechal.

## Co jsem změnil

### Chytrý budík WBTB (inovace.md, HTML)
- `inovace.md` #1: „zvoní do tvého nejpravděpodobnějšího REM okna“ → „zvoní v nejpravděpodobnější části noci“. Přidaná věta, že bez živých dat je zisk malý (asi 0,31 proti 0,27 u pevných 5 h, vybavení snu 55 proti 53 %) a že hodnota je v kotvě na skutečné usnutí, bráně spánku a osobním učení (odkaz na `algoritmus_rem_cyklu.md` 0 a 4.4). V tabulce pořadí poznámka „časování přidává málo“.
- TOP 1: uživatelský příběh „když nejspíš sním“ → „v nejpravděpodobnější části noci“; text karty doplněn „Je to odhad, ne jistota“; „Oura se trefuje do REM ve 4 z 5“ → „šance, že tě budík zastihne v REM, je asi 3 z 10“; ranní text „Budík zazněl v REM. REM od 4:41“ → „Podle Oury jsi byl možná v REM“; metrika „zásah do REM ≥ 50 %“ → sledovat, cíl nebýt horší než pevný čas.
- `dnes_koncept.html`: „Ve 4. REM okně“ → „V nejpravděpodobnější části noci, odhad REM okna…“ (2×), štítek „4. REM okno“ → „pozdní část noci“.

### Pravidla WBTB (všude: max 2× týdně, nikdy dvě noci po sobě, jen po dobré noci, ne v prvních 14 dnech)
- `inovace.md`: brána nově jen po zelené (dřív jen „ne po červené“, ale HTML říká „Žlutá: jen MILD, bez budíku“); alkohol a nemoc bránu zavírají (dřív jen varování, `algoritmus_rem_cyklu.md` je blokoval); čip „Včera byl budík, dvě noci po sobě ne“.
- `algoritmus_rem_cyklu.md` 4.4: brána „ne po červené“ → „jen po zelené (ne po žluté ani červené)“; bod 9.7 aktualizován.
- `program_weeks_3_6.json`: u všech 5 nocí s výpravou podmínka „a nebyla to noc s výpravou“; d24 doplněno „nejvýš 2× týdně a nikdy dvě noci po sobě“. Rozvrh (d25 | d30, d33 | d37, d40) pravidla splňoval už předtím.
- `lessons_new.json`: oba kvízy s WBTB doplněny o „nikdy dvě noci po sobě“.
- **HTML koncepty porušovaly pravidla:** Dnes byl „pátek, den 16“ a nabízel WBTB „2. ze 2 tento týden“, přitom předchozí noc (detail snu, „Noc 15“) už byla s WBTB, tedy dvě noci po sobě; a TLR experiment „noc 3 z 10“ v noci 15 by začal v prvních 14 dnech. Oprava: detail snu je „Noc 33“ (v programu d33 = WBTB + MILD + téma, sedí k zápisu), Dnes je „Pondělí 26. října, den 37 ze 42“ (d37 = WBTB + MILD + stabilizace), „Noc na pondělí“ bez budíku, „1. ze 2 tento týden“, oblouk programu a čísla nocí přepočítané, odstraněna věta „Vstávání kvůli WBTB…“.
- Dnes a Mapa noci: REM za noc „1:42–2:19“ → „≈1:40–2:20“ (pravidlo zaokrouhlení na 10 min z `presnost_nositelne_elektroniky.md` 2.3).

### Záznam „Probudil jsem se, ale nic si nepamatuju“
- `inovace.md` #5 (Co), TOP 1 (tlačítko „Nic si nepamatuju“ ukládá záznam bez snu) a TOP 5 C (rychlá volba s časem); ve sdíleném modelu přidán `LR_BEZ_SNU = 0.4` podle `algoritmus_rem_cyklu.md` 4.2.

### Parametry přesnosti a ρ
- `presnost_nositelne_elektroniky.md` 3.3: poznámka, že binární ρ = 0,3 odpovídá třítřídnímu ρ ≈ 0,4 v algoritmu.
- `algoritmus_rem_cyklu.md` (Vazby): stejná věta z druhé strany (převod v 3.3 už tam byl).
- `inovace.md`: pod sdíleným REM profilem věta s parametry (Oura 0,70 / 0,10, Garmin 0,50 / 0,15, ρ 0,3 binárně ≈ 0,4 třítřídně), že závazný je model v algoritmu a že VAHA je zjednodušení.

### Citace
| Citace | Ověření | Změna |
|---|---|---|
| Barrett 1993, Dreaming 3(2) | Abstrakt: zhruba polovina měla sen k problému, většina z nich v něm viděla řešení, nezávislí hodnotitelé o něco méně | Lekce a program sedí. `inovace.md` #10: „téma zhruba v každé druhé noci“ → „každý druhý člověk za celý týden“ |
| Haar Horowitz a kol. 2020, Consciousness and Cognition 83:102938 (Dormio) | Ověřeno (50 účastníků, odpolední zdřímnutí, téma „strom“ v hypnagogii častěji) | Program d31: „Horowitz“ → „Haar Horowitz“ |
| LaBerge & Rheingold 1990; Norbu 1992 (Snow Lion); Holecek 2016 (Dream Yoga) | Ověřeno | Bez změny |
| Holecek 2020, Dreams of Light | Ověřeno (Sounds True, 2020, denní praxe) | Bez změny |
| Tsongkhapa přes Mullin 1996; Evans-Wentz 1935 | Ověřeno (Snow Lion 1996, A Book of Three Inspirations; Oxford UP 1935) | Bez změny |
| Metzinger 2003 / 2009 | Lucidní sen jako chvíle, kdy model přestává být průhledný (opacita), doložen pro The Ego Tunnel 2009 | r37: chybné „model zprůhlední“ → „přestane být průhledný“ |
| Saint-Denys 1867 | Ověřeno (Paris, Amyot, anonymně) | Bez změny |
| Hearne 1978 | Disertace University of Liverpool, pokus 12. 4. 1975 v Hullu | r46: „University of Hull“ → „University of Liverpool (pokus v Hullu 1975)“; lekce už měla správně |
| LaBerge, NightLight (točení) | Výsledky v NightLight 7(3–4), 1995: šance na pokračování snu asi 22 : 1 po točení, 13 : 1 po tření dlaní, 1 : 2 u „nechat se unášet“; původní studie z 1989 byla neprůkazná | Lekce dreamStability: „nepřineslo jasný výsledek“ → po točení i tření sen častěji pokračoval, malá studie bez recenze; zdroj „LaBerge 1995, NightLight 7(3–4)“ |
| Gardiner 2023, Sleep Med Rev 69:101764 | Ověřeno (24 studií, −45 min, káva ≥ 8,8 h před spaním) | Bez změny |
| Ebrahim 2013, Alcohol Clin Exp Res | Ověřeno (rozbitá 2. polovina noci, REM snížen hlavně ve vyšších dávkách) | Bez změny |
| Nielsen 2010; Choo 2023 | Nielsen: noční můry a večerní typ, hlavně u žen, sny nezkoumal; Choo (Sleep Biol Rhythms): lepší vybavování a víc distresu z můr | Lekce chronotypeNaps zmírněna: vybavování jen podle Choo, můry hlavně ženy podle Nielsena, jiná studie souvislost nepotvrdila |

### Ostatní pravidla
- `lessons_new.json` falseAwakening: „hlavně při WBTB“ → „hlavně při technice Probuzení a návrat do spánku (WBTB)“ (český název první).

## Co zůstává nejisté
- Čísla chytrého budíku (0,31 / 0,27) pocházejí z vlastní simulace v `algoritmus_rem_cyklu.md`, ne z měření na lidech.
- Výsledky LaBergeova srovnání točení a tření znám jen z webu Lucidity Institute (sekundárně), počet účastníků jsem nepotvrdil.
- Metzinger 2003 (Being No One): přímou pasáž o lucidních snech jsem nedohledal, doložená je hlavně The Ego Tunnel 2009. Obě knihy v r37 nechávám.
- Barrett 1993: číslo „asi čtvrtina vyřešila problém“ z druhotných zdrojů v abstraktu není, proto ho nikde neuvádíme.
- Preprinty 2026 (Peters, Picard-Deland, Konkoly 2026) a další novější zdroje mimo seznam jsem neověřoval znovu, beru je z podkladu.
- HTML koncepty jsem nemohl vykreslit v prohlížeči (není k dispozici). Úpravy jsou textové, jen oblouk programu na Dnes je přepočítaný (den 37, týden 6).
- Dnes je teď pondělí s větou „zítra nemusíš brzy vstávat“. Odpovídá podmínce, ale u běžného pracovního týdne působí méně přirozeně.
- Dnes: karta Programu ukazuje „Mise 37“. Je to obsah z Programu, proto „mise“ nechávám. Při přísném výkladu pravidla „mise jen v Programu“ by šlo použít „Program · den 37“.
- Detail snu ukazuje pravděpodobnost původu snu „82 % / 11 % / 7 %“. Podle `presnost_nositelne_elektroniky.md` 2.1 by se měla zaokrouhlovat na desítky. Neměnil jsem to, protože k tomu patří šířky pruhů v SVG.
```
