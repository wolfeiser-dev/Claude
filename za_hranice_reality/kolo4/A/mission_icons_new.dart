// Za hranice reality · kolo 4 · A
// Nové piktogramy pro MissionGlyph, převedené z ikony.svg.md (kolo 1).
//
// Soubor nemá importy. Všechno patří do stejného souboru jako enum MissionGlyph,
// třída _Part a pomocníci _circle() a _rect(), protože jsou soukromé.
//
// Jak vložit:
// 1. Do enum MissionGlyph přidej za `cycle,` hodnoty z bloku ENUM níže.
// 2. Mapu _glyphsNew vlož pod _glyphs a do _glyphs přidej jako poslední položku `..._glyphsNew,`.
//    Druhá možnost: zkopíruj položky z _glyphsNew přímo do _glyphs a _glyphsNew smaž.
//
// Pravidla převodu:
// - mřížka 24, linka 1,5, právě jeden _Part s accent: true u každé ikony,
// - <circle> přes _circle(), oblouky přes A/a, úsečky a lomené čáry jako L/H/V,
// - každý příkaz má vlastní písmeno (žádné implicitně opakované souřadnice),
// - tečka v SVG (kruh r 0,5 až 0,75 s tahem 1,5) je plný kruh o poloměru r + 0,75,
//   tedy _circle(..., 1.25) nebo _circle(..., 1.5) s fill: true, jako noc a test reality v appce.
//   Předpoklad: painter u fill: true jen vyplňuje a netahá obrys.
// - hvězda (čtyřcípá jiskra) zůstává obrysem s tahem jako v originálu, není fill.
//
// ENUM (přidat do enum MissionGlyph za `cycle,`):
//
//   // kolo 4
//   intention, // Záměr: zaměřovač s hvězdou
//   alarm, // Budík: připomínka, probuzení v daný čas
//   emotion, // Emoce: tvář s úsměvem
//   lesson, // Lekce: otevřená kniha s jiskrou
//   starMap, // Hvězdná mapa: souhvězdí v rohových značkách
//   dreamYoga, // Jóga snu: lotos s tečkou
//   falseAwakening, // Falešné probuzení: postel a smyčka
//   nightmare, // Noční můra: mrak s bleskem
//   lucidity, // Lucidita: zavřené oko a hvězda
//   realityExplore, // Zkoumání reality: lupa nad hvězdou

final Map<MissionGlyph, List<_Part>> _glyphsNew = {
  // 04 Záměr (icon-intention)
  MissionGlyph.intention: [
    _Part(_circle(12, 12, 7)),
    const _Part('M12 3V5M12 19V21M3 12H5M19 12H21'),
    const _Part('M12 9.25Q12.61 11.39 14.75 12Q12.61 12.61 12 14.75Q11.39 12.61 9.25 12Q11.39 11.39 12 9.25Z',
        accent: true),
  ],
  // 07 Budík (icon-alarm)
  MissionGlyph.alarm: [
    _Part(_circle(12, 13, 7)),
    const _Part('M3.5 7.5a3.75 3.75 0 0 1 4-4M20.5 7.5a3.75 3.75 0 0 0-4-4M7 18l-1.5 2.5M17 18l1.5 2.5'),
    const _Part('M12 9.5V13l2.5 1.75', accent: true),
  ],
  // 09 Emoce (icon-emotion)
  MissionGlyph.emotion: [
    _Part(_circle(12, 12, 9)),
    const _Part('M9 9.25V10.25M15 9.25V10.25'),
    const _Part('M8.5 14.25c1.9 2.33 5.1 2.33 7 0', accent: true),
  ],
  // 19 Lekce (icon-lesson)
  MissionGlyph.lesson: const [
    _Part('M12 9.25C10.25 8 7 7.5 3 8V19c4-.5 7 0 9 1.25C14 19 17 18.5 21 19V8c-4-.5-7.25 0-9 1.25ZM12 9.25V20.25'),
    _Part('M12 2.75Q12.49 4.5 14.25 5Q12.49 5.5 12 7.25Q11.51 5.5 9.75 5Q11.51 4.5 12 2.75Z', accent: true),
  ],
  // 18 Hvězdná mapa (icon-star-map); hvězdy souhvězdí: SVG r 0,5 s tahem 1,5 = plný kruh r 1,25
  MissionGlyph.starMap: [
    const _Part('M3 7V3H7M17 3h4V7M21 17v4H17M7 21H3V17'),
    const _Part('M7.5 15.5L10 9.5L14 11.5L16.5 8M14 11.5L15.5 16'),
    _Part(_circle(7.5, 15.5, 1.25), fill: true),
    _Part(_circle(10, 9.5, 1.25), fill: true),
    _Part(_circle(14, 11.5, 1.25), fill: true),
    _Part(_circle(15.5, 16, 1.25), fill: true),
    const _Part('M16.5 5.75Q17 7.5 18.75 8Q17 8.49 16.5 10.25Q16 8.49 14.25 8Q16 7.5 16.5 5.75Z', accent: true),
  ],
  // 20 Jóga snu (icon-dream-yoga); akcentní tečka: SVG r 0,75 s tahem 1,5 = plný kruh r 1,5
  MissionGlyph.dreamYoga: [
    const _Part('M12 7.5C14.25 10 14.25 15.25 12 18.5C9.75 15.25 9.75 10 12 7.5Z'),
    const _Part('M12 18.5C9 18.25 5.75 16.25 4.5 12C7.75 12 10.25 14 11.25 17'
        'M12 18.5C15 18.25 18.25 16.25 19.5 12C16.25 12 13.75 14 12.75 17'),
    const _Part('M5 21.25H19'),
    _Part(_circle(12, 3.75, 1.5), accent: true, fill: true),
  ],
  // 21 Falešné probuzení (icon-false-awakening); polštář zůstává obrysem (r 1,5)
  MissionGlyph.falseAwakening: [
    const _Part('M3 10V20M3 16.5H21V20M9.5 16.5V13.5H18.5A2.5 2.5 0 0 1 21 16'),
    _Part(_circle(6.25, 13.75, 1.5)),
    const _Part('M16.22 8.27A3 3 0 1 1 15.22 4.54M13.48 4.39L15.22 4.54L14.48 2.96', accent: true),
  ],
  // 22 Noční můra (icon-nightmare)
  MissionGlyph.nightmare: const [
    _Part('M7.25 15.25H17A4 4 0 0 0 16.49 7.28A4.5 4.5 0 0 0 7.56 6.76A4.25 4.25 0 0 0 7.25 15.25Z'),
    _Part('M12.75 13.25L10.25 17H13.75L11.5 20.75', accent: true),
  ],
  // 23 Lucidita (icon-lucidity)
  MissionGlyph.lucidity: const [
    _Part('M3.5 12.5C5.75 15.5 8.75 17 12 17S18.25 15.5 20.5 12.5'),
    _Part('M12 17v2.75M7.25 15.75L6 18.25M16.75 15.75L18 18.25'),
    _Part('M12 3.75Q12.71 6.29 15.25 7Q12.71 7.71 12 10.25Q11.29 7.71 8.75 7Q11.29 6.29 12 3.75Z', accent: true),
  ],
  // 24 Zkoumání reality (icon-reality-exploration)
  MissionGlyph.realityExplore: [
    _Part(_circle(10.5, 10.5, 6.75)),
    const _Part('M15.5 15.5L20.75 20.75'),
    const _Part('M10.5 7.5Q11.16 9.84 13.5 10.5Q11.16 11.16 10.5 13.5Q9.84 11.16 7.5 10.5Q9.84 9.84 10.5 7.5Z',
        accent: true),
  ],
};

// IKONY, KTERÉ APPKA UŽ MÁ (nic jsem neměnil, jen hodnocení čitelnosti)
//
// Poctivě: v zadání je soubor useknutý po `ssild`. Vidím jen řetězce pro today, journal,
// voice, night, wbtb, realityTest, mild a ssild (u ssild jen první čtyři části). Porovnat
// tedy můžu jen deník, hlas, noc a test reality. U ostatních píšu jen, co nabízí moje verze
// a kde má slabinu na 24 px; jestli je čitelnější než vaše, z těchto podkladů nevím.
//
// Lze porovnat (řetězec je v zadání):
// - journal  ↔ 10 Deník: vaše verze je čitelnější. Záložka-stužka nahoře je jasný znak
//   „deník/kniha“ a je u okraje, kde se nic nepere. Moje hvězda na obálce s linkou pod ní
//   splývá na 24 px do skvrny a hvězda v sadě už znamená sen, záměr i luciditu.
// - voice    ↔ 14 Mikrofon: zhruba stejně čitelné, tvar mikrofonu je skoro totožný
//   (moje kapsle je <rect> r 3, šla by přes _rect(9, 2.75, 6, 11, 3)). Vaše zvukové
//   čárky po stranách říkají „hlas“, moje tečka nahrávání říká „nahrává se“. V nočním
//   režimu, kde je všechno červené, ztrácí tečka svůj význam, takže doporučuju nechat vaši.
// - night    ↔ 06 Měsíc: stejně čitelné. Srpek je skoro stejný; vaše plná tečka je na 24 px
//   klidnější než moje hvězda (5,5 px), hvězda je čitelnější až od 48 px. Jediný důvod
//   pro moji verzi by byla jednotnost s novými ikonami, kde hvězda nese akcent.
// - realityTest ↔ 05 Ruka: stejné. Vaše ruka vychází ze stejného tvaru (4 prsty, palec,
//   tečka v dlani); vaše plná tečka r 1,5 je čistší než můj obrysový kruh r 1,25. Nechat vaši.
// - wbtb (není v mé sadě): nová ikona alarm je s ní příbuzná (kruh, ručičky, zvonky). Liší
//   se nožičkami a většími zvonky; na 24 px je rozdíl znát, ale nedávej je vedle sebe do
//   jednoho seznamu. Alarm patří k připomínkám a budíku, wbtb k technice.
//
// Nelze porovnat (řetězec v zadání chybí), jen popis mé verze:
// - dream      ↔ 01 Sen: mrak s hvězdou uvnitř. Na 24 px čitelné, hvězda uvnitř je ale malá.
// - rem        ↔ 02 REM: schodovitý hypnogram s akcentním úsekem nahoře. Dobře čitelné
//   i na 20 px, protože je to jen pár pravoúhlých čar.
// - eye        ↔ 03 Oko: oko, duhovka r 3,25 a tečka zornice. Standardní, čitelné.
// - brain      ↔ 08 Mozek: dvě hemisféry s rýhami, tečka v čelním laloku. Na 24 px hustý
//   (tři cesty se záhyby), čitelný až od 32 px. Pokud je vaše verze jednodušší, nech ji.
// - meditation ↔ 11 Meditace: sedící postava, akcent je celá hlava (kruh r 2,25). Čitelné.
// - planet     ↔ 12 Planeta: koule s prstencem; prstenec je oblouk elipsy otočené o -20°,
//   šel by přes A s rotací. Tečka měsíce vpravo nahoře. Čitelné.
// - drawing    ↔ 13 Kresba: tužka a hvězda. Zadání kresbu uvádí mezi novými významy, enum ale
//   už má `drawing`, proto jsem nepřidal duplicitní hodnotu (sketch). Pokud `drawing` znamená
//   něco jiného než „nakresli sen“, dej vědět a doplním ji.
// - oura       ↔ 15 Prsten: prsten v perspektivě ze dvou elips; <ellipse> váš formát nemá,
//   převod by šel přes dva oblouky A. Na 24 px je vnitřní elipsa (akcent) blízko vnější,
//   čitelnost je spíš průměrná.
// - watch      ↔ 16 Hodinky: kulaté hodinky s řemínkem, akcent je čtvrtoblouk měření. Čitelné.
// - dreamSign  ↔ 17 Stopy snů: klikatá stezka od kroužku ke hvězdě. Významem odpovídá
//   „Stopám snů“ (opakující se motivy), proto jsem ji nepřidal jako novou. Čitelná.
// - constellation: moje 18 Hvězdná mapa je souhvězdí v rohových značkách. Přidal jsem ji jako
//   starMap, protože zadání hvězdnou mapu výslovně uvádí jako nový význam (mapa snů a
//   souvislostí). Vaši constellation nevidím; pokud je to totéž souhvězdí, starMap použij
//   jen tam, kde jde o mapu (celek), a constellation pro jednotlivé spojení.
// - book: moje 19 Lekce (otevřená kniha s jiskrou) je přidaná jako lesson, protože lekce je
//   v zadání nový význam. Vaši book nevidím; mohou si být podobné.
// - yoga: moje 20 Jóga snu je přidaná jako dreamYoga, protože zadání ji uvádí jako nový význam.
//   Pokud vaše `yoga` už znamená jóga snu (a ne třeba jógu nidra), dreamYoga nepřidávej.
// - mild, ssild, today, path, person, vault, cycle: v mé sadě protějšek nemají.
//
// Postřeh k vaší sadě: mild má dva _Part s accent: true (šipka i tečka). Pokud platí pravidlo
// „právě jeden signální prvek“, je to výjimka; nové ikony mají všechny přesně jeden.
