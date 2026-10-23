# k5: věcné pochybnosti (reflections.json, experiments.json, safety.json)

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
