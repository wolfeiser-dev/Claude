# Share l2: lucidityAxes, paralysisWave, postureVariants, butterfly, predictionLoop

Five new illustrations for older lesson cards that no existing art fits. All `extends _Art`, height 176, widths 320–430,
day and night (`redOnly`), skin colors only. Classes: `l2_classes.dart`; texts: `l2_copy.json` (`training.art.<id>.<key>`);
switch lines and card mapping: `l2_switch.txt`; static SVG and PNG@2x at 358 px in `svg/` and `png/`.

## Verification

Harness (scratchpad, not committed): `/tmp/claude-0/-home-user-Claude/fb27821a-f9d3-5107-a9ec-c3500a6837d8/scratchpad/kolo3_l2/`,
a copy of `kolo3_base` (AppSkin day/night, `paintText`, `_Art` from the brief, real `AppSkin.mono` with
`letterSpacing: size * tracking`, `height: 1.3`). `sync.sh` wraps `l2_classes.dart` unchanged as a part file.

- Flutter 3.27.4 / Dart 3.6.2. `flutter analyze`: **No issues found** (flutter_lints + `curly_braces_in_flow_control_structures`,
  `prefer_const_constructors`, `prefer_final_locals`, `avoid_redundant_argument_values`, `unnecessary_parenthesis`,
  strict casts / raw types). The base harness's own braceless `if` in `paintText` was fixed in my copy.
- `brace_fix.py --check`: 0 braceless bodies.
- `flutter test`: 6/6 pass. Per id, both skins, widths 320 / 358 / 390 / 430, static and t = 0 … 39.6 s (step 0.9):
  1. vector (recording canvas): every op inside the canvas; every label inside; labels do not overlap (1.5 px margin);
     no stroke, dot or opaque fill crosses a label box (harness B rule);
  2. pixels: rendered with a 24 px margin, 0 px outside the canvas; pixel ink under labels: **0 warnings**;
  3. colors: every paint and text color is a skin color, no shaders, area fills alpha ≤ 0.2, stroke widths 0.8–2 px;
  4. copy: all keys used, no missing or unused keys, uppercase, 1–3 words, no em dash.
- SVGs come from the same `paint()` via a recording canvas (paths sampled every 0.25 px, RDP 0.04 px), width 358, static.
- Visual review: contact sheets (4 widths static + 2 live frames) day and night, about three rounds of fixes.

## What each one shows

- **lucidityAxes** (notControl 0, also 2): three separate tracks LUCIDITA / STABILITA / KONTROLA with hints (VÍŠ, ŽE SNÍŠ /
  SEN SE DRŽÍ / MĚNÍŠ DĚJ), ticks, MÁLO … HODNĚ. One dream = one point per axis joined by a dashed accent line (JEDEN SEN):
  lucidity high (accent), stability mid with a band it wobbles in (live), control low. End icons: eye, spirit level, fork.
  Caption SCHÉMA. For card 2 it reads as "control stays low, lucidity holds"; no failure scene is drawn.
- **paralysisWave** (sleepParalysis 1–2, optionally 3): supine body seen from above on a mattress and pillow, adult proportions
  (head ≈ 1/7.5 of height, shoulders ≈ 0.23, arms along the body palms up with five fingers, thumb lateral, knees, feet falling
  outward). Accent = what still works in REM atonia: eyes open with irises moving (OČI SE HÝBOU), the diaphragm (two domes,
  the right one higher over the liver, moving caudally on a 6 s slow breath, POMALU DÝCHEJ), awareness glow at the head
  (MYSL BDÍ), and the left little finger with motion arcs (POHNI MALÍČKEM). Lungs (right three-lobed outline, left with cardiac
  notch) and heart are faint. Below: an episode curve, quick onset and slow fade, along a time axis (SEKUNDY AŽ MINUTY, MINE),
  caption SCHÉMA. Calm, no figure or threat.
- **postureVariants** (yogaNight 1): three rows, name + side + image text on the left, figure on the right, all side-lying, seen
  from the front, on a pillow. WANGYAL: right side (text: MUŽI PRAVÝ BOK, ŽENY LEVÝ BOK), red lotus with "A" at the throat.
  NORBU: left side (head to the right, ZPOČÁTKU LEVÝ BOK), white "A" at the heart (ring, `text`) and red "A" at the throat
  (filled accent dot; in night mode the two still differ by ring vs dot). KAGJÜ: lion posture on the right side: right
  forearm in front of the chest with the palm under the right cheek, left arm along the flank with the hand on the thigh, legs
  stacked. Bottom row: JINÉ TEXTY + small face with light between the eyebrows, SVĚTLO MEZI OBOČÍM, and NETESTOVÁNO.
  Only what the card states. The Wangyal and Norbu figures leave the lower arm out (hidden under the pillow) on purpose, because
  the card names only the side for them, not the arm position.
- **butterfly** (reality 0): a figure-eight loop in accent with arrows both ways. Left lobe: Zhuang Zhou asleep on his back,
  profile face up, closed eye, ear, topknot with hairpin, hard rectangular pillow under the head, neck going into chest and
  back. Right lobe: a butterfly seen from above. Clubbed antennae (butterfly, not moth), head, thorax, segmented abdomen,
  forewings with a discal cell and 11 veins (Sc, R1–R4, M1–M3, Cu1–Cu2, 2A), hindwings with a cell and 8 veins. The veins snap to
  the wing margin. A dashed, slightly wavering vertical boundary runs through the crossing, from KDO KOHO SNÍ down to
  PROMĚNA VĚCÍ. Live: dot travels the loop, wings flap slightly, boundary sways.
- **predictionLoop** (reality 3): two rows. BDĚNÍ: brain in lateral profile (same outline as brainMap: frontal pole to the
  right, Sylvian, central and superior temporal sulci, cerebellum, brainstem). PREDIKCE arc (accent) goes to an open eye
  (SMYSLY), CHYBA PREDIKCE comes back to the brain, and light rays from a tree (SVĚT) feed the eye. SEN: the prediction loops
  back into the brain by itself (BEZ OPRAVY), the eye is closed, the world is faint and the input is cut with ×
  (BEZ VSTUPU). Caption TEORIE, NE FAKT.

## Sources for anatomy and content

- REM atonia spares the extraocular muscles and the diaphragm, so in sleep paralysis eyes and breathing work. Episodes last
  seconds to minutes and always end. The tips (slow breathing, moving a small body part such as the little finger) come
  from card 2.
- Proportions: standard adult proportions (about 7.5 heads), biacromial breadth about 0.23 of height, hand breadth about 0.05.
  Supine plan view: the person's right side is at the top of the image (head left), so the heart sits slightly below the
  midline and the right diaphragm dome is higher.
- Side-lying front view: with the head on the left, the person lies on the right side. The figure is mirrored for Norbu's
  left side.
- Butterfly venation: simplified nymphalid/pierid pattern (Comstock–Needham names).
- Predictive processing / "controlled hallucination" (Anil Seth): drawn as a framework, labelled TEORIE, NE FAKT.

## Limits / uncertain

- postureVariants: figures are about 150 px long, so face details are 2–3 px. In the front view, the slight knee bend points
  toward the viewer and is not visible; the legs are drawn nearly straight and stacked. The lotus is about 7 px, recognisable
  but schematic. The "A" is a Latin A (the font has no Tibetan glyph).
- paralysisWave: the episode curve is a picture of "comes and goes", not measured data (SCHÉMA). Card 3's warning signs
  (daytime sleep attacks, cataplexy) are not drawn. The illustration works there only as a general image.
- lucidityAxes: the values (0.86 / 0.52 / 0.2) are illustrative.
