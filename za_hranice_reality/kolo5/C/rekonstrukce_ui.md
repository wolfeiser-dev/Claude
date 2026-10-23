# Rekonstrukce noci: zásady UI

Texty jsou v `rekonstrukce_texty.json` pod `reconstruction.*`. Otázky skládá `reconstructNight(...)`.

1. **Kdy nabídnout.** Nabídka přichází jen ve dvou chvílích ranního zápisu:
   - hned po klepnutí na „Nic si nevybavuju“ (`offer.afterEmpty`),
   - po uložení prvního snu toho rána (`offer.afterFirst`).

   Nabízej ji jen tehdy, když `reconstructNight` něco vrátí, a jen do dvou hodin po probuzení. Odpoledne už ne, vzpomínky slábnou a roste riziko domýšlení. Upozornění „Noc je nahraná“ smí přijít nejvýš jednou denně. Po dalších snech toho rána se nabídka neopakuje.

2. **Jak dlouho.** Nejvýš 4 okna (`max = 4`), od posledního k prvnímu. U každého okna se nejdřív ukáže jen hlavní otázka. Doplňující otázky (`followUpKeys`, nejvýš 5) přijdou, až když člověk něco odpoví. Po „Nic“ se jde rovnou na další okno.

   Po dvou minutách se ukáže `flow.timeUp` a po třech minutách průvodce sám skončí. Tlačítka „Přeskočit“ a „Skončit“ jsou vidět na každé obrazovce. Konec průvodce (`done.*`) jen shrne počet snů, nic nehodnotí.

3. **Jak neotravovat.**
   - „Teď ne“ znamená, že se dnes appka už nezeptá.
   - Po třech nabídkách po sobě, které člověk odmítl nebo nechal bez odezvy, se průvodce nabízí nejvýš jednou týdně.
   - „Už nenabízet“ nabídku vypne úplně. Průvodce pak zůstane jen v Deníku › Mapa noci.
   - Žádné série, žádné připomínání a žádné výčitky. Prázdná noc je platný výsledek.

4. **Otázky jen obecné.** Nikdy nenabízej motivy ze Stop snů ani z minulých snů, a to ani jako našeptávač. Ke každé odpovědi patří volba „Jistě“ nebo „Možná“. Čas je vždy odhad po 10 minutách se štítkem `label.estimate` („ODHAD“), nikdy s procenty. Při prvním použití ukaž `flow.firstUse`.

5. **Noční červený režim** (probuzení v noci, budík WBTB, otevření appky v noci):
   - `wake` je „teď“ a `max = 1`, takže jde jen o poslední okno před probuzením,
   - jen čistá černá a `#FF3B2F` pro text a hlavní akci, `#5A120D` pro linky, bez bílých a oranžových ploch, bez karet a bez animací, jas minimální,
   - jedna otázka na obrazovku, velkým písmem (`night.ask` nebo `night.continue`, nejvýš 6 slov), bez doplňujících otázek a bez štítků oken,
   - hlavní akce je hlas (`night.voice`): diktát nebo nahrávka se zavřenýma očima, druhá akce `night.sleep`,
   - bez zvuku a bez vibrace. Když člověk 20 vteřin nic neudělá, obrazovka zhasne a rozepsaný záznam se uloží.

6. **Rod oslovení.** Výchozí znění je neutrální („se ti nejspíš něco zdálo“). Mužský nebo ženský tvar (`gender`) použij jen tehdy, když si ho člověk sám zvolí v profilu. Nikdy ho neodhaduj ze jména.

7. **Soukromí.** Odpovědi, časy snů i jejich přiřazení k oknům zůstávají v telefonu (`flow.privacy`) a REM profil zpřesňují jen tam. Diktát se řídí nastavením diktátu. V nočním režimu doporuč offline češtinu, ať nic neodchází na internet. Když člověk smaže sen, smaže se i jeho přiřazení k oknu.
