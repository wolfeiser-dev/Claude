Ahoj, tady zase hlavní vývojová session appky „Za hranice reality“. Tvých 12 ilustrací lekcí je v appce. V telefonu vypadají skvěle, `flutter analyze` hlásil jen jedno chybějící `{ }` u `if`. Kredity nešetři, zbývá asi 100 $. Pracuj samostatně a na nic se neptej. Každý výstup commitni do větve `claude/lucidni-sneni-vyzkum-bxf3tp`, složka `za_hranice_reality/kolo3/`. Do závěrečné odpovědi dej krátký přehled souborů a upozornění.

Dvě části. **Nejdřív dokonči A celou, pak B.**

---

## A) Ilustrace technik a starších lekcí

Stejná smlouva, styl a ověřování jako minule: třídy `extends _Art`, mono popisky VELKÝMI písmeny přes `label()`, texty v `training.art.<id>.<klíč>`, výška 176 px (max 230), šířky 320–430, den i noc (`redOnly`), jen barvy ze skinu. Minule jsi ověřoval na maketě, to stačí i teď. Nově ale **přidej `{ }` ke každému tělu `if` a `for`** (lint `curly_braces_in_flow_control_structures`).

### A1. Vlastní ilustrace pro 11 technik
Tyhle techniky zatím sdílejí cizí ilustraci, nebo žádnou nemají. Každá potřebuje vlastní kresbu, která ukazuje **princip techniky**: co se děje v těle, v mysli nebo v čase noci.
- `recallTraining` (Jak si pamatovat víc snů, teď `forgetting`): Deník je začátek. Tady jde o to, jak vybavování posílit: zájem o sny, večerní klid, přetáčení snu pozpátku a hlasový záznam. Bez vybavování nejsou data ani lucidní sny. Kroky: Večer si řekni, že si sen chceš pamatovat a že tě zajímá. / Dvě minuty před spaním klid bez displeje. / Ráno se nehýbej a nech oči zavřené. / Přetáčej sen pozpátku od posledního obrazu. / Řekni nahlas tři slova a jednu emoci. / Pak doplň detaily: místa, postavy, zvuky. / Jednou týdně projdi zápisy a najdi tři opakující se věci.
- `deild` (Návrat do snu bez pohybu, teď `hypnogram`): Probudíš se ze snu a ani se nepohneš. Se zavřenýma očima si poslední scénu živě vybavíš a necháš se do ní vtáhnout. Mozek je často ještě blízko REM, takže se můžeš vrátit, tentokrát vědomě. Kroky: Po probuzení ze snu se nehni ani prstem. / Nech oči zavřené. / Vybav si poslední moment snu co nejpodrobněji. / Nech se do scény vtáhnout. Nepřemýšlej, prožívej. / Ve snu se hned zeptej: Sním? A podívej se na ruce. / Nevyšlo to? Zapiš sen. Jeden pokus stačí.
- `fild` (Prsty jako na klavíru při usínání, teď `wildBridge`): Při usínání po budíku nepatrně střídáš ukazovák a prostředník, jako bys hrál na klavír. Pohyb tě drží na hraně mezi bděním a spánkem. Pak uděláš test reality. Funguje jen v úzkém okně těsně před usnutím. Kroky: Přes den si pohyb pár minut zkoušej, ať se ho neučíš až v noci. / V noci po budíku si lehni s pohodlně opřenou rukou. / Až budeš ospalý, střídej prsty nepatrně asi 30 vteřin. Nepočítej. / Pak test reality: zavři rty a zkus se nadechnout ústy. / Jsi vzhůru? Počkej asi dvě minuty a zkus to znovu. / Usneš? Nech to být.
- `ada` (Kritická reflexe podle Tholeye, teď `realityTree`): Místo mechanického testu každou hodinu si během dne všímáš, kde je tvoje pozornost. Pětkrát až desetkrát denně se zastavíš u spouštěče a opravdu se zeptáš: Sním, nebo bdím? A ohlédneš se, jak ses sem dostal. Kroky: Zvol 3 až 5 spouštěčů z běžného dne: dveře, hodiny, voda, čaj. / U spouštěče se na pár vteřin zastav. / Zeptej se: Co teď vnímám? Jak jsem se sem dostal? / Ohlédni se zpátky v čase: kdy a kde to začalo? / Je tu něco divného? Odpověz vlastními slovy. / Večer jedním slovem zapiš, jestli to šlo doopravdy.
- `dreamYogaDay` (Záměr dne, teď `None`): Během dne si občas připomeneš: tohle, co prožívám, je jako sen. Na slově „jako“ záleží. Nejde o to, že nic není skutečné, ale o lehčí vztah k tomu, co se děje. Kroky: Ráno si dej záměr: dnes budu vnímat den jako sen. / Párkrát za den se zastav a rozhlédni se. / Řekni si v duchu: tohle je jako sen. / Všimni si, jak se věci mění a plynou. / Cítíš úzkost nebo pocit neskutečna? Přejdi na uzemnění.
- `dreamYogaRelease` (Večerní ohlédnutí, teď `None`): Večer projdeš den a všimneš si chvil silné touhy nebo odporu: co chceš držet a co odstrkuješ. Nehodnotíš, jen to necháš povolit. Kroky: Večer si v klidu projdi den. / Najdi chvíli silné touhy nebo odporu. / Všimni si, kde to cítíš v těle. / S výdechem to nech povolit. Nic neřeš. / Řekni si: i tohle bylo jako sen.
- `dreamYogaIntention` (Třetí a čtvrtá příprava, teď `None`): Večer si dáš záměr poznat sen. Ráno se k noci vrátíš s radostným úsilím, ať z ní zůstalo cokoli. Bez hodnocení a bez výčitek. Kroky: Před spaním si připomeň, proč praktikuješ. / Dej si záměr: dnes v noci chci poznat, že sním. / Ráno si nejdřív vybav, co se ti zdálo. / Přijmi to s radostí, i když je toho málo. / Nic? Dej si záměr na další noc. Bez výčitek.
- `lucidMission` (Co dělat, když víš, že sníš, teď `ladder`): Když víš, že sníš, nabízí jóga snu řadu cvičení: rozpoznat, stabilizovat, proměnit, překročit nemožné, rozmnožit, čelit strachu a rozpustit. Cílem není zábava, ale uvolnit pevné představy o tom, co je možné. Pevné pořadí neexistuje. Kroky: Před spaním zvol jeden malý cíl, třeba změnit barvu předmětu. / Ve snu nejdřív rozpoznej a stabilizuj. / Malá proměna: stůl se změní v květinu. / Překroč nemožné: natáhni ruku skrz zeď. / Rozmnož: z jedné věci udělej víc. / Strach: pojmenuj ho z odstupu, pak se přibliž a zeptej se, co chce. / Na konci můžeš scénu rozpustit do světla a pustit ji.
- `meditation` (Šamatha, počítání dechů, otevřené pozorování, teď `breath`): Pět až deset minut denně trénuješ pozornost. Nejdřív ji klidně držíš na dechu (šamatha), pak jen pozoruješ, co přichází (otevřené pozorování). Každý návrat od zatoulané myšlenky je jedno opakování. Kroky: Sedni si nebo si lehni, záda volně rovná. / Pozornost na dech u nosu nebo na břiše. / Počítej výdechy od 1 do 9, pak znovu od jedné. / Ztratíš počet? Všimni si toho a začni od jedné. Nehodnoť. / Posledních pár minut jen pozoruj, co přichází. / Občas to tiše pojmenuj: myšlenka, zvuk, pocit.
- `yogaNidra` (Řízená hluboká relaxace, teď `body`): Ležíš a pozornost vedeš tělem, jednu část po druhé. Tělo těžkne a zklidní se. Je to relaxace a příprava, ne technika na lucidní sen. Hodí se večer nebo po náročném dni. Kroky: Lehni si na záda, ruce volně podél těla. / Pár pomalých výdechů, delších než nádech. / Pozornost veď postupně: pravá ruka, prsty, dlaň, paže. / Pak pravá noha, levá ruka, levá noha, záda, břicho, obličej. / U každé části se na chvíli zastav a jen vnímej. / Nakonec vnímej celé tělo najednou. Usneš? Je to v pořádku.
- `grounding` (Návrat do těla a do přítomnosti, teď `breath`): Když test reality nebo „den jako sen“ vyvolá úzkost či pocit neskutečna, vrátíš se smysly do přítomnosti. Stačí minuta. Kroky: Zastav se. Polož chodidla na zem. / Pojmenuj pět věcí, které vidíš. / Čtyři věci, kterých se dotýkáš. / Tři zvuky, které slyšíš. / Pomalý výdech, delší než nádech. / Řekni si, kde jsi a jaký je den.

### A2. Ilustrace ke 22 kartám starších lekcí
Tyhle karty zatím ilustraci nemají. Ke každé vyber nejvhodnější id z existujících:
`hypnogram, mildLoop, ssild, wildBridge, forgetting, realityTree, body, breath, ladder, dreamSignGrid, fadingTrace, brainMap, remRebound, loopRoom, rewriteScript, seedMoon, cueWave, timeline, eyeSignal, chronoDial, twoHypnograms`
nebo z tvých nových v A1. Nové navíc smíš navrhnout nejvýš 6, jen tam, kde žádná existující nesedí.
- lekce `sleepCycles`, karta 1 „Kde bydlí sny“: Sny se zdají i mimo REM, ale nejdelší a nejživější jsou v REM. Lucidní sny se v laboratoři prokázaly hlavně v REM: snící dávali domluvené signály pohyby očí, které šly vidět na záznamu. Svaly těla jsou v REM ochrnuté, oči ne.
- lekce `recall`, karta 1 „Nehýbej se a přetáčej“: Zůstaň ležet ve stejné poloze se zavřenýma očima. Přetáčej sen pozpátku od posledního obrazu. Pak řekni tři slova a jednu emoci. Hlasem to jde rychleji a záznamy bývají delší než psané.
- lekce `recall`, karta 2 „Postoj dělá hodně“: Lidé, které sny zajímají, si jich pamatují víc. Pomáhá i noční probouzení a večerní klid. Všechny tyhle vlivy ale vysvětlují jen malou část rozdílů mezi lidmi (Schredl a kol. 2003). Prázdná noc je taky zápis.
- lekce `prospective`, karta 0 „Paměť na budoucnost“: Prospektivní paměť znamená vzpomenout si ve správnou chvíli, že máš něco udělat. Třeba koupit chleba, až půjdeš kolem pekárny. Lucidní sen potřebuje totéž: vzpomenout si uprostřed snu, že máš zkontrolovat, jestli sníš.
- lekce `realityTest`, karta 0 „Ve snu chybí odstup“: Ve snu přijmeš i létající autobus a nedivíš se. Mozek ve snu méně kriticky hodnotí, co se děje. Test reality má tenhle odstup na chvíli vrátit.
- lekce `realityTest`, karta 2 „Které testy“: Spolehlivé bývají ty, které ve snu často selžou: nádech zavřenými rty, text, který se při druhém čtení změní, prsty na ruce. Jejich spolehlivost je komunitní odhad. Ve studii ILDIS přidání testů k záměru poznat sen (MILD) výsledek spíš zhoršilo, proto je nedělej mechanicky.
- lekce `notControl`, karta 0 „Tři různé věci“: Lucidita znamená, že víš, že sníš. Stabilita znamená, že sen udržíš. Kontrola znamená, že měníš děj. Jedno nezaručuje druhé. Můžeš vědět, že sníš, a sen přesto běží po svém (Bonamino a Peters 2026).
- lekce `notControl`, karta 2 „Neúspěch bez dramatu“: Nepříjemné zážitky v lucidních snech vznikají hlavně u nepovedených pokusů o kontrolu. Když něco nejde, zkus jinou cestu: místo vypínače otevři dveře. Nebo jen pozoruj. I to je lucidita.
- lekce `sleepParalysis`, karta 1 „Běžné a neškodné“: Zažije ji zhruba pětina lidí. Sama o sobě nebezpečná není a vždy mine. Častější je při nedostatku spánku, stresu a nepravidelném režimu. Častěji ji lidé popisují při vědomém usnutí do snu (WILD) a při návratu do snu hned po probuzení (DEILD).
- lekce `sleepParalysis`, karta 2 „Co dělat“: Připomeň si: tohle je spánková paralýza, mine. Dýchej pomalu. Rady se liší: buď zůstaň v klidu a soustředěně relaxuj, nebo zkus pohnout malou částí těla, třeba malíčkem. Zkus, co sedí tobě. SOS kartu najdeš v nočním režimu.
- lekce `sleepParalysis`, karta 3 „Kdy k lékaři“: Když se paralýza vrací často, trápí tě nebo se bojíš usnout, poraď se s lékařem. Zvlášť když přes den nečekaně usínáš nebo ti při smíchu či leknutí ochabují svaly. Můžou to být příznaky narkolepsie.
- lekce `yogaDay`, karta 0 „Tradice, ne věda“: Tibetská jóga snu pochází z tradice bön (Tenzin Wangyal Rinpočhe) a z buddhistických linií (Namkhai Norbu, Andrew Holecek). Vědecky testovaná není. Dává ale smysl a řád tomu, co se sny dělat, a její denní přípravy se potkávají s tím, co víme o paměti a pozornosti.
- lekce `yogaDay`, karta 1 „Čtyři přípravy“: Wangyal popisuje čtyři přípravy: vnímat den jako sen, uvolnit lpění a odpor, večer si dát záměr a ráno se k noci vrátit s radostným úsilím. Poslední dvě se překrývají se záměrem poznat sen (MILD) a s deníkem.
- lekce `yogaDay`, karta 2 „Den jako sen“: Párkrát denně se zastav a řekni si: tohle je jako sen. Na slově „jako“ záleží. Nejde o to, že nic není skutečné, ale o lehčí vztah k tomu, co se děje. Když ti to přináší úzkost nebo pocit neskutečna, přestaň a uzemni se.
- lekce `yogaNight`, karta 1 „Zdroje se liší“: Poloha: Wangyal radí mužům pravý bok a ženám levý, Norbu zpočátku levý bok pro jasnost, popisy školy kagjü lví polohu na pravém boku. Obraz: Wangyal rudý lotos s písmenem A v hrdle, Norbu bílé A v srdci a rudé v hrdle, jiné texty světlo mezi obočím. Vyber si, co ti sedí. Mechanismus nikdo netestoval.
- lekce `yogaNight`, karta 3 „Jen to, co je v textech“: Na internetu koluje řada barevných a číselných schémat, která se v textech učitelů nenašla. Appka se drží jen toho, co je v nich doložené, a tělo ukazuje jen jako obecné schéma pozornosti. Jóga spánku, tedy vědomí v hlubokém spánku bez snů, je pokročilá praxe, kterou tradice předává osobně. Změřit se zatím nedá.
- lekce `meditation`, karta 0 „Co víme“: Lidé, kteří dlouhodobě meditují, hlásí víc lucidních snů: 1,11 proti 0,45 za měsíc (Baird a kol. 2019). Kdo medituje denně, hlásí jich víc než ten, kdo medituje jednou týdně (Gerhardt a Baird 2024). Jsou to ale korelace.
- lekce `meditation`, karta 2 „Malá studie s VR“: V jedné studii trénovali lidé po krátké meditaci otázku Sním? ve snové virtuální realitě a měli víc lucidních snů než kontrolní skupina (Signorelli a kol. 2026, 38 lidí). Je to malá studie a aplikace patří organizaci jednoho z autorů. Zajímavé, ne rozhodující.
- lekce `reality`, karta 0 „Zhuangzi a motýl“: Zhuang Zhouovi se zdálo, že je motýl. Pak se probudil a nevěděl, jestli se motýlovi nezdá, že je Zhuang Zhou. Mnozí odborníci příběh nečtou jako důkaz, že svět je sen, ale jako obraz proměny věcí: jedna zkušenost střídá druhou a hranice mezi nimi není pevná.
- lekce `reality`, karta 1 „Descartes a argument snu“: Descartes v Meditacích (1641) píše, že neexistují jistá znamení, kterými bys bdění spolehlivě odlišil od snu. Jeho odpověď je test soudržnosti: zapadá zážitek do zbytku života? Současný filozof Grundmann navrhuje jiné vodítko: když umíš kriticky uvažovat, spíš bdíš. Lucidní sen je zajímavý tím, že kritická úvaha v něm běží taky.
- lekce `reality`, karta 2 „Buddhistická snová analogie“: Diamantová sútra přirovnává podmíněné jevy ke hvězdě, lampě, iluzi, rose, bublině, snu, blesku a mraku. Madhjamaka dodává, že věci vznikají z podmínek a nemají pevnou samostatnou podstatu. Je to způsob pohledu, ne tvrzení, že nic neexistuje. Z toho vychází praxe den jako sen.
- lekce `reality`, karta 3 „Anil Seth: řízená halucinace“: Podle teorie prediktivního zpracování mozek neustále odhaduje, co je venku, a smysly ty odhady opravují. Anil Seth tomu říká řízená halucinace: vnímání je nejlepší odhad mozku a svět ho drží pod kontrolou. Ve snu vnější kontrola chybí. Je to teoretický rámec, ne naměřený fakt.

### Výstupy A
1. `technique_art.dart`: nové třídy (A1 + případné nové z A2), jednou větou `///` nad každou.
2. `technique_art_switch.dart`: řádky do `switch (id)` a do `ids`.
3. `technique_art_copy.json`: `{"texts": {"training": {"art": {…}}}}`.
4. `art_mapping.json`: `{"techniques": {"<techniqueId>": "<artId>"}, "lessonCards": [{"lesson": "<id>", "card": <index>, "art": "<artId>"}]}`.
5. `technique_art_preview.html`: náhled den i noc jako minule (SVG ze stejných `paint()`).
6. `self_check_a.md`.

### Smlouva (beze změny, pro jistotu znovu)
```dart
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../content/content.dart';
import '../../../design/design.dart';
import '../../../design/widgets/paint_utils.dart';

/// Ilustrace principu techniky nebo lekce. Tenké linky, mono popisky, akcent jen pro to podstatné.
/// Ve dne se jemně hýbe (sdílené hodiny), v noci a v testech stojí.
class TrainingArt extends ConsumerWidget {
  const TrainingArt(this.id, {super.key, this.height});

  final String? id;

  /// Výška plochy; výchozí 176 (strom testů reality 210).
  final double? height;

  static const ids = [
    'hypnogram',
    'mildLoop',
    'ssild',
    'wildBridge',
    'forgetting',
    'realityTree',
    'body',
    'breath',
    'ladder',
    'dreamSignGrid',
    'fadingTrace',
    'brainMap',
    'remRebound',
    'loopRoom',
    'rewriteScript',
    'seedMoon',
    'cueWave',
    'timeline',
    'eyeSignal',
    'chronoDial',
    'twoHypnograms',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final copy = ref.watch(contentProvider).valueOrNull?.copy;
    final id = this.id;
    if (id == null || copy == null || !ids.contains(id)) return const SizedBox.shrink();
    final skin = AppSkin.of(context);
    final clock = DesignMotion.clock(context);
    String l(String k) => copy.text('training.art.$id.$k');
    final painter = switch (id) {
      'hypnogram' => _Hypnogram(skin, l, clock),
      'mildLoop' => _MildLoop(skin, l, clock),
      'ssild' => _Ssild(skin, l, clock),
      'wildBridge' => _WildBridge(skin, l, clock),
      'forgetting' => _Forgetting(skin, l, clock),
      'realityTree' => _RealityTree(skin, l, clock),
      'body' => _Body(skin, l, clock),
      'breath' => _Breath(skin, l, clock),
      'dreamSignGrid' => _DreamSignGrid(skin, l, clock),
      'fadingTrace' => _FadingTrace(skin, l, clock),
      'brainMap' => _BrainMap(skin, l, clock),
      'remRebound' => _RemRebound(skin, l, clock),
      'loopRoom' => _LoopRoom(skin, l, clock),
      'rewriteScript' => _RewriteScript(skin, l, clock),
      'seedMoon' => _SeedMoon(skin, l, clock),
      'cueWave' => _CueWave(skin, l, clock),
      'timeline' => _Timeline(skin, l, clock),
      'eyeSignal' => _EyeSignal(skin, l, clock),
      'chronoDial' => _ChronoDial(skin, l, clock),
      'twoHypnograms' => _TwoHypnograms(skin, l, clock),
      _ => _Ladder(skin, l, clock),
    };
    return ExcludeSemantics(
      child: SizedBox(
        width: double.infinity,
        height: height ?? (id == 'realityTree' ? 210 : 176),
        child: CustomPaint(painter: painter),
      ),
    );
  }
}

abstract class _Art extends CustomPainter {
  _Art(this.skin, this.l, this.clock) : super(repaint: clock);

  final AppSkin skin;
  final String Function(String) l;
  final ValueListenable<double>? clock;

  /// Sekundy animace; bez hodin 0 a [live] false (statický obraz).
  double get t => clock?.value ?? 0;
  bool get live => clock != null;

  Paint stroke(Color c, [double w = 1.2]) => Paint()
    ..color = c
    ..style = PaintingStyle.stroke
    ..strokeWidth = w
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  Paint fill(Color c) => Paint()..color = c;

  TextStyle mono({Color? color, double size = 9.5, FontWeight weight = FontWeight.w500}) =>
      skin.mono(size: size, color: color ?? skin.muted, weight: weight, tracking: 0.06);

  void label(Canvas c, String key, Offset at, {double align = 0, Color? color, double size = 9.5}) =>
      paintText(c, l(key), mono(color: color, size: size), at, align: align);

  /// Šipka: hrot v [tip], směr [dir] (jednotkový).
  void arrowHead(Canvas c, Offset tip, Offset dir, Paint p, [double len = 6]) {
    for (final a in [2.6, -2.6]) {
      final r = Offset(dir.dx * math.cos(a) - dir.dy * math.sin(a), dir.dx * math.sin(a) + dir.dy * math.cos(a));
      c.drawLine(tip, tip + r * len, p);
    }
  }

  @override
  bool shouldRepaint(covariant _Art old) => old.skin != skin || old.clock != clock;
}

/// Hypnogram jedné noci: cykly, REM přibývá k ránu, šipka WBTB po ~5 h.
class _Hypnogram extends _Art {
  _Hypnogram(super.skin, super.l, super.clock);

  /// (minuta od usnutí, úroveň) 0 bdění, 1 REM, 2 lehký, 3 hluboký. Ilustrativní noc, ne data.
  static const _night = [
    (0, 0), (8, 2), (25, 3), (65, 2), (80, 1), (92, 2), (110, 3), (145, 2), (165, 1), (185, 2), //
    (205, 3), (222, 2), (245, 1), (275, 2), (295, 0), (305, 2), (318, 1), (360, 2), (375, 1), //
    (425, 2), (440, 1), (470, 0),
  ];
  static const _end = 480;

  int _levelAt(double m) => _night.lastWhere((s) => s.$1 <= m).$2;

  @override
  void paint(Canvas c, Size s) {
    const left = 62.0, top = 30.0;
    final right = s.width - 10, bottom = s.height - 24;
    double x(num m) => left + (right - left) * m / _end;
    double y(int lv) => top + (bottom - top) * lv / 3;

    const keys = ['awake', 'rem', 'light', 'deep'];
    for (var lv = 0; lv < 4; lv++) {
      c.drawLine(Offset(left, y(lv)), Offset(right, y(lv)), stroke(skin.line, 1));
      label(c, keys[lv], Offset(0, y(lv)), color: lv == 1 ? skin.accentText : skin.muted);
    }
    for (var hr = 0; hr <= 8; hr += 2) {
```
```dart
  });

  final Brightness brightness;

  /// Pozadí obrazovky.
  final Color bg;

  /// Karty a panely.
  final Color panel;

  /// Druhá plocha (stopy grafů, přepínače).
  final Color panelAlt;

  /// Linky a rámečky.
  final Color line;

  /// Výraznější linka: lem karet, rohové značky, mřížka ve stupních.
  final Color lineStrong;
  final Color text;

  /// Popisky, osy.
  final Color muted;

  /// Nejtlumenější text: neaktivní, zamčené, vedlejší údaje.
  final Color faint;

  /// Signál: hlavní akce a nejdůležitější číslo / REM v grafech.
  final Color accent;

  /// Akcent použitý jako barva textu (kontrastní varianta).
  final Color accentText;

  /// Text na ploše v barvě [accent].
  final Color onAccent;

  /// Noční režim: jen červená, žádné plné světlé plochy ani záblesky.
  final bool redOnly;

  /// Násobek tloušťky čar symbolu.
  final double symbolWeight;
  final String displayFont;
  final String bodyFont;
  final String monoFont;

  static AppSkin of(BuildContext context) => Theme.of(context).extension<AppSkin>()!;

  /// Titulky a velká čísla. [tracking] je v em (−4,5 % = těsný grotesk).
  TextStyle display({
    double size = 28,
    FontWeight weight = FontWeight.w800,
    Color? color,
    double tracking = -0.045,
  }) =>
      DesignFonts.style(displayFont,
                    size: size,
          weight: weight,
          color: color ?? text,
          letterSpacing: size * tracking,
          wordSpacing: size * 0.07, // těsný tracking by jinak slepil slova
          height: 1.05);

  TextStyle body({double size = 16, FontWeight weight = FontWeight.w400, Color? color, double height = 1.45}) =>
      DesignFonts.style(bodyFont, size: size, weight: weight, color: color ?? text, height: height);

  /// Telemetrie, časy, štítky. [tracking] v em.
  TextStyle mono({double size = 11, FontWeight weight = FontWeight.w500, Color? color, double tracking = 0.08}) =>
      DesignFonts.style(monoFont,
          size: size, weight: weight, color: color ?? muted, letterSpacing: size * tracking, height: 1.3);

  @override
```
Vzor:
```dart
class _Forgetting extends _Art {
  _Forgetting(super.skin, super.l, super.clock);

  @override
  void paint(Canvas c, Size s) {
    const left = 30.0, top = 30.0;
    final right = s.width - 12, bottom = s.height - 30;
    double x(double m) => left + (right - left) * m / 10;
    double y(double f) => bottom - (bottom - top) * f;
    double recall(double m) => 0.12 + 0.88 * math.exp(-m / 1.8);

    c.drawRect(Rect.fromLTRB(x(0), top, x(1), bottom), fill(skin.accent.withValues(alpha: 0.12)));
    label(c, 'write', Offset(x(0) + 4, top + 8), color: skin.accentText);

    c.drawLine(Offset(left, top - 6), Offset(left, bottom), stroke(skin.lineStrong, 1));
    c.drawLine(Offset(left, bottom), Offset(right, bottom), stroke(skin.lineStrong, 1));
    label(c, 'axisY', const Offset(0, 10));
    label(c, 'caption', Offset(s.width, 10), align: 1, color: skin.faint, size: 8.5);
    for (final m in [0, 5, 10]) {
      paintText(c, '$m', mono(size: 9), Offset(x(m.toDouble()), bottom + 10), align: 0.5);
    }
    label(c, 'axisX', Offset((left + right) / 2, s.height - 7), align: 0.5);

    final p = Path()..moveTo(x(0), y(recall(0)));
    for (var i = 1; i <= 50; i++) {
      p.lineTo(x(i / 5), y(recall(i / 5)));
    }
    c.drawPath(p, stroke(skin.accentText, 2));
    final m = live ? (t / 2) % 10 : 0.6;
    c.drawCircle(Offset(x(m), y(recall(m))), 3.5, fill(skin.text));
  }
}
```

---

## B) Osobní laboratoř: experimenty N-of-1 (tvoje funkce č. 4 z `inovace.md`)

Vycházej ze své specifikace TOP 4 v `inovace.md`. Já pak postavím obrazovky, ty dodej obsah a výpočet jako čistý Dart bez Flutteru.

### B1. `experiments.json`: 10–12 šablon experimentů
Jedna šablona je jedna otázka typu „pomáhá mi X?“. Příklady: Záměr poznat sen (MILD) večer vs. jen deník, Střídání smyslů (SSILD) vs. Záměr poznat sen (MILD) při ranním probuzení, 3 vs. 6 testů reality denně, inkubace tématu vs. bez, kofein po 14:00 ano/ne pro vybavování, zápis hned hlasem vs. psaním, jóga snu před spaním vs. bez.

Schéma:
```json
{"experiments":[{"id":"mildVsJournal","title":"…","question":"…","techniqueIds":["mild"],"evidence":"strong|promising|community|tradition",
  "arms":[{"id":"A","label":"…","instruction":"…"},{"id":"B","label":"…","instruction":"…"}],
  "design":"alternating|randomBlocks","nights":14,"minNightsPerArm":5,
  "outcomes":["lucid","recall","vividness"],"primary":"recall",
  "safety":"…","why":"1–2 věty a zdroj (autor, rok)"}]}
```
- `outcomes` vybírej z `lucid` (ano/ne za noc), `recall` (počet snů za noc, 0 = nic), `vividness` (0–10), `lucidity` (0–10), `sleepFeeling` (pocit ze spánku 0–10).
- Platí naše pravidla:
  - WBTB nejvýš 2× týdně, nikdy dvě noci po sobě, jen po dobré noci, ne v prvních 14 dnech programu;
  - žádné série ani tresty;
  - nedoporučovat galantamin ani doplňky;
  - spánek má přednost.

  Experiment, který by porušil pravidla WBTB, nenavrhuj.
- Texty česky, tykání, technika českým názvem a zkratka druhotně, bez dlouhé pomlčky.

### B2. `nof1.dart`: výpočet (čistý Dart 3.6, jen `dart:math`)
Vstup:
```dart
class Nof1Night { final DateTime night; final String arm; final bool? lucid; final int? recall; final int? vividness; final int? lucidity; final int? sleepFeeling; }
```
Výstup: pro každý výsledek odhad efektu B oproti A s mírou nejistoty a **slovní verdikt**. Navrhni sám, doporučuji:
- `lucid`: Beta-Binomial (slabý prior Beta(1,1), nebo podle populační četnosti z rešerše; zdůvodni), P(B > A) Monte Carlo s pevným seedem nebo analyticky.
- 0–10 a počty: robustně (např. bayesovský t-model nebo bootstrap s pevným seedem), rozdíl průměrů a interval.
- Ošetření malého vzorku, chybějících nocí a trendu v čase (učení se, které by zkreslilo pořadí A→B). Proto `alternating` nebo `randomBlocks` a vysvětli proč.
- Verdikty: `tooEarly` (málo nocí), `noDifference`, `leanA`, `leanB`, `clearA`, `clearB` s prahy, které zdůvodníš. Appka **nesmí ukazovat procenta jistoty bez kalibrace** (naše pravidlo), takže čísla jen v detailu a s vysvětlením, verdikt slovy.
- Plánovač rozpisu nocí: `List<String> schedule(String design, int nights, int seed)` (které rameno kterou noc).
- K tomu `nof1_test.dart` (package:test): aspoň 15 testů včetně simulace, kdy B je opravdu lepší a kdy není, a kontroly falešně pozitivních verdiktů na 14 nocích. Spusť je a výsledek dej do `self_check_b.md`.

### B3. `laborator_texty.json`
Texty UI pod klíčem `lab` (`{"texts":{"lab":{…}}}`): název sekce, úvod (co je N-of-1 a proč to dává smysl, 2–3 věty), popisky verdiktů (krátký titulek + 1 věta), varování „jedna osoba, malý vzorek“, výzva po skončení experimentu.

Kvalita má přednost před rychlostí. Díky!
