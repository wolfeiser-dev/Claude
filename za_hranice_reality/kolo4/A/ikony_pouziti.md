# Nové ikony v appce: kde se hodí

Deset nových hodnot `MissionGlyph` z `mission_icons_new.dart`. Níže je 20 míst. Velikosti podle `ikony.svg.md`: 24 px v seznamech a navigaci, 20 px v textu a štítcích, 48 px v prázdných stavech a na kartách lekcí.

Akcent nech zapnutý (`accent: true`) jen u prvku, který je na řádku nejdůležitější nebo právě vybraný. U neaktivních štítků a v hustých seznamech použij `accent: false` s tlumenou barvou, ať oranžová v obrazovce nesvítí na deseti místech naráz.

## Místa

| # | Obrazovka | Prvek | Ikona | Velikost | Poznámka |
|---|---|---|---|---|---|
| 1 | Dnes | Řádek „Plán na dnešek“: večerní záměr na noc | `intention` | 24 | Akcent zapnutý, dokud záměr není zapsaný. |
| 2 | Dnes | Řádek s časem připomínky nebo budíku na dnešní noc | `alarm` | 24 | Jen čas a připomínka. Samotná technika Probuzení a návrat do spánku (WBTB) dál nese `wbtb`. |
| 3 | Dnes | Karta „Lekce na dnes“ | `lesson` | 24 | Na kartě s ilustrací stačí jako malý štítek v rohu. |
| 4 | Deník, ranní zápis | Pole „Jak ses ve snu cítil“ (volba emoce) | `emotion` | 24 | Akcent po vyplnění vypnout, pole je hotové. |
| 5 | Deník, ranní zápis | Přepínač „Věděl jsem, že sním“ | `lucidity` | 24 | Akcent jen ve stavu zapnuto. |
| 6 | Deník, ranní zápis | Štítek „Noční můra“ | `nightmare` | 20 | Po zapnutí nabídnout odkaz na přepis snu (místo 15). |
| 7 | Deník, ranní zápis | Štítek „Falešné probuzení“ | `falseAwakening` | 20 | Hodí se i jako podnět: falešné probuzení je dobrá chvíle na test reality. |
| 8 | Deník, detail snu | Řádek vlastností snu pod nadpisem (lucidní, noční můra, falešné probuzení, emoce) | `lucidity`, `nightmare`, `falseAwakening`, `emotion` | 20 | Bez akcentu, akcent jen u lucidity, pokud je sen lucidní. |
| 9 | Deník, Stopy snů | Přepínač zobrazení „Seznam / Mapa“, položka Mapa (souvislosti motivů) | `starMap` | 24 | Pro jednotlivé spojení dvou motivů nech `constellation`, `starMap` jen pro celou mapu. |
| 10 | Deník, Stopy snů | Filtr motivů podle emoce | `emotion` | 20 | V řadě filtrů bez akcentu, akcent jen u aktivního filtru. |
| 11 | Deník, Stopy snů | Prázdný stav mapy („Zatím málo snů na mapu“) | `starMap` | 48 | Velká ikona, tlumená barva, akcent zapnutý. |
| 12 | Realita | Záložka nebo sekce podnětů „Z čeho je skutečnost“ (otázky a pozorování místo testů) | `realityExplore` | 24 | Testy reality dál nesou `realityTest`; obě ikony mohou stát vedle sebe, tvarem se neperou. |
| 13 | Realita | Řádek „Připomínky testů během dne“ | `alarm` | 24 | Stejný význam jako v Nastavení (místo 20). |
| 14 | Výcvik, techniky | Hlavička skupiny jóga snu (dreamYogaBreath, dreamYogaDay, dreamYogaRelease, dreamYogaIntention, dreamYogaSleep) | `dreamYoga` | 24 | Pokud `yoga` už jógu snu znamená, použij tu `yoga` a `dreamYoga` vůbec nepřidávej. |
| 15 | Výcvik, techniky | Technika přepisu noční můry (`irt`) a technika „Co dělat, když víš, že sníš“ (`lucidMission`) v seznamu | `nightmare`, `lucidity` | 24 | Jen jako ikona řádku; ilustrace techniky z kola 3 zůstávají. |
| 16 | Výcvik, lekce | Ikona řádku lekce v seznamu a prázdný stav „Žádná rozečtená lekce“ | `lesson` | 24 / 48 | Pokud `book` už lekce označuje, nech `book` v seznamu a `lesson` jen pro novou nebo doporučenou lekci. |
| 17 | Výcvik, program | Den programu s večerním záměrem (Záměr poznat sen (MILD), inkubace tématu) | `intention` | 24 | Akcent u dnešního dne programu, ostatní dny bez akcentu. |
| 18 | Výcvik, laboratoř | Ikona měřené veličiny v šabloně a výsledku: lucidní sny, noční můry, emoční tón snu | `lucidity`, `nightmare`, `emotion` | 20 | Pomůže rychle rozlišit, co experiment měří. |
| 19 | Spánek | Značky snů na časové ose noci (lucidní sen, noční můra, falešné probuzení) | `lucidity`, `nightmare`, `falseAwakening` | 20 | V noční paletě jen tyto tři, ať graf zůstane čitelný; REM okna mají vlastní barvu. |
| 20 | Nastavení | Řádek „Připomínky a budík“ | `alarm` | 24 | V Nastavení bez akcentu. |

## Na co si dát pozor

- **`alarm` a `wbtb` nedávej do jednoho seznamu.** Obě mají ciferník a zvonky. `alarm` je čas a připomínka, `wbtb` je technika.
- **`lucidity` a `eye`:** `lucidity` je zavřené oko (spíš a víš to), `eye` otevřené (pozornost). Na 20 px je rozdíl dobře vidět, zavřené oko má řasy a hvězdu nad sebou.
- **Hvězda jako akcent:** nese ji `intention`, `lesson`, `starMap`, `lucidity` a `realityExplore`. Vedle sebe na jednom řádku nech akcent jen u jedné z nich.
- **Noční paleta:** linka #B3261E, akcent #FF3B2F (zdůvodnění v `ikony_preview.html`). V noci nepoužívej velké 48px prázdné stavy s akcentem, jen 24 a 20 px.
