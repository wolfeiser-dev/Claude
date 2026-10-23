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
