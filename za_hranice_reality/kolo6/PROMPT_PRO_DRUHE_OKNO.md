# Prompt pro hlavní vývojovou session (kolo 6)

Ahoj, tady cloud. Podklady k tomuhle kolu jsou ve větvi `claude/lucidni-sneni-vyzkum-bxf3tp`, složka `za_hranice_reality/kolo6/`. Kód appky nevidím, takže změny chování jsou na tobě. Pořadí podle dopadu na uživatele: 1 → 6.

## 1) Spánek na obrazovce Dnes: „Spánek byl slabší nebo chybí data“ i s připojenou Ourou a Garminem (chyba)
Uživatel to vidí každé ráno, přestože má obě zařízení připojená a data se v Spánku zobrazují.
- **Nejdřív to zreprodukuj testem.** Postav widget/unit test s nocí z Oury a z Garminu (obojí s `sleepScore`, `totalSleepMinutes`, `fetchedAt` dnes ráno) a ověř, co vrací logika semaforu „Jak ses vyspal“.
- **Pravděpodobné příčiny ke kontrole:**
  - Párování podle `nightDate`: večer vs. ráno a UTC vs. místní čas. Po změně času 25. 10. 2026 se může noc posunout o den.
  - Kontrola stáří dat `fetchedAt`: data se stáhnou až po otevření Spánku, ale Dnes se vykreslí dřív.
  - Sloučení dvou zdrojů: jeden chybí, a proto se vrací „chybí data“, místo aby se použil ten druhý.
  - Prahy skóre: Garmin a Oura mají jinou škálu.
  - Cache providera: Dnes se po načtení dat nepřepočítá.
- **Oprava:** když má aspoň jedno zařízení noc s rozumnými daty, semafor ji použije. „Chybí data“ jen tehdy, když opravdu nic není. „Slabší“ jen podle skutečných prahů.
- **Text:** „Spánek byl slabší, nebo chybí data“ rozděl na dva různé stavy s různými texty, ať uživatel ví, který z nich nastal.

## 2) Tlačítko Zpět (Android) má vracet, ne zavírat appku
- Na vnořených obrazovkách (detail lekce, technika, test reality, zápis, laboratoř…) systémové Zpět vrátí o krok zpátky, stejně jako šipka v appce.
- Na hlavní obrazovce záložky, která není Dnes, Zpět přepne na Dnes.
- Na Dnes první Zpět ukáže krátké upozornění „Ještě jednou zpět a appka se zavře“ (asi 2 s). Druhé Zpět během té doby appku zavře.
- Implementace: `PopScope` (Flutter 3.27, `canPop` + `onPopInvokedWithResult`), u vnořených navigátorů v záložkách použij `maybePop`. Pozor na otevřené dialogy a sheety: Zpět zavře nejdřív je. Pozor i na noční režim: Zpět nesmí omylem ukončit běžící noc, raději ukaž potvrzení.
- Testy: widget testy pro všechny tři případy.

## 3) Test reality: slidy klepnutím a swipem, ne časovačem
- Tři obrazovky testu se teď přepínají samy. Nově: klepnutí kamkoli na obrazovku nebo swipe doleva přepne na další. Swipe doprava vrátí na předchozí (přirozený směr `PageView`).
- Časovač zruš, nebo ho nech jen jako jemný ukazatel (progress), který nic sám nepřepne. Na posledním slidu klepnutí dokončí test.
- Ochrana před omylem: po přepnutí asi 300 ms ignoruj další klepnutí.
- Přístupnost: tlačítka Další/Zpět pro čtečku obrazovky. V noční červené to musí fungovat stejně.

## 4) Výcvik, aby to bylo „opravdu něco“: splněno + krátký kvíz
Uživatel: „Výcvik je jako informační tabule. Proklikám postup, ale nikde nevidím, že mám splněno. Minutový časovač jen opakuje to, co jsem proklikal.“
- **Podklady:** `kolo6/technique_quizzes.json`. Pro každou ze 22 technik jsou tam 2 krátké otázky na podstatu a texty `texts.quiz.*` (Splněno, Dokončit blok, zpětná vazba, „{hotovo} z {celkem}“).
- **Tok bloku** (Minuta vědy, Minuta jógy snu, stránka techniky):
  1. Přečti (karty).
  2. Udělej: postup krok za krokem, časovač jen tam, kde opravdu měří čas (dech, cykly SSILD), ne jako opakování kroků.
  3. Kvíz: 2 otázky podle `techniqueId` bloku.
  4. Zelená fajfka „Splněno“ u bloku i v přehledu dne.
- **Pravidla:**
  - Špatná odpověď nic nebere: ukáže vysvětlení a dá druhý pokus. Žádné série ani tresty, jsou to pravidla appky.
  - Splnění se ukládá lokálně (den, blok, datum).
  - Lekce mají kvízy už teď; sjednoť jejich vzhled se splněním bloků.
- **Dnes a Program:** u dne programu ukaž „2 ze 3 hotovo“ s fajfkami. Den jde dokončit i bez kvízu, protože kvíz má potěšit, ne blokovat spánek.

## 5) Spánek: špendlíky snů i z minulých nocí
- **Varianty:** `kolo6/rem_spendliky_varianty.html` má 3 vizuální varianty (A vyblednuté špendlíky, B hustota snů, C pás nocí) a noční náhled doporučené varianty. Uživatel si vybere. Do té doby nic nestav, nebo postav doporučenou variantu za přepínačem.
- **Logika (platí pro všechny varianty):**
  - Minulé sny (posledních 10 nocí, jen s `dreamAt`) se umisťují podle času od usnutí své noci (`dreamAt − onset`), ne podle hodin. Pak se promítnou na dnešní nebo obvyklou osu.
  - Poslední noc má současné barvy, starší tlumenější odstín podle stáří.
  - Žádná procenta, jen „častěji / méně často“.
- **Data:** onset bere z té noci (Oura, jinak Garmin, jinak průměrný onset uživatele). Sny bez `dreamAt` se nezobrazují.

## 6) Zápis snu: „Sen, který si nepamatuju“
- **Volba:** v ranním zápisu přibude vedle „Nic si nepamatuju“ volba „Sen, který si nepamatuju“. Ta znamená, že vím, že se mi něco zdálo, ale obsah nevím.
- **Co se ptá:** jen na čas (`dreamAt`, volitelně `wokeFromDream`). Ostatní pole (text, živost, lucidita, Stopy snů…) se neukazují.
- **Model:** nejjednodušší je nová hodnota v `RecallLevel` (např. `unknownContent`) nebo příznak `contentForgotten`. `isEmptyNight` pro ni musí vracet false, protože noc prázdná nebyla.
- **REM model:** pro tvůj REM model je to silný časový signál „sen tu byl“ (jako `wokeFromDream`), ale do statistik živosti a lucidity se nepočítá.
- **Texty:**
  - volba: „Sen, který si nepamatuju“
  - podnadpis: „Víš, že se ti něco zdálo, ale ne co. Stačí čas.“
  - otázka na čas: „Kdy to zhruba bylo?“
  - potvrzení: „Zapsáno. I tohle pomáhá najít tvoje REM okna.“

Na konci prosím krátce: co je hotové, co testy pokryly a co zůstává.
